Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590A67839A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F9310E51D;
	Mon, 23 Jan 2023 17:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9DC10E51C;
 Mon, 23 Jan 2023 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674496164; x=1706032164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zVtKMS58xrwrp5q1w2Hlx9U1VrI8ywevJU5OJC4Ndmk=;
 b=EonTdHcDGfGQ8OoWOXKucdtxx0GTmXJty/VVAlFTIi6HrLy08nFsxXti
 S6AoXggTLVGIwxw6lEq7GSx6A+Y8VJm1m3T2IM45B+/v/J1kVi7rhLn0S
 qVAVAkzbzZ3OpLz9Q5VtSDYYcsk/NOJEI+adEAl6ZELTF+CxcluEcXZdb
 4YdcXB4YLpyoQiLTIyAfx8gGRq5fcnV91ryjrJJDJ0GUnnOArm2zf1QEC
 skqaEdVtkX3xhS74tnXDLcInk/codeYH2C9fRibN+aOBKLk1Te7Pye4uE
 d7577NOczelOW9HP0i4XTJ6hkMzXmtPNLn8m3GddvUAwtvQfkLpu8mv2K A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323795951"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="323795951"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655095117"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="655095117"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 09:49:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 09:49:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 09:49:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 09:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOwFrM5gSOHWjaeycjZZfsHXJdHHCU1QveE5WMRThK8ZOEtSyItzZGNq6m59tg+JCrI/jnAGStyRmG5X+jqyQRoO+Fh/9F3ynfB2Pldvfjnz+lc01igEnRP0HvtIMCT8Rfb6xppxiWth/SUmAmEeQTIyjNPYa0p+fU1J3OtwlkqMTFKz0+vYtFK0NuZWPHSJwP0W5vb7Y59imsKG+/4tj+owPX2YscbayZObVDOOtXv3Lz4oQWmRDACrBEsmr+vbW4fcmPdUYJInPTu0wlrGYtLj7Lun8P3dtjzMp5HLNSvE4piChZGwRQ1S2NG5415Espl+Mtqu59fL0yQ3TbgbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V8fHl8Zv0kZgi5qdGj7IG5bDu9qJIFUs7hF1WGYF68=;
 b=nPwdiVZB/sHfZqn7kJQ6Jf7EINOM5Ym83j94GfXQtm+6l7g47k5YHrxO1akK4UHWaRFpS0HTmc8X1+gwjozTcPxL79YBs0ZeJJXpbRrsz6VeMQ80T1zbb7t4MJWMXNFRrdE+4yqAWvAcmxQl3nr8SmFUxJXuHDvxcK6dUsE4EO3yNqXcyWWhhVqvUIFR7ROkB6nBtHj1msCZ+YZUU1Gm8W12faM30ktoBrrt38S9yhtjVVbakQLsu7emB/IVfS7Wk3V9OL5o1xfql4eyOFcnWBkZzOr80+XO7sf8DocsQ1qkqcuBKB6F4hxd03ly0/BjUR42jJcYWH3DrQAPyEaTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 17:49:03 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 17:49:03 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2.1] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Topic: [PATCH v2.1] drm/i915: Add _PICK_EVEN_2RANGES()
