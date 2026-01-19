Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71630D3A11D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDE710E392;
	Mon, 19 Jan 2026 08:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/8ul0m/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJg+OI6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6510E390
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J6Zah73471086
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=; b=f/8ul0m/k9Mtusu0
 O4fVRPgrk/fKyS0leQJqStHmbFxAVcFnRKSejveBzuAEhqyMDNKSvywms5UkpQ4x
 /+NWDGCkne5xd4gHH/fljmnmh0P6tIJhvk4r+UQ+rK6hB+ldU175HNUQGbsdDKgj
 50AA01vjl8UagFhuip9oLiQojsQfzt8An4iJA/Fgi/pR2qqx1R9A/pWcKKARKuDs
 OTaDHaRPd0yBfzpizFt/gal+HiY1F9zDOngL+IW2rzB9DteDl7n7gc7PpzTLYlEy
 /ku1xqkG+G/KYlmgPqqf/N9my6CPm1kewV/RUY8Sg+1UO3h6R0WZUzKyALYBTsYH
 4d7e2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dc8vv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52fd47227so737262085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810484; x=1769415284;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=CJg+OI6s69E2H7RPEgwTQ8CyvvUigBemUZc9/fL3TPbDouKC2/3MTAbYlQJe2pYV9o
 nCl4fsVViO8Ed7jtl80/piZeqWj2nHT6d12e32rcsB9RX3O5/oOjwaAbnDrOfrkXejc5
 E5nlkeIgp11Vz40XnEcaqoDd2Ku9kLKBLzSY/duFXl6irXozZu1I8EvxY0RZres9qxtT
 tr/K7Qci0yvhHZbksKR08x993fouh9Z7yzVPEftgGaCo/ZNe4RO9nQXQDgXn0PMVfJ+E
 IMKxrSSoyWxMfkhZRWa7PhfLud+lRmU1gaOxI+8ycb0PEA6ggn+SRvZdjgvKjleVBZp6
 WNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810484; x=1769415284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=RVB6TWnb74whkCnQCr2SwbyYFxs8RFSRsaOvyr7FNu+thMt19lFlfKDYAPZq6czbC1
 mFdoC+ffXzN10rTJm6QGZKo77hZEJK1b2RzHrO9tzWyhdlIwzwzVlzUckIq9sFPnNw8o
 NlTMu4aeDTFnojCIz5/KMTdqq5kHgxYY+idqe73C2UsTVm8uJG5hUc4zxKczvhmTQVBp
 xLL58kQJZrj80q+gSE+ZZJG34eR0jiKD/CMo8oMlsiNkIlFhHjbNUuQPMifPMmBVNr35
 u7iAAhotka5TUqyCh6T+239O3Lq+IwBUu4k8IzI4ydp+Z9A7afeyJ9lx/L97aWxBjLLq
 AvYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGYreUvmDsBdr8SHEifgBaBJ1RSMqYyhgHSVFN81V0LXZxCUNGj+7nsnV+okMvNOKIl4nJ+QaKoDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJxBzabeEkIBligOq1qUx4w140BMJrwz4sZwux6tBeWBlm1Xb3
 mTHd7qQA9Itx3v3wKZMPi1fMsiBb2O7Qkp0hVh2TQDbqvuE1bibBIHXWFXwvUZEf6gt9+JkXTXp
 LpP4mJeRyIV8Nc2ZBzzcweRwkzJyOh+bQZdrx5Cyn9st7nZVvam1OPiI3efmHp4JbXMBAlho=
X-Gm-Gg: AY/fxX7fncXx9SNlj5jL5dKo1BEK5oYYREr+yFQsGuAnOv3alpBqdTVTwKpG7r0Cf2a
 ml6TCoHvWArdLTvcTSffxJ/DfG9xGzCJaD9CK3b3uqOQw01PKNXzOOR6bh4K6YU7yMBFWMjeZfR
 +oBVz7ZSTr+zPJITw5vguJVZ6qeqBqFOPZTOz0SIAKLGEUcJyCMlgzZ7x23Vv5APJ3Zis1MVoEz
 3kFleNwG5e9it9LPBte4Hj9yV+8G/bwpVL2TflCmQGmKuLHkFBTdqimLVXNuAHW74/SMrDdjtmc
 UX8juU9XGNzHmJc3N+T/o4EnbjN/QsVOYUe69Ov6Peu0CjIX1HOSIaCLmZEGcT0u1mvn3mw7gbV
 0J/2+apWeYVPwR/TKfNCuu/vZMkjrK/7o6MIsoZiIlstcsNaM765jlpTjaWDpBNgLGDdyZECpXz
 82sBMBQ/KuC1bmeJ1VLVHJ/hY=
X-Received: by 2002:a05:620a:8186:b0:8c5:4e48:c908 with SMTP id
 af79cd13be357-8c6a68d9cf6mr1151899885a.27.1768810484204; 
 Mon, 19 Jan 2026 00:14:44 -0800 (PST)
X-Received: by 2002:a05:620a:8186:b0:8c5:4e48:c908 with SMTP id
 af79cd13be357-8c6a68d9cf6mr1151898085a.27.1768810483806; 
 Mon, 19 Jan 2026 00:14:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:38 +0200
Subject: [PATCH v2 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-2-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefulaU81WiHXID2ucRCwgIoY/i44V65kXGZq
 PlYEDN++fWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1RgJB/9wF+X3VBdjncUszdIcvNEvKE56cWE58F1+MNVBscWHvaZpjbqub1DQ93KaB24e/cKF3MP
 ow8jjcMzlCQQDgVQ6wJrrDZrNQ+pquybiDnRhZznfMMZggxJkULXNIer+RVanIPnaNOyz7ZZRIN
 4au+ggELHPCNXRMTHUIiwzRSl1pkh4C594S4fTiGuZvx0QECDApHBWAhWG8qkGzOy1Zco1r0qaj
 8BBFBAuzQO9JJ9x3W/0GVZkAepKsvt6MytM74UPJQrfYa1DW0DuAQKbMbZLZlYylPoIRdTZSTDR
 Vzkjtq8W/gxNR7sKhhrY5E+y9ENQNAZwEOyIMlXfzDv9BIzX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX6YWfvzGqeIAt
 qIapsI/f8KYW2RXH3DRurlRYUxtX44eROT2R0zwRsaLHjUooEhJigAD2SszCYlnjjb39T6G9q/E
 iRK9GXJOOj+Ko/uOa2cP2WolpsBfOpF2JUptP7wkrvRycy7flatYAtYa9R55k7il35XuvY61tqS
 zzxnhnTlgzODi1cbexHnLPqenoNHiMUF0LmcAG3UA6Khg5cJzAuT0TFyeyNePQh32vF3LcKpW1K
 pO2k99mfujhAJnYlyPBCLnGVmlpRCgRdXxXelM+Kczm6O5CXSNmqMCZmoYL7ayXOaCUs4TrKEpx
 qKMSwkz9xI6e/oftD09ITNsnk44oC9kyL5rGkjGHM81Tstu054vgBcuk1mDIR14fZ5ND46THoDe
 0CAYu4UUr80Yd1kVLfxhN4Ev5r+PgNzWT+Xhrq2G/kd4ZXhKLUNAfO54EJzmT7kE3F8Tf+QuHBJ
 FF0BPM+ZlE5VbtTrrGg==
X-Proofpoint-GUID: t0Ou8dns1xuqR_DVreIC32cEKeKWwoJh
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696de7f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: t0Ou8dns1xuqR_DVreIC32cEKeKWwoJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190066
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

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3

