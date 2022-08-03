Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5955589270
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 20:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CB1113995;
	Wed,  3 Aug 2022 18:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150070.outbound.protection.outlook.com [40.107.15.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EE4113290
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 11:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euAG+iz5Vr/O25w0+adnZWg5HZAjNxj4kPbKAzXjj/1hW5j3/y8Z6DlXGXekrS5JszBPc2SSegT4XzDb5Kw2UDSCeP3kttDfh8Dcixi5jHk37OQlzH+HrDxRPWLnySmK4eOOW9AAqpovtVFYN2CTosMWOMQUIwH4axkSguZ7XYEWK97krUfoX/zYxCZHCTnuD9zD5q29Dve4KFnlqMEHYWxG1BmBfNq0xDYMulzVJfJYk4ZIa0ATU00r+bNzUd993/4iQEJQC737DqRh7q7mtrtadGYsRiJEywhUj5xpirnWr7FIpvtQES6+Gt/2CX6JlfjJIDKEduL4Wq5obQCO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2KkH7sefokT7Fw0vvf9K95NVBf3VpgjZnXxDKjsDQI=;
 b=atRtW5euohpUR7vhJ0jo4Q1IZ3zFceEeudtyrgMda66i62hJjkBx9fNPtTt2fyP/dMRnSkOE+qDvgzQlO3M37at3egiFd/3jujqIxqLnnvyBj1CoUBg0+WUlGBCn43euFpUof8Mj/i0vibp/LAvGoQ5z4BNU5UH17Ci92wGcS0ugY/bwclbOIoDCXP6GxEPJdR1St47zZYlYmWcVgvrW00PJQ+9fTAnBQi8aL+JgADqzWnAaqX/8EO2+Wccs0tjHITnbQBvT0C4p4+tgBLHwrLzTmVQGGTEapZzz24btbcO3b+fNzBn27sHffxyWskCSefq2mukCZM2JS8hptov3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2KkH7sefokT7Fw0vvf9K95NVBf3VpgjZnXxDKjsDQI=;
 b=cxn7ZAD93M7hC4jTJpI5ItQr7O5/SRXRLlufFsYFyHljD7EYeKOHJBnSL76Z20vakQKawuv7rmaX4rScHknFAkq4zLqvHtLcOF6QCh5pxlHJountw1vybdOQU2rvbEdL4g+cOBxATfM8RjGTzE+Kam7l6Wm6Kb5Z/g9ZWFyFzQw=
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 11:07:54 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Wed, 3 Aug 2022
 11:07:54 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYplZ4V/zP2ovEr0Os9Wz8+HCUmq2brpEAgAFXDgA=
Date: Wed, 3 Aug 2022 11:07:54 +0000
Message-ID: <d11cd7921859c9b24db304107caa0fc2deb780e3.camel@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
 <20220802095843.14614-4-olivier.masse@nxp.com>
 <20220802143908.24vemxeon537cad2@000377403353>
In-Reply-To: <20220802143908.24vemxeon537cad2@000377403353>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5370f8b-2b3e-41be-d495-08da75406a0e
x-ms-traffictypediagnostic: PA4PR04MB7565:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+nUsSVkwH3BUI09ki6FrsJr6EEDS4Zjazjiv7Zgozm50o/wlaxobpMYYjG8hGwEv2MFupOSIK+Tb9ZsCby8SZ6AhMffTmmoMycSqkREBo6TemlN2xv5rAgpH+uhbSpNK7LpQcZhQ0T+1bUvbyJl601Elm/Pyn56L4Kl1xzLJhzgGPIrSHqMLsZ3wkVnW3WgdnSAIgzCzdpTIYxUb8LkHzT/Hht838VrrnbRR/XZ5AImfQkqqfJu+smJxSJSwA2Zw/rw/MpOAxS8C9MjIysTD8OmHur2nmncmH6vnpanaLYJY/X1TOVEVWIIq2w1RT92qV9ekosLIjkBZXV/jrM+SrnEZcgn7aXovaYrvF5PV199sCwi7ASf23sDwbKkgk2nki5XucBvYCUp8frXcuBuMttnkAuCyIKuUg+uhFLlCVVbcFputDKJcIGmouXHfhOnTU3wkzW1X9JAJp5sqJjzjPQSBoBeGV5jWT3tFAfX057AXT7TCCFd7EO+7xgvb1gmf930gxIXq5NJeO6ImQYzFN1NkSRHkhwSY+KffBoHF+JQT6dwZIzkG7Uka8dozOmjCTZZqC8hXsqBKvSBSV9rNNjuvLlAn83LtT9ePXyTf3Y8GOJsQ6ltpQTIlX+qsTPTCY1LpLwK/0h8eCZmEDI8kiNnN2O8Zy/NyoTZUpsmeAfMcOArOq5/z7Y0jnPWRPJTyUCjO2fJG0lIq1qOcPQ4sLLopNsJsBIcW5SwkzjyJb+d5r13S5H+BquW2o6/yRCVMHBmW2d8Msr/sV+b607QWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(76116006)(186003)(36756003)(38100700002)(2616005)(6506007)(71200400001)(86362001)(64756008)(66556008)(66946007)(66476007)(83380400001)(66446008)(6512007)(26005)(4326008)(45080400002)(8676002)(6916009)(8936002)(2906002)(30864003)(54906003)(41300700001)(478600001)(44832011)(38070700005)(966005)(122000001)(6486002)(316002)(5660300002)(99106002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?VDBFRG0/7mMk6pfD1lw+I1q2CFUhToWyKUAqJtK/WTmBfSNzRLgm9jevf?=
 =?iso-8859-15?Q?UqVLoNELb5HzvMTU0HqTOVgfwPFXWDIDtccIbPewm3eOznvFOjs9eDzXc?=
 =?iso-8859-15?Q?ahu4KiWypHOaM+5cLmTlB8Mv7w6fF0RfGP5j7COHUdHx2V+vqEs3yYOOM?=
 =?iso-8859-15?Q?x2CB8b2NBWWAFfV3vg6ZyQtAORF9OOjmzFD2bgd8NUp/3Qg3ZVtlVogzO?=
 =?iso-8859-15?Q?O0cqBq5W+316fic+lTn/2GHqh0GEkJa68tmzuOtP0N/ONdfD/eU+fHMTB?=
 =?iso-8859-15?Q?KXgAeEaD4jl1f7ThYL2UM8ZMTxuKedBmHSM9HAfR39d4ArnqXBb3DbHv7?=
 =?iso-8859-15?Q?e3adXRbqj1JSno36Kdp94HgtWHKQ8uZL532fJHK74dIAOwAzuM8KcIy4c?=
 =?iso-8859-15?Q?t8n4af9QMMWTzJoPaHgS9Jy/R1aqvVbOwDI7bzCu0LcRE8pV1OQDpLhEE?=
 =?iso-8859-15?Q?tACIxBWQalRJfhtKZl5C+x+3fmyxZdHUg04OK6yFO1eVWFssCh2YsoWhg?=
 =?iso-8859-15?Q?frcTwaaVpYT2iLibVEior7VJ3CZl8RYqH5rmWMQRcxEod/iaDKLVO2Brz?=
 =?iso-8859-15?Q?MhS6jUm1M4XPKGQ/mpiizkLnqZt92UhtAzA9M0X4wxp5K2xRo3uhfCQJU?=
 =?iso-8859-15?Q?let8ccg+0esjGeOmDE0Tkol7rijwJIIbaEFVephEucDlRlXwwNzBWyFUo?=
 =?iso-8859-15?Q?gRggginG6M6cdBXTYlyWt3Bf0HjCaZ35z/5U7s5KNjdwY/Y9s4+4PBb0i?=
 =?iso-8859-15?Q?WfQiYrzy4aChfxNaHda3cWdY3D4nc/vugAr7nM2txQFK99pAgFrfjVYJR?=
 =?iso-8859-15?Q?p4MN78jI4RZy5uA2iGgf5cve0MGMn8YXdD2P39gFzcO15R2jGx2BAUQ/i?=
 =?iso-8859-15?Q?oa7KJvN0ZZ40sUxZvaAP2DefG4mAJEueOlOTkugWKjMdbC/1d/f4ByDIR?=
 =?iso-8859-15?Q?aoDZVm3+l8knGjgXgQ1tgKeoLNV7mnVdDh26XNWeVRp1faEJwVYexG/WU?=
 =?iso-8859-15?Q?m8sejJo1xtsmyw4oNdoteNHiBDpfYSmtjDa4XJ4Q5naDRxQgJTusqhzAm?=
 =?iso-8859-15?Q?gYD1UJje66RzHv6ENd+d7qYRK3bue64WB8HyU1tNyUfMZW8ZirV0Wf516?=
 =?iso-8859-15?Q?pZy1COeIKIj18JRbZ3ztV/9LPKWGBygQtpkW74ahvJGp+kTGwlv8/S8GZ?=
 =?iso-8859-15?Q?bis0Mt6kuV/lV9u2q4nOD+raeSn//WZ9BTVZSotOzIu/CGYVH2Ee8mfj+?=
 =?iso-8859-15?Q?49pnKWhcDFxLA5vP/MpR90LK7bb1NX25ehrqHA6Qx5Yml6GCb5tjRkDfR?=
 =?iso-8859-15?Q?/Vk2xF88Ies1+Vp57TDuC/4Vrf+2wL6n+XTZV++HPjqwMpdiU7dbU2ah0?=
 =?iso-8859-15?Q?EhWHIPkCvFTfpEbRnjQ6UBq1DEBInPz831HXU8LvHckLWgbLDCgqfdcnh?=
 =?iso-8859-15?Q?sGsKcfx7sPy88J4z6tviAHpyXsa+l0py24ioABx6YImhz4OoPI6ixd+3v?=
 =?iso-8859-15?Q?s2o9F9sLnvw9yg63ow35x4rIvI7cY4nXumw6oY9FrQG7HBDcJbdInCFAN?=
 =?iso-8859-15?Q?OaZXf2kiQBU+olQ0Nj/HR/nKQScdlH7Qqz6cI7vAO9XxUp2QglWJhUAtF?=
 =?iso-8859-15?Q?LGluoGcowdtOeCKXzFtkVbcyx02wOtpzVbgkxOe1E2PIGq/oHMFUtFBN1?=
 =?iso-8859-15?Q?bwg0?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <162F6DFB10BE044887B8F9B0F8520F99@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5370f8b-2b3e-41be-d495-08da75406a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 11:07:54.3747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d7RQzGn4SBWtUaXDtwyfsvBVGcE9OBHIkE+eJ6azQ+Wswy6WCmF3pV4radaCe9g+RI0q3XNQA3bO/E9qBnrhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565
X-Mailman-Approved-At: Wed, 03 Aug 2022 18:50:35 +0000
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
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

Thanks for your comments, please find my reply below.

On mar., 2022-08-02 at 15:39 +0100, Brian Starkey wrote:
> Caution: EXT Email
>=20
> Hi Olivier,
>=20
> Some comments below as I mentioned off-list.
>=20
> One additional point: some devices need to know if a buffer is
> protected, so that they can configure registers appropriately to make
> use of that protected buffer. There was previously a discussion about
> adding a flag to a dma_buf to indicate that it is allocated from
> protected memory[1].
>=20
> [1]=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Farchives%2Fdri-devel%2F2019-September%2F238059.html&amp;=
data=3D05%7C01%7Colivier.masse%40nxp.com%7C64e0ce1952ac4e926a8208da7494d0bb=
%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637950479760002497%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000%7C%7C%7C&amp;sdata=3Dbmlw9uLeGtn%2F7JliZ07nSm6XDEzEqdwn4mBQHIV=
nma0%3D&amp;reserved=3D0
>=20
>=20

Interesting, could we introduce is_protected 1-bit flag into struct
dma_buf ?
struct dma_buf_ops.map_dma_buf and struct dma_buf_ops.unmap_dma_buf
could become optional for such buffer ?

> On Tue, Aug 02, 2022 at 11:58:41AM +0200, Olivier Masse wrote:
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
>=20
> I think dma_heap_attachment should have a more specific name,
> otherwise it looks like some generic part of the dma_heap framework.

ok, how about secure_heap_attachment which sound more logical ?

>=20
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
>=20
> This looks strange - you're expecting this driver to be used on
> regions with no-map set, but if no-map _is_ set, you don't allow the
> dma_buf to get mapped to any devices. Doesn't that mean that these
> buffers can never actually be used?

if no-map is not set, map_dma_buf is mapping the buffer.

>=20
> > +             if (a->uncached)
> > +                     attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> > +
>=20
> If the CPU can never touch these buffers, is cached vs uncached
> meaningful?

indeed, but as dma_buf_ops.map_dma_buf is mandatory, this flag as well
as no-map were introduce to manage uncached mapped buffer.

to simplify everything, secure-heap could get rid of no-map and
uncached flags and set an is_protected flag in dma_buf ?


> If the TEE touches the buffers from the CPU then perhaps the TEE
> would
> need to do cache maintenance, but I'd expect that to be managed in
> the
> TEE.

yes, if needed cache maintenance should be done in TA.

>=20
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
>=20
> If the firewall is preventing CPU accesses, then shouldn't
> begin_cpu_access and end_cpu_access either fail or be a no-op?

true, both of them are optional and could be removed.

>=20
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
>=20
> If the CPU can't touch these buffers, what would they be mapped to
> userspace for?

again, let's remove this optional ops.

>=20
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
>=20
> Similar to above, if the CPU can't touch these buffers, what would be
> the point of mapping them to the kernel?

indeed, useless code.

>=20
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
>=20
> How can you do memset on the buffer if the firewall is preventing CPU
> accesses?
>=20

yes, useless if we set a secure flag to prevent driver from mapping
allocated buffer.

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
>=20
> This kind of heap probably can't work if the region doesn't have
> no-map, so I think it would make sense to enforce that no_map is set
> (or ignore regions without no-map in DT).

if no-map is not set, secure-heap could be used as a heap with
dynamically protected buffer from the TEE.
but I agree that this is adding too much complexity and could be
simplify a lot without this mapping consideration.

then no-map is probably not the perfect term to describe this heap.
is_s
ecure or is_protected would be better ?

>=20
> Cheers,
> -Brian
>=20
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
> > --
> > 2.25.0
> >=20
