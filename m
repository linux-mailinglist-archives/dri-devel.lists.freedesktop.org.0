Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99238916B6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 11:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5697112638;
	Fri, 29 Mar 2024 10:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyFe3Z04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759C112636;
 Fri, 29 Mar 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711707845; x=1743243845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2K9Aa/cNLqfpGllX/rl1Q4NWSBiDl8oOH2P8V2hP2PQ=;
 b=VyFe3Z04+0IhZgKi4lsMU+bsoqPT4VCva90qdiw07CEfEB0MXO8vs2gv
 V7uSak2eFSNa57zXirYaV+71pYTn/obKDJGue+8HKZ8pl5DPq2stj5JD3
 RG+Ht7nVbo9VhVaKzsa+XZud9X87HBZF9yjZkbR/ROmcYspLnm8hsEfv+
 0lM6XyJyrEleibL936H4BQFceBNbbcpJ3w2kZd0ENmu/3IRycks24fIkc
 +I1Dlt7/m8cfOBGCbBofDcW7NO7FwUma5CdEhiBosAv47kkoBWtd2+btq
 6U4xQdaVTGBSri86a+m0wGc4ifFb9VFEH8vBeNSNRYWbqvcnbWv7bJHaF w==;
X-CSE-ConnectionGUID: QkpjjS02SnmiMGvnmYAGfA==
X-CSE-MsgGUID: g1VhZjgLRvyRxN3P58afUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="32296721"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="32296721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 03:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16824600"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 03:24:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 03:23:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 03:23:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 03:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0T6k1prpB+Vd30Yenw6eiCQ18gINsD2zMMH2GMy5d/K14iyeo4sJRVFhtF/5Cyw3RLF3Q2drb6G4S4VUGGRM44TaeJOYQOK5YJ8j7mt7WfwusdyUHOjYxfheuoiU5DG8hrXpvK6T/jtscu3YSHT6slQubSPrpV0Dt6G0BEA54gztsSrNX6Mqs/93ErxaoG67d8G8Js3ik8A4cRJZ4vvp1e23HKqR4W02ivTX04mFwZtQ42/2QtvnuPly2f1nlq7yEjHOba9hhyL5Run7D1um5DXhhOkomSmEkO+SQ8H/TXGdLf/yzI+7AC4a93sILaufCXbwIphmTeP+FDvS+1AzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI1ASefyUOJKn85IBsNDxzoPHF3RA7ZzKbyPNd5orTg=;
 b=W5MBzQoyWk/RRgVIR7u6tghQLFMrP5cPUuG4C/cOJGwO6qpwvo9DcAvEx6dzc9NvoXIdPwe69pvjSossEfnmZnJT4eaxHg04T4rZK5jgJt2iIGnOXy42LLPHaqQdvh41OjFNWN9DaVFclTQTYSt6rRIroDwiYL+JIfG57l7oiYLvTP5lWTh+m22UhTyX3gv1QSob/3FMnvlD3F2tvTRN9T9K+zwBEQ3bHyUT0exQw1g+glGcKPwzhl59UYwnSyC0Zbx8YrNrgEzmihuxKqRzNk/9wt+kGfwjs061wXaLSJjCGbqMfGHgupFw5l6rUCpmrLH6ntnuTsuwdBq3mUU+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 10:23:54 +0000
Received: from PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a]) by PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a%3]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 10:23:54 +0000
From: "Musial, Ewelina" <ewelina.musial@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dim-tools@lists.freedesktop.org"
 <dim-tools@lists.freedesktop.org>
