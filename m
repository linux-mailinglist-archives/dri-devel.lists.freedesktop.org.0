Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70594FF820
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25D10E9E3;
	Wed, 13 Apr 2022 13:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4410E69C;
 Wed, 13 Apr 2022 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649857630; x=1681393630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4NU0nQxMd+rEUEbWojvr5CfKXJrLD5/8oQtBU5fwwFE=;
 b=ewB6AphG8N4IEfXckbMR1u8ByXBmileSaLFkNdbd8XwJtzsD8D/L7Xs/
 Jfqd7lGx+p/AEaBgVNCBXtv+BWftKjn+OiuoxnU8dzF5KTdfMOLUc4GWw
 2W7ez7UGFzavnwcI0y6/xonu0TTnsvA2qHUpzVcCa0lzSJVbkOXk8orok
 bQpQvvFNNz4OQ6kfGUFyPxpLgpisjl9heq8ZdpbO0YPQVVC1zpPpkwS3/
 AlPZ78oZPA0K7ZoJHLbD4FCChMMfkeBTgeVZCfs8esdVEr/VJgVPpWHFC
 37gZibn91G9ue13UjXzJ5zONMKjKSFhGMKwoZ7UUc48jwsUBzVdJq5OTw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="260261776"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="260261776"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 06:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="552206342"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 13 Apr 2022 06:47:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 06:47:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 06:47:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 06:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih8CxzIuYb9QPhD9UBeyEWgX1tvXKtk+nkitTjta0S6D2OsEsUU1CFk+DSFlOKaBcXJHVkFYHluZ9qlWBc40/3/TgwNEk2QI51sVpU1Ue2xwzUP7JA/4Sh2jjJGE5jTKCPdgrVwzK2QKerUDHZs8xlxG9Bwbl5B45ehTzHNnWNxBOhQzbPRZzMOc3lbkv47XBLIInBIlb5AQ2JtiE62RwvLcMNq0KQuswgF2ujKnJ0IQCLt42+iB/1Ho6FHNAnvHgmcBXaJ0LGVWccbN5UQdTsNNu9ihRS5yGPkrX2aQrMsWPX94ACjGa/Ngsfhi2WpE/7UTwlrJGWLnxXriOvkRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC/s2DTaEthEMYJWZOdFA0hyeSsK9uOFCc2TiYoZ7oE=;
 b=abTBAENPMbT2iqhuRr0YmJOQSXbMB1ZcQIod73s5KPE7FOmruyHf9sOOoH5tzz1dDXqiX7xK4MNt0naxnDenhu2eZrmsIzZ5TKEGrRKqsUcPoMZiW1V03XszQJiPz129QtorP7+bbSvWHyqLbnKJ0dRTZr/2dzuaBTHtelP8BS9z6/mUMnLq77WnU24ppjABioFcX7REmZzR2k6CNCXIJ5QSE3yaHTGSFtxDl56+sfDG3w+KLpQ2nHv5OSD5jIwF/4qVyJbwklg1L/W+gFqMqsQpRmMp4lVgedjL3JEAp5dB1+ZWsoXheE8FKPrYPMVkjeca4qMjPyNQHmU9Pk4iRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Wed, 13 Apr 2022 13:47:05 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 13:47:05 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0A
