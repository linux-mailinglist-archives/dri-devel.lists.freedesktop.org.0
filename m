Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC5762699
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB3A10E170;
	Tue, 25 Jul 2023 22:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7604210E170
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323913; x=1721859913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Myiwi6JyeDUO0yDMF1jCjPCpGoX+LEr0lsp9vIho2lc=;
 b=GMPL51omYAEeTMM9AjWPzQnm+TNsb0p9ZouEtjhAD7ubbdPMtf/5pB7d
 WW+qmjk5VYVoXFxs3PRXWBMugxIlNHxM/RnqsoWNZ0H9JRomYWBFsgVEk
 QxtnZq1BbInK0AUQjTZ8hKjELB/xz0JBbCJIyCf6NIovDI2stmQZf7zYM
 Q3yt8/dDy26VtxqtS3IyZ6cFeBLY2z2mE458mFyRq0e8INdnMNJaU6nQu
 /tuxhiLx1Uf9s29GuPM26QtUGGM3SkK9RW0k2hnabPAsU4yoRNV6YVpTO
 CrwhjpMk+iDt6o20qy6I5g/zVyU7wKdtY5xPeWs4558ERHDzGbrK5BTrW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398777329"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398777329"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796297328"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="796297328"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 15:24:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:24:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:24:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:24:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh8CZ8bzxEuTwVWnZ9SklHfMiBk4RR6EcEgmIfpU11LrybecGChXo/x9p+YpTUYr4pDDkNyRNgIO2NnpeLaO7JJRYtvTosgQXPfimk8NFUg229sqQdOgVfFE3JsKPBmHZwvFbxZkCM5B+WBxWzyh7oNDt9cFPYi1qUIE4Up4i6fP1XmoPSivEkdnTP/tpllGX1PidS7kesjgcgATA9wzzU7LiQ3sEGH41VViS4MuUStSvqfFrMwnAfEMrxnriLE82yDBktFbt1AukU3bGCWVY7N768MBgwuKWsHTgcl75+KzXwZW81BfWW8h9gvZi7LkYwFs4XNAr3wYFd0gj81/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myiwi6JyeDUO0yDMF1jCjPCpGoX+LEr0lsp9vIho2lc=;
 b=kfpx+s576ZRkGsjqojLGJneDJoKhXuD0XZ5s+GaXEIGbb2+pR5ukZUFBzZ1I2p28smcYe4DmUEK8JbNfqCHfYOJvbL2/+IzhMuPqYYncEwG3bUaoC6ws9Hr3PHJnn/9ySlfsN4zjAQ+J09MVXaN46nQc0M3lGkGijsHtn6dKDHHBzPmNGixXZY2J/B5maGiTE4EuGRYVE7hCOkzvjqlXpbPoGc2zlQoVfwecbKG2nAknOwDNuV/YenHD7xySQXhLDLJZCKtSzxMBpJNrKBGF9qAJWpvUHA5kTCLWBbcg9+QrmBxdQWlZT8gpg0ezaiYGTp96QFJ9Xw8ZQu6aMjT9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:24:22 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:24:21 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Hugh Dickins <hughd@google.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IAAwXOAgADrBVA=
