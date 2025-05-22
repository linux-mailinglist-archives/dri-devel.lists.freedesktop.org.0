Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10134AC037B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5895012BF61;
	Thu, 22 May 2025 04:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFCE9010E;
 Thu, 22 May 2025 03:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMwmiZSRjTnajDYWFfhgWlX9ykvbopA9F5sGSYEyEpagSbbY6Hs2bGE3N9MCEkt6S/kYDZtd1D+kzL5ou9hIHq9Ve+HfKFi2FGG/DtMol9/G2CiGBfHtJhAH10Myj9q2FreZm4A8NoDikceVQFkX+V+9tDiO/cg9wM7pRU2LLqBURR5iBYmwh6Lvhs8LtqK35f87CqSDRuT9L+OsHV1cUPkmAPr3o+ISZd/CSULEhns2ZKG7LYMsiTFw3k2YYhQ41h4ggdUeMuuCJEEiW0+fpwv2OlFJKCjE/vzXy0B2sHGDfDBMZH+goDLnhFd+u/9b3MDgaXIX78dnAtAdm4+Gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn1lqW+1XpL2TWwCE++wIy5AgGzhrn8cH/zoEtBffH4=;
 b=kY0LQItcyUCYX8NSYUjlC+kM+dT9TmtJO4d1KATL23OX1v7jtZrJ6+AeTfkkTPinvtFHD6FaLxMzqPKU82MRgm7naSVQDJ65DV++t1CKK+G9jiV0u6QwZxtM0NfxImiY7qIz/Nr1AFTvJu92oN/G+P468luWF5DCKag2B4YCYM+ENASjwR3Iy23yHsBKT0bUtamDl2E7/RjDc3Qpa24I1IFRDvWYcrnmKgndU73L07S/UngmRPN6Oai3/6gAcnYkHTIMDVpZjSguTzATFZesPDdhjJ3DH4l3cVRTN5fZKEzQItS2dbirYrqGC80PVb2bMXG1ZEQcS+TfMdYma+PmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn1lqW+1XpL2TWwCE++wIy5AgGzhrn8cH/zoEtBffH4=;
 b=cWaMYfU4KladVfFxy44v86Ll+cDpb4NOHtogPZ64mROvtuPZGjUbBWU4ild1gRRN1Et8R2dZINeM4YedFgyw9DdDSD26wMZyupECi9x4P8jJVUE7WAouuP0Br7K/nqcuDnn1SpYGUBT8BEq5b75NM9CNkIQGCQDS0zl6h/siMrrUyn4lyngyFVuB804Uwy7lbJz43sAjAQPege7NDv267ODG1vEr9Kw7wLG17ZwkXTFcMPzEey4EDtHwlWfSmkfbNyC8bbHF9PMrnhr/4wpklmjyfMdXTZtyHK50/LBAVT+xFAZs2nsmzUVfO0Hb0PxKofyVkCi/h5ZpskeO1hhO+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8097.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 03:19:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 03:19:01 +0000
