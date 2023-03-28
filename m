Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C46CCE09
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 01:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70110E02C;
	Tue, 28 Mar 2023 23:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051110E02C;
 Tue, 28 Mar 2023 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680046285; x=1711582285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JPwOeidT81c+CL8XiPE8ZVDdwshhVlQ7srAXiMhWumo=;
 b=j0a9/S/Ln19ocHOe9UMA0xEgt6AoP9MOQJLQaUleypWknabz5EH9JkfB
 2FuEQX4Sb0Nm4yE2PFXpSaYpyMFiarH1ySLR1Y/TBSqflNJ6WpqN7o9K/
 2fye/PTt62MvqQoNQrt3hvQ3x+Srrpxmx3AsrRrMWmrMVl85jAkUZ2GEj
 LPDgRAcAns+A1RwX6jdu6yKh38ZnnWO9mdogpEJfKKpHJKEUa5ncPfAPw
 NjJwo9k7d+lMYpYOqS6pkizJ9Se2RF4aZA7wYJope63i/Urw8DwAD6POg
 EdlPJi1ZFARMD/HK+WqA2VZUQiPeh95kWKYyAgaOH7Jw9ViCJhiZcl1uN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="340746609"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="340746609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 16:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="794997212"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="794997212"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2023 16:31:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 16:31:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 16:31:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 16:31:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 16:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c73jX76fTVseyK7EF33vfnbHgph93udm5rm8yD+HFQIvQsQqgP+l6tOEt52hZHucb4Uf1FUCLLiTRkBQAmZ7bFVzW9df/7IYsbUBwJjcz+Z0tRlAO4k4Js6AwiBSOPdi3gVICFx+8MMYcbLv71F0i27eVUXA0G5EcMbZ4IOozy1QuyaG8R6AaQNv9P1o5DhVLRNmXsLDZjxW8hPCShwG94HQmh+NXgx7aLT8QzwBbFv+jJBICLrYc46vW5xtNgFAcpzzItKmxLg8RqTcH4/L03KRQ4gzgKxB/WYsBpph2X8T2+67V+J5psBTSdYKEHEegTsSRHC4BgoTRnbh1/ujAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upS3++zINK5V4KdNBmwlf5NwAdJIadnxdCU3B3AVCig=;
 b=eE8ZxlhC2SELI3Xo6ZEdRjGa6HlY7CBCaNmancRVBrYHlHlPJ1J+Mp9K/VP98NP/43ZF9VXLIy4QUx40Z48EOUGJO71Kn23jma5Y8/jAyVkfohEfVfrd5UR51Kjr7cVKAyQIXHsw7e0zKJ13QCamEhp7TjbrmqLT5Ax1OYkh5wb24bgKcNJ30DJDkuE0TMDP/vgcRp6fQZSnuOc2ltW0AoY3XV8L66Ib0r2qxwqPfBdXSBgUWuATGLM3t59oZ5pE2UnD4XA1av+I+mbHlJJn+1f0hML0Dt7dPKcU/hOy8sxo7eHlgXxkHH9lyz42dip4KIBDVIOt36qX2hi2pErXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 23:31:14 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 23:31:14 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Thread-Topic: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
