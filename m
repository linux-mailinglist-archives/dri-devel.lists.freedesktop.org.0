Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC04EEDE2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DA10E02C;
	Fri,  1 Apr 2022 13:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A76110E02C;
 Fri,  1 Apr 2022 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648818778; x=1680354778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rlStFOOfCiFrb+mHGMRB2T/Ur/0vnq+9sP5mQv+HsnM=;
 b=XBVBmqLVZ/yelTHhlZvpKFIXv8wrDNWICAydLcOJtOcQUbYYyRtcy211
 pfS7cMSuycU/nhDLXbojUDsedCdz/D202fhQTk2JqkpxTg3/O0joy5f1P
 m8I69/yU1cjL81GUXt6FAV4otkailv5Ggkwvbf2yOczhsNFuNThYNeXTJ
 kCZ++RpWaa+MB9GOL5eLSUjhNrFhQvENwA1xOMOyLVMF0vmlbnq0Qdflb
 j6L+Hf85Y1FVmXzOHgOMo18Az0nyR3qvBCt+4BP5Zsu04e2Ao46n3HV8A
 e/Sg0JB84Ihf+N5iWfFZUS1vlTo9+7303nNfk8OxLEThBvxlturfHzisK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260312705"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="260312705"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 06:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="521388127"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2022 06:12:57 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:12:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:12:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 06:12:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 06:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8CCMblvkt+fMwPVDILNkX/A7w+UOulSBM7gsucfZRZZI2K6BJIe3H2SivEh2t9ljzO9/zwcF/+RmXV9dEg+lbhFHBg8RZ62frltUkbXiOXBjI+xM8K5jBn0s04qjJX9GfmDzR455pl8oC9rQG7rjOHDEeuQdi+q2UuuTzHKAbCqFb8rSlNItRgzTZaneHxhmcboPMxt6yd2/gTqQNtnwiCNnygNIjcepRM0q5x9xY2N4gN8b+CH6z2Eadf7bQkcb4jtEJU6BLK7uwiJ/1GcHL98y5salIXNgBZK8aOkW7YLfrhYEN4HihM3+0fvSbrpWWOFi4lx0CV+iMnsCHU1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlStFOOfCiFrb+mHGMRB2T/Ur/0vnq+9sP5mQv+HsnM=;
 b=l2MCBVbrmX9j+ioMw9W6TkmJHd+aEgzdGge3asDBBbesDz+Gp1JBJPBXjNqZS5FsaBFkPbb7V7fRmJOM4mrBL9N+OYJ6Osqt7oeGcpT3gacpWreso9TsoxC5p3GAtT4yfT5GW4980AjsRb07tf6uPfJ0ocOSPrtIO3iT2l5Zmn0VJNtY7FJExx/DrGpO4H5sMe1acVx+TWBw6Em13isaDtYvDZyVxTo7w5ATueBEOEeZO/00bk0k+WTbgWGf1/qMszJCoo4fgYYnwpAT2ErqVGZzUKOnXhTbnvBlncKl+j8vw5/B+EMBIslZFM3bLo985hp8gvsSV8I9+BS8ewhmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.27; Fri, 1 Apr 2022 13:12:54 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6807:ff2e:9ac6:4d3c]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6807:ff2e:9ac6:4d3c%5]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:12:54 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>, 
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYQHGFbzTs9dpVNkulZ3C9zD1FsKzUXz0AgAS82gCAABTDgIAB4qaA
Date: Fri, 1 Apr 2022 13:12:54 +0000
Message-ID: <2817b81e-df97-fe03-4ee6-59861f4258ea@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
 <20220328065008.GA29798@lst.de>
 <4af59d97-b583-4022-3ec3-360e7df43689@intel.com> <871qyibkay.fsf@intel.com>
