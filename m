Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614A752FF3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 05:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBC510E0FA;
	Fri, 14 Jul 2023 03:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823010E0FA;
 Fri, 14 Jul 2023 03:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689305303; x=1720841303;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dApz38ImqeZbKK2JlvssIXHNwsms8EyRpPnmW4aMvyg=;
 b=ZrFwfyHPGHmdm29jLJ63fa8QPXw0U4VGLwc6O4YVucof4KQfEPsq3Xxz
 Lmxl0r8DDtKoLd6H+gOUL70wRkidZcE9Y+xiqiR/udaEgm9TT7+V1nGMg
 FzW5ZFDMGoJcRRukX217lhSoa6vqw20+oTPHaFBN7X/jxEBYfbILz/mpv
 ByHFYrBNNFxoCZraiednz4hTxrpS1sS7ACKXQrowUHmLsq7zPnJVe5g2Q
 QYCU2rPXejD1AGtygN2xEa51qeMgjYYNOqiqfAvpAi7EhQBNxl1B3Fr4S
 ftTTcdCvloJIiMFTXm7BqJpUXX4z3otji8+0gmW6AnWFvW4HiDsbjIVeX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451741801"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451741801"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757422563"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="757422563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 20:28:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:28:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:28:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWoEY6VhOBt9wri7ZONmolvuqDZxbpXdPxV6SzpkgkklkZnDX+ANK7HWHBfMeOsyJcXADdIuErW0p3d8o9Uitf2O8nlhqCiX7Ki9wP3xukadLPVdx8vjwe2Ru4BOcEG6pRzjkHkMDIfSvVGvGxNMsWrgG5jphoxGvdC6y0puuYSMpm27z0raHUoHG8vcNqUrQv+FMyIDmt2BqZvfTPdFLmtd1NrClKq82uZBEDy7jRzAfzAds8yNOEOt882qlTexWI1FejBc47aKMVIkRVUJcM3Myty+zsvcZ9GrWPXF0GSh4/7q9si9noHSVwmFO+m5nVHL16RwS55qFpJx4QwB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbGB5zOKfQNrj0sH5VlCVQ5ExyQn7uFXU3varlfKQpI=;
 b=d3Y3+mwmISR2A5pfitzhZkuZd11sjq76xNUXiodyNcppQSOcU47fq21Nz6AqZp8Dy+hnhm7z5vvcQv3roI9Y7Eo/nvcoH+IL2PsbAJNp+iednHik2VVQNB9qM/RBOZ0roxiGNZCx+Nzc8Zbp+rE67t2ECPAnBdf0h9vaLuze70E/EG5LvDVp4vruougVOpvmrwFkEiQNZqnRf9VlW3M5Hwuv6eTQUc9E88LnB2Orh1FlpBve+D86kBEDzXISuRqwzBEgrY5SArtYQtPpZdXGOIx8PsIDxozCNeYjEd4CwIZTXFcWo78mrbkis6stgaGoD9bXCCMiWxQqaxJbpl1T4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3170.namprd11.prod.outlook.com (2603:10b6:208:64::10)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Fri, 14 Jul
 2023 03:28:19 +0000
Received: from BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::fbc7:d70e:14d0:6e2f]) by BL0PR11MB3170.namprd11.prod.outlook.com
 ([fe80::fbc7:d70e:14d0:6e2f%5]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 03:28:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 08/19] drm/i915/dp: Remove extra logs for
 printing DSC info
Thread-Topic: [Intel-gfx] [PATCH 08/19] drm/i915/dp: Remove extra logs for
 printing DSC info