Thread-Index: AQHZXhBB7uOyLXjkJE6j/B6WLXpQ2q8Q2trg
Date: Tue, 28 Mar 2023 23:31:13 +0000
Message-ID: <SJ2PR11MB771527702FC1B562638E67D1F8889@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-4-lucas.demarchi@intel.com>
In-Reply-To: <20230324051754.1346390-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: 287ecd1e-a69c-44be-54a0-08db2fe48544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SDe/yuIA/NjZWEnIjs6R9Bic8A5oyqP4y4JiTKPjrj0RV/628Y66eB5eiL5bWl9ZnXajugN4dUaiUTrjsmECOdblcmLzVevbPO8OOQeZCpzHSXsNTC8sonBh5CSECwypjMfYKRO8ol7VlHtnOvnO3K8YmZPyvybzLcJw/Wyv4JftugOfz3z9cUF8o1zPERtvAI/iA8ueqj+MqmAa0LDLxDWkXiCpdyDLfiQl79x3U9B+rnM5etYpk7eIfnd4BD7e7ZxH6IuAh1tJAF8ApCOS6WquIJl4wEA5xOnWE24fu0uI0OYIiSuAeRVp9NMb/rm1CV8kr6+zBYYUpMOzqVZ63VwOcqyhkENAjWHfs0b3nF+KPqPEOWyk/8bxzswSk+ozwhvcx6D66MyVrPrCS9taglSSRIszVPhRviLe9UTJ91K80JHmzHrLThozVW33csJmXT7EzW2NUVX17Z9PVOK6wKdfOj4ItYOYnXxUmoR0Nb/wnfyhgc93Tr8S9JO4spls8HXT+BZqK3GYNFyLB+xwXqkQIOdeQj5r5zsJ64Ftd2cCsHiWvsc9Tw3WpsvieHiKd7g9hpss+X2jXM6qTMcHDsRef6TS/YJ7YblfPvoyVoyPXP4dpz44U8rgha5z8L7Ke6hIMIpanMm+gXkoNKqxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(2906002)(83380400001)(64756008)(66946007)(66556008)(8676002)(4326008)(66476007)(478600001)(54906003)(7696005)(71200400001)(76116006)(38070700005)(26005)(9686003)(53546011)(316002)(110136005)(30864003)(15650500001)(6506007)(55016003)(186003)(52536014)(86362001)(38100700002)(41300700001)(122000001)(82960400001)(33656002)(5660300002)(66446008)(8936002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+CtWMFdhMgGEuzNxzp6JkWCKysOS+xzwMppu81qe7q5dp3v1JTPwtipv4iFB?=
 =?us-ascii?Q?AJTTCzeOtXZd+dLtfXkrkifP96GFAIsPmLZ5j4P8u1sEOR+HVn3+n+r/inGB?=
 =?us-ascii?Q?qB1dlYu5BAq+EaAPr6FShL++dQID8M0QTJk3b/6aXkB7Ucis9B9QxpmHMZaN?=
 =?us-ascii?Q?ADKbDIWzMaYYRo/tugPPfmncsJCIzURbORzPM3csT9DosJBIOY7wwz4A7Iih?=
 =?us-ascii?Q?grZgE2XCaYaBrEN2d48uWyZ+rcLEP1HkjLAcfkkLOTy8/vP8im1UQWk9DGdE?=
 =?us-ascii?Q?cBl44YcURVKUyruEgvnIY91AYaU8QJrxT6mx6NvKzolURRTTI4rxmZiFrZ/k?=
 =?us-ascii?Q?LqaPiGTfKU3OKFEKGF4jXU53SumtuIxoOmuQ4wkDzyFx+IR2Bq2ATeYF3Vmd?=
 =?us-ascii?Q?H2p24953IgBq32zSggnS5rOiAIoDK0ggsGotSmScchG5CSAyGQyPCwW3g1ue?=
 =?us-ascii?Q?pkPg/4bjZuAsWW4RXVkn/KqwSJraK8/HvKF9FipsUcZ/hxlegmUKuO/z8Ae+?=
 =?us-ascii?Q?Ls/mKziBtXBRxT0+BBxBJ+MdPGIArPZ4EKD1PQbMJDXWk3oxH7j6hvAW9xR0?=
 =?us-ascii?Q?ktea9/u1du7mKcvXGMBxI5baA77YXjij/KDYDGeJaWAFM9+rrR/RvhZoS5EY?=
 =?us-ascii?Q?ws6bcJWVPzECcshId4jkzUr7M3b/uCGJ8PseL1sZL4g/O5uQElMqzRCbuAiW?=
 =?us-ascii?Q?eDNZ+tfd7FJ3AznZAedDSyTFLpptQNQF7gLtVEMocjBdKC+Cnq7Z6vgf7X9f?=
 =?us-ascii?Q?2IEH/j5lZ12+DhialTXHaO8U9xPv4XqsJmCnvZdPnvDfSfnK5+EeLz9tZxom?=
 =?us-ascii?Q?JbnOuH5bQKkovq6S8o08JkTyUQmJ2Doch7fU8mb4fhEs8HR7bkYqYUk9Aza8?=
 =?us-ascii?Q?Q86aqDeF9hrqGgTyi3K9aqbAOsKIp10BY16Nq5IclPszNxyzLw24mLERJEK5?=
 =?us-ascii?Q?vR3Avp0LjoAvS2Yebd/1N0mbDTkd6uoUEyKbLmS1ZQbF/j1mtJ3Hh8NLWofc?=
 =?us-ascii?Q?pXehkkFHqMvtgjCSedLPXYRY+XK3qs5ISSagc6E9nqcopi+6QSKT1g9ntJRS?=
 =?us-ascii?Q?hmJW+YHE7vcxQgzySESE92DH3tVZ/XXvwrFmiy7vwvv+3T9KXE303LyAycBh?=
 =?us-ascii?Q?MZ0uchirlCwwJoRHwwu7PEeObT2ET6DEOetJoTnL/j22Qudqgc8lfooX2ZUv?=
 =?us-ascii?Q?JWZKF4G5WigMtTBs+EYiE1v/1z22f9bm0PVEC5fJk24VNN1LFA8OgZkW14QE?=
 =?us-ascii?Q?uANn7RZLlaojG8ivvbgUwQ5w8ybl1KQyQxWv9fPU78O5RVWgFWJOaUNfmQ15?=
 =?us-ascii?Q?BFOHWzGHeLtJwMb0WbkUhbWndWlINWL1fxWxeItbbRBDeWolSX4HjU5BLFzj?=
 =?us-ascii?Q?FxoiGQ+KHpql5XaMNOqUllcEhRJqrnuOyCN8fvKktHS2fy5GcyMngL9ucepX?=
 =?us-ascii?Q?grqlxAHTNQypjm3zOWU39XBJOa2FkcbTLa7RnTZgQ/5Bb2RvZxh1alsQqGLe?=
 =?us-ascii?Q?p5/ewHJTjs0FrAd0/K5y0WscKeK53pcJYhk0iPATBWv2HnRxrJEYi8v5tCxA?=
 =?us-ascii?Q?ZGFizcdwLE8qvXIEN3bywvR1EEnCT0dcAQhDiuNI+gcBfeZwBnOxBnN2VOT4?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287ecd1e-a69c-44be-54a0-08db2fe48544
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 23:31:13.7579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcSg4SWfnwNJRuWDppnIuH13Zu5DTusjiAX/FJh1vcLvlpLP78NTNWaKu5jgQKdrWrp16WWtdbbAe6PmaknYWG6LPeze/VQKOwHKD7yGYCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, March 23, 2023 10:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org; Danie=
l
> Vetter <daniel.vetter@ffwll.ch>; Dave Airlie <airlied@redhat.com>; De Mar=
chi,
> Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
>=20
> Update the logic to autoselect GuC/HuC for the platforms with the followi=
ng
> improvements:
>=20
> - Document what is the firmware file that is expected to be
>   loaded and what is checked from blob headers
> - When the platform is under force-probe it's desired to enforce
>   the full-version requirement so the correct firmware is used
>   before widespread adoption and backward-compatibility
>
Extra line ^

>   commitments
> - Directory from which we expect firmware blobs to be available in
>   upstream linux-firmware repository depends on the platform: for
>   the ones supported by i915 it uses the i915/ directory, but the ones
>   expected to be supported by xe, it's on the xe/ directory. This
>   means that for platforms in the intersection, the firmware is
>   loaded from a different directory, but that is not much important
>   in the firmware repo and it avoids firmware duplication.
>=20
> - Make the table with the firmware definitions clearly state the
>   versions being expected. Now with macros to select the version it's
>   possible to choose between full-version/major-version for GuC and
>   full-version/no-version for HuC. These are similar to the macros used
>   in i915, but implemented in a slightly different way to avoid
>   duplicating the macros for each firmware/type and functionality,
>   besides adding the support for different directories.
>=20
> - There is no check added regarding force-probe since xe should
>   reuse the same firmware files published for i915 for past
>   platforms. This can be improved later with additional
>   kunit checking against a hardcoded list of platforms that
Extra line here.

>   falls in this category.
> - As mentioned in the TODO, the major version fallback was not
>   implemented before as currently each platform only supports one
>   major. That can be easily added later.
>=20
> - GuC version for MTL and PVC were updated to 70.6.4, using the exact
>   full version, while the
>=20
> After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin sin=
ce it's
> using a file not published yet.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c       | 315 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +-
>  drivers/gpu/drm/xe/xe_uc_fw_types.h |   7 +
>  3 files changed, 204 insertions(+), 120 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 174c42873ebb..653bc3584cc5 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -17,6 +17,137 @@
>  #include "xe_mmio.h"
>  #include "xe_uc_fw.h"
>=20
> +/*
> + * List of required GuC and HuC binaries per-platform. They must be
> +ordered
> + * based on platform, from newer to older.
> + *
> + * Versioning follows the guidelines from
> + * Documentation/driver-api/firmware/firmware-usage-guidelines.rst.
> +There is a
> + * distinction for platforms being officially supported by the driver or=
 not.
> + * Platforms not available publicly or not yet officially supported by
> +the
> + * driver (under force-probe), use the mmp_ver(): the firmware
> +autoselect logic
> + * will select the firmware from disk with filename that matches the
> +full
> + * "mpp version", i.e. major.minor.patch. mmp_ver() should only be used
> +for
> + * this case.
> + *
> + * For platforms officially supported by the driver, the filename
> +always only
> + * ever contains the major version (GuC) or no version at all (HuC).
> + *
> + * After loading the file, the driver parses the versions embedded in th=
e blob.
> + * The major version needs to match a major version supported by the
> +driver (if
> + * any). The minor version is also checked and a notice emitted to the
> +log if
> + * the version found is smaller than the version wanted. This is done
> +only for
> + * informational purposes so users may have a chance to upgrade, but
> +the driver
> + * still loads and use the older firmware.
> + *
> + * Examples:
> + *
> + *	1) Platform officially supported by i915 - using Tigerlake as example=
.
> + *	   Driver loads the following firmware blobs from disk:
> + *
> + *		- i915/tgl_guc_<major>.bin
> + *		- i915/tgl_huc.bin
> + *
> + *	   <major> number for GuC is checked that it matches the version insi=
de
> + *	   the blob. <minor> version is checked and if smaller than the expec=
ted
> + *	   an info message is emitted about that.
> + *
> + *	1) XE_<FUTUREINTELPLATFORM>, still under require_force_probe.
> Using
> + *	   "wipplat" as a short-name. Driver loads the following firmware blo=
bs
> + *	   from disk:
> + *
> + *		- xe/wipplat_guc_<major>.<minor>.<patch>.bin
> + *		- xe/wipplat_huc_<major>.<minor>.<patch>.bin
> + *
> + *	   <major> and <minor> are checked that they match the version inside
> + *	   the blob. Both of them need to match exactly what the driver is
> + *	   expecting, otherwise it fails.
> + *
> + *	3) Platform officially supported by xe and out of force-probe. Using
> + *	   "plat" as a short-name. Except for the different directory, the
> + *	   behavior is the same as (1). Driver loads the following firmware
> + *	   blobs from disk:
> + *
> + *		- xe/plat_guc_<major>.bin
> + *		- xe/plat_huc.bin
> + *
> + *	   <major> number for GuC is checked that it matches the version insi=
de
> + *	   the blob. <minor> version is checked and if smaller than the expec=
ted
> + *	   an info message is emitted about that.
> + *
> + * For the platforms already released with a major version, they should
> +never be
> + * removed from the table. Instead new entries with newer versions may
> +be added
> + * before them, so they take precedence.
> + *
> + * TODO: Currently there's no fallback on major version. That's because
> +xe
> + * driver only supports the one major version of each firmware in the ta=
ble.
> + * This needs to be fixed when the major version of GuC is updated.
> + */
> +
> +struct uc_fw_entry {
> +	enum xe_platform platform;
> +	struct {
> +		const char *path;
> +		u16 major;
> +		u16 minor;
> +		bool full_ver_required;
> +	};
> +};
> +
> +struct fw_blobs_by_type {
> +	const struct uc_fw_entry *entries;
> +	u32 count;
> +};
> +
> +#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)
> 		\
> +	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))
> 	\
> +	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))
> 	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))
> 	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))
> 	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))
> 	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))
> 	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
> +
> +#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
> 		\
> +	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
> 	\
> +	fw_def(DG1,		no_ver(i915,	huc,	dg1))
> 	\
> +	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
> +
> +#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)
> 	\
> +	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__)
> version__ ".bin"
> +
> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)
> 	\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## .
> ## c))
> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)
> 	\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
> +#define fw_filename_no_ver(dir_, uc_, shortname_)
> 	\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "")
> +
> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)
> 	\
> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),
> 	\
> +	  a, b, true }
> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)
> 	\
> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),
> 	\
> +	  a, b }
Why is b required here?=20


