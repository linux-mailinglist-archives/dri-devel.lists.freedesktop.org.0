Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B476FA42
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961C10E24C;
	Fri,  4 Aug 2023 06:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F3010E24C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691131167; x=1722667167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Yq6LgrZRFhoHd084+EU7dOu5CdnUpJl/dp08YeOM2E=;
 b=Nyld1pbEtHR14uvHePtva9PZrNouDRAXGopYjBjzNp+mfH/G8oghODZ4
 S82wVaDR7RAE4FWU61FT0OEcA4zMB4KP+67y0ZE+l1z2aDoXTjrpPVgQv
 IPRS2e89v6cCmQLeMEDmkglU3xCWG8NKdBo6ZUm4b2cQ6ttr8MrDQY5ur
 b7QW6tMfCFjUn85hXBRghdnVul6wjeUQdhRvWtSOkwa2gZkUob3yGqonf
 ZLS3HBa+Gd74q3K/ARJ0jBAvF8WcGiWpep4GyDslAQlThhU7yGEEXJoql
 //+M53ZuFwiusu/Xqz43eXbIN4qfPwFvKkwKBl4sQfAlCULt5rgbkrHTU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373729008"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="373729008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 23:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679792869"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="679792869"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 03 Aug 2023 23:39:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 23:39:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 23:39:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 23:39:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 23:39:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE7fQGCtpiglyA95mZCjdhNX9WGPzUc6iIbHbzQPAfg1ok0W7yoE0chNk7gOgsq/sA3a1Fb/ZD37f6QH/qgvj7FS8YvgPMQQQMoMibiFHlYv7K2OPEWN8TA7LSTB8KB6JJJymNwlundnOXk8FeOJU0q/mWdTAfZ7iQULMU6GlJ5apXYl4P9JwSxjXN31hwPf3G6HiX9+/eSlk4eTVGMMQpumsNbIF+ViNrZaArvx+eLQ80hzjleM+O+gzQmmd/z6pyzTjY0Wa0wThQ6bPDBaPznTOHD6c9IAKUCLuH+2b6LMFrwvKpNlzF5+Jo+wVnjtbDSItlOXElvcyS2xXW+6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdRG47coMOMMBPf2FCrbPUrNIdjiSvG5d8gO8tU9fjk=;
 b=SgwKipoMj0Abuc9RUJL/ZLDkbxAUESMoofpDGFZylWAJJsTKaOtMDAsLfT4oO0Ow6S1/XdcAxNom6rY1gENa0av1U33MDZ5kNskZtL+pU8k/l5wuEKVays8w9LnGf/qkq0MTRjwPT1BdsmGk4Kkfd2P02GjQ3ES1r0BNNeiq5NOamgc+9HhdFNYOoP+VGbEpgwZPwu1JpINeVIJQ5KO3S019bUsMdQ2hrnR4OYZNivLyPj2+HvEYps3KSRKEIdzSoHHFLTZI2uuS2QRIeKZNv9RaPj7W5MxjmLf4x6ZbGkZrJrae8GRiCfPkRsxDeNcUGFbQ9IrWKSYhlOAU4xZdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY5PR11MB6389.namprd11.prod.outlook.com (2603:10b6:930:3a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 06:39:22 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:39:22 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@redhat.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IABSWKAgABl6ECAAEZHgIABcLAQgAD86oCAAQfUEIAEas2AgAGbU1CAANOWAIAAAN4AgAAASgCAAADJgIAAACaAgAAAiQCAAFefQIAACl6AgAICCrCAALzcgIAABQIAgADEKYCAAD264A==
Date: Fri, 4 Aug 2023 06:39:22 +0000
Message-ID: <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
In-Reply-To: <87cz0364kx.fsf@nvdebian.thelocal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY5PR11MB6389:EE_
x-ms-office365-filtering-correlation-id: d3a670e0-3ea6-4542-10c7-08db94b589cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A9NIJLEyrioglCkdj5YgxeaugOMJMCBfz41vpthTTHemev0flZVPjjLHJj4F9fS9gQPSHRByWvEPh/gGlEmrGKLxRdv30wnaWnI8MxvSt6QkXc5wt5zIyrjAPF4Q6+f0w5EKbpTOgWWDpiXuh6FYQiJv/y5Nor1ZUKL3yenJCCty+PawpXBs/w3yGT91xQJ0ifd+aZmS3BcOPf/C7SExUkY+KiiO5xLGVb/8ydxHKVy8Gp/JqTtM6bKbvZNPxnkgpN5piKRtwbjWmqyZXVzCEztJGJEQ7jXJqD2POxvr0hyO+U2kUxUz2mB7MA8POWmJHYyXRSFWInqapLEHRPjInWxL+++eW+EZN5Fsx/yzmJimahOeGjDkyxOgZG9qk9vaerfRWDiUx/bgsCqinwlDla4lR6v3MHT1KwOn6DoE+3bosRlQUP4+WUowqtlcVD+mas4nnmDadeT7PWyxX6OwNly3p6wbD4yaj0Es3NN4p5LoV9jRDj/zvRyI/cGNewncyKSbrxfUeCMsa1qCvbaNzOiMsnLYAYIXGF+tewvazZpYas9KiDWFqPJQBxwmWSd7bzAuKBKtJ5xmgvEO5bEaqZTp78XfSl9Y8YYrfvC86zQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(186006)(451199021)(1800799003)(7696005)(38070700005)(9686003)(966005)(86362001)(71200400001)(55016003)(6506007)(26005)(83380400001)(38100700002)(122000001)(82960400001)(33656002)(66556008)(66476007)(66446008)(64756008)(66946007)(4326008)(76116006)(2906002)(316002)(5660300002)(52536014)(15650500001)(41300700001)(8936002)(8676002)(478600001)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v494EVXa4bDpSrE0PQVEbLOhSob5aTiHgblCy0d+bbnsMMo6q+Z2DJdr3kB3?=
 =?us-ascii?Q?YpPMEKR0HAwPEn8hNUOC2+7FHK0qMSRXEON9PJVcapQxgP0HlbyxCUdUebpo?=
 =?us-ascii?Q?629b21mejVJXLgfXBrETtW0y+O3Si3vXi4+6wSVYy8xsNrllwFRdN1HqO/9x?=
 =?us-ascii?Q?0ADfmOgRRHDT4kZcoVUeygPr/esmRm0937bg348Fd5uk08JQpHSq3CiygYku?=
 =?us-ascii?Q?zHLKqC6HkqwWrKycPLAfbSuYSj6/DCArJY97PtAjkI8bM90jnyw1DB06ZO+l?=
 =?us-ascii?Q?S2LEYWJROQUr89Mj+CjKO1gS0+1gNe0j4Cwbfsrn8S7K2IuErhWpzFHB8F3i?=
 =?us-ascii?Q?q+tS7kpD8tsISslEqf1uR83UWykmYgR6S15POeiDxE+hkdxinH/rWGHgA4Xu?=
 =?us-ascii?Q?YR6JzrQOAA/u6SIcIhPoB4to9XIiJbS5LuJoh+ZqVS6St+1vC9MSymRP+qiI?=
 =?us-ascii?Q?ZlnbcBx/vRc6OqpMX1XGxDjMnBup9gSpJ5ugDUHCqpMX/PjEDXmT4huq8SVS?=
 =?us-ascii?Q?RQjhi+h7+eLG19mp0OtZdDSY5haydDACHUn+fMcwiSZli3g7zmpv8qzgVpPD?=
 =?us-ascii?Q?iZC1X1fBR6lqiKH6TMa7KArYDa40AAVj5FEpp2xGNNvQAbON5OeICe32FVQb?=
 =?us-ascii?Q?KQ0K53JELuwA0BE0Nt2AVBkcvoUnQMn6oSAbASOBo0d0yeBzXjRceXzWL3g6?=
 =?us-ascii?Q?0iZTLxHGLXJ22p2U8FVZuW82eM3ucwICXb92QklinBcKY9SfknYbrCfxTN8w?=
 =?us-ascii?Q?E1yEPNG9SAfLGR4xMUzWD/C79s11JE1ciDnE/IgFZbYDacAUL9nIPpLgk7h5?=
 =?us-ascii?Q?ImPZ16PriH5mJQpkBYzoSZZbDA4/IQRYuBeQN3Q2I/yLnLRGJ1h+z6Y7F5Ro?=
 =?us-ascii?Q?MrGk8LRWzLKJl/r9ed+4mJhzAFFA7ij/OOo+rdvpi5zjxJcCgv7EtVKYnE/F?=
 =?us-ascii?Q?YqjSMB7RmVZiEDBpFXztM2tDJz26ZcGiCa8oFq5oS5fgBEjWLxM2lwxTy+2l?=
 =?us-ascii?Q?oXfN05Rak56U0/W+SK0y9Knmm04I+n6kRDgSKb2TXWhRtod6nQh7KZxel5sP?=
 =?us-ascii?Q?Z2+YzkRvMK+biKWCHZNKwMA7yLRDFV9d3ZFUI/M4HZl9Ixuz5Zy8i80JrV+Y?=
 =?us-ascii?Q?BvGFQn05KTuqZbkb1rYrWAkzFrukYMyhrTPCfh+D3uCvXqz4UqBmslyJO6Ya?=
 =?us-ascii?Q?mo95q+5zo3v1kqnHPVcAksf0feuU0siYrFtqNlNm0WW82cZBkx31brNhl4nP?=
 =?us-ascii?Q?/xvHL0Rm8IY1+qV5qYhDLzR4j55UTXeitt1hQcc/6jrM1YArlKgSs31eX+mJ?=
 =?us-ascii?Q?ASZiNwJ6n3YSaKkA0g/9Jcv8DW3vJUL7WdoEEHyjftfTx3AemO90wqTj0jDg?=
 =?us-ascii?Q?z32/J3AbSt6uOGwEVnBwQA+fZB4OpdBYQVJV9vf8JjvVh2SrjjDI6nm0bNYy?=
 =?us-ascii?Q?qj8QV2BLAmIXG3ubb1fY6G7sOd9QD/FeqiMgq9xloMN6pL4LPcEwLds4bDDq?=
 =?us-ascii?Q?MkmEI2cqLZAJUSnMRGJnZvNLnYsVgPcGZ59ghhdXEbU73pMg/7p8fo7Z33Qs?=
 =?us-ascii?Q?1Z89FygKbuNhRB4CPtzWOBpXu5aXs/IIvtkNlBks?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a670e0-3ea6-4542-10c7-08db94b589cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 06:39:22.4429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWQsbwH/rw25k6v8BVCMzyn83Se+wowX7tA76ro0F4xXzGzpWMVYePgM1EiuY+9wJEBx2jMPY3BNuU6+y2HKmAlRZP0Fh1/3sMX5WWeUZ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6389
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair, David, Jason,

> >>>>>> Right, the "the zero pages are changed into writable pages" in you=
r
> >>>>>> above comment just might not apply, because there won't be any
> page
> >>>>>> replacement (hopefully :) ).
> >>>>
> >>>>> If the page replacement does not happen when there are new writes
> to the
> >>>>> area where the hole previously existed, then would we still get an
> >>>> invalidate
> >>>>> when this happens? Is there any other way to get notified when the
> zeroed
> >>>>> page is written to if the invalidate does not get triggered?
> >>>>
> >>>> What David is saying is that memfd does not use the zero page
> >>>> optimization for hole punches. Any access to the memory, including
> >>>> read-only access through hmm_range_fault() will allocate unique
> >>>> pages. Since there is no zero page and no zero-page replacement ther=
e
> >>>> is no issue with invalidations.
> >>
> >>> It looks like even with hmm_range_fault(), the invalidate does not ge=
t
> >>> triggered when the hole is refilled with new pages because of writes.
> >>> This is probably because hmm_range_fault() does not fault in any page=
s
> >>> that get invalidated later when writes occur.
> >> hmm_range_fault() returns the current content of the VMAs, or it
> >> faults. If it returns pages then it came from one of these two places.
> >> If your VMA is incoherent with what you are doing then you have
> >> bigger
> >> problems, or maybe you found a bug.
>=20
> Note it will only fault in pages if HMM_PFN_REQ_FAULT is specified. You
> are setting that however you aren't setting HMM_PFN_REQ_WRITE which is
> what would trigger a fault to bring in the new pages. Does setting that
> fix the issue you are seeing?
No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
Although, I do not have THP enabled (or built-in), shmem does not evict
the pages after hole punch as noted in the comment in shmem_fallocate():
                if ((u64)unmap_end > (u64)unmap_start)
                        unmap_mapping_range(mapping, unmap_start,
                                            1 + unmap_end - unmap_start, 0)=
