Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F004C5B32A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58410E9A7;
	Fri, 14 Nov 2025 03:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPjHnWB5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j50C/6sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578E910E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbDGT1697454
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=; b=LPjHnWB5rzvubU3o
 79ljHc3h2Y7x/2D75aNsT865jnL/ugrwxn5pfVmvzmHbFSiZnkrDgnplGnvJ3p+y
 Mt9fCIBcPfY0ahZjdaEK8/1I2FjHEYfov/4neCKqOaZYzp4QBJC/SDjm7NefounP
 LLx7yGAoReFzuC3W8Zcf+XHHtM1Xh+Hr/eMAGvnuRbBTNiiwbCHP3moj4XS5tsUz
 NeC5tTpHwedRhGp2ySGGMdA0FekTKfVsKREWWKWrXHudtt5u4iMzwdET5EfKOwQp
 I3VMolu9/zViKNaCvK+tg1KfKS6oS6zzjleqYYKjmPykVlhq4vhN7L40xdf5FGxy
 QfZdhg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0pjg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-880441e0f93so61174296d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091837; x=1763696637;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
 b=j50C/6sz1ikSBrFEl7ssdKlMlhMk3FPlVbR4TTFSyA+wv4+MiKizWduNG7QKelSp1G
 e/MU2N4UdrlsnE4vfyx6w81ip1d6gF+7ol/eGULaKhHY7oYKwLdaLtLkgo58rUaokSYB
 Kul16GQMhlnnbIYjG8D+bzPN52ARMMUmiBxC5i/Olb1F5fd7JR1hi7cHD1KGvYFcP3cV
 B4iP/nWlqX96cOH6eDupuMMrcU5SsttwTSmrau9mzBd/hxp/2+PJjuBTkQs36gzACe7J
 uoeODdjEtAlNKCO0+4CPnV52wHtVNz7jNEdsr+xsI5BnUCnPkea7wAtjTVV/sVATU49w
 BANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091837; x=1763696637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
 b=XGXmdHOZ598jBrcAXsCAPppEEFTjhiltXkcxuYUhjRAQQFaTvvITOJOE/i8wdQjERr
 6AsaN6kv5wRIoMRzg0FSNEg0sjfnbgbNf/pTNlElbHaVX+6A5PW7V2dovbNPQLibLoFw
 k5FAqo8/Sdd7LxHxDSCQSoRiAxBkscC1vVwjlt3U/F/+XLZNbz9wR+aezxDYN/Q6DdKb
 itjrBLKwK0OnIbRU//lFCV6drHZGOkSzKRiNGJL4Lu4KKz8ePjDKreRCO0eDAbah1mgm
 HuT/ZVYYwMpHFr3rn++k9T5ZNLehvLfDLRmFpQrYCn8GGz4fRe/mA+N9oKG0PYBdPidi
 yogA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFL3oEfh0pY+vWAAC7SseZVEbHjB54b/odgrGogaq/r1HHlfdZQz4gBnLjo9IgmpUISB7yiyLjT9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdh19T56DjCBCZVgzGXJsY3pcp4BbqakCg/8n81tRYajARZd6x
 LyYkzHleEQzLLr2RitbnTXYSBOON6Llbi8HvEttIzxkrTZN3uqhuqKDF373K4r8mlNyAcnZ7wgG
 EdjeU2fZPj3BmL1vLrwkkDCOjUJY6xKoIFImdGRiqmrkC1xKtIkS0Hkcf9VyocLJoRpy6QNo=
X-Gm-Gg: ASbGncunKFeKRMGtHswU8tULjCljwR+d1jtWFgtbSO7w9cSRctb4yQ65m5j6X2lbdEp
 oAKnfUuY7Sn6s5kCxf3NZv4lvsLvZM9+nyL61NGZiDYuygqrievR5mNQ+gbH4ByzJjZdAofiFsz
 w/aUFOevptYFY1xuaa9AVlz1NBKtM2sHzlprmbwqcJsttlxDKSf0snOViqk2JY+lSAhFljlScsF
 aPPOW7oyuETKatpvCW0E6O/lBu/XRRris8+7VsG6Df4a3euOMqR7YTMGgZG+j0VEDY/AES4FHk5
 UbrZysnnxy8GUscde6X3PRlBL6XIYk2NdOhdnCagY3fg2rP38kaomwdhzJfHKkskErhfMZozA9/
 zdI7ylqq1Dt6TuA0CeuLPUCZSwZhyGoLaA6IDEaBIi/aMo80OM5staT9nmAJ6n6LP0UWjNImIkC
 +S9gzmaGFu1kUl
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id
 6a1803df08f44-88290f3fa13mr25626806d6.21.1763091836881; 
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHelPfmbqEPEaJV9rhK/zZRhzFOZC07eb56SvApfcmSy5Au+W5kiqFYSczUx0p26Bwj5dtUkg==
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id
 6a1803df08f44-88290f3fa13mr25626556d6.21.1763091836400; 
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:35 +0200
Subject: [PATCH v3 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-8-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EfFodWq2fss0e83GymFoQFbaTtvN367Me3klIoPCb3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmVQ5P/YY6C98/98eRr+wqSpCN7yvITy5eM
 pNHSaY/hLuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QVaB/93/BzR7UT472jfC8Bhav9semHxAtFdh6/6cz1OgwcifgEPOE7dJ9WAvPM+cfRFMBBTG/Y
 tZWaZzHXypJIb0gCAWoliy8cMLi34/tC8v5NekUtQBs5S9BST0VqPFuvvjjwzq+vPY3v1caiP4R
 J0BYXBuZXWQzpHAVdlvk63nmWgal25Q0j7Q6oEpj5knBdEaYZhBnWvJlIPEZbYzjyt1eDucqbWi
 W/67VwuQJLjM5M91cPlQjX09zzVKLR3H5R/mG5exVS9+g8S2rhknzD/w5TB4kCFqJQJ5dLqsGJq
 s5ltuJ8FtReii9Abdg786LREwo/wIRY+qxPQHLOxFkY5nFvM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: h2GrsqauCuU5DtNEVlbmNzRuut89LzCk
X-Proofpoint-ORIG-GUID: h2GrsqauCuU5DtNEVlbmNzRuut89LzCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX+8hhBBDXmlip
 FpNR9y/Ba0Wsb2GpFc7Ll5gBSModOeoQdWzDjrBOzc5RUh1yCOTlcV62f4GuvVYHDAn4XAjWmsg
 /iQ/BXJWT/JCE+vyWiBp1fg7o+NQMrsREuPtwOvbCkYwJl5NJvcOg0zqG9WCfBBGNkPRaWbnRvT
 JVQ2My+DmJUJQx2a6Im9Z7SZgqQ41QJDw7AjWDBT1Lw+BpTCj2qs6DSIn7X/3HuDT3deU9ywnol
 WLEOW3A0MIULtcwCzAK2KPwSx0g7Lx1NCnMg1/mJER2HtORcSP/Emc8Ns3xigP1I2G9C04AeO8O
 9+UQVndY8rabCyg9xoikUZawsd61EZy6W0ozDWeu7mrqCEAJT9rl9HrMEIbuRonaX962//vogO8
 E/Y0sy9PdMWeAupnmGg5CuAMzQNbbg==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a57d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iz29p33r4uX7jxN-whAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 5a1efbd99beeaf454f726e2824cb26d2bf31cf22..33da569eae5efebf39e91be1bf6c8b5c22bcac35 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.47.3

