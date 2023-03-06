Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D596AC9A2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 18:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767F10E197;
	Mon,  6 Mar 2023 17:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3910E2EF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678123165; x=1709659165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tr5B3KsXUr00luTQ2CIfWUtMztpA6dDyGsuXLxy4wKE=;
 b=TAQQZYYNX+peYv4xIdzRzFxeg05MiUFWl8ef3QaHVHJ3zIOory4wpaW1
 lCS2x1xUfwjrJ8vT21h28NrJszYWym9gkaRdnNNM+a/A+/m1+QK/sfpRa
 AEO0riwrUJ7VUvhrhvPE7STRJIfhjoj82L12WvVAnEJpXSuZla6iTxO8C
 Ry2YECxb8BjLtiwjadSvDX537GqiSHLDBvaTXTnaJ0GFYRM/f6dZc6Lzt
 pQrMMNy/PP0AR74FkfEwXD0a6TYGG/E3xFd0MKyXSYsLYDTIrCTTrjwex
 ya8P8TJOObdVsdYna6z7LO4Q6+GP0Zuq1Y+7N3cEDD6Wr+4mYm4aH4jDt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334331371"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="334331371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="922018483"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="922018483"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 09:19:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 09:18:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 09:18:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 09:18:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn5jPZouL+50OCcFILh8Fr8eShvHm1x1dRG/iJYqvqIsqPnmvx1sP7rw3GHiIiyEbL+qHPeMa07ms48Owgz7Mj4uuqL2VKrEfngSjS5PtnHsOLPlKo1NPFUsMcDcU84cSAw7kXmRoAfw9vGdiMvqhKRQa5eACsaKj85u3INtMtULXahfcXaEMqLDfnhTbA2NGsCkGdgjOOi+2BrqgRvOzNCHeUAJyaWZCukvUgtD6bDPvw4pPyNCzG/FcreYzk2eYYpqAAg9LvVuvrcshoRZ6EjGDk6chc+Bj8h4nzvIdWA1x6/QfQHFFmoiLcZ4Kfc1fMOYSaBi04H6Jt9T3rhxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzUNWxRGI0sCBhpXAQOw5SttUlGiXdN6dT0IutBPOO4=;
 b=nI110PmtBU+jHt3IgxLNz6Ggil6QmZFv2Hd2aNr5pLSvoyduC4iL+VT9hoWuN2UqjS7a08hDDY9gK+zo9+IjKQcZluIV5vLZ/hacvXVV1E7ZEsYDcEz9w9eK7kiez5FLJdJ/patWKJy1kwgZKCjsAeJaQbWw3gENAqHYreRT0TXDzJRfHbWucc9sO06j+QN9A+8tMSWoZgJMD0PzyFuYFBO3wji3SroTyX4EZsHgiV9cv8/pSWxwJlhJ23UVXrK3SfzjV3zSv4bvknDq0QAt8trTIEasIpOzTg2v3xpV9wOW1P6yafRKt0+BtsJjvFzZ/VhpS1VsLvORGAHnWXgk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:18:51 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::8ce:88fe:a727:2c7d]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::8ce:88fe:a727:2c7d%7]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 17:18:50 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "javierm@redhat.com"
 <javierm@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
 <festevam@gmail.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "edmund.j.dea@intel.com"
 <edmund.j.dea@intel.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
 "yannick.fertre@foss.st.com" <yannick.fertre@foss.st.com>,
 "raphael.gallais-pou@foss.st.com" <raphael.gallais-pou@foss.st.com>,
 "philippe.cornu@foss.st.com" <philippe.cornu@foss.st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
 <samuel@sholland.org>, "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>,
 "tomba@kernel.org" <tomba@kernel.org>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "hyun.kwon@xilinx.com" <hyun.kwon@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
