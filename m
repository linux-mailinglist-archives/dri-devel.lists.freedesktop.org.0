Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347155959BC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 13:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558838AF08;
	Tue, 16 Aug 2022 11:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7B8AC9B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHJAyL70mYTQ/1uLXYJAjGdNp28ovRqNdpFiw20igMcBoR28cA7mRiodj/o/XbhCQuDsg6hmD0fDfmus7C1D7gMKV4EayxgEyXbD1estqrGSW6DHVMNkqA83KhHvsPAKIcDhVFQmhIO73/osJ7RRE9g7QegVf3iJAummEQQf3gZzsFrpF/fSU0YXNFUacjUbFublbJIRoL+nUQDlI22fMh+jizcFzPEDaZGVMVJUww+wVGTWURMmr9ExcHcMO5VRqjT2V/PDRxxg0gT2B4zHDIx2iLOF+ipIYCzd9n+3d8lTUyUhKikz0TBfqyLENqce3OtjlMEHkEC3x90VN3alRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBbkGqfH4Mc36aohrKz8HsxMmkMC2nqCivIr63yDziU=;
 b=d6sD6u5pKmOUTBWZaBUf1OTxI7p7B5nFrxCCx4HFRqJNblRhtmUogEMPFkXaFK42FMF0r6Q5OHUaLCpUMdLz3fEABDy+L1MAf2XTECLE8U6F5yxYSJIFZf5ahd6R5afqT9TVcU3AfM+BVoYYx2nK1/KI4spxXxeIv5bKw6jfU19dXXyjIGlG7MYcNx6jLlnKBh0u09y1xPy1Vi5p64GPRbmntNFp4kaheI0o9QqzI4nxx2Fa3FvDzBcg2yV4M4WMmFdyLGHB/a1+Cik4O4V5MufQuMFR9iheDq/KArgwPqb/46XxBimF2jRPLmwD8sUA1/Gggg38UbkpEfs4KRbg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBbkGqfH4Mc36aohrKz8HsxMmkMC2nqCivIr63yDziU=;
 b=Em4NEFksGAdbQDxQUwCWI+2Lu07sfE0Z7qJaYaY4eIBPMipFpRxnglHXy2vMUOArgmjXi3kheWkddriS8L9d2yuWNgxEFA/ucuvHcfJjGXhnvA0oMbVsN4lEzPsSRvXDe9bpkpOmh78FfDTA3o4ouJWnNnPsR2kCTvmVX/NQ/WY=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM6PR04MB6517.eurprd04.prod.outlook.com (2603:10a6:20b:f5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 11:20:50 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 11:20:50 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762gcg6AgASkiYCABmvpAIAF7/SA
Date: Tue, 16 Aug 2022 11:20:50 +0000
Message-ID: <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
In-Reply-To: <20220812163922.v7sf3havi5dpgi5u@000377403353>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa45d1bc-75f4-498c-43f3-08da7f796013
x-ms-traffictypediagnostic: AM6PR04MB6517:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZ9eVd3e0OHiNOQjzY0Ig1hDDi6/E0BoHSsQTVvTMm+XCmclTHIm5SJfgLt5glkulw8n7fyVS0OrUs1ccc9k+ITDzEgx042wZxYFE8KL42ZpgjKB2jhnxJBS/6pH+nOCuh/FtGr/RLof8vBwod2D844IdVsQhKaEOIYTVYYIjQfMZFCtrxM6ZeO59tfziQnGEMLa364fBRq2mtN0nkPd0dd3ztPgqNt1a8gVULuqxWqkw84g9As1S3AykDtpF32mSoLw2Lkvhfe5a1asDcDjY9WqxQSCUXhZQ2f+/OjkmaSaC1uO7q4/eS9d+vFPFea7lwDp/F3ir1SWxCLTnP2M8XjvwxIbDaJx2ckaytNhHIaTMqM3RXRlr2ottJVQez4stoWl2Wx3ghK9+K1JsLwUjPwXXJ09RBVBTApku2kHTugbyB4neZcnW5HuqPJNrj5a4vphcre8E4krLHnVRDDedZeHsIZz3rz4hu8EUokdzlWL6wATsi+BfLJIIHxYhhuy3j8dZbKHPMA2+aAfGWRT9CPxPIZR6AXrIeZOIwPNBULR7KejiO+ZO3HkZqYem0r2eukMowaz2bmpiL/tMnmFA8/EqmigTBcbFikXp5sLlMTlpXiV0TDum0lLSgF0oTESaS7FyiEpi7wVZGdHglygoF/xjzLa8Gjx1NV0GmHod140bvH60Iqf6uuS2I2o3pswqTJT4GaFelQBq2+r9TpPPLftmajn3npxFefxfqDZa/hINlWUJ/ZFyJHgvh1BQ7YONR+s27WxljuUQhw6E7WfWkHcjgLXCRBEHb8ZfU9McKuRIDqQ1jS/7Upa7bflJOb8cYrdiRqIiW9Vt0StZAjJ2YNgBsIWPHHBmgOIwAyiQcv2YGiN7u0KzQgeBO8vFSka1ICPoFN92uJs1UQIKElLCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(4326008)(45080400002)(54906003)(8676002)(966005)(6486002)(5660300002)(41300700001)(186003)(44832011)(2906002)(6506007)(36756003)(26005)(6512007)(2616005)(6916009)(38070700005)(83380400001)(76116006)(71200400001)(91956017)(66446008)(8936002)(316002)(66476007)(66946007)(86362001)(66556008)(478600001)(38100700002)(64756008)(122000001)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?VY8YLuESmcW8ddzqz4YkagK014TaXTKcgAf5OPZjAdraWDUwJXT4S/x6r?=
 =?iso-8859-15?Q?vtcrkv8314v86WSDnmB+PYApM034LE8jKe8zeeVG2PqBiaUyn+0fzJPQA?=
 =?iso-8859-15?Q?kyLm1qQB3cx4m9mxVMiMuAis8f7FD1Xn95cYHGG5d8B0sCOqytb6QDH6y?=
 =?iso-8859-15?Q?QS49ftKrFhlabLNg772PZNUfbhyQSGLVNgLtxHHN8/sGc/JP1JdgKLGyv?=
 =?iso-8859-15?Q?yESocqQsFOo9yZORrcjKNN9PVPKj+iIguhf9sIwIkOTnu3KmOr8xTW64S?=
 =?iso-8859-15?Q?3QULVkJs35L9dLvYK2578ntU79I10u4KWynJc2f5heE9sO4/Tl9oM+yq3?=
 =?iso-8859-15?Q?MPQuTAWajszYTk5weMhQLwD8vMT4RnG+kg8nGGGglkOy2anbYhbnI9TJq?=
 =?iso-8859-15?Q?neaH4X2LTE5lUxNeU4EoqgOMouu48TdICx6A/t4IioiMexcwUDRB9uJKv?=
 =?iso-8859-15?Q?cNzqIPXPqbckrxXlBxfMuQxgh/5TyVsZWUMIqikYcFDShISvZvfr5hdEH?=
 =?iso-8859-15?Q?2cTn48NQSrQqc6eX40QvySFtHb0oUK3ezHgbRqjmkGQQUNHJ7Xl3oWrPg?=
 =?iso-8859-15?Q?N7WrqndBX4NfO/gVBl/QBKNTV/Z+TBnFcZvaA069GvBjHt9a82gG+bsNz?=
 =?iso-8859-15?Q?G7Gtfi67T2278ZnmnkkI38wrTX0wCNTvILTRXnr09s8MRMxL54J0yBdpV?=
 =?iso-8859-15?Q?EcqzCkwulNf45Vt4Rg0FJ2ufjdSSnmWW7INKENUlf3S1bxa+WHcER8f67?=
 =?iso-8859-15?Q?7KI/XzhnmKXvslj6pl5oBf+/IFQT1opv0uunRGhX8BTg3Umh3KOHGaT/w?=
 =?iso-8859-15?Q?lZsvgsYqZ9aFVU8ak0C6G77GCnMAMF/+WZXDy4Wl/6kkVXmcCDbTDI7wO?=
 =?iso-8859-15?Q?IZxKxMe38YCJiAFlyJ0jZQrrQUR8uhWI6Prs95s6bTzrGeXlFrFIgsXkV?=
 =?iso-8859-15?Q?XBzwbtvI1vmNN/2Cx1QvI/tHLYuaPNNPKt67h69KMrXJ2P69d4j6jAq/I?=
 =?iso-8859-15?Q?F7Gcg+fDC6dLkNn8tP/wVV0wDKM7me+hp5s2z/bHAjGrXCJL6xF2LLgOL?=
 =?iso-8859-15?Q?MWIO7CL/hRkIpmiIrxRGf8qQyO73DbGntGRDxKI0uIz9DCIW+PgD9cnbi?=
 =?iso-8859-15?Q?vNwQ81zed9Uu/+j3QwHcmKtheudaMWIKq5DSqsiBCE+F+Pdca2udBnnnf?=
 =?iso-8859-15?Q?TErB7VUk2XOZGfAvGNcfsidOoUlu9Dv0GPny/QE1nrhb/GiPhvNauv7yZ?=
 =?iso-8859-15?Q?N3S6MwAro8HktT1dJOeIcwIpT/H7K+7UKC3d6wH7D2dalKVrvS2Gpxz4I?=
 =?iso-8859-15?Q?Pe+i4gY9tOxzX8QZvpokkZfWAD8X3heFcB8Vngc6KLwrpH0STep++Hx56?=
 =?iso-8859-15?Q?/hcurGcRZv+PUmew2CN7H3HrU6GqZXW4/WTHZdI2LJzJLHfgX/2du6aP2?=
 =?iso-8859-15?Q?qWHijihuaVI8kJ0YgO0reCwBMWcNHLhq7sLf93zc5m+HxP78MNmYqJdDY?=
 =?iso-8859-15?Q?5WPraTTsqXwZIztt99+CzbGwFCPi1hAmHf1bLmOrpWXV+W8pDWjPSyWs/?=
 =?iso-8859-15?Q?vpXMubSAck34v7hgtGu9vIOuOBfw2jGRHVkKy1kENDD5ecFNjhzUEzv9Y?=
 =?iso-8859-15?Q?JYhFlVK0eAkN4Bcuo/5RqmsUdwY13+yH+amgI/M/09YiqaHL01cc7L0yr?=
 =?iso-8859-15?Q?JypI?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <735FFE6E4F11EF4BAD83CA414469C0D3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa45d1bc-75f4-498c-43f3-08da7f796013
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 11:20:50.5835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lry1cBm68VfE46vpR5J7sI3h57cQANr+llcgfSEDrFsh8fV59XuWGrYj2g6Vx9vEpCT6NsLDnUIvDfR+Z/jVqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6517
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


On ven., 2022-08-12 at 17:39 +0100, Brian Starkey wrote:
> Caution: EXT Email
>=20
> Hi,
>=20
> On Mon, Aug 08, 2022 at 02:39:53PM +0000, Olivier Masse wrote:
> > Hi Brian,
> >=20
> > On ven., 2022-08-05 at 16:41 +0100, Brian Starkey wrote:
> > > Caution: EXT Email
> > >=20
> > > Hi Olivier,
> > >=20
> > > Thanks, I think this is looking much better.
> > >=20
> > > I'd like to know how others feel about landing this heap; there's
> > > been
> > > push-back in the past about heaps in device-tree and discussions
> > > around how "custom" heaps should be treated (though IMO this is
> > > quite
> > > a generic one).
> > >=20
> > > On Fri, Aug 05, 2022 at 03:53:28PM +0200, Olivier Masse wrote:
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
> > >=20
> > > I think this commit message could use a little rework. A few
> > > thoughts:
> > >=20
> > > * The bindings are in a separate commit, so seems strange to
> > > mention
> > >   here.
> >=20
> > what about:
> > "add Linaro secure heap compatible reserved memory: linaro,secure-
> > heap"
> >=20
>=20
> I'd say something like:
>=20
> Add a dma-buf heap to allocate secure buffers from a reserved-memory
> region.
>=20
> ..snip

ok right.

>=20
> > > > +
> > > > +static struct sg_table *secure_heap_map_dma_buf(struct
> > > > dma_buf_attachment *attachment,
> > > > +                                             enum
> > > > dma_data_direction direction)
> > > > +{
> > > > +     struct secure_heap_attachment *a =3D attachment->priv;
> > > > +
> > > > +     return a->table;
> > >=20
> > > I think you still need to implement mapping and unmapping using
> > > the
> > > DMA APIs. For example devices might be behind IOMMUs and the
> > > buffer
> > > will need mapping into the IOMMU.
> >=20
> > Devices that will need access to the buffer must be in secure.
> > The tee driver will only need the scatter-list table to get dma
> > address
> > and len. Mapping will be done in the TEE.
> > Please find tee_shm_register_fd in the following commit
> >=20
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flinaro-swg%2Flinux%2Fcommit%2F41e21e5c405530590dc2dd10b2a8dbe64589840=
f&amp;data=3D05%7C01%7Colivier.masse%40nxp.com%7C6b3d47f1e15c41a8cf7108da7c=
813ef6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637959191795668899%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DOKZhaNevD5dj7Wjm6zbZlij0mPA9XYyio1N=
AN3VjTVM%3D&amp;reserved=3D0
> >=20
> > This patch need to be up-streamed as well.
> >=20
>=20
> Interesting, that's not how the devices I've worked on operated.
>=20
> Are you saying that you have to have a display controller driver
> running in the TEE to display one of these buffers?

In fact the display controller is managing 3 plans : UI, PiP and
video. The video plan is protected in secure as you can see on slide
11:
https://static.linaro.org/connect/san19/presentations/san19-107.pdf

The DCSS (display controller) is able to read from the protected secure
heap and composition result is send directly to the HDMI/HDCP port.


>  If everything
> needs to be in the TEE, then why even have these buffers allocated
> by non-secure Linux at all?

The TEE is only doing decryption using the HW Crypto Accelerator
(CAAM).
The CAAM will read from a non protected encrypted buffer to write clear
content to a secure buffer allocated with DMABUF and mapped in secure
by OPTEE OS.

>=20
> I would have expected there to be HW enforcement of buffer access,
> but for the display driver to be in non-secure Linux. That's how
> TZMP1 works:=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstati=
c.linaro.org%2Fconnect%2Fhkg18%2Fpresentations%2Fhkg18-408.pdf&amp;data=3D0=
5%7C01%7Colivier.masse%40nxp.com%7C6b3d47f1e15c41a8cf7108da7c813ef6%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637959191795668899%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DXVpI93dXYu%2BGswLE8dcYboq%2FAWzSJn9j9LMlngpr238%3=
D&amp;reserved=3D0
>=20
> Looking at this SDP presentation, that also seems to be the case
> there:=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstati=
c.linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D0=
5%7C01%7Colivier.masse%40nxp.com%7C6b3d47f1e15c41a8cf7108da7c813ef6%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637959191795668899%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3D5Ec61NC1f0UQU%2F3BEURZQhEBrZ%2FuvJ1vaoSN4ChMn%2Bw=
%3D&amp;reserved=3D0
>=20

Indeed, TZMP1 is similar to our implementation.

> Based on those presentations, I think this heap should be
> implementing
> map_dma_buf in the "normal" way, using the DMA API to map the buffer
> to the device. It's up to the TEE and HW firewall to prevent access
> to those mappings from non-secure devices.

In fact, our devices (VPU and DCSS) do not need any mapping, but only
the physical address of buffers which need to be contiguous.
The VPU decoder, run by the CPU, read video meta data from a non
protected buffer and send physical memory address of encoded buffer to
the VPU HW.
As well, the DCSS get physical address of contiguous decoded video
buffer to do the composition.

>=20
> My understanding is:
>=20
> * The memory region should never be mapped or accessed from the host
>   CPU. This is not a security requirement - the CPU will be denied
>   access by whatever hardware is enforcing security - but any CPU
>   accesses will fail, so there is no point in ever having a CPU
>   mapping.

agree with that.

> * The allocated buffers _should_ be mapped to devices via
> map_dma_buf.
>   Again the HW enforcement will prevent access from devices which
>   aren't permitted access, but for example a display controller
>   may be allowed to read the secure buffer, composite it with other
>   buffers, and display it on the screen.

yes, in could be done for a more generic implementation.

>=20
> Am I wrong? Even if SDP doesn't work this way, I think we should make
> the heap as generic as possible so that it can work with different
> secure video implementations.
>=20
> >=20
> > >=20
>=20
> .. snip

alright, I get your point

>=20
> > > > +
> > > > +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap",
> > > > rmem_secure_heap_setup);
> > >=20
> > > Is there anything linaro-specific about this? Could it be
> > > linux,secure-heap?
> >=20
> > for now, it's specific to Linaro OPTEE OS.
> > but in a more generic way, it could be
> > linux,unmapped-heap ?
>=20
> If these buffers can never be mapped, not to the CPU nor to devices,
> then actually I don't see why it should be a dma-buf heap at all.
>=20
> If this is just an interface to associate some identifier (in this
> case an fd) with a region of physical address space, then why is it
> useful to pretend that it's a dma-buf, if none of the dma-buf
> operations actually do anything?

in our previous implementation, we were using unmapped ION buffer to be
able to send an opaque fd to the TEE driver which could then be mapped
in secure by OPTEE.
Transitioning from ION to DMABUF heaps, our retaining option was to
create a new heap type.


Best regards,
Olivier

>=20
> Cheers,
> -Brian
>=20
> >=20
> > >=20
> > > Thanks,
> > > -Brian
> > >=20
> > > > +
> > > > +module_init(secure_heap_create);
> > > > +MODULE_LICENSE("GPL v2");
> > > > --
> > > > 2.25.0
> > > >=20
