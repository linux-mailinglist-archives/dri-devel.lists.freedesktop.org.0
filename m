Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABEF58AC1F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 16:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ABBB5CF3;
	Fri,  5 Aug 2022 14:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47DB5CB6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 14:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ61uRSxAamkbGOSCpLPrrn4Fh6nhlmtHjIV10GTlA0a4ljkBijjOM36LyVrEmah4zd74BWp+Ob9yHWXjpzEq57LlybSiLuOw+sdJsGEfyKQnCTowx3PKp3KRwfGuojMlHLFf3Ok4LMzrpQKPhbOVI7LAf+j/4OmWhubGCmh5R9QknxpbUVKVIilO7Li9iwiAS6K3AvEmZ458mlAn9uxtSN7Xw5BE3HySVMR5xYZbpF6xPi7ZhudGOJGQ9Sqnyh0lzijtjCi3ymBSYAmktUCN01cwaRoJWyXJO2Nf9OGHbSqdsShhzhXfkA4Dx5wW7/KgNVxhomE9nXO78VbSuTMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP6JnaJs6qoX9Me5JQ7DNH+M/ytQvacFbRrEOTJtwrM=;
 b=gkPRG8IvvCq5CsTbITJQltCroouK3KYmgbcBifua5TsaUA+DWymIm2F3dvB80R8LlUwXlLAzBt0+QixAmg3XU4zAGW67m2dJ1jhqt4uR+WqwveGTDhAUI/Yv3s1B3w5/as4UA/gGuMDzcm0z2LftneeIlGj9Wzyy4PIIYQeyNCxRZEDGIvLwlxRnEeHjV02tzLkSQwJshZRFs74NveD3XbY3muc25f1LYLEqwnlfqh5BKcZYv80qvojnJVj9ytecMj/Gk5P1tLzLnsa+EVDAvjrXlVAJFpoV7yU8DANvtfZ3d5c9qRurwTEfUqupS1q9sQm7LcxGZeU0hNxe+FPKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP6JnaJs6qoX9Me5JQ7DNH+M/ytQvacFbRrEOTJtwrM=;
 b=iyCn0GL+bEycXal8FXPlV8gz1Nz2PRX8vvUCfQrmgGcX7bSmk/gBGXeYr6BmuMy9nPP7bBSkvdRz3wXqkQLRo15o0XXIyY+Ygem6LjjIHhRHGtWJOcb7cJ8YBvrTZNKNgmeCayf2QHAxySj7h9BYzGFlRbxSEXzVda7nPkSACA4=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM8PR04MB7201.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 14:06:24 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532%3]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 14:06:24 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYplZ4V/zP2ovEr0Os9Wz8+HCUmq2brpEAgAFXDgCAABlNAIADPTGA
Date: Fri, 5 Aug 2022 14:06:24 +0000
Message-ID: <dbb4b384cba026077dd2d89965dff85aa79ed301.camel@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
 <20220802095843.14614-4-olivier.masse@nxp.com>
 <20220802143908.24vemxeon537cad2@000377403353>
 <d11cd7921859c9b24db304107caa0fc2deb780e3.camel@nxp.com>
 <20220803123732.ohsy2j2y33zsrhlh@000377403353>
