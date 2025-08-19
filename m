Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC7B2CC91
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BD610E653;
	Tue, 19 Aug 2025 18:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="REYuRK7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903E510E662
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHd5Fw030474
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=REYuRK7LpEaB1jrr
 Ps4bdB3jWVAoC4qC190kXkBmvfnqG6tuHQ5TkcYMSpo889j3DVi5EwJkdvGlgiLO
 tUZcMwpnap8pvBftk7CBGDXOo0Z3CBKI0fqwIT6IJ3UgCCM85AP9SYuaFgCTy1n6
 +pGK5/X9/bbSZdE5KdmSLXVHyJIdM0+CrlfiOTvP0VOmAYwjJMwi3gWOTrjT+O+o
 O4oSIuZTJxrGsokxzPk3IJ3fqG2vPApZEoTtZafmoLNpIORV6S7NilvqzGHbLVC8
 wE6NcKfhj8gpllgVo4BjXC3KkTcbZunp6iqHM9bwQZxN2wjMIr2ltLv5r0ToBMII
 wAVHVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwweb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88de16c0so129312526d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629869; x=1756234669;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
 b=A9i8TOB6iuJlGUJs0Sla9syNSwjEWCwirOJgJhRJUBTVrXNHc5FSOhVtNeSVB80agx
 b+Jh8JsH5QFn374jzROyuQHmSJ/Kmax+NzOKc0mFJ6w67IjkACnWW5MsK/oaGc1B8je1
 I90MJqU7D9Rnig4ai4bd4a/ufOzlFJZ5V7Y9yJhGn8BwPBsgLNLejyDuIGnQzJBzFnRN
 MkWl6SA4Hf55sQB//wgWsr0nUunExqQ+BFR1fLvLjNRVorOWXuDXu3lC1vaVupuVawcQ
 rrcExiy4ay1d2u4V6wt/NxNlINJgr4URb0GoaMxYv/hEOsXZhIU9XqIQAyIzvdlRPSIG
 bkXg==
X-Gm-Message-State: AOJu0YwCXmVFD4Y9yPOZasmX/0oOyqf3wJW8FixQ+4ZNNjXE5PiHdzzN
 DsBOJQpWsbbgVtu7q9I31mnAZAKxBYeMTon/MKCvc+ud/OKK7uVO2356S4nOQu8S6zpLxq4enm7
 5wTt2w8fFwn0xjK5/1Gtq35CSB9cs0rz0zw0GerB5lZTcbpny34hP5yKHjVvITTMaMax/OWE=
X-Gm-Gg: ASbGnctv4tDFfYzgE5UuGLFuTdYqwvWfxZMcRUpPxtSk6mjR4sLUq+1BjE0Of70TYTF
 1Zv4SCkdkhKreKGcL52rCpiU0skvc4h+JYWxABYwe7LM489A/j3jHQWKGbrgZNkRWBnvrzMS+UZ
 jpABlMTZVdgUNsCAVMWvCz7SmO95WiPAOEfwj+L6SOvV6GW1lHCO+xlQNeypMm1qOso4BfEqn+L
 57y7iuzED5ORuMHL9NrR0dYkWNxxDdiaOkKE8EsO/AmGGZKznfw4UaXFBwBkDAVO9ldLjOf2Jsp
 Kz23gh1GKJAE0DDHyoqbJfzk9MgfnVQ3H6fSNofZzJBI7+rX+qnimzF/xvuA3pxvQIpG0mYRYlB
 +dUCzzYUw2mNhZSfuHWfTN4Q5Xf3BU+mKU2+zGgua5AT2PJl22u0z
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id
 6a1803df08f44-70d76f5bc39mr1350746d6.5.1755629868715; 
 Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Rup7AhSw4BJ9NwhIDAaqvNpzhK90eK4MaobbpgThtVtwvxC7zzjZweXs4ATCoIwbiBFBpw==
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id
 6a1803df08f44-70d76f5bc39mr1350296d6.5.1755629868153; 
 Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:36 +0300
Subject: [PATCH v2 7/8] drm/rockchip: rk3066: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-7-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcSLkRBvL0pMwSNLmEAMo80IQ6eKzuBYdmQ
 c/Ssrh2nvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UjBB/0bEDK9goN07vzlvUrx4/uSf/QCLfLAHGPDaDSCPqe7Wl54y4kNyRCy+aLt4LJ3bP6rTlB
 8etPp+lpeftFkzYybXjLoha1F8bnExHGkttCagiyw/qETQUEea62dP6vYL+vczmXkKuzax9ChhS
 4njNZ0Bqe+i226T9H1brFHCpfAvuenLiOkFeu21UGrpXDSa6KvlzbniugRK53i7qR0MA1fdDfwu
 drLueW09uFn5fxOhbe2nFGWXm1I6T2bscZ1qs0XFtT+YcT9AeGuMmIXvMzaJ5Wd87o4kQzA4qQi
 /zKuVtV3uKZfeat3nHuFrrUfMmgch27HUc/CFJvruhmgfCS9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g4gM3mlJ3l7yJv3eqcqH7bP_exjNu1d9
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c92d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX2IBwr9q0EUxX
 wYWxiHzWzL3vv/3ooXB2Nvrlloroj9B20q41vTe6TOx779qRhmGg6xzxnYi0TXcKnqdKw3jdMxI
 yyEFrWYWYBIt71xLphks5X2unEyuErEUt+IsqPD4vHHnsREsfIJJTThEpvbPbTqUlDBuv1xtU1E
 64s01UgFpFTso3MUKAjCIwZjxnAxCsw7BLFCt8ZA+GaiNFHokeaaf8jyGKFbrk/nxVyFSmVEadH
 /hIZbFTc1SBzG8BqUC2NaSA6uiBh2b4BuUuMdRXNDQXEKlRtE/wPPDymeh1E53ga6+pX7QWhcGH
 snAvtBgPPdXySX31C7xRLO0IRjLppQa5jCg4cu2Gp9IXyiJL6NQQWrFxYVcRYwrHnYqUoGUiZyq
 h7B71F83
X-Proofpoint-ORIG-GUID: g4gM3mlJ3l7yJv3eqcqH7bP_exjNu1d9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..75bf9a13d8cde1471e8b7e8a8f5f4c0457dd0a14 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

