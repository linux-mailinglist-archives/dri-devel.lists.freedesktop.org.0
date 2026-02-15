Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHYAA70OkmlLqAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693C13F5BC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4910E22D;
	Sun, 15 Feb 2026 18:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfWCLCBp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbglYArW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8610E22D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61FFt5pb564166
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+
 N14UTL8I=; b=OfWCLCBphSSxGlPHZ+plPAO4kR8RPabPYceKcdtu1/W/JKBQaHk
 tJne3ElvVYZYu2hSH1AQHTgZml71IWLGMbNHCQyv4aoTSYJ+gB+UyUilKWia7Vom
 x7ywBlIXY//NBnS1nbNUHB54/Abw8gLw2WFh2lOO7eYM5qXVMqb0YuTb/fX45WWk
 j+S7tzAdqy5+WyaDAqg4KRTCZq6FRerTnSg2uZK8IJE+FkTdPxbdgrlwpqJCaKnQ
 LWj6mffSYmLrL2ssRVyxgSKmOIecwJ2RsDjbPO9J5HBRuP84YPeFF5CNJxRMvlss
 w3NdhykSpPZrVjzOC8EgEkFEhR8SZwm97FA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8tj7b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-354e7e705e3so1997142a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771179702; x=1771784502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+N14UTL8I=;
 b=LbglYArW+iMmpH9Otx28Zyl0nBcVJKQqsynEcsnDpAhYZv9tNSt+7TlZbisu3nOnae
 lps6TUeeSC9vGKzBQlrXeg6jj+L/DjbiM/pVP+9lFrxHY7MSCV2odWwiFu+qxxC7lBOY
 Z7BUOIZ5a5g33+th5L/IVdmFFIvY7r9ePPQNzJa5ynwdRpC1yHm2BMsPE23F1U3gXrNC
 qIx2RjHYjfYUBS7NcVnSiKStvdRw2t8LjQQg2xoDxwc1jAs2E3XOv/NmloJ9744Nfqvn
 7BmO0/a0a1/dSEv84OSrUxT6ofTrZ0ve90imn+K5Eu4jvUJVR7ejXW1++62AWnjpebo8
 qSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771179702; x=1771784502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWE7p+bkZNUh9o5AWGIjoFviBM7bxYlch3+N14UTL8I=;
 b=pqiz/snUtOOuO5VPpQoYTbivJe8zmZ1DrqtHv7tzSNWm68yOPsFrbyci5MZwPwHWpI
 z1XqUoVsYbSWj+cESi3BrrOf1IRoUtu1OVezIw+DGwL9t3kbgldJqEeRAMc/GRjlBD7t
 jd0BmtkJB4dcYIf4+bvoGXb3g5Na/PtvbRoBv//ShC4DhH6GN0g3L6xbr5T/c8FFKmeb
 p1NDDeQ12owc0mbG3Gvzw74zXbJEwbs2OeymaKVgpT5/NriAibpop1IbW+gTwtjnOqsO
 Mv14YDfV92W5MhJyP8fxM9JfJFqJe+D1/XgS2bMYDEu6yyynB45yxE3IxnbTHapQIYh1
 I17w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbVkDIUIEWVqj02ldvb8He80EUM0LaF8ESaVWJT0Yh4ycZLl6FcEhBlxvii/gEPpqJWhWF5Q0hiPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXWO1Qr9eSRYyLH5TU1HL7bxmJ5hkCSpPBYSxorrEklwVbCQx4
 se8NYzDnMva8krv+i5ynNrS2JyYm7BXLKyYu/YESP4gJfLTuwY0zvK3gPZMTpNDjyxHFsL9vEFw
 DXDRw6UPOQIYZxc57+lzGdLana/svq4XpYp4w9F4VEzgGvrp23qy+Pct85c/WqAx9SFBTcVv1FI
 Sq+u4=
X-Gm-Gg: AZuq6aKChNPl5iXCWNXNgkj/bZSmeN5tLVPDUDIqSQKoghQwX9xkeOCKc8XkK3PfBVT
 hA/ta85i83byXKwmCh7DJL9KmanH+cVj72pftEm6dqNrjsvkwZJW7kR+/glXlVd/16G6wvcyJk1
 1YVz2seN0PMaKE1wdFzMIh+J78r3k8NvsTquCa8Hx2vADP1eYWxSz/q5l+MqhwnAmyKq1n9LAgb
 3B9A9u7/THV2f59xRU/oamLfycumQoqhrYVBgewgVTA5uWLjWz2eXsUS+2WMZhiA4Hfuv5HxOJY
 +43b5YLSNoVd7IjadXKKWdhIyAnzZnWDcs4qezoNCqK+jGNWf+zMtYdtkjB15NkmZxQInwBlSqq
 9qRFpkXF4DLMH9/yejJK3olOA2AQrPd6MdDfzrZlA4eYrwBeXKDhsrg==
X-Received: by 2002:a17:90b:1812:b0:356:2fee:92c8 with SMTP id
 98e67ed59e1d1-356aad3d59amr7447345a91.17.1771179701794; 
 Sun, 15 Feb 2026 10:21:41 -0800 (PST)
X-Received: by 2002:a17:90b:1812:b0:356:2fee:92c8 with SMTP id
 98e67ed59e1d1-356aad3d59amr7447336a91.17.1771179701350; 
 Sun, 15 Feb 2026 10:21:41 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 10:21:40 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 0/4] misc: fastrpc: Add polling mode support
Date: Sun, 15 Feb 2026 23:51:31 +0530
Message-Id: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfXxQWFME2kgqug
 gym1Iq4FlDPxB5pWs2hs/uIZMa/g02OlAxc8lHnBt3FJtQekr3uwP3VcDvienmzTMyvk0BX9Mdw
 oXFePocHtruB7tBjfeuyD3GXsRwoWohS8CgSlm64ttu01IcoarX+Y2hbSKQUlAcyGiQRc4/Iw/f
 Va2LsLGjsxKo40YvOXywTi/ghyH7EdnhvprNzK5r2/txG1U3czS+wzdVFmmzMsYcW0Q7mbDsT6G
 SfVM+2l+WmhihXqMgjw+/eQE6MuiFOQ6srBPi9LTg9dkEaeFeMWcw2Fc6ljvwvPopwMpc1rvqZp
 oPp9ecGdNA7MmvVltJUtd7EHIBpaWYX95fazeK7KIFDkh1GHj93ps/hUW4oduxUXmt2RdKPypBP
 kEBZGCfsf7r6Yn5ahCRluwyldDZw27Il7rB2Ujy37eT3EC52xbc1b6K+zi9P0BkIv/9gxZJ8rFy
 UbrZKrY5mcuuQNtUhug==
X-Proofpoint-ORIG-GUID: UsziBqOMrrhE2yOdyVBOHdRYHTgrTjmq
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=69920eb6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UsziBqOMrrhE2yOdyVBOHdRYHTgrTjmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150154
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5693C13F5BC
X-Rspamd-Action: no action

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v5]: https://lore.kernel.org/all/20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com/

Changes in v5:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 166 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |  10 +++
 2 files changed, 154 insertions(+), 22 deletions(-)

-- 
2.34.1

