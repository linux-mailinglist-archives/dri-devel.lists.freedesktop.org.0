Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB276E19F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD05F10E5B1;
	Thu,  3 Aug 2023 07:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038B10E5B1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691048165; x=1722584165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TBl73c1VR5ulZXRo/UvQEKHXZY4w1DNOvVnT3JXxnog=;
 b=NxJR2nTdBoNAvfnEAbOtQYUWYXvRCW0A62r25UHEffXYZF5m1lNlPQyf
 BRNNfnURNxbW1+XPOdxT+GBsWj3Aj+U0/lMiUHZp6iE2VOGU/b77MwHDV
 6tma0BaiT4DabNF90tM225hbhDwjslkZXo92GfyA0w42SdPFaNb/hJTL7
 fQRHXJtKLxDVItCyyK8Bx1RiUbU2zzysmBF2HGmJPh45Cdz9cYXr4Gr8r
 39SZj7jsKQXO7ZO4ykrkGV7xKzh10jESMxeu2Fb8BGHaKRTqfIZJj9oZt
 W1SezkiTXPamGMejLfkQpFmf3TyA/g6LBGwCArs47n6KdVMIZIZhtmtuF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350089793"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="350089793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 00:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="819537771"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="819537771"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 00:36:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 00:35:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 00:35:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 00:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxpM9E2XbFmdCWV664hiLKgmvO7Z4mZWH5C2Nblnh/A28wENiDcbXuPMdj3/83m/m+wKyQdBjTjVohMbj8FNIRh8YoESWSUyzZNS20/m8gmcHKvdPJchRduRq2/6RjSJkT4U7SkB60u3+XMPbV2T9sE0/XBf0QFJYanoif7Jg2FFVewWJXXH+iXkP62SfrQLoU3PoSbDep/5nEy6255N4JStnm9MH16jX6e4M1PETrWvGMHHWqafJw18FczJhDId5KpTj7LJUV06/aAmspMSKS/VWeMoEzaaSv0j2QnKdzEbsTYDO9DDn/R95qpNMCAmVgxqNvqdbApHJpQS2Y+yjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IUG26na0WVBpMlxxm0q5Y3YXBZqJPGy6vGGZ/PYnGw=;
 b=ZuVa0k3+mCKUoU/vTIBrX4tT3oAIfW7ZtPQUTt1K/qr9Mnt2cjmAtBRTXquOiSXeXnIz3sxivbY9vxxPyAG/Kd6Uu2wAE3M9qMMavKy0YEer9weduku5wnxuDkGPF9FgDq21EaeSDx6Ut11vFPIHuJGsGw8zn1xFsHOBGx4SkSrYbycLWr7whKpGQ1M6zo40euZrKPl8UYd6UwVgQB7Qg3wo8gqgoJFaw8Lav2yQZbr3eC5y/AA3LAxXn73DC4xNovaEJx7GjknCYHV5FYVCVDaOBvC5fKSqRI+kHrlbTonzCz5djU1e9Sp8Q4EV9S9tSGKeL0gkEXRgqQovwbfdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47; Thu, 3 Aug 2023 07:35:52 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 07:35:52 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrA=
