Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D54C700F7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0DA10E24C;
	Wed, 19 Nov 2025 16:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="bWpNtSK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazolkn19011025.outbound.protection.outlook.com [52.103.13.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BEF10E24C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUQr2Xlt+pyZD8QUS6Orm6dOYOowRCUNkTVYVU7YQBBzE2obVVoZuTN6/qMBFtgHe9je3kJC0HG0KmCvg9DRBW36z/l3xf36c/T69Ne46psToL1eL4oFLrkmYcFPV0m0SHRq7ZN74sam2cNyW3O9jkdb/20AFm7dQz60k7e436VzG+eePfkCK3MiAiMAyyoFD+V8OM8v1bPflnIjNj/bPqJ3Z3lODGFJv1ZNxlx0x5Rpfa1AN7tmme38maoZ87noBZita46LFZzcjMeAGZDrQD8cAo3XIhzD4no//jlCptJvpfv1d49twLqLzu5eAK1Gj5XdpC1S5Y0f5Gy236n6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMtC3ESCvdOJStB2b2+VAiR698DtGmk0rJc0xDFkijo=;
 b=Lfi6XQ5OjT6Dz/EG9ml34Z5G5URj8F3eWHdfHf+HhBlvGL9pJA14svUenqN0lJQ/Gh2YZ0jwZUb4xHt6kMWOzA1KrSDz9PIPsIrnAew5KeBEfC6uF8cCmuXX/j63rM9usY9j+SYG8/4/ohhqGwrlRklrbbdj+cvgPgxGLQo/Xg1Ll8WvtDp0j7249qNYGJJgtLHx/KlicFwEV8dcRWEahV7Kto9SiOudYZLdgiIgTDYT4Ic5VEv9c7PRHubhCuzMutnnUirtANpW4zI0yD0fhxlnwnOe+8KLOR8SJ2pvkLbuY1QTFOKsFhg4hOy8L3s+AUkTrWsLf3vy3w3wbrlvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMtC3ESCvdOJStB2b2+VAiR698DtGmk0rJc0xDFkijo=;
 b=bWpNtSK0HYZOKXikgD7tKFvTlkG7Ug7IVomQmXUgP11pqQBfI8ZbrnjHDB1phi7fVRntPeGTuPppFl+U5QRTk8f5otZ8XGhozYTEj1dv6kCTkZ2EQrgpgQMhNvnWEjKdLXJi9LSAiWcVkDeD/4Sbp8hwvA2X7lF6s5fsSAqaY6eMvDuXi5A+SwWowdtk22zlX6A9zbtJVOskR2+qyJrEsqJIxa2mXDFXDCa+IFydC9uz0Fe4216BuC5KKOHR5Fb0hUo0FKgm/tdGjyOyD0HsFHe43X5fPwnH2uMcNu2vtOBWAyETFCky0WoN/yH2SdGwdx7ZNocuw/R0S+TxoTiPTw==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by DS0PR19MB7790.namprd19.prod.outlook.com (2603:10b6:8:12f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:25:02 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150%5]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 16:25:02 +0000
Date: Wed, 19 Nov 2025 10:24:57 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <SN6PR1901MB46542ED12EF34220E3119460A5D7A@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
 <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
 <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
 <hgwfztkwk4qgvefwo2cdedzas3rzlhx6yek6dgldkgaq2jskvw@exxqujjpa6bl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hgwfztkwk4qgvefwo2cdedzas3rzlhx6yek6dgldkgaq2jskvw@exxqujjpa6bl>
