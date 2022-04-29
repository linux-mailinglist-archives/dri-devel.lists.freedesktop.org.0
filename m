Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33165145E2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2B810EEFE;
	Fri, 29 Apr 2022 09:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67810EEFE;
 Fri, 29 Apr 2022 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651225798; x=1682761798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MRXljwLBJPUZwSLwVJth/idnPBgYJMXMh3Zac46A9Lw=;
 b=cUXjT3tjdF2hS+SbXpRqBuR9UOCKKie/DfvUGw8gJxEt2bWgCt3HLWTM
 iyJMIbgK8CswJ8a3GIGuO8Lw7twVH3077B3RW8slLswfklGYrUIWtz/QI
 uhPIhCphYsRZiM9LOqRno9tEuAdNuxoQ+SEPJv4aRsVzkY3N2VDIdaH+u
 DHK7wfU3AmLOT06c/4+PUXOerpUyTKTKtUovbHNUK98Z3+rXYdIi/dFgK
 owxQ+9SgcUEE2jlMmcVjBA+bnwwVBvyL6CPd6IsRz6/AOpozEMeNsK78b
 K2J1+tqtyFrTRu7jdLGuePJgLOEDMlVpdPL0EuQbJwTOZKBv1D9kiuZwl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291764254"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="291764254"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 02:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="534408535"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2022 02:49:57 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 02:49:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 02:49:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 02:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5NLbOsmIbmiuUMU3KuZBARXV4r4+jKAnLF4YsvDJdDN9q+M+uFtz36YHvRmqrF9XZQJvkqacg2qaO5Jzp/HEw3c/uXSlQ5gyLWqPy9de1mPEr7P3FKIOihXBdUsPCbRsyaMOAjkcoqtf5RsL2chCyampMaShXQf5pPCqcgPDleoSkxSWWe3xQ1OmLbdyKp/B77r5CyE1hNASYO5aFD172Od4qA5upLN9/M6YnrPXYGW6WNohh0JPA8JqDMSDmoAG0SBUWH1gD5Glml2GTWGexJFVrzSduQiCRYJFE8SzIGiE0ejv2lPtAZaQtLKMjEHIhTnGNT71ykolExV2ZCU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDyHtumNT4u2pYMBjz6B6ILA9S51GvtREIlxYkp1+cU=;
 b=OSceT1w1fZCje9/BBuEorExzj7vl8iipMxAMnW01hIs13/Und3bpF21P89FjxgCsRYF02xDYkS1vDuqzKTJVy8z8JIcy9EyA6XqEN/0g2AbAfqpa5DacHnN0mDY39LGWUtJQcClBlyBuYGyOqt+/SRax8NDFIfXY7Fb1az3LEFOX7nw677gRPy5QLNlbeP7cIDMwqqoq9jDfiu1loLc7g4E8iNHEO+QKvMH8anLTFknuM6cyJIWz075Fg4k+S4AVftEel+YMqliKfwYrbtGp6chzNhpJzjoECYkdL9rKkxgxQv++7XICKk9jlGYaAUoQzn7CXGjyAH6bWrLjv4EU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.19; Fri, 29 Apr
 2022 09:49:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::8ff:689c:5df6:47c0]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::8ff:689c:5df6:47c0%8]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 09:49:55 +0000
From: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Subject: RE: [RFC] drm/kms: control display brightness through drm_connector
 properties
Thread-Topic: [RFC] drm/kms: control display brightness through drm_connector
 properties
Thread-Index: AQHYSpWxv9V/W2+rvU6fnj2rW3BWE6zkqjWAgAAOfQCAADipAIAAuNAAgABky4CAAA1YgIAABGaAgARlGwCAAEEWgIAEd5YAgBSrkgCAAAV6AIAAAOaAgALIRoCAAAD5AIAAAhWAgAAL4IA=
Date: Fri, 29 Apr 2022 09:49:54 +0000
Message-ID: <MN0PR11MB60116B970F23F3DE101D66EA84FC9@MN0PR11MB6011.namprd11.prod.outlook.com>
References: <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
 <875yncezdt.fsf@intel.com> <YmlNQgaxU7fYnTh6@phenom.ffwll.local>
 <87fslytxk5.fsf@intel.com> <YmlSm/TC1a/0V00S@phenom.ffwll.local>
 <0f8e771c-bf0d-f20b-50da-dc84f760ff82@redhat.com>
 <vdb4oRbKTPYjAGPcmjKfhcDQbMb1VuiJwF99I3UwkwUAsyEvvq5x7yKdP0mx5tEeNc2idU_qBSlbMM4dlv7apLeDvG3PIAkvRMjwVNKZGCk=@emersion.fr>
 <20220429120651.5a39ec03@eldfell>