Message-ID: <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
Date: Thu, 22 May 2025 11:20:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin
 <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250521162216.79dd3290@booty>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a96a2a8-9dd9-4a29-662f-08dd98df6634
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUU4MVNFb05NVVdscXQzV09rblplWFJHL2lRN1hiVC9JQnNCelpPYnU2Tmc4?=
 =?utf-8?B?eThLZzRDdUhkdG8yUkRXYUVHYTNwTnYzbGRCM2xaa0NtaVNPV0tYdVV0M3FN?=
 =?utf-8?B?Vm5GVUgwWGFCa1RsYVhvVDJsTEsrTGpsNkRQUHcwcXBRUHYwRVFLN0E1Z2VZ?=
 =?utf-8?B?MkJsYmxlNWk3QmxyelRNKy9VVEhTZnB5N09LRVBuVEJmV1k1eGRVUnFXU012?=
 =?utf-8?B?aUNwU3A1clRtcVo1SlFxOXNPbFk4NThjRDh5RDVhdzFGaFJYNm0zNnowVkJO?=
 =?utf-8?B?cHlPREZGMjRPOTV3Z29EZlBiNlQ2RU1ZUmtaM2d0VW9PS3dJUm9aaElNcXdW?=
 =?utf-8?B?SkRFTUI1R25xMVNUOHEybHpwZk05QlBxbmtob1JLWHdWTFlhK2kyMDdXbWx3?=
 =?utf-8?B?YWFiazFsQy9rbi81RExNM0FmYi9oQUJwMThSUDBka25HMzBDZ2JKWGp6bklv?=
 =?utf-8?B?bzRPWnZldEF2WENTR2NUNGNRdlhid0svU1ZFa1lTWXpZRnFBNFpDaTkwcFV5?=
 =?utf-8?B?a2RrMytXZGFrbXcrZVdpVldOZWk3elBHa1VCU1h3a0M1VUtCdUZFaUZiMGIr?=
 =?utf-8?B?Z3U3d2JwbEtTSmVpNmp6UGoyc2N3M1d1RXE0eVFob3dwNGhBVzU2ZndBRFRi?=
 =?utf-8?B?NCtDWVdpKzZmbWszeDExVGQ0NmxXUitnN042eHVmdS9NV0h1V3NmOWdzZ2tK?=
 =?utf-8?B?aUJoUHFhTExlWmMycWN3MFhMcHNORWVaVGtHT2UzWlRQTTZxaWFIVThpdXEz?=
 =?utf-8?B?SmxFNzBBSE5vajhZNG5Wd1pwUU9sZ2VBV2dVRHZ5THlMclBmbVhPdmJjZGRy?=
 =?utf-8?B?ZmtoMlpzVUl0SXBmZ1haeEJhbytpN2s3VnY0dE5HdWs5akJPSHZ1cnE5U1Ez?=
 =?utf-8?B?clhhRmJXdDV3NjJRK2o4WGFUSlE0RUhLaitEKzNSMVBKWENVUVJNQk9JNEJ1?=
 =?utf-8?B?MmZwL2NFK0NDOThvaEE0VnhORHpFbXArMHdOWW1VZUNFWjcwVmhNYnJncS9L?=
 =?utf-8?B?aFEvMDF3K3BXKzMzSzFZZXFDam1hNUpuUVV6Wjh3NDNCOC9vajlTSVFKU09O?=
 =?utf-8?B?c28rU0JXTVlST3VtTjVZQWQzQytLZmVhL3c2K0kzV3pyOWNzblBCUXhOU3hs?=
 =?utf-8?B?NlhZVDFGeW44aHhaTndBZWJkQlE3Sm9qaFBXN2VYdzFDUjFUeUo2ZG81OXdX?=
 =?utf-8?B?bE9tNU9jaGFINFBmRjdnNzYxNXhlYnhTcDRQWVI4TW1LMXRvSWc3Rk1MVUVi?=
 =?utf-8?B?UDZwRkhaQmZVTm96dkg5SUdmSGJUT2Y1WkhhL0R1bEl5RkxTSEtqd0hwOGRa?=
 =?utf-8?B?S3hkaVlFMHpUZXNsTXZua0diakIvbGkvZGg1eXJySWxyb0I5eERBZEFGOFB0?=
 =?utf-8?B?MEJqNnV3SmVVRE1McUR0Q3VZeEZhbE5LNE1ydk1SdEEzRDRYZTc3RkZtVDVV?=
 =?utf-8?B?S2RqQ2JSZHJ1NS9sOWlFRWlWQ2xEdjRGTGZXRzk2ejRYV1kxT2pVenEzc0Uw?=
 =?utf-8?B?bGQ3L0NLUXo1Z3liNjl0ZUhDSExIY2cvOURsb3FUajJIL2hiZ0U0QXVGcHNj?=
 =?utf-8?B?UEovcnBVTXFBMVg5TmtIWTZRTzNVVVJCdk1idSs5eS9FRUI1dEhIS1U2LzF0?=
 =?utf-8?B?QzJ2b3BwaXFUYkpCem1rMURYbmNqSkN6RU9PdWJwbEt4RTB6OUVLM0IvNmow?=
 =?utf-8?B?WlVIQjJiaTltM1ZIblBhSk1OVGk2Rm1WK1Z6Y0RyT21VeW9EV0JjenFZckF0?=
 =?utf-8?B?WmxNb3A5NE02dzk3TlFXQkFIQ05JR0Z5c1ZWNDZScll5ckhNWnVBTUxlSlZa?=
 =?utf-8?B?akw2b1FrR3FibHFSUUloUEM4NkRwdW44UDFGdmRYaXpodDdBTEphRFFDSDVH?=
 =?utf-8?B?Q1FlOGVEdDJiSHIzNStCT3ZCanAvZGFHVW1xOGx4ZlRuRWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampJM3hXWndyL2tMNmlNNUNxblVlTlYyQUh5STlCeU9xRVh3b2YrbDIxQ014?=
 =?utf-8?B?K3QyV2lyU2tmaXY5UVphenYyMnJob1J5Ukg0N2dCczYxa0JNT29YcGZlVnV1?=
 =?utf-8?B?OCsvY3oyb1NUYzFxbW5nTFR0bHQ3SDE4WkxBeG1CR0lDNzVIMnA5U21UZEFW?=
 =?utf-8?B?Sk14Y1Jkb1pnOFNKYmYyZ3lhQlo0bWxJcUZtY0hMbUwxLzJIeHdoSEp1TlJ6?=
 =?utf-8?B?VHJ0RmphSGtvQ1BlWE9uSm5ySGRLaWVrVWx1Z2JYRldqOGJVVFA3N0p5MFhE?=
 =?utf-8?B?TkdjL1Q3ZExZa055VDZmaldhUTUyNmZML2tOVWJraVV3UXV3V1lzMXRaSDl4?=
 =?utf-8?B?VFM4R29pbXZLekg4TkdyMXR0a0o3L0hVMDNMUGJGZG1EUVdSV0xOQU8zcHhV?=
 =?utf-8?B?Y2lRTWl0ODRXQ3JjZEJEMmRVQkN2UzhWUDV1Q00yejJDWDZubEZxcnBTWi9E?=
 =?utf-8?B?OXpLMU9ZeXdqMzVnMVoyclBBM3dndTludDUrZkFBZm8yeEs2QUhINGFEcnNL?=
 =?utf-8?B?cys4c1IvTEd6UHlpRzdUc2ladzEwNk02RVZBK1BVMkZwekFTK1h2VzhoKzNE?=
 =?utf-8?B?eDF5RCtVSVhyTHFXMktBTGtRemZQTDVOdnJzbFVYQ2dTc3RzK0xiRC9FS0ty?=
 =?utf-8?B?c0dJSXpZK1JZbnUzbjlXTzFyd3AwL0tEK0YxOTQ4N2phRkhZVnJHV2E0RWkz?=
 =?utf-8?B?K3kzRWVBa1d1bWRJbXVoTFlkWW5oMXJWcEJtSy9QVzI0dlBvQk82ZmtKSEds?=
 =?utf-8?B?OThNZ1hXUjdrb3JaVVE5T0ZUOEhUQUdqVzFHSXNNbG1jc1h1RURzWlE4Q0Iw?=
 =?utf-8?B?aVluL05MQnpId0VqQWpJUGw4N0xQSHovcXp0bVJCV3VOYTUrUjN4Z280c2FE?=
 =?utf-8?B?bkFZbE56a1MwTCtFOWp5cnZHNnZjR0t3QnNRTngxR1J3bEVtZUoraFRiV0lC?=
 =?utf-8?B?bEhoYnlpYzBtd2h5eU9ibEJPdlpiWWVwUmI2MnlhSm9BTWV5c0Riazc1U0kv?=
 =?utf-8?B?L0pKNFJWaEZ1YXhlMno2ak5YMmppMWxReWhYQ3JhemJOYWM3TEp0OVlWeDdH?=
 =?utf-8?B?UCtTNGI1MkFrVEljcXFMN3plcTJQdFQ0QWRoWWc1NjhTMTBIeDJsYzZCVzR2?=
 =?utf-8?B?dVBsdjVXb1RwWW1LQ3FVc2RsT2lGdDc5ZmRnd214aW5XOUF0RzJvUDlRcUlO?=
 =?utf-8?B?SnFtK0UrVGV5L3ZtVk1KNkhPUS9SbnVTU2ZPSFhyK0dDM0haTXZ1S2k4d2NF?=
 =?utf-8?B?RnVDb3NJS0RzcWNwcW12eURXSkJKaFEybjlLRW9KVGJ2ejVQdEo5SmZyRnBQ?=
 =?utf-8?B?WWxLNHFXZXR4dVlIVGJVbTlob05oelp2Q21DR01nSmhoMUdLaGVNaW9NU1BW?=
 =?utf-8?B?ZFV1cUIvWEgwcE9DUVpxNHBXNUM2SGMyeDc1bXNYK0sxZHY2Tmo3MWRvaXEx?=
 =?utf-8?B?eHZoTHZLQ1V0MVl1aHYzdytvRGpZVXVQdDJqTHVVUGxta0JBYytsODd6OEpi?=
 =?utf-8?B?RjFkeDE4RzBOS3UxRCs2TzNFZzlyNWJEblVhRklzQVloZmpVb0V0Q0lkek50?=
 =?utf-8?B?TUcyWU5nVERoMEJhVWswbWNhNzFzeU5LZEhFaXNlMmgrazJhL2xiejdwWjZH?=
 =?utf-8?B?L1ltcUtNVTlTSUxJNTF3MUVJdDRFQnpwZlBpLzk2aElYa0hSQlNOZnI3WUY3?=
 =?utf-8?B?SGREZFpnK1JjekR6YWUvTnpESlZFcHpZcHdYYnVoTkVWZExFMERZbHVtNi8y?=
 =?utf-8?B?ckwwTmNSSDVCODZEcXNMaVpQTzQ4UEVDa2pRUVVKYkdDSkNQQXV5OHkxYXd2?=
 =?utf-8?B?Zlk2NzJhMlNhRlNocmZXMWptbEU3alhWSmRHMmc2ZWVpWVlralU4c2NvZHRK?=
 =?utf-8?B?bGs4M0R3YXQvd0ZxUHJPWHhMOWY0M1c2V1FCNTZIK2hZL1R2Y2drdG5qcVhj?=
 =?utf-8?B?dkpYQ0ZzZjczOEZRampVUW1zLzZxVkFjWjAzVmxtQS9xMFFjVXNROXgvMkx2?=
 =?utf-8?B?dVV1OHIwOU9IVWtHZHJ2QldIQTFBMW9zY3NGUlNkRGxlY1BYbXcyb1RzRFBl?=
 =?utf-8?B?R0kxL3BoRnE0TUswTU9rSlNuTTU2UEV2OW83K1lnRStCQnQzWURSVHNiY0k4?=
 =?utf-8?Q?hBpVouvfbZ3mzE7UpEaRn35zR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a96a2a8-9dd9-4a29-662f-08dd98df6634
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 03:19:01.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5syaNmxZRb7Up0NH9MN/uy19cHTpw3Is1kKlwm76rHtkJ05pgyp+tGl2WWCKJfWHWX6Urv/OcJ7SNiqjEbnMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8097
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