;
                shmem_truncate_range(inode, offset, offset + len - 1);
                /* No need to unmap again: hole-punching leaves COWed pages=
 */

As a result, the pfn is still valid and the pte is pte_present() and pte_wr=
ite().
This is the reason why adding in HMM_PFN_REQ_WRITE does not help;
because, it fails the below condition in hmm_pte_need_fault():
        if ((pfn_req_flags & HMM_PFN_REQ_WRITE) &&
            !(cpu_flags & HMM_PFN_WRITE))
                return HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT;

If I force it to read-fault or write-fault (by hacking hmm_pte_need_fault()=
),
it gets indefinitely stuck in the do while loop in hmm_range_fault().
AFAIU, unless there is a way to fault-in zero pages (or any scratch pages)
after hole punch that get invalidated because of writes, I do not see how
using hmm_range_fault() can help with my use-case.=20

Thanks,
Vivek

>=20
> >>> The above log messages are seen immediately after the hole is punched=
.
> As
> >>> you can see, hmm_range_fault() returns the pfns of old pages and not
> zero
> >>> pages. And, I see the below messages (with patch #2 in this series
> applied)
> >>> as the hole is refilled after writes:
> >> I don't know what you are doing, but it is something wrong or you've
> >> found a bug in the memfds.
> >
> >
> > Maybe THP is involved? I recently had to dig that out for an internal
> > discussion:
> >
> > "Currently when truncating shmem file, if the range is partial of THP
> > (start or end is in the middle of THP), the pages actually will just ge=
t
> > cleared rather than being freed unless the range cover the whole THP.
> > Even though all the subpages are truncated (randomly or sequentially),
> > the THP may still be kept in page cache.  This might be fine for some
> > usecases which prefer preserving THP."
> >
> > My recollection is that this behavior was never changed.
> >
> > https://lore.kernel.org/all/1575420174-19171-1-git-send-email-
> yang.shi@linux.alibaba.com/

