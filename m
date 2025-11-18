Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52DCC68695
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2AD10E443;
	Tue, 18 Nov 2025 09:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVoGWCNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C640510E443;
 Tue, 18 Nov 2025 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456621; x=1794992621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B5oV25pppelb26Bls9SbVPaSRNGlu0Nc2Y6UfSpazx4=;
 b=XVoGWCNaov7dTJNbFJtbNTIsfwIg7np3egmSCsxGg6AAYpyGfUGraQVr
 ieJKzmcHY2QGgpN/w3LiQFiGhpSl6aPKi0qN9OANDXjZz4YfFyRTFNmVK
 08U/Nih98gXZTIR1XhV8UsxwWRwIdyLcOABWGaZ7DIIvVR1VQ6gqrInWr
 tDiFN99Ckev64wuNkifLBtJjyJe+9ahl93ifNquwQe9j6WvLkuYnMDiui
 cE0LQE7JuuueFbdP+xQyK19ppDTytrHjAjq0IOl603RDtHxpvyCK/jXK9
 K+2Jk560wEEW++9SpkisIKMORindHT0F+h3tTMi93fh0iOQpPVj/Ew5G4 w==;
X-CSE-ConnectionGUID: oaLoe8a1SH6xtgePEN+s7w==
X-CSE-MsgGUID: BS19GflTSMuMlPlm0tSTUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65562643"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65562643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:03:40 -0800
X-CSE-ConnectionGUID: eQCkaEbPSlijh6x858DG1A==
X-CSE-MsgGUID: +qLu3K/UQl6AdbjlsEl68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190728745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:03:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:03:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 01:03:39 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeCKwhBxgOWqLqjxD6HVysZFcO91i1DLxMAbGQitYMgGuIBd7ZBl6cSTL2kK9OmFn0R3+pi3u/iBhf6wclOmYozdBIK2iQIN6QX5wEuvimZ3QkiWLx0tV8f1EuzBD08vbrdDoEyqTLWd/Dhh027sLhnxWu+3p/YMq8C2mu6L69UivmpPP4xwuZEX0c8ncKw4gdjWT6NylxDjBiMOpkCoCEVQ6IfqSIpWBvXknpCFUhVPxqcTvADUH3bWx3XGX5P+ybKHm2KvSfy1p1T6ytHeKq5rC4+YH0VPDbMkP4h/MmWQCsGWHun0SUreoSRm8IFzXoDjnkjBcstgsyZlzws30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNRL0HbCvr2gvMEGHVC05alXbqb2Gb6gmiyIIXsoEMk=;
 b=FlRZBDDkyS/ThnD6cqrwpULFUnvXZUl0R/rpPvwFMRqwyFtn2lw62SSkw/HXp98GpmLFuOsTTyVfSeflLq7o+svcTpDBr/IAz4yB5onsK5J07qUfjqI5PvS1+KJXBmCi04hKO8e5TzYwGwT+xPlnerSDJ/hfQAhjv7M1alD4YdGc+iPCvO4NZY5uglIRd7SUnLElmAA7V/JJUQNWPzAYw8nRVV0JUDGTJ/6tTfccdESmIo6FQ1gm+ALPqBz/vk/Tuknr1f61HcPy3exzd41ysV9+cFLK/XwLUqp01s8caaMhGAsDf9E5/O6ZU+Fc1dEgqVG3Y+NxHEPosVk6vqOR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA2PR11MB5194.namprd11.prod.outlook.com
 (2603:10b6:806:118::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 09:03:32 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 09:03:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 12/16] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v6 12/16] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHcTk7/GZylppotv0SCw0MUH9BOq7T4N1oQ
