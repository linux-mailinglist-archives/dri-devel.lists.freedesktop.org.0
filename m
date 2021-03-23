Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C23455E3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3889E15;
	Tue, 23 Mar 2021 03:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C5389E15
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLRlzsE7dUwlxJ2QuidfvoEBmYywFnUIV1bZBwaWzX6E4+nFiW6fk0kh078PQxjO09gh/sTsxpbLojweicMW8dA/24I3y36k+EZ/GOm/NivEepEbu2x2VJ5wOsR8fyfqOw9M6RKOlVT8TG0c1e6/pptJaD+ZoOCjwUe5ox00e8mwBOk5hPOIEmpYODRKq1VOd3Q92bIgqU+HOXkn4g0haLyuURlCtX1EFhxXn9gaPG0du2a2J277Je/QDqTHAnhb0M8mxhLwb83RsZKWitfwzmmDxpZy8vTR5uiyQqsDjrL14E5EyO9yyo5PEnz5VG0QaAJMU0GDfOFWzvvyUmilpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9XlmLfUBh87tqel0re3ZB52OZdV7LyuXZay4cpBTrc=;
 b=VCsQDPL4diVVABTwiHAnGtW6beVGMGI0Mu1T9Zs0jcEd4KMeM1/hn9a8OKeM0TYDe9Wrd5pZ1redMuI0xVYdlQyKFmPn9NCtZy8TnL1oITTNdqO3V82gOWAy7kVQK2EXJolxj86/N1MvrrQCdy4Hl8jKTKB5t/TxGDCtkq5bkyQCWzU7n/fZsgM1v6CpKYyKp4gS4u9YFmOrvb1suu3IZveSTtLEaNRWbe9VkZIVouVRKXLToRtsVUFOSEtO6srfR5JKGPSbwc/Kw3x4ccFUnACc6NT6bU0Dn6Tt7jehY37lcS4GDQN0z5/pwuVdi6ywwu/QEYf82w5WcUgjXU0eUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9XlmLfUBh87tqel0re3ZB52OZdV7LyuXZay4cpBTrc=;
 b=SodqM990vgSzlmFZyprkjxiSmveIzZYKAs4b2jCI3ixkLjNzqu9Bd7k12vc5shSx8T4jUDZFEx8LW1BGOODsyZylZ7K8PwAqwLBg1raECzd05Eax/Am27YgLMbt24Y95prWozGhfh56BllviZqX+lRRb9zbxePd1a7ySIKfoKfU=
