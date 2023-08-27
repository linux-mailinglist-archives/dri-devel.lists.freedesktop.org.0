Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC778A120
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 21:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485410E20B;
	Sun, 27 Aug 2023 19:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CBC10E20A
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 19:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693163164; x=1724699164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p5fQpUPYWUYJvliXAmtttCcLbuleJ5uHjMQzvsKbL3c=;
 b=DNLqHdqh7fzhrU2CiYJxsDkhWcCGdS46wLWeJIwoexdKsRBbPPYc0uEf
 JAJO26H4lpxBk3NeecBV1p7R7QjZl2NSyxSAdPJhJbxf4O8vwNyFvAIK4
 YAKzYVq8f6keWwuCjtdASoF9FHVT/5iztMXuc+D5bd+mt8TS1j6CLKWfN
 28h2f9YT0rTI5U3e5X9L6EHxawDHK61HkI/pMHShFvyhGiYSFrnRJIOO9
 VVSZ07NYuk8WU3m5a1y5xkDfaJwadERy0Bl98sH9zOKcKicXK2q+upcx8
 +wnfJfM/TBTilrj5ohdViVfV1ewHiJ3hAUlWreOfI7bUz4ynM3t74iBnN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354489251"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; d="scan'208";a="354489251"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2023 12:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="808057982"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; d="scan'208";a="808057982"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2023 12:06:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 12:06:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 27 Aug 2023 12:06:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 27 Aug 2023 12:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3NROKFIIXCgR6VH96TEianRyqDs0hai89VyWB+ECSFMYo4T8/luIqJD0o0KFWuhAwv+GiQKgPeD96xR4/BgXvSvq2EZSCWSJZI1mxgrCcKXNiIL3CZQgTh0CBMhosx8ulufIN6NbDZnhLwObL4E6e4Yh2dnkEVQEWlG+2zX0dV6hj9zz3DiqjKw0J9anJL/9CO96Lj2Z3Q5EyNyKtS+dAF97vGfSRT/EpRH+vLM5FewXnk2brl3eL+giH7Myws3qlNyxhSYHtm5GNkqc5aLPSz/J1fNymlBUWAHddiuZX4PmHVS7RGRk/tMtkvqWxLXGWbfdzl6cFf9cfdpRtuDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5fQpUPYWUYJvliXAmtttCcLbuleJ5uHjMQzvsKbL3c=;
 b=lvOxCuBLx/9VCM00IpwcoSXHxwyvswvesOuV+36FsUP1iuzh1QzzIc4p1EtJpzTpE6USdE1yEgnaUuYF23UgEpO3+uYjdhX1KKwhaRNBKkG2YuhXCW0W08gHcnFb+VIdAIRc1WTMd2B+KSSDgmiRaLy27jmnfBuNVET7lQ3KuXzuDfkzORzJ4xr3ye08hOuaUG8m3izLyaNn6eJhjbPe1MM0Wlx2+Il/s8vkIYpg9LQNr5gtfvEo6BUGV6Bj2IBIfMU7pl5R/apAxthFddQKkcwW3AEakt7wV626sW6geQrV96ruQCRiy9BNoaKdYx4NKKlOEDEvifVvVsMGrpk7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 19:06:00 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 19:05:59 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
Subject: RE: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Topic: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Index: AQHZ0Nnu32u80K2Na0Cg35Cfz1LQWK/ulcwAgABFA3CAB2qDgIABYwaAgACkLFCAAYPXgIAAADKAgAAAm4CAAYCYAIAAg3cwgAK4g7A=
Date: Sun, 27 Aug 2023 19:05:59 +0000
Message-ID: <IA0PR11MB7185D5451D4DFBDFD4C258E6F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
 <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB5184:EE_
