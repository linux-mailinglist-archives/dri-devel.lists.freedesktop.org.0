Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC77626FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBF610E1A9;
	Tue, 25 Jul 2023 22:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C987E10E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690325053; x=1721861053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ja7f0RVYcti+NpUW5zGpJGvqcXjePHIioRixBH74xkM=;
 b=j1YdbW/WdV5XXFVJtB89iFkVMMuBgdHEewppnHr6q9aaVhGngS8AiPdP
 Z2hDUNz4xD1aGEEmZmwm+/oQXs5RA+gXFVnIgWMC2hsilk7TdegsODh5p
 O6efS9Yw9xhAYYchxbQzBn5ODpyPZ+05H+djqAFl21NyjBwMEUPvSFT+i
 e6wwuQ8OCTeaHrlDco/t0aokOjzhw+i2TkOJxVf9BZ8GnjbYHfuZsdZKs
 ETxN5YnXBwQCBc4XqxyEvw4rBbT2qtAarCB/LbzfigXapUTV2RdoVeDal
 tohburpVp06DUi4jRt+M8A0gkvjaL6YePHUT1AO+Pyav4ezLWc4dkszj/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398780129"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398780129"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796300500"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="796300500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 15:44:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:44:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:44:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:44:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WegbVv8OXwzzthJnocmIvg4TfytTpuwhmpHuLuSsLqpf3FMPU7WgGYnZOb51jvfqlJ37w8WoXhVksrsQL0SFtT7no9awpOgVSXfNtTL/SRCoRggSl7ykeQ8e2yw6D12KrCVAfOoWYwpt/xAGQhpmIWKxwMw/4hlaMdgBqHJRMHQGGf9O9cUheb1JOIuIxKJwZwDaIP69BapqUVBCW7WoAKQzsHKKtksMY0ad6ZnwfO3MJQyXojeydrjgqyBjyF8n3Z1cXN9c2dMnfvaBkxIAD1mn+N0JJuwojedNCsIJy4BQzczm15Gyd2BoaY+x3ixglQKePz3oWioCRdaygcUmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ja7f0RVYcti+NpUW5zGpJGvqcXjePHIioRixBH74xkM=;
 b=iDWwLw3ER7ChWGYDAEIX+CcUWKSi7SvItx9Rslbgobe4lAIF/CesL/ct+mhByKd4DUZSD7ZQGQTNUjgfoQtwdLsVlOa/e2XC/V26pHgJ/FNhwrpCKWMh5zj4eHtYBfoc4j9z4547A3qEL3aGu9kFwchU1MfNdReplo9dJLQACXUeYWuGOQeUYyUv+gr/4kdV8wKziIxTPOVQjadaE0MyzVUlQ37bAG8/bAuysUE5hQ7dUF3OBrikwhPUk5alMx+aElaEoZvLXLumKX88Rgyb8Pyu1TknpRAJq7glocUrhv8KMc7eWcd1SZysBfcRktc/+2+nu6QGRdRxFfEKqu9hgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Tue, 25 Jul
 2023 22:44:09 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::9cba:c1de:ea9f:fba7%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:44:09 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6EA=