Subject: RE: [PULL] drm-intel-fixes
Thread-Topic: [PULL] drm-intel-fixes
Thread-Index: AQHagXkcrDge+umMhE6wurxD6jnO6bFOgvGw
Date: Fri, 29 Mar 2024 10:23:54 +0000
Message-ID: <PH7PR11MB70739AF793C80F58596F6C39933A2@PH7PR11MB7073.namprd11.prod.outlook.com>
References: <ZgYaIVgjIs30mIvS@intel.com>
In-Reply-To: <ZgYaIVgjIs30mIvS@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7073:EE_|DS0PR11MB7578:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JIiatAQTODhg3+Q3pRz/L6EFLIUMQvknw4ZdQu5qo7aAA3xfNyU0Ma6FCFK3XuLcp6aI0swJncKHS6ItiHNED2hlDmZ4+0lo/IbfawFRNAMwTTKo8E08jckCBw8BnoIG3Pz8Vss4p6ZwYfA9K24bRb+CjKp/Q2MmvnnWOLmwmx1/rC31cbqGkDdXATOwy93Ylhi3esyox0gn+QiLRVo2rL5JlHKmysmRmlejND4WF0LJVVSfCEkHg1aFDTS8AVSlXMa0MxQlSvcVB5M6qXN04tf/pOjFHBaN0S1yV8OCXjnyNlZHh3h3CBVlJ4DjgojuIifKvLqtzv7nvxJGiGAcec28GYlD5+2FfxNr+SLV2MGdRHG13pot5fsoguUerF/ghdkxjPjbB6hn7ueCa7y/KXNocka6ZhDBMWnUyjmdnM8a9Jv405OE63Q5SIZtrUUQaxwiOK+gIM3OgsJkhKNTSJg65etSGXX+lRUW6omMs33tWwX8Xd76ehlRz4dR3vmG++zr/uC2MZArQP1i2tIkeZKRO9qR8DruCVgZ7g48aQkn29CV6ABxOqA77yZ05DojiE3Ab1HVodwgxsf2mH9EJVEWx9spBiiX/afnnNQm8NFjOL+gOIFIG6dD1nNP6OFt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XKo8b2G6CLpiedkzWK0fp9Cf8/Mc3Q+h15aqNNM7sWKgArGsVoX15ZuhZK?=
 =?iso-8859-1?Q?nvkSLSKdrxd7kjy0G5ht3A67DeLSImKHzq92AvLG2ZbgwX3i2B62eoR7Xz?=
 =?iso-8859-1?Q?F9zM4VftodUEzV/o8JKLqh/GOnMV0NKF88i/gqIlxVvmYyFlr14Q/VoeR/?=
 =?iso-8859-1?Q?NMUzbUtRvW2/UqnnfZKbD8BWVQaVImAKTPt8Ueo51Nngz9ud4p0hwmehet?=
 =?iso-8859-1?Q?A7Orh9hC6VDa29YQxqLZvw+LB/r2WgWGCJSy3M2m3u2GMWjDOC2VjsGVQT?=
 =?iso-8859-1?Q?0A2QAFUUuyn0+YsKNDzJUXFOrnSh3E/AzQ65Vt54sj8u55cl/Alr+bsubk?=
 =?iso-8859-1?Q?0nZoY51odv7DBAW++GfZEQYPhyVqUW06MhxZxOZOYOIn6NmPdaSQA3nz4T?=
 =?iso-8859-1?Q?8nUZZ3FhojyYVKCk+s0rRf3EzL6apeEqeDYR+poOaoARiWweeuPWkk6k1W?=
 =?iso-8859-1?Q?1aF5xkajIBO66T+4PSvtAvFVGUdMbKdflxmjzaQQYDKxZgp2268VHuYZzv?=
 =?iso-8859-1?Q?3JDQII7yOOXOFFVWEjW8osah17NzUm79WuHKoyQu84VQuOk8XggcLM/VRV?=
 =?iso-8859-1?Q?C4bTWxV6ndrM6pAsZD3dXsRcpYjAjEVkF9c/CagXg34M3NJUzchHejAQmE?=
 =?iso-8859-1?Q?hHgIKQFzqjY3E5w7NGmKk0iDkHrM5d2yXMVSUVTLY85yEKRBd8gEbH95v2?=
 =?iso-8859-1?Q?nG4Tp9jEG+1xHdLtN0l3QBI8kfetOjxx/Bu6CK5LoE6KqIVk9eLfZfMHne?=
 =?iso-8859-1?Q?nf83KzUkH5+4TTGUpICnQ/94zHOcp6ibyb8Kh+fWaKdfPvSJX4ngvgmPCA?=
 =?iso-8859-1?Q?w0BnQGRE1hpJbTQuwd3E2mB2LVRUxh8IGA+1QKHB4kWddTCDs4GFmT765x?=
 =?iso-8859-1?Q?RZq8cuJUjRKnF8HKWXsMs0EiEWtDsKkvVKK5RRf71n5ov+T5jJa6L0eoAs?=
 =?iso-8859-1?Q?z7q/8Cj90iPZHXQDyANLSOZu3z7yTqE9tuyHvSnc+EWTn62WqFElGVcZzw?=
 =?iso-8859-1?Q?uMRdlQN7FV0Ux+MjydG3GnkeD++Ai1VsYeRGOI6E+k0fgrdr1szPgf4JG5?=
 =?iso-8859-1?Q?AfQRoVnYB7g/Yw4om1mTsHwdL9R0d9Su4/0zyYFuuaCI8bj/CgllgseGfp?=
 =?iso-8859-1?Q?OxOUrTnYAt8Ncj2dCeSaXC8UQ7F5ys/bHBqOCYVC7RHmF49S5ERm/dhHGK?=
 =?iso-8859-1?Q?cwd9SKtk1KDzPPQbA/nQgZ4liOUEw669i22nBIj21S2Sb8+4atmgaLxLJR?=
 =?iso-8859-1?Q?q4H65RW2ZpE4jwjRLP/z78/sC45YFuEUU2qv8NriZPIY/fVs5B68M/NU1q?=
 =?iso-8859-1?Q?GGAN39ERHDs23XtNjh2+cZOBankil/n0jzoGtJw/If1hYaPiVG3Ol+tr2S?=
 =?iso-8859-1?Q?bhVxysWfo3iYSZMK3XQtSUo/fhGy1yM66kzFzyD5d1G4z7JV92nIfOOY8c?=
 =?iso-8859-1?Q?OutNrXA3T5drZ5tGzLA8PRQf82dNwDcrv6yWF2E9VXUmptyq3okd/XdqJl?=
 =?iso-8859-1?Q?I2zZjrbDxisFSpXYmvyE3rDeHBEZCaJqOoSvte4rQDGZSngtTq4BxuXahu?=
 =?iso-8859-1?Q?trHOOBdk3JOZkNS/+SLSOlaeiY0s3tUhbAcptpgd0dba7+Jdv9XWSE1J7i?=
 =?iso-8859-1?Q?b33PgHQTnWSEJ1D01Ytgzd9VcbU7Hc4PbN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c03d44c-6680-4dfc-8833-08dc4fda562f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 10:23:54.7064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1H0QJ0spdEujII3kaNXWNg/SaSvS3tW5Fh4E+5cshDbon3B8JUI3Mdv487OGQ8lfNC0NDv4SH81yeyV8cdXVNIqrBkw5Vdn16cCnUyzUeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
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

