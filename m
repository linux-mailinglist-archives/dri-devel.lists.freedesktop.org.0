Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF64BB44AD2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DC710EB03;
	Fri,  5 Sep 2025 00:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE5ESYjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA7210EB03
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HxEub008288
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bLiIOtcLE7wWiaqufYm5bdrdybL14BNM8N/yFfbsTSY=; b=VE5ESYjllYEICnuR
 D+Vcj5mbyBY0Ok7ERnQG2ZMTt6JiQzXKuJjGttNEr5NrumYFafTrlw9RxDz/QwzH
 niqcWvxyiVSOFqgMCbLMKKRg3Txhb3AR26xlE+gkAre1HRTLCGfAJ8jQGZ/UQ02D
 UszrjoReuu+sXBg6faQRIOajSLNQq0hJDz6Naopre4wXIzRNuDUF3n93PpO+tZ/4
 SUkcwDUjHXx8eKpvV3ewQWyG/1AcihAmzIIFhsN+5AZsvFWjt8f2JhXO0b+sjonu
 7fQo8cFEzg7DKzhnGeBf0LuYb0inQxZnb1wUTowSMB+4PtIjoniG3fIqhv4UgdwT
 6yv1lA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjs8kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32b721a23so50057421cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032740; x=1757637540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLiIOtcLE7wWiaqufYm5bdrdybL14BNM8N/yFfbsTSY=;
 b=dH6a+ex6c8e9f0sKjA2Iu1DYhEO1ZSLiRcevGf92ODwNxB9cO01ZtftSEixQTcSAks
 /WVuY2+MFabpd2FxeHdPrvwU752hi7ZH3TOcQd7Ls0G6BiOA0OYFJvF1QwbPHdIKErT0
 HJHFj2Iqruzc4+1G6WrHrKnpQTzRc+f2nGODNomVabfjI7sy6ACSZ5DynG0Rmk8B7sU+
 H3ru8im+3OaJIRl2vlN7HqZ7ieMb3ToBIYd12HbW0aQ9khN3819AcpT8gem4PgJhtqL/
 3RMkAIOsglHnxLWBbSwgkzpoXYu802oqANWUn1biPyvA6X+RD3nyCVX3JSLlaYZXqvvH
 DChQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwtQJOuEeh0UqQFX4R1V6zh9IAxUV6HPqLepyFajzOOpSFX0GJaogpgW8a0w/opFEesz255hWIqJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsVioHHvtZPsYt3EfmyxAdZ14mnao6UXHAH5p3PrVeLB2jqyG2
 vE60Q1Twx0XIBo0vSQOeoFg9hqA0lCJJv7ld9un7lcZcHQRhYYW0ir9KKgR5ZRoJGZWm+06VN+g
 AFINyBDVVZ9HAf8MC/J+Ndb0OraNmTA9jlAYCc/5C4zcgrlFCG+ZL5HuSyFJHwOdpB4WHWNo=
X-Gm-Gg: ASbGncuQ3CUAfkPe4JMG0nScBj0E22fM+rQY26xo7fLOMMMvtEiNO6VBGYZ8CMP4zmv
 KIx0JZvFIzgYEDqQsDFPAc2OIVGLjRbAPqX8bB3WUpMWG2/AjO5f54yDEbGFLQ/pu1UrgRGymv3
 IT2H6OVsuIOkdIJ04SCnga163h+nowZx+xsQkWb5XJ/3Kl33Fsyiv//pIve9YEdf1+vgOikfRBt
 1OUJKVee9NYEV/9xpPJ9y9ZpdbC/9D/taPA/8QTCkvV+w+Ks1+3qowhSjWqedolZvtv23vz2CvQ
 HMyQTQs07CfEeekPEpDXVA1+f2uCaZeFHAaPMPyrcJOMvsgPIAcOseoPJnsj5h2f8ixKC/nG6ue
 qlPH6v06WnqYzdHKFx3NZminraMUisHDHv9Lfw9ZWAJthDY7WZKcx
X-Received: by 2002:a05:622a:551:b0:4b3:61b:58f4 with SMTP id
 d75a77b69052e-4b5e18395b0mr40913341cf.53.1757032739625; 
 Thu, 04 Sep 2025 17:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP0nB2Vt3LMYDBx118zsJ4giTEWN/hLJl0xD4HXyg7zzaWIFQByUuhZsTTOJxoycKJ8OS8WA==
X-Received: by 2002:a05:622a:551:b0:4b3:61b:58f4 with SMTP id
 d75a77b69052e-4b5e18395b0mr40913091cf.53.1757032739088; 
 Thu, 04 Sep 2025 17:38:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:37 +0300
Subject: [PATCH v2 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-8-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XLkwtyygZJdPj3GjkZgZ1aANtwazJqGOIEmkYbUxRwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEK71uU2bZ8JQXFBGN1IDBH5OYQyC9Xm8v8v
 tnUi8qYOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1b2yB/wKB4v8Bk2zFkuQDoVspBPY3bca3px+IzVDe5SyzF0FfBVY/9ca/uty+7qgAX9i8dVh8NV
 LdCBJWXW7Wfb6sEB9hw323dwH4NlMLa8gY1KW5GQiOVPehuK5Pwc8yCxUOs+oG1gD9zkpY3crTj
 HvtY8KdCmsZZcOKPOGb5b1apoatF0mT/b3xWXFicKF/NQ7Tb80KTtgvQsZkQTzvDn0gbyk7bzLD
 gWxUFA9aIalzlrIfuxodQxpj5zPC/dCyc9LKMSgC8Zm+tco4YF6FhId2X3J1vDIKPmNfidpAC7J
 /RBiA+aOsGY62ro7QEhoCaSHJla3hJbN+kFDytWN6VvHG/SP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68ba3124 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=iz29p33r4uX7jxN-whAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LTlmNgTeUGUdwpE46Ljj_UZ0GBowLoyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3z/EtR9EhA7s
 xMrPX7f3v16Pe3diObkLNnAsx5dKI3gIgFEGNJbhcQjwOVl9srPCETMcVq+kYsQJ/1ZUpNp8B37
 4dMiq5xxmEIoUYYEVRgxZLcqFwpm4Jjpf5gznifwc0/X4tY6H4IV06sfrMQhexBv8koYRQSzi48
 N0NSCwxbcH2IWSiqchhv5d/r+9J0d/iDZSctaBqJhR22JS66pMm+HUbOpPTKbxIAO284cfOLN8U
 Gepq6LlrCQSW2c0eTQfJ/8/jDAweFnqgURD2vzubWxqETGiXMmwaMiWIA3DLbJ9/esDJyAl7dzL
 x0qwiKlBwrWtkosP7EPStIyZFdjJlKQrGE02Niop4/lsTxx05ceKdmKCbOxXfhZQY29dIbvUZml
 e/jHVADD
X-Proofpoint-ORIG-GUID: LTlmNgTeUGUdwpE46Ljj_UZ0GBowLoyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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
index 79f7f973dbf348acf2c06e66afedeb8f22e7a8ca..35c443f006bbbde446cfcc0862c49d06a8e10bb4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -325,26 +325,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
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
2.47.2