In-Reply-To: <20220429120651.5a39ec03@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93532dbf-9e65-425c-e0fc-08da29c59d32
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_
x-microsoft-antispam-prvs: <CY5PR11MB62574B8D30718E917B66A02184FC9@CY5PR11MB6257.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QgYyI5DyPyugADG2BUn/0mfnP6FMKPTQFNxDkpdcSPcQaKfU0AfZmNXK+CIj38WkWlZS/HCdanEGNGw3qedqTSYVYWepmNFn7dEYJOMChOcTsmxdQVeO0hY2zZf/H5dWi8kJnorGoIviTxiupHJ02WwhkaOR1b2WwW6ZNokdoSeVZQ22zuRZikkVGFjtOEDBe6nKoV/GLY1WQk63VM6jon25cNIAfKzl9qIlx2mUy4fqxKdlkzbNml3DB0z6LIZDroDkilk5HidlTuTn87k/HhdJ1fq1rcsGvymxYHjrWUcuMBsMdVESmfj9pExREUfe18ZlfF9zqugRUBd+x8MWc0Pkibp9eSmhNbYqcxDe48976i5jWe5sCxQyjpqxoHuSnrt5xWZc+ME5XooJnA76wDX7plRwmY+RfZ9FdQ3gP/Tnt63T6gMBW3bqblqLwXmfQpkWAgKCqODYFzZq7O4TXgdvPIYYxUcJ3XAIrc1ADsIppn3bkh5K60zC7hjyBqqpqMdAZ2lDF83Xxf2KYTEbYzf96BlxiKxNnHw5cEqzVqYMYYyeY+h7P2ykwuX6UvWy+Tt5MkL5wiSS7AbQlvsPRSCSGmXDlF7ZKF7LZepHRiic2izifxAECkJABvYZdwmfT4FpSgGuzFVVFeZimgpOWgZPbrPmgUtWDgrEylG7DrZeBFGKEp4yfVnXxqF1YssKMLQTMIqiigRle4Jlr0RT9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(33656002)(6506007)(316002)(52536014)(8936002)(55016003)(26005)(66556008)(66946007)(76116006)(83380400001)(7416002)(508600001)(110136005)(66476007)(66446008)(38100700002)(38070700005)(64756008)(4326008)(8676002)(9686003)(86362001)(82960400001)(186003)(2906002)(7696005)(122000001)(54906003)(55236004)(5660300002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mWh8fvZ+ZtSkAE1DFYASiLcR9A/genhYkB5NYUADcjs5l903KA1Wnykg16uQ?=
 =?us-ascii?Q?eqkELWWbDY1+S1b002Xp/3JobRwovAY5lpYkzaQNHAb0W/VNxP27nmC5rZks?=
 =?us-ascii?Q?d4dr+w2KzXALtRPswNjnIJDrqMc1yHkIk9/yZuuTy39cVjJwARNaJhvF7Oj+?=
 =?us-ascii?Q?1oz936gzzt8U6OYAlbtYCmZVFC/PISKyOjvyzhplGiXakgIeqxiMDL5+KS2h?=
 =?us-ascii?Q?SU4ZCqJtDvGD2FOH1e/fExDaDjBXiPoBfGwORp7LB5G6zWDvFX8CiQd0xpcE?=
 =?us-ascii?Q?Y5yvFPoM7aXpVelZbZkZ/bri2XGNagunq/wbYZszntGb5oAh0CKUQTFMsOi4?=
 =?us-ascii?Q?V2+2bgiDR0rIBDX1bHOrfLTI5w7iSbolwfCGvWlBZgIgDouwQ+AGaQKa/uYw?=
 =?us-ascii?Q?dFuQQ3XjoJLxV/Rm3p2QHVjzB/iP/rXfcV1RKFvShKxYm6ClHwIJ+2XYR/Hf?=
 =?us-ascii?Q?m3tFl+tdZArtVQd+E2cNCTuK2we22PjlZ9tenc1WgSlC7kttV9m7u5K9je9G?=
 =?us-ascii?Q?0EKzRWw7Ca8XrCk39xMW1Rwv9zzmWQNQKWD/+lLmkHOW9Lyie3L2Xm09hNqO?=
 =?us-ascii?Q?U7k7OZ8Ze2XENijX7ujrGzL5CastjzCaytpMSbqWNkvZ1npjGy01whpn8b+M?=
 =?us-ascii?Q?tlOJSAoROWpSut3vgbW5iGBMOP/w2LrxDuMg/8v613jUjU3qXEedPQ5x358V?=
 =?us-ascii?Q?DHe45OK23b53W6C43zZypkMqebzk4bqIhcn1/+mei1ebjcTHsI2ODMR46MxS?=
 =?us-ascii?Q?0xBqskGC7kjXppioeZNHio0vFGGLuILrr34WxjJxwTla3UdHEO+8SvqFv483?=
 =?us-ascii?Q?tk616+0M8Ej9wWNB456EZ6ptljEk9DdQJ8keC1W7TPlM5452W7bH2WXfm1nr?=
 =?us-ascii?Q?oggolAhWrobmcskQhGSivJ+tiXJYI4Zson2VZCgznwTGpg8Lzsv2WnA5m3lA?=
 =?us-ascii?Q?fQqBV2xqsP2ivWGYwbIfijSBe+BetOTOToGSW+RL0k5SBAvYnAM3ffS3nwSr?=
 =?us-ascii?Q?EE72igG+Uhu/2+9MFWGDkw9zm7edU8UzAaf+7quH38LOA1n5lwLSz+y77tPh?=
 =?us-ascii?Q?NyA0sy06VTu7HfLw8uXMew4dRIkAQGW6aZlbitCQgPl2HRTDF8EkSVgS+gWC?=
 =?us-ascii?Q?WKgmVUONpJKgZdtS42LI0X/esRBfI+qc5orfPltdsvKHIpU86RL3/M6GHFp2?=
 =?us-ascii?Q?tNra3QS+xk9jEWHWldz0NJEF99jrnJkc+zImEIjexb5XtZFKSNODotfjUXIP?=
 =?us-ascii?Q?TxQj/ZqrIL6x4W9kd+G1t/NTHtV1QgnBqES76HN7+ADygrneBN8RAGecP03t?=
 =?us-ascii?Q?r5BDK7MWQvkMRgm1rcUs0z2U9gVZ0UNcrcnhvcUQz7RvHh8vwy05Vo8F06Do?=
 =?us-ascii?Q?unJrsn/KuVSmGNNr7ovEn0KaMKZkd/Pe91UoC8BdFKtTl0AunYQ9c6x3SdD6?=
 =?us-ascii?Q?xUC85zbcr+KSdO9cwIH8sBsG85PfWXX0Np8mEiGniCodKvYViLg7IPge41Bt?=
 =?us-ascii?Q?9ROF8XgX03qGTmSBHTessUB5nyxyj23/xHqQDvkxYoB9JHnsolGwehpmF9Ue?=
 =?us-ascii?Q?v0FgPHVnZjy0G9rjiqNSjFUaxB+x+/T09VlxheJ0ekkgQxZDYkiJX6FZ0yW8?=
 =?us-ascii?Q?LSL6PJZThJ+q+Y8Bm499HkNBSkH6WCqf/qNMvDqsw8H5ARXIY0ADVC4jiOP6?=
 =?us-ascii?Q?tDHmD1RRCclPbd9NjtJJrKO8xeewLPgzUUbLPGrb/DyygBkrnEzQd/EEUJUw?=
 =?us-ascii?Q?zjaCMWaV35jR1bU5wJJ9EP04sksCioU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93532dbf-9e65-425c-e0fc-08da29c59d32
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 09:49:54.8375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mm12Y4xa67zcFBIKJE8Uj/HCa1JOfMRd1pCOGN/6dq5VjjY/Fd2doplALo/HjOaUcClRRC3TvdE41E4m6I+sTGcwIOTe0ZGKOcPKjnkeAdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes  we would need this.
-Sameer

-----Original Message-----
From: wayland-devel <wayland-devel-bounces@lists.freedesktop.org> On Behalf=
 Of Pekka Paalanen
Sent: Friday, April 29, 2022 2:37 PM
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>; Sebastian Wick <sebastian.wi=
ck@redhat.com>; Martin Roukala <martin.roukala@mupuf.org>; Christoph Grenz =
<christophg+lkml@grenz-bonn.de>; wayland <wayland-devel@lists.freedesktop.o=
rg>; dri-devel@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; Alex=
 Deucher <alexdeucher@gmail.com>; Yusuf Khan <yusisamerican@gmail.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connecto=
r properties

On Fri, 29 Apr 2022 08:59:24 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, April 29th, 2022 at 10:55, Hans de Goede <hdegoede@redhat.com>=
 wrote:
>=20
> > I believe that we can fix the new interface, the plan is for there=20
> > to be some helper code to proxy the new connector properties to what=20
> > is still a good old backlight-device internally in the kernel,.
> >
> > This proxy-ing code could take a minimum value below which it should=20
> > not go when things are set through the properties and then if e.g.
> > the /sys/class/backlight interface offers range of 0-65535 and the=20
> > kms driver asks the proxying helper for a minimum of 500, show this=20
> > as 0-65035 on the property, simply adding 500 before sending the=20
> > value to the backlight-device on writes (and subtracting 500 on=20
> > reads, clamping to 0 as lowest value reported on reads).
> >
> > This way apps using the new API can never go below 500 (in this
> > example) and for old API users nothing changes.
> >
> > Given that Jani seems to be in favor of enforcing some minimal value=20
> > inside the i915 code going forward and also what Alex said that the=20
> > amdgpu code already enforces its own minimum if the video BIOS=20
> > tables don't provide one, it seems that there is consensus that we=20
> > want 0 to mean minimum brightness at which the screen is still=20
> > somewhat readable and that we want to enforce this at the kernel level.
> >
> > Which also means the weird hint property which I came up with won't=20
> > be necessary as we now have a clean definition of what brightness
> > 0 is supposed to mean (in the new API) and any cases where this is=20
> > not the case are kernel bugs and should be fixed in the kernel.
>=20
> Looks like a good approach to me from user-space PoV!

Yes!


Thanks,
pq

