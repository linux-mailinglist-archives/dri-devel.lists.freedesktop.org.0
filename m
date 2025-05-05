Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF3AA9296
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672510E3DF;
	Mon,  5 May 2025 11:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzwHVUWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BE310E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:59:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Boiu5031014
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=; b=IzwHVUWjTSN2aTmN
 0IPLo//J+Zxdxh8FtBA8UKJ7kvNC6g+mk1Nyx6JgENgjB7iSAWdxaJe0sbw/06Yx
 rI0moqbfIK7VFeEzrfag5tOCxAtPLGtRISnnrU3EugHQbuhuTQ1mLn3Qo9ujWUvy
 fLWLGqdXGl1rq9M9oukIM0trKrsS9nx9J8rSek+aOFY11cmZ7bwh/xlxKMwI8ME0
 XZwDaJgrzDkUw3ksftk4vxB6U2C162O2dy0nV66qHrYinprt9IRxBdaiAyl1MUWx
 BJ6yPf5iJzQmpNkxalDBL/TejWUfJFCxnAFOX2Jvul5ILCohX2ayaf4tIxsw5iUu
 QL/3Aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5c05k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 11:59:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990721so29323085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 04:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746446345; x=1747051145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=;
 b=I/eL/TNvB/hSybWuTt57vgUA7rxJ/zsIHcz0BHW64a/1kIk5e6rq+QdozmopJM+TgW
 cmo6gsCWx+ezcoF8RK7/Kzu6/YH2s4DHjppSGZwawx2n9HMyAnvH3+IP/1/NS4V44AUz
 mUvNS7GLKKvJlZFPiqZaTU5tOxAemI0gzmJlAPZuJQZTz8Y9et2N38dAMb4EzJavj4gw
 oxAutMGQE7l5blmLUVXX+O8ZiBNS61R2oADfRUwqZQe/lvBL6aQys+rOJLhMAEygCEJi
 oa4OG9dJZOyyeZPFTqgn6nYi+mp0rT5En4A0pLXehWVWoyCqVMT7xvuiHA0FL17WBmW6
 ALrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn34iG7FX3kWmvG+tCJ4NOfb72qMRz+ZAAzZHvh1EBY9jvvaOqlc06rxN2cpKsNqTC/NeC5qolen4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqyGo0nciIHykYBLapxqMZ3eUb6+qAK606slZw5MagIHN7sv6K
 YqetImZlidJv9spqFBSXTRVEWD/74s5+xCURdLSAHcsQDOh5nqN2vLjPt5KOxqNSSGEVZYfa+F8
 pmD0Y34NtmjpR/GS9KFZyJWoxCJxJ4CT27+lWXVSDdfgOJvlYk6S5wZNDZ0N7jApBJQ0=
X-Gm-Gg: ASbGnctdv8sdVOw9XaT4a3CmSoepelkfqNjT1A8hfAK/+KO2BaWgFKDjz+0nAIj/XN4
 hdTNKpjisvAdbI/5bw5ATTn9iMRQsvW0W14pC3Q/jOA6H7F3wl4mTlgVPTz2iFdomljARLHeuVG
 0PDtvYkDNmcpGlR2wxWAjfSJiCgw/Ji0hVovXK8Bhv3Ph7JzuKYmU3jswlvpzq0zHl594Wic6jQ
 gWrONMnGVip7Zu7jrCreD196Gc7IF7LVN7WtlMPk+a08/4ResL+BQTCj4NSUDJQM9p1NMQAYUUO
 /D7fAyklfJlntpNeKCz3DepXrenwEouQ9APiARhK9xjgz6GnzQaUaVSdiVNHfGByHRog7bYfxJR
 LLwhKvtcl5RYlqTZMCnInzbBXafVmWOvFMTiqP7G3sslzSwX/YeEhSQpA6M0CUm/QNHly
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id
 af79cd13be357-7cae3b1604amr1093375385a.51.1746446344985; 
 Mon, 05 May 2025 04:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxsMcGBcuXzdzsMZLmfG4jCCth/aIBhqNnJlAxtHNCdoHctJUXgi2+jH+zw6iGwmYPEzBLZg==
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id
 af79cd13be357-7cae3b1604amr1093364085a.51.1746446344392; 
 Mon, 05 May 2025 04:59:04 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:aca9:2ffd:84bc:ddc5?
 (2001-14bb-671-42db-aca9-2ffd-84bc-ddc5.rev.dnainternet.fi.
 [2001:14bb:671:42db:aca9:2ffd:84bc:ddc5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c8d40sm1695574e87.98.2025.05.05.04.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 04:59:03 -0700 (PDT)
Message-ID: <9afd098c-edd3-44fa-8efe-99f2e9c9a525@oss.qualcomm.com>
Date: Mon, 5 May 2025 14:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Adam Ford <aford173@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Herve Codina
 <herve.codina@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
 <20250430-arrogant-marmoset-of-justice-92ced3@houat>
 <20250505130648.22ec8716@booty>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250505130648.22ec8716@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rLHVbODIDq-skfP0CJlphHXaB_Zl021O
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6818a80a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=H8qqLt0gxxJlsNWwv3EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: rLHVbODIDq-skfP0CJlphHXaB_Zl021O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNCBTYWx0ZWRfX7fhsOxBmEKI0
 KYSK1VbPC+23NF55EVXF7rk1JyC1YwdzhHEx7d7xZ4N/ZwszgmkVIjyIkEQHCPSp+QqVUX6QO7F
 rnQch7QMM0SbwR9gWCmcKYla/labfLLcakr16DZzFWTpYcp+yFYhQHw6PuqjBm+FL2H86wZgoii
 RLlTnuQLLmOT/GMBU2Qls9oeg8+UToVQI/JsblWjlhB3RDOIb5Y6095B5fN4uUBbKUIEknoL2q2
 clR8KFkPObzL4Bnam3Oa2dht5gqyAjK4lMZveiQl7fFoFNxw0EtpRFllDbopTdMBfJDAYhdDlMZ
 w2JWBxkvhA8Qg8kFt+Dw3IofI3DULp13xE0sLIlRlKQ1rXrxKsrsIgH8Jv2T5S0Qx1oqMo1+VEh
 M/a5HDD3V9xXzb60iKjlaGa7bxl3I4s5TRefPNnqVQkSkKROHZZvqAR7j7LiLLbGfTuKg1Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050114
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

On 05/05/2025 14:06, Luca Ceresoli wrote:
> Inki, Kyungmin, Seung-Woo, Alim,
> 
> On Wed, 30 Apr 2025 10:08:14 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
>> Inki, Kyungmin, Seung-Woo, sorry for the mishap. Do you agree with the
>> following patch, and it going through drm-misc?
>>
>> https://lore.kernel.org/dri-devel/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
>>
>> If not, we'll revert.
> 
> Did you have a chance to have a look at the patch mentioned by Maxime?
> 
> It was applied to drm-misc-next by mistake. Not your mistake of course,
> but now it's there so if you don't reply anything it will have to be
> reverted, and then sent again to go through all the review process to
> be hopefully re-applied in the future.
> 
> If you agree with keeping it in drm-misc-next, that would be less noise
> for everybody.
> 
> I'm going to send v3 very soon, so it would be good to decide what to
> do before that.

For the record: even though I'm not happy with msm-related patches going 
through drm-misc without additional ack from our side, I think reverting 
those and reapplying them later will create a bigger mess. So, I'm fine 
with keeping drm/msm/* bridged patches in.

-- 
With best wishes
Dmitry
