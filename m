Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B045676423
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 07:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06B10EADF;
	Sat, 21 Jan 2023 06:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BC910EADF
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 06:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674281674; x=1705817674;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JqiHp9KDlAkq6Ptzvqljz6gfKt5swDzdkA4sHbA8qlw=;
 b=PClFO3Ea9NaweWamgbtyP1dQ0g6zUkXyYD9zm2NS4l/+q7AYLLsNqAr6
 UYkc5bBBzEyVxhzies48wMRyEtv/2dp1htixcIU1+L7jAsu4PTicPihPc
 F6temudVFO8VhC8P0ACphvKa3dXOE2C3FZHbI4eXFS/nUZbHykAYUZiWv
 ZtC9sboXLGHQNCoYFvSCsazowBbjCWtXE8XWvgjUxu4VtEMFktZk5dSfQ
 xD/Ulz1dZn7CLr5tTKybDxt4lREfYdmF+GZ0nx1z2CdaCo6KuQyJlPJd7
 20A2jvE1+kt5yi8FSEINu6Ou4OH+VVOP7K37rdvEdpVBv8ZEj0+M1iNFh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323451445"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="323451445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 22:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749600049"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="749600049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 22:14:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 22:14:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 22:14:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 22:14:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 22:14:28 -0800
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Sat, 21 Jan
 2023 06:14:19 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%9]) with mapi id 15.20.6002.028; Sat, 21 Jan 2023
 06:14:19 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Topic: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Index: AQHZLQZn9U3vWVdqMEyhYK+5D+AZPq6oZGPw
