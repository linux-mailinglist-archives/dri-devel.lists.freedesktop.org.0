Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F2A2910B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8010E7D4;
	Wed,  5 Feb 2025 14:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuarA6zN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773F510E7DA;
 Wed,  5 Feb 2025 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738766655; x=1770302655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=omADk+2Qn1klp+YDPlrcUJmUxstCTS2KLdfJjWndDSw=;
 b=IuarA6zNYmB0FISV2WXTbQzWVYLNAiEu648aoA7utNrAthTB2LzIFTMX
 Erbhz7OiPP4677z5hEuANtNqOcrf0lMizxR3enw+JLd8xzS68RbI6JFIv
 OXldAyPKjEweKp6dj39R7DgBZ6sRHxpv/w6m0LQKNaALHT/LC0oQGP/KG
 PQfX3lCTsfxAVDDLPEaYd3b4u5AcA7GeFZXeOa0g62fP0k21UlqennS5B
 Lcf6n/eDjk+WEbKYYFWnkfl6+omhPvvOgQTAjTYPfl+IqcA+Do7moo4v0
 y8NVWXNHGOTRy/fpKhUK0g1hLsQ03+Iq3H3e0ay/264AOzBH3tQaeM/01 Q==;
X-CSE-ConnectionGUID: cW//l8mIT5aihbJT6LF1jA==
X-CSE-MsgGUID: W163s5kkTUqBnsc9Ea3dfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50753525"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50753525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 06:44:14 -0800
X-CSE-ConnectionGUID: fBE5E9zQSz62c+ie7Zb0Iw==
X-CSE-MsgGUID: VBwLs/mATxOKEuyS2GRSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="110820471"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 06:44:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 06:44:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 06:44:12 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 06:44:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy/i6mnqWooG5x5vMxauGGJCl2kNm3kwNQ8lXhtclCs9aqXtQMAWoKjKVybpGvV8mxAXlI30S5aI2lbAO7VEyInoTjSsOZT064xZlle2iW11UnuZC2fi0UZ6YJLi9xeM2TbHJ2QM/07QeJ1rqPWYBGoln8ae09Q7Q5H6EkqUcQfCHfeyEqQVB+DVrsHuGsDpwDHnS6Un6FlYoYBsvE5+82HGZpw2oe8M554WpjaKASynIq571CZN0VbUQengr/7KwXYpq0t6sR6V/aVTJSihGqq/HaEY3Td4NciMS156+achjxq6jWqbPj7d4qUiqV7uvfUxH8h15jFFT3z5hvwr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OXxWqmRZ5RIemOy94SbwG0lGNSoK0Uqv3d83yWUYqU=;
 b=l+FOCjc7I2R1hSMvye0ElKEwsmL6tNqFkair4Potzh0AwU3FAz3SPJXgB4UnV41ipz/9UHCY0/1WtuN7/8ZjNZwJe2TQNBN56XXbojSr7dvRVYQxbOsGdfrflHSMzFReQ9uWewMsUioC15Dys+z6DCwPy3lZK0bdOMOOYH6AibBO590HnpwXFABLm0JW18eVlr7Cfn5H/NtNnNO2W3rE4Nmmu9ixejfJSIgCKlIWHOj/RPN57eMzP5GCicfpKURnbUhn5034A0mloW02WP9Ei+3zvjZWQvg1hXVEtiQohSPZlex9nyqGtI3jBSVwUDxhvDt7J94QJNQVP1gkE7YflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 14:44:09 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 14:44:09 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 3/7] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Topic: [PATCH 3/7] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Index: AQHbdwNnVa/FzOpOp0KbQp2p/sFGFrM4wy6w
