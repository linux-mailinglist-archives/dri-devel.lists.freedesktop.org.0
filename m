Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095E76A85F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 07:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5A910E306;
	Tue,  1 Aug 2023 05:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA94B10E306
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 05:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690867962; x=1722403962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PUCBmWmv71UdD7migV6bMlEyBS6SHh4q/IRZi48NK70=;
 b=a8AqpUzGi1Pafd2bJiICG7vhnahrDGxhRFwcXtbAR7qTXURSEutWLif/
 kNz4NkCAR/rqi5E6ozg/zXN4NtLoI3DN/ekYegMNWl/DIX0MmU6bl8wsR
 vHCnwPgNRpU3Nh5bOf2gxvRUz2/SewKyEl6q5VujMeHX6eb9RQ0UTYyp+
 seQzuOluQj/WgtMCCeHuiDmcxdM2qQOm9jutDCH01fQo5e9WKuUE5IFhz
 ITjRJg2JXsTkBoojxEMnJtGFHDuYGzIjdWIfLoKGekDc8nnXWMqsySYfw
 lVGHsjbVRMtlXUjnspVBdak+DuT8gMo9Yjzd/l+dXkVZC/rpUzjOYVUTf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372828295"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="372828295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 22:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763625487"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763625487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 22:32:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 22:32:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 22:32:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 22:32:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 22:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9W8MOkO0ZOw/wr4Ta0h6Ri/D/Hw0GT7/zSPQ5CwQPoYwpYL87XPpQbePrYVN17meOOS/uWoEV495JFVf6I3JYPqlv8/ZAJtzORek6IG1z2s6tP/bxphQ7+ce6VUozhv19YcVg/5wqeTEXaAPoAtUBzj+Qa5yVNv1rB9JcrefrSEArSo9d7IvXKrPtkqcY7DdMayibMOzC6aGrxwh3u44xtsj5nENj8HqGQTs9uE8T4oKWq3Rf8NhRiU4S1pWjoozuvW549Tvpnx6M98hi2iDCKGLEOjjjqEq51ouRyfLcMtAQx2ZJVV5bBL1Jh/vTjLKjsW5E3/L2b9rgOl6HU6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZNMKkoc5JJr6Fifb04CBURNzubmucGBjVyk7/++b+4=;
 b=TNroI8lgPQxBdf/JIacmNp44MtWt0DKB5Na7Nmo8TDFqlotbvAGt+dWwo3zHTZ0GIx9p36AOBjDXFNP2Cw+TOU5BItdzYUV2lpUFCjLMuHo1au6PSbRQNLKs89MSSGyymA9Lx7XSiKXaGz6AqPXlrO0LmqZXEU/Ol+NFsQnRvN8RDPdyN3XQxzgFwLK2rQdoOjF7Mr8S2/jTvSmN7owRTV6R4lRzoxd0LuwjmJzLjhsNxn3NnXWqqM/vyKWdt2F7aNt/ESGfP4kynUi393LJWM5u/s38CLg9a7LZMriIkKxSjjNSLAYZULMiSFdtP+pjdBtnQnV0k9FMwxQDjbfbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 05:32:39 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 05:32:38 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1A=