Date: Sat, 21 Jan 2023 06:14:19 +0000
Message-ID: <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
In-Reply-To: <20230120193457.3295977-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|PH7PR11MB6524:EE_
x-ms-office365-filtering-correlation-id: 8772b82a-1a93-4071-f866-08dafb76bb31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2K3/d9bkfg+edV2AO9UUuXpabOB6QDLqGA2Wh1LB/WbsWKOoVVOUtjvRGiDI+bYPsDQrasgrMfRk7d03urboOKhYhM/utROjk60b7eu+ij/V1fQYPng7PCD6dl/DINvIEPxNav3En+/txAweLGhl6QlX4LAzIxb2f0Jt/0PQ8d7xq2ZdEQOkx6CziWKyzwfTlPw/hJHcaurByIg4zzFsL2NPLgQcYMTa7DE7XipuB6U5TpK272HcNcB7sQzLiYQZanIs6GG9WlCPtlkjNMC10wdiI3uNYbcEwBgeN+tYcE5e/cf8/Vhrh2pHzMI3FfaBivCRcNkxQIEjq40dFTAjdUpd10TntRBZNq20gkFJvCsTODw/7FSVU+wYlnu1UBQWSQ32JrPiJRbpdJ5ptZ7xGfKqtusuWo5aNRhWL8n0zyvby1t/VGiCyWBzjHtU8pQW0s85IjHoq7doVQSYLLY3Byt7txpS/8GCfRdUFOAKtcK6oB17u2H1XJTVIVoVUksF40HS3oOq4Q1INnUPPZbEEMytWkNWM5/UPrOhLOKKCG6yOX5dJQ2H+WGad4oS1t228CplHbpUnjezKdHfXeJdWBo4fTUDLrCRIZ9ySkzMTcm9xdCjpo9YeoUW3SUdwGk7lo7cHGdSENV4WUYk2mg4BUlz1y5pSGajnJYqZLBk+5PROe+j8Tfdh0v51rijIrEaLSn93CHHOGKYbKZaeTBtQ17O61HaRjuDivpXWaMAk/Iern2/ARwQw9gHXs6XePT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(316002)(478600001)(66476007)(66556008)(122000001)(450100002)(76116006)(2906002)(8936002)(66946007)(5660300002)(55016003)(52536014)(33656002)(82960400001)(38100700002)(53546011)(7696005)(54906003)(71200400001)(86362001)(6506007)(38070700005)(110136005)(186003)(8676002)(4326008)(66446008)(64756008)(41300700001)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ek7/srSgP6zgeDfZu/x/nsIX8slbNhooo1Gp13DC1Hroyp0JBjx6gBqskI7r?=
 =?us-ascii?Q?vnEw5pzQE3fI5nx0YB886K9tB/TVb42JsMHY2j2Ynf5iYC6LttgFpebf/pKD?=
 =?us-ascii?Q?1hSbAanG8DSCCPq1tz9r2vh1RUmoiijEtPaxWbvLn0+sdaoM6TQ+OMCJDSEE?=
 =?us-ascii?Q?My8Tsde4LkJ8M0xgUGyqSIOBvPXU94wOb1LGYvWqT3o868+u25gd6ZgoQErn?=
 =?us-ascii?Q?rTPCvSZRYM2pu+DZYQx+ecNsUn/MQceXyvYhBOhjxPuzs9POU+WGkwwMedT6?=
 =?us-ascii?Q?SgE6uEDIObxgiz+7na+9H/zHffKBHVmzSvBvkQOvooiTVh0uwgCO+sFzLy4b?=
 =?us-ascii?Q?PhkmRTB2tLCzzeUzG53ZMzNodxKDoWhzyesN6IrfwPROUuzSW+zipIRn6NT8?=
 =?us-ascii?Q?TYQW96oxlJjWERvIFLS/hX59jbV6OWKgLjT/FLyakGcIyEGRd9g7r61T5i5F?=
 =?us-ascii?Q?3IO7L3krg69ufYwlR2xB6RgbTxCZhNQGywaYOJk/CC8ENQqMIV6WzqUlnc8G?=
 =?us-ascii?Q?+cq0Z80Et8sxidQZVe12SSwBq701WkmUrPvrtETvGik0GvfcUXfU3rIg1rrC?=
 =?us-ascii?Q?4zWv6VyEPyF/z4fJOS0njzsJEZz6sbobm5zge7L8hnscvij2lXZ0Vp35bixn?=
 =?us-ascii?Q?KX9xAPlo0psViDPqbS7rfNlUrND12BcdB3sm/mxmrvHAxF5irFQ8n607p3lB?=
 =?us-ascii?Q?1HgUCkTfvw/NEnSFu3Z9jONqRW53AkyPMCr6ezwEJuQ7nGu0d65klBkGinYa?=
 =?us-ascii?Q?mN69hS+mXtI0vg8dERFeqKn3vXUvR1gNwn9HwVBLjlMVCCOlygx/rXopSaga?=
 =?us-ascii?Q?ZACswdMqGVis/ByP5rPI9Z2ixvahO8oPQ/iS+VgTYjeil66Mh0imxv5tkO9L?=
 =?us-ascii?Q?G5HJQ+szlljTrESiOE3Kpq/csZdXIvBysiQu0fgNKFtGo4nxH5wDy1oI5V4e?=
 =?us-ascii?Q?N+wWo3SBxKw8vYkWQs0DO0CTrFTYOXcgqui4q4qzk8ClBxHSfI3P9ei00UtO?=
 =?us-ascii?Q?/yGrQTQlGAvMmHbsiqbGauJhQvelUoreWPakL2x7hxP2pcmL+SPNLYykxmAP?=
 =?us-ascii?Q?n+K44Ya0bd4cJkcKxf5afUxhuENnoc6hzFiXIxcmdlhV7WbN0aXXSEho42hU?=
 =?us-ascii?Q?RmGWQQLqZcd3cu6UMpCnfcYllOBtyyKou2Bn97cuaQLL4GKmkazGcEpuxmJh?=
 =?us-ascii?Q?9fuUuJt38k2nbbD9NrvwVTU84/dwQMjDics8gRQt6MO21cHx/V0/zLiaEbHp?=
 =?us-ascii?Q?p5yrB21b92pOmJD7ncblqy7dOkXfgUaHa0FDDs4m4FKjp8rgzn6Fh3Bko8rO?=
 =?us-ascii?Q?EniMjjYV6HUcvbeNfNICnxeOiUmaRnMwHaaj2dd8xCJJeL8ry+1gtvlTU6LH?=
 =?us-ascii?Q?C7q9rquQxEtzDP8FNRz4CD5XjYPw1T7agTOVAwZNs34E/Mt5QkVGrATahhw0?=
 =?us-ascii?Q?COfp6YIA4PC+ozcHKKELUgsKUT2oh6f6HZMl9cBkxyKAZrxnJQXWhEa09eD5?=
 =?us-ascii?Q?G49s9yu+CBJNp/1AZetYQH27D7rH5fLSkzPEoU5sN6GEZyNW6CEW1zn1ss5a?=
 =?us-ascii?Q?k+G4rNoy09vba0gTaTtxnbVH0aAN8OQXJvUSE+3+SodkGVDDrOORDFncDmUS?=
 =?us-ascii?Q?SvOLjdT1MGcj9sG9nijo4vCFRhwIqn90wW8m4jGaVKnfK5k6HT21vrta0dsZ?=
 =?us-ascii?Q?2b6+cQ=3D=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8x269metLb9w2FHw5owLpNFgz4ZHIawKEflkK67eQ29zQx1lECCqvHl2Hy9WAMAH5O82OsRPyT09FhehkwEdssK0+dYy2P4yNg1A9T+apqmGT03xWxvWQJgmh0CpAUTrEARQWaVU4F7VpOEwNuSIQp20/APpNSjEPLQ4O2zuDVRFtZ4zsRhPQ+gADfqpyzGWwk8wzcNgu0xNTD+ahKvtRE/yxricsJzAcAlZ8OsVWb5jEoctbg86d0DXAK5xtrnZP0qgKf7jSA4oPmTL01vhGSLvGRb6qDArF8AWOcLRPe6FDMa6JyRL0GGMOkUlM5cKwjRObBik7Mj+PQUdHiZ1g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm2wFuxEUIcX3Cq2lbGDcx3bszf0ujX4LlWxo+Y7dGQ=;
 b=EvEL39RQrphRsovtw/taBwW1jRVLQiFOZpXXDpvO7baL9IOpIk3jUvphsuC3BKIYS54nensae/knL1kVLZo8nSD27AnBBIF820ebYg6dVjAAVKOlhs2IW+frRmPj0zxbvA87O5vT9oqP6IRamE8ztK+QMxCFQRYGMTSJPdvLdfWgyvYysvACKxEELsf9I/SD9ljzOZZaXo0ga+M5qrVYprNHXgFqSYEBGm3VWrqfVwGlkTFQlhns/zhCzS4HQEhp82z8deVtPBOn2nGl8po40liCN57I1jWDm0deOVXQ1nYRSnZBedqyysIIj1qzTdfvAz8OeDTEaXbqEXNPZK9fxQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 8772b82a-1a93-4071-f866-08dafb76bb31
