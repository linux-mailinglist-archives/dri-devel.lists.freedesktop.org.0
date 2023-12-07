Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD89807FF3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 06:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024FB10E0DC;
	Thu,  7 Dec 2023 05:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B980B10E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701925578; x=1733461578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aBZNSBB6ibQXwe6e4RL9b2NEBF+BheUVt4BeaDbfjjg=;
 b=LNahOPvY0qma+24VNys2kvi/rmVNfWdTEdU88MCQwRZ9UsXcCNOiEjxC
 kAVl0JBGQrglVKsSYdj94epcmDxmI1KalM1y4P60x0HcZfpL5Xvb+pz3r
 1euSbffR1/EUEp7H6G+5VmhL/7lMw80rVqicRmpyLAxDcY5Sw4tSNwoFA
 vVIb74NTuzVlC24ij7d2J1L34nTTuHr82bqThJLRLRTlCsOncaYIBaIsE
 pwLl6eYBbm5SkDhBp9Txo69jFTa46tethRkCKZS/hcrQl6eMZmAz6Fgqc
 TLveWXgVlGZReug1puc/WtqgjAD/QDDenPB0oNGYl2sJ/QWa5dDaXth9r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7480852"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7480852"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:06:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805880959"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805880959"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:06:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:06:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:06:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:06:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKoq5kIrRU5ZzAnblrhQH9OYZfHMrSevh4Qc97zx8amJhRYMRmk3qkfwrn9dm0NIDcjYOaqWpCWQsL07gzNE2R9F3ESSAbXdamYdeAyRGQFOhJsaSO6e2uq10l4A+JcEdE4TzX0KhlqfTRB1dO4RMmtexOTDaTaMBKoGjUikAIfRAN6+QiDlz3pgxtaa6FbbDPgepKTyAp+loLZVHq7fIFHduwTGwh6JPCh0yHAK9qGXeq0M/7GxzdscTbQzpn97AxykhkUitGgOoZV6Bbpl6+1P9jjo6ewbCBgChmiA7c/cLlbtcmM6a86i5ftazsijIaYoYX/pKMaYmGItSkA02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RcqmqPDMYIqZAeujOmxUz96TPOX/vLfr08dnsR9HZc=;
 b=Mg44UaNKDB2JqNZv8GqvY6QgaEV5qb+EsP+kEGS5yTwyizOYTlDtqmNyJmu4WKtfNa/KXeUh/AB+4vStIBmZT9//EPMZdlPuC4kKyn+N4RXsy2tVM4CCG/Rd6ErcXYtCcnmZZydBCIr5aGrqCJlrQWGOyXM0gdWnSrKkrTWykbBB++Ga/c+3WDEtj56aCtdAzspO+iwev2aXt+vMU2cnxeomKDaost+bFUpoTBR7nqpSF8a6Zw0t6EkUiArhOUwc/1Rb0bcGNDHRydb8meO8g+QTEbIQ1s5ookp3SJhSj4ZhkTR0Rhc5s5Sa4JGAblJucQt+jo2TGyQ/jkXfOOxdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:06:07 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 05:06:07 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for
 pinning memfd pages (v6)
Thread-Topic: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for
 pinning memfd pages (v6)
Thread-Index: AQHaJ0AmIy+Ikj7B/0qeB7EkBkdsVLCb++yAgAEhSGA=
Date: Thu, 7 Dec 2023 05:06:07 +0000
Message-ID: <IA0PR11MB7185241251D4D30DC3393CCFF88BA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
 <20231205053509.2342169-4-vivek.kasireddy@intel.com>
 <ZXA8dXR3kq7BOLkY@infradead.org>