Anusha=20
> +#define uc_fw_entry_no_ver(dir_, uc_, shortname_)
> 	\
> +	{ fw_filename_no_ver(dir_, uc_, shortname_),
> 	\
> +	  0, 0 }
> +
> +/* All blobs need to be declared via MODULE_FIRMWARE() */
> +#define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)
> 		\
> +	MODULE_FIRMWARE(fw_filename);
> +
> +#define XE_UC_FW_ENTRY(platform__, entry__)
> 		\
> +	{
> 	\
> +		.platform =3D XE_ ## platform__,
> 	\
> +		entry__,
> 	\
> +	},
> +
> +XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
> 			\
> +		     fw_filename_mmp_ver, fw_filename_major_ver)
> +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
> 			\
> +		     fw_filename_mmp_ver, fw_filename_no_ver)
> +
>  static struct xe_gt *
>  __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)  { @@ -
> 37,123 +168,38 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
> *uc_fw)
>  	return gt_to_xe(uc_fw_to_gt(uc_fw));
>  }
>=20
> -/*
> - * List of required GuC and HuC binaries per-platform.
> - * Must be ordered based on platform, from newer to older.
> - */
> -#define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> -	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> -	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
> -	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> -	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
> -
> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> -	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
> -	fw_def(DG1,		huc_def(dg1)) \
> -	fw_def(TIGERLAKE,	huc_def(tgl))
> -
> -#define __MAKE_HUC_FW_PATH(prefix_, name_) \
> -        "i915/" \
> -        __stringify(prefix_) "_" name_ ".bin"
> -
> -#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
> -	"i915/" \
> -	__stringify(prefix_) "_" name_ "_" \
> -	__stringify(major_) ".bin"
> -
> -#define __MAKE_UC_FW_PATH_FULL_VER(prefix_, name_, major_, minor_,
> patch_) \
> -        "i915/" \
> -       __stringify(prefix_) "_" name_ "_" \
> -       __stringify(major_) "." \
> -       __stringify(minor_) "." \
> -       __stringify(patch_) ".bin"
> -
> -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
> -	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
> -
> -#define MAKE_HUC_FW_PATH(prefix_) \
> -	__MAKE_HUC_FW_PATH(prefix_, "huc")
> -
> -#define MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, patch_) \
> -	__MAKE_UC_FW_PATH_FULL_VER(prefix_, "huc", major_, minor_,
> patch_)
> -
> -
> -/* All blobs need to be declared via MODULE_FIRMWARE() */ -#define
> XE_UC_MODULE_FW(platform_, uc_) \
> -	MODULE_FIRMWARE(uc_);
> -
> -XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH) -
> XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH,
> MAKE_HUC_FW_PATH_FULL_VER)
> -
> -/* The below structs and macros are used to iterate across the list of b=
lobs */ -
> struct __packed uc_fw_blob {
> -	u8 major;
> -	u8 minor;
> -	const char *path;
> -};
> -
> -#define UC_FW_BLOB(major_, minor_, path_) \
> -	{ .major =3D major_, .minor =3D minor_, .path =3D path_ }
> -
> -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
> -	UC_FW_BLOB(major_, minor_, \
> -		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
> -
> -#define HUC_FW_BLOB(prefix_) \
> -	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
> -
> -#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
> -	UC_FW_BLOB(major_, minor_, \
> -		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_,
> bld_num_))
> -
> -struct uc_fw_platform_requirement {
> -	enum xe_platform p;
> -	const struct uc_fw_blob blob;
> -};
> -
> -#define MAKE_FW_LIST(platform_, uc_) \
> -{ \
> -	.p =3D XE_##platform_, \
> -	.blob =3D uc_, \
> -},
> -
> -struct fw_blobs_by_type {
> -	const struct uc_fw_platform_requirement *blobs;
> -	u32 count;
> -};
> -
>  static void
>  uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)  {
> -	static const struct uc_fw_platform_requirement blobs_guc[] =3D {
> -		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> +	static const struct uc_fw_entry entries_guc[] =3D {
> +		XE_GUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
> +				     uc_fw_entry_mmp_ver,
> +				     uc_fw_entry_major_ver)
>  	};
> -	static const struct uc_fw_platform_requirement blobs_huc[] =3D {
> -		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB,
> HUC_FW_VERSION_BLOB)
> +	static const struct uc_fw_entry entries_huc[] =3D {
> +		XE_HUC_FIRMWARE_DEFS(XE_UC_FW_ENTRY,
> +				     uc_fw_entry_mmp_ver,
> +				     uc_fw_entry_no_ver)
>  	};
>  	static const struct fw_blobs_by_type
> blobs_all[XE_UC_FW_NUM_TYPES] =3D {
> -		[XE_UC_FW_TYPE_GUC] =3D { blobs_guc, ARRAY_SIZE(blobs_guc)
> },
> -		[XE_UC_FW_TYPE_HUC] =3D { blobs_huc, ARRAY_SIZE(blobs_huc)
> },
> +		[XE_UC_FW_TYPE_GUC] =3D { entries_guc,
> ARRAY_SIZE(entries_guc) },
> +		[XE_UC_FW_TYPE_HUC] =3D { entries_huc,
> ARRAY_SIZE(entries_huc) },
>  	};
> -	static const struct uc_fw_platform_requirement *fw_blobs;
> +	static const struct uc_fw_entry *entries;
>  	enum xe_platform p =3D xe->info.platform;
> -	u32 fw_count;
> +	u32 count;
>  	int i;
>=20
>  	XE_BUG_ON(uc_fw->type >=3D ARRAY_SIZE(blobs_all));
> -	fw_blobs =3D blobs_all[uc_fw->type].blobs;
> -	fw_count =3D blobs_all[uc_fw->type].count;
> -
> -	for (i =3D 0; i < fw_count && p <=3D fw_blobs[i].p; i++) {
> -		if (p =3D=3D fw_blobs[i].p) {
> -			const struct uc_fw_blob *blob =3D &fw_blobs[i].blob;
> -
> -			uc_fw->path =3D blob->path;
> -			uc_fw->major_ver_wanted =3D blob->major;
> -			uc_fw->minor_ver_wanted =3D blob->minor;
> +	entries =3D blobs_all[uc_fw->type].entries;
> +	count =3D blobs_all[uc_fw->type].count;
> +
> +	for (i =3D 0; i < count && p <=3D entries[i].platform; i++) {
> +		if (p =3D=3D entries[i].platform) {
> +			uc_fw->path =3D entries[i].path;
> +			uc_fw->major_ver_wanted =3D entries[i].major;
> +			uc_fw->minor_ver_wanted =3D entries[i].minor;
> +			uc_fw->full_ver_required =3D entries[i].full_ver_required;
>  			break;
>  		}
>  	}
> @@ -227,6 +273,47 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw=
,
> struct uc_css_header *css)
>  	uc_fw->private_data_size =3D css->private_data_size;  }
>=20
> +static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw) {
> +	struct xe_device *xe =3D uc_fw_to_xe(uc_fw);
> +
> +	/* Driver has no requirement on any version, any is good. */
> +	if (!uc_fw->major_ver_wanted)
> +		return 0;
> +
> +	/*
> +	 * If full version is required, both major and minor should match.
> +	 * Otherwise, at least the major version.
> +	 */
> +	if (uc_fw->major_ver_wanted !=3D uc_fw->major_ver_found ||
> +	    (uc_fw->full_ver_required &&
> +	     uc_fw->minor_ver_wanted !=3D uc_fw->minor_ver_found)) {
> +		drm_notice(&xe->drm, "%s firmware %s: unexpected version:
> %u.%u !=3D %u.%u\n",
> +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +			   uc_fw->major_ver_wanted, uc_fw-
> >minor_ver_wanted);
> +		goto fail;
> +	}
> +
> +	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
> +		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended,
> but only (%u.%u) was found in %s\n",
> +			   xe_uc_fw_type_repr(uc_fw->type),
> +			   uc_fw->major_ver_wanted, uc_fw-
> >minor_ver_wanted,
> +			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +			   uc_fw->path);
> +		drm_info(&xe->drm, "Consider updating your linux-firmware
> pkg or downloading from %s\n",
> +			 XE_UC_FIRMWARE_URL);
> +	}
> +
> +	return 0;
> +
> +fail:
> +	if (xe_uc_fw_is_overridden(uc_fw))
> +		return 0;
> +
> +	return -ENOEXEC;
> +}
> +
>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)  {
>  	struct xe_device *xe =3D uc_fw_to_xe(uc_fw); @@ -308,19 +395,9 @@
> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	uc_fw->minor_ver_found =3D FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>  					   css->sw_version);
>=20
> -	if (uc_fw->major_ver_wanted) {
> -		if (uc_fw->major_ver_found !=3D uc_fw->major_ver_wanted ||
> -		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
> -			drm_notice(&xe->drm, "%s firmware %s: unexpected
> version: %u.%u !=3D %u.%u\n",
> -				   xe_uc_fw_type_repr(uc_fw->type), uc_fw-
> >path,
> -				   uc_fw->major_ver_found, uc_fw-
> >minor_ver_found,
> -				   uc_fw->major_ver_wanted, uc_fw-
> >minor_ver_wanted);
> -			if (!xe_uc_fw_is_overridden(uc_fw)) {
> -				err =3D -ENOEXEC;
> -				goto fail;
> -			}
> -		}
> -	}
> +	err =3D uc_fw_check_version_requirements(uc_fw);
> +	if (err)
> +		goto fail;
>=20
>  	if (uc_fw->type =3D=3D XE_UC_FW_TYPE_GUC)
>  		guc_read_css_info(uc_fw, css);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.=
h
> index bf31c3bb0e0f..e16267e71280 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -175,6 +175,6 @@ static inline u32 xe_uc_fw_get_upload_size(struct
> xe_uc_fw *uc_fw)
>  	return __xe_uc_fw_get_upload_size(uc_fw);
>  }
>=20
> -#define XE_UC_FIRMWARE_URL
> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
> firmware.git/tree/i915"
> +#define XE_UC_FIRMWARE_URL
> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.=
git"
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 1cfd30a655df..6c595aaa2399 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -78,6 +78,13 @@ struct xe_uc_fw {
>  	const char *path;
>  	/** @user_overridden: user provided path to uC firmware via
> modparam */
>  	bool user_overridden;
> +	/**
> +	 * @full_version_required: driver still under development and not ready
> +	 * for backward-compatible firmware. To be used only for **new**
> +	 * platforms, i.e. still under require_force_probe protection and not
> +	 * supported by i915.
> +	 */
> +	bool full_ver_required;
>  	/** @size: size of uC firmware including css header */
>  	size_t size;
>=20
> --
> 2.39.0