Date: Tue, 1 Aug 2023 05:32:38 +0000
Message-ID: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
In-Reply-To: <ZMbtsY4O3Ho3B69J@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5283:EE_
x-ms-office365-filtering-correlation-id: dc8573a7-dfdf-4845-4d07-08db9250b831
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSzn+FMC36Y7l2XITCSk1m8a6Lnnrca+Xms6NtOfODL2pr9/x2bKWu/h8lNafuuQ3HB79nZNcaFMGCa+5AgWxukqybm26wePxtGEHo3aN5zsK3xUJNH5NoFMw+v/kenYuK8Yk2rkQmDMCMfPTF99V0gdDfm62DexTLoSq8fgExx9PFfDaZeJDSJgmOtq1kALlqtcmiGRtiA+OLKJ9tmffvWbK9vXonugOVNmo0PolwxSnRGM2MYLb1kIblg+0CBTVf27yrJprtyXJ29yfCTG4p1m7ox0EKYA0+ybll7Q+OdVIo2KeNAWmEQE51RqyjCRB5bHMa+ZQOoYyHVN3l9d0Ftbu1qawbtwWtPaW0BA12MyvSu16wBnbVxGtBTCcKL95+AKIx4jC0kAG1TjnseQtgQAlQ/gtJAH9bzW1SsXg1EXgnBGbwMh/P4leHv6/qCCg9a92COuSQeLAuKHy41fkr+oFpuH4HbV8ESE9xMRaD3it00+0GTVjTVLrISJynwx2sfZ+U9rW5rPlMJ2BwUfutrXptORP/1+Bs7L3R+SUTIqmj5VcfYxt1Gj0fW84ocMTjXfTaEagGlFb4Is1sPfeZh/XscEsKtwfU6Z9eb+GOszbUOB/1XPSFZVCxPyn6yY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(38100700002)(33656002)(6506007)(5660300002)(76116006)(4326008)(6916009)(66946007)(55016003)(66556008)(71200400001)(64756008)(66446008)(66476007)(82960400001)(52536014)(54906003)(9686003)(122000001)(478600001)(2906002)(8936002)(8676002)(38070700005)(41300700001)(7696005)(186003)(316002)(86362001)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nwrxgEbSIg9VqVy/ZGuYBa5c2054p+WTUVAHRHdqTtsIOS47NurLje5HUS/B?=
 =?us-ascii?Q?/l712GvXnHTkL+kHYZabpAOlHmhPFDx7uepFBg0MEkA+mcTWfh5MkLEgUUyw?=
 =?us-ascii?Q?Jf44lt7OPVDgIJ6i/Eutfbj1Mr9o006zcQoOSdWEW+4UCZMo0CPDqT3q1UjU?=
 =?us-ascii?Q?1RlLupTItVrXaQsiZdDx/ZvvsjDS9MTh1KqjjBaso18kr+P4wH9BalpN1lov?=
 =?us-ascii?Q?PkDa+0H9BX2DAkPirdrRL1meuVe2Z1sN4Lh4/0PHf/qxDEZjfqFVjcEC/nmi?=
 =?us-ascii?Q?Yi/a2GwnRAQH3ml03t/rwKOespzsB4R0VlDbI+DB3WKOK3jEkZU9IEdtx7ys?=
 =?us-ascii?Q?8pfXx/9NR6QBmkg6IYZKAyyWFXDPSGjCtBh/a+nKkkgNm+tbXdON4qLXvqnR?=
 =?us-ascii?Q?jOGL77L3effnsQWeiNOiM44izp+JCQVVLPe9+sapCblG2jobQioY3alg/kOq?=
 =?us-ascii?Q?azzNkXFSWviLyJyQkxhzxGTSU04A3NW+P0NKDyOR8N8WJBjZMGx85h9Iha+H?=
 =?us-ascii?Q?yXxxAGtFoP7nv6f5XaVrJNNsul0NaKermxlZ6FoSNXma4FTdJf5zGKrhoOEA?=
 =?us-ascii?Q?HANVsp3WpVZqdqRusIf616A22k1RgFoAGylepYEwAP20qIQV8CrwdfpHz1fO?=
 =?us-ascii?Q?PjRGHIHcn6P4aP3fDS5LqAG3uAtiIllnk+B7UsfSQWyWeSmh2HGOtjywKUJV?=
 =?us-ascii?Q?IxtdMux0iC/qaBxV+NmkRR7cTlwr6ibAvqlv9wKkKv9QG3AXosGDoe9/NSQA?=
 =?us-ascii?Q?cQrIpQH9e7pXdXQoRsWDEm0tOU2iYTOeTuHOb7yqRF9xQrbyFwv2boHu3UV+?=
 =?us-ascii?Q?Y2qDLUQJb9wrpkp6nPPepPH2qHaXVbLTi/w1F0lNOaTic1pCRYa9qGOY/Vxd?=
 =?us-ascii?Q?I2XWyae4bX+kTW1p6to/60KG7wVZ2LVcwWwPWz9cyqSUOSCtd4apbOIWvLgN?=
 =?us-ascii?Q?BEIF5sN2ljYhFzOn2O6rMYEJcVfqrw887y7Tttr6b2LmjYjy1qew48kAZNbP?=
 =?us-ascii?Q?tUBKXlXIG9kpxDBcO0hB50xtSbCnZWg+0uGya0pmzgwAyUdVt6k+P1vpVx1i?=
 =?us-ascii?Q?mpSujJAtbQ2fLdq7g32Nhy4jy02bCCxnn1LmhjHrgAt6Z6ZGCT0mVOQZDqiI?=
 =?us-ascii?Q?pUa/OxorccYTTVKp65AeDiODPmvyvhv6FMvCKAFdlMEx1RFpWA4SmqKYn5RN?=
 =?us-ascii?Q?1KZhY4S+Nxr41RqdGI53sIurwR4lezuJAGFQry9npawdKnR18yujQfRKzlBb?=
 =?us-ascii?Q?2B8ztNICInxkL2j+f3wktGuDA2Bnt6kdTRoTty1IImIFFclfb/hroIMbY/i5?=
 =?us-ascii?Q?uLcpP9nxiMKn9Y+PnCPR47VNGjOGb/fcjmlZit0UmauKLi9ob6fymR6gOw8e?=
 =?us-ascii?Q?rcNVaLnAnLolW3v97kBtgk7fn+2JS3HAk6isaSJoRz2DsbnRYMJQS2OiOEpv?=
 =?us-ascii?Q?ht1vw4OpfGaCMroE69VgJCqWHfP+fzzVPHYqWYXE0IB7RvaaDJ59M+B2Sc81?=
 =?us-ascii?Q?saA0GBB17taMKKHbzsdg3H7cr8XZVL5Y/MfXQ68+zBcCkg5fdhs2p9z3O0b+?=
 =?us-ascii?Q?3H3kC/u1m0CuVaFLlSjqKALOt65X8Ycx0i9qzc5I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8573a7-dfdf-4845-4d07-08db9250b831
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 05:32:38.8080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNolo2pck4r082cGsTYXvAgD8JjOSeLE7wyADw9Se6Q3aTFoUwt/hB60GMIEYvmNfX7sNuo1mrj2fQQ6AV+Wj8/vWDvaSeqVbXAcKjW6Zn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