Thread-Index: AQHZtXYwcPoqMLxbZUyxEMxF29xTRa+4m1vA
Date: Fri, 14 Jul 2023 03:28:19 +0000
Message-ID: <BL0PR11MB317039F3003E7C3FFAE4C8E2BA34A@BL0PR11MB3170.namprd11.prod.outlook.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20230713103346.1163315-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3170:EE_|CY5PR11MB6317:EE_
x-ms-office365-filtering-correlation-id: 1a17601b-e527-400b-63f7-08db841a5e8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4wietz8of3NUfezTUOUXW+lT9F1Ax+5xZ6rJZI6072xiAKfFStqgqQpU7sdqGqp5ZLQIRjScUxwkvHhG4J/2N76P6RGMyS2NsAv/smfY3mq53kuYSugfrxDLxFIUUhFKqqrX/80RMrwGuonUVlv6aOb1poUV9P7hkDpW6bTKfKQdvNj1ERdJ6HdxW+iW8tfvcjmj2jDVg9YQcXwCLSvwHRMWZUERIUXjZNGdQmJqg4yUdfhrnW0xwblUFfVvMcEfA33kwsM+mYbq6LptgO+k6m+l2jkMpOapAJVuHQ6s40e5bofvMfM2nRuPyDLmjC5OAs8ulSXuqyqyCQ18s0gTFTfi6lT9ZIbR8m19D9K+RM9x3Re7ab9FL4lbQPy6GdgMGuTIAUyNsIpI1PJyzM3KS9WJDtjiPytMI9sX5ev+30kFOYhbUzb1IheRUkfDZ8vgWXFT3BDxhIbm4BxikGUnn77gXecUvKkIJonQ7bOp2apTmbKB42+JOlt4uRRwTps8lxGzhQnxcokZv7eIO6rVJww1MTCRiAYdDegWK8grQF9adUbjTW6NDm1DTu8wJrco2ba6C9VQDtAgyMxziTDuDu3cZ3l0qw5BCTzLA7gRJGzmVLT6OkuzseF+Jt3kHDup
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3170.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(2906002)(38070700005)(122000001)(82960400001)(38100700002)(83380400001)(55016003)(64756008)(66946007)(66446008)(76116006)(71200400001)(316002)(450100002)(6506007)(66476007)(53546011)(66556008)(186003)(26005)(41300700001)(33656002)(478600001)(7696005)(9686003)(110136005)(8676002)(8936002)(52536014)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ziRbb8K/V529NXk8FgTbnb/s4phYIGSfOsU4uKGzpZ96UJO0POYOTOa/S/0G?=
 =?us-ascii?Q?M/LyN4XtMIxgCXaxaaHuDzbp1JVOhF7H6em/ZdbwprLGMHGhs2yWVXiuUOzm?=
 =?us-ascii?Q?PlmShFNMbL7yG1oJflMV1BetSA/7Kn6DJFUxXzP0y1OH/Hs+lVd7BNm5L7c+?=
 =?us-ascii?Q?kOHNBCXBHgqIygTdk06JkCZULq0zhOIR4MIHZdOQG1xVOx3VQqDUMJm6x9Vx?=
 =?us-ascii?Q?d4fN7uAX8Xp0LWSfyvpfvKXq57r0oVhBG8+q/wyJ24MPZt8Pl+4VFghzdiP8?=
 =?us-ascii?Q?oqj+OphSoOO9nbWnKQRq+ASJOK5wuZW8t3K4Xrrh9K6MZUfg4usnhx6D59IZ?=
 =?us-ascii?Q?aUo3M2U85iozAbS1pk5Wl3lleGTIU6Qm6Cckcv77FCG2gHWmKTB8QTk34BB0?=
 =?us-ascii?Q?qHPApLRdP7et024YBStWAYnIt9TlkucUuanjDSS6JR0SV8HTDIGYVCJnxv9M?=
 =?us-ascii?Q?5w8gkui6MxQRlkiH2WuVMOrsBL6DGB+jVvZi73kOKZYETn7bo+yji75YUHuG?=
 =?us-ascii?Q?Qu5TCBIm8nWb75U04Y1KurdArXyJKktBDvEuYUN55xWllxzj7/gc+NKdzefV?=
 =?us-ascii?Q?Rzgv6i1mX6ozhcOhHJspumytb/VjYiarlmeOFcZJFgWmdy8kOhXLgR7k0o2v?=
 =?us-ascii?Q?Ws0bgNiH824Lnq+aIibsYCi8tMlzFnBzgSHnLYm1gD+yuYTLd3nElEH4MqSI?=
 =?us-ascii?Q?7BFt45A9mUIBLljOTpp8uTHrjyy24Nwsui+/qmvOrjpgRSF+fmmQi0oaEHCj?=
 =?us-ascii?Q?Jc0MHOSqvLaPE7TvHXMsz4Hi9j482NpHtXVPlGjVUvTwE7i/yrnvPvgI1IOz?=
 =?us-ascii?Q?XTVxBGklGs/yzhem0TQWD/AJbS4dMr9hypQKFySdho8VjBMuWulcruxqUS0d?=
 =?us-ascii?Q?ztSLQ5YQdO5sWAPKdjXiTlW/aeo1z8N2sh0K83g3xvsgGxYHeWkZK7LlYchv?=
 =?us-ascii?Q?ad5dV8dWvIPPUOz8kYRtTmF5sRUx3fcne0P2V9mMMYTnTNFVRcz1e89kV3Hv?=
 =?us-ascii?Q?zqRNf/oj/lLwiYXg4GAeAmPZ6p0ikA8l6FGia14n2nRGqPqbOYQY0iQ9dh5n?=
 =?us-ascii?Q?1YEHyTewZgOSYEEYrA9MIEZio0NJRVaaZg+Md26y/J4NM9+WbzlE5CGdUUE3?=
 =?us-ascii?Q?uVEexM3jBNBWInrnQDuXSTOLaeu5i6UMN9b4hszZ7DGYlO9Jg1o3XH71/bGb?=
 =?us-ascii?Q?udO7Yjb4rL0NYq8FVY5Zm3sCTYf1l0n+1odLeLDIqdNYc/n946srya6NSefT?=
 =?us-ascii?Q?G/O6ysR4/H1bY63Z1+aQM7Suf985+HVlIciJGvECcpHfYsL2wFmhbWqWcx00?=
 =?us-ascii?Q?GNE5UCksBXKtQ9nFj02WrKYztNRkn88r9iZ5YDAkbtrkuevUMEfmjldFzwKJ?=
 =?us-ascii?Q?TveBGxxSt9fdMNWUMEmlWfFLAK1AZblqAh2osM9kvLhOegi7Mgu9COdl6S78?=
 =?us-ascii?Q?UJi5tAT7/zCEvbRjIU92/1iL1qRU9mO1CEAmuhz4W3hvj2pJHDJKM0NZPMCW?=
 =?us-ascii?Q?c8zqLJauBahBTLUO9PHlNOtpRpEgujMwUl0BEDojBi/aM6wvpX+VL0BvZ2F6?=
 =?us-ascii?Q?qK4M5lR7CCtANC2m+PDWXcCX7GtnjRkTr4No4OOE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3170.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a17601b-e527-400b-63f7-08db841a5e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 03:28:19.2600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMJPr0wEl8qxW4c/T4fTZDg1+WZarl/FiFR1lRGZdEGYUmUl1AHqWleeIVweMDVwjpH9w+oJFJVXVfH0/Sj6VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of An=
kit
> Nautiyal
> Sent: Thursday, July 13, 2023 4:04 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH 08/19] drm/i915/dp: Remove extra logs for
> printing DSC info
>=20
> DSC compressed bpp and slice counts are already getting printed at the en=
d
> of dsc compute config. Remove extra logs.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_dp.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index c1fd448d80e1..23ede846202c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1780,9 +1780,6 @@ int intel_dp_dsc_compute_config(struct intel_dp
> *intel_dp,
>  								output_bpp);
>  		}
>  		pipe_config->dsc.slice_count =3D dsc_dp_slice_count;
> -		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d
> slice count %d\n",
> -			    pipe_config->dsc.compressed_bpp,
> -			    pipe_config->dsc.slice_count);
>  	}
>  	/*
>  	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
> --
> 2.40.1

