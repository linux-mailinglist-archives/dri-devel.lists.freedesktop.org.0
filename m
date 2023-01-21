Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CA67641F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 07:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880310EA6E;
	Sat, 21 Jan 2023 06:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002D10EA6E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674281173; x=1705817173;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+7xbS58KEaL4QqBr2rBWfU4Mol6Nj3uM+NQfczGc80=;
 b=JM1DrWcFKTHM0lT4GmSWRvGtu3FjpX/2D+8eZlP1CK8iA6JtHTJ5X42P
 qzbf4yxl27aFTaBJ0Th0mD2cnh/WCMqMJ+e5m+ENSj76poWM9chWnQcDa
 X8nTV5H50rA50QiXRaz//fXT/hFA+w4YuKTYQfAAacDudWD9XEytQ1MYX
 gL2ZHtgM+c1QS2Ph6FMltabGK+focgj2RGKn9O66+ryXGcFGw3rempEue
 5LujlcTWB+Aq0ouYBpxypTtHbmCHqwntRqpVxGKBPPhiGkjg+43J9GnGt
 QF9WHSkamP3vJzG45THnlIEjRabRcnoQGZ/0ZLAL/FdhU83oA+STc8xp1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327033911"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="327033911"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 22:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729355850"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; d="scan'208";a="729355850"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2023 22:06:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 22:06:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 22:06:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 22:06:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 22:06:11 -0800
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 06:06:04 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::8de1:bfff:7ac7:b117%9]) with mapi id 15.20.6002.028; Sat, 21 Jan 2023
 06:06:04 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 8/8] drm/i915: Convert PALETTE() to
 _PICK_EVEN_2RANGES()
Thread-Topic: [Intel-gfx] [PATCH v2 8/8] drm/i915: Convert PALETTE() to
 _PICK_EVEN_2RANGES()
