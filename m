Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B344255B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 02:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456316F55F;
	Tue,  2 Nov 2021 01:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2108.outbound.protection.outlook.com [40.107.243.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E226F55F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 01:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA0+48H71hjqnBAwsk3x5SNvPY9idOagIe3rKYDP3UsqwgW90gAe97hUBfxTm/dCZruyGAfjtWLsMH/KOA56kgYuwmsYx9wqsyYYe2cN6UE84WxrY+ESrRCDNetCdUW6E1tUwY4vWKGv6Cqvem3Ez3LFmyY0l0c6YJj5aNmrWMN9Ovq2sSEvvRgoQE/4LybaR8pTizZQWvHLiofKx/jHiOstrGUo8T4/DOtovaFg3j49GPjYxwUCGcgJIstK3xFlX2m5oXY6cNYJ3tJK/sHC42teIuWFi0gJ5BpUecOYng1/otFXCumZtkdRlvaVuGdouq9lnyXQaM8smUnrML9rzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktaJC0XjY/fUteJZ88N1HqJBPCQmcmLfRcsWl3B0/78=;
 b=hVd1bAl9MpHd4HOFIJmhW3txJ7n+pXtPh+xPu7ezYd/ckLzRa0LwKEId8kNEKQ5dIkhadPC02GnyOKME/d3zYpFiDFhshA2MYSVysD6cNVM6dFbnV+3KecxOb5T8dlfhKPx4Q4V649I3euJWPfHgng07qVo/mkO12E59LYbGonr+sEyKO0pdXNGTckUK1+WTmx8esLxRCX88s6+b02o28Csy1Sn2fMcDN5HOzMpsCnxUmwTm60uYLc/udMUO3CJe8+Cbb2zUs3DlD4wubwIF7buEieZ+1xIr434R1t7FbMenpvQ0MVIzroKXsEvfJK6vtAaJbmZL1xTTFbal2VieOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktaJC0XjY/fUteJZ88N1HqJBPCQmcmLfRcsWl3B0/78=;
 b=2munEAgJOY9mTqYv/aHvwz1XrgxWMtourJLyAy3hQCq+ni9bGFdC5JvKKAGq9FzL6aERMSscE4pH3QMbSSJe2c72HzlBBX4VBMNrq0Smu8R5hmrXpyOS1j8F7oXzSdFQ0qrefTwdFaq88b4FFU8f6A1gCJIfu10u+oi+OjpAS5M=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6569.namprd04.prod.outlook.com (2603:10b6:610:6d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 01:56:39 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 01:56:39 +0000
Date: Tue, 2 Nov 2021 09:56:31 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end
 aligned to avoid screen shift
Message-ID: <20211102015631.GA2248315@anxtwsw-Precision-3640-Tower>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-4-jitao.shi@mediatek.com>
 <a16150b6b10dca4bf961b8e02b5e4d940b98468c.camel@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a16150b6b10dca4bf961b8e02b5e4d940b98468c.camel@mediatek.com>
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 01:56:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a136137-843a-4158-c76d-08d99da40223
X-MS-TrafficTypeDiagnostic: CH2PR04MB6569:
X-Microsoft-Antispam-PRVS: <CH2PR04MB6569A99CE5328EF61A005E62C78B9@CH2PR04MB6569.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sIharperrjVZ/V/ciR2o3/XyFQqtrEIznTYV8CGcmOa3rmm9TREu7dfx8DWJ26v9o3d9iGyx/8zkRkGXrabyqpgejToZBm40nisQlzzt7ZPm/kV673uRMA1xd/oo93/+nxLRYmNm5KF7gmCNA/OA7XWAb7ADfKESS0o5sgbhgncSuj9oJ2edEhzCq+WkJ95QgWE7wxjMZ50apSp+4OCpmyJhubDKWqQ2ARliiW1wNaQgHdlSjWoiDB5YC80LreNh+E/ZwMCVVYVynYIPuBw/xsmO8KlaFRGVjGIfer23JtDRvuDEHVpTZpBUz9i+eVC9GXcEUiADPTyskgT5/Ej9jPOla3UTk0+i1HN8AqqnfFqqYt2qFNsFLZUgqDzL76XKOGInZN+VFcvHswGEoMpgbf+XRaVIB+bq4cCWhGh/MQePmaTlHeL4LpI7mmjiIcqyG7n4TACvdkBA5yQZzuQbxW1pJYjAsOB2Fmf9fbKcgLHE3f2fb+z/o6Dq4fxpR5wmcbwC4qA0thE+cxe7+V2wQ1NFdH1uDBaIrj08TvyxWAgW7I2ClzB/nKgdwbGyknev9J+GPph15WA4FC68VG0Tic+4jmoKddz5kU7aSpYnhsXqcSJPRDvATpUXmQ+xRv6rSflUtGzftiWJUPybMKy4ZKBN8JErd+WDG53oCeQ6tQesce0zNUjG3Q+F1AfB2CdmlY03kIKm8V4k75d+OXtwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(26005)(5660300002)(508600001)(2906002)(66946007)(86362001)(8676002)(33656002)(55236004)(8936002)(55016002)(4326008)(66476007)(7416002)(956004)(38100700002)(316002)(66556008)(6496006)(6666004)(52116002)(1076003)(6916009)(54906003)(9686003)(38350700002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?geMzpC6mraU7wSYiD42sggvUjMv+ASiBzpMecxO11YvNiCgRcsr/KPV5RyjV?=
 =?us-ascii?Q?B1ky48JiDpF7ar4VdSuyCQgdbdouJDEJKC1+hQ3t83T/lEIzN1142TY/xDUp?=
 =?us-ascii?Q?Q79OhPYSOjOTMRGsHa9yiMCX/MGRWzljHDSUIOUpf8Tc8RNFTrdS6LqdvbQY?=
 =?us-ascii?Q?DT3oPdq/6ZkNYi3Ig4mljprVJx99M90gjwEWkeTxtRINS37HDSvxwnRhp1tW?=
 =?us-ascii?Q?XCHqaBQsSvxnxOzFOkqqLX4G+yChRaJIwqQVKtPnvz+bHCvnSKfjMWCGl9XY?=
 =?us-ascii?Q?Y57u8mgzV2zvg9L1O3sOiUo7AD6GdBpfuRrknIiRgAicJOo5KVStZZHS1gHk?=
 =?us-ascii?Q?QY9QRjkinZTAXB24n7MC5QJSJVi//f/eJxuZBZfrqIJ+ZhWEzEAixllb1gOZ?=
 =?us-ascii?Q?1F0hEjUNhvcWZE+WbNHVVACgez10lPvlIHO4zxtK4wxvRMfOLAh5pK3D5g89?=
 =?us-ascii?Q?KwIFVmRbwboqt4VutFkmQR8Z0eod4CeMh62dzQRFnhVk0CUS2ozadOle+unw?=
 =?us-ascii?Q?5ofGxyNSqHPznPHEXGJAVwi4KE/uOtvwRK15KivGsB2kE3LrcgMS+YqJvjTp?=
 =?us-ascii?Q?UZWDhN6r6dQNY29mdJ7tbFS/tVRyAnhX8rjkhXgPWshVFs/1rrHZNIEsPKtn?=
 =?us-ascii?Q?vcDQfIZJ5CswCmu6P+XaNoKGzOeXkGpKH0jPt581oIEb3j3Mg1mYt7dqkJGL?=
 =?us-ascii?Q?2PeZUt7xeW0nR3gAJnzeoSDD0EzQN7BR/8kgRtEpZlT4NDtqBUY82AwWzb7w?=
 =?us-ascii?Q?Ydrvf8fUG1IAitMhwwG2LCAt82yk9jDkkjkgfkazYYCoOY9vNyJlLygJ4M8l?=
 =?us-ascii?Q?FRq0v3Gsp/8NqMhWb5XN0H6va+iCGuYsrA8MKJIU9kZI3FcFMmWzaG9aap7D?=
 =?us-ascii?Q?cUCIBU0Dq7nNvoN2cFwshM47+BAILQs0s4/KvrCHaP7iDuF1x7rVnDD70LvK?=
 =?us-ascii?Q?Cx4XS7PJ+8RmEzg3ZaSZUxE950Nwd1i52BKHBBIRrcsqokmCeWgvq/99+4jn?=
 =?us-ascii?Q?4H4kRAHcmRBTvbmqTeWbTJYE4B4kFmsurXj2pCDNKpBhd92sM201Tt6vF73K?=
 =?us-ascii?Q?cLAPEHmL6wSVZhHVHOXfXlUnn906cdbExsfGNlkBx2hmYWTRGxVoV/sEoRjj?=
 =?us-ascii?Q?Vk+4CHu11pPp6DGNfUtXgKys2tUucgLCvWIXdysxyZ32YZFz80pc3lpStWrZ?=
 =?us-ascii?Q?6WW3mjEPhbjRXGPNk+/MVaCl+uDsusK0oTBipHP5/hpv3oY9GKfpxYoGEKjE?=
 =?us-ascii?Q?tAPVzFfj+nagUsdQqDs1rUq/VToYvYCmCwiurXaF5HftGAhCTMLbVP1BD+tH?=
 =?us-ascii?Q?BEAF9ZJhGcG6tCBKxnbioaGQ9xXLqbjflp+XFzMsrIszUCR1Ol/JckHui/zT?=
 =?us-ascii?Q?aQvdh1ybKbaZCYvv0GM/bx6PJLuGLtIVycSo5CF9xUWPNxjmi4unuynDWFCf?=
 =?us-ascii?Q?qLv9XQTeueFaqEzUeeBdg5U04rqo3XvNZ3Bw6Z4sQ3qSdW4x1Du3sRTdljGk?=
 =?us-ascii?Q?Tdj5yjzto4x7Hyzhj3Rcfz3VKGWfpAL0lWit+EPhaD/px7bJLSYSms0oEJrq?=
 =?us-ascii?Q?8HxNSlDtuwXcN5NVNv/XJRuYa0cLfgSOmxmhQQ2lGhSyYBPdEeyEjjx6GVNG?=
 =?us-ascii?Q?RGFnfhHeHkOJCcWmY1iviWI=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a136137-843a-4158-c76d-08d99da40223
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 01:56:39.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3Pw3hHGLQlgprdDqHxjw211SS9BUoMbpesBZXbTUbKoyYL5AnJ1vZjmUbFUYpyIDUR6F4jr72gylCYYXPRTbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6569
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, stonea168@163.com,
 rex-bc.chen@mediatek.com, shuijing.li@mediatek.com,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, huijuan.xie@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 11:16:15AM +0800, Jitao Shi wrote:
> Hi Xin,
> 
> Please help to review the changes in anx7625.c
> 
> On Thu, 2021-09-16 at 06:31 +0800, Jitao Shi wrote:
> > This device requires the packets on lanes aligned at the end to fix
> > screen shift or scroll.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 14d73fb1dd15..d76fb63fa9f7 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1327,6 +1327,7 @@ static int anx7625_attach_dsi(struct
> > anx7625_data *ctx)
> >  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> >  		MIPI_DSI_MODE_NO_EOT_PACKET	|
> >  		MIPI_DSI_MODE_VIDEO_HSE;
> > +	dsi->hs_packet_end_aligned = true;

Looks good, it's OK for me.
Reviewed-by: Xin Ji <xji@analogixsemi.com>

> >  
> >  	if (mipi_dsi_attach(dsi) < 0) {
> >  		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
