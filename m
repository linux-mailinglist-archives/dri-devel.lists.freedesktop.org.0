Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305AC6A1C2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448910E4E4;
	Tue, 18 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9T/R6X1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCv76s7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0202410E4DC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AICAo7R2802300
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=; b=F9T/R6X1DM/FfEx2
 W6Q06lUe2eY/j3Kwv2bhNjtM7SpFU8nGLfav8dvxBDqvTRkmwgAczc7Y1vr6KA+6
 t30snWDxIYtLf1a2j2O/D1hjVP8bFp/frQxU/gnXlfJWWYrhsEa41WjprDQlr9nV
 4PUqHFkFmuepL5cD0tXw84B50kTiQuDWu5YKUlTMJhuy2Ko1doYvRgZn6wLwaNnH
 37iiNsLYX7ubSgLtSC3xFFd8gCzPbofF8HHZWw6jJ5jCKvnmxJ1bgcKF2Mj1IHgw
 nsJ/iwF3nXJymYESWanhK5jhqdw4IRrdBh0ArhHYMCPLl2ky9iQH0l2uKH1LN6fz
 zI+msw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20dek-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee205eb70aso27799961cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477506; x=1764082306;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
 b=bCv76s7Rt/o3eRg8BzKx225lEuWt/CBLy+1NQ4UaSS5P9oDQQzpAgmpoRyEjSf1EsI
 Q8ZS9tcbtkYEMpb76q3ww+1lPv+0f73m3OqBCNoWlxx7uKknVgxZlTo79pofmoQq7WlI
 xe3dEoO5qVcJ4dBxG61nIrk9G1GVNqLWeCv1x46KXeKdnWDcN+wOc947sMxcmpIGx533
 /RnaoacUdNIxkzbgt16X7HrgCEjKhS1+9TRMCviVulAMRLjoGA6GWJRLelsTwlwdSdWZ
 Yql97i7Ny2RQIPUjzJh94JpBSjqGnfm1hHaw70MulMshbQgiwMI3yU4Tr+J+tT7toUma
 NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477506; x=1764082306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
 b=j9H7Bj10b/UEnHKyAd2FqgznG6wjlnOwelwdLGMfP51tFkKsvv6JmQWY5IbnD4aYnm
 5j0P4eODDsoBgZBWgti8lmvAghg1iC/D8dEj/q5EmFz8cwU/AgtLVSNI4VbzwOXcH6Ku
 6F+xVlhlbNuKWGd6sjJ5q2qxDKAEU4LTN8ta2s2UkagP63Ao3U63on/Bik8kLjKk7UNG
 Yj4E+zhWHzzd9flTt2fZUygelac7hpVs2Yx+jzj4DYKhhJUuYxKZ5JEK0W3n16HcX2WU
 f0rQvoo/m955CYKwhEXVqocBjglucuZ6LL3iI6INS35I79cdjdlG7d317hxMqX5rmP2J
 HuSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJjrqj+pzrdnVOOnv8bHautUhoMXdUg/j2MnH2wXnqFY+L7DRqrkU8rNgL5KoIJtKXpoEW6scGZ9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBdJib9NIs9j4J7gHLY4++luoQmbLY08VXKfWe4GcqwfVIuou9
 DsCMzRrk1YIf4yLZQDR2nYY0eBj9UkViHoo98BciM42IXW4bGMdDHJHOGub5v3xo/xEUxFEdyCx
 PI3IYTvd75ez55fGxnrjCi10RwN81grWyMyTm1lZ/8BRTmEeIc1bmxaEbo4EMVQPs3Gu6vOhMsw
 rGAU8=
X-Gm-Gg: ASbGncuOtcfcGmuKnfYVo2wFvMGCiQNTFe6exxTVx8WJyHl3JZLMmUmzYyPf3tUI+11
 XlxAPDSPu5bNfbcFiz9/6jnvfFGU4nkFXTn2xDor5aUM3i5IugmF2Mp6fJ1zenBAMNYwZeBxd36
 vUfosMXSMp2xxDnrwkRN6BVtFfCxEhoQEGVChlv7HOTKHa9evzNIR8f2YUMCY8WokCjTFjxxRQP
 dbg/FnaH8MoYlWoGu/qywkW5oqQWvIQ7jiR3Fjrjk3yuDA3Yrn6uvgWKLfVH0AQfnpvpajHl4if
 xfDJ7xbv9QaoobxRFav/zG6uabZPQ7h3384yBd2rEHLXaaLDQwoIalkVIVyvyLorI3Mm0vdLf/K
 LFxZGgwd/+5oUK9BAyvm6QITQjM5iMSSk1marzVBuZ9JUijZMD+nBYyuujD1A0sQdvSyH/yYieZ
 U86t7n2IIDtIsD
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id
 d75a77b69052e-4edf2115889mr222028351cf.55.1763477506235; 
 Tue, 18 Nov 2025 06:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVS8N8VHsVYiW0k7onzk7eNE1qizFWtu9jQliWalm//hreHBJzziNsUwpECi5l77abjRGbhw==
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id
 d75a77b69052e-4edf2115889mr222027991cf.55.1763477505770; 
 Tue, 18 Nov 2025 06:51:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:51:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:51:40 +0200
Subject: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sY/SEDXrsZr0BmS/LMw9TXkPSauhq7bXwHnS9koPDnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf88T0dnu/Bdnvg8CfTfhWTjN0pkQ597GtgI
 kD/IPt7miqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1X9XCACVLoKFvOqIsZB5xZvyetFJqy2ocjHKYtlm9nXB1OARuPziEaFV6ilby7xmEmoiSOnR7bQ
 TkVIoeS4HB0cto8afZWvKu+1EDRW6kyOfayiXsnOya2Ocg50npHenJdrT9gyU1yeo6IxJgDOvo6
 7hD739r6BwDhq5YWWaFefsic1vtinbZWNRghG1GgZDBgZ1z8StmN3oOUQRI93tn7RPnrQqdbG+Z
 p20YN3+XTHZme3rpVoy/3TvLfY55TVUcpFPPOLptHWWzlCJQ5i8l2uaAgCxO/T6y5QCxXo9zTGE
 DACManN9BppwPJLbRFlQL1CS1eAJVPZ08+4IdGZGZZP+Fv2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c8803 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: RIRUH88tmuBozKKAMYp9PtLEZYeE15Lq
X-Proofpoint-ORIG-GUID: RIRUH88tmuBozKKAMYp9PtLEZYeE15Lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfXzrr8pr60VLH2
 5p0tFzFWOY/agiJ/WdEoXz0pUoVREaHTr3hPhVbgCirhcYOq8oTNy7K0dJprrPoPPiEPFbBnjbh
 t0ZfNcYV33KcMjpVeuwDXKdPJDkpq0gxHoG2wE8H3ft69m17l35PIfvH56XyL3WWmURkV/HPNWk
 5zlvB4CfFS8mV5hQhIUGKRbwRVCBFIOpuafL/3nYejHE1vkUv2uXsMjI1XRurJRBf7Fw6QmMt6j
 YiEbuqCOh3qZfbdDWAd7oRYA0gA9iTilZOVpvypO0H3eqfYGgfH46zb1/T+V/yWmCguE3wdjolH
 +QZLEcdQRVKGM3rELz+XlPd+P5Q5BqnT9qCm3kSKlljDUTFYnlMYFHwn+Z95IIMLmufHZ+yNssR
 36EegI4iLkExTsEalbwVKVC1ivRV6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..651159e8731194d75b52c05158bfd1c9bad8b10c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.3

