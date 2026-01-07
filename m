Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F614CFF5BE
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DD510E658;
	Wed,  7 Jan 2026 18:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbCTIULR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp0yx6/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A210E659
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607GTHMI1979780
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=KbCTIULR+UQD/OAh
 U1rI7/tfl1/ayoTyuMELUcglhFt/QcCGv9YR7isr79DbYNFS++Nm24Mu8T+F/ns5
 Nb46watlWR+VJAYBlUKos9mkuWeL6NeBUNVZUj98sMVDYn2GjcOiUdMMpXb5ieYU
 GiBSz7AdGoLuCVNMugOoQB39e48Zo0tN0w05xOS1T9zXpjBM7thGm9bfybGIuNeB
 xcjjgL2nWqLLasPKHDHVkvqInzjqR3T9K6aYC3POkBBlzly+8qYDAHlsSxywEQ+O
 taP/Fnm6reneRix/8aOooj18dqvaHgLUcSXdljAPsXO95mEpzCjvaJPHJ2mTKXoA
 UVL9rQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk655-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bb3388703dso917293385a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809722; x=1768414522;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
 b=Hp0yx6/vGln+cq15m3oE0dRUZymy10JboPi/kywsI0wCTGzuQQ3lUqa+bjipugB5L/
 2cyWofcYhOEzh/Ag+lBnkFqK4loTYtv7bAaNlHqVqw9/zmTIluw9A1zdMpZ7l9J31mN6
 K7ybHo6LgmLyVUjxLRL2nF5NTWy4nODUQKtPM3RMB4gM02Q1i2iwAdD8kul7jqA03XPZ
 +8lcbNVKOnmijQgqHkTcZ1gfv32m/bQJ6OrR+5QbILN/jo/O/5WOXah51715mYfMto0A
 EIH6jnLUsAiJ7QJgExBgVl7DHXtVvYvUUopJouul8LJeTtDIFT5Qn9V/9ScGQ2haAHrA
 Xfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809722; x=1768414522;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
 b=tjMEYXw6AZvtEWI41POUJVQVMWeW/Fj6VKkFeXNfb6EtdtWP19C23nHQ5qZ9c3LFD6
 SWGIlxblEtBNShiuUER8MJWMJOCWdGc7BOhBOIBhkuvDohXbL8/VPkGsxHzlEUQCjmac
 GVnsl2KrZzxDX7l/Zs0+jyXZWaQ+9lxNcfudPbJSVk+nUsW+GefdSLbP7EssfmCHnT8L
 bOhKHl2ILFLd3kCpu3oMYWiFFkwox8iVC6QUpeVnep9y9lcWzpS09BQQ9xpthYu3x24C
 JVW0c/lYu2stSKsnk3gvJghM9eJ0OqvPrMsEwlnEZyhw8p9JxJHxhTnd8/2UhuW9en4O
 utaw==
X-Gm-Message-State: AOJu0YxFyrNhRrjPAukEktgh3Rzpimh8roNFeAaPmZr/o2HfEurqAIyg
 leK4qiBxpUS0kJaiUWu4UG0YXxjGxeaNA6hqlUEbYpQXwx+fuoUcnmzEoKny96vkiymr3d01c2G
 p4Phf8sxvc8A8ZFb7zJovm3SP8+6LcYfgh8VLEoI/5gdSkJvBnOTDHLt/uPFp8ZFHUeb0DZk=
X-Gm-Gg: AY/fxX6D0XD9PSGDslGthLqwmdQ6LXrJ/2pm67M8yqraUYbQl6wJuui4WTXrAPDe5G3
 U69dNuZmXz+e5eWQMgAq2iGnbpsG/IFd7qNLDPuhiV3RjPugCBwyxYZFh5VxtKPxSpA/0WAJIqz
 nYzvFjh9FGed3mQGvCFcrVhP+GKBPlV8qtXl5KD+wScivejW0SOwnvuKqgb0QLSV0OL2YWjcxbT
 LBsdcDaTR17XGCG4+1ot7ucMFQfYFDJYZiEkdRIstK1hKPgsH8gLjjmtjbOcIAy7YnV99g0vPNX
 50dAC8pPR7xRSgtlkFVxcUxTou//w65EXF3TiwvqU+eJVHbRh/SyHvF/LGkBtOGzskpYFooIKTp
 JCF7g8kGpJW+UF78gcrU9N/GXKGG+A+HwtywURyBJ0gOP5A8VSVgSdlWVqq6N9sDk5H9huEfvJM
 7RGVb3gp+t3r8J65oJiuUVqO4=
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id
 af79cd13be357-8c38940bc70mr456799285a.67.1767809721990; 
 Wed, 07 Jan 2026 10:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDhZprVBsv7NrDl4r7/stHLp9ske0/9w25bokRbHgFqXeEm1zUot0CQkb+02Aes2IA+aZv+g==
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id
 af79cd13be357-8c38940bc70mr456790785a.67.1767809721391; 
 Wed, 07 Jan 2026 10:15:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:07 +0200
Subject: [PATCH v4 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-10-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKldBKXXeIUEl9VKknThFajiJ4bv/Z+Y6zlU
 AwqJpH32O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1SajB/4k5q4SEw24CrrWC3HEsLlY/uKXgpKUIWzeXnMMyXHDWo7v5tevjX/ai/KZzmbo1NC5fGU
 jhVIocLd7kwuiCUjpW/yVaQGBTAKyovOJsTbYp+V9wBPDqh8cp3VXyONhN+s/zhRGG9gAF2YEzG
 cgchTc/+0JVBdAMG16Sxc4mMOkZGU+Lxks7qJlyhN6XsUcj8iRQG+d9hUkNlBAgdTcMJpMEn0kd
 dkJOKbe+FFOrO2OOH4BNawMbMIU0982lxSIPgb5Q/RKX8LhTdWcg7s3XNn8GfdQLMft8fGlKdXt
 B1XWOTyoPib7k0/IiAyVFTJ9DpbDTMyzhznF9TrmGgOPszSr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXz+v4Ngbrn9rO
 nH5i75d49AsVKY+ZGSztDuNn9WFOJ2d17fmyFSNYqy+4YjM9Etn0+jgQa7CFhzJ54z+fq5YCee5
 yxazD4tycB+m/rgO05ZddRnawzcEjNsr5YKt4+aqJP91V3IphrlDoqWavXzN5HWPicnYwo47bEg
 qMEkHshN+TG5oDbp3jNpHJcDwCmVNsDChZytJCAIUbhYj9fT+SJOHDoRUsuu2YhgS0qdpL4hrot
 60eWF3zrWAN2KF0dZ7C6nD+nRvkbOfdfnI25NCJ+Ux+Skq0ad2uu/uVOevTHKoNgBG01m4mFMxe
 9+Y7dEIGtMGuGn02+h6PFZKHMRbop3nsEkRGVvHL/uwRBGsDSHRoNf7HyCBq11bFHOZDpJxLO8O
 Uo9T7GL7adfA/cEvaeuDaB8KdKLim2GCsri9Shi7goN86jH2Z7t6BLeke1wdH57STJtGri004XK
 A7SycEA9xWGfiACsS4A==
X-Proofpoint-ORIG-GUID: m2c84KcTPPcq7-LSjlxEAM9wQGO-WU8C
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695ea2ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: m2c84KcTPPcq7-LSjlxEAM9wQGO-WU8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
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

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3

