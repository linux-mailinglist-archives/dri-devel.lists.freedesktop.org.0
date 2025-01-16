Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE9A132E3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 06:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E3E10E1CE;
	Thu, 16 Jan 2025 05:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9n7NF3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49E210E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737007127; x=1768543127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xQaYDVB47u2jat6WJ5AqHmbI5tDO4BmXKFNbKA0DSOM=;
 b=a9n7NF3YudQnB6Y4zIVZgfRj4Myxs5GWAk1bktoT87l4GhhV7Bj6zYuy
 f6YnxltTtHXVg98pNhtKPewNYTtKSjc0HMH8rxDaCk8xI3pDTvKzOHXYm
 NR/szHld0Nxb5VAcSwFFJjdW5TkUCC09RXv+Cbtayico5n/RddPAX4Q7J
 iwGQBiBLoXFUSPItjdTpFpsnr0cg9RAwXsGVlW+wI6rGfa+8Gesa2cUkf
 CElq/43fNOXSg0TzqiDSg0EMA/Xz9uxAdeI2+JJcUA1cjEVmRc8TLINUK
 gLy/qZbnyIOvZeGXRCI75bnOWLqaHBfMFTQ0sEfyxOxwXMMoGvVrqW8/T g==;
X-CSE-ConnectionGUID: EbPrpaAMRfG36Y/qV3/qWQ==
X-CSE-MsgGUID: KaaZS1m+Sc60erTVOUrAuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37494225"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37494225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 21:58:47 -0800
X-CSE-ConnectionGUID: XLhNvcQjSvCUwNolrYlS4A==
X-CSE-MsgGUID: 100LmuSWQmylUziehc+45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="136219046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 21:58:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 21:58:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 21:58:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 21:58:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy2V7QL3alKJa+QJWexYAUsRRZzZ4FC7eIBjFwBI+p/EWSqdj8HlOBlo3NLs0W9lZzcVZf1ZKGtUEtucmIeZWrOQpwGU9B+BPPjDKnG4igOndhMIjNDYkNYbK45O8/UXezf9/rbgiqh/Am7dPMAHmmX0MygOwMZpEd89RBjks1LjF935XMVwdvKawGcMohuwmDwHjjbVAuKT+yQwQsoH1Q5b9fMoLkwe4kebSvyh7NvVQ+PX19UOD0ipOq5D2m++olTJn0qqEERK+T/mMvB93NtYwo9hcMAXE5ejRLlTUVhivl4BzeoJ6zeALOLek9jwyhC8XunQuMfe2228AG072A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLBNDRgvC3cFpUNSk/UbGEQJDeup/98oznfAvJqjYs8=;
 b=uUaK3KE3NpeKrKKAibEpX0T5cMSmagyN5nuU4tlm1K39lddcnMXZMpcTo9Kt6MFnnOq/QNTnOVBYalrP2fFZtPp2TtJnKG0XKrbForzZSHF0FR3kS/YJbxjfdOAABFGAF/sgergTgeMQfI8naEthOn7or2cVU674RNIbh1b7hFWkAMjI3PDCs76UU3e/EcxF8XkxgLlbuCezEouo+hRwhZHBVpBHWb+oQo41HJl8KK40tX5iPrNh/rnaNCCoBaUpeio9v7ICPmo8yuf9wWphEpqQUpx3W2H8ILJVpIq7ykZ+g9GjONogu1VCmFSQFoc5S3Eug6d5DvLkDIMxEXnJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB7650.namprd11.prod.outlook.com (2603:10b6:8:151::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 05:58:04 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 05:58:03 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>
Subject: RE: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Thread-Topic: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Thread-Index: AQHbZl+3lfkNkaG2WE6j0iGvFEUcbrMXL5UAgAE2+xA=
Date: Thu, 16 Jan 2025 05:58:03 +0000
Message-ID: <IA0PR11MB7185F53E99B6BFCA5E75EF33F81A2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
 <20250114080927.2616684-2-vivek.kasireddy@intel.com>
 <20250114193256.c1cdb555ba24afc9790a40c8@linux-foundation.org>
In-Reply-To: <20250114193256.c1cdb555ba24afc9790a40c8@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB7650:EE_
x-ms-office365-filtering-correlation-id: bc0e0e55-4980-4ce9-464b-08dd35f2bdaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fxA+hLhKPMVN99lHN/BgOGyH7L5NYcYPTOApbwi5nPEmPiJQQpUTWTxkmguZ?=
 =?us-ascii?Q?zLSI1b6iPhv0qW9Du7PxIduBd6F2SiDtv1BaZyWMbZyvftYOgWqL9J0N4MBI?=
 =?us-ascii?Q?Zu2YZg/m4+AlD7zYddh5uX0cyGufzPoyIYGz8TTP0WR8jP5ixFJwTndKTx9j?=
 =?us-ascii?Q?jEfIEChcLo5VQJwh/Nn9F3RFBTehG/s+I95/uVPniPCKKYH/0EkFQf/hEjug?=
 =?us-ascii?Q?x4UpiJjXU5S8Tu3Cxu6PgB82DECnXjIzggFNJZibT8gGHD/B5umJGp3zUGK+?=
 =?us-ascii?Q?eizbgWv/cUVJCakYxAZyYLmOBA58qDVwqjVjsnKJ/4t+YJNKxqXiJ0TAyDwN?=
 =?us-ascii?Q?kdiZ2kceLrGi4E+u5wF3LM5f5jUFOrKjcdK74wTOvzbnskkgYSp5I25dSvId?=
 =?us-ascii?Q?2s40XgPHkxT45TKG4jGGnL9NoT6/BoIy4Y5kFGt39ExuvSdIrw6JCfJZDnWB?=
 =?us-ascii?Q?RgdPBKJogL8MFs6P5im/kOUQya0whaM5I7TuaO47oiwJxCJyIK+uolu2FoDw?=
 =?us-ascii?Q?WQa7hSLz7ffrf6CTYu9X/ipN0qcgdoulOxNL9vf3TkjukU27O+s9u0NI2Q4B?=
 =?us-ascii?Q?V5skyZHRo+cuIyGNpEJwIw4IVGBIxQEVzRFCZCohdJED+22NQv4M+7uU957B?=
 =?us-ascii?Q?1MiDqsFb2u+So/i7GOwufA4G9qUfMrNw4HytyLJ4V3dNcZWwmSxykQaniY2l?=
 =?us-ascii?Q?O7IiJejd1SgIPWfUH5xXfel2LBOlXcx1z1pI1kfq2FtedLXWrTHy/RJYoNa8?=
 =?us-ascii?Q?xs0TPpVLs5n3mGv2p2mlBLnoskgMn0NOQV+anPqCDH2ZQnXUZAKY5DjkG/yc?=
 =?us-ascii?Q?CkWvqCuP7vlZmEti+Idh9/pqzIsLv72Eo6uruNN7hk8ylwXpzvG9QYXihal/?=
 =?us-ascii?Q?XIRHHXOcabxRCe/kHo4QW1iS5eaNeUSXHBW958KiqCoqlncnRno2UGHj3YQI?=
 =?us-ascii?Q?IcF3ANSBi2k6C1EgKOykvWwRtFVa7n/eqS9pOw0owvC+pQkxA/SO2Dlt3ZL7?=
 =?us-ascii?Q?uKHKZPxjdE0sjCrZ3ET4pKNldgSNObuAbBNVtkz4M2h+mcq9D08ocRrBuTzq?=
 =?us-ascii?Q?3LbGoI5tN28bZGpqkrLH3gy5x5vHXcgkbdbyfDPtEKqX7/Qlm3hdj+PbmlD5?=
 =?us-ascii?Q?IFmUZTVZRRlAj9pqbwOseAw1CpVukOrxLmdfa5mPDb+4rGlQPIEWaXioFRRB?=
 =?us-ascii?Q?YrSZaskzLFHBZ6M88qLWb2C5wKxVjF5bOQ9p2xuKl/qMJn+JPjF6dgWVrFZH?=
 =?us-ascii?Q?lt3V7DYWusPjMzFrefjv87AZm//8RIN2bY4aNCnF3NQ26jfLOUX9SDqSI62k?=
 =?us-ascii?Q?dDm9cEWIgm9ZH5NMWpFT6amgN867BOCebmg/L4F9I6+zU3GeqZuRAXY1vCRf?=
 =?us-ascii?Q?OeiK1njKPGyFLVaZkqEN/fjE406Un2Yv3ye4H/gE7Of+h3kDmg0GUAbttewh?=
 =?us-ascii?Q?q+SPQz22VjlsN7gusi8ly2Pw9T76Dvgt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4bbo0fLYWYg6/03KWwSeT/oHEXqCsjW8uXJS3xzMJBdq76H5hRK7sVhWRghA?=
 =?us-ascii?Q?lOle55BvoXjHgDYTqkD5dk0YO87KNeA3ulmwDoWkgHpAbW2PXbGDNvRl6Rhb?=
 =?us-ascii?Q?ddIes9UHvmMk3XWwuO3u5C9gKmW+rdTJ+qi7geh9pw0wYWqb7KmAAKRqR8Zi?=
 =?us-ascii?Q?G9RoZ0JUN4h2hvVOFZXwLC3Ns1r8T4fvWQyR1s1zOD4Cw7Md/G4XU5FmYsrT?=
 =?us-ascii?Q?lU+m6uUjT4kxQRod4TrU/wGycd4Awq7TPCwFKlvZvBmGJRlPHmtMrBp+G0Eo?=
 =?us-ascii?Q?5ONUyj1fSRLdrUISbHirboegellzd6wsfVE8JYoDc0lxYEtNmELJrwBjr+d2?=
 =?us-ascii?Q?IqVLjejTde+eGi7PKoY2VepbW7F3ZW63dvsseju7TKIyovIP5E6uckScYlqi?=
 =?us-ascii?Q?FIlXi/YPp4XNSQvR595bVpc9k6sVcjDFfvX0KasVeG7BTlP26izc8Yks635q?=
 =?us-ascii?Q?aHMFQgPhjLK40Hs75uiBvaldu1Nyac6xHLOP1lV0h8M8ez6rNH0xz+aJ52mQ?=
 =?us-ascii?Q?7Bsul2K7WUxtwuY4Rx9ZyAL7GRXuU3DP0IyKRGLYll1zS4ZP4s30yFOvbqPg?=
 =?us-ascii?Q?rkbXI2I4GeHwoBDBCAKTJCvIBhflSzlihIWwM2stXqkfvaV+qBj9HA+vE720?=
 =?us-ascii?Q?XOeJEp5q+mgjFTMypMgH/o4ftGB6aGGT13l9GoKD6kq2vI8QEAYpW7+G9a9S?=
 =?us-ascii?Q?g8F3vnQDsSQRs3/KlSbWYLY027CKILitWV6RXxmlT+yZzg0v9pLgYM83c6gO?=
 =?us-ascii?Q?uanPjrneN6fTuZSRJC7gjx71Jl+ahLi8hFDiiilLRZvmGl4GqetKfhVSno2t?=
 =?us-ascii?Q?5o4zwyMx1wrGctItjGL2kE+2yZMH2zBU5u/V92jhXah9UQvNxcUZzXG8kaWG?=
 =?us-ascii?Q?GrBDmWeqM4MWkhjHq4uZmtwGF+yGEOgsFoL4D2VmQT1iUqoOstG6Knus4DPa?=
 =?us-ascii?Q?kOjPJTdFBTw2rka+TF+dYEiRZZjbdMk9uFMv15t2mCXxcmKD4SVlB3xOkyW/?=
 =?us-ascii?Q?FJovrPl7b7v5I2ZpUzVhhgcCjLRlVVjTpvBFEclAsxHWSZujn0HBQGwehHt3?=
 =?us-ascii?Q?IHfgW6mdJF2hFqwXLbRS++TUqaWBAhkvio5jdOTbr1sBasEM1vGCN0xC01M2?=
 =?us-ascii?Q?lh1in0+uvTmX/ouKPz140lTJBpJxMm53jUcVedr9uc0/QRw5t2zOW+A792bf?=
 =?us-ascii?Q?7bHAJZinLVqKXojueUDbIgTNBOXfLe2EPwqkggg38a3ogZljiXHO0giZRhk9?=
 =?us-ascii?Q?5bQd8IeT4cxxRIh59SNWSL0YCgOCR+0KbTRlWK3SCGBuBoIoTb/Ltv3SKAqf?=
 =?us-ascii?Q?XysYMnJHOgEkV79vGz3NQgPUDsRSChWBQlCl8CArMSpXV760R1LLW0J96437?=
 =?us-ascii?Q?gXzssFCURsCyw5KRvX723Qq4JFdF4POwkVUw7l0YXFfv+PxTBPj/iUAsHicz?=
 =?us-ascii?Q?rFmEDcNgvTY3DwmHiAzphm3rcr/z/fsnxrXCx5Z7+mplqbwDTxDqIPOUfeCV?=
 =?us-ascii?Q?UNVirWSBzhwwkHpHsrcgfkdZcpjnZvFSQwOeKf7OB6oH8t3b9tATsL/YV1Bz?=
 =?us-ascii?Q?6ieGp3aeI99OrsThh1pX5AZ26nYEu+7C2zxVziEI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0e0e55-4980-4ce9-464b-08dd35f2bdaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 05:58:03.6844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzLA0OrHyuU45EgxbuVg4xrMlkIhqNQtGFIHml4Sd/JYzjxrzCEbCizXv77BGauQx3cSjQw4B4T/vB0F6j1Ww4zzlStkM/LQoeWDrRefD9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7650
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

> Subject: Re: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before
> allocation
>=20
>=20
> > There are cases when we try to pin a folio but discover that it has
> > not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> > but there is a chance that we might encounter a crash/failure
> > (VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
> > at that instant. This issue was reported by syzbot:
> >
> > kernel BUG at mm/hugetlb.c:2403!
> >
> > ...
> >
> > Therefore, to avoid this situation and fix this issue, we just need
> > to make a reservation (by calling hugetlb_reserve_pages()) before
> > we try to allocate the folio. This will ensure that we are properly
> > doing region/subpool accounting associated with our allocation.
> >
> > While at it, move subpool_inode() into hugetlb header and also
> > replace the VM_BUG_ON() with WARN_ON_ONCE() as there is no need to
> > crash the system in this scenario and instead we could just warn
> > and fail the allocation.
> >
> > ...
> >
> > @@ -2397,12 +2392,15 @@ struct folio *alloc_hugetlb_folio_reserve(struc=
t
> hstate *h, int preferred_nid,
> >  	struct folio *folio;
> >
> >  	spin_lock_irq(&hugetlb_lock);
> > +	if (WARN_ON_ONCE(!h->resv_huge_pages)) {
> > +		spin_unlock_irq(&hugetlb_lock);
> > +		return NULL;
> > +	}
> > +
>=20
> What is is that we're warning of here?
The warning serves two purposes:
1) To flag a situation that is unexpected at that instant
2) To alert the callers (mostly future) that they need to somehow reserve
     their hugetlb folios before calling this function

> Is there any action which
> either kernel developers or the user can take to prevent this warning
> from being issued?
Yeah, the callers of this function need to make a reservation and ensure th=
at
hugetlb_reserve_pages() gets called (probably via hugetlbfs_file_mmap() or
other possible means) before they get their folios allocated via this funct=
ion.

>=20
> IOW, maybe the WARN shouldn't be present?
Instead of silently failing, warning the caller about the failure mode seem=
s
like the right thing to do in this situation. However, I am OK if this warn=
ing is
not present (given that this not a common use-case as of now) but do you
see any concern if it stays?

Thanks,
Vivek