Date: Wed, 13 Apr 2022 13:47:05 +0000
Message-ID: <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbed6079-03c2-4614-a1b2-08da1d541886
x-ms-traffictypediagnostic: CH0PR11MB5473:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB547316E6AF406BA8B8ED10FFCAEC9@CH0PR11MB5473.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4MiKuTIb4SBm2fA3ndNca088gaqbNfqi2XopSvvWBOROgfpwV7WljDhFgighoSnt/mS16tkX5jLc4r5jED/JdlZd6RdALo4eUmMWaTV5EJtyljSXBYtShDt6HR589ocL8wnsvA5h6u5vHbeKcALCpXQLGSNUT4SVVEmzdsdD52+5h10CmQM5PlGFRjek8Pqn5mAkvqs6hYj+xY5/Lf9A8XChh6CpTlYpiWL1B1U9BE3pQb5ZJsCMtj9obogfPOhkdH3zyr6XGbCZBzW0zCaOolnYtpeAZIZvgvwxJcLA2t191RaNiPam+pyi5srXvGr1qHJskpR68P67zygSgPgb9uaRwMRO2o3zqDlc87Nu2MZrTfSWg5NK4CJYvkmG1ghEoF6H0eScywrd+qJIC9NyMmtZ3+v3uumfV2m5v5fAiHvJGP9kCyU2cqpFjl/gaQw0wZzyTKzMLiF5+45u7Jr5MBf/ZOqPXbPEFcht2yWwSXg6KfYn8Lxle05hk3d8CHBOPpset/ollxB62j9Yl/QEqWTlUEAxK2UqzJVydNqzr7VlPs+8f92qT6DzyqL2XNehmeB/Mn9XVXoQZMd5ucq4oqQhFLFKzj8hjVWcOx27rxW9vcp0vr81rLz/941XNfVgNZzWGCe49RM9Hp+Ot6NSl2+fD6Jl5Pz0CpixIANkPywBrQHtC5yUqkPDZVJ65CT2La5hJcssQvGospM7oeEejEpp/6Mhy6qF0Bgd5niTrHBeWJuFS0HddqEtNKBAoLA5SRrJUc5/zZegFdjeoAVbDnRzv53mnohB+QmJPd7+6xxjlGN3IlyvtRb53/262b5QuFtyEQiGBJybGNSXhYeytYPPuKDqp7vSggsmM+McH+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(71200400001)(54906003)(2616005)(31696002)(86362001)(26005)(186003)(8676002)(6486002)(110136005)(53546011)(6506007)(6512007)(38100700002)(122000001)(82960400001)(508600001)(316002)(83380400001)(38070700005)(64756008)(66446008)(8936002)(2906002)(66556008)(76116006)(36756003)(91956017)(31686004)(4326008)(5660300002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Omet3QpsO2mPqByo889kyZHP7cSYZ+RzC7KNBWjvswVvmauGCSjmOlvI?=
 =?Windows-1252?Q?tesmvt9o9VeNhNSW4eZ4H8pwQ11kQWOwXfvZl/uAukd+botiGxkNGTEJ?=
 =?Windows-1252?Q?wgf5LSY+aFL+bZxYpSE9XqQ3TR3Tr0Vcf+xxKGoWUoGFXD9K3XcOOnr7?=
 =?Windows-1252?Q?de4IboCuwh5auTnE8FoYEhqzpQ469dHdQNz62P3IHO0STBrUf3TRM5Yw?=
 =?Windows-1252?Q?7+SCNHpGtX8LrfdyfHaxDlpOtGWDHxASo97n0Mt+ZzIDkv1qsI/L0IQM?=
 =?Windows-1252?Q?o/z1ZOI9McR/n8fMO7RVH3T5cCfqaZD4BQZIZqxF2KASy0xYXMMdkmD1?=
 =?Windows-1252?Q?Jz4fG1IFhbTQdmytN+JGaGmkQLvL9ZyCTQ0v3WCKnRd4Mujyr3/DPqeK?=
 =?Windows-1252?Q?8DKHF90v+qqX+eyyFxwJPUEmspuxQeZ9uJROKv40D3ABCJk/3WYnQZDs?=
 =?Windows-1252?Q?mhXjrY2FDkKnz1Hr3u4JSw8lcvCVhj+4KwGuMqoRAAGOxHA1FRePRul2?=
 =?Windows-1252?Q?j1tm8/DqJbhFwO+zrjSRGYMsDF+yQ5FO1NfSVwY3aqlK4dNt/497JeGo?=
 =?Windows-1252?Q?+2bFTT4MDaSF7wU/U9P2aU2M6cxJddjv4d1JF6ZrOVNQKADlF1x36Kmd?=
 =?Windows-1252?Q?v1NwMa+rJz/lvBwkBRqfmt4tbT2tMgs13tu5Q13VlSyi+3Y90ELt94b9?=
 =?Windows-1252?Q?f/u/PlZ2bO7aakHxrKoRlnoKL6pK0PqH2LYN75bU5rozZ9D1Bg6EpZu/?=
 =?Windows-1252?Q?9ugKVQwkOlnxBrDRRaLjeiPkWMczNjmScg2VdKFq0Zk/8uXB2XLoc05v?=
 =?Windows-1252?Q?4EnisDk5qpgjQ/GBeNCWTU9ENFnHbIPzrgbPhL8JvwEOQgfd8gpWDZpo?=
 =?Windows-1252?Q?LXc3n5qij1bfhI/HV3UteGZkKhgROhnlkCKfaxCXNmhg2RZAJ+vuOGSX?=
 =?Windows-1252?Q?xX55p4R/H3VvAt6dxTDxYlbHo6VWYEqmL48apMHH3Xhgw7h0WXQeeyD3?=
 =?Windows-1252?Q?xVDTLBjBUaNmKyg6f0QSkge7oBYlhrYAQ8f8E9KvyCJVvfhdGkMqNsVR?=
 =?Windows-1252?Q?569sTTEynHvddVG5F0I67QKgzYKRHSTcPPNr/rbrJS85ig2agvDQeinY?=
 =?Windows-1252?Q?Cm7oPAo+UcJ9y7mMDzi9wwfCLZ3X9R6M5NfsNB09WGezEKJMEIFslqPI?=
 =?Windows-1252?Q?bx7aRaP6b+n/LdLp8lkdOU34/NLgoGYgjC06xIoA4Xi5zUffhLTTK6mj?=
 =?Windows-1252?Q?xmnAEZsOu6LIVqsvJUTdP0wzI8pStIjpjUtuNO6YFVN9ez170tm8UH7K?=
 =?Windows-1252?Q?IR6WBuaYQllRQOqUbGVgDT1q7JXNfBp8pqbEt5eMgRWXv7n0CDHvuoXn?=
 =?Windows-1252?Q?dedxkcc1BAmDJyk/QgmNiA38P+WmjibLI2z3mH3F6k0ZgYF+Q56X/RJy?=
 =?Windows-1252?Q?Mee2JOrpR2CB2mj2ccY2+22qjLxCBoB+ej7kTQAjURBz5pibDxAiJjyv?=
 =?Windows-1252?Q?MeT7FdBh2MZ59soznDkr2QDnIuTtNFgPJ7R3FX/uXqDOEcMAYGsqO6lO?=
 =?Windows-1252?Q?yAsMfKC7B3nNyx7aDI26YaRNDKqWaw6VLQhwr6HQtGYiM+rYkOapSv3+?=
 =?Windows-1252?Q?pEtHh0wytvxXQ+EHBcfZ8MvcVAjKOcLLvp0HdeRW7z1R5aore3V/1EcQ?=
 =?Windows-1252?Q?7K5FPZj+AuI7elhTHECyPHT/PiS8K8PPKZRMrqScUJs9n2zfTadz9yn9?=
 =?Windows-1252?Q?+I+UkTZPufrgDwX8URD6bHccMulfYhtESMcOLOQsQH0DZaWDP7jvwEmb?=
 =?Windows-1252?Q?GPm/7H9i9c/HXit5X2NGxbN+GrP+S51sD7nwlW6NCCL/wEImR3CdI1sc?=
 =?Windows-1252?Q?4DbsO5YZCDLAjw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <CD3DEA7297D4FF4F9D84E6F4185D103E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbed6079-03c2-4614-a1b2-08da1d541886
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:47:05.1031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXBrrnMhfWZK1AAwcvXR6OUJxuoVm1zG+fGSIanKxKcdBCJjNc6+PIGl1orewkt77ZvUpZjIlcw1hiOIIi7Qmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/22 2:13 PM, Christoph Hellwig wrote:
> Hi all,
>=20
> the GVT code in the i915 is a bit of a mess right now due to strange
> abstractions and lots of indirect calls.  This series refactors various
> bits to clean that up.  The main user visible change is that almost all
> of the GVT code moves out of the main i915 driver and into the kvmgt
> module.

Hi Christoph:

Do you want me to merge the GVT-g patches in this series? Or you want them =
to get merged from your side?

Thanks,
Zhi.

>=20
> Tested on my Thinkpad with a Kaby Lake CPU and integrated graphics.
>=20
> Git tree:
>=20
>     git://git.infradead.org/users/hch/misc.git i915-gvt
>=20
> Gitweb:
>=20
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/i915-=
gvt
>=20
> Changes since v2:
>  - rebased on top of Linx 5.18-rc +
>    "Refactor GVT-g MMIO tracking table and handlers"
>  - don't fold the gvt Makefile into the main Makefile
>  - add the mdev patches to remove the legacy interface that is now
>    unused to the end of the series
>=20
> Changes since v1:
>  - rebased on Linux 5.15
>  - allow the kvmgvt module to be loaded at any time and thus solve
>    the deadlock when both i915 amd kvmgvt are modular
>  - include the conversion to the modern mdev API
>=20
> Note that I do expect to rebased this again against 5.16-rc1 once
> released, but I'd like to get this out for review ASAP.
>=20
> Diffstat:
>  b/drivers/gpu/drm/i915/Kconfig          |   33=20
>  b/drivers/gpu/drm/i915/Makefile         |   31=20
>  b/drivers/gpu/drm/i915/gvt/cfg_space.c  |   89 --
>  b/drivers/gpu/drm/i915/gvt/cmd_parser.c |    4=20
>  b/drivers/gpu/drm/i915/gvt/dmabuf.c     |   36 -
>  b/drivers/gpu/drm/i915/gvt/execlist.c   |   12=20
>  b/drivers/gpu/drm/i915/gvt/gtt.c        |   55 +
>  b/drivers/gpu/drm/i915/gvt/gvt.h        |  125 ++-
>  b/drivers/gpu/drm/i915/gvt/interrupt.c  |   38 +
>  b/drivers/gpu/drm/i915/gvt/kvmgt.c      | 1099 +++++++++++++++----------=
-------
>  b/drivers/gpu/drm/i915/gvt/mmio.c       |    4=20
>  b/drivers/gpu/drm/i915/gvt/opregion.c   |  148 ----
>  b/drivers/gpu/drm/i915/gvt/page_track.c |    8=20
>  b/drivers/gpu/drm/i915/gvt/scheduler.c  |   37 -
>  b/drivers/gpu/drm/i915/gvt/trace.h      |    2=20
>  b/drivers/gpu/drm/i915/gvt/vgpu.c       |   22=20
>  b/drivers/gpu/drm/i915/i915_drv.c       |    7=20
>  b/drivers/gpu/drm/i915/i915_drv.h       |    1=20
>  b/drivers/gpu/drm/i915/i915_trace.h     |    1=20
>  b/drivers/gpu/drm/i915/intel_gvt.c      |  162 +++-
>  b/drivers/gpu/drm/i915/intel_gvt.h      |   17=20
>  drivers/gpu/drm/i915/gvt/Makefile       |    9=20
>  drivers/gpu/drm/i915/gvt/gvt.c          |  340 ---------
>  drivers/gpu/drm/i915/gvt/hypercall.h    |   82 --
>  drivers/gpu/drm/i915/gvt/mpt.h          |  400 -----------
>  25 files changed, 929 insertions(+), 1833 deletions(-)
>=20

