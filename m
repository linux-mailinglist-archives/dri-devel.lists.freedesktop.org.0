Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BCC500FA8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B0F10FC78;
	Thu, 14 Apr 2022 13:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394B10FC5E;
 Thu, 14 Apr 2022 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649943554; x=1681479554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9sR7owQE5ZUl2ihOUj2ae6wPFfL5eZk8LFuKWdqGElc=;
 b=BjiQU3aJdLT8LgY01FkJHTsuYz2AKbPQHAMywx/oRMwiBxX5CaCHpIKQ
 r5yeZ1pGNpPOoDW4ajg8FWFdv7ym9pvmrn/Rm47POpjNhJSfJ+0x9PkX5
 PcncKM7zblWtvqESH5bvvrofO3eAB80ncOwgoop5bYE90vq6K7i10JpLo
 t8/nXMSNSKkPxP/VyfWIwH8P3ggfWquJJq1YINsCYkIjC2lUIEz8JS4Wr
 JmxNPZ977nCriWhX3VYqJ/GTrAnwqNoOvf8WCDFZwEoDRVX05DfTFOmYL
 SmUmYBiqrJ4lyNXZ5eENqAQI7evbwM4j00ae2RCc9TSWSVRly+SLR07ig Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250226276"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="250226276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="552685035"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2022 06:39:14 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 06:39:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 06:39:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 06:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFHO/qkg5gVEOHDfRas1I8onh+73xlunnqK6xnHIzLT04U1OXIR35ul9JPxMRZuqmqZ2MqEQBuM7bw3hW6Uab7aeiJSPPMSHxiI2QEU4PxobIPVvxlRcG7TqiMxWkOSQTIRSYKTot4ZRvdaZyqSLz10f/A+1wUVDlhb/7QRA00DDTsIWHQqBIQDvkSuAii81UZpwjgBG9S4j9hrhXeoAcgymdjaC5ItxwgOVEARwqB94xOCW0sCCL+JUE8HXSuYHjFPxv//PPosi4CpKPIXK1kqOMNG9kUcqvfkZJN+lGBsodsNm602KaJcpZz7vaitTNdXCL8trbhCaezopoPKVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpOiaLmsIiqmI8LBhUp5c3LLqS5tzu63ud4aFs/us4E=;
 b=PFOoqi+5vNPij43M89toAiu3L3M9aTeR9fzxeW67qFgYIehCGdHesyNhmScxkkaqztaSgqo7apELY+aTAMZgvmv4R+y0UDGiTydhwU/j9R/5qe/gZptNTNLzobiIrftYji4FC4fBM1Vq8xWp4aTQMlHLFonUHDDC+TG2DnqLHYrS2ye1Q5Z56/LLod3jcETMtZbYs4XO3vurlkW3t1mBkwME1Bqc5s9yGKRp69QyIfbyaSw3z/3fd19sYLhot0OGxv+/iHMY/j2wF+XUfU6q4/EXnYk25q0dKBOan5fii60a4ZzgSokOCO+1nvqEEAaKYte1+NSjQ/T46YxLTCsbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BY5PR11MB3910.namprd11.prod.outlook.com (2603:10b6:a03:185::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:39:11 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:39:11 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0AgAAhbQCAAANggIAAeVIAgAACNICAANnfgIAAFJ2AgAABUQA=
Date: Thu, 14 Apr 2022 13:39:11 +0000
Message-ID: <ae3bec3f-b89a-2845-a924-046874fa38c7@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com>
In-Reply-To: <20220414133427.GB2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b41ae0a-7ff6-410e-9b01-08da1e1c28bb
x-ms-traffictypediagnostic: BY5PR11MB3910:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB391018D6CCED93CCC4A1169DCAEF9@BY5PR11MB3910.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cKoJ6hargtj7XxNhaGJECYRJVQA/2oTZebwYEk7Ynu02RVJHdMtSm8PdKvhul8TUGcD4qV9bHLk6woQs+Sz6mSDZ4WVk3Ivd3ijIo0P70zlbtItSVkI7dvzmWAu5C0uy3MG8Uy8A/MP3ykRLQte7VMvOBsRA07X7mmtQpMwj+7DDgug0rdOdA9WTvrX8cG4fM9ct1I8Iy61nfNrdKMYGHWoyvUqFLfaB7EFIr3xD3B4DvQXcDNPavJWo58Lff4ZGwg37Ln0geQCCHkGh0fh69l7cs17HzgqeW0j+R1D1pe5dxHP1AtNXLBjliNUPBwbf7orEwihXDSEtavSbuaLOVhCHXMXTj4R9V9JKa7nVNZFqHVd9DSaFPH+SRGfcGQv9g1AQawOSQOc4XCjJxqAkcHOFTrOrCrwb2TqZHf1+PxARxfQyMCyWRw2ZaklxSKqqj9xhO+iNT6ZZkXS0l5UcCioMomnNDNbnSRAC+DdadoZIDhZacTrfzDR+AKHVqXAykbt+tq9whybA3FTJKqNw1DIsF7AhshsoeMzRVt2eL0/4ljE0HJWcF/j6FIHPChTkOjLQlEo9LlHtvml/uBttTaG9OhsPgqlsUSA8B2tsxYGrxr6/DxYHAGEoRzgo4G2Mzvsu9cLjnkwtrKzXP3JuJgFxvle1y5QmaT70SGi7p1VrGmcDjtXHYS/Xl3AAdDHuhPFeRp006UG4SwCxaAfpb3wCf2YWunohe0lhUjIi58ok+RdUFqeC4tCQt7Kn+f1f5ohYLpWl7hp6dLsuK1+ZrISa8yMEoPucF3QOZBNGAWH3COOIIKpKwdNMzLEjEnt/sxCFfBBZWKFgZ+f+GCt2XoAiT9lwRgULmNor2ckcp+s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6486002)(66556008)(26005)(2906002)(186003)(71200400001)(91956017)(36756003)(966005)(122000001)(76116006)(31686004)(86362001)(83380400001)(2616005)(64756008)(38070700005)(66946007)(4326008)(82960400001)(508600001)(66446008)(8676002)(316002)(7416002)(8936002)(5660300002)(53546011)(31696002)(110136005)(54906003)(6506007)(6512007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?yYtR2VKG2pu1xVY3lBsFonqPr9yC0PX9Vg60xKJTuHTfiejK1GVptJFp?=
 =?Windows-1252?Q?VjduVl1AjcuQpKywz78dB+PvxfcgzoIRwHJHMB/CGGFuRXJjbMXCRPDC?=
 =?Windows-1252?Q?sFuFa+BzGHpYM/exNJgL3JlQVzRe2szNd4Fc5ZEgkDkIORmJRa9WEF6x?=
 =?Windows-1252?Q?ml6WgXGaz/Zg2y5Foi8E0pbiZ7Om6tqqXCtMyX6G4b/9y96OdMHJwbxU?=
 =?Windows-1252?Q?i60YM+k5QyA89RCEz/nSiND8aCbO9f68NcnLEIgZoZ4zA1r2csLc0DPj?=
 =?Windows-1252?Q?Clwq5YptzqzgAhTtIs4+wQoAHLOc0a6knZxmji9keEMuXzAMGf7cqPHS?=
 =?Windows-1252?Q?8b4RvUJMjTG7fYCkrj0KFv0sQeDcwElPFJ8fr2bFDxwsR7smFWm6ZE8+?=
 =?Windows-1252?Q?9RaIZc9tT11PdH3bAW62om7Qmfkm5KAPp1qnadFRGS6O6eMCQeZXwo4B?=
 =?Windows-1252?Q?KnQ+pYsLZiVn8UoC3vaI8Q5jvjk8NjMdyZhpjirK/UQ8753oadatbQ8K?=
 =?Windows-1252?Q?4sUvi8FG4xly22pM/heQ1mZM8phXDZMVzEC8e7umYPA+NNEONgqPqBMD?=
 =?Windows-1252?Q?D7TFvGkNVE/927AvE9U2wSQL0rQXKM92DHyGweeUpJskudvF2l1nDW1u?=
 =?Windows-1252?Q?IP9Qr7S0fYp5tEoayuoQkMruhJu7wGv68xwxdakKZx6oekxGKzey2dYt?=
 =?Windows-1252?Q?wzGCOIFhe5BiOoEwiPHhwrYKXfhHUhRSsLS4mS6t0HTYCXPzd9/lVw9V?=
 =?Windows-1252?Q?oF0h8I1TC6hTLC30DyasKGFDZ1Gz4OfMwXQy17aMWviZNdl675vvjrzi?=
 =?Windows-1252?Q?i6pIKhESwmm1fPq3+gmeVZOdknso6aSjKKASYIkL/ABLOliigSSdjUwy?=
 =?Windows-1252?Q?pz98bxUts7cck5e8dOPq7TE98FBaNXlzUlIf3MViDKA9/qERK9pcNj71?=
 =?Windows-1252?Q?nj/d9ZfJBLD3L7XOKcIQhHdBged+TMFgc+Z40dNuXHyQalKr5qmdHFae?=
 =?Windows-1252?Q?12w+2KkxXfEcpxapI5wxaLLcjgvtcPMAXyNUskw5j8dW0rtw9z21/6Rt?=
 =?Windows-1252?Q?qrJ8jC7v+HsgvMGINuyYR5E6ElJzfm23apVR46udADWzfRfw/iPTmBhN?=
 =?Windows-1252?Q?yA8lrYEr7F79X8u05/Obj0oYp5xntwZ8Ha765CvaLjVd0kwLyQj8LTtG?=
 =?Windows-1252?Q?sY7JJinkrmQEg0JvPn9VSZWTdzvYhoMEoX5FaCwvPIL9CVQjeZ3V6j8Q?=
 =?Windows-1252?Q?9hkv3abJ3TAhRQj6FUf1+3zJ/1blRlwVSj38LBHCuUq4hYLEEMjHOZw/?=
 =?Windows-1252?Q?jeRWf01xNjno4Fn5hnchXdVoc8w0vex+8FlzSwzY2IFyUBBQMmKoWb1T?=
 =?Windows-1252?Q?FyTYoROUZHf1zTCxr/Zif2dyfzHJttyKMapDJ71hNNF1vXeGsOs69xG/?=
 =?Windows-1252?Q?fAStxGMJb75oECBaKPJg84jYsHyuOvo6u2HSYzWuAIE3SR8/wwM3WDqQ?=
 =?Windows-1252?Q?4LM9lRKU+wfFRhrFrWvVbiK31motCnXlD3f8+mv1hw67wLm7egWBrCiw?=
 =?Windows-1252?Q?VLRFvq9Lte1nowthCpSLD46enfC1Ymj7GYYUuNgCBm07OnTqZM11630a?=
 =?Windows-1252?Q?HKb+HK0VdQsnlv/5FfZzbGPb2d3Jq77cZw0iiIG/PVv1C+j8z9SYJZQt?=
 =?Windows-1252?Q?9y2GV1REWl8DL3HbYq6KUh6kV028Z2+D/WEP5Zp1PDNVYgReyT91UPa3?=
 =?Windows-1252?Q?t/MzlLZKv5j1lqvN8ULeiIXug24YorB4mRPgPyOp15yP0fTqO3IMF3X8?=
 =?Windows-1252?Q?0/s+xz76ntC3cxn0dMYlwIOLF1+SfF4hFkec5zakEwgulDAHrgKNhrWg?=
 =?Windows-1252?Q?tSXobmMsdxcF4A=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <30DDE82D73B52F4EAB05A482BE55A01D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b41ae0a-7ff6-410e-9b01-08da1e1c28bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 13:39:11.6866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7PbbyxeUNHY2OBY1i8bGw6zdQBvfS3cmu6cMlvsW6BCyEfMJ7sPfSQzZ+SPDlUNgQsKyRcCEPcbWhl+y3pe4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3910
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

On 4/14/22 1:34 PM, Jason Gunthorpe wrote:
> On Thu, Apr 14, 2022 at 12:20:42PM +0000, Wang, Zhi A wrote:
>> On 4/13/22 11:20 PM, Jason Gunthorpe wrote:
>>> On Wed, Apr 13, 2022 at 11:13:06PM +0000, Wang, Zhi A wrote:
>>>> Hi folks:
>>>>
>>>> Thanks so much for the efforts. I prepared a branch which contains all=
 our patches.The aim of the branch is for the VFIO maintainers to pull the =
whole bunch easily after the drm-intel-next got merged through drm (as one =
of the MMIO patches depends on a patch in drm-intel-next).
>>>>
>>>> I dropped patch 4 and patch 5 as they have been covered by Jani's patc=
hes. Some conflicts was solved.
>>>> QA is going to test it today.=20
>>>>
>>>> You can find it here:
>>>>
>>>> git clone https://github.com/intel/gvt-linux -b for-christoph
>>>
>>> There are alot of extra commits on there - is it possible to base this
>>> straight on rc1 not on some kind of existing DRM tree?
>>>
>>> Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
>>> from frontbuffer flush  as a base?
>>>
>>> Jason
>>>
>>
>> Hi Jason:
>>
This one belongs to i915, which has already been queued in drm-intel-next, =
but
not yet reached to the top. When it is landed in -rc, I will rebase this br=
anch
on it, then we can drop this patch in this branch.

>> I updated the branch. You can check if those are what you are expecting.=
 :)
>=20
> This is better, except for the first commit:
>=20
>  [DON'T PULL] drm/i915/dmc: split out dmc registers to a separate file
>  THIS PATCH WILL GO THROUGH DRM-INTEL-NEXT TO UPSTREAM
>=20
>  Clean up the massive i915_reg.h a bit with this isolated set of
>  registers.
>=20
>  v2: Remove stale comment (Lucas)
>=20
> Clean the commit message and send that as a proper PR to
> drm-intel-next, then everything else is OK.
>=20
> Jason
>=20

