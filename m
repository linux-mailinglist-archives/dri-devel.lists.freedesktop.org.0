Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC2rKGGmemnF8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24765AA253
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799E910E789;
	Thu, 29 Jan 2026 00:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDK1j6AZ";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWlUuG7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC5C10E789
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SLotfO1396988
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bjsGqclSC5A
 +jOI39DgtAXUsVsWpwMND9DHnXWAUT54=; b=lDK1j6AZAfcF+jPtTCC8DHVIBey
 oPUMg9iJ+feo3ZUUK5Y2q+4TMe20kg4C9h6iPAZY13621rQYAGNuUoloXm21EQzm
 oJXIfEIvNQJ6XB971/aXhmIEIyhm7F900QNUG8ZDSTrpun3kFPSxTKX/8dKqPydf
 9M0SK8xvaepfDt/aPGIR5hn5iwWcJeZ3qtI4BKH0tqDGUVYXgl6NWZXh2GEiRc9R
 86m5deWZ44jmUM/m2b3jgj9G9zsEy8LRIDYRefAK5L8elmmPM7tKW32sZ076SC3l
 IxO2dAKU5ZHp61jC7N6096+msNfhbsRqoR6NrlNexGHOsyHQqa9hE0bDF/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0auc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a79164b686so4579955ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769645660; x=1770250460;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
 b=VWlUuG7/VPtKZtot+OhYMMI2fZAMCfpBx+Ujs+AdmMCaKZ+v3FZXVCcL3wndMfaYz9
 oQQN5HarDiRmH/AkYN3n6N+bGK0/OgPax+91tzmBQonStyXhkCijNxWmEU6/iGBr7Uno
 8IIhstBHo7+w5uoWRPdX+cnHt6+r9FnPjzt+ABV6e8u6kfBq/PNFWzuv+oEi62Ikx1mq
 RfAxmRVind2S89CYIHln1AXmD7L/V4zI6D9eFSLxAB1U7PWB67HYJErAX3oJrdkaj4hE
 ujOJos+exZctx3XVcO/73ig49LiscoqQ7QaP2b4Nn7Yws0SqYQXkebpb02ccMc0UDU5W
 uPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769645660; x=1770250460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
 b=Dot9d+BvKW8xhwUxC4N0sqvXXQaUz+27knL6PmRku9DaD6PF/mQnDvruec/1kgO68E
 ++0578yKlPv0CWjbwmejNRCvHU61YIK1WAySqZwR66797xNpgqku3nma69eV37S6syi2
 ZEgeUiOPeeK5TF/fUx1AiwcjgW7PR/AxDDvliQg7QUZNB+JHdqWEUtIvF2KrwRzG+jij
 Rkwv+FZI6iv+AjNcP3FHuXr7nSLsivUKq683dsnEmVyjZ2FIWeY3i6JneX4m4F0hfLa9
 kQF6obS7opSVTGkgZz7y+IweW3+FOCWxSEMQaZMeSk4+ScCo2YgGIYoNSlBrpmmhusmy
 OTyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURtn0oGeSVfdTAFoFajLtX7/qaLYocHPG/Ngb+FZloVuOoeUylKQbUUJUILaAC99TOcZjYZcVwpgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPcX34l3q+jfiXuvR02wCcPILZj8chdclR5WcxBsgoS6+5YBFc
 IqgISwNHdLpFM00pMNi6FA4bsZ1tbsdSB3m5k1D/JPybZO399tF0xuIdBfUf7MmnFLA3c1Kx/Ry
 kmLU9qFdN+ShoRL7fa5RrlGNDqYr1qaz8dvyT263zYMAZK28O7j8FODG3lxXCx0I4LpSUWdA=
X-Gm-Gg: AZuq6aIE0hwCOaDLaPj/2RGdA9MHi6vTstuVyJsTGQxJTvYmJMrfg/qtA48QLCb9esH
 Rhf4t8TPPdJVZnYVq7Vrx20UgqQpS8dwB0x5/8C32qa+HtIFuXio1W8nUKV6CAeUhWKh2MJyuN3
 kcV5h4v+/HGxErq+mPTQNT0oGlxu212jBHh0qKcRHhHjr92X/90tyLAs/e+5frnDBT9lz1XuMMr
 y/gsRGOAIsjSiVxAXitvSABEYpMT8IXCO06lwh6BMCsqRr7VvXYq1A//g58WWzweEAXs1BLWBkW
 t4iqTySyK62iBFpm3KucY9NrBohX4dKmgE/8+eWOfft4rdPf2iK0lN/RDEYNIRsK2TuLDNbpuK+
 I+3jhzZcpZUbSCeH6qDJHubO972ZRBPNDq0jzACMhTd6x6kybXPWHpx4F2setJ0YPImxvMXYNtd
 Nsz6SM6RYzRi5xX6M63su+hOQu
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id
 d9443c01a7336-2a870d2a07dmr71197385ad.5.1769645659952; 
 Wed, 28 Jan 2026 16:14:19 -0800 (PST)
X-Received: by 2002:a17:903:1585:b0:2a0:fb1c:144c with SMTP id
 d9443c01a7336-2a870d2a07dmr71197145ad.5.1769645659464; 
 Wed, 28 Jan 2026 16:14:19 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:14:19 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 3/5] dt-bindings: misc: qcom,
 fastrpc: Add compatible for Glymur
Date: Thu, 29 Jan 2026 05:43:56 +0530
Message-Id: <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX2WW8Aqy6p3SR
 1QSYWC14pky44NBqEWugxbqZUcYR+QtVVIfdz0TCnmEhxK+RmtM2GbBb+gRjvEw/d2fmOPkcfNH
 y+geFS4MFjdTKQ+nMtLQi7BLbszMKM3CV48PoOCB0dQAFkt09Y8oeAP9ETYfAVzbP0tJLcRWHbr
 fWj20lbwEEvsBIypB3Wh3BDVPOmjq5P3d5au+BFXd3+wL5d2NpicRJgEVqn4Yhi/EfSoY3FmTVL
 QNMW/SGkRoJwSmoewhhdYCMe43Uvpg/J5vPRNJ18950OcNxenBwb6S5P/AMI/mSvKnnI8KnQXbj
 7PZ1GHD8VP+tTJmN3el/8tgCiCxkxiwhszGkOOS77M9yFuCck03T0eZnYsQgf3UMpNZKJUOoGkY
 fgZKqWsQowV+8om27Nc9RGHdRZqNhjP55Cb4HxiEIBy0AN4m6sJaQ1nzuRdka8dwAiYbKdhRObg
 U308fxXe49hFp/ElV0Q==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aa65d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eu9c2-cO-uz-pbzhnSkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9m_fL0TRLgNY_bgeKYYtiiTS2irRQJiV
X-Proofpoint-GUID: 9m_fL0TRLgNY_bgeKYYtiiTS2irRQJiV
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 24765AA253
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1