Date: Tue, 25 Jul 2023 22:24:21 +0000
Message-ID: <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
In-Reply-To: <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|IA0PR11MB7956:EE_
x-ms-office365-filtering-correlation-id: 6932a0c5-21d0-4eae-b6dd-08db8d5de51e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NoA/x7X3KbmofwEc6mwXgCIptUMTyyb2VFyFAi7lerJbVWjzV/olKdb4DkwB+Y8iiB6DoUZc6CxJKHbKawhIm2Z0q8a8ZurX0/XnSqh9/BEfXzXRSAu87v6HLVSX2G9POk+WFWPJJa3UQDzfCmQpTSGA3qvzXvT7hcqO8iRbP4QEbrZ6dZ7QfhjcNV4cHumSo7QZW5uXGmrhGzmzG4WRjYODopZt0t54iYq0VKu32DS2Uwa5Zh5D+TMZwljcj52rO9026ku9gl5S+PqYIlVJRHyUoTdwdRUA9oI5RRdiTmbFTMfOdM7xX2OU/FxHKIKV3qDHlOMpUiyqlWaaVvaCj13yPm7KFDSCDhWydzoBjOa44drpyCpPItLJjZ6+24nRtZH4RxWlrYZKydnfZHW1OVPVnpw3GvDcA6QN038BSeHIBbVGn+9xx0jCM52yVW0d3V229csXrN9LWzwkZXEzzFj69sstElnzn+pEA0ZvOM9Gl3t2LqvzrAmnPogd51KY8qSCiW0T7FRNDTwDL1T0k4oEZzDy/7luzLJU7+HDP+qHl1SL6fD1mWUQzBC1A3U7TYdE0GJ9TFqv0pU8HsmlbsG76a7++FHapEkxph0a44C0zge3KVDiT2pxStASrGh8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(9686003)(55016003)(6506007)(26005)(186003)(41300700001)(76116006)(4326008)(52536014)(316002)(33656002)(7696005)(66476007)(66556008)(64756008)(38070700005)(5660300002)(15650500001)(66446008)(6916009)(66946007)(8936002)(38100700002)(2906002)(8676002)(83380400001)(122000001)(86362001)(54906003)(71200400001)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ob5XnaT+PGO3wGWwXCdUrAkatUM7xceLAwu1fW8PYMxx9wUpHNU/zbzyLimj?=
 =?us-ascii?Q?o7/Lxb/BZ/nFkQSHE+W2yVOG/QbwEZpnzro97oHbXZHZbVI7roKSxig7qnYd?=
 =?us-ascii?Q?TAjf8T++kEGTJXe9RSPrj3j0pEWVY9xvAV6eL5gYn8U8FnmtcFGvsIqrORnu?=
 =?us-ascii?Q?TBzsVssM0ntzRTSCj9ZGA/c9tPKFN+ibOEQFTIPa5EvRGfxaoKulxx1CJ12/?=
 =?us-ascii?Q?qKRYgezBqyQNJFkcJfsRiT1AFUU5zNDnSIYs4qXScbrCLZ0YvRueQZJm1XrV?=
 =?us-ascii?Q?G7b5P2POBM0C8YLoSbaRPm59OrIdcKU5fNbIlm3Yz8kU9z1zKERDKMajJnS1?=
 =?us-ascii?Q?rUYTd+gUPf5b+v5UFGfwefcfIwR4N1kaAsJWepY/8IJpDhVG40ilbVX/dnpk?=
 =?us-ascii?Q?AMaNCqgBCbdxOuZPL8shzksa7j8s7o2bT6P9iCsdbSvsG2MbtAr5ri4ZEoPN?=
 =?us-ascii?Q?RAW/FJT3JG61j8f9rS8U7qhO/Ghbo835/hY+9UJp+JWcYyS5aiJchbV5Cy5T?=
 =?us-ascii?Q?+S03XEsZMlylbhyq3y/LWoEeqW51rC4+QspTEjU3AmYkODXxK4qk7XN3mRZE?=
 =?us-ascii?Q?dt8/dX/GWGtn10ITQCVaDkEkRP34oGX6gOrXquYzCteJ9J6Jl4dmOm4ct/Ns?=
 =?us-ascii?Q?37kj7knqvMDhsatl6rUaKZkW7Ts7vMEVqOnZlvO9OIjm7nuyvogMMMtvjAWG?=
 =?us-ascii?Q?BZo4yVuZFsdMBECWmuj7PVKptwccBs5cHb2cYPgW8H70FkOXkwA8W6iRqGhe?=
 =?us-ascii?Q?9rzwoMKkJhWFXrX3k2zwI45ygKoMGAIMGRtCBCatDATqjj0ufvmWOlaWZT4E?=
 =?us-ascii?Q?U8Wj3ctguJSv1pI8814o85tnHd3y9KwOtEzukvD+S6vWT6RL0TgtS9Ld7HqY?=
 =?us-ascii?Q?gpySUiSNrTXJCt0q2euNSilWbckTQLzG3WLCxGxBUe2yLWgNyf4oHNKHfdw0?=
 =?us-ascii?Q?C5ECAAgp0GpHCmEwbkBsbFpTOV/0DrWcHwB2fNVRMLn3WPpTk41Bmf+0ZhhV?=
 =?us-ascii?Q?SbFmWllr/tL1FadpacpKiSlsoTaVHMgobpsg78wHGSmfn0ZVLLJAuMrT2Hsy?=
 =?us-ascii?Q?a4GXNGkm26SExLuFMZKrL2c0kZvJp/EQqIfdXgKdtx5tiuNIZ2q2wuECiLzj?=
 =?us-ascii?Q?aOpec8/3atPS+ZvLiSs/TkmzokaBA8+n2Pk7qYP80+7RRjvBMHDSv+Mry6p2?=
 =?us-ascii?Q?ZIBphuMDIQH6jolkq4C/0bA3/Shd39SmaILSwTEseGjR0yC2Zws/V1EMiYXd?=
 =?us-ascii?Q?lF+RJzWwfrP378GOJwTeQ4JuIG8XoxsFWzEkTObyW+a7FWU3J98TNMeK7SD0?=
 =?us-ascii?Q?0xqSf30Q34EbyKA0jO9sNgyiGCfUYu/pvF9Du1xMlERgGTkvu8iySR242hcm?=
 =?us-ascii?Q?D4CZGOmKN/3Qe/+pY+YMlWsiiBL3i4eROKIY9A/wlaVUcPvlHA2xw6vWmB3+?=
 =?us-ascii?Q?8kqDj7cIC7n6MuwSSE2tF/3GJ4pTtD2zHHN3tg/M+DDY+wY3hBD/xwDI0xZ9?=
 =?us-ascii?Q?HzfnYmVJzKE3D2XCFJsa49QPCv/adTOLZP9HRs8Gju1gF79VYeu6eo6QXdho?=
 =?us-ascii?Q?KErItdAWuIpAcpwPzGSEqEvKzgAiUpbMqMcVpoxg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6932a0c5-21d0-4eae-b6dd-08db8d5de51e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 22:24:21.8455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSveNeVCihLO4uUwNGUSYO/Uj9JQl9Y6TqVdNaHhdjveCKbe6ofdDH+y+5sx+2FdqB8wjOqkVmiuOi3R8dod+1YiBT4C/HkHv3rTP/fom58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hugh,