Thread-Topic: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
Thread-Index: AQHZTFLqT/G+20B44Uqk84Ghxzzz9q7uBlug
Date: Mon, 6 Mar 2023 17:18:50 +0000
Message-ID: <BY5PR11MB418232ED63F992E309C9B2D18CB69@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4182:EE_|SJ0PR11MB5183:EE_
x-ms-office365-filtering-correlation-id: a1ba9e34-b9fb-4384-4f6c-08db1e66da64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /wAAl0bLOGE4tnjJP7vV9qlwQ4PRzD5R4UfHGfWP8yWVOCYAJ1EnyOBOUirE1LeZWmGqupsvXstU/C7e07+eaaQkoICgJ9yYA8KNVPuCmFFPugRjBo1B+0ybom4C+hFgS2XawGYAnR1W2UI84vx2dQwqjYMYUXsRSzu5MTawoeeZGs5Yw28/KpjtsyUqV3n+8f6j6TyYm1m5qJnaCDe7xwUF3P0eejpQtiU0TvZq3VmXNBqTjb/UiyLodQhEpgv94ie6uMmDBQwVLTBHe4Kz8kBl3FoC5duB0OrReCOlmDWNoKpUuHCNsJtCGS63Ocr2j3vRsHfFL4f+jvKFr4rdmnywJBcKe8jzHHUvXmWZlP9bNL8FKEhT0fyI7llgLECOGBQcIwr3mJXi+I5VLOecIu2LMg3MzE5RhGTE+toIdfQYFaAOD2LcRb9OcDHvCc3R08h92+csdAUcObEzAOKlZcZenx6egdlrZyibJGMjFR7CVpKOVPVuHSpCQXjH1uPcH90/2ypgH+vrEKwFn+6WHGzBQ1zib+TebbD4fsmn0d7Ssm9I/HyT2fV5Nm6UrYHi7RnKKWmE6YO+vsu2Xj7cqRnrmo6H3MZb/4J89Wzm+ZCgMwyq6SFgnTy9GUZ2gXg/iVjk+5+T6vBGfvlwBsCIFZjjeJcEbsRziZW/SP2aZjtZjXX6YmcV9gm2WiHavEGZD6CyBEfm0Osd+jawQkcHC2lI/iWc1RE002RPtXPNBnE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(110136005)(54906003)(316002)(83380400001)(55016003)(33656002)(86362001)(9686003)(186003)(2906002)(5660300002)(66476007)(76116006)(66446008)(66556008)(8936002)(66946007)(41300700001)(8676002)(4326008)(53546011)(478600001)(6506007)(26005)(64756008)(71200400001)(7416002)(7406005)(82960400001)(7696005)(122000001)(52536014)(921005)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y32UWqM8B7yUopZAxelLTE1aSq9ZaEpn6byispHi6ZJ3pCsPf91FrD80pDiE?=
 =?us-ascii?Q?Lpkn0IbqRpCcN68Xzyewcze9GFuslxznvYNGZ+r1QALGrPtTSjDR5ZZPT9Vo?=
 =?us-ascii?Q?vDqAFqCG3WIuCznlR+g1JpvOqVe740HSfeId+8l6tX9U0sibz/2+ICeT5qzQ?=
 =?us-ascii?Q?Ga4vu0hx6qWlI8H4kXM8ejv4owRh93v6lbU1r661NU2gMhy8gcevC7ZbW7eY?=
 =?us-ascii?Q?dt7eSYLpfxlg+0TN8w6deimIcT5LrnCzaP0P5df/FPWthUky60XgmsPwaq1x?=
 =?us-ascii?Q?LIOU8WMHZcXq7YRokuo4sfNybGqPPKN4USXQD86/lDTUZ52dLQf6xHkPkymV?=
 =?us-ascii?Q?Ekt+xGA5XpKcszqyuwpLduOSyn9m/yMcNq0CRVi3lyEhna+6Zd6C+c1VgGGu?=
 =?us-ascii?Q?LzBl//h1NrtAFTG0TUydfxvRagMcuBtiu6nKE0XeI7859042psjNv17J5Rh6?=
 =?us-ascii?Q?QKDdzOvcAA4c/sNrQjIyDUM7N0HHwziB/CowT0E+3lMifEWAPIOQcEn774VA?=
 =?us-ascii?Q?ZOGvB8/Upn0W7rlvxI+ReGXYc8RxaOfWfByHnhfOV3E1FKQKE7QkAVv4APOQ?=
 =?us-ascii?Q?mxJDN6e7WomqD+oKUhY36BunH6GY2vgPYX/Oxq92jhySYt6xG5eKymPaIP2M?=
 =?us-ascii?Q?mwNAqW+HQPhd2FVS866LI0gF0pLE583HwIHEDPe/lguf1HVtiIgNYNPuoK/b?=
 =?us-ascii?Q?S3BFaJdlqqi40lxjyXNtoVr+BNT66DTfWlHhp/JtWze9L8gS7/w7fuTUc2Bf?=
 =?us-ascii?Q?2arklfYXvS2mPp4d1+qgNgkPQvJgc0MgbqBvXNi3u3z6xNRKusOZE6/NNWvF?=
 =?us-ascii?Q?tEAIUGxXBxyR7XCZQBoQn/i2FxZsj/qJFEQS3Z2d4BYMoPEo9qMkL/2RXFl4?=
 =?us-ascii?Q?WQIA0tsARA3FbB/VEFHbmFArIbTfyjPo79xTBoOlH8QtIMXJm1L+41lUDKRE?=
 =?us-ascii?Q?bNuBlpxKiUdmVoFb3s402YCCMxENITacxMW3xpLqfCBZuO1BLNb8nGXdmrPI?=
 =?us-ascii?Q?/n8T84plhoaemWUjeQfZZRPn1s7M56VzZgE1n+qLCO/SnIWXFGmT+gZTinmR?=
 =?us-ascii?Q?XQmWbqLXtXqDM4cmavBGDd7/JNAQCP60MZHZ1/EwPVnuB2pzPNSuxe26vu+y?=
 =?us-ascii?Q?9SrOZAHIptJka9jtT8H6wJNIW3c1+GizNKyRgVLWMUWkRT1ETC/Jbn1fQo7U?=
 =?us-ascii?Q?5MYJjR+ArrWhXej7WWCP/F5zZXLXSbeTq30Z5R278JM2BH8c854QJt5lJ5n+?=
 =?us-ascii?Q?mil7UjD2boCbJRiZDRfJa7wNdIXDqIC1uQzVGbaFxkCTmaMUsQhT/2vh7V9b?=
 =?us-ascii?Q?pFdytV2MtPzIzDMt9sdix95uxXLPKIigiJLmpxYDVfFi2sxXv+GGaY9XMfA8?=
 =?us-ascii?Q?fGeRiwu9Y+l10D3Xa5W/kBKgXwFJ5ERxtKuBEgavw/s2EVU9wJRuerCif7b2?=
 =?us-ascii?Q?fK1vhcy3/i6lL5VfFjTn05EQpNrKZePbbXxaSnjKe1198dNnYDxQBoe0jmyc?=
 =?us-ascii?Q?MV5nnIZWsGpTacxcQDGQexWtcQgRMVercGKZBZh0jN/T4ciZF+MK/0OIApY9?=
 =?us-ascii?Q?GJVr1/B5mivBA7LOGeQ1I9ZgobCRz0ixX7TAxwjpOurIBvaiH0Ojdmlf/YMg?=
 =?us-ascii?Q?gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ba9e34-b9fb-4384-4f6c-08db1e66da64
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 17:18:50.2092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +leBX449Y6a3fBrjbgIpAOKIzEF4X6wS7tNiLwOAQ5tZ6U8MzwCAJ4B/k3U1z8rMBk0m4Eyl9HlAAcCf9OsukwNdBuYZrDN3cl4wbQVawY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: Wednesday, March 1, 2023 7:31 AM
> To: javierm@redhat.com; maarten.lankhorst@linux.intel.com;
> mripard@kernel.org; airlied@gmail.com; daniel@ffwll.ch; andrew@aj.id.au;
> laurentiu.palcu@oss.nxp.com; l.stach@pengutronix.de;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-imx@nxp.com; p.zabel@pengutronix.de;
> Chrisanthus, Anitha <anitha.chrisanthus@intel.com>;
> edmund.j.dea@intel.com; khilman@baylibre.com; jbrunet@baylibre.com;
> martin.blumenstingl@googlemail.com; alain.volmat@foss.st.com;
> yannick.fertre@foss.st.com; raphael.gallais-pou@foss.st.com;
> philippe.cornu@foss.st.com; mcoquelin.stm32@gmail.com;
> alexandre.torgue@foss.st.com; jernej.skrabec@gmail.com;
> samuel@sholland.org; jyri.sarha@iki.fi; tomba@kernel.org;
> linus.walleij@linaro.org; hyun.kwon@xilinx.com;
> laurent.pinchart@ideasonboard.com
> Cc: dri-devel@lists.freedesktop.org; linux-aspeed@lists.ozlabs.org; linux=
-arm-
> kernel@lists.infradead.org; linux-amlogic@lists.infradead.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-sunxi@lists.linux.dev; Thomas
> Zimmermann <tzimmermann@suse.de>
> Subject: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
>=20
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index d29c678f6c91..24035b53441c 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -15,7 +15,7 @@
>=20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_module.h>
> @@ -562,7 +562,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_register;
>=20
> -	drm_fbdev_generic_setup(&kmb->drm, 0);
> +	drm_fbdev_dma_setup(&kmb->drm, 0);
>=20
>  	return 0;
>=20
> --
> 2.39.2