X-ClientProxiedBy: SN7PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:806:f3::13) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aR3vWZcd8L1QOM3f@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|DS0PR19MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df532ed-5c63-4fc1-755a-08de27883063
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUhM6k1QWx02acDuEqXpbI5XaZTcwZwrRyW1DCOZU5y8G6uF3vkzVPzjSkQ1YE7fINN3G4HPDvz+vPlkRgWy4qXYr/JBDq9PMNSKnvu5HvO5ewEtPtyESuzYTMokA6chS+EB5tD62gu2kdABYMOk2QdN5CghEA/xl/aiYGXjDvPZfDVKexmXbWyxNjyhsiDXjV7tM3iFYByCSHDICxhM/ImjqNK+z01V3v8GUdS85z/RRuFV9CII6iHkwzMC+QKK1ZjqhaQsf44st5yp6byodTB5eRtqbxsUSypSndLmqYxGS6j0qkVg6XqjYuZetsk386BWt2yEXoyIsp73TYyabhR9h2PXgypCaPUtBiVFHm0LhwRKkJG1A7OUcMNqIMFAUbFJ5XhWcm/LVDDLNafJOe3vUoslfwhv8qGJcStoC2GqQOTwBKoPPjc7upZUt5Cf8bFQn4pVtq6vD38eCCezaAgCamKIvzmJnBaY946Qds/senF6caSlogyYOAc8bHdCBjzDptDUhLWUXdDUThOsSYmEes2F4fd11B518kNlw8sZrPOD032eX4djn7//Vh+hN2lkvGsu/CipeGqWlM6wAuOUbx3DNe3GrHFiqIMCYwzVUUgciyK8dH32dUWGZZAA7oWXeUWyPkALFba2LuhJSyAj7Bd/I09nUacjeGtFmv26EaXHO3k4AFJ5zXP1wP5ZrtClH6pQdajVOy9Zk/kICb27wktZ5nDN63ocAo+q9oB+bbNhupghX6ilXa7Mv6IZ0g=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|21061999006|8060799015|19110799012|12121999013|23021999003|51005399006|13031999003|15080799012|461199028|6090799003|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6qzUgRnIRCLQrA/sXlopFMwYv7nH7bYMtkQ8GYK7z7bg4i8tHi1NU8y89XA?=
 =?us-ascii?Q?qabJYv/PXn/+Yg+hVoH9MaiLKDOgUWHreE3zXZq78ZNnOuQ8N8NORiqdEU3u?=
 =?us-ascii?Q?ZelK8IZcY23+9g3dgOQ8u7dAjrZ3LrF8VUdKbti4Pgf2lS1yzrtIdfsajz7o?=
 =?us-ascii?Q?QELuQk3g5MIAFDfWaaXBP7+50wZejSy4SPr8agba8DBO+M0Mc6PQlBLb5fpU?=
 =?us-ascii?Q?+8Nhma3XLFFKxXLqsoG5ra3RQPooEM5dWnfSYNCnkZIyvFHSpmiju/tprVtu?=
 =?us-ascii?Q?KtE+AsJnuG4USRYgTzlInP7IfWeQOl/ZBMjftDOl8YX1gnn1cHRDxaDODkNf?=
 =?us-ascii?Q?xcTI7yg4UbK3Zw7eloDPvfz159IDrmP+z4+m/ITyckyKwLc73FR56Gee/s9z?=
 =?us-ascii?Q?rDccSQmqjEt1VEH7aprWxnutxnglI083Ri9sJxPHjrWCkg92krkijntw3jJs?=
 =?us-ascii?Q?j9M9xrrA5YkuQ3NpUx1Cs6TOTUcmyKAGsmMqJvU0uUOH7QMVfAWEL5TaLcV+?=
 =?us-ascii?Q?TKfW2tGk85QfuJUJhU1sQbuLF/ZtlOHSXGclD/zD5S34qwwqiqchHXgPd45k?=
 =?us-ascii?Q?sHQ2vf9A2cXn2AUveqHRGFLWaACrxxHJ5s1OZfVgkBtXxhqP8CjfH/RVAmUD?=
 =?us-ascii?Q?F2uCXRrKy80AWQmJOAIApGBGKn91rBSQFfU7V/1pAugEpa13/DKv0+E/Holf?=
 =?us-ascii?Q?tM3TnMIJIXZkXa5Pai8bgAOADpUh9MeGsNUqaiHyf3orkKf03os4hvdtS5oV?=
 =?us-ascii?Q?ZuUixc69bdoDfrXR3nk4aMJBlnckVGlnm0dQGXjD7AG+mNvSk5fsJ/d86Oj3?=
 =?us-ascii?Q?RU7IsrEAB3sRJ4ltw81dAUBfA60ZGk6m0OnnBzQuMwLJLUTa81fe01aGwyA5?=
 =?us-ascii?Q?VJQcuRfUBg1JhHLxvFa6i21bIms2R6Yh9mx0D2DcXnnW6Zs6NsiUIwmPRBLo?=
 =?us-ascii?Q?uK38GrTWBn9zNll/BFK6o6EHS7fuVFo+0la/lbPGcWGjm7ehhjBl6D/KA50x?=
 =?us-ascii?Q?RKNGeed4h/1yKyW+ddT4he6omIYqqAjcUCznnNPjKOKCkZq6urPL6Nuuz0YC?=
 =?us-ascii?Q?bCgVeIQDB5q/H3ISn0m9tAh+WMqFgeDr9j/d/6KC0d1B6ZMGlB1beVT65YJ0?=
 =?us-ascii?Q?BaXhVDCbyKqBkBRz1WIvyqF34RqHGruqcGc9mdoY31oX7TQC6qiqnyX2j5Pu?=
 =?us-ascii?Q?4els3pJ0XWCbk4TMuOBfG25oDeWB8H1PbyDYdRTQnDr1sO61pJZiRMOXc1w6?=
 =?us-ascii?Q?CXoo4x1oxkqDekGD2hAHSKFhG+RQ2Qbmpnp5XyUF+HS53seNUUv+3FgUhfAz?=
 =?us-ascii?Q?SyE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYFlaEUvTfmYGQO2h6bYxu6z0xSgNkJ2uLMxsiSnrMJovkTb+kxbHr3teAPq?=
 =?us-ascii?Q?gFuB8jh7LdBVJy/LChfOfpbcAyhOYq7PIHuEZWJ4PRahpzTX28c9BICsOcAG?=
 =?us-ascii?Q?MTCPH8Ru3F6dKi/qSvNCjtPdg++DpBMzRNGwcd6g8PP8XLtGCuS+6o7S57VU?=
 =?us-ascii?Q?8XmN13OgDDq4EBFqTzqqlIJoHsyrYoj3y982oOYpTjqjRIes4opP75f3kQLV?=
 =?us-ascii?Q?K70861ozPlLrFUXNbGF3FtA3nrAAmTV/o417mA6t0719BweERQTYCH8HtjzE?=
 =?us-ascii?Q?0jbIQgjnbkCXJVXeVaFO82dJvNHmZEBakVhLJD01pei5U5lB9DVh3U3KC43N?=
 =?us-ascii?Q?u+TYkeGnLNJRWRPfrAIxfkFMZ/+N8Eh6lDQrDn0M0VEUccs3kUrORz3sX4Tt?=
 =?us-ascii?Q?pljsUwcnS5z8msBu9ldo5vTAb3buO7Vvj0Hpl/ZT3y9fda1FxAzHUxG3g96U?=
 =?us-ascii?Q?5OEsBQCjHOJ80fhZxwvLUrj2y05RCqkXt8adLbTD6rc500wnnZa92/diTGax?=
 =?us-ascii?Q?iTUhFEmQ48NZ3ZBARwDYdp9blQnXaTn+FeSprwfH6kmVifU+9DVsIEGtxwJ6?=
 =?us-ascii?Q?nKfmQn43uI1edxBiJlFXak4VMzvYRSz4zlG/DjjqldRGKZVnC3KOIsTYjmvr?=
 =?us-ascii?Q?ll3gYKNYWP+S7si8opnOefUeXoLRCXXl5TmCjISPKKj07kHfi7mF59/szoI4?=
 =?us-ascii?Q?1IrZND3VObMeevXQSam1DoZc3fefaFl7i2LvK5yqf//fEKvRW8cQXQZQe8i+?=
 =?us-ascii?Q?pclhXHdhM8P6PLsYo6bPta6e7snvsSmYI8Z44gHB44yF4axMNS/fl5Dm7pW8?=
 =?us-ascii?Q?CIU3/ftkpMRE68CwLx/4jms+uunNkSshoBPlKvq7/vwpUtF/jBXZHrt+21GV?=
 =?us-ascii?Q?Iybnd//QBRHvPQYAQFIN89/Pa/nk2VXwGWPnDpz9zxC3xqqZcMK2x0Hxf6xe?=
 =?us-ascii?Q?ORENFylzvgOcaRYgG+04B8uGWRug5rthjP2Fv+ZYBKrs3XM8IG/XjDix3TZS?=
 =?us-ascii?Q?GOxfB1rgQTBpzbzExAX1On35ZJLI4hRTkjp8jL5OzjM3pR0kosUnVVj4dHVG?=
 =?us-ascii?Q?asvUuLKm6fSGyMY6g0gcesGugu8pi7CGzsMVLp7eo+5O7ocjqgKQgzyYeIfr?=
 =?us-ascii?Q?00+22sFdxiUaI/ik6FSfEeb/eKRzSPdEVYmGRSeeNAkN8BetrUGdn8/xXtQo?=
 =?us-ascii?Q?DD1jyv1U47aEgkj8uel5qrjZhC5Im9VVMQqeygS/HPis2sKxSRAw5Aau7Jns?=
 =?us-ascii?Q?jEdfMGXYclNUqsTWMPBevhHURbroWxV/6mddlD4P+A=3D=3D?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-15bf1.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df532ed-5c63-4fc1-755a-08de27883063
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:25:01.9673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7790
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