Date: Tue, 25 Jul 2023 22:44:09 +0000
Message-ID: <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
In-Reply-To: <ZL/B6yvO1bIkFRcF@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|PH7PR11MB7004:EE_
x-ms-office365-filtering-correlation-id: 6e4448a6-2780-4481-8480-08db8d60a92c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pH5oUWKM/tqSpDqeX2baZYtiLg2FlAzrRELIamzEFa+wbdA8DYELm0Mu8hYAdr7pTjdHfpG4FP0Ui7GNU8SpPL3YfnVJ9wUIQnKaOxSjmsWw+dEgRzWVkEk/B4H3efqnQBmJG50slU2g+6v6wK9MuxdHEqlX3l8tYgkLEeZL/OVlGYN+fa0enb07hfgl4Bz7fx30hEht9VW+yZyh4vHq9E2HFObbjRP9TH3xH+GxnTnjNmPWYfTPEJRF9nKaYC+VQDxAaYJGfumWdTy2ViyoujfeijDKlegRMUc6E/0SAk40Cv+X3HZ0wwJJfJ7gW/4K22DovZI+xhmQQQKe76S03fN66jFaU6PFL5/7Y0z5jw9KRtouotqmH9RQKiWNttWXVj9/8bNm3YflgScKjNwX53gggXVx3ONK7Ftn0uDQyW+sPHsbFvMTsnNNKQwtprMuhAA2D9hUiWOrvK8oOl2c2wMkakrL8QGl1jWI2OeRisJ2uuo9YPCoHf+hWfQdP96io0UfIpGNoN1tqUOP3ViWD6FDvbtGG6cYKHKEcl/PHYSs38AYv1yQgpBWPl75So3hyLsDoCZfXAHZb72aZQxE3bELHag7xzszCE+c+MR3/qhsg1E+C2VhfoJBIuwn7iP1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(83380400001)(71200400001)(66476007)(2906002)(8936002)(478600001)(8676002)(52536014)(41300700001)(66556008)(66899021)(64756008)(316002)(76116006)(54906003)(6916009)(4326008)(66946007)(5660300002)(55016003)(9686003)(26005)(15650500001)(6506007)(186003)(7696005)(66446008)(33656002)(38070700005)(86362001)(122000001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?heeMU7x8ojPQ00fub9phD3Oo9qEF8xSsGg5l2KlISU9ZmdkOIDsWAWhNOrrl?=
 =?us-ascii?Q?XU2AjAABa4XiZqkNVPv7T4xD/rc94xzjdHps17ozPrAkfufvWoH5nG3RzcRj?=
 =?us-ascii?Q?YsCBEEFyn1tnPPuEPxbQl6HIgBRlUNOOgdSAB/qzVwDTy296LYQg/+41P+BI?=
 =?us-ascii?Q?is3ebXzAooTuNy5oOCzxvPd74jx9AqNu9n8VtfNlab0G4IEjkXrLpSpQ56Su?=
 =?us-ascii?Q?5axuio6dYrNJINJtNNVE36kZIVzgHfquyMvg+QSdy5+o7OKsGMZgeapk90Xc?=
 =?us-ascii?Q?13PYNxW4eZ88DkKiWwKeUoUOFWIe9FFvGB/o1SRm/8vBOXld4ZFYidxpPHQV?=
 =?us-ascii?Q?nqs6nDIvb9CtwC+BencCIO8H79KpvMPHhHnvlSBfUxSHsUsPQxdfVnTAS31X?=
 =?us-ascii?Q?bc5A/TVUUbvhriMkD994h8sR5yvvU3uWlSpXFe0ZjaSbEzTMXCADeoYhGtU2?=
 =?us-ascii?Q?IrOBEa0C27rlFzEedjPkhPWaCHJDdoBOgJnM5/HgepMnjwMzMxIMKhAVv3GZ?=
 =?us-ascii?Q?eQ+uaxpp5qS3wFXot6sBbZsg+xTbQXQjdfFfETqpq7Vi+drwIgOPPnJcF2vA?=
 =?us-ascii?Q?bVl6YMJGwj8UgwGcPKuQngDW9MnZODiR5qEG4RIjP8bUBbeu3VUBLdZCc49W?=
 =?us-ascii?Q?L/M8XFjVklIQK0faQsshm/G3I+pnY9obaKmIqAC/NS0TjXBWRwyNvZuDoVvE?=
 =?us-ascii?Q?gP0uQK/Q4niK04L+h1Zo7+Up9I9hX/4qRDQ0nb1wncmqOXerWg4g0bulLY79?=
 =?us-ascii?Q?EBLFKixa7c2zeWnt05YyZIIcUKa08KZg4E5RzLKrzHyBtaXAErAJfupEEAuO?=
 =?us-ascii?Q?RUql03dgfOYUOkr16OI/1VI5jxn9wedjJEb1+lb5RSFtzgK6/v3cm/c0QNOT?=
 =?us-ascii?Q?8cPCuTmKvOCXFLoy/H/iArhpC6qrSfmPSJ4E/DOYudnz4J7+okyELmOH22q1?=
 =?us-ascii?Q?sh6u7UHv5Zh6qyWOMKYyue1VHyBryUHUgc29fQnd7xF/mbvF0Uv8zIyo9v/l?=
 =?us-ascii?Q?+z53dJRkZfpPGCYwJjyBcOyXTeF4gz67+Caj7Xvz66aac+nhU+ENyhJU4tfO?=
 =?us-ascii?Q?J07L879lKjYoMAbD6NMHZkAHheg2h9EwXHgKWuCrI4183wPPYG7uLxrUzHQc?=
 =?us-ascii?Q?e22e4csT7L05wQiftnuhD+3SRL4easI0x25fc0LWBoyWEGasSPsgYvMSOR0d?=
 =?us-ascii?Q?v+eM8U7tnOHf/tNrevOvKHWHhFdZtL+8DIanjU07vHZGqpPhwZUJh0DQfHxP?=
 =?us-ascii?Q?DObwWXDPcRasFGsnuTFdFPrU8n9DkWBMpASodMiXozQFfo/qcIhNagBsUF9p?=
 =?us-ascii?Q?UdcJiw6sB+A7y5TxZn+Mnuz8z03KiQmJjv3o1dDbhsPdUMfIjVeG3zO1Q8c9?=
 =?us-ascii?Q?oyfcf0g34x0ef62ZJJJ7/bhRV8ZMAk0XfoxuKbJikFwn6yNC47/IirzULcA4?=
 =?us-ascii?Q?hBIcdeYqF8IpElah62AV588eh08MwwLzGAbXFydfqN1oDezfOU66E/uaM2LQ?=
 =?us-ascii?Q?/9l+JHkWXztpht3T8K6dl7zxhLJKcC3mZRdPweTiVObmahkue+QmlmqYx80s?=
 =?us-ascii?Q?KO6HfQpSqdozhihASVjG4+fUeQnloR46g8KrQAc5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4448a6-2780-4481-8480-08db8d60a92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 22:44:09.7344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWVViPMQ5vfGJquSK/+CTgs6m67gDvYfs6gQfyU9wkT2dwmur4oTlGtMOO/3OOR6VqcKg1ZT2gTrcCow+7r7BdUtVgmeYUcdOZBobPeoY4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

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
> Holes created in VMA are tracked by invalidation, you haven't
> explained why this needs to also see change.
Oh, the invalidation part is ok and does not need any changes. My concern
(and the reason for this new notifier patch) is only about the lack of a
notification when a PTE is updated because of a fault (new page). In other
words, if something like change_pte() would have been called after
handle_pte_fault() or hugetlb_fault(), then this patch would not be needed.

>=20
> BTW it is very jarring to hear you talk about files when working with
> mmu notifiers. MMU notifiers do not track hole punches or memfds, they
> track VMAs and PTEs. Punching a hole in a mmapped memfd will
> invalidate the convering PTEs.
I figured describing the problem in terms of memfds or hole punches would
provide more context; but, ok, I'll refrain from mentioning memfds or holes
and limit the discussion of this patch to VMAs and PTEs.=20

>=20
> > > Trigger a move when the backing memory changes and re-acquire it with
> > AFAICS, without this patch or adding new change_pte calls, there is no =
way
> to
> > get notified when a new page is mapped into the backing memory of a
> memfd
> > (backed by shmem or hugetlbfs) which happens after a hole punch
> followed
> > by writes.
>=20
> Yes, we have never wanted to do this because is it racy.
>=20
> If you still need the memory mapped then you re-call hmm_range_fault
> and re-obtain it. hmm_range_fault will resolve all the races and you
> get new pages.
IIUC, for my udmabuf use-case, it looks like calling hmm_range_fault
immediately after an invalidate (range notification) would preemptively fau=
lt in
new pages before a write. The problem with that is if a read occurs on thos=
e
new pages, then the data is incorrect as a write may not have happened yet.
Ideally, what I am looking for is for getting new pages at the time of or a=
fter
a write; until then, it is ok to use the old pages given my use-case.

>=20
> > We can definitely get notified when a hole is punched via the
> > invalidate notifiers though, but as I described earlier this is not ver=
y helpful
> > for the udmabuf use-case.
>=20
> I still don't understand why, or what makes udmabuf so special
> compared to all the other places tracking VMA changes and using
> hmm_range_fault.
I think the difference comes down to whether we (udmabuf driver) want to
grab the new pages after getting notified about a PTE update because of a f=
ault
triggered by a write vs proactively obtaining the new pages by triggering t=
he
fault (since hmm_range_fault() seems to call handle_mm_fault()) before a
potential write.

Thanks,
Vivek

>=20
> Jason