Date: Tue, 18 Nov 2025 09:03:31 +0000
Message-ID: <DM3PPF208195D8D2C6942F90EA6AEDEF719E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-13-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-13-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA2PR11MB5194:EE_
x-ms-office365-filtering-correlation-id: cf67d006-5862-4dbd-272d-08de2681590a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?P8IW+VssZMkfscknoKIE00TrcZcW1LRNOxXbamoOn8KEkHABlOUeoiyVWjO1?=
 =?us-ascii?Q?pPJOlO+K63CcrkPnvnYNu9YeZ8idWZ6DWDsFDGf6A2xE7fKJREw4kpiu9WKD?=
 =?us-ascii?Q?InXXFYIRqj7/3fmCvbc2xmOXHf2rFFpgfTMoM1yxVV51gJKaL5XozbUVrpeH?=
 =?us-ascii?Q?7u7Gq6USY+YW4lzPrnIb+RDRCyQjwkHCX3WuT0NR5MgOBuz7BiG29/dSZsHs?=
 =?us-ascii?Q?cbZYJ8c8idWuOUFyx+Up/1W5pxTTOLMPk8fyj4+2HXxwp02e3rJPn7IhOnk+?=
 =?us-ascii?Q?O3JypAbnvtWbeLYzKI7R44il3O03lvP3QuoZ/h34Fw4NcbfNursmU9IKrQv2?=
 =?us-ascii?Q?31yTE10nUCFcWJQStI+SVgKwUWxW5Afk6q47rJr/Kp7dZULcm4/9EMyTdHs8?=
 =?us-ascii?Q?aSH7AfZjfL5rx7X9VK94/vyNhnIkk4/uTN0Cfuwl4UfhYkQNpOWVBaum5mk/?=
 =?us-ascii?Q?aMoeibROn9xHnBoIb1hnqpMn6TiGcsSz3+/g0HMqqg2FfZjIf80gU5o3r2yV?=
 =?us-ascii?Q?FRW8QvxiJ8ZnmdcdZwdP2sesvjcGjBTSY8B4ceyJ55YeT3T8UG0leJfk7raY?=
 =?us-ascii?Q?ZTk1+GwCIBTbXzrg/mlTDWjqbmbhLLYRw4ws6yn6Oq24WPkiiuDdvRlc+dj/?=
 =?us-ascii?Q?eCNqIfL7tvEsfHFlFpqoScf/hO18L9ixkik+ruyTyAtNlZ5558kbeYND7G1B?=
 =?us-ascii?Q?cKHwkmE/9qOs9cWp+c66vj0oRuD1oOTRotE1S93ft97v5Ox4wlniF3Gww4hA?=
 =?us-ascii?Q?PGFYUUiQ7rDE/aRUpxVa6oh8Dfkml7SMn07BRfe+NXSyErls9yRO2VPhkTQw?=
 =?us-ascii?Q?MdoGArjxicLj2ZQFAhLm+f1GjrcKLuLUzqGZyXEElCEzUJyq2smHqWKg4MKa?=
 =?us-ascii?Q?3z7qVRu7/cluP4Mef9DQpBPGO00dbCO7p7pshGD4paZAL7Hc//dUfMVBgl/H?=
 =?us-ascii?Q?r9J1Sb273AgDsbamrsxa7JnoSPUK0Y0WEopVOWRfIpmoA47vOSBPnQQtWJGr?=
 =?us-ascii?Q?e2yEzZB2nPp0gkJOI6ja2WeaZBWXaIpcOibW6MLgsifcv2DwytsNdkgB6odf?=
 =?us-ascii?Q?tkQREw5QW8gp3Ci69OAhi5WoAoarEOR5tf9RhnrCEGtVBxbFRUbrRajr/Tbc?=
 =?us-ascii?Q?UofRphkfdxQGdm7T1cbSTwpbVFCbioCidB5iSOPeXQZvIJTf8Ojm5aXg4GSN?=
 =?us-ascii?Q?0oNl5/JZmtTfzzigBo7usr9pGlcCnxzXzpZ2Q6B5WXug1i007rfyvSRiWue0?=
 =?us-ascii?Q?siJOuexe0O46DAd4BLCACc4zejVqpAGTKGdy9lEOS5iGj/wDAZjfaahOgWge?=
 =?us-ascii?Q?U4N/vkDCXAV/EXf9Hlcn90PzNx7HHeCrPAI4NDAQyx/aj8VZGoxe6XeftWUo?=
 =?us-ascii?Q?sRIRNM1/Ce62p1iW46H9eH52/q/HJDBepVbx2YIYsA5bA8Woe3r46zP2ctZ2?=
 =?us-ascii?Q?5NLOQxAcD4eiJ5yvXHf0r85Cf0ikNhZTSLAd+E+IAbkD6wIXwIGYy+ijYR2X?=
 =?us-ascii?Q?BimQmdHOBfgFcxu3oku3ROtDdqY7fUnpf0f0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Xb7md+ljmG2gwnGbpDFRRl9noZry2gSUmsvJFMLPdI1IEfdPPxz6s91C9p7?=
 =?us-ascii?Q?zVL6ouLGPKDu5FLUqdQt6RlMSuaFV7+4pjam25GsVb1iruR80sqd2D+SfITC?=
 =?us-ascii?Q?s+Vm+qX66Agk0c+33iTwjrGEFPT6Zi4CzOQgETGq4ujxzY4BkelVF/uxvBdZ?=
 =?us-ascii?Q?C2SalbCWrmxdR4uq2phx6sp4VShoazscudmJ6vIq0EvPaVDXEmkJaL4WFO+T?=
 =?us-ascii?Q?u8jk8/X2g+Go/WLTWcz2Ng3PrG1HhgIFF/oBoFqL3tEGtZq4EVK5EeTfZ14/?=
 =?us-ascii?Q?QO4iLib6d5NcnTN7g7qQ81wyNX6sRdUFSmN7kAXTNnbfIRYYYCR/26V91EoL?=
 =?us-ascii?Q?D17pxk8gMPPi8Ia0fLzTTfU6mZR7DVTLn4GAkWT0bGwrb8A+mVr/jUEQCn6H?=
 =?us-ascii?Q?ihW0txTPhfv641fxvcWiF69F5ziHrPc2+iCMTu4iTo8G7HM50cA7s9ai9U96?=
 =?us-ascii?Q?JLMc/kyyzTdSCLOk+rYDb0nVQKIrhBZjjdUlkcj9gm7NCgCMdrs3Q56PKe7a?=
 =?us-ascii?Q?an49ivQPATZLGgInFCz6rOmmeUvUxrMc5uoDBwNOY49IYqCyJIK6TaZPBmEO?=
 =?us-ascii?Q?x60ClPSnblY7CnU2qZyaXaCMKec0Int3BQyWj/Izt9dVgD8JTRwp/FogtBIX?=
 =?us-ascii?Q?JgQUhU7xteB4uPM5A+5xahTo+OQB+MMmjIn5mM9UMdHN7ZkwR9n+iqF9Pag+?=
 =?us-ascii?Q?99RYBQnCNYiUwnq2VLUyjJzzxoD6Rp59LS88wEDPZBEN/wTeazcj+3sLJOsH?=
 =?us-ascii?Q?uVv8XwW5ivtINXM0v5Cttimhtb0K2XGGUj4swYTuurnJ1Moq+4owFOMAd/7P?=
 =?us-ascii?Q?6+d1UHf3ts5DZw1rJ+rGnKPTmCVMpJDwPpJ4CZOEmncEkIWsy3cyZWa6dUYu?=
 =?us-ascii?Q?RJsMBzdu5pWGn/afbAgJ1EMC17st6fCKnIxG7NGlphWW/IHFxwl9iEll1Gq7?=
 =?us-ascii?Q?9QE3d2pyj/8hBfbfJ3sQoks/FmjD/nj1CjZhK8oTRK+NZetmVxqBkFbyM7lT?=
 =?us-ascii?Q?SF5koQTIb2K8LapRgxodYr2PdSvRNIpj5exIIk9PRjYzW9IDZTjP4NgGrjBX?=
 =?us-ascii?Q?BiuYYwxZYoijkQ8QS43cHVcF0xV0SOkZX7Y+x4A0Mewh+RMVOUuDC7++3cR9?=
 =?us-ascii?Q?WQy7TWbfPY2I+VVhZxV4WsFLHELptsyBTeMnnn8z3MKxJku2SCbTHjIqtz/0?=
 =?us-ascii?Q?5Iw3OpwbiRnx/JbTNOYkZOvh/kAB2W1iOOsEOxiltk/TQZlXJwnyggZ87YgV?=
 =?us-ascii?Q?o3Htin7q6dYua1rFUoUgv6jRLkgfAfyw3FqvMfHwY41Y7JtENA507yidEMaM?=
 =?us-ascii?Q?f6MypA3/cBpmKZg3ImYqkKojVI7ODzWoyt0IH6PXorBVyRffBXejyX3NSDRi?=
 =?us-ascii?Q?lktiz/f9Owmy91is2NCu7CYIk7bGakxL6GQBbF3f8VDGKckS/W28sVH8FhSu?=
 =?us-ascii?Q?WmlBMP7Yd3ikFerbVq9/4NtaWl4Nvjpy/ODcl0cgfE0Iuy6aVzGQpqX6ElNT?=
 =?us-ascii?Q?WccVKarEvNR0C4GJDTJ7jvyImJgufFI066avOry8mCUHO4enNXY9RpS0U9Df?=
 =?us-ascii?Q?uOxfzcZmLTT5rWa/VvHTwEK/Jj3TaVRwFSzoRX7o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf67d006-5862-4dbd-272d-08de2681590a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 09:03:31.9332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4NAy+n4FNORH+shgIc+9Qi/CV39tArNzQlXLSVxJjkgOP1QgvwrE8ud6a3zkeVTKy7IfcVc1Cb/hJc5Lgw4qtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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