On Wed, Nov 19, 2025 at 10:02:23AM +0100, Maxime Ripard wrote:
> On Tue, Nov 18, 2025 at 02:36:09PM -0600, Chris Morgan wrote:
> > On Tue, Nov 18, 2025 at 09:46:04AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add support for the dw-hdmi-qp driver to handle devices with missing
> > > > HPD pins.
> > > > 
> > > > Since in this situation we are now polling for the EDID data via i2c
> > > > change the error message to a debug message when we are unable to
> > > > complete an i2c read, as a disconnected device would otherwise fill
> > > > dmesg with i2c read errors.
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > You must also disable any mode using the scrambler when there's no
> > > hotplug interrupt available.
> > 
> > Is there a simple way to do that? I'm not seeing any references to
> > scrambling in the current driver.
> > 
> > Should I just limit the rate to HDMI14_MAX_TMDSCLK (340000000)  under
> > dw_hdmi_qp_bridge_tmds_char_rate_valid() if using EDID polling? A
> > document I found online from Synopsys [1] claims that scrambling is
> > used by default at rates above 340 (if I'm reading it right) and used
> > opportunistically at rates below 340.
> 
> Yep, that's what you should be testing for :)
> 
> Maxime

Thanks, though now that I dig into it I'm a bit more confused on the
best way forward. It looks like for today the driver is hard-limited
to HDMI14_MAX_TMDSCLK because scrambling isn't supported. I'm assuming
it will be at some point, suggesting that we *will* need this in the
future. Is it sufficient to just add a comment there noting we need
to check, or should I add a check there (that does nothing today)
to ensure when we do support faster rates we are ready?

Thank you,
Chris
