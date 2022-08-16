Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC81595EAE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C152902EE;
	Tue, 16 Aug 2022 15:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D02A5074
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORaQT5FMdHDtLfDkxuHbSwjBlIedmvODuaSB6vBuavFdgtN7q1hGQ7fG4j8fddmhCQwntBJ66t7FzMH4Ung7K5gX4ZqR7GZRNNnslzGJH6thhMjpOt7rqZUAk3PZHA10zBXw0d04x18HqoryB5bD39us5kYA2U2iWG7GFRqViOAVJcnwvwHr48CZfCTlFgee2+4A/mhWSuG4+au9PmmyeUPyQc9r8lH1EU/1SiL3/gZUnCGPW69b75PNyrzuDntsSsXHfjFM8Hb0exUYKKv43ecpnCeBdnwjmiK2ae90Np5apXq40WaPmDAZnBEghFAoMZO/sQnS47RXVr1oZnUpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3ghqWr2ZeJ/4Y7xRaERX6yO999ZDyERaMGCeEFbaIY=;
 b=BMBD5dyeo3dsq8vtcIFoJdY3NXmVdz8i5U6SA6Bc7Wml4Xbkv8whmMNO239LIqmSFkjjCIrWXMzzE2KSPbbFJc5aubh21ddfuUfnLdaDBm/4Y0hVuRe+IIcamUAkeTw5XJ49UY57/5GFw8rq/9OFGKlNd09odQfqJkVHpuOEnGpBfJX3Zbyo/lM5+l3eO2mLk9jqwfiyQmMrDZca4imjPxfCC68cZVUlfN7aV2pgGP5q3ij2O+Lz+YRgLmetBD5kR34RgdLW78XtDOkcUdAvdF+W/yO2cqVDv5YjfWHs7LcadnqvsqoQwRcY5boba+C7eLGPWCN3UwcFGPpCfOosEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3ghqWr2ZeJ/4Y7xRaERX6yO999ZDyERaMGCeEFbaIY=;
 b=BQR7An4UNmdqgd0kufc9IhjTKnd5qQ5fNm0HhdB4hie+d0byrTjdFrstJSWOZ5HbPA7rf2+Bh5M+gCyMl+Iod92BK56HkCAmypXs5gdv5ivRn8Jm2wltxCTc2u9g43QETgx31dlmeK5u/TaPVsu8XZrRXMbYyMdzQiQIFrxxb0M=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by DB7PR04MB5033.eurprd04.prod.outlook.com (2603:10a6:10:16::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 15:01:20 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 15:01:20 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>
Subject: Re: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYplZ4V/zP2ovEr0Os9Wz8+HCUmq2xnDwAgAAY1wA=
Date: Tue, 16 Aug 2022 15:01:20 +0000
Message-ID: <76e2dae5048355b39b111e4017b69a085efa8adf.camel@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
 <20220802095843.14614-4-olivier.masse@nxp.com>
 <ae9b779bb6701d3d08866e7f4e9cc6f5c23c7bd0.camel@ndufresne.ca>
In-Reply-To: <ae9b779bb6701d3d08866e7f4e9cc6f5c23c7bd0.camel@ndufresne.ca>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec7821c3-e8b6-4c02-e374-08da7f982d87
x-ms-traffictypediagnostic: DB7PR04MB5033:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O148SRlYfc82GcYg4b6MfP6PzytguVeQATARHz+aHy8IUnvA7gI206BmtnTPoJL1JxOKFlHylu6PG60sbn9xtXG6nvWvJxzEsfHzr4f26p2gcPMaVvtyJWPfUg+QaZRMRSGwyfWkHBlIneluUYNYzZ5uk/zMfc41v+29sKkPs3VPb2YzZjZXdKM2mTTCwpmwY0W2w16gdCKriNCTvVjb2IM3Eq+gR6UdaMF2IxWsd5J1R4uNzCZCavAi+a9KIL2NanmttYvae1wCAuK9tFy3NINt6R2XrMbpQa+X+MMSafXJ9gtiYprsIT81kLJoLQNsw44yI8DFxtv/R6JZOxlLJOG2rpwxXX2aMX7i30TInTd/PAwDNzRjyXk6lRnbi7KY5aI7PzknnOdiFdIUTWnesHiAVpRBbL0vGU43j2Dp+mOxpGa7FAuQyddG6praTn7MklRbf0r0MqejA5C0kKu0mDW2JyRrungyqjOWsOnOhYKhWBFIaBNXVtKDMydUhDKmuRzVtG8l26ENXboxSM+0l8WVuOOtySMYhVn4HJQgXohjV8P/PjW3fgk6dsgQOTPKBqNNRAVZzaeZpWZR3C0XQMuAsRH2IX7fZdC+GFsnAW5tmMLMAL3c1lxDELBM67wWewUniqPG4GmaO3xX4A8PUJMgDHaWjauQhVVa3hL3mB1h7zscTl46R1qDgX79MFKGLCxZlAI75p4Q+/FToWy2g0UN5kYES4DfMjIgVFXvNjoeXbqorsmaUFpOLhBwap9aivhLxwgZhzsTKRDdRWHv7b8T4hx/BRBYZvifAzdxyAaYn7GGiXLFtZ3+4IEehEMtnheS8divtKgTvEA2TFy5rX+1Ufi8Mnutp10cqVEVMd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(7416002)(186003)(71200400001)(478600001)(41300700001)(26005)(6512007)(86362001)(38070700005)(6506007)(83380400001)(2616005)(66574015)(966005)(6486002)(36756003)(76116006)(54906003)(66946007)(110136005)(8676002)(66446008)(64756008)(4326008)(91956017)(66476007)(66556008)(5660300002)(38100700002)(122000001)(316002)(2906002)(8936002)(30864003)(44832011)(99106002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?CxSH6WDg2uvSQed4DQskToOVsXt3n+nyG7TRHW88iIgSwYHUJGS7JovYc?=
 =?iso-8859-15?Q?qjsYMgnip1Hv4+6cYNRyfqQTuDNySuxLT9QKWJn1J/dbopU2+N0HBEoDY?=
 =?iso-8859-15?Q?a4MffxmdsxcRkzmSqpBYID95rcJpy5XOPZdGx1TRYA9MOMUazfBT3gSjK?=
 =?iso-8859-15?Q?kwh87ozql8tL775/ymNrZPFSrL4NxGPUCnQ7hYr3HHMWr2ut+PbQsCxCj?=
 =?iso-8859-15?Q?cWXL2aSbM/Cex+ZPYVCoOch1b4/Z3IT7nmawEMaOUBtmJPrYw8FbG3cDw?=
 =?iso-8859-15?Q?4EgRr2kvH1dmURY8MmI96NViSBJDSCEn812SkQTANUjNydtYkuWHTdRNq?=
 =?iso-8859-15?Q?vFXf0RWEOe1RSbeXUa+GkTQcuAVddzaCGu6VaNG6mcEwqcXtoYai1fqSn?=
 =?iso-8859-15?Q?P2fynjy8sa3PaPoyYAeOTq01dDVRZ0hqjPtrua7lCTj29ZagwzFkfhGgx?=
 =?iso-8859-15?Q?/PfqRBYIT6iROyIu2b66dlZ7nVAcFkHWbzo5TuRZkW4APatFnmVnj33sE?=
 =?iso-8859-15?Q?0N1XvwUg6vpV55JDyO31VlxZgthbn+CWl/Mm6UER5cTS5ot8qYq4bDkL5?=
 =?iso-8859-15?Q?Wa3JAK6lvMxDxfunJ+T+2VXOny3/fcojeA4Nqqr3sXFsJ8RYgKQuFtx39?=
 =?iso-8859-15?Q?NPvw/1BhtxJu31oPhnI82dtYxdJPL24m4085zYPUeZwj+oHEk7qEt4ge1?=
 =?iso-8859-15?Q?Mj27xkoaPciRoLGNqMIQILH3f/2r0h5T4gqADB38uuE1HhdY9zzeKXaax?=
 =?iso-8859-15?Q?5WPRnBEypzBrXs+d349lsoaonYBWt7gD0Vv/OlNnxSv/N713sf4AbIZLJ?=
 =?iso-8859-15?Q?NwmmpMhvl8HxWfxtzpPuznpbwsyZalF2Ls0gLK+Q0P2NpjBgyOJGzgJjT?=
 =?iso-8859-15?Q?lBqe5RK+vQV+4aAzNRIu3CbAt+dUX02v0SAmJUpkegT4Xy5fywsCIppZg?=
 =?iso-8859-15?Q?9AjGMaDamvZdL61M3mCJ7DzsOel/v1NJn4Gm5aVQL0lpq7XJ4znwSrIph?=
 =?iso-8859-15?Q?hElG9jNq4gCfP6k6LjE7pHJxC5Blod6DAMgIbdjqMT3C9Wjnybh3mu/DI?=
 =?iso-8859-15?Q?GxjVHMIFZ3rTORgKEyuOfydsB+uecRBF5P0WCPjFUfA10gn8ciPUdMGJ9?=
 =?iso-8859-15?Q?OZvxggo9L1hsG2DMH70Vomg2PLIfshLeQENTlUtNpfa3wGuw6Fb4C5MAT?=
 =?iso-8859-15?Q?gnSV3Y6CHeNOfl/X0kLcpTLBb651dPAx5eME0S9RblLq4T1IxtufSQKcI?=
 =?iso-8859-15?Q?pKhPxplrWYNiEIGdzOBwjTKn1pYjY7V9RLLGw9c6itBKUZ9gpW1V0/bfy?=
 =?iso-8859-15?Q?S+SagZuYFHkq5AhMP7z5cvWKciJ3WiM6Si1AAvm9CKfn7eynYrSJCGuWA?=
 =?iso-8859-15?Q?RXjRmC+L+iMFOo8N6qNgIQM91FT7/8qlRWKVyCsuUWAXDYkmz6ulUda9S?=
 =?iso-8859-15?Q?SA85PKZUUzPm84cOuMZUuhXNMAWUomWbh59scc9hQciT5Z5/egn4fVyjf?=
 =?iso-8859-15?Q?pznAps32xNdvRgc7u329+UQy8w1tuLa0QMCyGMHzbhO+RHhAj0ZsIfXG4?=
 =?iso-8859-15?Q?ejktapsYVpTRyDtWI1rX9Zmzwirs41fk016TQlAJffDP8sKjOHiqN4EjD?=
 =?iso-8859-15?Q?lVkGnTLeQXGb4ac9P6K2HIlJxCIr+PAh+Z0YxUmIMe6VUMTiPbqCNbeNt?=
 =?iso-8859-15?Q?XE9W?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <3E961E8B09ABE04CA34BBBF8D726AA55@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7821c3-e8b6-4c02-e374-08da7f982d87
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 15:01:20.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKyNELYbPEEgpiWc+ZOl4m/F/K2IY0vuISLhE6pA3GztGovmUwtC+sY/Mb5ti5G1yCW1eYI1c4XW2v6/aay9cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5033
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "jerome@forissier.org" <jerome@forissier.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for your comment, indeed these PR is linked to OPTEE OS.
This one is using the same bindings to define the Secure Data Path
reserved memory:
https://github.com/OP-TEE/optee_os/commit/eb108a04369fbfaf60c03c0e00bbe9489=
a761c69

However, I'm not aware of another shared heap that could match our
need.
For information. it was previously done using ION heap:
https://www.slideshare.net/linaroorg/bud17400-secure-data-path-with-optee

Best regards,
Olivier

On mar., 2022-08-16 at 09:31 -0400, Nicolas Dufresne wrote:
> Caution: EXT Email
>=20
> Hi,
>=20
> Le mardi 02 ao=FBt 2022 =E0 11:58 +0200, Olivier Masse a =E9crit :
> > add Linaro secure heap bindings: linaro,secure-heap
>=20
> Just a curiosity, how is this specific to Linaro OPTEE OS ? Shouldn't
> it be "de-
> linaro-ified" somehow ?
>=20
> regards,
> Nicolas
>=20
> > use genalloc to allocate/free buffer from buffer pool.
> > buffer pool info is from dts.
> > use sg_table instore the allocated memory info, the length of
> > sg_table is 1.
> > implement secure_heap_buf_ops to implement buffer share in
> > difference device:
> > 1. Userspace passes this fd to all drivers it wants this buffer
> > to share with: First the filedescriptor is converted to a &dma_buf
> > using
> > dma_buf_get(). Then the buffer is attached to the device using
> > dma_buf_attach().
> > 2. Once the buffer is attached to all devices userspace can
> > initiate DMA
> > access to the shared buffer. In the kernel this is done by calling
> > dma_buf_map_attachment()
> > 3. get sg_table with dma_buf_map_attachment in difference device.
> >=20
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > ---
> >  drivers/dma-buf/heaps/Kconfig       |  21 +-
> >  drivers/dma-buf/heaps/Makefile      |   1 +
> >  drivers/dma-buf/heaps/secure_heap.c | 588
> > ++++++++++++++++++++++++++++
> >  3 files changed, 606 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
> >=20
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-
> > buf/heaps/Kconfig
> > index 6a33193a7b3e..b2406932192e 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -1,8 +1,12 @@
> > -config DMABUF_HEAPS_DEFERRED_FREE
> > -     tristate
> > +menuconfig DMABUF_HEAPS_DEFERRED_FREE
> > +     bool "DMA-BUF heaps deferred-free library"
> > +     help
> > +       Choose this option to enable the DMA-BUF heaps deferred-
> > free library.
> >=20
> > -config DMABUF_HEAPS_PAGE_POOL
> > -     tristate
> > +menuconfig DMABUF_HEAPS_PAGE_POOL
> > +     bool "DMA-BUF heaps page-pool library"
> > +     help
> > +       Choose this option to enable the DMA-BUF heaps page-pool
> > library.
> >=20
> >  config DMABUF_HEAPS_SYSTEM
> >       bool "DMA-BUF System Heap"
> > @@ -26,3 +30,12 @@ config DMABUF_HEAPS_DSP
> >            Choose this option to enable the dsp dmabuf heap. The
> > dsp heap
> >            is allocated by gen allocater. it's allocated according
> > the dts.
> >            If in doubt, say Y.
> > +
> > +config DMABUF_HEAPS_SECURE
> > +     tristate "DMA-BUF Secure Heap"
> > +     depends on DMABUF_HEAPS && DMABUF_HEAPS_DEFERRED_FREE
> > +     help
> > +       Choose this option to enable the secure dmabuf heap. The
> > secure heap
> > +       pools are defined according to the DT. Heaps are allocated
> > +       in the pools using gen allocater.
> > +       If in doubt, say Y.
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-
> > buf/heaps/Makefile
> > index e70722ea615e..08f6aa5919d1 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)  +=3D
> > page_pool.o
> >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)    +=3D system_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_CMA)               +=3D cma_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_DSP)          +=3D dsp_heap.o
> > +obj-$(CONFIG_DMABUF_HEAPS_SECURE)    +=3D secure_heap.o
> > diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-
> > buf/heaps/secure_heap.c
> > new file mode 100644
> > index 000000000000..31aac5d050b4
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/secure_heap.c
> > @@ -0,0 +1,588 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * DMABUF secure heap exporter
> > + *
> > + * Copyright 2021 NXP.
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/highmem.h>
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +#include <linux/vmalloc.h>
> > +
> > +#include "deferred-free-helper.h"
> > +#include "page_pool.h"
> > +
> > +#define MAX_SECURE_HEAP 2
> > +#define MAX_HEAP_NAME_LEN 32
> > +
> > +struct secure_heap_buffer {
> > +     struct dma_heap *heap;
> > +     struct list_head attachments;
> > +     struct mutex lock;
> > +     unsigned long len;
> > +     struct sg_table sg_table;
> > +     int vmap_cnt;
> > +     struct deferred_freelist_item deferred_free;
> > +     void *vaddr;
> > +     bool uncached;
> > +};
> > +
> > +struct dma_heap_attachment {
> > +     struct device *dev;
> > +     struct sg_table *table;
> > +     struct list_head list;
> > +     bool no_map;
> > +     bool mapped;
> > +     bool uncached;
> > +};
> > +
> > +struct secure_heap_info {
> > +     struct gen_pool *pool;
> > +
> > +     bool no_map;
> > +};
> > +
> > +struct rmem_secure {
> > +     phys_addr_t base;
> > +     phys_addr_t size;
> > +
> > +     char name[MAX_HEAP_NAME_LEN];
> > +
> > +     bool no_map;
> > +};
> > +
> > +static struct rmem_secure secure_data[MAX_SECURE_HEAP] =3D {0};
> > +static unsigned int secure_data_count;
> > +
> > +static struct sg_table *dup_sg_table(struct sg_table *table)
> > +{
> > +     struct sg_table *new_table;
> > +     int ret, i;
> > +     struct scatterlist *sg, *new_sg;
> > +
> > +     new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> > +     if (!new_table)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     ret =3D sg_alloc_table(new_table, table->orig_nents,
> > GFP_KERNEL);
> > +     if (ret) {
> > +             kfree(new_table);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     new_sg =3D new_table->sgl;
> > +     for_each_sgtable_sg(table, sg, i) {
> > +             sg_set_page(new_sg, sg_page(sg), sg->length, sg-
> > >offset);
> > +             new_sg->dma_address =3D sg->dma_address;
> > +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> > +             new_sg->dma_length =3D sg->dma_length;
> > +#endif
> > +             new_sg =3D sg_next(new_sg);
> > +     }
> > +
> > +     return new_table;
> > +}
> > +
> > +static int secure_heap_attach(struct dma_buf *dmabuf,
> > +                           struct dma_buf_attachment *attachment)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct secure_heap_info *info =3D dma_heap_get_drvdata(buffer-
> > >heap);
> > +     struct dma_heap_attachment *a;
> > +     struct sg_table *table;
> > +
> > +     a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> > +     if (!a)
> > +             return -ENOMEM;
> > +
> > +     table =3D dup_sg_table(&buffer->sg_table);
> > +     if (IS_ERR(table)) {
> > +             kfree(a);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     a->table =3D table;
> > +     a->dev =3D attachment->dev;
> > +     INIT_LIST_HEAD(&a->list);
> > +     a->no_map =3D info->no_map;
> > +     a->mapped =3D false;
> > +     a->uncached =3D buffer->uncached;
> > +     attachment->priv =3D a;
> > +
> > +     mutex_lock(&buffer->lock);
> > +     list_add(&a->list, &buffer->attachments);
> > +     mutex_unlock(&buffer->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static void secure_heap_detach(struct dma_buf *dmabuf,
> > +                            struct dma_buf_attachment *attachment)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct dma_heap_attachment *a =3D attachment->priv;
> > +
> > +     mutex_lock(&buffer->lock);
> > +     list_del(&a->list);
> > +     mutex_unlock(&buffer->lock);
> > +
> > +     sg_free_table(a->table);
> > +     kfree(a->table);
> > +     kfree(a);
> > +}
> > +
> > +static struct sg_table *secure_heap_map_dma_buf(struct
> > dma_buf_attachment *attachment,
> > +                                             enum
> > dma_data_direction direction)
> > +{
> > +     struct dma_heap_attachment *a =3D attachment->priv;
> > +     struct sg_table *table =3D a->table;
> > +     int attr =3D 0;
> > +     int ret;
> > +
> > +     if (!a->no_map) {
> > +             if (a->uncached)
> > +                     attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> > +
> > +             ret =3D dma_map_sgtable(attachment->dev, table,
> > direction, attr);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +
> > +             a->mapped =3D true;
> > +     }
> > +
> > +     return table;
> > +}
> > +
> > +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment
> > *attachment,
> > +                                   struct sg_table *table,
> > +                                   enum dma_data_direction
> > direction)
> > +{
> > +     struct dma_heap_attachment *a =3D attachment->priv;
> > +     int attr =3D 0;
> > +
> > +     if (!a->no_map) {
> > +             if (a->uncached)
> > +                     attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> > +
> > +             a->mapped =3D false;
> > +             dma_unmap_sgtable(attachment->dev, table, direction,
> > attr);
> > +     }
> > +}
> > +
> > +static int secure_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > +                                             enum
> > dma_data_direction direction)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct dma_heap_attachment *a;
> > +
> > +     mutex_lock(&buffer->lock);
> > +
> > +     if (buffer->vmap_cnt)
> > +             invalidate_kernel_vmap_range(buffer->vaddr, buffer-
> > >len);
> > +
> > +     if (!buffer->uncached) {
> > +             list_for_each_entry(a, &buffer->attachments, list) {
> > +                     if (!a->mapped)
> > +                             continue;
> > +                     dma_sync_sgtable_for_cpu(a->dev, a->table,
> > direction);
> > +             }
> > +     }
> > +     mutex_unlock(&buffer->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int secure_heap_dma_buf_end_cpu_access(struct dma_buf
> > *dmabuf,
> > +                                           enum dma_data_direction
> > direction)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct dma_heap_attachment *a;
> > +
> > +     mutex_lock(&buffer->lock);
> > +
> > +     if (buffer->vmap_cnt)
> > +             flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> > +
> > +     if (!buffer->uncached) {
> > +             list_for_each_entry(a, &buffer->attachments, list) {
> > +                     if (!a->mapped)
> > +                             continue;
> > +                     dma_sync_sgtable_for_device(a->dev, a->table,=20
> > direction);
> > +             }
> > +     }
> > +     mutex_unlock(&buffer->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int secure_heap_mmap(struct dma_buf *dmabuf, struct
> > vm_area_struct *vma)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct sg_table *table =3D &buffer->sg_table;
> > +     unsigned long addr =3D vma->vm_start;
> > +     struct sg_page_iter piter;
> > +     int ret;
> > +
> > +     if (buffer->uncached)
> > +             vma->vm_page_prot =3D pgprot_writecombine(vma-
> > >vm_page_prot);
> > +
> > +     for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> > +             struct page *page =3D sg_page_iter_page(&piter);
> > +
> > +             ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> > PAGE_SIZE,
> > +                                   vma->vm_page_prot);
> > +             if (ret)
> > +                     return ret;
> > +             addr +=3D PAGE_SIZE;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static void *secure_heap_do_vmap(struct secure_heap_buffer
> > *buffer)
> > +{
> > +     struct sg_table *table =3D &buffer->sg_table;
> > +     int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > +     struct page **pages =3D vmalloc(sizeof(struct page *) *
> > npages);
> > +     struct page **tmp =3D pages;
> > +     struct sg_page_iter piter;
> > +     pgprot_t pgprot =3D PAGE_KERNEL;
> > +     void *vaddr;
> > +
> > +     if (!pages)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     if (buffer->uncached)
> > +             pgprot =3D pgprot_writecombine(PAGE_KERNEL);
> > +
> > +     for_each_sgtable_page(table, &piter, 0) {
> > +             WARN_ON(tmp - pages >=3D npages);
> > +             *tmp++ =3D sg_page_iter_page(&piter);
> > +     }
> > +
> > +     vaddr =3D vmap(pages, npages, VM_MAP, pgprot);
> > +     vfree(pages);
> > +
> > +     if (!vaddr)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     return vaddr;
> > +}
> > +
> > +static int secure_heap_vmap(struct dma_buf *dmabuf, struct
> > dma_buf_map *map)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     void *vaddr;
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&buffer->lock);
> > +     if (buffer->vmap_cnt) {
> > +             buffer->vmap_cnt++;
> > +             goto out;
> > +     }
> > +
> > +     vaddr =3D secure_heap_do_vmap(buffer);
> > +     if (IS_ERR(vaddr)) {
> > +             ret =3D PTR_ERR(vaddr);
> > +             goto out;
> > +     }
> > +
> > +     buffer->vaddr =3D vaddr;
> > +     buffer->vmap_cnt++;
> > +     dma_buf_map_set_vaddr(map, buffer->vaddr);
> > +out:
> > +     mutex_unlock(&buffer->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static void secure_heap_vunmap(struct dma_buf *dmabuf, struct
> > dma_buf_map *map)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +
> > +     mutex_lock(&buffer->lock);
> > +     if (!--buffer->vmap_cnt) {
> > +             vunmap(buffer->vaddr);
> > +             buffer->vaddr =3D NULL;
> > +     }
> > +     mutex_unlock(&buffer->lock);
> > +     dma_buf_map_clear(map);
> > +}
> > +
> > +static void secure_heap_zero_buffer(struct secure_heap_buffer
> > *buffer)
> > +{
> > +     struct sg_table *sgt =3D &buffer->sg_table;
> > +     struct sg_page_iter piter;
> > +     struct page *p;
> > +     void *vaddr;
> > +
> > +     for_each_sgtable_page(sgt, &piter, 0) {
> > +             p =3D sg_page_iter_page(&piter);
> > +             vaddr =3D kmap_atomic(p);
> > +             memset(vaddr, 0, PAGE_SIZE);
> > +             kunmap_atomic(vaddr);
> > +     }
> > +}
> > +
> > +static void secure_heap_buf_free(struct deferred_freelist_item
> > *item,
> > +                              enum df_reason reason)
> > +{
> > +     struct secure_heap_buffer *buffer;
> > +     struct secure_heap_info *info;
> > +     struct sg_table *table;
> > +     struct scatterlist *sg;
> > +     int i;
> > +
> > +     buffer =3D container_of(item, struct secure_heap_buffer,
> > deferred_free);
> > +     info =3D dma_heap_get_drvdata(buffer->heap);
> > +
> > +     if (!info->no_map) {
> > +             // Zero the buffer pages before adding back to the
> > pool
> > +             if (reason =3D=3D DF_NORMAL)
> > +                     secure_heap_zero_buffer(buffer);
> > +     }
> > +
> > +     table =3D &buffer->sg_table;
> > +     for_each_sg(table->sgl, sg, table->nents, i)
> > +             gen_pool_free(info->pool, sg_dma_address(sg),
> > sg_dma_len(sg));
> > +
> > +     sg_free_table(table);
> > +     kfree(buffer);
> > +}
> > +
> > +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > +
> > +     deferred_free(&buffer->deferred_free, secure_heap_buf_free,
> > npages);
> > +}
> > +
> > +static const struct dma_buf_ops secure_heap_buf_ops =3D {
> > +     .attach =3D secure_heap_attach,
> > +     .detach =3D secure_heap_detach,
> > +     .map_dma_buf =3D secure_heap_map_dma_buf,
> > +     .unmap_dma_buf =3D secure_heap_unmap_dma_buf,
> > +     .begin_cpu_access =3D secure_heap_dma_buf_begin_cpu_access,
> > +     .end_cpu_access =3D secure_heap_dma_buf_end_cpu_access,
> > +     .mmap =3D secure_heap_mmap,
> > +     .vmap =3D secure_heap_vmap,
> > +     .vunmap =3D secure_heap_vunmap,
> > +     .release =3D secure_heap_dma_buf_release,
> > +};
> > +
> > +static struct dma_buf *secure_heap_do_allocate(struct dma_heap
> > *heap,
> > +                                            unsigned long len,
> > +                                            unsigned long
> > fd_flags,
> > +                                            unsigned long
> > heap_flags,
> > +                                            bool uncached)
> > +{
> > +     struct secure_heap_buffer *buffer;
> > +     struct secure_heap_info *info =3D dma_heap_get_drvdata(heap);
> > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +     unsigned long size =3D roundup(len, PAGE_SIZE);
> > +     struct dma_buf *dmabuf;
> > +     struct sg_table *table;
> > +     int ret =3D -ENOMEM;
> > +     unsigned long phy_addr;
> > +
> > +     buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> > +     if (!buffer)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     INIT_LIST_HEAD(&buffer->attachments);
> > +     mutex_init(&buffer->lock);
> > +     buffer->heap =3D heap;
> > +     buffer->len =3D size;
> > +     buffer->uncached =3D uncached;
> > +
> > +     phy_addr =3D gen_pool_alloc(info->pool, size);
> > +     if (!phy_addr)
> > +             goto free_buffer;
> > +
> > +     table =3D &buffer->sg_table;
> > +     if (sg_alloc_table(table, 1, GFP_KERNEL))
> > +             goto free_pool;
> > +
> > +     sg_set_page(table->sgl, phys_to_page(phy_addr), size, 0);
> > +     sg_dma_address(table->sgl) =3D phy_addr;
> > +     sg_dma_len(table->sgl) =3D size;
> > +
> > +     /* create the dmabuf */
> > +     exp_info.exp_name =3D dma_heap_get_name(heap);
> > +     exp_info.ops =3D &secure_heap_buf_ops;
> > +     exp_info.size =3D buffer->len;
> > +     exp_info.flags =3D fd_flags;
> > +     exp_info.priv =3D buffer;
> > +     dmabuf =3D dma_buf_export(&exp_info);
> > +     if (IS_ERR(dmabuf)) {
> > +             ret =3D PTR_ERR(dmabuf);
> > +             goto free_pages;
> > +     }
> > +
> > +     return dmabuf;
> > +
> > +free_pages:
> > +     sg_free_table(table);
> > +
> > +free_pool:
> > +     gen_pool_free(info->pool, phy_addr, size);
> > +
> > +free_buffer:
> > +     mutex_destroy(&buffer->lock);
> > +     kfree(buffer);
> > +
> > +     return ERR_PTR(ret);
> > +}
> > +
> > +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> > +                                         unsigned long len,
> > +                                         unsigned long fd_flags,
> > +                                         unsigned long heap_flags)
> > +{
> > +     // use uncache buffer here by default
> > +     return secure_heap_do_allocate(heap, len, fd_flags,
> > heap_flags, true);
> > +     // use cache buffer
> > +     // return secure_heap_do_allocate(heap, len, fd_flags,
> > heap_flags, false);
> > +}
> > +
> > +static const struct dma_heap_ops secure_heap_ops =3D {
> > +     .allocate =3D secure_heap_allocate,
> > +};
> > +
> > +static int secure_heap_add(struct rmem_secure *rmem)
> > +{
> > +     struct dma_heap *secure_heap;
> > +     struct dma_heap_export_info exp_info;
> > +     struct secure_heap_info *info =3D NULL;
> > +     struct gen_pool *pool =3D NULL;
> > +     int ret =3D -EINVAL;
> > +
> > +     if (rmem->base =3D=3D 0 || rmem->size =3D=3D 0) {
> > +             pr_err("secure_data base or size is not correct\n");
> > +             goto error;
> > +     }
> > +
> > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info) {
> > +             pr_err("dmabuf info allocation failed\n");
> > +             ret =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > +     if (!pool) {
> > +             pr_err("can't create gen pool\n");
> > +             ret =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> > +             pr_err("failed to add memory into pool\n");
> > +             ret =3D -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     info->pool =3D pool;
> > +     info->no_map =3D rmem->no_map;
> > +
> > +     exp_info.name =3D rmem->name;
> > +     exp_info.ops =3D &secure_heap_ops;
> > +     exp_info.priv =3D info;
> > +
> > +     secure_heap =3D dma_heap_add(&exp_info);
> > +     if (IS_ERR(secure_heap)) {
> > +             pr_err("dmabuf secure heap allocation failed\n");
> > +             ret =3D PTR_ERR(secure_heap);
> > +             goto error;
> > +     }
> > +
> > +     return 0;
> > +
> > +error:
> > +     kfree(info);
> > +     if (pool)
> > +             gen_pool_destroy(pool);
> > +
> > +     return ret;
> > +}
> > +
> > +static int secure_heap_create(void)
> > +{
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < secure_data_count; i++) {
> > +             ret =3D secure_heap_add(&secure_data[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
> > +                                      struct device *dev)
> > +{
> > +     dev_set_drvdata(dev, rmem);
> > +     return 0;
> > +}
> > +
> > +static void rmem_secure_heap_device_release(struct reserved_mem
> > *rmem,
> > +                                      struct device *dev)
> > +{
> > +     dev_set_drvdata(dev, NULL);
> > +}
> > +
> > +static const struct reserved_mem_ops rmem_dma_ops =3D {
> > +     .device_init    =3D rmem_secure_heap_device_init,
> > +     .device_release =3D rmem_secure_heap_device_release,
> > +};
> > +
> > +static int __init rmem_secure_heap_setup(struct reserved_mem
> > *rmem)
> > +{
> > +     if (secure_data_count < MAX_SECURE_HEAP) {
> > +             int name_len =3D 0;
> > +             char *s =3D rmem->name;
> > +
> > +             secure_data[secure_data_count].base =3D rmem->base;
> > +             secure_data[secure_data_count].size =3D rmem->size;
> > +             secure_data[secure_data_count].no_map =3D
> > +                     (of_get_flat_dt_prop(rmem->fdt_node, "no-
> > map", NULL) !=3D NULL);
> > +
> > +             while (name_len < MAX_HEAP_NAME_LEN) {
> > +                     if ((*s =3D=3D '@') || (*s =3D=3D '\0'))
> > +                             break;
> > +                     name_len++;
> > +                     s++;
> > +             }
> > +             if (name_len =3D=3D MAX_HEAP_NAME_LEN)
> > +                     name_len--;
> > +
> > +             strncpy(secure_data[secure_data_count].name, rmem-
> > >name, name_len);
> > +
> > +             rmem->ops =3D &rmem_dma_ops;
> > +             pr_info("Reserved memory: DMA buf secure pool %s at
> > %pa, size %ld MiB\n",
> > +                     secure_data[secure_data_count].name,
> > +                     &rmem->base, (unsigned long)rmem->size /
> > SZ_1M);
> > +
> > +             secure_data_count++;
> > +             return 0;
> > +     }
> > +     WARN_ONCE(1, "Cannot handle more than %u secure heaps\n",
> > MAX_SECURE_HEAP);
> > +     return -EINVAL;
> > +}
> > +
> > +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap",
> > rmem_secure_heap_setup);
> > +
> > +module_init(secure_heap_create);
> > +MODULE_LICENSE("GPL v2");
>=20
>=20