>=20
> > > Later the importer decides it needs the memory again so it again asks
> > > for the dmabuf to be present, which does hmm_range_fault and gets
> > > whatever is appropriate at the time.
> > Unless I am missing something, I think just doing the above still won't=
 solve
> > the problem. Consider this sequence:
> >      write_to_memfd(addr1, size, 'a');
> >      buf =3D create_udmabuf_list(devfd, memfd, size);
> >      addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
> >      read(addr2);
> >      write_to_memfd(addr1, size, 'b');
> >      punch_hole(memfd, MEMFD_SIZE / 2);
> > -> Since we can process the invalidate at this point, as per your sugge=
stion,
> >      we can trigger dmabuf move to let the importers know that the
> dmabuf's
> >      backing memory has changed (or moved).
> >
> >      read(addr2);
> > -> Because there is a hole, we can handle the read by either providing =
the
> >      old pages or zero pages (if using hmm_range_fault()) to the
> > importers.
>=20
> You never provide the old pages. After trunctate the only correct
> value to read is zero.
>=20
> >      Maybe it is against convention, but I think it makes sense to prov=
ide old
> >      pages (that were mapped before the hole punch) because the importe=
rs
> >      have not read the data in these pages ('b' above) yet.
>=20
> Nope.
>=20
> >      And, another reason to provide old pages is because the data in
> >      these pages is shown in a window on the Host's screen so it
> >      doesn't make sense to show zero page data.
>=20
> So why did you trucate it if you want to keep the data?
>=20
>=20
> > -> write_to_memfd(addr1, size, 'c');
> >      As the hole gets refilled (with new pages) after the above write, =
AFAIU,
> we
> >      have to tell the importers again that since the backing memory has
> changed,
> >      (new pages) they need to recreate their mappings. But herein lies =
the
> problem:
> >      from inside the udmabuf driver, we cannot know when this write occ=
urs,
> so we
> >      would not be able to notify the importers of the dmabuf move.
>=20
> You get another invalidate because the memfd removes the zero pages
> that hmm_range_fault installed in the PTEs before replacing them with
> actual writable pages. Then you do the move, and another
> hmm_range_fault, and basically the whole thing over again. Except this
> time instead of returning zero pages it returns actual writable page.
Ok, when I tested earlier (by registering an invalidate callback) but witho=
ut
hmm_range_fault(), I did not find this additional invalidate getting trigge=
red.
Let me try with hmm_range_fault() and see if everything works as expected.
Thank you for your help.


Thanks,
Vivek

>=20
> Jason