x-ms-exchange-crosstenant-originalarrivaltime: 21 Jan 2023 06:14:19.1204 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: Y4udqRKJ6MWgmEeqNYHO3tSVguFk3PJrJ2cfMYN9lRLYMNRz2C0IbW8vOgakNY3O8aUtP3NIzy55pspqbqybPHLDEW5A3GhqPWedCRsDM44=
x-ms-exchange-transport-crosstenantheadersstamped: PH7PR11MB6524
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Lu=
cas
> De Marchi
> Sent: Friday, January 20, 2023 11:35 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
> devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
>
> It's a constant pattern in the driver to need to use 2 ranges of MMIOs ba=
sed on
> port, phy, pll, etc. When that happens, instead of using _PICK_EVEN(), _P=
ICK()
> needs to be used.  Using _PICK() is discouraged due to some reasons like:
>
> 1) It increases the code size since the array is declared
>    in each call site
> 2) Developers need to be careful not to incur an
>    out-of-bounds array access
> 3) Developers need to be careful that the indexes match the
>    table. For that it may be that the table needs to contain
>    holes, making (1) even worse.
>
> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which =
one
> to use depending on the index value.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
> b/drivers/gpu/drm/i915/i915_reg_defs.h
> index be43580a6979..b7ec87464d69 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -119,6 +119,34 @@
>   */
>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a=
)))
>
> +/*
> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address off=
sets.
> + * The first range is used for indexes below @__c_index, and the second
> + * range is used for anything above it. Example::
> + *
> + * #define _FOO_A                    0xf000
> + * #define _FOO_B                    0xf004
> + * #define _FOO_C                    0xf008
> + * #define _SUPER_FOO_A                      0xa000
> + * #define _SUPER_FOO_B                      0xa100
> + * #define FOO(x)                    _MMIO(_PICK_EVEN_RANGES(x, 3,
>               \
> + *                                         _FOO_A, _FOO_B,
>       \
> + *                                         _SUPER_FOO_A, _SUPER_FOO_B))
> + *
> + * This expands to:
> + *   0: 0xf000,
> + *   1: 0xf004,
> + *   2: 0xf008,
> + *   3: 0xa100,
You mean 3:0xa000

> + *   4: 0xa200,
4:0xa100

> + *   5: 0xa300,
5:0xa200

Anusha
> + *   ...
> + */
> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)
>       \
> +     (BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +
>       \
> +      ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :
>       \
> +                                _PICK_EVEN((__index) - (__c_index), __c,
> __d)))
> +
>  /*
>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th n=
umber.
>   *
> --
> 2.39.0

