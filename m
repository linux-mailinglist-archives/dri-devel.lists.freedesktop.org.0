Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8BB388C2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 19:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D243510E0F6;
	Wed, 27 Aug 2025 17:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYQoa5Tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E364C10E178
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 17:40:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGjJPW030124
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 17:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9pryiKbesf4KLCmykOzJgOnqNMnr4CU7A7f1EXmgKk4=; b=aYQoa5Tqtc2tN8AL
 iq3IQTavdCc6+N80wDp9/1ryQ6rtURE8hJYJ1JEf8GeMDt8Z57Ye+hrSjWGiS71g
 dhTRly7ADDiCbZ+3yuhupKzFgyym6AZwAcOPdPXs4ELX8pirZMJET9j7BYqPdz6F
 ZDY3xCJRWorp+AKCGAuCK09e4laJy4I4REdEF1KxFyiaKUObIG+jnZSoOJ8hsS/P
 20/Lf4vNVU0EKTh1RpsR1NuG7UbcbDM0y4LlPFN3ItahZrHzGcEe80H5Dqu1duk/
 fYwIxae0xwk6pCPszhHTrzdgVA9KKBlKZFlMQ3qfiDI1b8OwiDD7D9G8+1hGmZRi
 jBWi7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unwany-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 17:40:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109ad4998so3191411cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756316454; x=1756921254;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9pryiKbesf4KLCmykOzJgOnqNMnr4CU7A7f1EXmgKk4=;
 b=IWWpWsUOHK/DDsmEXXiVwGEx40NZGIpKxHOr1FZA0wtQbXx6zFJ2UXUTmkOwx9mDAQ
 gTfEnujuj3a85PVzGyjzRgrNmRgbt6ShWPx5wfitDcXW+1ZTzOvqZ5VaG3o8U+9EIyrQ
 h7dZ2zs7YtwpSytsxca32EdPwL3uDSovODlmTDdPzgLAOiOsGz2zLYjsirAWTLn3n9ke
 c9pQVGTu4HkJwySSM9H4y7CXGPRfCgSeETjWenleKqOI8Ht1ravG3z6TgKS1RxW/WsDP
 rlknVYNkdD6nZcsiyOK0ENXKTkGOOfjt3Ugolt4jJ6g5YcOB5Xiu1SGXzpclx9klAYXr
 DTVQ==
X-Gm-Message-State: AOJu0YzuEEeyE3IojTEutfpsUCjd7NO33AiTJpGdT1edCjwCDKkUgQyr
 lBYGs2OJ+WV9Y5cNI6fPMWimr8Upb4vBYCMt/cvzrKqG9xBc9gLi8nwBjgspfl3jmAzH0WbZIY0
 4LJb7MaLXdjWUZNyHh2GXqKU2h4cocgn+xo7QKPgVTEmnG2JW5XLCV+8Qgim5x5KWC9+9FaM=
X-Gm-Gg: ASbGncvAbmp+cY0Ah7GBxrdmulWKeBnatBxOVSsWuT1uQANtaR2P15HL454LPlQltNJ
 wVrqjnbCqdvwWe+JD6977ESmXdDvApoG5f6qzShWmVd0l4kHoD4b05RBVjR4NGH6MhUswh7RtoL
 +9cxrExNF32bpQxcGhErbW50xdOAoeuE0wmaqb5/G3fLv7FxldehuOzyABs0UIlV6BLeCnLxcCJ
 39WapoOJDF9aKsHdUak8Dv76xX4lQOJmxcDY4kU3Jyub1evtU87hTTyB4TMgdJZqJT8uMIrbXnk
 WADNMvYSxU+a1EErypdadsG8zksCfpdWl74kz58k+ayLvvONqull9nG7hBdxaY+AvWKNYB5mP8i
 Ur5mqCsR6JinkBNwUF3MYbA==
X-Received: by 2002:a05:6214:27c1:b0:70b:5320:d416 with SMTP id
 6a1803df08f44-70d970cd29fmr238271776d6.14.1756316453931; 
 Wed, 27 Aug 2025 10:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhCi0u3Z5H0bwldj3p8+1IvfpKHSh571vUpFu3K1OKrspl//SOwGcmP4Yk4ANptZX5dCndsg==
X-Received: by 2002:a05:6214:27c1:b0:70b:5320:d416 with SMTP id
 6a1803df08f44-70d970cd29fmr238270536d6.14.1756316452731; 
 Wed, 27 Aug 2025 10:40:52 -0700 (PDT)