In-Reply-To: <871qyibkay.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3c695b6-e5cb-4c2f-0bc1-08da13e1550e
x-ms-traffictypediagnostic: SA0PR11MB4670:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SA0PR11MB46708E98BD232D068DFF82EACAE09@SA0PR11MB4670.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: StN0frbQaoHBdVf68Q01OL51C6UPVAI1vE5VNLI4eSbOVMo8wIQ4nHBuB7Fy3mlenU+nY0OmWcjMAu1oZL8xknFbyc63UkUPSnCRAalCh6iMBy0eSYenjgpZQSqQlVjOsEjgbnCuZcrk46qv/HnL7VaqYi4NuVGF41NRO9Z0XIv1k0aN0Q+AxsFUVakzQkjraaqXBCk3e8TfwQSMvnwXx1u0vL+eahPk4e6GfQN+VNJpmefdDo08ZyVkkOl9EwD2v3vFpxZYmBSbGw9ZylUaZlDsa2KBrXVXx4XzXzqYAgftAWkitwViWiDHop/upK3fwYFK59oYbar6Bs9b9MGe7MZzcNPHzpgClweqT/YvWHSffCMELfOvgBpM8Ez2rx1nFV4qRvCB5zWc0pjYpyWoA7iOcUDjyyYXoSQahLW/GnQK7nUugTh2h1ukhv5jso9Xru7TyJ8783KW3pEjZrqlcqzPs+ndnPA2ZXbpDb5gRYda/6aV4nXqjWzM36YXBR8n5dJe1qj8ujjNSagdRNp6ek9AQrAtOEwkw47C17VHTP89mF9AQg2fm2SCDWXKNAUbVm1Il961TPWDVNPiH3Gdff8ltd1X3atLctPrCEzWTbUu5uRIF/rF4oW8D60kCrSZp1my7FQ0GirBZSiE6R/q64b3J7DxtyJmBAH7hl29k53bnnPB19lnXcGBQ4Nskmt/C1qh+Ihul1IUVsXp71z2jBjeI2xn7NWz6v63VYatKWySEVp9a18KdvjJBUhgl2exSUkWJ4YdMc57gE0ZaQ8nVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(5660300002)(110136005)(2906002)(6506007)(6512007)(36756003)(53546011)(2616005)(316002)(31686004)(83380400001)(54906003)(26005)(186003)(8936002)(7416002)(71200400001)(91956017)(82960400001)(6486002)(4326008)(66476007)(66446008)(64756008)(66946007)(66556008)(31696002)(76116006)(122000001)(86362001)(8676002)(38100700002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?/b8VO5AHYa8hOaq5hbnfILImKw+nV6Rd1v8BBK9rUTA4pE+/txy1SLRb?=
 =?Windows-1252?Q?gv4qV1lM/tqd9fWpqXtFmKJ7Zbx6UHLTifgAncoyLqDPdHQvIdx6NnFy?=
 =?Windows-1252?Q?/JllWkcaS4WindnCZNSCw9MvVAIyqfTW8dVy3UmjABrSniiUelwbHz26?=
 =?Windows-1252?Q?yy9ylTU9lmYZZC+k61eyPLE0XlMn44RgXE1v8k0+ZOSHZAJjJqVu9npZ?=
 =?Windows-1252?Q?4hfpYjDgR95IPo9iTbpI9+Jt9lRxjT+LFamor3DqQZDLmmSNoz+JukXI?=
 =?Windows-1252?Q?H6mTYSBGR+SSDdvwAEUWPqaNkbEJyiTBjQW5T6tf9N/pjDNcRwXoS892?=
 =?Windows-1252?Q?brn26BabRwSk598bl+VKc2z7gzsgwYmSUul8C1l7j9nsB2r9/hLHjcbR?=
 =?Windows-1252?Q?SZ9yzF0jK7hUf2km7Vd331n0K9BgYVtgxdfDUHVdcfTmrAusjfp8grrx?=
 =?Windows-1252?Q?fNvxzhNcuDDRkydabkoygOgUDrATHHhb25mOVYSD7rGlVMvKZaDVAkm+?=
 =?Windows-1252?Q?Mjc5WVwcoXI+xn3DvuO2LIL74V2Lq+xlDN4VTV3cBugzC5ETDUO84H6x?=
 =?Windows-1252?Q?jsn4TrMUv4qC/buDXLQQUmscMWbjnGgxVDHtYkApLFEJONVkvX5456Ta?=
 =?Windows-1252?Q?HPztM4+FbXYONkhaWdbXvMkOJJySxpkd/pc1Sc2e+NtJ4sHlfOap4pcP?=
 =?Windows-1252?Q?FEuFWLQQ0P1Lhti8ObQp6wFJMywFXN9YYJW46JowZbmyr1Yi8SrnyADV?=
 =?Windows-1252?Q?xkQWqLIrC2HjTrTHDmhkyxOeWUUTzcE95UwP5HHCHJbnr94UoJPB/hZQ?=
 =?Windows-1252?Q?XaYEswpnu7jmOI2fWNdxlCMGA33o7Bli5w4uU6xDLB1LyJ/Z9LUdtPLN?=
 =?Windows-1252?Q?ytc2iNDiEBHzjqpERs1kOpjPjqSEwcxHkw2+UGfc/JnCrDrUuicHBHnG?=
 =?Windows-1252?Q?VrvsNjv257m+HM5d6djeDAMklkmok+mCk66X3O/miIu84JDy5CKlOg5w?=
 =?Windows-1252?Q?B01OlF+oM+FT7Hq9ih5LBbBRoianvEqrEGSOXS1NxKNujLzIi3xYBJ+N?=
 =?Windows-1252?Q?IzDHMArSSEIVlmLNmWibYWBZZa61Oqe1Ivk0xYVYfbZbVotvSqd0gSsx?=
 =?Windows-1252?Q?nQt7IH5DwHZ2SaeC5aLIS3r8Hou9ZTAquv6kvuNMQ2wCmaJi6NOI+vGK?=
 =?Windows-1252?Q?XphTEwNMd47xYzoaGgIXHuftR8AyjMIhUOyOuo4MfPd6wQ+qxv+Eg7eh?=
 =?Windows-1252?Q?60+CTWMn4Uy2siE6WRwOKneSlCB6DB1Zzz1o8GiPjL3cDQRnYVeiqr+f?=
 =?Windows-1252?Q?lmvLVLhNouymCexaN81+PiaUWpF9BRmCZPiL55FmzB7JiS+x1ph4jBF4?=
 =?Windows-1252?Q?+AW8/05u4HrbjtsKUJLY9WcuB0IwsnMDQQJrt/cPaa/fngL7oBib/BaI?=
 =?Windows-1252?Q?07fb6oAbPfq86UbQDOtOuZbfISEohnjqxqh834VWydNOEeHjf6T9Hsbw?=
 =?Windows-1252?Q?0bvtDbks1CEptIbUqrf9DQ165bPjk8zZMTLHh0EdXBZHRQVfroNnrE/n?=
 =?Windows-1252?Q?Dyv7UWwiCcTTCcB58Ftx6XyBGJp4IegKJm9RN85ELN6R0aU0d5bk9p8D?=
 =?Windows-1252?Q?BWTkHRtVWsUdsqB3KCWdfCxOAagtBEEWcNhEI9D012DHQ/j8YMrFyXU5?=
 =?Windows-1252?Q?pH16ul8S772bi+qa3QMbLCjlby4yHYGc118UP6xdkLjAwV61wIOnxBIc?=
 =?Windows-1252?Q?mPyAjUNufXYUk6DGPl5vNznXT5XCFwJy2bDyareHC9D1eAclrPUPGrer?=
 =?Windows-1252?Q?GmCVDO0ruIaGzV8+vMzpieXcIFCxmc61gRD2LaLFlyxEbEvYNASOoftm?=
 =?Windows-1252?Q?FPqvBFmaIfM8kg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <668DCEA50334564B8EC4049587D44C7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c695b6-e5cb-4c2f-0bc1-08da13e1550e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 13:12:54.0649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6IexrAZPdzN0gPJ+o+D8fmxL2txz9/QzDfYHhQ5aMXZprtDPGH1MvhRYdzxh7ng1ayVioUnof2wVcrXwgbM3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani:

Thanks so much for the guidance. :) I included it in the v8 patch. :)

