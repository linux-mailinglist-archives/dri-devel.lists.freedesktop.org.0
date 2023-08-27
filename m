Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A378A115
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 20:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3610E204;
	Sun, 27 Aug 2023 18:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718510E204
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693162195; x=1724698195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=da/P6g/gRL65fk0sZu8kSm9ADrfcT7A5iOajiMniniI=;
 b=cf2keBaF8Fj9k246yIAn2MFO7FF9y5ep0NfIyUALfu+9m5joNERH5Qqa
 jado7VYZPBjij0ftZY+ivohP9Nt9lTKUtT+x/uwoYecjYL5vQI1m4Xe23
 CvXKIajNXgcNHcfTDUEoSCPQ2ZbyJrrKuvyQubaikFADTaD5hHsgvhDbW
 o685jCIRj08P7Qa1T18Pd3Odri4+O9E7s3DAG0ycZayD/zeExkRAOh8zO
 FUjJJwnHMA2ATIi+9L5uQArfxsoImang2jkMIzQXmczr7BOSDx1IXj8nI
 DsftECyQid/G9Kh0j/GuoWub8RdMBoUpEUc72u5UtZE/0INQaaPC/YJR1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373852039"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; d="scan'208";a="373852039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2023 11:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="714899448"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; d="scan'208";a="714899448"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 11:49:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 11:49:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 11:49:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 27 Aug 2023 11:49:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 27 Aug 2023 11:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnzD1k6zGx5dtSu6h9Ty5Nd/Gmk8wg5gBBuiAF3BPoDpLMVVsWEI8tMSimEroNQq9PUzU7m0Bp1zxnz5tEIipBaLogZ4dDlYaCj4IyQXQwnebEbsx9k1PGCCFPoiOzt+bNJ13LgyXpx64ejrwNeoID+YpE0dBRAqxlqD718NAd/mPd3PQicFabyB4IdzkZ05K/lV5qEG92sGmUC5cf98fwD3vbpmI7vnTuc+wzyUvWdHDoN33S4vY/TUhhr5HkprC7i5M2iWVI7C1tNDZJuUbBwka1A3L3oOfME0z9R5GnlAUI2Cfdh5etPeXTaRYabPpaI/mCrUkkpbM94uYixLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da/P6g/gRL65fk0sZu8kSm9ADrfcT7A5iOajiMniniI=;
 b=i3PP0Q/JYadwD4pj4fYgou14KAGlDIqXVPj+LOESF5v4ofDJs2KgrpgqlwVGvYgFaYd+oSTkJMtICcCpo6G6f6Ejo/71rruZ7E1oXSlIk04pVaUe1UNnq1KjApLGWRhGvggsTtKB+RXi+zbrF6lSTDESn8SSSlnrITeOD55z5xM7HkHVA2Z+odkNfphai+pQYwAwpN53rZybZ41Q/14VxZsUjAVfbpoSJU+jVZJzI1tUUXfAQ65n2JthmxpiKrW1KLRi8G/ZzjJAMCUnMLmuyTWqaRbUGwTk6VyNAnAFZhVOhtjngPFlk4euzeU2rob47Gju3/DbQVUdQmsnTj/iZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 18:49:51 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 18:49:51 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
Subject: RE: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Topic: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Index: AQHZ0Nnu32u80K2Na0Cg35Cfz1LQWK/ulcwAgABFA3CAB2qDgIABYwaAgACkLFCAAYPXgIAAADKAgAAAm4CAAYCYAIAAg3cw
Date: Sun, 27 Aug 2023 18:49:50 +0000
Message-ID: <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
 <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
 <ZOjlBGcj2VMP+ptd@nvidia.com>
