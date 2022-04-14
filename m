Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66236500FF6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30D010FEC1;
	Thu, 14 Apr 2022 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8A910FEAE;
 Thu, 14 Apr 2022 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649946339; x=1681482339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AwZz7plzLSJsXebt0aN3NUlqQ0KqY3xqMA6NevobOB0=;
 b=bKjctiMYIk8pWw8grqqHBZuFMjARcouiaj4BrIZ3hP1LQ/dafrqLOUGc
 WFn/4BH/Ew8XsiPOkiiPsGpTTAJPmjXsKm7mT0DucXtcM9lecoj7FgZ08
 Hda9OzQi1RmAuoWDZDEGaSxKptrMx2I3oPFO5upShyGCYlqKkVJFEPnva
 5C2bLMcGHgw5pg8CWPClrfv1sZKHemgf5NF6WqFTWo56LhS2rzMzhZemp
 t9cUQDK4wtR7hQo+Vt2esI83EYM+qIKkwrQiXlzvDkF7BJNR3TRqU/+EV
 hCcEfQQWTYQ/GMbfrXMbBRPbwz/mt4onS/N74lJ1JKE+uqKhb2SfRp/Qd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="242872630"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242872630"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="508423397"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2022 07:25:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 07:25:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 07:25:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 07:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuoXpijFMybJRqjYxRNURHlOrZS3gunmYlFuD0XFoqyfztKhR/pQUV7kcSQuu7LEpfDVjv/AoSvstJbCIyPYhg1IXLmhYvHHUy6NCCOh5cPa0WFrUWvqaXv+jnjvwzcoeBEVA0cWlm6OTOElsiO9IhHd1qCmeh0SkXPIMHahh17TU+6aFQa0UfjA6/OGBbOEjKjU0gt2lYk3lF05aHIX8IK927BrNOIZa6/AyjswLrrkCfrXSq8V50G2NxYxK9p33TtfBqbVUvJmGRhoH5xCamDRIcLCZnaMQd3HCu+stPQLbjUHkLo6rDfiM9GTM0asoL1LFBMFk2ogw2KYgFqyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z80KxA6Ltahai0U2/7spM3IUAYqRXMhtR0AthaD7MA8=;
 b=jQt3XBuJaqG9HAxF2JlDxsKD/LIJEwbOctBGVWCegrh4ptHqnUZR1j+lCFPiVoXQfMws4ULixqZsk+yZN2RXIaX0bVwCSafi5oiGyL35VC8ZkODZ0P9Q6JVi5ppYHC5LQfufzovwKLhskuTj+HqcbXF9YRDt+2W6KePY6qZAB2A+ehWaFK+HQFYRbrd5iYcjOt2qvrOdm9Hnrxm1FrVuUMhWlL6wkOdelMd91FIfyB4vC9JcayPaVZvtizgDrlIJ5716gTyICZq9UdM7z3r2hGHGaeKkRTyFiwUCpWsq2rYJD2W2iR/SCgzmSFSPQUtqfY49irRU9ghY/2eo1yoEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4368.namprd11.prod.outlook.com (2603:10b6:208:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 14:25:36 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:25:36 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0AgAAhbQCAAANggIAAeVIAgAACNICAANnfgIAAFJ2AgAABmoCAAADigIAAC82A
Date: Thu, 14 Apr 2022 14:25:36 +0000
Message-ID: <abc0a953-8527-ba25-9987-d2f1284a7430@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com> <87ilrbeqbo.fsf@intel.com>
 <20220414134321.GD2120790@nvidia.com>
In-Reply-To: <20220414134321.GD2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f947b07b-f4b8-4053-c464-08da1e22a45a
x-ms-traffictypediagnostic: MN2PR11MB4368:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB43684F6E24372E3EE3C44F47CAEF9@MN2PR11MB4368.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zyBuh2XD8TITVR+DHlB1+CMJi5y+QbQ/n0rWgYrodsfdH3SJ/jXHL1B+N7A5qbx9+YeO43RUHdQlZ1snujebzZud2xGZv83UNjQ8HOtsbUXHIz2ipVBxNJ6gsEJW85TX90MBho2qhEcNtWJrc12xjuRqFFV7lzVALR/U9xilBjdk4Ou+WDIFrrZvLVWK/Ljk+ZDx8dVv0u2G/eLOa2e49tn/SKXFGwzhl+a+ULksZw3USbXl0hdsYAnrIQpNY8e9tkoOLabmbLnx07lCPnd0hT7lYWZF00nIiObiTXQ65waElcJjncDd0vwOOVjlVhnUUMGgIrWSIDIDGbbWzf5rNCaTFOls9GqffYoA8zTtVjvxQlBVR/6mdFH0vn2hZK14spDhVy13I+Qk+cOGfoLCinvAK5HkfNGNXjcgd1uEa8hcsGJruDhjaNUyCtZuQIDqYsvrYDpz6GKxo9+OiD27dX0JgvZkCC9s+LWYgrUbJ9KBisAREBFIp7k2CTgkEzIRUDL+UwSuQzU73T4YqRAUl8z/PTEcRVgOtjfYG/tf2SA+ZIjuctb+Z5Ll8HJazDkgjaGuzTAofD20oFOFxQF4ARK4XO+lHMY1YBXJpVaDUWSKXyT08lyEgRrpedJ8VlbgjeQbfAKuPn8oAVSLAwWF/P8to6E9anFKjqiTJ2vql989SUsae7dNxTgb3FmizZwuAh8de8rYYiD0Wdzwens5QcSeLenpo7BMn9P9AKSyzUi9N6HXg9UrZHe2DH3H6ItrVvQzWpL7E2VmvuBTtybbkKeQzSuqjQCqANK4otBsCaj6xVJDzwLSb9bTF4ym7UT2ZVMKTjBufiI4nh9P0b8Xw/MkXiCdoi236QAVZSXoJdk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(8936002)(7416002)(66556008)(5660300002)(508600001)(82960400001)(31696002)(6486002)(86362001)(122000001)(966005)(2906002)(38100700002)(38070700005)(83380400001)(8676002)(66946007)(66476007)(66446008)(76116006)(4326008)(53546011)(91956017)(64756008)(54906003)(110136005)(6506007)(26005)(316002)(6512007)(186003)(2616005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?WoWN2EecUFyo5TjAW4s/9soYECId3Dti0ve/z1OV6GdE6R9te7ULmxBU?=
 =?Windows-1252?Q?hW3qWQvlKO8KGlBSTAywZc885XZMKl2e922DuzZc6uLaCVlrQsq2wSYo?=
 =?Windows-1252?Q?7SBXVX1G1YkuE8RvVRIVUzdRwu+ejH6YeRjqjjM46DJuMr4kL+0aeT40?=
 =?Windows-1252?Q?hCbSjqbFYqjcZY1bsnyOAySc8sa0VnqZPjVgIyww2V1+/IDhQtPe9O+5?=
 =?Windows-1252?Q?0UBAsQHN6Ji8lTGLGBRG7HCm4kLnXcTDeEOCPkT7h1KDZ2h0SsAnWYJS?=
 =?Windows-1252?Q?fJ4L+C2yp4iJMZg+hKjzDZQdHdI/o/b1112U4MxSW3N+DQOjWklGHRJ8?=
 =?Windows-1252?Q?65NRkQT9hoiTfdE+Epok3FbhtSHsWbszgSiuKwHFpRjiqUg+X/FxZXOC?=
 =?Windows-1252?Q?nHhRu+C+G7wgImVgw1pibgmxrz0imVztSTkvGiTyDRaPkqXdW7GDrAaC?=
 =?Windows-1252?Q?gVScmK7S/xudEKO4XVGL0wqr0xIEsu205/4WOB1lqyBJAU3MVPP7bSVd?=
 =?Windows-1252?Q?8018buq9VS6sajEWa/bRJERDaQXF/whXoobCSCAWihA6akzV/noU7WbZ?=
 =?Windows-1252?Q?nXXZJ0I15eLdRcaLOQ6UqoiimBNx+ypyzLsMB5jqXLpNP5mTEelv1jEf?=
 =?Windows-1252?Q?4sxxu0RRGdDRqiDMO4JhhMANz7Iva0muGlwOKjCfqPE36ytWRzCBb3n7?=
 =?Windows-1252?Q?HmtgHqcL5apL18QQGPIP6GqHUsclFcBGtr3YiffrlfvMvS9iFSwre0nf?=
 =?Windows-1252?Q?VqqRi+gYFyLl067Ys0P6jA43P7Lkc20uWJKBsFUmS9Z3HxyX+FTagRx9?=
 =?Windows-1252?Q?6poibhRGxF5zwCJEz1LdRZM5ZHOnzL7qRWwqHUW1KqKHmM2eI1FPJlup?=
 =?Windows-1252?Q?I0C2cBZ5RlhL/cv30xIwWqMFDOgagw8ga2H4vNASveVKUyIVH7cQSGIo?=
 =?Windows-1252?Q?JaqfGFH4Y+U9EPcyRudmXuwEkjnrzrCIOmNNIyd7wYU33DqJACxlzoBW?=
 =?Windows-1252?Q?5qqaSq49hVw9SEbI26OctjfYhNidfLyVxG5uLCKgqkrTE2PBH5wOFH3I?=
 =?Windows-1252?Q?0JnzYzFFFQi3twH3U+9NP8K5QuPb+oYCJP/jZpqVK5d9fxkZRxde0inA?=
 =?Windows-1252?Q?QTVVKsGTVCUR5I69ESPp3BlDJYF2PrUZ1WMznCRwTluXnzWBe89B+Waq?=
 =?Windows-1252?Q?mPes5QRLUaVDx1G7dbQie0AF3andDVOKoXd8QTWBMdxiYL6upkxtCBTH?=
 =?Windows-1252?Q?lnourkW/JzyW/gAK1Uo/E+SMeMU1ylK12aQihTjhJTRqnPEDQxhQlrRM?=
 =?Windows-1252?Q?PoVo5EdioXQASNicwJYYQDzsyEyqu90NV2vfVtMwpv7uub6ZNJKf37o/?=
 =?Windows-1252?Q?l1guF2Dg4p6eEKw5sv8Aw/fp3L2psz0S+VLZwidNKUUEYPEasF6X/hwE?=
 =?Windows-1252?Q?qg9CfUOGIQTyCuI1wN5yTCADD0Q/JBOPu3D6J62LzGv5I3iphIB6AjNQ?=
 =?Windows-1252?Q?EwkTM3a9Y2c+RZDxp5Xoc/rGFvghRIe5HqDjVoYO2LxMRLqv69XGd9D0?=
 =?Windows-1252?Q?lTk1VSJdzSqd6j93hxk4GUgdm2fK9PkVDLvOfyS7KsIUKSVW+ON4j/wR?=
 =?Windows-1252?Q?6huY6C7JhZg7AfHUruqdcv2krAm1zqV4hn9JrKVY6qnTLfV1LGadQWeQ?=
 =?Windows-1252?Q?n29N8QGD0T6LsfXeRelhOM/ROiY8+8/TKzfQuN87KI3kAyfxYx9SF0UO?=
 =?Windows-1252?Q?GFJMRvFAIDX5Sy+wadBuoGGCqdqJYivXmdjbdb0lHLlKH9v5umjP/IZe?=
 =?Windows-1252?Q?MeV4LMBIc+Qh5KNgE6wKKXGLVwhgIyswkRv5gqoeoiF/pNGCvbSs4aOE?=
 =?Windows-1252?Q?gE6zP60eDfQaZQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <E162B927FB6A8144A1150FC65A0F2CFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f947b07b-f4b8-4053-c464-08da1e22a45a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 14:25:36.0542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OgXFV3B9OA2i645ct8EPbqWW3ICtOJxHcDLfXLIrxGnaxCApj79Ux/nuMgGGnYvs8JH+1jX4g2SGsFv05rU6ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4368
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/14/22 1:43 PM, Jason Gunthorpe wrote:
> On Thu, Apr 14, 2022 at 04:40:11PM +0300, Jani Nikula wrote:
>=20
>>>>>> git clone https://github.com/intel/gvt-linux -b for-christoph
>>>>>
>>>>> There are alot of extra commits on there - is it possible to base thi=
s
>>>>> straight on rc1 not on some kind of existing DRM tree?
>>>>>
>>>>> Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
>>>>> from frontbuffer flush  as a base?
>>>>>
>>>>> Jason
>>>>>
>>>>
>>>> Hi Jason:
>>>>
>>>> I updated the branch. You can check if those are what you are expectin=
g. :)
>>>
>>> This is better, except for the first commit:
>>>
>>>  [DON'T PULL] drm/i915/dmc: split out dmc registers to a separate file
>>>  THIS PATCH WILL GO THROUGH DRM-INTEL-NEXT TO UPSTREAM
>>>
>>>  Clean up the massive i915_reg.h a bit with this isolated set of
>>>  registers.
>>>
>>>  v2: Remove stale comment (Lucas)
>>>
>>> Clean the commit message and send that as a proper PR to
>>> drm-intel-next, then everything else is OK.
>>
>> It's already in drm-intel-next, I guess the problem is basing the branch
>> on something that doesn't have it. I'd probably just base everything
>> cleanly on -rc1, and whoever does the merge between the two will need to
>> account for the missing include in the result. It's just adding one line
>> in the right place.
>=20
> That makes sense to me, especially if you can do the merge fixup
> internally in DRM.
>=20
> So drop the '[DONT PULL]' commit and send a PR to the next DRM tree -
> when that is confirmed send the same PR to vfio,

I updated the branch again, but I am confused. What is the purpose of sendi=
ng
the PR to next DRM tree? I suppose all the patches will go through VFIO? If
I understand correctly?
>=20
> Thanks,
> Jason
>=20

