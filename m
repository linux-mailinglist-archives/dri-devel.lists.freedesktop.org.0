Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720E31E631
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 07:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C136E23F;
	Thu, 18 Feb 2021 06:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2123.outbound.protection.outlook.com [40.107.243.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99A6E23F;
 Thu, 18 Feb 2021 06:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqZCty/sgouCxkFt4J89mJsntrk/ye7JGT7YI/dKf3ZirMsvcgkQB71VzGUcLwbey4ShEe5+wp5YL240ZIhGo/S0aZPc+hO675iufJ1Oley7PJF11GoEbOl9ybZRll7SGmDoXUA8iWkFRV64dm7/nhIOYvY6hukcl52Fy6Ny8Tx39zeQjhliqW2UYVl+3yQapE8M1FwqXYR/nZauqwZIr3NBT6vm7c4fqSYM8ZrhKnwCrLLatTxREUzX0S8mg9G7TKoPfmBZaEU3UUqxxARx/CBSVvflH/4L84unr6j5Y4jE3ivEKE90Gp9Es/GmC4iJEFWgNbbKjCj/p1mhds/WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OIgwm4b5XHCNcj7lxCf/bFY2GDHYy5EsgZc6EsLYD4=;
 b=D2JSebvsAX3c7eTb+aYzDlifv/c0ystt74uTrfrcDmL/bzLp57IylzPgssAcL0kdaKbPpBKLdCY1UL0tqD1rl26Kjj8FOgDqgAulEqk/YMlc/BEyhbqJYaz0bDZBDByVhAlUSepU5uc1PRb22QCGG7sVLNfkXZFulAbYSGLZkL0o8EjdqkSZpJZ7QmJP/sUZGe9X7UYPRzMhkm3ydLbyBfMIS1zmmFEOFXDba/bzGWoXC8I8T40yDKyYynswPPSygqNavHP/6y97+q0tLUzilmxlKny8ABfUBkQfsPh3KcGvUWVC7fS0KS1MN4FrEgVXnh5pAEFQejz6JNbUV8QyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OIgwm4b5XHCNcj7lxCf/bFY2GDHYy5EsgZc6EsLYD4=;
 b=JEzOK7S7dgC2dxPSyuj19e+z/jhcbrlCGKzmN2NTts4M+666h5rWsJ9snxjKGGIgsGOCtzYy6nX6wwkLaxfiNl+mnkHt2AwQZrwbxIXPjhTi1vEc0osNhaaX6mU0M1Ldsem8QX4+X4nlQ7B95sIGmUIRebDjqejDJCHIuyOpuPs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5269.namprd04.prod.outlook.com (2603:10b6:a03:cb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 06:14:20 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3846.038; Thu, 18 Feb 2021
 06:14:20 +0000
Date: Thu, 18 Feb 2021 14:14:13 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
Message-ID: <20210218061413.GC2891@zhaomy-pc>
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
Content-Disposition: inline
In-Reply-To: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 06:14:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56a76e68-8183-4139-180b-08d8d3d46d63
X-MS-TrafficTypeDiagnostic: BYAPR04MB5269:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5269757616E47F2EBC595C5CC7859@BYAPR04MB5269.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IBXxoKl0flHAEdhkW8haGWjLDFkRmoWEC8R2q56wzIvnkYBm1jOPeZ1rom3e/71CBmtNhNXjFu0CZ8K1DAXFBKppK0GXKHx2CAa/5do2Vv7NtaeOPPuVMVHiOTGwtgiEs1jwa6juzl8ghYLG0WtmaUN3yAoq9XhDzuyBV9PpLLAJ9FKUwwQaT39HgYMvEmgKC/F3QngTLW46BOu6ErDv10r+4gVUlnQyiT+1316zjQR0CKuQvLPs17XBLMtu2Ki9Ymosk6uYtB33OmVL7zgLhiC6Ny4YND5G0q/Rwx+FEx8MbTTDcdFehG1/ggTdqrWglNVyZWyg7fd+xFBvxLAEa+JZGBnsWdz6Cx2WEn8DxUOMWCsKzYe3aPgPwhFAiZeic0hHiytnjXGWQ24tX7Li0UT1p+OMa4xvQRDh+mngDIcXNvZpZcyAUv3JYpZfa1c/Xc9MOWfswUP/nD5/VjWXD/xG4KQ5AtBRoYG5zS8tiqFztusDu0jWnsyIgaiMv0nV0GloD0s1JvAEOh8mo6UMNiRzYH/qMvoJhBl507mnti8RhCEnfx0gVPvwWG9JAdn4ZBOGJengC84zg3p987fig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(376002)(39840400004)(136003)(2906002)(55016002)(9686003)(66556008)(6916009)(478600001)(26005)(186003)(52116002)(6496006)(66946007)(6666004)(16526019)(33716001)(66476007)(4326008)(83380400001)(8936002)(30864003)(956004)(54906003)(33656002)(86362001)(8676002)(1076003)(5660300002)(7406005)(7416002)(316002)(16060500005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?36aof7kjtcmp5KxssX+KxnQVJhpv5xHfMN6LHzC+oVZhzP2OTfnVwig6R5D0?=
 =?us-ascii?Q?QnxzozctqBjZOfQ/zk6LVZjn6myLrfW/WNau8YZMMgrqha5pvwU6oUAWcw5p?=
 =?us-ascii?Q?Mu5eKabRaqw/AAcjKqnydb0SRX3g5Q77ZQXbS+tRAGRg/SGOZ3Ic3HlyGqV3?=
 =?us-ascii?Q?mgnSFVpHVGp8bRHZqN9s9plM9SvKYnWpxm6Fb3l5qfncEjy9GEduQHtmj0te?=
 =?us-ascii?Q?Wb9d3FwVS3zoL80/ZSs3tFVVvH3V1oRPQnzO2PGHCVMZJL0ivUiA/tLAKMcJ?=
 =?us-ascii?Q?FX0CLAdF0a6ZrfP0G4wZM66zxOULmthpVUFWNA6euduGYQvNZtQClNRr0nMw?=
 =?us-ascii?Q?+DDN8RO8Q5vNHZro1mBkJ7EJEXVKD+uQp0hOiYPRwRgQwp7JCgHbZLBeI9v/?=
 =?us-ascii?Q?Pt5BSyAt7cZY4nSYt930HcqHAwkTTOS0gewluSjSu/sOtwQsBoR3PHOPkE49?=
 =?us-ascii?Q?p3bnGNjRNEqtjr5x78ZreiWl8hPpg8WS677NnVjeIUtcxn3KVi+/brOe3GDD?=
 =?us-ascii?Q?6e6pSDRsqia3eRlveHNtHwnlgDN+l44bJoU1b5qc4Qt1s3/V9aLSTmW7Nm35?=
 =?us-ascii?Q?QYPFFPoOSvayzqLqHv9I8/bHWmy+FmlGq+3b1pxgFaL5JAldOiAX20CALJ+w?=
 =?us-ascii?Q?2OU2l67BJsjP79KmpXC4j3TYZzYHor1ESh0RlpUYzoXMKq+3cPD8mvMfZp+O?=
 =?us-ascii?Q?JRZpW/keQWM++xvKg/yajq7XLfFXn3dTMuDy0oOg3DwKgDULfJW/GrKLmLO7?=
 =?us-ascii?Q?d/vob367nc9Smi9CXUunEq3MPTV08i6dpxaKajckvKKmOgzlVDbqehWmJJU2?=
 =?us-ascii?Q?AUpb4h7n82QCzjt6Eg0Cn/1LfF9LnsxfCD/bYm2otam5iT1NPnhqjTxnymOZ?=
 =?us-ascii?Q?s/fxqTqTkr//bn+U7kfOHV988/Zj7e6zFgA4LF7VGigZU75scloJ30/DMwO6?=
 =?us-ascii?Q?CXUiH8BxViOVpqA5lc9GzvJJeiv40huCkriM8V4dxXCU38Xlo5efO/Nt1axF?=
 =?us-ascii?Q?bOpRM8JjEEwXCS2wwuPNhdppRYTbz4ueGBMOM5UAZ2NcrJoeOCGrD8Inx5eh?=
 =?us-ascii?Q?CBRoT0U7kHUxuN/4XeC1RO5z5XUzvDMKy5CsHd95+BTWG2XcRzhVltbh43X2?=
 =?us-ascii?Q?jJLw0is3pHG7o2K9pS7HSjbMnS7iyBqmJXCV3C44mRJaZM0OlxERHcR0w1jC?=
 =?us-ascii?Q?eWr/WRlCHXMCuOqcpnF9wMcO/Peu/XWm6SrJBumcifmyjjncCnjowFLbSIFv?=
 =?us-ascii?Q?ns9lzD5222Kv3f1jS7gjbVdYW5umLqhHDuR9oWbrahGNit7jopeY3H8Ar+f1?=
 =?us-ascii?Q?grHTF34qFk0d8ygBXJoglD61?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a76e68-8183-4139-180b-08d8d3d46d63
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 06:14:20.1453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PF+1Qqnr6rM4x6WQl3sOu/Ee0i5o8DtStTBzK0IUsUFPYaIYjVzPAnwde0ZH9wczQ7K/Y852ZPJQhk4AHzk7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5269
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.

It is OK for anx7625.c part, Please add my r-b.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> I considered adding _DISABLE_ instead, but that'd make the
> flag names a big too long.
> 
> Generated with:
> flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
>   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> (then minor format changes)
> 
>  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
>  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
>  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
>  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
>  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
>  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
>  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
>  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
>  include/drm/drm_mipi_dsi.h                           | 8 ++++----
>  25 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index aa19d5a40e31..59d718bde8c4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -165,7 +165,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
>  	dsi->lanes = adv->num_dsi_lanes;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -			  MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..beecfe6bf359 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1334,7 +1334,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
>  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> -		MIPI_DSI_MODE_EOT_PACKET	|
> +		MIPI_DSI_MODE_NO_EOT_PACKET	|
>  		MIPI_DSI_MODE_VIDEO_HSE;
>  
>  	if (mipi_dsi_attach(dsi) < 0) {
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 76373e31df92..34aa24269a57 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -829,7 +829,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	tmp = DIV_ROUND_UP(dsi_cfg.htotal, nlanes) -
>  	      DIV_ROUND_UP(dsi_cfg.hsa, nlanes);
>  
> -	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
>  
>  	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
> @@ -902,7 +902,7 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
>  	tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
>  
> -	if (!(output->dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		tmp |= HOST_EOT_GEN;
>  
>  	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 8ed8302d6bbb..320f95ae6077 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -825,7 +825,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>  		val |= TC358768_DSI_CONTROL_HSCKMD;
>  
> -	if (dsi_dev->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>  		val |= TC358768_DSI_CONTROL_EOTDIS;
>  
>  	tc358768_write(priv, TC358768_DSI_CONFW, val);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 83ab6b343f51..99249d0da330 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -809,15 +809,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>  			reg |= DSIM_AUTO_MODE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			reg |= DSIM_HSE_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HFP))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
>  			reg |= DSIM_HFP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HBP))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
>  			reg |= DSIM_HBP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSA))
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
>  			reg |= DSIM_HSA_MODE;
>  	}
>  
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		reg |= DSIM_EOT_DISABLE;
>  
>  	switch (dsi->format) {
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..f4cdc3cfd7d0 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>  		DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>  		DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>  		DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -	if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +	if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>  		val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>  	writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a1ff152ef468..5c0c9180273a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -402,7 +402,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>  	}
>  
>  	tmp_reg |= (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) << 6;
> -	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET) >> 3;
> +	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET) >> 3;
>  
>  	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cba0f08..a97a7822e596 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -850,11 +850,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	if (flags & MIPI_DSI_MODE_VIDEO) {
>  		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HFP)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>  			data |= DSI_VID_CFG0_HFP_POWER_STOP;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HBP)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>  			data |= DSI_VID_CFG0_HBP_POWER_STOP;
> -		if (flags & MIPI_DSI_MODE_VIDEO_HSA)
> +		if (flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>  			data |= DSI_VID_CFG0_HSA_POWER_STOP;
>  		/* Always set low power stop mode for BLLP
>  		 * to let command engine send packets
> @@ -909,7 +909,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  			  DSI_T_CLK_PRE_EXTEND_INC_BY_2_BYTECLK);
>  
>  	data = 0;
> -	if (!(flags & MIPI_DSI_MODE_EOT_PACKET))
> +	if (!(flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>  		data |= DSI_EOT_PACKET_CTRL_TX_EOT_APPEND;
>  	dsi_write(msm_host, REG_DSI_EOT_PACKET_CTRL, data);
>  
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index e95bc9f60b3f..44674ebedf59 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -302,7 +302,7 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |
> +			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
>  			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>  
>  	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index af381d756ac1..178abfb1737c 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -571,7 +571,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 2;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			  MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET;
>  	dsi->hs_rate = ddata->panel_data->max_hs_rate;
>  	dsi->lp_rate = ddata->panel_data->max_lp_rate;
>  
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..ae3361ccccd5 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -265,7 +265,7 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> index 8f6ac1a40c31..a3ec4cbdbf7a 100644
> --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> @@ -809,7 +809,7 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
>  				    GFP_KERNEL);
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index ed0d5f959037..a5a414920430 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -593,7 +593,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> index 3c00e4f8f803..21e48923836d 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> @@ -442,7 +442,7 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..9d9334656803 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>  	dsi->hs_rate = 349440000;
>  	dsi->lp_rate = 9600000;
>  	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -		MIPI_DSI_MODE_EOT_PACKET;
> +		MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	/*
>  	 * Every new incarnation of this display must have a unique
> diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> index 45b975dee587..198493a6eb6a 100644
> --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> @@ -184,7 +184,7 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  			  MIPI_DSI_MODE_VIDEO_BURST |
>  			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -			  MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	osd101t2587 = devm_kzalloc(&dsi->dev, sizeof(*osd101t2587), GFP_KERNEL);
>  	if (!osd101t2587)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..b04b9975e9b2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>  	 */
>  	dsi->mode_flags =
>  		MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -		MIPI_DSI_MODE_EOT_PACKET;
> +		MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	s6->supply = devm_regulator_get(dev, "vdd1");
>  	if (IS_ERR(s6->supply))
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index b962c817fb30..ccc8ed6fe3ae 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -446,7 +446,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
>  
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_EOT_PACKET;
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	ctx->supplies[0].supply = "vdd3";
>  	ctx->supplies[1].supply = "vci";
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> index eec74c10ddda..77289967d3e5 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>  	dsi->hs_rate = 349440000;
>  	dsi->lp_rate = 9600000;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -		MIPI_DSI_MODE_EOT_PACKET |
> +		MIPI_DSI_MODE_NO_EOT_PACKET |
>  		MIPI_DSI_MODE_VIDEO_BURST;
>  
>  	ret = s6e63m0_probe(dev, s6e63m0_dsi_dcs_read, s6e63m0_dsi_dcs_write,
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 527371120266..9b3599d6d2de 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -990,8 +990,8 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> -		| MIPI_DSI_MODE_VIDEO_HFP | MIPI_DSI_MODE_VIDEO_HBP
> -		| MIPI_DSI_MODE_VIDEO_HSA | MIPI_DSI_MODE_EOT_PACKET
> +		| MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
> +		| MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
>  		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
>  
>  	ret = s6e8aa0_parse_dt(ctx);
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index 16dbf0f353ed..b937e24dac8e 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -282,7 +282,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  			MIPI_DSI_MODE_VIDEO_HSE |
>  			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			MIPI_DSI_MODE_EOT_PACKET;
> +			MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	sharp_nt = devm_kzalloc(&dsi->dev, sizeof(*sharp_nt), GFP_KERNEL);
>  	if (!sharp_nt)
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..babc7a7f6844 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4745,7 +4745,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -		 MIPI_DSI_MODE_EOT_PACKET,
> +		 MIPI_DSI_MODE_NO_EOT_PACKET,
>  	.format = MIPI_DSI_FMT_RGB888,
>  	.lanes = 4,
>  };
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..6b706cbf2f9c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>  	else
>  		dsi->mode_flags =
>  			MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -			MIPI_DSI_MODE_EOT_PACKET;
> +			MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	acx->supply = devm_regulator_get(dev, "vddi");
>  	if (IS_ERR(acx->supply))
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 55172d63a922..d17aae8b71d7 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -311,7 +311,7 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>  
>  	drm_panel_init(&ctx->panel, &dsi->dev, &xpp055c272_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 360e6377e84b..ba91cf22af51 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>  /* enable hsync-end packets in vsync-pulse and v-porch area */
>  #define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
>  /* disable hfront-porch area */
> -#define MIPI_DSI_MODE_VIDEO_HFP		BIT(5)
> +#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
>  /* disable hback-porch area */
> -#define MIPI_DSI_MODE_VIDEO_HBP		BIT(6)
> +#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
>  /* disable hsync-active area */
> -#define MIPI_DSI_MODE_VIDEO_HSA		BIT(7)
> +#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
>  /* flush display FIFO on vsync pulse */
>  #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>  /* disable EoT packets in HS mode */
> -#define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
> +#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
>  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
>  #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
>  /* transmit data in low power */
> -- 
> 2.30.0.478.g8a0d178c01-goog
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