x-ms-office365-filtering-correlation-id: 92327a70-847d-4678-8f62-08dba730a635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXjropskRBgkWo/mLw02I41IoGfQA9AsFfu7muwwubiYW8BcHj6xpmcC5vQJ/u7r3iyj2CtmoAanPR3N7o4ej+znHY+wBgI5VkolTuCVt5QHkleFTvdFqOEWXr4j1vT4079I0IPOQYSg/29zevTdsGMzdbB4O7842VRFkDXc3gzL7wjDRshu6olhUT0qNBk7a0mi32venXA7xYsMI4oJkJIMnZQ5ZZegZF3/gNOAgZOa2MOzZ+1klhsTwxe64YGp/PDipxbcQemk0B4S75KXGi5fz9wcq07ANwt0KJfhs2JfuLNRVqddUo8Pzp4vwlh1PIn57iB6zrFtq3z3jekwnVYDuC1UIH4qohUCKpMWEfWvpEV7gvT7CBoqYfSGqeqMDi8pCP8FNBetVU2j0LDs6ifNL5JC9EdbiUnAbyaNc267rrGszplb4yTJIDIXJjqM/7wT0EHyUBop2kgD8e0QM6/9UOJFzvdEScqDUeJnLtj2OPxVzj/4nQkqkQj625+skSenUaNT9xTLu6zZSxlTxtP6ODTfC/vX/QLRAzeIlBctd41nKhw7r2AJbVde8Gt5HQ7eIQsdERGA8oJo+VtGKB9SEciSgZocFAJPjPonNOM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(186009)(1800799009)(451199024)(55016003)(71200400001)(6506007)(107886003)(7696005)(2940100002)(9686003)(110136005)(52536014)(2906002)(33656002)(5660300002)(86362001)(82960400001)(4326008)(38070700005)(54906003)(8936002)(8676002)(66556008)(66946007)(64756008)(66446008)(66476007)(41300700001)(76116006)(316002)(38100700002)(122000001)(478600001)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FbZj7BQAYbJZnGr0AH7XStetJC+SXx1EjaOpD/YOeu3b1EAJTwpOglBXq36u?=
 =?us-ascii?Q?GRvStd5a/nf3tMQC4F+VXs4r2zvEPZABFA9sStHnSVcZSKKWTzY+Y2WjaDlw?=
 =?us-ascii?Q?+iQqsvMc2cNstx4I6Nydn4YtSgDvLiMES+5P1xUUUl7b4rsFRR3n5occisjM?=
 =?us-ascii?Q?w3/HM844DuVEtUwyi1hz9VrSgWl5HBcihSaG6fLdkoajEKfFbR7YeeORtO/M?=
 =?us-ascii?Q?2BJxm0s82FBCL9iDRe1uK+kF9MgcWkDDc7sP57V/V8o8MPjZZYZ+5C2BiOgj?=
 =?us-ascii?Q?MeUwX/8lTod9w00WuumsWImjBEAcNSEQ4gJy9DG7BUjbmTRwxKq0Hy93XWrX?=
 =?us-ascii?Q?uuL1u9wFP+2Q6rfrc03XSXqjiKyRus8ggL4JkYhReSG0jsPKUkE7eA8IZUJN?=
 =?us-ascii?Q?gw1psRs8+j2ireVdUKfrTpbn+CI19bpuWLsx6gU5/RDaGyyNOOlgWYFyx/hy?=
 =?us-ascii?Q?fkbiLtXCHNcxC2a/hck3PvNBkFofE0nAFIHsEsLoNUMI00pu206DjfuS2Zef?=
 =?us-ascii?Q?f1GEi/Sv6TNGkpYWSw2VoJZcE5NqctEJuwFT6JDx/N2fKMp37/2Rc8XJONSA?=
 =?us-ascii?Q?rh0RhdHCdD5owXjj2Z6GPblevOHzrRrJKvyo0XwnrXVX3EHFyaN3s3cWJ1iV?=
 =?us-ascii?Q?h/O5GPmJKaz+gd/6s2mwbkhgVaf7kyBWD/vKJGm5Vf5HB7J2LZpZ4hxQ+oeN?=
 =?us-ascii?Q?IQ9OetrVB4KwkZ3mrugiXBol7yuuSkpnr7aJisNQS3ln9JHCcT7Am1m5rRKM?=
 =?us-ascii?Q?5r8ZKe7CRxbISjzZvEpPY/fQOnN+l8wqWT8nJVj4VxW8FAiJT5B0wrWHjelg?=
 =?us-ascii?Q?+56ywbx/xbmnR7Fs3xfhwu2mtk15dYgKPBWU4BCy3uGhhx0Z9vlAdHmU4NBj?=
 =?us-ascii?Q?K/XPKFjt2ZwEC650EMhF3Vq657PBIJqFBAUtRF5RmkRUFqeyqEKVwp8gapzO?=
 =?us-ascii?Q?/566M9cOvnZrdR/lMWKLCub+tE3cm/wmXy9kMUpUGA0JmU/7ZxfNeWqUCp7J?=
 =?us-ascii?Q?GaIVKqp71e3WUs62AVlj1/q61NsvAIcoq8pID02jxvmpHdcwooeKLJQ5ZEFF?=
 =?us-ascii?Q?p6ykGC27a0aWp/bTgz9HuQTE4zft6GCsm8eL0G9ykbfNUyOi16UyV+5QrWE6?=
 =?us-ascii?Q?p+6+W+b5sxiBUHOLRjMl9vahqAQKghmAnjBgSfFO7csd/5Bi8Ghw+vFUpFNu?=
 =?us-ascii?Q?RXKnaboEcd8+gFED7d5shQT6gJS76xVGZDxWcqRcDBz6qTsuokEJ2g1+ni4O?=
 =?us-ascii?Q?TdeYFdZ0gMfRfIpQLNVYxmGuOp24io0DfZiHv8rx770aJDoS97zQeoVWOXP0?=
 =?us-ascii?Q?iEBhnZNm9UiJ3AFw8celIk3HmMqohGcCSdf9WdkUWlhzr2R/UOTD7ASKz7dr?=
 =?us-ascii?Q?PyTJ/WXFy2zWyvUxjxtBxD5qtJLsBDIfHgU7cDSsC6LFkw+fPhfi3GRXkUED?=
 =?us-ascii?Q?H1EXJgpQJt1LTNGWlu490avL+anlBV0LhEy5yN+EcnXvCZAW0+EqAMaY7XHY?=
 =?us-ascii?Q?ol+h+ND3BtkSxf1iFMupUJf2VreQsM55d7lcTYcs6k3P2WF7l7S008eXDnOh?=
 =?us-ascii?Q?fFWFlzLZg23e2a+BpZX7ikWlirdCBld8w5JlhPg+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92327a70-847d-4678-8f62-08dba730a635
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 19:05:59.1371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +MTOw2QjyEZXtiXoZM8RJr8d2ZMeY7/6fxwBuZRVQRUolbsOwHjCMe3A44gFdmJohp0IcLVwaGH+vml5N1nBo5qyTgitBWKWxSxTuJAeb64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

> > > Sure, we can simply always fail when we detect ZONE_MOVABLE or
> > MIGRATE_CMA.
> > > Maybe that keeps at least some use cases working.
> >
> > That seems fairly reasonable
> AFAICS, failing udmabuf_create() if we detect one or more pages are in
> ZONE_MOVABLE or MIGRATE_CMA would not be a recoverable failure --
> as it would result in the failure of Guest GUI (or compositor).
>=20
> I think it makes sense to have a generic version of
> And, since check_and_migrate_movable_pages() is GUP-specific, would
> it be ok to create a generic version of that (in mm/migrate.c) which can =
be
> used by udmabuf and/or other drivers in the future?
Sorry, I accidentally sent this earlier email before finishing it.=20
What I meant to say is since the same situation (inadvertently pinning page=
s
in movable) may probably arise in the future with another driver, I think i=
t makes
sense to have a generic (non-GUP) version of check_and_migrate_movable_page=
s()
available in migration.h that drivers can use to ensure that they don't bre=
ak
memory hotunplug accidentally.

Thanks,
Vivek

>=20
> Thanks,
> Vivek
>=20
> >
> > Jason
>=20