In-Reply-To: <ZOjlBGcj2VMP+ptd@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB7116:EE_
x-ms-office365-filtering-correlation-id: d1206896-82e4-4e23-8725-08dba72e650e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j73gkWX5eUr3KrXII6r3Ior+pUcmgS9R6AqVr4ijaX94IPzntvOfdChUUHZWAapu76nfodgzfPNkYOTvjQ7FCFSpVxXKHMhZUaKMBTOqgIHHoyZPC3prWR46vfgRWuQUo9C2gUak39CLdsWHYokyCtsUN06ejCLh3BXktt0hzi2zhExpAK7EYiAnN+WJNNdDHyTZRjkHuJctWJM1DrBgym4T+hY0UAvJOzkNL1MvLNIbtw+sxvHn1nd2yMk0XOo+kux6psM0hRAlwLy31xAsdttrAoYG94L8rms4nEKuctWFiizlwkCJuYZXH+xxz0YTNq3BiKKe5nnyzlDBmVCxgKDYB1nT4Qb9EkZyAyCwdRU5UtsnpoaeCTQv8qp1aoAFtlE0m2R/GidqS5hVxZsR4mJG26HjHjkIceq4wl5ybx6WldcRhu6oAbm3EMXpIlYAWMAYYkd5WJ4CS6qcafkNTX1MKvZW2ylv+LpUuXvNTXuJOWF81i3W+eqbUHsvOBsYpRay0NXvcbg6tq1YhWeR1ZZfB3sMS3t0bzQZGqgFaEx2rNvKNlauTfVeoW0xAtTfZiDfUxL4QSu4P1WPVUaAJUKHVlzyjDXGhWb8DjJuodWwTteB4GK57wzKJ+sRIUXd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(186009)(451199024)(1800799009)(71200400001)(55016003)(7696005)(6506007)(107886003)(9686003)(52536014)(4744005)(86362001)(5660300002)(33656002)(2906002)(82960400001)(54906003)(38100700002)(8936002)(64756008)(66476007)(76116006)(66446008)(110136005)(66556008)(4326008)(41300700001)(66946007)(8676002)(316002)(38070700005)(122000001)(478600001)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vAxaDcNWhW8VJ6L1kvcPSsy1MSt32/SdsbuW74xbCCt6jttQeFiLEMEq/36r?=
 =?us-ascii?Q?be6S1QSCBTIOw7TCG7ZuwQ+3n+zTf+fdnPp/tRqctoCUwXeFcue4Ki/Elza4?=
 =?us-ascii?Q?M+Y0BaxI3x9/IhDuwZw60vuY4Ush7XCxkTDN0ojjG1NVNI1liNv2MrRsJHjQ?=
 =?us-ascii?Q?Gzf4eSpIYgopG3cjDpDY5Nlfba5FDFrKYuSBea8kAhjd1XFpIq3AIzMaBVwW?=
 =?us-ascii?Q?/uMRRYDOkVDMuFyilsAA+EFb3IR/SdP5XA1JfyWqZT16EDKq2Yk00yQMXvjN?=
 =?us-ascii?Q?jnmSoea2cpcc8ypryiiWdwvxPZpxuWo/WwVDx7jJweKjKgekrx5CktiUjmnM?=
 =?us-ascii?Q?NujkVyLilyzN0OhemeOmAqUIFFk5x1GdAAwhOMq4fq+WQ3X05evHHQWzGsEc?=
 =?us-ascii?Q?t4VUfqGmprvEm1qb17plUu1ksczNGuh4Fbx/5bD3oQWn+VXTjUlKnxWQhDyl?=
 =?us-ascii?Q?m4o9hzZmyXkxKLoyyPVCdTd7MsIANGWqiSiNw78TedHsjSEqSEaYcjafitrz?=
 =?us-ascii?Q?OUto6HeCDQZXPemxH5OP2iVRWHxjMTB3+4JZaczK7ns34IV0d57VMm9bJfI4?=
 =?us-ascii?Q?d+Ck+npX+14Y0stehbPy9vR7VPGYXic0cvuNYLJhM9t72vf3b5fx1EB1LHwF?=
 =?us-ascii?Q?kyeG0MXTXxg+wl3VYQhADVeod6LpDWRYBuXcc2Xoir4ncHDIxE+TXXodYLnQ?=
 =?us-ascii?Q?JbGSuFOMZYRm5t12BvlxSf9lKDRfapr7n4CM5r+fST6hA2nWLBRnCeMMkMJ5?=
 =?us-ascii?Q?qOWOdGgf9xXEvumbJBvs0LObtzKaqRjKXh8TpePUOrEitPPFrnP29XGv1WPo?=
 =?us-ascii?Q?vHpwLJh/FSFEzOg4iAVfom3QcIgs5DALTkLzY14B0wAl4coyr8Y+lJ9iz5hj?=
 =?us-ascii?Q?P8v4ZYuq38ekhZpwWwDY2jganFXuj0EG7YWuCkoPy9f+wFwnfTZ23QcCp6kg?=
 =?us-ascii?Q?ogb7pqJU17yFE4xMOYFqWKcsjjlkEBvOtGo/9UCqrXn3MjDGWF0a0XD0Pz+W?=
 =?us-ascii?Q?EnizuGdtnCl7mK6daguBqjLo2lQlUS4vMdVYjcYeFvnFnNTtRuH1BaGFLr/h?=
 =?us-ascii?Q?JNSb8/2isjk4hlxXr+VIc1HgCCX1YXxb7yYeuPOcss1ztdv81Z3ptj0CP3yM?=
 =?us-ascii?Q?wuPtmqb6n7tdunXVDDNKVhZfT4SRbIDSvh/RGRF/+OopePgP9r+EYlSvhpoG?=
 =?us-ascii?Q?RzJRXdItum8UR4CMHVRaFFL/l8O0o5nH5bHQUV7zqboaUHVTPL7JOs6ATMdt?=
 =?us-ascii?Q?OLHOAK87jpMDMlt0M6JVGw/60BapulRIi5AmXavJWDP5o1qM0D6t08vMD7R4?=
 =?us-ascii?Q?oCeQ9qTUyWU8ewdryGx57kYmfFmT98y5hvsQCnQrJtbYvgDVrhEVEmr/bbbg?=
 =?us-ascii?Q?ecB/aOZsGd4O/yRwM0OczbNvR8TCS8L2eLG9Q8yXzePF+7OcHLtJcPu2OJ6V?=
 =?us-ascii?Q?zO9BZ9lDiDEMasHl4I9kgRFhwPuIUlTOb8G+JglQA/v9A9uM9t9cQu//tSPT?=
 =?us-ascii?Q?2FsNL7khoWBv+oZGBgZ/8Y+mX/0ZihXS7HWzd2WNSF5+9/fwgkxKWLO9foDI?=
 =?us-ascii?Q?a9POmvOeHAHJDOT2s3kC+pjo3yQY1DVLaO61GXuq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1206896-82e4-4e23-8725-08dba72e650e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 18:49:50.8829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4I/W/gaxS5NiJTgmfDMRo7cKxn/kQfQk4hcOOYU7LmdBFP5RniOEEglnXCXmVacUFXHnlDvpjVoxdX5KkvoOa4BCOvRo8+sNapqGbuaxtj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh
 Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason, David,

>=20
> > Sure, we can simply always fail when we detect ZONE_MOVABLE or
> MIGRATE_CMA.
> > Maybe that keeps at least some use cases working.
>=20
> That seems fairly reasonable
AFAICS, failing udmabuf_create() if we detect one or more pages are in
ZONE_MOVABLE or MIGRATE_CMA would not be a recoverable failure --
as it would result in the failure of Guest GUI (or compositor).

I think it makes sense to have a generic version of=20
And, since check_and_migrate_movable_pages() is GUP-specific, would
it be ok to create a generic version of that (in mm/migrate.c) which can be
used by udmabuf and/or other drivers in the future?

Thanks,
Vivek

>=20
> Jason