Date: Wed, 5 Feb 2025 14:44:09 +0000
Message-ID: <IA0PR11MB730700A8D04C43B0F9E5A94DBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-4-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW5PR11MB5764:EE_
x-ms-office365-filtering-correlation-id: 22da3121-fbf8-4e9b-9d77-08dd45f38c7f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+iu957rU9LH7CIdCKbsAtwJtu/F9x7XuyQ3ukvpAbXyp6KDN+i/uxMuBNb1n?=
 =?us-ascii?Q?XvhripniPiWi/soiUcLuelp9F5OuuYKai4e1t+x7FIx1NUZhcCLMWtL4sj/e?=
 =?us-ascii?Q?4yLGAWLwSpcAYKN2QiyoxnnLKVhtg2N7WpSDPxHonn0xr6IvHc6+L7MqprHQ?=
 =?us-ascii?Q?v4soter5VmnCeMxYTUpS5YVR3RDMAnY9M1tpxwUt2UWd6jW2hPMYZTea44sk?=
 =?us-ascii?Q?g2bzfFzWCoMlN+f9eZ6KGKWjKFJHbYfZ9b3GCmUS3rW7GwPYomX9n4d9QBC0?=
 =?us-ascii?Q?8FFRXIGfTlTJ6pFrpxx/HL0NiX8ciccYBvKclHp46XoC0cKHM9DAImkL2myw?=
 =?us-ascii?Q?fJezIQgEL3mSiocwnL7wxZaZM/wH9cP5rZFW1dKJ2ZYmlcfDx1gV8vdRdnfN?=
 =?us-ascii?Q?0YHJv8DVoHelB7vVHeuRMO+JgsNY1UhJXN0so7wSV2g4Gv7bbFVleifGcwZV?=
 =?us-ascii?Q?5vY/1DLkR7UL+sQhUmNSq0Sncqytq23DtkJYgd93uAo+Jt4qa0aVOD5KbvQ1?=
 =?us-ascii?Q?0gDqTfdzlEjgY/qNHb45WjcrEG278Zh8vfer2dJYCiGu2QjSnQ/5SyPj5sRC?=
 =?us-ascii?Q?zruzrubu2eHywh1kVBJ2LvzS8DFDVq2oYW/zFuIhm5L+dh0FMQ7aaskn334E?=
 =?us-ascii?Q?MtvMMbWsYGZPivXtON7WqluiDVHvWDz/fQitArqwoCGUuAFwNDx/7iMPAGoJ?=
 =?us-ascii?Q?rmYWOVqCurwRfIYQmlVUpKTV3KjHgeGy6iSbdrIN5e5nsNlt2bJEWgsbD9y8?=
 =?us-ascii?Q?GERD/UVLbwUKrtNZxhTFtCNYe7F4QcbVwaUcn0bKwAiKxfnpGgV+XWwMvG0w?=
 =?us-ascii?Q?zMqjXz2h2VIOzwr9gwyVTvmFIAzBbPr4A5Mhg8XXL1jZtyx54e3G26XXECnZ?=
 =?us-ascii?Q?FiKvZHWh9ADS3pxGMOnlPU42TeKD3BtSrrMC0Jeb4I6vPfsSA6HFwr2IyJvG?=
 =?us-ascii?Q?aHXiFfIvqUeUiUTRaFDuaXXQEbEIKy+tFuTe74OPJSXLtPnFy5QgruKdqzAV?=
 =?us-ascii?Q?0nB/lQD9D+0+UqLRKFLBACn+TWwTBrn8LHC1FbHQC5Q6UqjeyNc7IkW54Ehc?=
 =?us-ascii?Q?v83VoFjTGSK1dMPqloOMPXH2uVJKUYc37ZgU95lpFfYVBXPcpOk38eQ6Jk7k?=
 =?us-ascii?Q?Azq+a8/CA8DKz86mFtS4cTYA35NifRykPhoMcDQbkpIfn4Xp9bqmhH3DWh5X?=
 =?us-ascii?Q?auXpfP1lTQ7xfd8w6MFOLzag17Z8rM73sLZQmBFkQWECVFCqObFnW31HvWgS?=
 =?us-ascii?Q?WDSSWwyf49b699CQmp92QHHbXm0p4D+uI1D3Y38VeNIwhBiW+zbyYFZPzYqv?=
 =?us-ascii?Q?JpwGHXPF0rL/iVd26Xl9pbyDqjuS7zsSmDnih5vb9xdz6BSukFG0lyiAe1eU?=
 =?us-ascii?Q?YFV51+/69rdpW4nG/X7ST4Bc6HyxuHRHB/DChUk3MaKN7TmnJaX8ZBQUlKlr?=
 =?us-ascii?Q?tFIsfW3iVLmpztbLuAoJNg5K5L8JTj/r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SEZMx19RQzO3yR6E/hfpGGH+3ydyFFElL1VK0u3W26FOqC1q1tGWkcspRxby?=
 =?us-ascii?Q?68IHRCg/h0dWye7Xch9tz0F0khKFFtOjKoq/GWnieHnjOjiwL0q8GnQ93aEP?=
 =?us-ascii?Q?rI1+aZauYttSKk8dlAzxzzuGAoeJ+iAECe9457UnOZzaiw4odSiy2xYOng9r?=
 =?us-ascii?Q?gJQhhi6BxAo+ceRI9RPAVdFl84ZrR17LpcLR+o98A7gUOOAzZZoUbGUy7WK6?=
 =?us-ascii?Q?60yTtJ739wFA/kDp++TfNo6eZN7Ak67wMW4vzOtBifMXtGcTX/RHdiDIpPre?=
 =?us-ascii?Q?yO2UzIqC2JBNu86zIU5yV0tlmAl4HM31irAFJGG89c2pFwXj18MAJiRPJgr+?=
 =?us-ascii?Q?wFKa7v4M8226vj2Ez5oqpZsUJwpeKHDTlsuGNaoDMBxxSoPgsjZFWqh9rios?=
 =?us-ascii?Q?2wUWuN2lN3j3xw3LBoj3o56cAzn974kRi7R1ZE6VkuZ+f3uENEj4bZg3/BVC?=
 =?us-ascii?Q?CDjLP77TVhMUXPi7W8fQ/4g9Q2eA3Sg1v7mN5dcIJZo34SNE53fA+Jyj1sdj?=
 =?us-ascii?Q?8d3Glsq3FBGhoyS95Keex2iITZUZQzSB8OIOU5mrQIauMLm1kdlUat7H/ijw?=
 =?us-ascii?Q?a+oenCyx10eCGqzFZ23z7pIVOcB3ZL9KGSzLxnZ4kAFzsXt5ZMWOvXQ6K2i8?=
 =?us-ascii?Q?O9NZZUtppN564OUjyirBg82dtrkawJwoG0/clgUN/5Sd1pPmLe6vflA/SZ1g?=
 =?us-ascii?Q?UduidV/LMRl4c1dVbivfUBeZTtqLMH7dwoS0v9LMrGIuudIUjZVdMIbTHuJ/?=
 =?us-ascii?Q?86iCVNwzstSa3im6Yz2Sn5bJV4U+zoFssQchhSHo6KKy1L1iIsjG1ila4XhZ?=
 =?us-ascii?Q?l2kL2/v1z6NDzSlnOpMLoLi0JyR1HVf92k48fyOnehDWTj0VlA2W8H/XVs+X?=
 =?us-ascii?Q?b+4oRF6nH69XABWn/GXufansbIUQ4Wm06K9yaYf3VAdYVCJKXiFQgwQEdjLm?=
 =?us-ascii?Q?7E5izqqfmHmq35neGr84vLK5yZmd7unPiEFjljfbH0DY1F1d00wp3YVlt6Cj?=
 =?us-ascii?Q?Q7hvp7xsjdIegpR8UVyiH/yFxheW8n2EPBrDqsjXVPjUx/zrfpXKYystdVUY?=
 =?us-ascii?Q?svRE/obZuzJveG/HHpEM02n78olSIGh85kJaDbOMSsQsw39XdojcMCBWighA?=
 =?us-ascii?Q?Tg35zsaJndaet7XlKKoo2ab0xQvPb3HxfDptFP7AP19orlC/vniV+Cit/yfh?=
 =?us-ascii?Q?IPDWzg58TYrMReSKnHDsdlQv7Ou08erMqB7qkNamMCCJlsZqa414F5BQQilN?=
 =?us-ascii?Q?heDNIzk0RCqT98r1Uv0zXWAUAmengFbBB+k91wtZcG6LQEKuosj/5jAE2iqp?=
 =?us-ascii?Q?ir94s/HuZx9ulszmdWvqoKbob0gBd+1e38XSpZFhqdSIJk2oZPBiFj1zJjiC?=
 =?us-ascii?Q?7UkK4hZVgyY/bHVYgCg1duxSTpBGA+zXzMeUX4M6zli7yT/I8yQHm2SnYfgF?=
 =?us-ascii?Q?tQdtsWPhpd8XTS2OUsnZa5fEO+FDTzyos9t8toFbWG3U3xV+uDo07xjfOxE8?=
 =?us-ascii?Q?rwA0SYsbAaKNe7vhCAtORFhRtUZxbtR7A+F9yef/gj2g4LqfR9CW49h6UHFy?=
 =?us-ascii?Q?JueX/+SzbcGRYofzS9NPoan6iwSeEXqMLJDcUizY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22da3121-fbf8-4e9b-9d77-08dd45f38c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 14:44:09.2985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJMGZXL6UeRMv7N7F1U3+/VffkLIF2kXTfJUS1SWs4hX9XNvf1lABrS5FuQKzLE+WjG+jPaPU/2HHOhTXKwa3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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