Thread-Index: AQHZLQZ3QcwDOzdXl0SDwV/uawWqNq6oYr0A
Date: Sat, 21 Jan 2023 06:06:04 +0000
Message-ID: <SJ2PR11MB77158D3D9E12A01911458936F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-9-lucas.demarchi@intel.com>
In-Reply-To: <20230120193457.3295977-9-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CH3PR11MB7322:EE_
x-ms-office365-filtering-correlation-id: 2872cb72-50b5-4267-9cf5-08dafb75942d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYmXJ9xApbfVzgyH859Y9NjTSwK5hRi8y1c7knVyvxG0H6p/2WwbteZpb1z/9QDnIpJPDClmDSx6MkmSdieWxmj9WW9I66UYfKWXifFCrijmCqUHf6wckfp0Jq5ZYTlKYhYbYT3azOkR1n3BklkFvtmMdI9rnePZNIFXQP8RWwEZhfsVHKGgCvbYsM4daJQqsK+NsX1kAI4QgeRTSqQNERwPfPEYUfOstRG1pNiiM8nyC1IQQIOedog5Dm1pOp/29tg9rgsoIkkhCN+5T7hohCuUjW5HDfyrGwngzUPC0H2GO3ccI6z3a13DAgVjhzUrGObDB8+uPPv6b16dsmHAAY0yaZ1u9/7dwECmvAEz63azZYu4xo2Xa4BZxRwsdWVQWhEfBHPe5nhPSfYIqx1Y1/1IpwUD8bqeUHIWf8rGVoye8Mk3B9E9uIXqZWhBToDwteouMV4T+IPl3/ILGvnt968mWNr3IYK0/ROU5eEcUgWiV/wWuGcCp+hMv2sBGHRtMijbCXTDlqHJhoNHFB82baqx0fDRlgSZ2s+VnfND9jvcD5JVjMRy7laD7BoRIKHHx4mSPVz7gzTrxpwlBm3sKHIQjjfZZUV6R9zSgOkE30R7+3SBY90a47xkSrbQGPV/DQBEjDDTayvY7/AQU5HsBe2JGAcvIcDzD4pScpiCD4jSePXBZHrAFvlsAXXggX1wRZxJ0rf02SPg6gIZKDWM3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(55016003)(86362001)(2906002)(33656002)(450100002)(66946007)(76116006)(9686003)(186003)(66476007)(41300700001)(4326008)(8676002)(64756008)(66446008)(66556008)(478600001)(7696005)(71200400001)(316002)(53546011)(6506007)(110136005)(54906003)(82960400001)(122000001)(38100700002)(8936002)(5660300002)(38070700005)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ypyJtCnERS1sJN7YY1TFdwBcT5ODj4vvupO9stwO5YFFLRLi8l8Az6RjdtQ9?=
 =?us-ascii?Q?pPNg5FXmA1p+sWiz12VQd88egh4XACf+qZQjrC9z5/+/U3GVoI4iK3sDGx7W?=
 =?us-ascii?Q?3CptvnnhU+U43xFJbFZ68ToM1bWyqFnr92GTzCru+AZr3hdn1hWQwjQHSI1x?=
 =?us-ascii?Q?6zJRAdFGbgAt+JpRRZWHJQmY3+HBOgQKSPs0s/JWE79hL0X0mwvme5eiwHNT?=
 =?us-ascii?Q?b4UZYz4qj2c1fhg2IFX+T+0+CSMTf4ANAvHrO9nboIzYwzIlgG8AuK9lBMmb?=
 =?us-ascii?Q?PYtuXl/XgO2k0yFZCmJv0wIxcVelzxbzc6LUsELSkuQyXD06jzVgusUlRL9G?=
 =?us-ascii?Q?c1GtV0b6DXCf4N2rZNR/0YRoLO7mbye2DUfCFhzy6Wl+o/1S0HRYQYOYmKje?=
 =?us-ascii?Q?p6c0UF7EXLUisD38ZEmiIE4J2NKBkDzgJwcHkBFNt1BttawOPuY8UX3sCGdN?=
 =?us-ascii?Q?o72cUO2h8QAYmbLt2+N40FX7K98RMjdB4nrkHyv9UsZfRSqkhDaKOLYI00hg?=
 =?us-ascii?Q?tnzTOK+xf4R7uec5enfTiSzyvWqv15CV8SjqP7922wZueLPs5mowSY1PmMJM?=
 =?us-ascii?Q?VeA6r67FhLqCYsXuztmMViHnvDThqQcKu/uFiUDHt7tF8bdufIYOyit0ksPD?=
 =?us-ascii?Q?d/78oNYuXYEuhLnue2VQ3o4CKPqmpYTLUIU1o0bU6iLzI7komGJEJaS36+cq?=
 =?us-ascii?Q?7xf9Rzb0nc4AIIEakfB6HZJc51Ehj3X8w/bOPq+EZhBQlwOmUjXFrlIIznuK?=
 =?us-ascii?Q?LFiRJQVjsVVb+oxREr6CHk5kpAYs3jeocb1L0cvzgsAPuPzQZEkcA6Y9ysjh?=
 =?us-ascii?Q?Mqc6rgLyOnFPug9C7VkF0dlEvkUw3diWc2MVJecRvBo9VGBALk8ZIpP2wFjy?=
 =?us-ascii?Q?hfv+Q5/BXoAq53z7KMrV/NkMyCI46gbJ4hWOgp33LATh/piYXLHyvhbrnBoL?=
 =?us-ascii?Q?4Xvof8mom9POBvLDKX5ZtPKOEqrVJ6Fead9mu+S8zVe69sMTDDnEi0kWL37N?=
 =?us-ascii?Q?LJMiNn1r56lDkGvD2Qd0B1Bzr9oVes4wVHQ0SYOFxS9ycqyn7vxewFZTifIv?=
 =?us-ascii?Q?rD6pvEIvk7MGIUgSwcaaKVE4TQ8NErcpU2aAr+KY1OsAsoML+RvzIFnXKLU6?=
 =?us-ascii?Q?9ek7q9qz3gaF9ZinZLo5K66C2VQGidBgmtD3UC/acG6XTAdRza3mYN4SXPzF?=
 =?us-ascii?Q?OlHqGzsOL7+gVirePJhmu9ErzKFIOr6sosx2lscb80bRh3Yn6zxXY6pdMfyM?=
 =?us-ascii?Q?jMoTPRrm8apVom5h22OAdMge/m78aDGcZFSp2Xy1r0gdC1qilmiKM8L7d7Vp?=
 =?us-ascii?Q?JaM87jfMUYGdVJ0OhnucICEYCe5Ybx1WrppY4SG7AzvinwquxN+xAnguVXN9?=
 =?us-ascii?Q?PLBlAs4KCoOiVZChP47vPaHoFfMYsQxZ/0eVM8iSrTaJArYpGGmoLSokFDDs?=
 =?us-ascii?Q?THYjn63fY6nky6efRint9xFzc1/EooD6w7rYsyCa68Y45CPbbKtfLqage4NQ?=
 =?us-ascii?Q?auS9C/Uhie4DRowN0kJaw2fV5Hi+PAW4CtpndnuBwvbohBnvguS6dGUjZ+bM?=
 =?us-ascii?Q?g7TN4cKBSrjtCHRHwXgEc2U8NSUgpHO7Sj/t/dZ5fP3JhopiCoUFgqPQxk3p?=
 =?us-ascii?Q?lS21o4bmb48x10YfguPg1syrrwFGu+W+zsyEe+VqhVCvTsHHZc6BXwgB3QgP?=
 =?us-ascii?Q?fiFrAw=3D=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuWVMT8y/OVNlVhXVJkgY8U0uqJOGz7GAnjh4BnW6ixos2ewcL52Q90NoGBwsQqSFimNcdFDhji2g9xHHqDNNQOswPqZLQySEGI1HjfUbEIib7wsjJN5PYAaHpKSQNs0ywdOVcfBq/U/Ojr/h6abg1Arh3PILICjEJDGzGunS1bj+oDRQzsJ4z2Vkixp2XTCmYaze+mPsvPlY08y4H7lyktU61mE5kRe+QQj6EgXIMdLeeJSsOmNmkMnnHpZhpKRFKlgdtMh7bPXQ/wYf3wuk/VYgrGyBXqFMX/NBsuA6fjuJtqpXMVE8QTAv9bn2PeV87bgm1iI9UX00ZTs02fbbQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9/DEOQ0PXIEFoTjXfpbils1tI3rpnvOtQLUbakhBEI=;
 b=FQmQZHhvlRamzeYDSOoVSd04jzA8aOMakkZTxRpZ32q/6iBxjSBRglKU+dIincviN8m/uag/7ZfA+nBnSwTLrdW+0943nhl6OXKIdyDKkbvyGt2csO+9zKq8MZDXCIp+4pCHps9TM0SpcWdBla0B3cNIGCUnnm4qC5TZeIznRB5nVEH/Cb2gfTQRWa4qlmIl0oP374vdbC51RzusqVigFcmw3i03Zw52Fq+ps2Upbd9RUZZXPLXyJUtRampki9H5XPjkpHUc9z+YfI2Ffb+Dkg3e25BgIFJbEvUpzF++mZvgSbcyq2CslN38G1TVsnC0r4jk02Wd/20etg88baq37A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 2872cb72-50b5-4267-9cf5-08dafb75942d
