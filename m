Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA9783969
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 07:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4610E2D9;
	Tue, 22 Aug 2023 05:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3310E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692682637; x=1724218637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MnAezWjRfAwgQvJUysXouRA+2YzjDeeBgbTUlFxnhuc=;
 b=mBL/p9H2VAOBBdEFDnwCpqlcN3g5gDlE7D7W0urGVB/n+7C8gShOcWKE
 3g6VdEiH72P/ufbJhgSvFz6CAtVIir1XwKhfzC71jMB2o4Y6YAI9P2s1b
 /huhMCSnnOb3BmbJ7r/29KlKrnmJXAUuzb7CL2lLWwVJNPxnh2GVFOWfZ
 1CusOvEiOXJGuweifJd5lnJdRiT7mRsUJ/4iwEVb2QqJrItj9q7jSf2SU
 RC8NQey9eiTfrgrGd//Pyab8Yu76BitkRZYexWUxUaVQozrSab2iuSY00
 RZXbiyD0vFXzKdgGlElJv/EmU+bq66CPc54OJlhb331NwD2qAftuu2lWe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377540079"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="377540079"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="879802197"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 22:37:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:37:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:37:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:37:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:37:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5jJ3L/JCZrELy1KefWMG4gUgrfBC1y6FzNxlfcdAiVXJ0eQdvKfANyK7xlROs+LiIf5CXuyhaUN+Yc81VxB5QPPvCK1ZK3xuOxF677vg8EmDpQjVFWM1t44OBmeVPMjQfHhZuPHvV/L9pVk08OINeSjpEKamYnkh9hBnpz81ZCe6uD8hnet2T97x2Bwe9cOHYNBonw5OCG0pRbGXPNzf9OTiSD/2TdV25bBfnG8FCYi+XdRW0V1nvMFn4ozrJO7IV8WwHZVoMK6v8V8Ud/JAgcupb6D+Zu57kMx3cbI1uHUV7FD3bl1e4BtJ6MIZh/jmW8pWQqBcn4qFOCUQKGj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9k370aUebo0MADTrx0FQZzEmHGaqCeDgu+N78Rq1ew=;
 b=mOBxFDCLDxK+nlwkayoC2IKb1Eua97mbMpfe4bdQPPjpHV4BpZ08/AD15+5Zi8Md1BKgD7dWnjijL/16vzZLjY17hUeD6qac0L7hXaWuqN5pFlBDG6iGrh74Fyx4bHjMxbil5UrUvHge8jYuAvx3kyANNPzVFyF4IpJ3trQrkLVUln2XxgwFTXgponB2xEPWyvpkd+SN4t/REAbRvHUJ4T3WTf1o6o1702lMEtvLnvEidUoDe4lmRj6l3k7g+fSNgMARtziVdI7XoPfDq5PJohL0st5djXfNbyWKNNC1mccjfFL5DMv7Y+RnzL5Yjs4ae3CSOVwraHdqUtCuDvwPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 05:36:58 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 05:36:57 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Topic: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Index: AQHZ0Nnu32u80K2Na0Cg35Cfz1LQWK/ulcwAgABFA3A=