In-Reply-To: <ZXA8dXR3kq7BOLkY@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY5PR11MB6092:EE_
x-ms-office365-filtering-correlation-id: 358b046b-534f-4333-266b-08dbf6e238b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kDEsEfwQ3ZpnkV4kNOCs73uXFv3rsS52VJYPnr0ns2/PnsHrJz7BPnHO4uqhbcT/cTL5K2u6KJN6jgVgO4f9+TiHuJ8VhIeUTywKLo3O9WEPoeuT13qJTU0PYkDSiDpTx6j6mOf7A/kfxH/RnlrY/Tf4brhsi8GIz5143NeiDSl2tU7PViZa2Jtlm6t506XkGte4/K9RJ3SH4cxBfJvjlJhtny3M0pz/WbCIPp1bB9FQeldL1HCI+11ApbbwlqYJhkCtDMO+lYzUeDmrxPjU4FHg9TYs9bxIbyfCiPyc8/lJTf1K3sAC5W9EWRW/TCfJIZW9es/uiT4Ww25EPddhfhCI02+Q7HtWuVBSx+DOkVwq1tT7nHrqEzZRCOmoJiLE0bHpCl9/x+FTsnEAl/baVrErOw5KcKIywqrHbx6uoQgapRTkydcDGn7tIMGx72Bm4zHf15f66Q9UJz9u/BHMQ3/M+HTYRkC5bE+cR+4V+1dcgP/2mz0JGKPGeFrXAmaa5jXHbFMqsHjlodjF576GPjbVO/PDbGvN2FUDNcDcvITVtgNdOKICAZlGfD/FDx3+fJy0KTeaJG5lD6QEVTyaK5kg/ejHd4EC5QxPT5woEOyUGSiaLG278hRq61wg7iYO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(33656002)(4744005)(2906002)(7416002)(5660300002)(52536014)(41300700001)(122000001)(86362001)(4326008)(8676002)(8936002)(316002)(76116006)(66946007)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(38070700009)(55016003)(38100700002)(82960400001)(478600001)(7696005)(71200400001)(6506007)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7Hud5X3HZc2M69W9Tp90penScpMCadwGM9rzCVMPaZYLsCFygVH7vAux10tO?=
 =?us-ascii?Q?ufQd7c6zaNWUm/buIZEZA1SWIdgIR5Tfoeha8F6r40pklr8DSW2PxDhU5Db5?=
 =?us-ascii?Q?P099Watq4/Y1TbY8jvKYN3b7C/4gYCv0qEBuzVkxCpKbej6I781/B2NIOsL6?=
 =?us-ascii?Q?rh2f+aZZmLBUAkWKmIMRahEyRaTH95eIKC0eV40XavEJTu1SisQrJoAqxnEU?=
 =?us-ascii?Q?fqRrzyNZYjQHBs+gwULE//wgQo2lUKVBPPpeK9Gp/p+gtzHbKHgASvzvniIM?=
 =?us-ascii?Q?82cUNIGwYwkDNHp1LSXyBr8DfkxCRIZC5hD3l5XzuE99dbbLr73FwGTi0Xd3?=
 =?us-ascii?Q?5/W4OzgwXWGV2EjvDrZrkIwNpPBYGGQXeOoGw9pnYD5xkJwnzbBcDy0Balgm?=
 =?us-ascii?Q?B949qcDgm9OgQhYZh7VDXt0F2eEjtjpSgMj0XkUPsfg7aOjJR7HcGBEcajC9?=
 =?us-ascii?Q?v4viCu+Yr1t1ygtnxp+Ks0P04pg6Ao9g1t/VpAxrHEa5lw5Gw/vywK4OxF5K?=
 =?us-ascii?Q?bSL5cAfKmNdJXTgFp4GavHf0QPwNaNErasRJjtjeJcatNykfv9ExL8HCNhPW?=
 =?us-ascii?Q?SzXGuvdRLH0ayZRURbVp7jUTZzt8m4wf73pB1yuWDB3O/GMN+e/zhH+gBDNk?=
 =?us-ascii?Q?u60SG/EPca38o4PnhIKdc7dbenmYi1F/I1xFbEzYkYI8NoDumE4GujUgqU4z?=
 =?us-ascii?Q?rjvhrTDHVrFaP/1Wi7PyGfQx/OJSDjRcZKqtP5t92VL4w17lopRKVvm4rvvp?=
 =?us-ascii?Q?qNCrtbsR7/OrjXYLAt2EAOT2Qb06PUgZz9gJePlcJrItixQ9KDsbBqvo6Net?=
 =?us-ascii?Q?hC8TR92wjPfWyqqQYFfJoumPLgqGC2Pf/rxdIXcRFCyDHDNNqtOGiMRWK/fG?=
 =?us-ascii?Q?K1xw6F3uq5s305OgQATnGDgJgexWnVMq+HQG2JF2d/Xi0u7a8XBTMEtkAb4g?=
 =?us-ascii?Q?Gn6Dn02Hst+uldFo3+GzxnE137MY3NGJyjawmRIeCE3Jo7QUDs058uahQBYC?=
 =?us-ascii?Q?8lb/Sd8chF8ZBU1ddWxLGiQwxKrPLu0uR5HV5+6HsJFyDuQytoxowRuw3vJf?=
 =?us-ascii?Q?4ENDXHFwthMpTzuAJNr6j8AkC4pdBdfJZXMYEErJGhAsk6j4INS1KTLM7DJn?=
 =?us-ascii?Q?Zi2ltHMogoTCzPNqgwA2r/DMvoEp9EiP6CHW7faYWjNjV6n3x/9CPN45dUml?=
 =?us-ascii?Q?aQDyFEXeupboGRZLp+57lYtMIVmYjw0E8EGodGSCyT4sblod68Ria8RP1EfL?=
 =?us-ascii?Q?QerkB/6l8inK4GMyt6QSKUlETE2FCiyAGpbAaEtejFXnlgAwqs8rW0zAtUxY?=
 =?us-ascii?Q?mqSlFm26li3aXssJXXoB+hgHgD9Ypjk+J2yXA1c396QoEcMKNB0rkhAezpdn?=
 =?us-ascii?Q?a7i+s9KMALkZUZ84IplXn0CuEfB5CeqvDE5Lqf94GnHhggUSMVqABkh9nvli?=
 =?us-ascii?Q?fXFuIAAr8v/ouKwk0DmP/S+A1aNGQAA4zlZtZwsDCceG/YQiwrGTrYYj4zGD?=
 =?us-ascii?Q?FuTxYvtZRxfMmJLbI0X8eNfkY+2wteaUF+RUpzyFVr5u+jrWscuzzmqRPGHA?=
 =?us-ascii?Q?7Fa12zOMa3TgAh0HAPL3a3OAJMuDcUfKGKpF+S2+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358b046b-534f-4333-266b-08dbf6e238b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 05:06:07.6976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVIHD6lJdtLPebIMXzQnBINi2JCPl12C+jeMnwZJuhCd5f2xHVeIBg4GlfdQBlo0ivON5b2H5T6qCCcRqRheviDAjPwSzHlOxr5XNx4djcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> > +struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx)
> > +{
> > +#ifdef CONFIG_HUGETLB_PAGE
> > +	struct folio *folio;
> > +	int err;
> > +
> > +	if (is_file_hugepages(memfd)) {
> > +		folio =3D alloc_hugetlb_folio_nodemask(hstate_file(memfd),
> > +						     NUMA_NO_NODE,
> > +						     NULL,
> > +						     GFP_USER);
> > +		if (folio && folio_try_get(folio)) {
> > +			err =3D hugetlb_add_to_page_cache(folio,
>=20
> If alloc_hugetlb_folio_nodemask moved out of the CONFIG_HUGETLB_PAGE
> ifdef, the ifdef here could go away.
Unlike alloc_hugetlb_folio_nodemask(), hugetlb_add_to_page_cache() does not
get exposed without enabling CONFIG_HUGETLB_PAGE.

>=20
> Either way, this looks good:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
Thank you for the review.

Thanks,
Vivek
>=20
>=20