x-ms-exchange-crosstenant-originalarrivaltime: 21 Jan 2023 06:06:04.1484 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: A+O0rHewQY9L9dmehw6Efj+ta4HGg4T5cslHVmRZrN6GCN4KMt3bIeFC1JAHcVPNhcTfJDvldHSYLrEqksXW85zBqx/ENzj/SUg9IR7HgLY=
x-ms-exchange-transport-crosstenantheadersstamped: CH3PR11MB7322
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
> Subject: [Intel-gfx] [PATCH v2 8/8] drm/i915: Convert PALETTE() to
> _PICK_EVEN_2RANGES()
>
> PALETTE() can use _PICK_EVEN_2RANGES instead of _PICK, which reduces the
> size and is safer.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Anusha Srivatsa<anusha.srivatsa@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 3d6ad4424265..b134a1f357c8 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1734,10 +1734,11 @@
>  #define   PALETTE_10BIT_BLUE_EXP_MASK        REG_GENMASK(7, 6)
>  #define   PALETTE_10BIT_BLUE_MANT_MASK       REG_GENMASK(5, 2)
>  #define   PALETTE_10BIT_BLUE_UDW_MASK        REG_GENMASK(1, 0)
> -#define PALETTE(pipe, i)     _MMIO(DISPLAY_MMIO_BASE(dev_priv) + \
> -                                   _PICK((pipe), _PALETTE_A,         \
> -                                         _PALETTE_B, _CHV_PALETTE_C) + \
> -                                   (i) * 4)
> +#define PALETTE(pipe, i) _MMIO(DISPLAY_MMIO_BASE(dev_priv) +
>               \
> +                            _PICK_EVEN_2RANGES(pipe, 2,
>       \
> +                                               _PALETTE_A, _PALETTE_B,
>       \
> +                                               _CHV_PALETTE_C,
> _CHV_PALETTE_C) + \
> +                                               (i) * 4)
>
>  #define PEG_BAND_GAP_DATA    _MMIO(0x14d68)
>
> --
> 2.39.0