Date: Tue, 22 Aug 2023 05:36:56 +0000
Message-ID: <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
In-Reply-To: <ZN42XjuXUyma5uE+@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB6422:EE_
x-ms-office365-filtering-correlation-id: 3d920b71-16bb-4dec-d663-08dba2d1ccb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zo8WApZSnZ2lx5zRJkRuAA8+HHgCtZUBE/rgpcBVYWGYlOtR8uksMQ6VgDMMEom8SYigBW3ud1cGhACxqFQTtoPqt19P2xzopdA/K8miCpT6oh7XKSYaLTv7Ll8xxGr0E9xZhxLlsl//gK1Znz1HAKa9uu3Dp3f8yAmHt3yy4IyTq6olCwuZDUIg248X/5Z00V6y6K6mYTJZBi7emrC6UBhYF4z278rV9eC/ZTWT2/6GRcrlmb2efIP771NNjS6RpP3I34l/Ls1GG4Hw1kRNMT6wFeLGUINvJ5rplDMQLFjaiBReGycR8yimvyokWlnoKIq5UYfTxN5EV0YekJ1yggG0sOEsluG8VDWXAiPgkL4PV2JHY1w44PeZt7PguLsPjT1lmeOeTruUkuuVIOf1li67GDEK5c5xMQQ5Dfrf//hEMpZd+gtNaO+JkmwXn3UP+9mwFAe0Jk8hGESXsYdTffTDoWgNuDcqDdY74QHv134XPzy51rJgLNMbc3sx+ugBX4k76q7YmfsKlEyyaexgY6q48J0dpCFqTbYUuE5N5ftJ0gyGF+8xoF9SMMVn0bP+ftgMuZxOFScQk+7r+jGLN4oUeUZlMy2KY62HRbGa/smYT2M2Xwo//YayJLAljFN/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(54906003)(6916009)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(9686003)(66899024)(82960400001)(8676002)(8936002)(107886003)(4326008)(41300700001)(122000001)(478600001)(55016003)(71200400001)(38070700005)(38100700002)(6506007)(83380400001)(2906002)(86362001)(7696005)(5660300002)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j1v4UqyflP0VUuO52580G82/fv9RvTT0kK5vTm/vwXY2LciLA0Uwf0s0BHNH?=
 =?us-ascii?Q?isJDz92yL5M4dJs9kHo/0cwKRH/mcIvoGYXbcFCUgZF42F9PbMunbeo+0C6O?=
 =?us-ascii?Q?JvMKmI4Dfbh1+QYv6nTUqpjnHE6vKdg2mEv/aPtU5d4ZtrrcAGAhD+y/H5xI?=
 =?us-ascii?Q?MOqjC/1qzs0NYbCfJxVbbtd+5DkqBhq0YSvMQiqHFmvA2oEtaJgI3rKsazHS?=
 =?us-ascii?Q?DyTpHH6OwL3rQmstRGXW0E1UqcLBlpwnVMC/ctGo3xxninbUx4kFRhJkITJL?=
 =?us-ascii?Q?X5vrHN4y1buhQ8U56Ww75/MOv/RtVaxVW7ggCvPGi6sz18iwbgWMnEFvMUc6?=
 =?us-ascii?Q?shONnTLe0rujNj7SmCeofgYyaeE5uuFYo2XGverjGBV73Z/+O206Y2NjW2XA?=
 =?us-ascii?Q?6PSVb6JTqGEuaYc63aHwPf5T4LVjRHTMvPMpZTbnziO/aYp5VWp7J53v8D6z?=
 =?us-ascii?Q?W2nTn7o3GxM1jbW0NXzyfjosDaW8lPvLuDUpJnMUT9k7s64D3uml9Z9knfcD?=
 =?us-ascii?Q?erADMUX70UtFDK3sLbffe8UkIo9hQsIzrXCDJkrZ/zAVaciWykqK0A1VPpUS?=
 =?us-ascii?Q?+oSCgknZ8pUgO8y49YKreBvnkhzQYxPQA1ygLFKqYbFKdlenLJ3WxsquOYMJ?=
 =?us-ascii?Q?2fR89/HR4cuZjF+1mzTYqE5inffyFpvw0SW0BYIfF3GRpuw2EhGfMVu+aqLM?=
 =?us-ascii?Q?fRy0PfsDawLOh3pkLTduzxAy2qG6Po0bYjQcEI76BsNx6tuYQcETYvIg+5wW?=
 =?us-ascii?Q?GwBcQA9ixpEy2/9wweBqPPjpO8KVs8phLRlzg20w9ieFDsggYPt8Y1W1Rqa5?=
 =?us-ascii?Q?5eI3PyxqfVdvG6PIE52yNTKW+tLbrrBCtzasS52wGc1rQCPcAdo9H6aeMPu7?=
 =?us-ascii?Q?pD7SSIhpMx3kP/Pd0N6lcxRPDutz6Yx3PlUAJEYPxEZQBWPlg7zq3X2qzWrJ?=
 =?us-ascii?Q?oBcJrIHekqrr8R1RH6cIRGgYH4780uE8ty6UnfWBvWc8fNLdzG+bEreaAQJ8?=
 =?us-ascii?Q?y/vVCB+BJzpyW062Fq74VT6Yp1sMu9ITsPk6G8WZKZP57HqPQtOcSLWLt8Kk?=
 =?us-ascii?Q?OckgR2hQ3w9kUOnQrZGyhVwNsf8fyLAd4iB4kz3kGT4WUh6OiyDIOr4HOojL?=
 =?us-ascii?Q?Nno+c5kDz806UzWGZzJMJ1DfRhLDF3CdcqBT7pMJQmPy4+tqmZ4FH9kqdt7L?=
 =?us-ascii?Q?lFz49OqoQ8PHtpygmzK5YQET9k0VkSKxSN0AIlqlUZ7tvWgmmOFDH9eRlXUr?=
 =?us-ascii?Q?vu0LA7YYLEk+lKU78oKyv7qcnv1AHjLNyLuF8NwNh1HK56rvZuCCC2uX/Air?=
 =?us-ascii?Q?W6zvhPo/VJvSFHG+Veq1V63yYOXHgik8+Xbb9ixcJMKvljQfEgSZwjaWiLt5?=
 =?us-ascii?Q?neiC6CtjSxGgr8BpyJgNtvlvWcPreNC/a5M1ExRJTaKq2uvTR3E1bJHFhOTO?=
 =?us-ascii?Q?tDOBZ8EC9pfbyJY+wB7s2FlFXmXaJk93TWqHRS1qvj+asmrwkDxFvbFGL/NF?=
 =?us-ascii?Q?JaaY62LqR04yaJSkJi6/JKpqMvs+P7Tvwt2p3G4Eo/9HWTxEqSFsyLJ9h2rU?=
 =?us-ascii?Q?g2i1cghYzIahTbtyHiaOZlufgiAJT4MVB0CiTDtF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d920b71-16bb-4dec-d663-08dba2d1ccb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 05:36:56.9212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PMQrcPbrX0X/2NP6sTtCqksiYBu3q1EeaPH2gDyzIn2X2W/MXGSy0sj5RxedeCOJV9pY4hT2bi33bETB59BAVF3/kDIR9MpTW+Jguxx4lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