> Subject: [v6 12/16] drm/i915/color: Program Pre-CSC registers
>=20
> Add callback to program Pre-CSC LUT for TGL and beyond
>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT color op
> v4:
> - s/drm_color_lut_32/drm_color_lut32/ (Simon)
> - Change commit message (Suraj)
> - Improve comments (Suraj)
> - Remove multisegmented programming, to be added later
> - Remove dead code for SDR planes, add when needed
>=20

Bspec link here,=20
also if you can provide it as a reply so that I can verify the sequence for=
 these writes

Regards,
Suraj Kandpal

> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 83b0cb519e44..ac15a8b2c6b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3942,6 +3942,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb
> *dsb,
>  			   ctm_to_twos_complement(input[11], 0, 12));  }
>=20
> +static void
> +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_color_lut32 *pre_csc_lut =3D plane_state-
> >hw.degamma_lut->data;
> +	u32 i, lut_size;
> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		lut_size =3D 128;
> +
> +		intel_de_write_dsb(display, dsb,
> +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 lut_val =3D
> drm_color_lut32_extract(pre_csc_lut[i].green, 24);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Program the max register to clamp values > 1.0. */
> +			/* TODO: Restrict to 0x7ffffff */
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   (1 << 24));
> +			} while (i++ > 130);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 130);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +	}
> +}
> +
> +static void
> +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> +intel_plane_state *plane_state) {
> +	if (plane_state->hw.degamma_lut)
> +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3990,6 +4050,7
> @@ static const struct intel_color_funcs tgl_color_funcs =3D {
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
>  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> +	.load_plane_luts =3D xelpd_plane_load_luts,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.50.1