> Check if we are capable of controlling brightness via luminance which is
> dependent on PANEL_LUMINANCE_OVERRIDE being set.
>=20
Is PANEL_LUMINANCE_OVERRIDE a macro? I don't see this definition!

> --v2
> -Prefer using luminance rather than nits [Jani] -Fix commit message
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index cb51b7936f93..3b64ad724b29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -412,6 +412,7 @@ struct intel_panel {
>  		union {
>  			struct {
>  				struct drm_edp_backlight_info info;
> +				bool luminance_control_support;
>  			} vesa;
>  			struct {
>  				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 09e82f24d030..84126e7d1716 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct
> intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_panel *panel =3D &connector->panel;
> +
> +	if ((intel_dp->edp_dpcd[2] &
> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {

DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE seems to be for EDP_GENERAL_CAP_2 re=
gister, addr is 0x703
But the dpcd offset referred over here is dpd[2] which is EDP_BACKLIGHT_ADJ=
USTMENT_CAP reg, addr 0x702

> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX Luminance Based
> Backlight Control Supported!\n",
> +			    connector->base.base.id, connector->base.name);
> +		panel->backlight.edp.vesa.luminance_control_support =3D true;
> +		return true;
> +	}
>=20
>  	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(display->drm,
> --
> 2.34.1

Thanks and Regards,
Arun R Murthy
--------------------