Thanks,
Zhi.

On 3/31/22 8:25 AM, Jani Nikula wrote:
> On Thu, 31 Mar 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi Jani and Joonas:
>>
>> Are you OK with these patches? I noticed I need to change the license
>> of the new file. Will do that when check-in if you are OK with these.
>=20
> Use SPDX license header instead of the full text?
>=20
> I don't know much about the actual contents, I'll leave that part to
> others.
>=20
> Seems that you are dropping const in a number of places where I thought
> you could perhaps retain it.
>=20
> Also in drivers/gpu/drm/i915/intel_gvt_mmio_table.c:
>=20
> #include "gvt.h"=20
>=20
> looks bad. It should be "gvt/gvt.h". I realize you can do that because
> gvt/Makefile has:
>=20
> ccflags-y +=3D -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
>=20
> which I think should be removed.
>=20
> I sent patches fixing this to give you an idea. No need to queue them
> first, I can rebase them later. But please make sure this builds without
> the ccflags.
>=20
>=20
> BR,
> Jani.
>=20
>=20
>>
>> Thanks,
>> Zhi.
>>
>> On 3/28/22 6:50 AM, Christoph Hellwig wrote:
>>> On Fri, Mar 25, 2022 at 01:52:49PM -0400, Zhi Wang wrote:
>>>>
>>>> v7:
>>>>
>>>> - Keep the marcos of device generation in GVT-g. (Christoph, Jani)
>>>
>>> The changelog go under the "---" line (also for the other patches).
>>>
>>> Otherwise looks good:
>>>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>
>>
>=20

