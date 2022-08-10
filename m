Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A158ED5D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 15:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2324B2000;
	Wed, 10 Aug 2022 13:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10083.outbound.protection.outlook.com [40.107.1.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458A8FA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 13:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjgBYOb/xpzSZ18Ckzt6z3BzWcr1aaMYvpyy0rBgcYTsp6k33VF+9FlpyiBw/+Pj5rut8CDBjA38fRh1k4q6/kqchL9ucvpvkooR2WNUvkwSR3Life9ceYMZv2kcosKgtuCXWqcsiKNcoX4xkIeXijj2SkP61g3IhxVGWRayXcCat8zcXUXhFuHs1RIA9X4Fl29/Snllv/iebuEb/EJs1CVVf7t2CFxOsnUCRwsZoPyMWgc0BNGA9CRhcFY2DIuPfILPPyepCDU+BYE0B6VqJRUMqG6hiiHPKoKAYU24rxegre/Wj+ym0FaXNp4RMsvVTgQQu8t6EC8qdi0/+YS9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Febu4mexQdh6UlZbcFpSdVkXKKf944dXturKP4gLR+4=;
 b=TsdAF/mXp1Av+OFjVB08mrrtcygDPNry7RI1F3N/sktW572AzLyILNwgx9YHRPHyvsNt+P85kXGo2MStUBJWIzVwMQTMq9f68dGZg9ZEed4upHydTG8ppETZST1ZhD9wbWMVNck5xz0dsJ4LufmglBNRylqKlIvH/+5qs51zKbPv3hMja6RXFhtNhf/yXk3Y+HJDwQGLkUYgyBqfBzEVxHAUMO8YdI99eC03SdvhdAgXLE+RQ0QvKDRlHNNutLob1lEjvcI9SljRLW5Fu4lKXCnV5I/A8gWcCgBxocpUcjBgqUMRq/1c4ub+/lNyd/vPBRs3MdcwdDDkKxd2qb7WLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Febu4mexQdh6UlZbcFpSdVkXKKf944dXturKP4gLR+4=;
 b=nfQ936YtaHl+qepROzzs0+Z6I1zoO0hEYFz7JSDbjG2RlLSwc4Obkob039pw1S4tu4LSeSqd8x5kqxOFg1WKSplCVuB5ZsSl9V22NBnqDd8gc2EMvtIgoZSxTySd0U7wa2hQ/+3p1/eKfDM7pPYJY0fpuvJSjvIrgcsPk/ZidPE=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Wed, 10 Aug
 2022 13:31:25 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 13:31:24 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "hch@lst.de"
 <hch@lst.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762n6b4AgAA/OYA=
Date: Wed, 10 Aug 2022 13:31:24 +0000
Message-ID: <9efa8c7491caf65404dd3d19aebfb4741039edc1.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <dd1f0190-5c20-8b48-5092-7364a2ce3a75@amd.com>
In-Reply-To: <dd1f0190-5c20-8b48-5092-7364a2ce3a75@amd.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f17f939-adcb-4355-4d54-08da7ad49f2f
x-ms-traffictypediagnostic: DB6PR0401MB2438:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P4png1BFVXuK8bZjRkWN7pysBQuJwZHNh4PQhcRmHwiWdvroLoTJJm0BFZhvGEF9P0CUca+kqmE0GopUyz3Akbhi2yR8M6Do8VbGHp14tMaPbh9enPrHxNhJjn0N7OqlPSgCDPv7FwNG/q7dWwmdmW98sVIOIhViyUSL9aP6VDsLZFG2coAythZ/JyLQIPJXyJGgURHYYAMKSZKI6xXwqPtUEX9HSJ/PTLp5KOvRxmkrfIhQHAxL6JKxi0dmdgUZuEva28MmRCAdgrl17gstvfGpkupJ31V/OA9Z9QkWQUTRWLSNrsttKcz6Z5wGfdetqR9HtPAGmIA8nCdtOtwzKJGMLssKIwn7P+a4+n1aFB5zak6zlrufZeRPGbW4g/3sbEk5wlf1NiR+pjDJ4+yeHgLa8Z3PvnM60AnP27y482fFEXi0HiQO8thatQZ/fISXbHI0meUi9S2JgM6e/vYBhyD+akL7yFc4TJiNgzKgN/dGe41OmDfpDKEuSnGRQgEHxgSvtA4LU35YwOsdCXrMmap3wnu8m1IcK4goC9oAvhv5Fp5OUXtkTwvBUSCB3MQT7dMhHsT1lQOA7ki+8RmXgQNEjhPBjgnPRt/fK4JYSoun2jAPUGH4LfYu+x/gyKG+mod87osN8Aezt9d71DcQ3hItMoGtNVMFUGEW0z1mc8TgyX2SYXrkiS3z3FW7CttVxd6ApREBxV2Rov5Viy3HVz/PqKBPvlX1XYlw5boWl/jpx6yf/3QT0ZwiFupHwp7IyLKA57TG81K+Xx6cohD/U0zCvU6ScujstZpW30ZZOkf6llSlfmwZFgXaF19zqy3dB7XfRrjXJ2JZJb9JmPeHxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(478600001)(6486002)(36756003)(6506007)(2906002)(86362001)(186003)(2616005)(66574015)(41300700001)(83380400001)(110136005)(6512007)(26005)(71200400001)(91956017)(44832011)(8936002)(30864003)(4326008)(8676002)(66556008)(66446008)(66946007)(64756008)(66476007)(76116006)(316002)(122000001)(38070700005)(5660300002)(38100700002)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?vJilgr7A21OVb1UsLq7zDE6Df89LeN2gOtoYlBRYwTcbbSUyU826dfZSb?=
 =?iso-8859-15?Q?ktUYxizJxcQ7Bam/ip7I4JTP990f2EaJrNIPTaigi0TUcBKbk1jtX65MC?=
 =?iso-8859-15?Q?r95ytDwUlw1F4Jq7RQaPJNeblA3sCdjUWPQrcOu1680KyT9aa9CtLf6Yy?=
 =?iso-8859-15?Q?E1ReFaGKdU2xvkzkeIuLJtr++omCqGyTRigD9RIQ88+hnOPhov/GxZmN+?=
 =?iso-8859-15?Q?+SWS2+W/bYR/+FfFncPPo1gszoNYSP5+JIS0QDZBDCuw3EdQbwD1hgDwD?=
 =?iso-8859-15?Q?rD7pWeQIrdItN5XK1eFs2Oe73qYQ8aykdg3dJxKlNxcnb1EwCFNQyWqE0?=
 =?iso-8859-15?Q?H4YhhOKa3FUt/BEvbPSiZufVuTWbNGlfvMIrL8RSqpbGCLBR92DkA0wAE?=
 =?iso-8859-15?Q?uJFthVi4pQVBq5a8beOODiPGtKU07UmFcIM4XDP+xk6oy3EVK/Mysh2ay?=
 =?iso-8859-15?Q?2GIzCreETynZGpY2BIGpuInm6YJXpuLyBOiR4qVnLLsJo+mvrj9AK5e+O?=
 =?iso-8859-15?Q?quqV3bi4WXJh/VEb4L7ZdSGqKg+FHcTNg//ADa8PIsV7on08wgvDifFY/?=
 =?iso-8859-15?Q?L5QdJaNXspFVQeZqvJxQMuHfu3asqgDCYQRwC/elwPqzp3hLw1GliUc8D?=
 =?iso-8859-15?Q?B7fcQSfr4FCfAITrgMEQ4w5Sb7PQ1oCzRAPRuZN8I4oukZ3pvxWMz0wHi?=
 =?iso-8859-15?Q?6ndhqEh8v5YxH0Q1rhIiG0e3YhJf2zxdVfKfnNQHfD49PAH+bYFkUG1qn?=
 =?iso-8859-15?Q?OuxlNt3DUBz5AlfP6v5+MlDxLdQBE7rDUnobN/5d3SYGHv7f4KUmlvOaR?=
 =?iso-8859-15?Q?8cEotDrwxBJomZzLWAPxlbdhUTN6oNIAYzd4QSNTDQ3wyL3yiaCZC9o8M?=
 =?iso-8859-15?Q?vkXWizLY19ca6BBHowqla4lFzppFRKFux2Rqud1IwvTHhRYuWcmkzXiOm?=
 =?iso-8859-15?Q?6fjYmiWGgGZdx+beBTYiHz5Cs4jpg/mMLgGALfvJHAPwtBXKEWoG9HpnP?=
 =?iso-8859-15?Q?/ZGa3RwBeoZGUc3f6Uk/NHSlwbQqdLICgEIx08/wog4plwT+0GcHmSMYc?=
 =?iso-8859-15?Q?Xo0Nbw4z0EuQTwWdTXnMdIWfEX5eZut06LlPC6cCn48oaey3UhvCwNbas?=
 =?iso-8859-15?Q?2lEX26GkMxkGKKvlAxHpsKcPbvR212JeTjPiMMdFybqAUfWLZMw+F/Ru8?=
 =?iso-8859-15?Q?CuCIemxDoBv2H6FX6AkTQE1mSYM5jFYs3tjHAcc5Tj3Z38f4LrfCT/mu0?=
 =?iso-8859-15?Q?GyJMGB6F1/Xx4LBuRMDlemkpDDEG0j8loIipH8+O+lNVm6glEJtBAd87n?=
 =?iso-8859-15?Q?9/qtRTehPm2BSxuTo6lawQbqjroY9avYGXFFgs0yW466Ro89i5bXvdHdz?=
 =?iso-8859-15?Q?tjD0zLvavSNiVOsRIQPWEKFgYgF8NxYOI+/KC2wQo2DvYV+kmxzACVRb1?=
 =?iso-8859-15?Q?Y092sRde0S9RoZ9JRkQC87gra/FVJeNtP7x81p+gWvKZ7T1YBG0YNcsC5?=
 =?iso-8859-15?Q?jjMrvLYkncs/9fxGOzNwf8FwbnsuymjGG8T85SlmX2iE/leDL4tOx/u/E?=
 =?iso-8859-15?Q?wMGunkO9OV+Jc/OWZULxr2Ha+QM3P88vGXuo+yJ37zm8YyH+K9KmZw2wr?=
 =?iso-8859-15?Q?F8c2BYZ3b0uEcXEguwy9GNsBItHz69mqazaMaV9wmTasHB7bvTCu9K7QG?=
 =?iso-8859-15?Q?O82+?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <5DE46536F9B70641A4805AB785DFDEF7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17f939-adcb-4355-4d54-08da7ad49f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 13:31:24.8210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCFvhOceyC6xazhZG6gT1gQBfO9odjiYLr92zlzvS2qDzba239tpgcUjU9T3WcLSh9O34WcLAC2lxOeSoM6EXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2438
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thanks for your comments, please find my answer below.

On mer., 2022-08-10 at 11:43 +0200, Christian K=F6nig wrote:
> Caution: EXT Email
>=20
> Hi guys,
>=20
> Am 05.08.22 um 15:53 schrieb Olivier Masse:
> > add Linaro secure heap bindings: linaro,secure-heap
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
>=20
> I'm not sure Christoph will approve that you are messing with the sg
> table internals so much here.
>=20
> Why are you not using the DMA API directly for this?

Do you mean for secure_heap_map_dma_buf and secure_heap_unmap_dma_buf ?
If yes, maybe something like the following could be more appropriate:

static struct sg_table *secure_heap_map_dma_buf(struct dma_buf_attachment *=
attachment,
						enum dma_data_direction direction)
{
	struct secure_heap_attachment *a =3D attachment->priv;
	struct sg_table *sgt;

	sgt =3D kmalloc(sizeof(*sgt), GFP_KERNEL);
	if (!sgt) {
		dev_err(a->dev, "failed to alloc sg table\n");
		return NULL;
	}

	ret =3D dma_get_sgtable(a->dev, sgt, NULL, sg_dma_address(a->table->sgl),
		sg_dma_len(a->table->sgl));
	if (ret < 0) {
		dev_err(a->dev, "failed to get scatterlist from DMA API\n");
		kfree(sgt);
		return NULL;
	}

	return sgt;
}

Regards,
Olivier

>=20
> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > ---
> >   drivers/dma-buf/heaps/Kconfig       |   9 +
> >   drivers/dma-buf/heaps/Makefile      |   1 +
> >   drivers/dma-buf/heaps/secure_heap.c | 357
> > ++++++++++++++++++++++++++++
> >   3 files changed, 367 insertions(+)
> >   create mode 100644 drivers/dma-buf/heaps/secure_heap.c
> >=20
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-
> > buf/heaps/Kconfig
> > index 3782eeeb91c0..c9070c728b9a 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -20,3 +20,12 @@ config DMABUF_HEAPS_DSP
> >             Choose this option to enable the dsp dmabuf heap. The
> > dsp heap
> >             is allocated by gen allocater. it's allocated according
> > the dts.
> >             If in doubt, say Y.
> > +
> > +config DMABUF_HEAPS_SECURE
> > +     tristate "DMA-BUF Secure Heap"
> > +     depends on DMABUF_HEAPS
> > +     help
> > +       Choose this option to enable the secure dmabuf heap. The
> > secure heap
> > +       pools are defined according to the DT. Heaps are allocated
> > +       in the pools using gen allocater.
> > +       If in doubt, say Y.
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-
> > buf/heaps/Makefile
> > index 29733f84c354..863ef10056a3 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -2,3 +2,4 @@
> >   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)   +=3D system_heap.o
> >   obj-$(CONFIG_DMABUF_HEAPS_CMA)              +=3D cma_heap.o
> >   obj-$(CONFIG_DMABUF_HEAPS_DSP)          +=3D dsp_heap.o
> > +obj-$(CONFIG_DMABUF_HEAPS_SECURE)    +=3D secure_heap.o
> > diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-
> > buf/heaps/secure_heap.c
> > new file mode 100644
> > index 000000000000..25b3629613f3
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/secure_heap.c
> > @@ -0,0 +1,357 @@
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
> > +     void *vaddr;
> > +};
> > +
> > +struct secure_heap_attachment {
> > +     struct device *dev;
> > +     struct sg_table *table;
> > +     struct list_head list;
> > +};
> > +
> > +struct secure_heap_info {
> > +     struct gen_pool *pool;
> > +};
> > +
> > +struct rmem_secure {
> > +     phys_addr_t base;
> > +     phys_addr_t size;
> > +
> > +     char name[MAX_HEAP_NAME_LEN];
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
> > +     struct secure_heap_attachment *a;
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
> > +     struct secure_heap_attachment *a =3D attachment->priv;
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
> > +     struct secure_heap_attachment *a =3D attachment->priv;
> > +
> > +     return a->table;
> > +}
> > +
> > +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment
> > *attachment,
> > +                                   struct sg_table *table,
> > +                                   enum dma_data_direction
> > direction)
> > +{
> > +}
> > +
> > +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > +     struct secure_heap_info *info;
> > +     struct sg_table *table;
> > +     struct scatterlist *sg;
> > +     int i;
> > +
> > +     info =3D dma_heap_get_drvdata(buffer->heap);
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
> > +static const struct dma_buf_ops secure_heap_buf_ops =3D {
> > +     .attach =3D secure_heap_attach,
> > +     .detach =3D secure_heap_detach,
> > +     .map_dma_buf =3D secure_heap_map_dma_buf,
> > +     .unmap_dma_buf =3D secure_heap_unmap_dma_buf,
> > +     .release =3D secure_heap_dma_buf_release,
> > +};
> > +
> > +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> > +                                         unsigned long len,
> > +                                         unsigned long fd_flags,
> > +                                         unsigned long heap_flags)
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
> > +             const char *s =3D rmem->name;
> > +
> > +             secure_data[secure_data_count].base =3D rmem->base;
> > +             secure_data[secure_data_count].size =3D rmem->size;
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
