Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CF5BA20C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403910EBDE;
	Thu, 15 Sep 2022 20:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0811910EBDD;
 Thu, 15 Sep 2022 20:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663275286; x=1694811286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=70X2GvUL6Xnj0v0o4ZoGATteSoxbTEPAFu82Nu45UOk=;
 b=bA0FNVSqMi6EWnqcaNUbbBL6VJSS4UZsjsH5yvA7JAa2aqeqsJnkZwVs
 cycOAcvF1kthLs/mAZU04pztVXfsR2PeMtzyxyjXkK5VkFfNp1sBlydvH
 /3/sJVZgwEfVNnKDag0q0KuTgk8YsfaV9rWWu713I5RI17ox9NxgYwTfY
 tUPoni7L3cGXz3/04nP8+4ViJ8vSDOQBhnyqoIqSC1YU7j0DrNV8NPam3
 BITJVH1YrnGD+DdiuClFAMM8EIEQZyDbLH9kiP2VJXzq9Unpdo3IMAQqo
 0ab0cvdWScFSP0Q//5pQmai/vo0ynkcGoqK+fsmodpWS9MDwSXBXSIx65 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="325100047"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="325100047"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="862489302"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2022 13:54:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 13:54:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 13:54:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 13:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8FBiBxqGE8Za/Fr3/ke3d5SKxy62rkzExJIs57DQjD3EeMQPPrrz+J76YOi/YFDohdpDML7bdk73scB4672maGBAcH5uGp76JRmiOHbf4K0NNK431zCU1yRnv2PSSoyOsEl4lFN/8zHx3mkc2Rgn1nkCE8k/koiAmpfZ0AmApAo+J3TfIzark6/Raf6v90Ny+iX2j0ML6HzXOaQbdWDTZNrtdOURuC4cNOMl3roIDSZ6/+UHskKVRb3y1XqW7MnH6KmR6YXYHjHlUvFaPZwMvuAMDc0/WCFpiYmkHqYcXhZXlI20uLBiozMT61Mtek2a3LSWMaQr/ZCIHkv+y6/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDeNNXLViO2Oe04sXiwZC7Ckig2Kw+7zCw8rrBP2RDw=;
 b=FHRFICa4qbx3QEg5jxqUo1K4wzUHslmStiSwyW9jbB0hVv5QH859b05C0AeYN5im2q2zRmCD1QZ4/xfiTq6vOYtf7HXBdw6PL/1Zcb+juZl01fpQ3J15A21eU88askJJt0d0pn/Tu6KtY24L3CumNPpSXREmT3BD2opjDaZOYrgQQgfhIrng3x1dHGf5CfBP/G8nhr0MfgcyAYRU753zHuaGQgGEA274QNPly6dkTPYlLx4KCAtkM+DuJ+Iegjr5YgACaNKeNkr0+2JOgNl1/BpVLVMCOqrQOy4rQU9VVEJtCI6EGdgqJU4MscLWR523LVoomDt53DV/MK7gaNrK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 20:54:42 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::a2a0:a5a6:cf4a:e454]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::a2a0:a5a6:cf4a:e454%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 20:54:42 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Thread-Topic: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Thread-Index: AQHYxwvhDwkOr83sg0Wmwsp7KLTA2q3fJSpQgAAXe4CAAAqTEA==
Date: Thu, 15 Sep 2022 20:54:42 +0000
Message-ID: <MN2PR11MB40933B8D528D32B9F92AAC4FE5499@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
 <MN2PR11MB4093E87A6EAE878EFCE805ABE5469@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YyIZP2DjqyztwxxF@kroah.com>