> > This patch series adds support for migrating pages associated with
> > a udmabuf out of the movable zone or CMA to avoid breaking features
> > such as memory hotunplug.
> >
> > The first patch exports check_and_migrate_movable_pages() function
> > out of GUP so that the udmabuf driver can leverage it for page
> > migration that is done as part of the second patch. The last patch
> > adds two new udmabuf selftests to verify data coherency after
> > page migration.
>=20
> Please don't do this. If you want to do what GUP does then call
> GUP. udmabuf is not so special that it needs to open code its own
> weird version of it.
We can't call GUP directly as explained in the first patch of this series:
"For drivers that would like to migrate pages out of the movable
zone (or CMA) in order to pin them (longterm) for DMA, using
check_and_migrate_movable_pages() directly provides a convenient
option instead of duplicating similar checks (e.g, checking
the folios for zone, hugetlb, etc) and calling migrate_pages()
directly.

Ideally, a driver is expected to call pin_user_pages(FOLL_LONGTERM)
to migrate and pin the pages for longterm DMA but there are
situations where the GUP APIs cannot be used directly for
various reasons (e.g, when the VMA or start addr cannot be
easily determined but the relevant pages are available)."

Given the current (model and) UAPI (udmabuf_create), the userspace
only shares (memfd, offset, size) values that we use to find the=20
relevant pages and pin them (by doing get_page()). Since the goal
is to also migrate these pages, I think we have the following options:
- Leverage check_and_migrate_movable_pages(); but this function
  needs to be exported from GUP.

- Iterate over all the pages (in udmabuf) to check for folio_is_longterm_pi=
nnable()
  and call migrate_pages() eventually. This requires changes only to
  the udmabuf driver but we'd be duplicating much of the functionality
  provided by check_and_migrate_movable_pages().

- Call pin_user_pages_fast(FOLL_LONGTERM) from udmabuf driver. In
  order to do this, we have to first unpin all pages and iterate over all
  the VMAs of the VMM to identify the Guest RAM VMA and then use
  page_address_in_vma() to find the start addr of the ranges and then
  call GUP. Although this approach is feasible, it feels a bit convoluted.

- Add a new udmabuf UAPI to have userspace share (start addr, len) values
  so that the udmabuf driver can directly call GUP APIs. But this means all
  the current users of udmabuf such as Qemu, CrosVM, etc, need to be
  updated to use the new UAPI.=20

- Add a new API to the backing store/allocator to longterm-pin the page.
  For example, something along the lines of shmem_pin_mapping_page_longterm=
()
  for shmem as suggested by Daniel. A similar one needs to be added for
  hugetlbfs as well.

Among these options, the first one seems very reasonable to me.

Thanks,
Vivek

>=20
> Jason