Hi Rodrigo,

When I opened dashboard early morning all results were available, so I don'=
t think there was any issue during night.
It could be long reporting queue - reporting through AWS takes ages but thi=
s is not an issue with reporting, this is how AWS works.

Regards,
Ewelina

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo Vivi
Sent: Friday, March 29, 2024 2:32 AM
To: Dave Airlie <airlied@gmail.com>; Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen <joonas.laht=
inen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Vivi, Rodrigo=
 <rodrigo.vivi@intel.com>; Thomas Zimmermann <tzimmermann@suse.de>; Maarten=
 Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kern=
el.org>; Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Oded Gabbay=
 <ogabbay@kernel.org>; De Marchi, Lucas <lucas.demarchi@intel.com>; dri-dev=
el@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-xe@lists.f=
reedesktop.org; dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes

Hi Dave and Sima,

Here goes our first PR of this round.

Our CI is not working as I would expect:
https://intel-gfx-ci.01.org/tree/drm-intel-fixes/index.html?

Well, at least it caught some build failures on runds 832 and 833.
But after I fixed those, the 834 (with v6.9-rc1) and the 835 (with all thes=
e patches here) didn't show up yet. So I have run manual validation on my D=
G2+ADL here.

Everything looking good here, and it is yet -rc1. I'm confident that we can=
 move ahead with those while we work to get CI back.