In-Reply-To: <20220803123732.ohsy2j2y33zsrhlh@000377403353>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f11c95b-325f-426f-8d18-08da76ebae99
x-ms-traffictypediagnostic: AM8PR04MB7201:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mk1rXveD6Lk5/Z8d8v1PNOfVoFGrh383sbOkLmcNhTre3fRBHeUR8puqAsv26D8SWFeWlBKVRS5a+G4R7Jwip5aTLQmn4bf7ViQFn11VFN1ESn9SK2skFGltawy+7xathdT/7XkJzXS2HezNd026g6YtkrBqPEzw+nOw4V7gFkEqwAVnnzSvPp4/sg5ey914udcTORx40OPCexiU+vwJSAH/p57YndF12yKa8wRKzS7v3KUYesJqvyQQxrwb3FP/GnvT+IlbFLZklzZ7YtsfeF4DhZYGjLIcDf8uaio2Yht5TSMyZ8Bl61NafRbLXD1ghSWYnWRHQRkNeFoExK3O3I9zhTge0Hgo2QITCie4MQpcNkVS7MMj6FNiIEoQyKnOq/UqR5bwkNyTyLByNzBauNPnP0LdFQ7GKvWdIiMpUPJDpNRhIvUVjH+Lr2rXsqm25yoSzIYLWkWSRfLXMrOe7e9T7Eu6katW6G8apeNaSmxp6Rvk8WlqnvqCRocqSVzq/Xgkrumk8AK8oYhMymPoFyn888BttHCpQa1B5lMF0BU50tN9y5JdIUAfTde4+53EwGe+Itrz0U29dQLs6Z1YC6xyU5zkk95ucBg3oJuRwBcrvj7PRQKvokpJ40tBDxhA6ydN9FYUewkO2/AoNJePihoeei2fYlOHXrXjv2gOot2TTXXWhuh4RkimHBmaxTVOu8SlnbGdvQ87Yx7dCnCoqVhneloLHyADaHBnTJgTfBuegDFcJYWasLhtLjbxuGZKnoAO7enR/4lB+sLFZq7YDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(41300700001)(30864003)(186003)(44832011)(5660300002)(2906002)(38100700002)(2616005)(6506007)(122000001)(6512007)(26005)(38070700005)(6916009)(54906003)(45080400002)(478600001)(6486002)(966005)(8936002)(86362001)(64756008)(66556008)(66476007)(36756003)(8676002)(66946007)(83380400001)(71200400001)(66446008)(316002)(76116006)(4326008)(91956017)(99106002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?aZ4WWppZatFjUJ4IkyI9NDsR6KOrWC1Lx/D2O4OSx5bWXTAiFDUqedv7g?=
 =?iso-8859-15?Q?v0dtznrrdiBMWHc54YQV8bEtkLVED595v/QcYYTw+zwCamlamD6Ip4pp6?=
 =?iso-8859-15?Q?rKkubey9lCqGDRR+QkE3lKnpPSfuE1Gouoa85rN9HVyzgD/7I6yvYiUX0?=
 =?iso-8859-15?Q?nwvqs5vz7eLs43U/+9t1TU6PDyZSwIGhwByIB2RNEW1mhN5NBOYLSwqAL?=
 =?iso-8859-15?Q?Se4jkJ1bGI/+au4unFElqJWbHlU0wH3bOST1xTAuPV7X7ZwQss7pe92oT?=
 =?iso-8859-15?Q?0MI1LWhgxrE3oSXC4Qz/ZvG+HCW/BmLX3va6AIRPqSygqg8pBccXxw1uV?=
 =?iso-8859-15?Q?9kqj92lVPVY2l5/Y86eN39CrzfbhQxAu3tPubNQ4zvZPzR7hYvR/+G6lt?=
 =?iso-8859-15?Q?pW+/nRuASds291d3vjCPlBmDNGW/IuFiV37iRtQENUrUtr/k0tMw6RQmV?=
 =?iso-8859-15?Q?3tiT9RXWGtmJ6Gh7zqN85UEX7lGux3eGXEXLRu3asJVWr2lxDug4yePUu?=
 =?iso-8859-15?Q?AOfZL+8rxGgrbYt4aflcmhc1ENbBgWhEcXhzYxsumijZadpsrbaiVlCP0?=
 =?iso-8859-15?Q?oLxpXbo9kYt3A5FfZzQs1RBDiLQcyFb8O4iT/pHk4LO0mx4arQPusbCQ4?=
 =?iso-8859-15?Q?tjfqCza7FgVGaxUpJ4VuIvWAeL7OVImD5KGoQAO3GjBd74Hs9ItN1/kSS?=
 =?iso-8859-15?Q?lkv+teHAj/pquPu8sAV5FbjRisRTz9XVVS8Ci7OM1rPa+hOzhmwKwpTLX?=
 =?iso-8859-15?Q?5GdoLDa/x0kgLKwlAjPg18/f/9t7v3vDcL3bpIMru1+MKnoIPIe8D2ReM?=
 =?iso-8859-15?Q?8+QipNO9Rurg/75nVmjZCb26K1jKgZ9NIy2qzMkVQ8TkcZf3xRadP5RX5?=
 =?iso-8859-15?Q?AuByk86qLtzotD18CxLdfOOmtBpiK0ysawWYrMajjbRXiZzHWjiE6Z/2l?=
 =?iso-8859-15?Q?eEI4axysLIKFFm0vvpL4cAj61ZzbRyRLTcb/zWqdBwZEI2kvxuMjQ4qVE?=
 =?iso-8859-15?Q?gNPPxqqxAN7vdOdcwS8DHe9H9CE35oTF5mgnr3yHNMQkH36I3SBMkMG9L?=
 =?iso-8859-15?Q?6aVLj3rOe8jWoHJ4DHSpPXBCA7GjED6YXIMxfMsiG3dTbJoyf++TE1oP4?=
 =?iso-8859-15?Q?nho5eWPcCSaP+iEf1M9OBHbn9bM/SmIfqWiPDJTP+3rafdh57cZdGwNcY?=
 =?iso-8859-15?Q?oLTgWDI1C4souCPgYDaqRSdL73Ab+0lJZo+gp+1pM+spLvreW/umWHsc9?=
 =?iso-8859-15?Q?wxfBPvt08tnpB9rrashYwkWY6tIuEAyqInG0H1UNDyJNxfwmLOdnXVBwf?=
 =?iso-8859-15?Q?7oipZfGb/D1/v0Ku2UxUSn4bXP9pKMFOcqJjH8y/5TbgWwhyDITLwNvG1?=
 =?iso-8859-15?Q?nBna/pToRQ9EAjovyBdtalEDcGrUCQlVl1/jcg6RAHsXBQja4WCYcsOAl?=
 =?iso-8859-15?Q?zuRACPHYD6nn5cbhEITzmvimbaVYvOrXWmL2gPvqtTRk4400/xrBWagk5?=
 =?iso-8859-15?Q?Yml5KM5krJlrKT3H6V1tlLI85dh/J5/Ya/K+AWyZ+tUz94yJs80MWK1wq?=
 =?iso-8859-15?Q?0pb4m8pWoEVPNDB78rY2i1IXfo/JWO7AI9vEe1f8ts1GSGDG7OLwz66/3?=
 =?iso-8859-15?Q?rxfv6sy50w6o3PMEcg7YnyR0gHX8yIOo88r6nLPhZXx3CYMsT6zg+eqN8?=
 =?iso-8859-15?Q?NfMv?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <FDCC75AFBC2A4F44874300C7DBCBBC01@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f11c95b-325f-426f-8d18-08da76ebae99
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 14:06:24.4881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZvWmXNyHUiy4qpUM71iTWDcn8wB+fMXhQIJvxGUStb3QSsDoajYeWIRsDOW40wm+dgHVnJ1Nre8Gm9it8WpxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7201
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

Sorry for pushing all the patches again, but I've done some cleanup=20
regarding your comments.

secure-heap are now protected by default and no mapping could be done
for the CPU.
deferred-free is no more needed.
useless page pool code removed too.

Best regards,
Olivier

On mer., 2022-08-03 at 13:37 +0100, Brian Starkey wrote:
> Caution: EXT Email
>=20
> Hi,
>=20
> On Wed, Aug 03, 2022 at 11:07:54AM +0000, Olivier Masse wrote:
> > Hi Brian,
> >=20
> > Thanks for your comments, please find my reply below.
> >=20
> > On mar., 2022-08-02 at 15:39 +0100, Brian Starkey wrote:
> > > Caution: EXT Email
> > >=20
> > > Hi Olivier,
> > >=20
> > > Some comments below as I mentioned off-list.
> > >=20
> > > One additional point: some devices need to know if a buffer is
> > > protected, so that they can configure registers appropriately to
> > > make
> > > use of that protected buffer. There was previously a discussion
> > > about
> > > adding a flag to a dma_buf to indicate that it is allocated from
> > > protected memory[1].
> > >=20
> > > [1]
> > >=20
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Farchives%2Fdri-devel%2F2019-September%2F238059.html&amp;da=
ta=3D05%7C01%7Colivier.masse%40nxp.com%7Cafa24901ad92491c9a6a08da754d00b5%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637951270862339002%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000%7C%7C%7C&amp;sdata=3DLoQfoWYr0yHvTWa2tth9XOm2PACji4ATHnx3BRNKnJM=
%3D&amp;reserved=3D0
> > >=20
> > >=20
> >=20
> > Interesting, could we introduce is_protected 1-bit flag into struct
> > dma_buf ?
>=20
> That was the earlier proposal, yeah.
>=20
> > struct dma_buf_ops.map_dma_buf and struct dma_buf_ops.unmap_dma_buf
> > could become optional for such buffer ?
> >=20
>=20
> map_dma_buf and unmap_dma_buf are needed to give devices access to
> the
> dma-buf, I don't think they should become optional.
>=20
> Mapping to the CPU maybe should be optional/disallowed for protected
> buffers.
>=20
> > > On Tue, Aug 02, 2022 at 11:58:41AM +0200, Olivier Masse wrote:
> > > > add Linaro secure heap bindings: linaro,secure-heap
> > > > use genalloc to allocate/free buffer from buffer pool.
> > > > buffer pool info is from dts.
> > > > use sg_table instore the allocated memory info, the length of
> > > > sg_table is 1.
> > > > implement secure_heap_buf_ops to implement buffer share in
> > > > difference device:
> > > > 1. Userspace passes this fd to all drivers it wants this buffer
> > > > to share with: First the filedescriptor is converted to a
> > > > &dma_buf
> > > > using
> > > > dma_buf_get(). Then the buffer is attached to the device using
> > > > dma_buf_attach().
> > > > 2. Once the buffer is attached to all devices userspace can
> > > > initiate DMA
> > > > access to the shared buffer. In the kernel this is done by
> > > > calling
> > > > dma_buf_map_attachment()
> > > > 3. get sg_table with dma_buf_map_attachment in difference
> > > > device.
> > > >=20
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > ---
> > > >  drivers/dma-buf/heaps/Kconfig       |  21 +-
> > > >  drivers/dma-buf/heaps/Makefile      |   1 +
> > > >  drivers/dma-buf/heaps/secure_heap.c | 588
> > > > ++++++++++++++++++++++++++++
> > > >  3 files changed, 606 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
> > > >=20
> > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-
> > > > buf/heaps/Kconfig
> > > > index 6a33193a7b3e..b2406932192e 100644
> > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > @@ -1,8 +1,12 @@
> > > > -config DMABUF_HEAPS_DEFERRED_FREE
> > > > -     tristate
> > > > +menuconfig DMABUF_HEAPS_DEFERRED_FREE
> > > > +     bool "DMA-BUF heaps deferred-free library"
> > > > +     help
> > > > +       Choose this option to enable the DMA-BUF heaps
> > > > deferred-
> > > > free library.
> > > >=20
> > > > -config DMABUF_HEAPS_PAGE_POOL
> > > > -     tristate
> > > > +menuconfig DMABUF_HEAPS_PAGE_POOL
> > > > +     bool "DMA-BUF heaps page-pool library"
> > > > +     help
> > > > +       Choose this option to enable the DMA-BUF heaps page-
> > > > pool
> > > > library.
> > > >=20
> > > >  config DMABUF_HEAPS_SYSTEM
> > > >       bool "DMA-BUF System Heap"
> > > > @@ -26,3 +30,12 @@ config DMABUF_HEAPS_DSP
> > > >            Choose this option to enable the dsp dmabuf heap.
> > > > The
> > > > dsp heap
> > > >            is allocated by gen allocater. it's allocated
> > > > according
> > > > the dts.
> > > >            If in doubt, say Y.
> > > > +
> > > > +config DMABUF_HEAPS_SECURE
> > > > +     tristate "DMA-BUF Secure Heap"
> > > > +     depends on DMABUF_HEAPS && DMABUF_HEAPS_DEFERRED_FREE
> > > > +     help
> > > > +       Choose this option to enable the secure dmabuf heap.
> > > > The
> > > > secure heap
> > > > +       pools are defined according to the DT. Heaps are
> > > > allocated
> > > > +       in the pools using gen allocater.
> > > > +       If in doubt, say Y.
> > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-
> > > > buf/heaps/Makefile
> > > > index e70722ea615e..08f6aa5919d1 100644
> > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > @@ -4,3 +4,4 @@ obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)  +=3D
> > > > page_pool.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)    +=3D system_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)               +=3D cma_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_DSP)          +=3D dsp_heap.o
> > > > +obj-$(CONFIG_DMABUF_HEAPS_SECURE)    +=3D secure_heap.o
> > > > diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-
> > > > buf/heaps/secure_heap.c
> > > > new file mode 100644
> > > > index 000000000000..31aac5d050b4
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/heaps/secure_heap.c
> > > > @@ -0,0 +1,588 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * DMABUF secure heap exporter
> > > > + *
> > > > + * Copyright 2021 NXP.
> > > > + */
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/dma-heap.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/highmem.h>
> > > > +#include <linux/mm.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_fdt.h>
> > > > +#include <linux/of_reserved_mem.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/vmalloc.h>
> > > > +
> > > > +#include "deferred-free-helper.h"
> > > > +#include "page_pool.h"
> > > > +
> > > > +#define MAX_SECURE_HEAP 2
> > > > +#define MAX_HEAP_NAME_LEN 32
> > > > +
> > > > +struct secure_heap_buffer {
> > > > +     struct dma_heap *heap;
> > > > +     struct list_head attachments;
> > > > +     struct mutex lock;
> > > > +     unsigned long len;
> > > > +     struct sg_table sg_table;
> > > > +     int vmap_cnt;
> > > > +     struct deferred_freelist_item deferred_free;
> > > > +     void *vaddr;
> > > > +     bool uncached;
> > > > +};
> > > > +
> > > > +struct dma_heap_attachment {
> > > > +     struct device *dev;
> > > > +     struct sg_table *table;
> > > > +     struct list_head list;
> > > > +     bool no_map;
> > > > +     bool mapped;
> > > > +     bool uncached;
> > > > +};
> > >=20
> > > I think dma_heap_attachment should have a more specific name,
> > > otherwise it looks like some generic part of the dma_heap
> > > framework.
> >=20
> > ok, how about secure_heap_attachment which sound more logical ?
> >=20
>=20
> Yes that sounds better.
>=20
> > >=20
> > > > +
> > > > +struct secure_heap_info {
> > > > +     struct gen_pool *pool;
> > > > +
> > > > +     bool no_map;
> > > > +};
> > > > +
> > > > +struct rmem_secure {
> > > > +     phys_addr_t base;
> > > > +     phys_addr_t size;
> > > > +
> > > > +     char name[MAX_HEAP_NAME_LEN];
> > > > +
> > > > +     bool no_map;
> > > > +};
> > > > +
> > > > +static struct rmem_secure secure_data[MAX_SECURE_HEAP] =3D {0};
> > > > +static unsigned int secure_data_count;
> > > > +
> > > > +static struct sg_table *dup_sg_table(struct sg_table *table)
> > > > +{
> > > > +     struct sg_table *new_table;
> > > > +     int ret, i;
> > > > +     struct scatterlist *sg, *new_sg;
> > > > +
> > > > +     new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> > > > +     if (!new_table)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     ret =3D sg_alloc_table(new_table, table->orig_nents,
> > > > GFP_KERNEL);
> > > > +     if (ret) {
> > > > +             kfree(new_table);
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +     }
> > > > +
> > > > +     new_sg =3D new_table->sgl;
> > > > +     for_each_sgtable_sg(table, sg, i) {
> > > > +             sg_set_page(new_sg, sg_page(sg), sg->length, sg-
> > > > > offset);
> > > >=20
> > > > +             new_sg->dma_address =3D sg->dma_address;
> > > > +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> > > > +             new_sg->dma_length =3D sg->dma_length;
> > > > +#endif
> > > > +             new_sg =3D sg_next(new_sg);
> > > > +     }
> > > > +
> > > > +     return new_table;
> > > > +}
> > > > +
> > > > +static int secure_heap_attach(struct dma_buf *dmabuf,
> > > > +                           struct dma_buf_attachment
> > > > *attachment)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct secure_heap_info *info =3D
> > > > dma_heap_get_drvdata(buffer-
> > > > > heap);
> > > >=20
> > > > +     struct dma_heap_attachment *a;
> > > > +     struct sg_table *table;
> > > > +
> > > > +     a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> > > > +     if (!a)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     table =3D dup_sg_table(&buffer->sg_table);
> > > > +     if (IS_ERR(table)) {
> > > > +             kfree(a);
> > > > +             return -ENOMEM;
> > > > +     }
> > > > +
> > > > +     a->table =3D table;
> > > > +     a->dev =3D attachment->dev;
> > > > +     INIT_LIST_HEAD(&a->list);
> > > > +     a->no_map =3D info->no_map;
> > > > +     a->mapped =3D false;
> > > > +     a->uncached =3D buffer->uncached;
> > > > +     attachment->priv =3D a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     list_add(&a->list, &buffer->attachments);
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void secure_heap_detach(struct dma_buf *dmabuf,
> > > > +                            struct dma_buf_attachment
> > > > *attachment)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     list_del(&a->list);
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     sg_free_table(a->table);
> > > > +     kfree(a->table);
> > > > +     kfree(a);
> > > > +}
> > > > +
> > > > +static struct sg_table *secure_heap_map_dma_buf(struct
> > > > dma_buf_attachment *attachment,
> > > > +                                             enum
> > > > dma_data_direction direction)
> > > > +{
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +     struct sg_table *table =3D a->table;
> > > > +     int attr =3D 0;
> > > > +     int ret;
> > > > +
> > > > +     if (!a->no_map) {
> > >=20
> > > This looks strange - you're expecting this driver to be used on
> > > regions with no-map set, but if no-map _is_ set, you don't allow
> > > the
> > > dma_buf to get mapped to any devices. Doesn't that mean that
> > > these
> > > buffers can never actually be used?
> >=20
> > if no-map is not set, map_dma_buf is mapping the buffer.
> >=20
>=20
> no-map prevents the memory region from being added to the kernel's
> linear mapping. Irrespective of no-map, map_dma_buf is needed to map
> a buffer to a device, this should be orthogonal to no-map, and is
> definitely required for devices to be able to use these buffers.
>=20
> > >=20
> > > > +             if (a->uncached)
> > > > +                     attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> > > > +
> > >=20
> > > If the CPU can never touch these buffers, is cached vs uncached
> > > meaningful?
> >=20
> > indeed, but as dma_buf_ops.map_dma_buf is mandatory, this flag as
> > well
> > as no-map were introduce to manage uncached mapped buffer.
> >=20
>=20
> Uncached mapping where? I think we're agreed that these buffers can
> never be mapped for (non-trusted) CPU access, therefore (non-trusted)
> CPU cache maintenance doesn't apply. Devices may still have cached
> mappings, but it's up to device drivers to manage that.
>=20
> > to simplify everything, secure-heap could get rid of no-map and
> > uncached flags and set an is_protected flag in dma_buf ?
> >=20
>=20
> I think that sounds better, yeah.
>=20
> >=20
> > > If the TEE touches the buffers from the CPU then perhaps the TEE
> > > would
> > > need to do cache maintenance, but I'd expect that to be managed
> > > in
> > > the
> > > TEE.
> >=20
> > yes, if needed cache maintenance should be done in TA.
> >=20
> > >=20
> > > > +             ret =3D dma_map_sgtable(attachment->dev, table,
> > > > direction, attr);
> > > > +             if (ret)
> > > > +                     return ERR_PTR(ret);
> > > > +
> > > > +             a->mapped =3D true;
> > > > +     }
> > > > +
> > > > +     return table;
> > > > +}
> > > > +
> > > > +static void secure_heap_unmap_dma_buf(struct
> > > > dma_buf_attachment
> > > > *attachment,
> > > > +                                   struct sg_table *table,
> > > > +                                   enum dma_data_direction
> > > > direction)
> > > > +{
> > > > +     struct dma_heap_attachment *a =3D attachment->priv;
> > > > +     int attr =3D 0;
> > > > +
> > > > +     if (!a->no_map) {
> > > > +             if (a->uncached)
> > > > +                     attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> > > > +
> > > > +             a->mapped =3D false;
> > > > +             dma_unmap_sgtable(attachment->dev, table,
> > > > direction,
> > > > attr);
> > > > +     }
> > > > +}
> > > > +
> > > > +static int secure_heap_dma_buf_begin_cpu_access(struct dma_buf
> > > > *dmabuf,
> > > > +                                             enum
> > > > dma_data_direction direction)
> > >=20
> > > If the firewall is preventing CPU accesses, then shouldn't
> > > begin_cpu_access and end_cpu_access either fail or be a no-op?
> >=20
> > true, both of them are optional and could be removed.
> >=20
> > >=20
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +
> > > > +     if (buffer->vmap_cnt)
> > > > +             invalidate_kernel_vmap_range(buffer->vaddr,
> > > > buffer-
> > > > > len);
> > > >=20
> > > > +
> > > > +     if (!buffer->uncached) {
> > > > +             list_for_each_entry(a, &buffer->attachments,
> > > > list) {
> > > > +                     if (!a->mapped)
> > > > +                             continue;
> > > > +                     dma_sync_sgtable_for_cpu(a->dev, a-
> > > > >table,
> > > > direction);
> > > > +             }
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int secure_heap_dma_buf_end_cpu_access(struct dma_buf
> > > > *dmabuf,
> > > > +                                           enum
> > > > dma_data_direction
> > > > direction)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct dma_heap_attachment *a;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +
> > > > +     if (buffer->vmap_cnt)
> > > > +             flush_kernel_vmap_range(buffer->vaddr, buffer-
> > > > >len);
> > > > +
> > > > +     if (!buffer->uncached) {
> > > > +             list_for_each_entry(a, &buffer->attachments,
> > > > list) {
> > > > +                     if (!a->mapped)
> > > > +                             continue;
> > > > +                     dma_sync_sgtable_for_device(a->dev, a-
> > > > >table,
> > > > direction);
> > > > +             }
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int secure_heap_mmap(struct dma_buf *dmabuf, struct
> > > > vm_area_struct *vma)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     struct sg_table *table =3D &buffer->sg_table;
> > > > +     unsigned long addr =3D vma->vm_start;
> > > > +     struct sg_page_iter piter;
> > > > +     int ret;
> > > > +
> > > > +     if (buffer->uncached)
> > > > +             vma->vm_page_prot =3D pgprot_writecombine(vma-
> > > > > vm_page_prot);
> > > >=20
> > > > +
> > > > +     for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> > > > +             struct page *page =3D sg_page_iter_page(&piter);
> > > > +
> > > > +             ret =3D remap_pfn_range(vma, addr,
> > > > page_to_pfn(page),
> > > > PAGE_SIZE,
> > > > +                                   vma->vm_page_prot);
> > >=20
> > > If the CPU can't touch these buffers, what would they be mapped
> > > to
> > > userspace for?
> >=20
> > again, let's remove this optional ops.
> >=20
> > >=20
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +             addr +=3D PAGE_SIZE;
> > > > +     }
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void *secure_heap_do_vmap(struct secure_heap_buffer
> > > > *buffer)
> > > > +{
> > > > +     struct sg_table *table =3D &buffer->sg_table;
> > > > +     int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > > > +     struct page **pages =3D vmalloc(sizeof(struct page *) *
> > > > npages);
> > > > +     struct page **tmp =3D pages;
> > > > +     struct sg_page_iter piter;
> > > > +     pgprot_t pgprot =3D PAGE_KERNEL;
> > > > +     void *vaddr;
> > > > +
> > > > +     if (!pages)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     if (buffer->uncached)
> > > > +             pgprot =3D pgprot_writecombine(PAGE_KERNEL);
> > > > +
> > > > +     for_each_sgtable_page(table, &piter, 0) {
> > > > +             WARN_ON(tmp - pages >=3D npages);
> > > > +             *tmp++ =3D sg_page_iter_page(&piter);
> > > > +     }
> > > > +
> > > > +     vaddr =3D vmap(pages, npages, VM_MAP, pgprot);
> > > > +     vfree(pages);
> > >=20
> > > Similar to above, if the CPU can't touch these buffers, what
> > > would be
> > > the point of mapping them to the kernel?
> >=20
> > indeed, useless code.
> >=20
> > >=20
> > > > +
> > > > +     if (!vaddr)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     return vaddr;
> > > > +}
> > > > +
> > > > +static int secure_heap_vmap(struct dma_buf *dmabuf, struct
> > > > dma_buf_map *map)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     void *vaddr;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (buffer->vmap_cnt) {
> > > > +             buffer->vmap_cnt++;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     vaddr =3D secure_heap_do_vmap(buffer);
> > > > +     if (IS_ERR(vaddr)) {
> > > > +             ret =3D PTR_ERR(vaddr);
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     buffer->vaddr =3D vaddr;
> > > > +     buffer->vmap_cnt++;
> > > > +     dma_buf_map_set_vaddr(map, buffer->vaddr);
> > > > +out:
> > > > +     mutex_unlock(&buffer->lock);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static void secure_heap_vunmap(struct dma_buf *dmabuf, struct
> > > > dma_buf_map *map)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +
> > > > +     mutex_lock(&buffer->lock);
> > > > +     if (!--buffer->vmap_cnt) {
> > > > +             vunmap(buffer->vaddr);
> > > > +             buffer->vaddr =3D NULL;
> > > > +     }
> > > > +     mutex_unlock(&buffer->lock);
> > > > +     dma_buf_map_clear(map);
> > > > +}
> > > > +
> > > > +static void secure_heap_zero_buffer(struct secure_heap_buffer
> > > > *buffer)
> > > > +{
> > > > +     struct sg_table *sgt =3D &buffer->sg_table;
> > > > +     struct sg_page_iter piter;
> > > > +     struct page *p;
> > > > +     void *vaddr;
> > > > +
> > > > +     for_each_sgtable_page(sgt, &piter, 0) {
> > > > +             p =3D sg_page_iter_page(&piter);
> > > > +             vaddr =3D kmap_atomic(p);
> > > > +             memset(vaddr, 0, PAGE_SIZE);
> > >=20
> > > How can you do memset on the buffer if the firewall is preventing
> > > CPU
> > > accesses?
> > >=20
> >=20
> > yes, useless if we set a secure flag to prevent driver from mapping
> > allocated buffer.
> >=20
>=20
> Wouldn't you still want the buffers to be zeroed? I think you need
> a way to ask the TEE to zero them.
>=20
> This also makes me wonder about the deferred free mechanism. If you
> aren't zeroing then there's no need for the deferred free, and if
> allocations are coming from a reserved-memory region then the
> shrinker
> mechanism doesn't make sense because freeing up the deferred buffers
> won't help relieve memory pressure.
>=20
> I wonder if it would be better to have a more specialised deferred
> free mechanism as part of this heap (if necessary), rather than
> library-ise it as you have in patch 1.
>=20
> > > > +             kunmap_atomic(vaddr);
> > > > +     }
> > > > +}
> > > > +
> > > > +static void secure_heap_buf_free(struct deferred_freelist_item
> > > > *item,
> > > > +                              enum df_reason reason)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer;
> > > > +     struct secure_heap_info *info;
> > > > +     struct sg_table *table;
> > > > +     struct scatterlist *sg;
> > > > +     int i;
> > > > +
> > > > +     buffer =3D container_of(item, struct secure_heap_buffer,
> > > > deferred_free);
> > > > +     info =3D dma_heap_get_drvdata(buffer->heap);
> > > > +
> > > > +     if (!info->no_map) {
> > > > +             // Zero the buffer pages before adding back to
> > > > the
> > > > pool
> > > > +             if (reason =3D=3D DF_NORMAL)
> > > > +                     secure_heap_zero_buffer(buffer);
> > > > +     }
> > > > +
> > > > +     table =3D &buffer->sg_table;
> > > > +     for_each_sg(table->sgl, sg, table->nents, i)
> > > > +             gen_pool_free(info->pool, sg_dma_address(sg),
> > > > sg_dma_len(sg));
> > > > +
> > > > +     sg_free_table(table);
> > > > +     kfree(buffer);
> > > > +}
> > > > +
> > > > +static void secure_heap_dma_buf_release(struct dma_buf
> > > > *dmabuf)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer =3D dmabuf->priv;
> > > > +     int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > > > +
> > > > +     deferred_free(&buffer->deferred_free,
> > > > secure_heap_buf_free,
> > > > npages);
> > > > +}
> > > > +
> > > > +static const struct dma_buf_ops secure_heap_buf_ops =3D {
> > > > +     .attach =3D secure_heap_attach,
> > > > +     .detach =3D secure_heap_detach,
> > > > +     .map_dma_buf =3D secure_heap_map_dma_buf,
> > > > +     .unmap_dma_buf =3D secure_heap_unmap_dma_buf,
> > > > +     .begin_cpu_access =3D secure_heap_dma_buf_begin_cpu_access,
> > > > +     .end_cpu_access =3D secure_heap_dma_buf_end_cpu_access,
> > > > +     .mmap =3D secure_heap_mmap,
> > > > +     .vmap =3D secure_heap_vmap,
> > > > +     .vunmap =3D secure_heap_vunmap,
> > > > +     .release =3D secure_heap_dma_buf_release,
> > > > +};
> > > > +
> > > > +static struct dma_buf *secure_heap_do_allocate(struct dma_heap
> > > > *heap,
> > > > +                                            unsigned long len,
> > > > +                                            unsigned long
> > > > fd_flags,
> > > > +                                            unsigned long
> > > > heap_flags,
> > > > +                                            bool uncached)
> > > > +{
> > > > +     struct secure_heap_buffer *buffer;
> > > > +     struct secure_heap_info *info =3D
> > > > dma_heap_get_drvdata(heap);
> > > > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > > > +     unsigned long size =3D roundup(len, PAGE_SIZE);
> > > > +     struct dma_buf *dmabuf;
> > > > +     struct sg_table *table;
> > > > +     int ret =3D -ENOMEM;
> > > > +     unsigned long phy_addr;
> > > > +
> > > > +     buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> > > > +     if (!buffer)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     INIT_LIST_HEAD(&buffer->attachments);
> > > > +     mutex_init(&buffer->lock);
> > > > +     buffer->heap =3D heap;
> > > > +     buffer->len =3D size;
> > > > +     buffer->uncached =3D uncached;
> > > > +
> > > > +     phy_addr =3D gen_pool_alloc(info->pool, size);
> > > > +     if (!phy_addr)
> > > > +             goto free_buffer;
> > > > +
> > > > +     table =3D &buffer->sg_table;
> > > > +     if (sg_alloc_table(table, 1, GFP_KERNEL))
> > > > +             goto free_pool;
> > > > +
> > > > +     sg_set_page(table->sgl, phys_to_page(phy_addr), size, 0);
> > > > +     sg_dma_address(table->sgl) =3D phy_addr;
> > > > +     sg_dma_len(table->sgl) =3D size;
> > > > +
> > > > +     /* create the dmabuf */
> > > > +     exp_info.exp_name =3D dma_heap_get_name(heap);
> > > > +     exp_info.ops =3D &secure_heap_buf_ops;
> > > > +     exp_info.size =3D buffer->len;
> > > > +     exp_info.flags =3D fd_flags;
> > > > +     exp_info.priv =3D buffer;
> > > > +     dmabuf =3D dma_buf_export(&exp_info);
> > > > +     if (IS_ERR(dmabuf)) {
> > > > +             ret =3D PTR_ERR(dmabuf);
> > > > +             goto free_pages;
> > > > +     }
> > > > +
> > > > +     return dmabuf;
> > > > +
> > > > +free_pages:
> > > > +     sg_free_table(table);
> > > > +
> > > > +free_pool:
> > > > +     gen_pool_free(info->pool, phy_addr, size);
> > > > +
> > > > +free_buffer:
> > > > +     mutex_destroy(&buffer->lock);
> > > > +     kfree(buffer);
> > > > +
> > > > +     return ERR_PTR(ret);
> > > > +}
> > > > +
> > > > +static struct dma_buf *secure_heap_allocate(struct dma_heap
> > > > *heap,
> > > > +                                         unsigned long len,
> > > > +                                         unsigned long
> > > > fd_flags,
> > > > +                                         unsigned long
> > > > heap_flags)
> > > > +{
> > > > +     // use uncache buffer here by default
> > > > +     return secure_heap_do_allocate(heap, len, fd_flags,
> > > > heap_flags, true);
> > > > +     // use cache buffer
> > > > +     // return secure_heap_do_allocate(heap, len, fd_flags,
> > > > heap_flags, false);
> > > > +}
> > > > +
> > > > +static const struct dma_heap_ops secure_heap_ops =3D {
> > > > +     .allocate =3D secure_heap_allocate,
> > > > +};
> > > > +
> > > > +static int secure_heap_add(struct rmem_secure *rmem)
> > > > +{
> > > > +     struct dma_heap *secure_heap;
> > > > +     struct dma_heap_export_info exp_info;
> > > > +     struct secure_heap_info *info =3D NULL;
> > > > +     struct gen_pool *pool =3D NULL;
> > > > +     int ret =3D -EINVAL;
> > > > +
> > > > +     if (rmem->base =3D=3D 0 || rmem->size =3D=3D 0) {
> > > > +             pr_err("secure_data base or size is not
> > > > correct\n");
> > > > +             goto error;
> > > > +     }
> > > > +
> > > > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > > > +     if (!info) {
> > > > +             pr_err("dmabuf info allocation failed\n");
> > > > +             ret =3D -ENOMEM;
> > > > +             goto error;
> > > > +     }
> > > > +
> > > > +     pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > > > +     if (!pool) {
> > > > +             pr_err("can't create gen pool\n");
> > > > +             ret =3D -ENOMEM;
> > > > +             goto error;
> > > > +     }
> > > > +
> > > > +     if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> > > > +             pr_err("failed to add memory into pool\n");
> > > > +             ret =3D -ENOMEM;
> > > > +             goto error;
> > > > +     }
> > > > +
> > > > +     info->pool =3D pool;
> > > > +     info->no_map =3D rmem->no_map;
> > >=20
> > > This kind of heap probably can't work if the region doesn't have
> > > no-map, so I think it would make sense to enforce that no_map is
> > > set
> > > (or ignore regions without no-map in DT).
> >=20
> > if no-map is not set, secure-heap could be used as a heap with
> > dynamically protected buffer from the TEE.
>=20
> That would need a whole bunch more code to call in to the TEE to
> apply
> the protection. So hypothetically yes, that's true, but not without
> more code than what you have here.
>=20
> > but I agree that this is adding too much complexity and could be
> > simplify a lot without this mapping consideration.
> >=20
> > then no-map is probably not the perfect term to describe this heap.
> > is_s
> > ecure or is_protected would be better ?
>=20
> You mean in device-tree? no-map has a well-defined meaning; and if
> this memory region shouldn't be added to the kernel's linear map
> then it should be tagged with no-map.
>=20
> Whether there should also be some DT property indicating that the
> region is protected and can't be accessed normally: I don't have
> much of an opinion on that.
>=20
> Thanks,
> -Brian
>=20
> >=20
> > >=20
> > > Cheers,
> > > -Brian
> > >=20
> > > > +
> > > > +     exp_info.name =3D rmem->name;
> > > > +     exp_info.ops =3D &secure_heap_ops;
> > > > +     exp_info.priv =3D info;
> > > > +
> > > > +     secure_heap =3D dma_heap_add(&exp_info);
> > > > +     if (IS_ERR(secure_heap)) {
> > > > +             pr_err("dmabuf secure heap allocation failed\n");
> > > > +             ret =3D PTR_ERR(secure_heap);
> > > > +             goto error;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +
> > > > +error:
> > > > +     kfree(info);
> > > > +     if (pool)
> > > > +             gen_pool_destroy(pool);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int secure_heap_create(void)
> > > > +{
> > > > +     unsigned int i;
> > > > +     int ret;
> > > > +
> > > > +     for (i =3D 0; i < secure_data_count; i++) {
> > > > +             ret =3D secure_heap_add(&secure_data[i]);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int rmem_secure_heap_device_init(struct reserved_mem
> > > > *rmem,
> > > > +                                      struct device *dev)
> > > > +{
> > > > +     dev_set_drvdata(dev, rmem);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void rmem_secure_heap_device_release(struct
> > > > reserved_mem
> > > > *rmem,
> > > > +                                      struct device *dev)
> > > > +{
> > > > +     dev_set_drvdata(dev, NULL);
> > > > +}
> > > > +
> > > > +static const struct reserved_mem_ops rmem_dma_ops =3D {
> > > > +     .device_init    =3D rmem_secure_heap_device_init,
> > > > +     .device_release =3D rmem_secure_heap_device_release,
> > > > +};
> > > > +
> > > > +static int __init rmem_secure_heap_setup(struct reserved_mem
> > > > *rmem)
> > > > +{
> > > > +     if (secure_data_count < MAX_SECURE_HEAP) {
> > > > +             int name_len =3D 0;
> > > > +             char *s =3D rmem->name;
> > > > +
> > > > +             secure_data[secure_data_count].base =3D rmem->base;
> > > > +             secure_data[secure_data_count].size =3D rmem->size;
> > > > +             secure_data[secure_data_count].no_map =3D
> > > > +                     (of_get_flat_dt_prop(rmem->fdt_node, "no-
> > > > map", NULL) !=3D NULL);
> > > > +
> > > > +             while (name_len < MAX_HEAP_NAME_LEN) {
> > > > +                     if ((*s =3D=3D '@') || (*s =3D=3D '\0'))
> > > > +                             break;
> > > > +                     name_len++;
> > > > +                     s++;
> > > > +             }
> > > > +             if (name_len =3D=3D MAX_HEAP_NAME_LEN)
> > > > +                     name_len--;
> > > > +
> > > > +             strncpy(secure_data[secure_data_count].name,
> > > > rmem-
> > > > > name, name_len);
> > > >=20
> > > > +
> > > > +             rmem->ops =3D &rmem_dma_ops;
> > > > +             pr_info("Reserved memory: DMA buf secure pool %s
> > > > at
> > > > %pa, size %ld MiB\n",
> > > > +                     secure_data[secure_data_count].name,
> > > > +                     &rmem->base, (unsigned long)rmem->size /
> > > > SZ_1M);
> > > > +
> > > > +             secure_data_count++;
> > > > +             return 0;
> > > > +     }
> > > > +     WARN_ONCE(1, "Cannot handle more than %u secure heaps\n",
> > > > MAX_SECURE_HEAP);
> > > > +     return -EINVAL;
> > > > +}
> > > > +
> > > > +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap",
> > > > rmem_secure_heap_setup);
> > > > +
> > > > +module_init(secure_heap_create);
> > > > +MODULE_LICENSE("GPL v2");
> > > > --
> > > > 2.25.0
> > > >=20
