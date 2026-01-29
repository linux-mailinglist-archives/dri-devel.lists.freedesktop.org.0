Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DyOK2qmemnF8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CAFAA283
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EFD10E788;
	Thu, 29 Jan 2026 00:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvZGQPoM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wd/fqcCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773D10E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SINvx42081886
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NHSUCfK8Nhv
 ZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=; b=VvZGQPoMClaFCvQohw42lwujPJD
 2gGDmOrTo3QRYDaZoGQ9PrMstd6DIKI6UZAVY5m6F2Mqc1WkkgIZqV/ayZgAbIFd
 m8NyevGeixJ2di0dF8HhRXyboddJ5W0d2gQOXSVeTQQ+FdtCKDa1Isd/Aw6luA9b
 pEezqEv+34MhCeNxtJoSxFPT+41I6Yakj95m0mOZOqXzHOOHVEbO6H0NRO++rE2F
 AhsUbRZ86IvxThdfEPhlMLoqRXb8qvDex5FVYWCkOw3Bg3cEgeSdClyxmGDgzHix
 uhXqXCYMix+cxJUi8vsAK7/Xsv1a3mmBD2NRtQfw0DdSDFcoL6InXHBJh7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxgu9v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:14:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29f25e494c2so3951625ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769645668; x=1770250468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
 b=Wd/fqcCQMu8btoq2c+jCVBIuERg9sUZ9/+cd9xOEj04DhOlJhtninzqupgyfsp2pFo
 V0xmfWBiAQWe3A5Rqmu50CA5ZyuySN36pHLWcM9CO1SSPLn9CiNnQ436UMA4oWa8/GKT
 fWRbIrNlQ7g6V4SRZnVcfgfyYe9QqrLMWBbN10ReQ4Ho4y6MgEvHRhpIxww+erkkUkWG
 0ZXqqpQULADedv9vbW1dJqhjrKu2z/szV31yY36HNjSyeK33UJdQrKDSF8I2b6YR+P8k
 BgWCbafIIQ+HmjHsHssbcn0XvjjWfNqgeQ1BeN+k2JgTeP53Hkd+ms7TrZLYfvjXXLsH
 0Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769645668; x=1770250468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
 b=qTmKKBGsafl6Jp2/KDX61z2D+S+2RCU1fDknIbu5vnyBwitqYEr0zfbY31KrVoyXRF
 BYJd3wiw/dV2aB+aRCMx0ilhma0e6MdSHxIeDMgVhUpai0fnyIjRNdCcV4XIFX67gZmR
 E8B1OjqnipbfVRAKJ2vWpmoi769U99TgCqsnPq8KlujWrqKYzHtTuztRzW4B3yE7XMVf
 iGKBK1YFu/Y1L7se3qO+9FRVturk/j+TFQwUk6z8fwZCYIhwHsVbCI0qUHj7s7e55V1k
 YuYi7drXv8UMyjAWwDmhyAbDTT2v7nrAuYWG15tU5pbp2rDB/QcmM/0/9lh64orHu0O0
 YE9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32mzz41Srgr/7R3CYI5dQ0GWK/kaoPQSTBZ+JI9PeKwHzX7kYSbmdGve2A/mgxDAb6N3dDOCTMx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFKuUzmhzEXR7ICsSMq/fL6ER5pVOabCh74g3bToltgwU4dZH/
 fJdZId0eeOg2WaXny8OdfmvbJYmGlfSityyvK+eILVjbcpU/LERs1VoJXL4KQ4a1j9ThtENOBAt
 2O/bBFPFOiMVghWwZP7SWC+necRLWK9RwaYPFB9gLNSbLFsFVHVTOzcMzazvk7uwNyZAaS0Y=
X-Gm-Gg: AZuq6aJoXAhPlXo/OTDaimBG2APTKa4gMpY8LpaaSpHrzOOzaCoVudICSOEVPqG6qjX
 tGHgVpAkQo/K4Yg3rwHdB544F9cxpnYy0lczJa8CVhY7bTvGOuBXlzf0NJ0nlvehtekVNwJ1VV5
 hjEGx5r2JF4VWO0Ntkk1zvx0oK7pyYkiQLqOFUtOEwFFY/znSmsoMSTzxrD4OjeuZO2wuY9cHs5
 ASOxZhO9CA5iJOzd8PKNpRhRtS/8HyY0vDoHYmB96oQFQ8SLz7ESQyLrc16cYr7HWrjGWbT+Fha
 vENxoZcpHLBUWlwtZbkVNGf7egUheduS5uK8II/j+Oc6RPMU7ZbGj4lu6VZnOTHxX+m1HXczDfK
 gm2xbdL8kXJ9CGenQ/HRZLbjfWyxcKNwFH8tnVb6rWbMcBDpkeRXwDWcbiUo6cgCC0J/6a9tAIz
 +SZ5mhEUWiscE/N/SjwTwDG9HR
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id
 d9443c01a7336-2a8bd502962mr9310505ad.26.1769645668553; 
 Wed, 28 Jan 2026 16:14:28 -0800 (PST)
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id
 d9443c01a7336-2a8bd502962mr9310375ad.26.1769645668069; 
 Wed, 28 Jan 2026 16:14:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:14:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Thu, 29 Jan 2026 05:43:58 +0530
Message-Id: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SPoUDvi5FskZMBlDcp1X94wx9Wlq76RO
X-Proofpoint-ORIG-GUID: SPoUDvi5FskZMBlDcp1X94wx9Wlq76RO
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697aa665 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uDRNohyrUr9TWZXFZNYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX0udYs7vbxvvD
 Ehq+KBNpgdztGwgAvc+wszm1VBndsQdOqqZsYxqfHQDMnktL6Qd74BJVeDu1LKP6YJDbmYbZJyE
 0NlV8MzLQG/3HxUpMy1aymArKIJtpIasLkhT8z1ySx112Ylw0/6z44sLubMa+tEs57inFU/wOIb
 NPO+C1JFtCU6gkfwS4eQPoLzBoD4m3TPRYHHcNO1NmeRGO0JhxvaZXj0O7kGzrk/kAlujDAeHTL
 2DODF+uUu/3Qd7HQ+mrTO4enldUoUEfWqZXmvFVwzvqhoRqcwFJAHe8Mxk4edewKnR3lyapNP+w
 vF7XClj/lNka1vBvS1zPIxZ2H+8Reu108pB+E9dAdiBTSfR8zGPOSGpbLeE7Qvy5di66l063rTk
 9UzebxpvYLoFsoZBmyShcggnZTRqcCKqlHyUwJ3mfwlQ4SYOhHUByDMYTsDMYEOwCTEQaDBs5ca
 nqDEskX9IdPfqZctm4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 60CAFAA283
X-Rspamd-Action: no action

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 0899214465ac..0eed4faa8b07 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -487,6 +487,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1