On 05/21/2025, Luca Ceresoli wrote:
> Hello Maxime, Shawn, Liu, all,
> 
> On Fri, 09 May 2025 15:53:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
>> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
>> bridge, and the only one supported from now on. It is the first milestone
>> towards removal of bridges from a still existing DRM pipeline without
>> use-after-free.
> 
> I applied on drm-misc-next patches 3-17,20-21 as they match all the
> criteria:
>  - At least a Acked-by (or R-by maintainers)
>  - patch is for drm-misc
> 
> Being my very first commits to drm-misc, I tried to be careful, and
> double checked all the patches with Louis (thanks!).
> 
> Here are the pending questions and plan for the remaining patches.
> 
>>       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
> 
> This reverts the commit applied my mistake:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b43b025bce6d790d3c79f4518
> 
> Neither the  original patch nor the revert has been reviewed/acked.
> 
> As the commit was a mistake, I'm applying the revert by the end of this
> week (i.e. on Friday) unless there are better instructions.
> 
>>       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API
> 
> This patch affects multiple drivers. Running get_maintainers.pl
> points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> this looks like due to the 'N:' line in:
> 
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:	Shawn Guo <shawnguo@kernel.org>
> M:	Sascha Hauer <s.hauer@pengutronix.de>
> R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> ...
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> N:	imx
> ...
> 
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L2511-2528)
> 
> Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> file that is touched by the patch. That regexp appears overly generic to me.
> 
> Shawn, can it be fixed by making it less generic?
> 
> If not, can we at least add a band-aid 'X:' entry for
> drivers/gpu/drm/bridge/imx?
> 
> I think the other matching entry is the one to consider:
> 
> DRM DRIVERS FOR FREESCALE IMX BRIDGE
> M:	Liu Ying <victor.liu@nxp.com>
> L:	dri-devel@lists.freedesktop.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> F:	drivers/gpu/drm/bridge/imx/
> 
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L7940-7948)
> 
> However it does not list any trees. I _guess_ drm-misc applies here as
> a fallback as well as common sense.
> 
> Liu, should this entry have a 'T:' line for drm/misc?