Thread-Index: AQHZL054aGvhkFxuq0CMSVqXb/FAz66sRzlw
Date: Mon, 23 Jan 2023 17:49:02 +0000
Message-ID: <SJ2PR11MB7715DAE2BE200C72CFA20D0CF8C89@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <20230123171556.3322164-1-lucas.demarchi@intel.com>
In-Reply-To: <20230123171556.3322164-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CY8PR11MB7243:EE_
x-ms-office365-filtering-correlation-id: 8f851778-f148-4b57-3d0d-08dafd6a1d6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VaZfwiygUS2nPX2B5Fo7+uB60GLV+ZTll9+tU6CHUksADVVxEZqk4QTJkFaqI88RkjtnpBKxfJ8uTVDp+o9Xu7PRJ48AMGJF1UgJbLq3g2026dF3rWCbM6x+pvMUijbNmkri3OZZtzJkPzH2NJyE6uHxEkz2V9OFszB2Xu7pC2iXBFjG/VCXrjP4lunV7mvsG/a8AH9N8ljWA/jNhY+Vub4/oDeTTiskqSEMNwavLBo5PXXAZGiR2CdKTHoKgApnpFKeIwpbk8o+W9psaKQttXmTzQSpYuliHEChfEjUk5TEBR6qmVqeDcJrYWcgFDmT2aX9yIqT79PQr2reRLVVMQvUYNcVjUuNsTzJ5avd+kTACY3+ToA1NTFFQEtnMwY8mD6qfp+s5VF9gO4qEyyI8Jm4P3PiCxEPFpfogp12hp0LnXYnZWTQm7iPRla2foQzlMeA8/S+ItPOJZlY0KksCt0cKmRXNPX0mfD4QQLneJWRUSky8weM02U6m7bVI2Wsa4b+ZHq03t7/JWHDQ7FRh+iIk6mwrgLt3S4yxmNoiLdyzXpDTqanylUTJfvS4qckrcqvPtZl1QyOdHxvHMt/Ql3TUXgRXhgXIn6crdb7O2qR8cdNBGFyTJHMxa4dtGUdKlCOJawHetc0EmVvgJ7tdYoq7OorF86EC5pWruPzLs309eBFN3Kn5t3Uxhna/b/87Jg9c3pxhKBoAx09afo+Nw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(41300700001)(86362001)(38070700005)(82960400001)(5660300002)(8936002)(52536014)(4326008)(2906002)(83380400001)(122000001)(38100700002)(33656002)(478600001)(110136005)(71200400001)(7696005)(26005)(8676002)(53546011)(6506007)(9686003)(186003)(55016003)(76116006)(316002)(64756008)(66446008)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rX7gw8c/jHK6AsN59SfSmklU6HLCUQ+ICg55KKLI50RxMGXZ4Mc8YHLr9Z6i?=
 =?us-ascii?Q?PEvQEh+nsz8ToH63mYZMS9uBB8LWecRP3I5yAkiyE27zjGH/vqfBAMmof4Rc?=
 =?us-ascii?Q?/5iCPsWkAb08U5n/GEXwlFo4CBiY4xz5u9S+00mn65k++0l5s7Pg56pOzS6k?=
 =?us-ascii?Q?NhnnHE8n4jTn2Yo5KBtDiDOEa68fn+hHMIXAZSUTNWc0JGF129IxhI5yOakd?=
 =?us-ascii?Q?IDNYD0IvJNzORFobGkTggG121VmZk56knYdgZGHE7lMMCPuAjDwS03FGdt3d?=
 =?us-ascii?Q?W2LIoBgEvwi16+LseXut8XbuH8hEFBR8Cn922n0AndQk8w3v6+I7wQIjqgLb?=
 =?us-ascii?Q?5M1jD75WJDwubUHGqorFzvBoNPwsFeVqu9LTyoVwsAsNVJYjPx28tjZeUFUE?=
 =?us-ascii?Q?ue/C4QEprwl2EFov2pd3WEIewgb9IotGqgJFJcViXXtfdKCiB6t5g/K4FmEy?=
 =?us-ascii?Q?0K8+vp15l+EqtBa/GhPaWxbU5mnHeY4eb1UUKDK0jtEtq1IKixXnOCvK7R6A?=
 =?us-ascii?Q?sWOV1THllznLVvHikGlPD9Wav6tymvAAyuOUGI0cglK3wOcSdaTlhAtkNMxW?=
 =?us-ascii?Q?flVREDW+sjqWaWCf1EWRqDL9W2dZEQ5Ni2uTb6pzIEgTvNtG7OxpeFqC8F4d?=
 =?us-ascii?Q?F5onY8va4IHlaXIlvD8U9uSiN5HYLTG0I12YDVAu+BnZULCtU1vheHlo+nXc?=
 =?us-ascii?Q?gKmXZT7LH3zDy5YY2SicvRx+noyM3ddqucP81QBQIY9UZekjLl5opiHJZCzj?=
 =?us-ascii?Q?b/zUNaS+CYrAiIGPn8PjZK2I9raNGsqy0cYCe7ElOUCh9h5/KM7fm2s9Bucw?=
 =?us-ascii?Q?k06vPd0GF+ttTZotmQClaCJsrDTrwAV3VuCaJ132Fu+9Ft/Ts/nfP5YV6mB4?=
 =?us-ascii?Q?ELejI2nKrccgJy97BmSMbqRPeEz1FyyKoFsXlWexsBCtzcIiS/SNdM+Jdr0y?=
 =?us-ascii?Q?1wvFPqr/AbDqlYHMsnXN4ZUZt5k2rGuenG/7Kh2Kna0rmBw+Q7MaWt4a7Lyz?=
 =?us-ascii?Q?3LqvPnxXstD3C9poVNYXzo4WIiBPc6bVQl4VTZIdHsuI7FziA9SMYYm3+2zz?=
 =?us-ascii?Q?ZQhDGhVxeaA8xl1s8QMziFqTijiXivitdYRUh+mOWmKZBADh7GCaw5KNGVes?=
 =?us-ascii?Q?/q/GvvQK2C/oYs9LCxaljJSbGoFAr9wwm/EcZ3F8zsExSmYawK/cFXQHqZBC?=
 =?us-ascii?Q?FjEK4TINMsImqA/aRJmDvIUIiFIJLyUyRvvU6nLVgrOi4AMnLXSXTgINL9o5?=
 =?us-ascii?Q?ghX2B1Epex7Lj7PpDuTK6tKTb28v82YUmq3dRhJYklAoxDIGrBAdi5gvirbe?=
 =?us-ascii?Q?Zucl6jhv34XpomqTyYUHo3tyOeQpYGYX572qE32hK2VS9BB8VJ3Q7EOuVS7P?=
 =?us-ascii?Q?FWV9OZ5JC2Gydrq1cwqdVTDqo7rlryfAcmeH9FdJzvQZpbK04FZf9gdgKKdr?=
 =?us-ascii?Q?4BSNp69cBChkRe849CeVn5JAgUqLjJ/tlB3FZwOeKmIcu2hXXfCRGVH9BNS5?=
 =?us-ascii?Q?bzEjXmDTioamKKD5wSY23vlC3qcailQPZMMgv+4Vf28j9/nCMgXWHmsXeKD0?=
 =?us-ascii?Q?hu29OVVtBDlsdiqTIg+tVqTLaPYY40tiBWa3U/ZD7zzYKKmy2RHhqrmNCFil?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f851778-f148-4b57-3d0d-08dafd6a1d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 17:49:02.7962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmmnDaGjoM1yBU1dhVk5w72zHcpi8mj/pMVK2voFA6cPtSTaJQi2nA8OHHToBtFrhaBzUIBXDothdTo+R1Uw9azfp+XqVjXAWkdrLD3d4y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Monday, January 23, 2023 9:16 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Jani Nikula
