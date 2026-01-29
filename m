Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOeUGV2memnF8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC25AA24C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3D610E78A;
	Thu, 29 Jan 2026 00:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5W45zGS";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUq11GyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE6010E788
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SLpWaD1399064
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uWU8cEg6n+p
 lWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=; b=A5W45zGSoww10EYhuFr121HGhMV
 vyI8E+3Ncg6dGumL9OSSXmZBp8Ok+9KQVP5skj6mQISFUkQ9PItnZVhGnhyBGREi
 6/YqZgulsAoMLMMSdyH5w2XB4dixjjNoAb0i21gGAX9WNRjSv1bP9nZRJ6u9lByt
 Vc+jqyXrDL1KW8+YrDL8iQAhLOAlzGhy7eEVogOPUWqtfEeLFZivNjoBmQ2PMm2P
 OIiGeF3MSD7K0gbrJmrryeEKK1bSSk/xwfzr2ZWGiFpNeylw1C00oYQXPnP6K7Cu
 g+CZkxK90vffsuhq4SZGlfZefVcPGndrah91fBdX3P2dSoMvZTaCVkDAPxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0au1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a377e15716so10069725ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769645656; x=1770250456;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWU8cEg6n+plWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=;
 b=ZUq11GyBnl30101bMeZtHNCE8q7YoVXtqF4JkwhKedakz9k5qnymfKMaUUqaJTc20a
 SKgRwFxjuQxkpThySCpqebybdvYmvhClNQjHxoVnLJhveQe0RBzghhGEhs+ZNKtABl4J
 kQdFQ9pF302vP/1CbSUiL5w/hUBABDLWJI9SiJ5yG6FUSnEMt3X+YwzGOVJj6QM2Wgw8
 EJ4gnJ5j6VcSLg5/8JwpGm28G3N22p7f9upo1kPABNuP52fb2wMi2DMHN+EddSY+0egC
 +bDPc5+kELGrH3oAsVh1zYLzGWGz2WgnfLlutN45BMe1yqVL06YD1w5kmlS92s9wVOSz
 Hz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769645656; x=1770250456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uWU8cEg6n+plWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=;
 b=TJR/bhB2avkJLV6ZtvFciqt2eJWwLULZ9GAomne1UM8e6UV30A6zzQPDssK6LKnW5t
 ow/o/QAyYTwsDyP/bvvAcq+Eiz2dzhfltsk03UzBdwAUBPUyrnyEaUvynXW+NGYSb7rQ
 lkfhaHrf4vH0o2x2PuanCLgKB0/SW0HRZAuCKpXSzlc/60AihmLEQ1IJDox5xKwEgixA
 Wgk7J/HdlBBfk6KGpEV6jjwk5UqWEvZoIWJPOWDcG1vldWkyWM3PyUqc/m/GkufU5PYb
 mvfkaHrejhGZlOAdbGGuZ9esmB5YJ1s6XkvQXauaUY/T+9zjplMZ8Iok8qUep843BwXq
 nU7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4cI1nzuRRB8hXDQT8eSqY4MXfwWVOkfcZBCFbCpKyodRZ8WDW1xZ5YKCMuA0yuIc9I1GcJOfVXfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpD/mUn1RFqrUNa11LnfW8HiH+RtoMMiwplwCNsZeWuFX5z/cv
 4f9eShNNidoYAyZvkuJyQ7Dq68eNw2lJhRSu0Wcuv6WfaladW4FDFFYHG/JtPxEDAxi+VmdO/Mi
 UoOMiOOCfZhqpo76PmfzeQbDn2qTOJCfaM765h4gtGt56yU6C1Rhv8w3gR+jDMJXaBFGlJ+g=
X-Gm-Gg: AZuq6aL8aQ5FNJftxKwDbW1oPojyRi7CYoBAWrfyZQNrC8V1BFOep91iDZo/vUACC9q
 FJ3NAIA4Qf1S4fKlb3pK2Iu8A4G+vNSeWIiNavx+NtbEldWzxjmNXiW/9vvCobH77j5+vJdTOeB
 /SfDePKPs2IJk0wVyHOUMb6ogzIBIVW5VW8efSCdMbU2pwWIxPXnN3G3nCWv9qcV+lUl3eTxuhG
 QFK2woPbSQkKz9P773+DRVS2nXYD+4t+KYFBUY3ZU3ZhNwt6uKGZCB7cnlc4lzILe8eJguHPJRD
 q0XbE7bfYjaVp8NGRYXTDUWM8Stpv3vGf/JTALbONNA3nPJn26kePxwNGAzF2sHqVeqfTYPqpOQ
 qkwg6fofqGrr/HrauulAB3ZqC/gQsuCk2oLWS87m+c9EvN0W6viUui47qTsSbSe45SEmlGmCmxz
 lA+3aYs/Bkzqac6H9+KfHWwtoA
X-Received: by 2002:a17:902:da4d:b0:2a7:683c:afb8 with SMTP id
 d9443c01a7336-2a870d63794mr61400025ad.16.1769645655623; 
 Wed, 28 Jan 2026 16:14:15 -0800 (PST)
X-Received: by 2002:a17:902:da4d:b0:2a7:683c:afb8 with SMTP id
 d9443c01a7336-2a870d63794mr61399845ad.16.1769645655188; 
 Wed, 28 Jan 2026 16:14:15 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:14:14 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 2/5] dt-bindings: remoteproc: qcom,
 sm8550-pas: Add Glymur CDSP
Date: Thu, 29 Jan 2026 05:43:55 +0530
Message-Id: <20260129001358.770053-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX0GE8h0WBKssh
 A6SWbGguAzN0NmBDyYhzMsLG/hS0g8Ud95+fz0h+Be2Q6vPkWYsWV0eNTIDL6no52LVYNPuHZTB
 eow5chuk4QPGmtnTJsXgQu5QI4fbIfiedakc5eJ8UVnkGzb0FigULH83Rt3lpp2o/f9Kzy+bXjo
 wEESo5Bggv70knKbilDm+BIBKfAovUQ4lLFSnqvQ2KFHHj4gF9mo18dxtMTrRVv8LVbwlqCuzfq
 H9B6oM00DUvgeDjlGv4ENO5mJ2QYkpyoS/22hoRzpkFsY45Aw/q+rtg9dQ1Yak/xgiWE3iDsv2V
 d7J/g1cDmOYpH1VVaMI1YY/AB/bbTey7S02Qudoq042oVU6cxSp+Le0ckPeGthOPJoDQmJ7KzGR
 nYKLe6Cn1VxA7wUS0gypHymB5hrfwsMHGbXHkK6pNWiBc7IZ42jgbTzTESBoD4NXxF7pKN8lwom
 BlvH/i+GRPZMrV1N+7Q==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aa658 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I8BSNejkaQ8d0caDSfYA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ZJfq5WXDW1JyBmdgJrxen5aD3nPpCZBP
X-Proofpoint-GUID: ZJfq5WXDW1JyBmdgJrxen5aD3nPpCZBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280200
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US]
X-Rspamd-Queue-Id: 1AC25AA24C
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur CDSP PAS which is fully
compatible with Qualcomm Kaanapali CDSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

