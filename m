Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7613D7ADD83
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2058710E0D3;
	Mon, 25 Sep 2023 17:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A8910E0D3;
 Mon, 25 Sep 2023 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695661238; x=1727197238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jg3fkgDtcYJFuqVPk3Zduam8lOTOpzKGG4XB+e236+Q=;
 b=X4pYylOUQCHYwwxzuwhgtD7bk+OWsaQChMYoROLelADmyvTi8I+QDOjV
 3ZM0mYaHKQwx2u4FZQAh5MtaqRj8G8/YfymoJh6SrmHvJHKndwSHirSFQ
 ZgZgoUlIffywuoTcb6wHWpTuneoFXLEa8gOwv9lzhCYLUHQ/m2H4gcRrJ
 IKQN9beJrvQiCfBIbhg952VdWMwx4Zf13ZTyGw56zBqNfQVjUTnxY3+AC
 pnnVD8fwmoLPCMV+2bCs2FF0Hpq7Wn7J3aOWorNT0rx6mc8uekphtTUeR
 djho+bigOuwK4NLjn6HBIiTTIa9BfXlM2ziQaaf8Ja7qyWNmF3a0gdLmF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361555857"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="361555857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 10:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725052777"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="725052777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 10:00:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:59:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 09:59:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 09:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4X1WM+isjGHkJok+EkEVCbChcTdtpFzaaFWJiOR2owtw1Xot4ZMXOJWjqxMNbToaumiPwDCLzZQVvZ4YLT0QEhmeX+24+smCudlKDf6Nmp1H7fgEJ0OMY7AV+YzBZyoBptR4pAtzLt48VCuoFoUX4Qd07e8ZtyMTP7AFFDtSGXPNY+/z9qts3P8w6jz1TduGUNliJ5moie43NlghELop5gNakzUF8W0LismJbTDi4GsdWvT+ExegvLBt26HsGxmhEKgfNftflIrHQOlf5LtsnkGUOWHcoktq9QpmlO+5O/lPJF3ZIhEYRlW3uMsYvpEUX7fw8rXHgk6m9L8etbUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2PeOtP5xCLRmuiPA1wkTyJZSoz9LDp992ExSNbQKW8=;
 b=NWcFoHDHV36sv8Ffrfw0UrzgCQwSKxS3ofTSoJ/HOjx2A+cNiY1K8lYDPemWlSrqOxeFy2I69DmKB/J5lPPVSIkm0dSScM9bX7H+5DjB2W+beNkuc9sMecInkbhL0v/Sb0Qxe72DlVQdOKyYzdFmyP6DbGLdo5MfqE2zuzz/s8zhJtKOkewWAEVDFAgyJE+eUJxAFBVARQ5TMMotJ83FkDL/ekulEhIOA7ny0aMwMY62Zx6WmDqH2mmgV1WLwOeh+gbNx8AXUVpbayesYx6fj+6SuoWe8aLH71N6zHfWoizme9kH6v5/bLFiOM5EjozW516HCyB+5bDxksjQbI00Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 16:59:55 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 16:59:55 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/6] drm/edid: include drm_eld.h only where required