These bridge drivers also don't have a 'T:' line:

DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
LONTIUM LT8912B MIPI TO HDMI BRIDGE
MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER

I think that they fallback to drm-misc since "DRM DRIVERS FOR BRIDGE CHIPS"
covers them.  I don't have strong opinion on adding a "T" line to them, at
least to "DRM DRIVERS FOR FREESCALE IMX BRIDGE".  Anyway, it would be good
to know comments from maintainers for "DRM DRIVERS FOR BRIDGE CHIPS" and
"DRM DRIVERS".

> 
>>       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
> 
> Not acked/reviewed, some discussion happened. I am resending it in v4,
> possibly with updates based on the discussion.

I still think the main structures in imx8qxp-pixel-combiner.c and imx*-ldb.c
should have the same lifetime with the allocated bridges.  I added a new
comment on this driver in v2 just now.

> 
> But it has the same issue discussed above, with get_maintiners.pl
> pointing at Shawn Guo's tree, so in the future I'm assuming this goes
> to drm-misc unless there are news about that.
> 
>>       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
> 
> No feedback, resending in v4.
> 
>>       drm/todo: add entry to remove devm_drm_put_bridge()
> 
> This involves documentation maintained on another tree. Where should it
> be applied? There are two matching entries in MAINTAINERS:
> 
>  * DRM DRIVERS -> the drm tree
>  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
> 
> To me it looks like the second is obviously the closest match as we are
> dealing with DRM bridges, so I'm applying this as well on Friday unless
> there are better instructions.
> 
> Best regards,
> Luca
> 

-- 
Regards,
Liu Ying