Date: Thu, 3 Aug 2023 07:35:51 +0000
Message-ID: <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
In-Reply-To: <ZMlMoRIkPoO0gG3B@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB6398:EE_
x-ms-office365-filtering-correlation-id: 41d9bc47-54ac-4d06-140d-08db93f4439c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LxCDJFlvGTKoPYxWERs9IKY/iScA+3gIVAHlnicUel0j469wTazsLOVc8Fxorwgehf6i6O4TT/acy/zyvkaEpmkW1pIE/gC2wRm2SfsY3N5gwK7TlRzbOfHOy00ez+qwINPGif+ePV9fPwpewOHiV++BnPyH3+o0I6XUkPyIb4IK4b0BeohEDgt+AnUVm60t+OBRljNq294A3X59XbXy/X6AJXlNHTYikLMU9GmDEiF1QyXuxF5Ruk48PWz36irwW90AJ2ZXaLj4wBDeowTYl+fdwe3H0T+Hh3KNyrcewlBIyg7aeSGVW7gn7QoFn5ru+lZ9fDbJ90Koby52dhrpcC/5imuzxzh+BM2n2uTozEnHjhaZHLJQnTjDLifAAhIkMOR/Ht9eaSlz41tBjAygLo39BcwVxLesm1U6+z0gwQvOTrFPHTilc0+Z00yd6g7UZUc8yx9axvw8OrkqQPjS9aYQ2VVH1AfrNHOoN/KxvuMnPQehhQomIEr6FfR/yR1TcPLAgyqHmWmjikYB69PAPvPB07jCW5zi3MQx+b8gl2gxg8BOrq/l+gwgkqxN7YsbS7s/hXwOT/mVynqaif+sA9opXT2tLjDuasYrpBWSVRFjMUQzn5GbCv1UHRG65Bj7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(38070700005)(33656002)(86362001)(55016003)(54906003)(478600001)(38100700002)(82960400001)(122000001)(186003)(26005)(83380400001)(6506007)(41300700001)(15650500001)(8676002)(8936002)(9686003)(52536014)(71200400001)(7696005)(316002)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(4326008)(76116006)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gqvr0AVkFubaex/8xGuaE2mFjF0H2J2OXkRBI8tEPm6CbShcfUkXyAftIOQc?=
 =?us-ascii?Q?xMaO0jJWmw5r1hfPKe49bo7FXY2iersPHA/NIQPguKgHI5UlCwDD9J9q5Wqr?=
 =?us-ascii?Q?bFoRpFYqBhs9t13JU8K6GDkjpC608Hq9OfiKuofHQ7bY1OMNGEvqx1TWEGtl?=
 =?us-ascii?Q?ZJUe5jcJtqcxyWkZHO2drepCcl29XKKclW/4LDL6JdQph7hRGoJYz7ZaUf1x?=
 =?us-ascii?Q?vDyyRFLbKGULMGdq6yLgeyYcpIz5qEpg5qPywWyY0b1K1TalNZ/2T8Ar//iW?=
 =?us-ascii?Q?ezGOnvQmJqQ2s7R0gWahszXIV5vqgoYa5EPwa15EO4EsyyT+1AbWmeXiBC4N?=
 =?us-ascii?Q?NVv9im+7xYCOZAW4QsAxE2xQcaPFUSYDMzLRGdib5XRL0/2YWWI6Y2d/ni4Z?=
 =?us-ascii?Q?Z9aJKxyxx+ZCHjgJcik/W905PyvIsnsib8irh8smCBW5A7OFkDBIur0SOJem?=
 =?us-ascii?Q?mJ5vtw7riWgSu7APsBGQOnzm803gOKVuIVADXQ6yhgRYUQ8o5SxbstZa/WpH?=
 =?us-ascii?Q?XS2UQTWDUT2nvSUtgqwfZevgqVg24mkOA88Kd5BGDKubSW+nXLX57pOsft2V?=
 =?us-ascii?Q?V42ivHc6t77tzTznnZ2eAhJr4d/XxGP6ltlM9QL2cuC23oCwKxMDvZn5pE7m?=
 =?us-ascii?Q?93IAHVlym0QXTAxD0yIHgPN9YAN3hzHTBJR6t+hW/GRxyrHWj4vowptZBH8R?=
 =?us-ascii?Q?SjpePRnUatXaBlH6AahDXdVakgwC+zKuMtA2Tv+OskSmY4ep3idoASzJkB3X?=
 =?us-ascii?Q?Qc4vAKd73fcTfxaGLjWZHIGPfulauLFu0VeZVz13PikOQBJlRoIil1htiOWL?=
 =?us-ascii?Q?Ly4xZJUGJCWT6f7llb6yJd0dFX1LhB4xaHTgk+zTjZSP8tFuw1cHyVK2Z4zC?=
 =?us-ascii?Q?engJUCDj9M181kHOPFyE1t0W2ZKPBwGZaw1THN5feAYjn9udjDt6BVTHMBQd?=
 =?us-ascii?Q?fpjQ5foH50XuyKkZlV8PTeFs4vl4JRVac2Qo2ittBGOcClIMMH5u0NE7uoSx?=
 =?us-ascii?Q?EXakbRy4IwBmZtTQxCWjXRA1lCjLDM5tMeTs/6sOUQYhn5Z/C6Vc8jbVbL8v?=
 =?us-ascii?Q?WgxrnDcRs+p8+96AkCC8FHwK+xWoXQhw5FCjndCknkqH5Y9dnEPBcGG3scX2?=
 =?us-ascii?Q?Bz/xogG5XZ0yBWDtRghPKVHQmsOah2pTre3lNnKEc07HR68ImWfiKWITuhCh?=
 =?us-ascii?Q?HxtrJNr3+H1cqTSGCREeBBvzixRlYzXNhKGSE7Kih06t8ERrcFLIgaqoO41e?=
 =?us-ascii?Q?EiAvzEYuTGva8KHtxfN6dlRQ3Nu5OW94FOQvyPpdnb6VUPcB5V5jTqWX5zza?=
 =?us-ascii?Q?OxQKRWwn3iL8sBU/pyvOZcM58/pyNu00o84RQbvT6DNdzIqfr32Ov6jn6dN9?=
 =?us-ascii?Q?FZqEvp0mIvZONefZUuFp88ho0seqc4pIrSGIlfWo274smvmdUvTLtQo99FtQ?=
 =?us-ascii?Q?q+to7K/sKK02uDPF1nnKwHCFYa68PgndMIsvgY9eUR5LnZwnfagN3gvVj3Dc?=
 =?us-ascii?Q?IRIUw43bD08cjN9hRUKaf6vW2C+1/ZM7w9+sLxcj1i4OK4zQgJgJFkjRsFhI?=
 =?us-ascii?Q?SjTJ+snz57AZwdK5T8vz4NBO6hXC1ggCoQwq7yMI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d9bc47-54ac-4d06-140d-08db93f4439c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 07:35:51.8268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8AsKzDaWaxHZHXWHg7tVQ7kCkn26DalPIpqGNNAk0wdFyRPyasiBeWS/PKIUWFWeiXq3kphEeWHzzfqdfYmBmkDGUshraeKfWXudXnq5nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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