Authentication-Results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 03:02:34 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 03:02:34 +0000
Message-ID: <5fea4551daac3698df791c12e48d88338efaa2b3.camel@nxp.com>
Subject: Re: [PATCH v6 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Tue, 23 Mar 2021 11:00:56 +0800
In-Reply-To: <62306ab21ec234317ca4b8c2f06fc9cd4be0ead4.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-2-git-send-email-victor.liu@nxp.com>
 <62306ab21ec234317ca4b8c2f06fc9cd4be0ead4.camel@toradex.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR02CA0213.apcprd02.prod.outlook.com (2603:1096:201:20::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 03:02:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ceee79b-f502-4742-b440-08d8eda81af6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6560A2EA82F056A70F210DE798649@VE1PR04MB6560.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aL0RgfhtJQuWr6CVqWstxtzKM2s8IrXf6QCtERiLR/QKQo7LCodpfkyCYTZWsEJiSErPP1nZ95wrwWwXU39MCVrVCFIZmWBASamfNO+o/+SgUUmpyusH3O3MNRKz9KzBFl8N19pwm8OwPAAFUKrHXryrirb63ZiLfhLimptH7X51UW/NAznxkLR9BcC86Ttbbnbac+jPYpC1PrW/NNRi0AtFrnHNezSkRbk19C2P1JcUY5z2yzJ+lA+MYXhzQCy3xXstOzEcixRT2jMKiW0gYqWQUd3g5f5VYxdYACTW/Fw7ZX+F/nblqCMKX5g9P3rtcdWgpQLOwo9yiNJlMN6kfrGJjc1cfL4PAYRNl9j0nwo/nKfCn6ogA7BRh0SeZnE5W0UVjCDK03HZ0C63YqtK7ThsCIyaWB3Fy5Oyjk+1exC+ZmbbO63pMpYojHnYZA4WoBUrqP2O/hU+DRwyDRvDVcom4mHenl9SUwOPB/LMbN7LjXWplSL/H57/5mWiFFbDC0bdEm1jY0vW591pKiuqhu14vjBxKaBwQV3lukx7kWjWCKGYmG5KeRWGLB/u56AcN7hIcp9XCbX1kIrIhcuOgZWT8INwrOzV/EL9swPx+6D+9abCbHizop/lysHmTzYkcPmPSMUNRM8T19n+f/zV/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(2906002)(6666004)(52116002)(478600001)(2616005)(6496006)(110136005)(36756003)(54906003)(316002)(956004)(38100700001)(5660300002)(6486002)(66556008)(83380400001)(8936002)(4326008)(66476007)(86362001)(66946007)(8676002)(7416002)(26005)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N3UrOU5QTW9CZFZxZ1oxaUxuS3g1SklIV2U3VEp2UUZlOVpIT1pWMlpIUlI5?=
 =?utf-8?B?dWVheWlOOW8vSlZqZjBmZ0RWeHE2MXRJdmYxczVQdnBmblhBNmxlTTBvMVp1?=
 =?utf-8?B?SUdCKzVVTDF0Tlp1UWo1Mzg0OEJRSEFnblNmYzB4NVVNYWdLSXlpOFhWdnFM?=
 =?utf-8?B?MU5GKzM3c3N3SDgwZkNZdElnOWdTclYvRVhXRFIwWG50TTFxT1RZT3VHTWZE?=
 =?utf-8?B?Q2djUWgrd2xrZHJ5L0g0Q2xrUHBMYktrOEcyQ0M4bEZBNWxMK0dKcUlXTW90?=
 =?utf-8?B?YkxnTkVjd1hQbGtLVEQ1eW8vL002azZQTE5OZ1htSVZNbTlQampkdFJuVWxX?=
 =?utf-8?B?bVVlZG56VUtQYWM2ZzlRSWxTWG9rM21SUUFPbyswRU5VYUZtK09oUktZZHYz?=
 =?utf-8?B?UEN6cEdsa3JhVExVK0hzQ0NBV000NG1weERPaFlOYVBianhDaGhFU3VXYXd1?=
 =?utf-8?B?V29jRklyVEozWWpBdXJyM3VoOUExQkMzVE1USG5lMDJJbzYrQlphdXhIMjFu?=
 =?utf-8?B?cUFEQnB4WmF1T3dQcTd5dXhTclpoZWF6ZmhpbHZWYWIvRG5tOHR5ZVRZZDND?=
 =?utf-8?B?TElYVjUwR1Z2OWJIdnBrM3NHN3BtQUorVVdzT3JILzBJNzF6bDRJUC9kU0hR?=
 =?utf-8?B?OEdiYkVZTFdLYXVlNkZPazdvWTVkRXpWOEJDMk9XRGlCbkNSb0xaQU1CZkxy?=
 =?utf-8?B?aU1EQ2RmVVEwTTZudk9TQ2l6SUsvRnUzTDJmRXdndUFNc3JHYlNSRnB5WDJ4?=
 =?utf-8?B?Q0tWY0lyMTFNZjZZc2V0QmZlT3RKV05Pcnp0ejU3ZWpERWcvMjFlQUFBVk4y?=
 =?utf-8?B?SmlkK1liOEdOd2IrdHl3aXNrcDZCYU4zanJhc2JhcE4zOEt3VWQrS3ZFTjdG?=
 =?utf-8?B?bVNlZ3htQzM5aE9zc0lIRW5Fc3pLZ1BXcVhoOHhsZkNaVzhiUkxMNEhtYWYx?=
 =?utf-8?B?cjJ0M0VpTVBGZE5hdGZwQWZXdlNoam8rbllXaC9IVjdaRHFPNEZZQllGU3dK?=
 =?utf-8?B?aEZBRC9zQkFyclI3SHdvRkxmTDBRSDA2QWdNTVl2OVZNQWpmWXIyemFtR0F6?=
 =?utf-8?B?S3BvZlVmZ1V4WGM3eHlIenhiWkFqM2NHNzhIZ0RpZmtLTzI0S3Y3YllLcHZs?=
 =?utf-8?B?RG5CRFVmMTdnblBWeTZUNDh5OVJrV2VTV0V0b3dLREtrMHcwVWhrL21kUzVu?=
 =?utf-8?B?ck1mQ2JoMk1TU1YzOEVueEZKalJEdG1ISUFaTjdDcXJQbWhOS1FHOWMyei9v?=
 =?utf-8?B?VVk1Y2FNMUhjRFlnV2pPOHhWVUNCNUcyRkplS09LS3pyZVltd1B6TlU0YUVD?=
 =?utf-8?B?TTlBczBHVmlyeWNRSTNIYjQ4a0gzaC9iZiszMjZhdmpXYVJrL2ZNY0U4WVd2?=
 =?utf-8?B?czZRTHlUc2txT1M0cmNpRkFrQ1ZMYjlMNmdaZjNRcGQrbVl4d1JWVi9nRzhQ?=
 =?utf-8?B?YUhtQnpVcjU0Wno2QlFoaW55cXpIMkU1RmpkeUt4YUplbTNvMGxFS05vVjlD?=
 =?utf-8?B?R2FrZUxlNzQ1MWl5d1c0MjJ5QVBqRG9YeHVDeXlIb0pFN1dsMjBQZU8xS1d4?=
 =?utf-8?B?OC9CcDFUNlZ1L2xrQzhEbTdzMkpNcGtvZjF5UTJvcjVqT2NNYks4azNTQllO?=
 =?utf-8?B?RWRSOFFlV1VmRm8weUcvcnVGclhvQkZOWWVNVzN5MTYrRDkwalBjWjBaaVBJ?=
 =?utf-8?B?TEs0S3pQQm9IcUEvc2tyWW9OOTZ6YlZJeWRCem1mMXJ6aVcwTUdXdkttbGEy?=
 =?utf-8?Q?6cSwDGupycId/DMu9aFBb79M3tFgFcQRIQmN+2F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ceee79b-f502-4742-b440-08d8eda81af6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 03:02:34.1915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsQ6lRIq8rizn0icWPz6fp58jfjqajUdYXfvAegdZvw0vYOE1jaIFSarLIR6JyEamrjpIHqjZ5cnCb/g9hXzmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6560
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel,

On Tue, 2021-03-23 at 00:23 +0000, Marcel Ziswiler wrote:
> On Wed, 2021-03-17 at 11:42 +0800, Liu Ying wrote:
> > This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
> > and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
> > The RGB pixels with padding low per component are transmitted on a 30-bit
> > input bus(10-bit per component) from a display controller or a 36-bit
> > output bus(12-bit per component) to a pixel link.
> > 
> > Reviewed-by: Robert Foss <robert.foss-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > Signed-off-by: Liu Ying <victor.liu-3arQi8VN3Tc@public.gmane.org>
> > ---
> > v5->v6:
> > * Add Laurent's R-b tag.
> > 
> > v4->v5:
> > * Add Robert's R-b tag.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * No change.
> > 
> >  include/uapi/linux/media-bus-format.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index 0dfc11e..ec3323d 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -34,7 +34,7 @@
> >  
> >  #define MEDIA_BUS_FMT_FIXED                    0x0001
> >  
> > -/* RGB - next is       0x101e */
> > +/* RGB - next is       0x1022 */
> >  #define MEDIA_BUS_FMT_RGB444_1X12              0x1016
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE      0x1001
> >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE      0x1002
> > @@ -59,9 +59,13 @@
> >  #define MEDIA_BUS_FMT_RGB888_3X8_DELTA         0x101d
> >  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG                0x1011
> >  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA       0x1012
> > +#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO       0x101e
> > +#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO       0x101f
> >  #define MEDIA_BUS_FMT_ARGB8888_1X32            0x100d
> >  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI                0x100f
> >  #define MEDIA_BUS_FMT_RGB101010_1X30           0x1018
> > +#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO       0x1020
> > +#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO       0x1021
> >  #define MEDIA_BUS_FMT_RGB121212_1X36           0x1019
> >  #define MEDIA_BUS_FMT_RGB161616_1X48           0x101a
> 
> I haven't figured out what exactly the idea of this strange ordering of things is about? Could you enlighten
> me?

The existing comment in this header file mentions 'The bus formats are
grouped by type, bus_width, bits per component, samples per pixel and
order of subsamples. Numerical values are sorted using
generic numerical sort order (8 thus comes before 10).'

So, the way I read the ordering is that fomarts are first grouped as
'type', like 'RGB', 'YUV'  and 'Bayer', then sorted by 'bus_width',
like '2x8', '1x30' and '1x36', then sorted by 'bits per component',
like 'RGB666', 'RGB888' and 'RGB121212'.

It looks like 'samples per pixel' and 'order of subsamples' are 'YUV'
type relevant.

HTH,
Liu Ying 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