Thanks,
Rodrigo

drm-intel-fixes-2024-03-28:

Core/GT Fixes:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
- Update a MTL workaround (Tejas)
- Fix locking inversion in hwmon's sysfs (Janusz)
- Remove a bogus error message around PXP (Jose)
- Fix UAF on VMA (Janusz)
- Reset queue_priority_hint on parking (Chris)

Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP (Ville)
- Disable AuxCCS for Xe driver (Juha-Pekka)
- Revert init order of MIPI DSI (Ville)
- DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
- VRR related fixes (Ville)
- Fix a JSL eDP corruption (Jonathon)
- Fix the cursor physical dma address (Ville)
- BIOS VBT related fix (Ville)

Thanks,
Rodrigo.

The following changes since commit 4cece764965020c22cff7665b18a012006359095=
:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-20=
24-03-28

for you to fetch changes up to 32e39bab59934bfd3f37097d4dd85ac5eb0fd549:

  drm/i915/bios: Tolerate devdata=3D=3DNULL in intel_bios_encoder_supports_=
dp_dual_mode() (2024-03-28 12:16:17 -0400)

----------------------------------------------------------------
Core/GT Fixes:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
- Update a MTL workaround (Tejas)
- Fix locking inversion in hwmon's sysfs (Janusz)
- Remove a bogus error message around PXP (Jose)
- Fix UAF on VMA (Janusz)
- Reset queue_priority_hint on parking (Chris)

Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP (Ville)
- Disable AuxCCS for Xe driver (Juha-Pekka)
- Revert init order of MIPI DSI (Ville)
- DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
- VRR related fixes (Ville)
- Fix a JSL eDP corruption (Jonathon)
- Fix the cursor physical dma address (Ville)
- BIOS VBT related fix (Ville)

----------------------------------------------------------------
Bhanuprakash Modem (2):
      drm/i915/drrs: Refactor CPU transcoder DRRS check
      drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status

Chris Wilson (1):
      drm/i915/gt: Reset queue_priority_hint on parking

Janusz Krzysztofik (2):
      drm/i915/hwmon: Fix locking inversion in sysfs getter
      drm/i915/vma: Fix UAF on destroy against retire race

Jonathon Hall (1):
      drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()

Joonas Lahtinen (1):
      drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c

Jos=E9 Roberto de Souza (1):
      drm/i915: Do not print 'pxp init failed with 0' when it succeed

Juha-Pekka Heikkila (1):
      drm/i915/display: Disable AuxCCS framebuffers if built for Xe

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018575942

Ville Syrj=E4l=E4 (6):
      drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
      drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, most=
ly
      drm/i915/vrr: Generate VRR "safe window" for DSB
      drm/i915/dsb: Fix DSB vblank waits when using VRR
      drm/i915: Pre-populate the cursor physical dma address
      drm/i915/bios: Tolerate devdata=3D=3DNULL in intel_bios_encoder_suppo=
rts_dp_dual_mode()

 drivers/gpu/drm/i915/display/g4x_dp.c              |  2 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |  3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 46 +++++++++++++++++-=
--
 drivers/gpu/drm/i915/display/intel_cursor.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 12 +-----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          | 14 ++++--
 drivers/gpu/drm/i915/display/intel_drrs.h          |  3 ++
 drivers/gpu/drm/i915/display/intel_dsb.c           | 14 ++++++
 drivers/gpu/drm/i915/display/intel_fb_pin.c        | 10 +++++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  4 --
 drivers/gpu/drm/i915/display/intel_vrr.c           |  7 +--
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  3 --
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  3 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  1 +
 drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  | 37 ++++++++--------
 drivers/gpu/drm/i915/i915_memcpy.c                 |  2 +
 drivers/gpu/drm/i915/i915_reg.h                    |  2 +-
 drivers/gpu/drm/i915/i915_vma.c                    | 50 ++++++++++++++++++=
+---
 22 files changed, 162 insertions(+), 63 deletions(-)