Received: from ehlo.thunderbird.net (85-76-46-56-nat.elisa-mobile.fi.
 [85.76.46.56]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5aa917sm28124531fa.41.2025.08.27.10.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 10:40:50 -0700 (PDT)
Date: Wed, 27 Aug 2025 20:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_01/39=5D_drm/atomic=3A_Make_drm=5Fatomic?=
 =?US-ASCII?Q?=5Fget=5Fconnector=5Fstate=28=29_early_return_consistent?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
Message-ID: <BBD9E72B-B1B6-4072-A465-68204879684C@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dC1LD_Z_F530zeHdLU9EtvgVgprdnwpM
X-Proofpoint-ORIG-GUID: dC1LD_Z_F530zeHdLU9EtvgVgprdnwpM
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68af4326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ntis2/2Y3p1p47GkerkPQg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=puQWGBksFvoA:10 a=VwQbUJbxAAAA:8
 a=V78A4Cvkybgf4icwE48A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX716Ee9erCxUj
 SODxHiW2jWouwgbmHnTNi3CgzVX95IiP5IuQldzP6gwuvyGw8HVASbroaMdCVI6AvTRk0QxWAh6
 kcAXDQW5MFn0doDM1Zv1hrcQ8T6iQBYjsQGUukkfmMNkMG0tIbbcVBA0ey1DW11H2iF72bq5rQL
 1lEd6jd0YlAUNqWh0X1CcVrcBXJpS/8oZ6nWvy57JwEIDhcbjEw05RvJ1NYc8kgpqHstmZ/vQCx
 CC3rJcVB6BiLFV9qhB94cvAuE4sxsDT+S9P4yHFNWJaQAGJ7dqxYp4UIaMd672bDeRCXrgq+K9p
 K25ZHX48qSo1QQckcEkOwjFFcCslxFqZP9PqJXuFObZs0El5RsnTdx1QdBcxe5zpgg5EHhertLK
 JJyyI8H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

On 25 August 2025 16=2E43=2E06 EEST, Maxime Ripard <mripard@kernel=2Eorg> w=
rote:
>The drm_atomic_get_connector_state() tries to lookup if a connector
>state was already allocated in the global state to return early if it
>was the case=2E drm_atomic_get_plane_state() and
>drm_atomic_get_crtc_state() behave similarly=2E
>
>However, and unlike the other two, drm_atomic_get_connector_state() will
>do that lookup after having called drm_modeset_lock(), when the others
>will do it before=2E
>
>Let's move the early return before the lock to make it consistent=2E
>
>Signed-off-by: Maxime Ripard <mripard@kernel=2Eorg>
>---
> drivers/gpu/drm/drm_atomic=2Ec | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_atomic=2Ec b/drivers/gpu/drm/drm_atomic=
=2Ec
>index cd15cf52f0c9144711da5879da57884674aea9e4=2E=2Efe21f154e0fa030f85fb3=
d6d35e2684adcf36e26 100644
>--- a/drivers/gpu/drm/drm_atomic=2Ec
>+++ b/drivers/gpu/drm/drm_atomic=2Ec
>@@ -1128,10 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_=
state *state,
> 	struct drm_mode_config *config =3D &connector->dev->mode_config;
> 	struct drm_connector_state *connector_state;
>=20
> 	WARN_ON(!state->acquire_ctx);
>=20
>+	if (state->connectors[index]=2Estate)
>+		return state->connectors[index]=2Estate;

Unlike other DRM objects, connectors are dynamic=2E There is no guarantee =
that at this point this array entry exists and it's valid=2E You might be t=
ampering with the unallocated memory=2E

>+
> 	ret =3D drm_modeset_lock(&config->connection_mutex, state->acquire_ctx)=
;
> 	if (ret)
> 		return ERR_PTR(ret);
>=20
> 	index =3D drm_connector_index(connector);
>@@ -1150,13 +1153,10 @@ drm_atomic_get_connector_state(struct drm_atomic_=
state *state,
> 		       sizeof(*state->connectors) * (alloc - state->num_connector));
>=20
> 		state->num_connector =3D alloc;
> 	}
>=20
>-	if (state->connectors[index]=2Estate)
>-		return state->connectors[index]=2Estate;
>-
> 	connector_state =3D connector->funcs->atomic_duplicate_state(connector)=
;
> 	if (!connector_state)
> 		return ERR_PTR(-ENOMEM);
>=20
> 	drm_connector_get(connector);
>


With best wishes=20
Dmitry