>=20
> On Mon, 24 Jul 2023, Kasireddy, Vivek wrote:
> > Hi Jason,
> > > On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:
> > >
> > > > > I'm not at all familiar with the udmabuf use case but that sounds
> > > > > brittle and effectively makes this notifier udmabuf specific righ=
t?
> > > > Oh, Qemu uses the udmabuf driver to provide Host Graphics
> components
> > > > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest creat=
ed
> > > > buffers. In other words, from a core mm standpoint, udmabuf just
> > > > collects a bunch of pages (associated with buffers) scattered insid=
e
> > > > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > > > them in a dmabuf fd. And, since we provide zero-copy access, we
> > > > use DMA fences to ensure that the components on the Host and
> > > > Guest do not access the buffer simultaneously.
> > >
> > > So why do you need to track updates proactively like this?
> > As David noted in the earlier series, if Qemu punches a hole in its mem=
fd
> > that goes through pages that are registered against a udmabuf fd, then
> > udmabuf needs to update its list with new pages when the hole gets
> > filled after (guest) writes. Otherwise, we'd run into the coherency
> > problem (between udmabuf and memfd) as demonstrated in the selftest
> > (patch #3 in this series).
>=20
> Wouldn't this all be very much better if Qemu stopped punching holes ther=
e?
I think holes can be punched anywhere in the memfd for various reasons. Som=
e
of the use-cases where this would be done were identified by David. Here is=
 what
he said in an earlier discussion:
"There are *probably* more issues on the QEMU side when udmabuf is paired=20
with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for=20
virtio-balloon, virtio-mem, postcopy live migration, ... for example, in"

Thanks,
Vivek

>=20
> Hugh