> > > Right, the "the zero pages are changed into writable pages" in your
> > > above comment just might not apply, because there won't be any page
> > > replacement (hopefully :) ).
>=20
> > If the page replacement does not happen when there are new writes to th=
e
> > area where the hole previously existed, then would we still get an
> invalidate
> > when this happens? Is there any other way to get notified when the zero=
ed
> > page is written to if the invalidate does not get triggered?
>=20
> What David is saying is that memfd does not use the zero page
> optimization for hole punches. Any access to the memory, including
> read-only access through hmm_range_fault() will allocate unique
> pages. Since there is no zero page and no zero-page replacement there
> is no issue with invalidations.
It looks like even with hmm_range_fault(), the invalidate does not get
triggered when the hole is refilled with new pages because of writes.
This is probably because hmm_range_fault() does not fault in any pages
that get invalidated later when writes occur. Not sure if there is a way to
request it to fill a hole with zero pages. Here is what I have in the
invalidate callback (added on top of this series):
static bool invalidate_udmabuf(struct mmu_interval_notifier *mn,
                               const struct mmu_notifier_range *range_mn,
                               unsigned long cur_seq)
{
        struct udmabuf_vma_range *range =3D
                        container_of(mn, struct udmabuf_vma_range, range_mn=
);
        struct udmabuf *ubuf =3D range->ubuf;
        struct hmm_range hrange =3D {0};
        unsigned long *pfns, num_pages, timeout;
        int i, ret;

        printk("invalidate; start =3D %lu, end =3D %lu\n",
               range->start, range->end);

        hrange.notifier =3D mn;
        hrange.default_flags =3D HMM_PFN_REQ_FAULT;
        hrange.start =3D max(range_mn->start, range->start);
        hrange.end =3D min(range_mn->end, range->end);
        num_pages =3D (hrange.end - hrange.start) >> PAGE_SHIFT;

        pfns =3D kmalloc_array(num_pages, sizeof(*pfns), GFP_KERNEL);
        if (!pfns)
                return true;

        printk("invalidate; num pages =3D %lu\n", num_pages);

        hrange.hmm_pfns =3D pfns;
        timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
        do {
                hrange.notifier_seq =3D mmu_interval_read_begin(mn);

                mmap_read_lock(ubuf->vmm_mm);
                ret =3D hmm_range_fault(&hrange);
                mmap_read_unlock(ubuf->vmm_mm);
                if (ret) {
                        if (ret =3D=3D -EBUSY && !time_after(jiffies, timeo=
ut))
                                continue;
                        break;
                }

                if (mmu_interval_read_retry(mn, hrange.notifier_seq))
                        continue;
        } while (ret);

        if (!ret) {
                for (i =3D 0; i < num_pages; i++) {
                        printk("hmm returned page =3D %p; pfn =3D %lu\n",
                               hmm_pfn_to_page(pfns[i]),
                               pfns[i] & ~HMM_PFN_FLAGS);
                }
        }
        return true;
}

