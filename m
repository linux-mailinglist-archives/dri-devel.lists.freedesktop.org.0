Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN4WK1OmemnF8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A65AA22D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969010E782;
	Thu, 29 Jan 2026 00:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwNuhMGq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ebq7ziB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF1C10E782
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SN2Ofa1084594
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXo
 q3terDfY=; b=cwNuhMGqGY/GJsGjgp2ZHUINKl8KeinNXvnQVb67zVpri72x46B
 TCTmFQC0JbqzriCBk6ueFwFt7w60rHrbsBPQdT1O6bJKMD+gYbrJ1Y/ziSG/0cv/
 oSrNzg1/DHYH5/cRxj0Vw35CaGocHdUqkRQTt/YZa6CKpo68NQaEpH57Y3MCl/sQ
 GJdVxKMyYNAaTfCzVvFErrS8DAEFJ4W2NhkCCMbGVe6RIJodJunmhhpahoWJXd5P
 nwrSXXPlpY/SE3DLs0Qm3rijeR9njLk42OhQ7oqFJyQ7Ui394qT+UFc3EkFYZin6
 z0k4gC/IuxXFLHM8fF9A5GHqfyotflDvCmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfg4x3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0e952f153so8377355ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769645647; x=1770250447;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXoq3terDfY=;
 b=Ebq7ziB4rpTaAi+aKGlZIOiDsncPMi/AXwnyvnpfgNZBziLhFsXeuMDP8QqcS/MKeY
 buh/yJThW9VvyQCHw5XKZYGb3iVu6BbaZ6YHdyZpkp7n8SgvQ8kMTgO4tsUneNVppSY0
 6MiR4iOcjJMoZzGKWWOHfl5LgVTrc/b6Cv63YdiJikpzHq6uHVHv8Y8/vp7w78nLE7pK
 TnUaav/CI0SrFwF76Uxw5gajZgGDURM8sKQFaeBvkOkoCOdJocSXq1h17wElDg0y7ibG
 h/yc9gKEh1ru/0kYlm8t3FhJbfeMYcSTv/AzJ2lpMgPulPRRNXQxzUn92H2NFOhrbnEw
 Y4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769645647; x=1770250447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7ZbvXfVh3WelDqPIwf+xkJ78SnEOLn5jXoq3terDfY=;
 b=nWuNu0P3LVtaZybl5eiWIosr5y86ySp9rb44q31rjktAGunjCr6d9Fm9IVs32M4biM
 LXiDSU3cpGiDhH1/0uOFA2DCwKkxdpy1XMJLUPKTWOqupQd86ydTfQ0GHlX/A7Nh4cOi
 X1q+Im3r4j3fYNyo+cFFr+StPE4A/cywOL7OyFxg9cZ1lrM7TvNaLy4YQAT2vsuYl+Ek
 UcDvo1NDy8qnCAWKDH457SyP2MobVJToSAXMAUwnbWcMXmeX215O8IO2sbWy9qjTcJuH
 hWLXyX9sk2ewHDzPeR/222y9c/gyWwwS8XFzJEK4nDewxKSTU/KBZkZq9KSDr6YuQWwc
 zi6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHqnsQ0dKRS4ms1CZjA77f37olskmDtVLAMI0QghWINC6gBW1nYXKi1AvrxwDpTAX4Uh2L/uqCusM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlEBWKsuZ3cvyPNTAwWm2MO6oyqzw925aoqYzuaslpXAtF/UHo
 VS9f6OEo4L9fb/e30QunXG6QCLoiyjCiL6Hoatd547yGILgBXttaFHod0DFqnBEzJRohVJW5kxU
 /tUUUoQvKsDaGbRj+l1+Ddr+gml3g6ibVkSLS1RlyFg9yK0BFlaejR3e954NpaM9lUi4RKmA=
X-Gm-Gg: AZuq6aLreylqCR2+a6ZVEErumxBCutw2Hn4UueAUBn7n03X95vpOoVjRWt9yKNoDQxZ
 hmN8panBJK4hc10DM6MkwpMmWyX/AOD9Di92/Jpjo0jShheocVOdEsdwXNTEGBWm0pFm6+HE0J0
 MevqrP3CSOMVEhZ74tC8DrUGIPwP5KIYEwiRxylQWZf3qwq/w8JYRWiaa4nHAzbKroycfc3QL+z
 CThRJPc9PyiliRUecUvZ06xBtFKGHCo2V4lVGZeC3wuzVY3JhJYf6UkbvjJCov4NOjXRW8whjk8
 BrY0VsD7S94PDOIy15K0lbUs6Y9U6csyUryHL4dDeNu/S7HicvC1WXVv3oS+4cEqfkfgHlTCOIx
 RuwzkcMHWHHNsMToYYgd0yv/dcoUioCcqPGp/U1vGiKluAHOEq2fGd/n4nFQflPKiZfL1DW3H9S
 JZXB+fF+E2r+lF2QS15zzKq/0W
X-Received: by 2002:a17:903:388e:b0:2a0:b02b:210c with SMTP id
 d9443c01a7336-2a870d7a04fmr67566655ad.1.1769645647060; 
 Wed, 28 Jan 2026 16:14:07 -0800 (PST)
X-Received: by 2002:a17:903:388e:b0:2a0:b02b:210c with SMTP id
 d9443c01a7336-2a870d7a04fmr67566345ad.1.1769645646637; 
 Wed, 28 Jan 2026 16:14:06 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:14:06 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Thu, 29 Jan 2026 05:43:53 +0530
Message-Id: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Oslc_ekIHm_63N7KVpSRUvRk-KtPWyt-
X-Proofpoint-GUID: Oslc_ekIHm_63N7KVpSRUvRk-KtPWyt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX05h+4xvQwPXq
 9ySaez/tctwY/oImVSYBIHkvjP9e4CNLh+bBnzb9EvzPHA9CaeCtRUbAeiBWlrzBlXyFUgQPnFN
 8gTeEqnD7XCpOUTY3MlnzkGYjhFIjA/d5OT1AXOoA8K/Iy9z9LxgJ4uNxh7tl4vxiXX0MJJ7K3a
 G+I9NoZB07Aetaz4o6qfXYWBQTsXYCpyCu/pxVhYTRgVmYba+5xO+iN1lFKPJk16X/TI7OhKqQv
 q2trueehYwkJIk8UZ173EZlEeSwEbupFxk/UOokFW8hJV5PYEqL5xX/DGjVmyb185y1MeNUWSDn
 9GWn+Ku3Alaz94LLNh0nkYSN8FMPxBTwJz/EKmLEt57LPMjBifWGri44XNFuNUgcMrwGVGxE8Q1
 aw0FUWUC4f5uMtq32OU/WAsSxsn5XCC5XZv2nhnf5zvFKRXqs9g91FXhNUGRzNuJ9P32X2wWDnF
 fplgyg7vBvncqiEk4xQ==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697aa64f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BUIj0kJwqj0R3t6dFBUA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,quicinc.com:email]
X-Rspamd-Queue-Id: 24A65AA22D
X-Rspamd-Action: no action

From: Sibi Sankar <quic_sibis@quicinc.com>

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Dependencies:
dt-bindings:
1. https://lore.kernel.org/all/20260114-knp-remoteproc-v4-1-fcf0b04d01af@oss.qualcomm.com/
2. https://lore.kernel.org/all/20260114-knp-remoteproc-v4-2-fcf0b04d01af@oss.qualcomm.com/

Base-glymur support:
1. https://lore.kernel.org/lkml/20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com/

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |   4 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  14 +
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 286 ++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)

-- 
2.34.1