In-Reply-To: <YyIZP2DjqyztwxxF@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4093:EE_|CY8PR11MB6914:EE_
x-ms-office365-filtering-correlation-id: 1033394c-953e-451a-821c-08da975c833a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /c6zAa3ZC8ZoyQochiB0HhWLDBUpAx6BYXWMoWtVt6SEHyeTODhytcckPP0HXyKLL8gRDkl9ethpwManAR7F4uN+0BKW6gJs8Vj/3Dm1/lAwSYihO/seF6tYDkMSykoZ/SoZy+ZurW9SOZo0E9EJzWFOb0LAfN6/yAsS1xVUUZM206CvbpeETSDbrQecvvK3ECVrxqgashvUwNQSOUozOjiiuymRug2Cej4ZsDSUeeVluRIpfAVZWBXxSvXpvBwRZm2FiWVqRmM49WT0IFc0Ed0z9QoGAXo1qNDdeiaflrYDfBFpzBaE9ofokVcUxLYJ9NzXopKD4WVYWOTAXSVGlUgI7zY0eRCbXTlYHRbZCDrDnfyJDmox7+RsOnQ1vlwSq7E20/mUsCeWdKd2yqKkSxSNpQ/AGHtE5DhdtHPZ8Xjqa9YYzG5nGggb8kPqOruyyYLW7zGduvXVS3EZZeWtUGrAOfHtnhz5XwvKbREzRFxfotOrPv63NAAdxZJvpdMSW8TQMKklTEop44PgLiExRiY44vBegF3Q6PbhmelF4acRDwSPgpPwP4KTwNg0KzFuPZP+hIDNLQswWBtj0GB6bQjEeo8zFvBfXOqlaCcjT6FpsvbVJORD24reIB1/PpVyIcVRv3B8nVZeEeb/Xk20QXxoIW1AyRXnCORSBVzIqYd+uqgK+oF0XwVXzCI/4fo0zxcV0CbWYWv95faUmKbJC5gW2ldTNfwwyGCVOAn6DLZxpDGu2Wzok5qv1rEHhGAcI8zPjHtH7pf+JQ31/2pZPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(86362001)(6916009)(54906003)(76116006)(33656002)(82960400001)(71200400001)(122000001)(38070700005)(83380400001)(186003)(38100700002)(9686003)(478600001)(66946007)(316002)(64756008)(8676002)(66446008)(66476007)(66556008)(7696005)(6506007)(26005)(107886003)(41300700001)(8936002)(4326008)(5660300002)(2906002)(52536014)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h7g3WmznoRyjLprfR3LhD7N6qbKciZbBDooRqT0xr/ToeFs2bwdA7XMt4mIQ?=
 =?us-ascii?Q?/t2NoTHKHE1wMjfTSvW1PdGPr8P713mr+TuNsoZGrCdtULfIzuLyAGoNUwYb?=
 =?us-ascii?Q?5VwzjXGsLv9dQNPKeeGolvAR6SIXUqF9dcKPGF7F3FU2REGoj2ZHcOo2veoh?=
 =?us-ascii?Q?Rh8jarMUD1thM+/sB+USrNdTCMAdp+nr4KnuQ7M73ZZZX4kxbnp9OqMLIhbB?=
 =?us-ascii?Q?BJS6o5Jf/n/HwqeNrnyyeVsFK+YbXi+AhR2uu5gJO0XyQ6kgKv/a3m28flL6?=
 =?us-ascii?Q?478G91Odn1CLIIGWiqcl1a74lsqTGpW70HpJM32+D3DydtSvcHfbR2NjhGXe?=
 =?us-ascii?Q?UdM57XD4NVR8FplrBvv/lLI0WrzuIawn1gDu/f3Zakqfi1pdTghI1dKB4Mg4?=
 =?us-ascii?Q?bOiCBvlOBhR3PuF1p30f0JtuoNgMf10pJCky7vAx+IEWegE20FbRzG4HIcyj?=
 =?us-ascii?Q?h48DHiNf3TiPbVewIXJlgXdz0gSet9RIwoFklGw+brm1c+hp8b1Cw1gWiYl7?=
 =?us-ascii?Q?o0+GTtoEzMWrBcAbhU+cOHquSBjBkQDv+N/lYcy4vAMtPhWe94rpjRR+AMyh?=
 =?us-ascii?Q?MLppGVSgU0GcieMoInGJfOV8o/IBXsXcpzxgYaWnqezvmH8WD20MZEHLa+Gx?=
 =?us-ascii?Q?QsV4JjCqBqiyBy+jB8rsG/YX4HpYch0/i4M5n4NiVTipLhmtaD7haOwspYDC?=
 =?us-ascii?Q?VR3zq3evSckJuNkycCkVCCWPIhuCYhCEK8W0+syBXnu877hkc3V1CbuGX+LW?=
 =?us-ascii?Q?rOlphtsA6wweDfdw5aMY4kVcZaAa9EoSEzmCztDgN4fDH9A7nFfDeTMyNhen?=
 =?us-ascii?Q?gB4SSUtvBvvxfCfqhvAORbZlkVKJxl3IKFdTyCA0BTTv4yAz8PNbaaZnsKJc?=
 =?us-ascii?Q?I4fVmsKGUrUAjC970wltFvt0OKk/oELKIyYOz8IOg95iOF445oaBC71nbs/e?=
 =?us-ascii?Q?7poiMM3vPHqSHdTNZa85+HzZ7HLg4LZ/JN4JKrO/GXyasDLIFafSF1S7ezON?=
 =?us-ascii?Q?UzBUTUzhZEylESXWtahC2Qf134aQQUSDazklX0HBKaLcZzYvElkQMyWn0eN6?=
 =?us-ascii?Q?XFyLkf7mLzl6DfwSMSv2cnDYTl/qBQEFI9s6/JeR5CYeNLxV+O1wOvuBfrwR?=
 =?us-ascii?Q?sXjdn+hAE/06v7FzXZkob98+na05fBrXBG14jPABNv2ir1PTOksnTec1Xtt1?=
 =?us-ascii?Q?u11Eo+2jtXxLK4VpjVO/2neN/te83lV73Frr/oNzoAy10YrXijCda/LHfeEJ?=
 =?us-ascii?Q?6+pYtw/6ecXRrpBfrb2UZ6nubmWqwnlMlfSp6e/QIUTR/hIBcapffSPkDB3A?=
 =?us-ascii?Q?Om8ivIfJO+cUgGHu7wFvYfHPoSYdtMiQt8jvCDbJFcGIpNcGVOxp7YMp79S/?=
 =?us-ascii?Q?znJ7wzWlLAo8T2lY2HV3Fte0BElB8Il6UV92hNqyLEorO2qOqSvE/mzD7e34?=
 =?us-ascii?Q?NoVRrNxqVcodkiHsYv9QQb4WOgHqQs6B58SD4CSxWqxz3eCC+xUNwRPC6Ria?=
 =?us-ascii?Q?fptMmeZfwmKlPcspGByLDLlgIzx3I4SaAhQ6rfoPzxrVBGhyyo4HDOYv3UL0?=
 =?us-ascii?Q?b9Yx7lJK/nleKf1n4+/rCTNXbf9E9lwSe8KMBxrF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1033394c-953e-451a-821c-08da975c833a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 20:54:42.0312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilvaq7SrkbQ64Dp1hb+0fcaUgm3LhWp3l42EmOvvGwL3AKrVtRkQWnHHkXsmDkvAR7ZmHavATMKtyGj7z+Er7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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