Thread-Topic: [PATCH 3/6] drm/edid: include drm_eld.h only where required
Thread-Index: AQHZ4W267LwbEnTnckqDn+XvaJaKxrAr2cvQ
Date: Mon, 25 Sep 2023 16:59:55 +0000
Message-ID: <IA1PR11MB63489B80E1C62FF71F7342EEB2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <d4f0141ad179557f43035a53a49c9ee53e8a0a84.1694078430.git.jani.nikula@intel.com>
In-Reply-To: <d4f0141ad179557f43035a53a49c9ee53e8a0a84.1694078430.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ0PR11MB5214:EE_
x-ms-office365-filtering-correlation-id: fc790f75-27c7-4336-9d3f-08dbbde8d7ad
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hIv5qFIQpaiOZ7x26O/gA8Vrkv0pwSDH1NVh0fF4hBh6SVpODkm7XSxe83TILuZWO3sn8wljkiEyWn3xOO67gOUFIY3XlbnWJzM3GkBK2jN1yAhecTWSW3ZManUMeV6Z6dg4FTnrg8vIXOqFFUhbArF+nsLWv+7dfeYehBD5il6rQl6L6yrXg3iYET+V1nz2pmgGVVcnZa6u2deV7Byc6HnGEDl2UtNEQzX8VJExYot0BWXXx3Gz3jco+3oi388rCUnlTgRDm0WVXIH4bYQe784DDdRA16ySCCpRUnyC7yPpNvpZ+Qy7DW/usa/mEODBt4csI53nYFTd4N5UjgwmoZXhZY0T0fBH3v6r0J3UkPjDnMmfXuBLkSm/Rnrro0zw+E8Ro6mWcVnKs32sbmXYn8ywvlbzqfkdtF6ZAxKG85Hn0L2tvE4RRHNeKs0zxypSBxM+BUA77R09zRMpXLWg5F5IO93ZgNsRo9Kwx66ESG8b424OdRwwvWvX531EGsT0AaWDN/ocQj43J1zyddYo94NQ90wYB6dciRLlAiOwymuCKM/aCo3ByvlS4X1HulndM2SEP9DP7+OFvMKpCjUNfMWywgcP2Piky2p+d/Vx6f1FcEvBCT/HqOf4s18e31O3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(5660300002)(110136005)(66476007)(66446008)(450100002)(64756008)(66946007)(66556008)(76116006)(52536014)(478600001)(71200400001)(55236004)(53546011)(9686003)(7696005)(26005)(6506007)(8676002)(8936002)(4326008)(316002)(41300700001)(83380400001)(122000001)(82960400001)(86362001)(38100700002)(38070700005)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?npQHvTqtfO0OH7Yk7s2AZf38zajlOZjjRWsk2GZUUAUmMAaP4bCsZpXE3U4C?=
 =?us-ascii?Q?6qnHIpI/Hr1InJ23FjuBvAlxoAGdE92CMM2tVvx6zw0MJzPKr2twvQUU/DfO?=
 =?us-ascii?Q?tTAWVAv9JafihPbkjsY5PuuWwHWncEXvzc+IyQJevBNyqmKb1sNEIp0C6yKM?=
 =?us-ascii?Q?meU3pGHQ9u8bjienpQV3X5uVFtjlwUN3v9gHCHWT6FRy5U7vEH8m3eW86d6W?=
 =?us-ascii?Q?42fKK3OzjqiUSvWBxxo93AoV5UMO1GZFtRO82/NKjZ/TZY5Td73DanEJEQVe?=
 =?us-ascii?Q?pRKSTz8uR5Q7y7v5JhaBk7xhEqzOMP+Zh7nrDki1iHbVv11VjA0RuLNbruL9?=
 =?us-ascii?Q?9npdALvFvtEesEwkI9+q7eQUzYU02aYUemNtyQqiET/HJpkdg4/m8NvDGPpO?=
 =?us-ascii?Q?77ZWDuZVzzBNXyUYM5uH1MW1AwvbgplYRO/vjwpXyKgd4i8fymkSOUJmpBIt?=
 =?us-ascii?Q?P0oCkkinxxEZsJ81W2HRRC19OFmVCZp7/aDNU0+H4l2spP56sOoKXKgrcA9/?=
 =?us-ascii?Q?XXFwQoXpiCLxZ0EqSb6TNBDBylAYjYWMozWt1OiSV8NsreclrhrB5KzDhwX0?=
 =?us-ascii?Q?8g9b511tVE5zSG5xldTjcAkb3nxuzeLvgSS9N2ysqhdGsaMJns2oVeXZFaye?=
 =?us-ascii?Q?t4qmddY+79rSHzor4i4NpcqmH8apEzHH2PZHfB43LyApCH1zzHPJMvm2kC+f?=
 =?us-ascii?Q?rfVv6M2uzZIUqlNwpc39qA7mSVj5SB80mQqjIFxu4McZ7oU37JKiAK8KuhYW?=
 =?us-ascii?Q?J+QoXlZHZ5R0GUhj5aih9w7hgrcqHy5ivZAVaWpO8P8dD+I76jRTZR5JHUJQ?=
 =?us-ascii?Q?e0un628vZDl022IMYmO3GqNlP2u+oQlbMh5J9VG6lsRcbofXIgq+FhzZnlw+?=
 =?us-ascii?Q?tZ/Tq1giFLGGmAO33JXbvorNcSiW2umKUNj6YgDY842RRnsrc076qmS4Zsn1?=
 =?us-ascii?Q?Pr4R/EE7bu2papEAh6vNOg2xY+LNohpq54uRck8OnjiQ0bdOZKLLvCpBKwLG?=
 =?us-ascii?Q?CgP4BnbO+NB8jtL3sjIJYEfjxZKCjU07XKslpe5+x7KPNWsPrm6IjIMHs57x?=
 =?us-ascii?Q?f7+69mbU92izCapnoCzIHPfTWsiWQpPvga0R9DqSI/Njd1fI/uCEfB5+oX3C?=
 =?us-ascii?Q?XpXS3GAjfmrjDQByHalsBtqcK2HdoOeKk2SUI1gXYkj7cYlI4jtYNKtPKS4d?=
 =?us-ascii?Q?KaZ7eqztItO0DBV9hIX08vqeU215mUB3ALl5cJ9e6h8N+sJ8r2RFuwV6CEcF?=
 =?us-ascii?Q?2UofkNhwGfoLRhcmYcGI9eFgF/RedH+jSueurokBFUjSM/yjtdWG7QlS1XOl?=
 =?us-ascii?Q?J/1bsyQguIIa9S+U/0HXIXX3CWV01J3ILb5OX7OIOQLU0gFXdAEwCrmQ6M8Q?=
 =?us-ascii?Q?LNu1/bKMcciTJRXe2eO0MWGZg3pH1DGjZt1WyPHVRBGbtw4T44HFn3lfDSgQ?=
 =?us-ascii?Q?TEZJnmwsPrqdpQ7Cmrd27Vc9E2vK7ALwecHRdetqWni+OXg3UPNJz6iiWk0i?=
 =?us-ascii?Q?aoBTRtjAZWfiIydV6P6yY8kABkmsEqN7hcwHD7bZbttJN72uzVo7D/ku1KrU?=
 =?us-ascii?Q?7Y2xWpTVzmcV3yocHS4ouqhLdtofgXRwsnYdOdRQU4kHH9zNonfzqw8y5c0e?=
 =?us-ascii?Q?x4MIEgS+W4JiTF8irP0HWh8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc790f75-27c7-4336-9d3f-08dbbde8d7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 16:59:55.1102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5/8I2kJH7ky4FIHARzmdBCrzkEF+0NGxX22S9TSE9hoMJA/RK+irgUOAgkRA5tucyDBxvPQShV0VyNaqMVKS182DZDvav3odYmCUkQCHXQUyKrgeojOTDtoWZ7wIdxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Thursday, September 7, 2023 2:58 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>=