> <jani.nikula@linux.intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com=
>
> Subject: [PATCH v2.1] drm/i915: Add _PICK_EVEN_2RANGES()
>=20
> It's a constant pattern in the driver to need to use 2 ranges of MMIOs ba=
sed on
> port, phy, pll, etc. When that happens, instead of using _PICK_EVEN(), _P=
ICK()
> needs to be used.  Using _PICK() is discouraged due to some reasons like:
>=20
> 1) It increases the code size since the array is declared
>    in each call site
> 2) Developers need to be careful not to incur an
>    out-of-bounds array access
> 3) Developers need to be careful that the indexes match the
>    table. For that it may be that the table needs to contain
>    holes, making (1) even worse.
>=20
> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which =
one
> to use depending on the index value.
>=20
> v2: Fix the address expansion in the  example (Anusha)
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
> b/drivers/gpu/drm/i915/i915_reg_defs.h
> index be43580a6979..bab6a9ec2ddd 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -119,6 +119,34 @@
>   */
>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a=
)))
>=20
> +/*
> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address off=
sets.
> + * The first range is used for indexes below @__c_index, and the second
> + * range is used for anything above it. Example::
> + *
> + * #define _FOO_A			0xf000
> + * #define _FOO_B			0xf004
> + * #define _FOO_C			0xf008
> + * #define _SUPER_FOO_A			0xa000
> + * #define _SUPER_FOO_B			0xa100
> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,
> 		\
> + *					      _FOO_A, _FOO_B,
> 	\
> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
> + *
> + * This expands to:
> + *	0: 0xf000,
> + *	1: 0xf004,
> + *	2: 0xf008,
> + *	3: 0xa000,
> + *	4: 0xa100,
> + *	5: 0xa200,
> + *	...
> + */
> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)
> 	\
> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +
> 	\
> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :
> 	\
> +				   _PICK_EVEN((__index) - (__c_index), __c,
> __d)))
> +
>  /*
>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th n=
umber.
>   *
> --
> 2.39.0