Cc: "Ye, Tony" <tony.ye@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Wed, Sep 14, 2022 at 04:51:03PM +0000, Winkler, Tomas wrote:
> > >
> > > On DG2, HuC loading is performed by the GSC, via a PXP command. The
> > > load operation itself is relatively simple (just send a message to
> > > the GSC with the physical address of the HuC in LMEM), but there are
> > > timing changes that requires special attention. In particular, to
> > > send a PXP command we need to first export the GSC as an aux device
> > > and then wait for the mei-gsc and mei- pxp modules to start, which
> > > means that HuC load will complete after i915 load is complete. This
> > > means that there is a small window of time after i915 is registered
> > > and before HuC is loaded during which userspace could submit and/or
> > > check the HuC load status, although this is quite unlikely to happen =
(HuC
> is usually loaded before kernel init/resume completes).
> > > We've consulted with the media team in regards to how to handle this
> > > and they've asked us to stall all userspace VCS submission until HuC =
is
> loaded.
> > > Stalls are expected to be very rare (if any), due to the fact that
> > > HuC is usually loaded before kernel init/resume is completed.
> > >
> > > Timeouts are in place to ensure all submissions are unlocked in case
> > > something goes wrong. Since we need to monitor the status of the mei
> > > driver to know what's happening and when to time out, a notifier has
> > > been added so we get a callback when the status of the mei driver
> changes.
> > >
> > > Note that this series includes several mei patches that add support
> > > for sending the HuC loading command via mei-gsc. We plan to merge
> > > those patches through the drm tree because i915 is the sole user.
> > >
> > > v2: address review comments, Reporting HuC loading still in progress
> > > while we wait for mei-gsc init to complete, rebase on latest mei-gsc
> series.
> > >
> > > v3: fix cc list in mei patches.
> > >
> > > v4: update mei patches, fix includes, rebase on new FW fetch logic
> > > and merged mei-gsc support.
> > >
> > > v5: update mei patches
> >
> > Greg,  I hope I've addressed most of your comments.
> > Can you please check if the mei patches are in acceptable state or anyt=
hing
> else can be improved with this series.  Appreciated.
>=20
> These were sent 2 days ago, in the middle of a conference travel.
> Please relax, there's no special rush needed here, you know better.
Sure

> In the mean time, if you are just waiting for my review, please take the =
time
> to review other pending patches from other developers to help lighten the
> load on me, and other maintainers.
Fair enough, that's all I do every day anyway.=20
Thanks
Tomas