;
> Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [PATCH 3/6] drm/edid: include drm_eld.h only where required
>=20
> Reduce the dependencies on drm_eld.h. Some files might be able to drop th=
e
> dependency on drm_edid.h too with the direct inclusion of drm_eld.h.
>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 1 +
>  drivers/gpu/drm/drm_edid.c                           | 1 +
>  drivers/gpu/drm/i915/display/intel_audio.c           | 1 +
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 1 +
>  drivers/gpu/drm/i915/display/intel_sdvo.c            | 1 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c              | 1 +
>  drivers/gpu/drm/radeon/radeon_audio.c                | 1 +
>  drivers/gpu/drm/tegra/hdmi.c                         | 1 +
>  drivers/gpu/drm/tegra/sor.c                          | 1 +
>  include/drm/drm_edid.h                               | 1 -
>  sound/core/pcm_drm_eld.c                             | 1 +
>  sound/soc/codecs/hdac_hdmi.c                         | 1 +
>  sound/soc/codecs/hdmi-codec.c                        | 1 +
>  sound/x86/intel_hdmi_audio.c                         | 1 +
>  14 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 268cb99a4c4b..fe7e307ae7f9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -86,6 +86,7 @@
>  #include <drm/drm_blend.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
>  #include <drm/drm_gem_atomic_helper.h>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c inde=
x
> 39dd3f694544..2025970816c9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -41,6 +41,7 @@
>  #include <drm/drm_displayid.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_print.h>
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c
> b/drivers/gpu/drm/i915/display/intel_audio.c
> index 19605264a35c..39f5b698e08a 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -25,6 +25,7 @@
>  #include <linux/kernel.h>
>=20
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <drm/i915_component.h>
>=20
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 8d4640d0fd34..fcddd6d81768 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -4,6 +4,7 @@
>   */
>=20
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>=20
>  #include "i915_drv.h"
>  #include "intel_crtc_state_dump.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c
> b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 135a2527fd1b..6abae283998e 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>=20
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 4e7c9c353c51..9332aa633867 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c
> b/drivers/gpu/drm/radeon/radeon_audio.c
> index d6ccaf24ee0c..279bf130a18c 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -26,6 +26,7 @@
>  #include <linux/component.h>
>=20
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_eld.h>
>  #include "dce6_afmt.h"
>  #include "evergreen_hdmi.h"
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 0ba3ca3ac509..a1fcee665023 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_eld.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c in=
dex
> d5a3d3f4fece..83341576630d 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -20,6 +20,7 @@
>  #include <drm/display/drm_scdc_helper.h>  #include
> <drm/drm_atomic_helper.h>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_eld.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h index
> 1ff52f57ab9c..e98aa6818700 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -25,7 +25,6 @@
>=20
>  #include <linux/types.h>
>  #include <linux/hdmi.h>
> -#include <drm/drm_eld.h> /* FIXME: remove this, include directly where
> needed */  #include <drm/drm_mode.h>
>=20
>  struct drm_device;
> diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c index
> 07075071972d..1cdca4d4fc9c 100644
> --- a/sound/core/pcm_drm_eld.c
> +++ b/sound/core/pcm_drm_eld.c
> @@ -6,6 +6,7 @@
>  #include <linux/export.h>
>  #include <linux/hdmi.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_drm_eld.h>
>=20
> diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
> index 8b6b76029694..d1b53fc1efb6 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/hdmi.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>  #include <sound/pcm_params.h>
>  #include <sound/jack.h>
>  #include <sound/soc.h>
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-
> codec.c index d21f69f05342..9b01d060f7cc 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -17,6 +17,7 @@
>  #include <sound/pcm_iec958.h>
>=20
>  #include <drm/drm_crtc.h> /* This is only to get MAX_ELD_BYTES */
> +#include <drm/drm_eld.h>
>=20
>  #define HDMI_CODEC_CHMAP_IDX_UNKNOWN  -1
>=20
> diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
> index ab95fb34a635..02f5a7f9b728 100644
> --- a/sound/x86/intel_hdmi_audio.c
> +++ b/sound/x86/intel_hdmi_audio.c
> @@ -30,6 +30,7 @@
>  #include <sound/control.h>
>  #include <sound/jack.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>

Changes LGTM.
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  #include <drm/intel_lpe_audio.h>
>  #include "intel_hdmi_audio.h"
>=20
> --
> 2.39.2