static const struct mmu_interval_notifier_ops udmabuf_invalidate_ops =3D {
        .invalidate =3D invalidate_udmabuf,
};

Here are the log messages I see when I run the udmabuf (shmem-based) selfte=
st:
[  132.662863] invalidate; start =3D 140737347612672, end =3D 1407373476290=
56
[  132.672953] invalidate; num pages =3D 4
[  132.676690] hmm returned page =3D 000000000483755d; pfn =3D 2595360
[  132.682676] hmm returned page =3D 00000000d5a87cc6; pfn =3D 2588133
[  132.688651] hmm returned page =3D 00000000f9eb8d20; pfn =3D 2673429
[  132.694629] hmm returned page =3D 000000005b44da27; pfn =3D 2588481
[  132.700605] invalidate; start =3D 140737348661248, end =3D 1407373486776=
32
[  132.710672] invalidate; num pages =3D 4
[  132.714412] hmm returned page =3D 0000000002867206; pfn =3D 2680737
[  132.720394] hmm returned page =3D 00000000778a48f0; pfn =3D 2680738
[  132.726366] hmm returned page =3D 00000000d8adf162; pfn =3D 2680739
[  132.732350] hmm returned page =3D 00000000671769ff; pfn =3D 2680740

The above log messages are seen immediately after the hole is punched. As
you can see, hmm_range_fault() returns the pfns of old pages and not zero
pages. And, I see the below messages (with patch #2 in this series applied)
as the hole is refilled after writes:
[  160.279227] udpate mapping; old page =3D 000000000483755d; pfn =3D 25953=
60
[  160.285809] update mapping; new page =3D 00000000080e9595; pfn =3D 26809=
91
[  160.292402] udpate mapping; old page =3D 00000000d5a87cc6; pfn =3D 25881=
33
[  160.298979] update mapping; new page =3D 000000000483755d; pfn =3D 25953=
60
[  160.305574] udpate mapping; old page =3D 00000000f9eb8d20; pfn =3D 26734=
29
[  160.312154] update mapping; new page =3D 00000000d5a87cc6; pfn =3D 25881=
33
[  160.318744] udpate mapping; old page =3D 000000005b44da27; pfn =3D 25884=
81
[  160.325320] update mapping; new page =3D 00000000f9eb8d20; pfn =3D 26734=
29
[  160.333022] udpate mapping; old page =3D 0000000002867206; pfn =3D 26807=
37
[  160.339603] update mapping; new page =3D 000000003e2e9628; pfn =3D 26747=
03
[  160.346201] udpate mapping; old page =3D 00000000778a48f0; pfn =3D 26807=
38
[  160.352789] update mapping; new page =3D 0000000002867206; pfn =3D 26807=
37
[  160.359394] udpate mapping; old page =3D 00000000d8adf162; pfn =3D 26807=
39
[  160.365966] update mapping; new page =3D 00000000778a48f0; pfn =3D 26807=
38
[  160.372552] udpate mapping; old page =3D 00000000671769ff; pfn =3D 26807=
40
[  160.379131] update mapping; new page =3D 00000000d8adf162; pfn =3D 26807=
39

FYI, I ran this experiment with the kernel (6.5.0 RC1) from drm-tip.

Thanks,
Vivek

>=20
> Jason

