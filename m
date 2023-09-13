Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFA79DF36
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 06:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA0010E1F8;
	Wed, 13 Sep 2023 04:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470D10E1F8;
 Wed, 13 Sep 2023 04:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694580148; x=1726116148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihA7keWLzxO8Ei0e9UwsyjCXNBzfoFLjsinSRbOf3WI=;
 b=d6swafCk9VkoSHnkRGi658kvtFqtiMaxtBIa3zTYD+8R9c7jvA5r4Z3O
 Ab/9sBhSJ292KFZh+glFI5xpUtD2s5Xp/6HQzyNGdLwEZDGn32A5O/+SC
 HoEwPwpX+olO6PONz5sfH8knF+gv0uXo7e81SriI4SmdL/14Iu2dRf578
 8KXmJRQjNug0oMXlUHPmjM69XyPoUqmybzfJIdQi6h3b5N2W0mfTaFpLj
 /U9kUbXyRF7+bNG3KEyQKRNFKjwVpHplMX9WKvKOeQk2iPbpJ3DT4o6nm
 ciQNerWW0Ccq8R7Y5PuU0jRXkDT4jXH00K87khF/2BiUuQqpkADxbrird A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377471699"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377471699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 21:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887186847"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="887186847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 21:41:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 21:42:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 21:42:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 21:42:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 21:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROsqQ5c6k+BGWByNxJYJwzHjLMEAjqcNS25XdL8iCX3AuTgA5UfBZ361+cFrkzMsITeBmkd5JirMYu3NmYLPQoHznsgtxI3GIwmZxz/NUZgAekcO0JMoXx/GwgAHUZnZg9hb5koxHVf1lDojKNBzfAe43tCjLPfKNJRpdLMXE3aPdOkfTRbKjEZfxEeJwbxawzq22JOu1XQqbkps92x6xgz7dGfVte/UDlySV6X7dNZvGPbHgb/PjS+SLKpDWWuz1JuOWtsrjtQETw1GyRHe4cjphmSDbkBRLh4aBI4dPiNhTP8XeAsSpCfr45B89gBCBeXBbo5MrXQszG2QNaxm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUMqvSgjmyCRKbz8NIe0VPuRXyNshjH1ERp33Ug4JaI=;
 b=DL9oGk//nD871/t6CiP87iAS4oPkL08f89kYougR7dNrCGKMEWE6mVo050FKpc+vfB/whjX0tqniwsI3OYSRf5Am1B/xBjHAWEHqNdcbmV0tURdX4AmxC06F02lYr1sEclcGE7X/Qb6bB9nMtq9Hem9opXpQdCHrsndsPH7iy6HuApzqpDhuHqXQf/lRdjkqyYZNtMRxOkwbWZBMCEBfj8/trZhdBOarTQuUBfv8jMBwABqIfGrjKkOYKOsc1biTbm3nOpTVlrJ69sDxiIlT3Qsc2pNpeZFsr7Sn5S58bAzC7Cuk7uso57et6a5MKwfyn/+E8DekFx/nJupFtcoI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 04:42:23 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 04:42:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
Thread-Topic: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
Thread-Index: AQHZ5ZhCUUroEnxaY0CLQFv+qdE0zbAYLcPw
Date: Wed, 13 Sep 2023 04:42:23 +0000
Message-ID: <SN7PR11MB6750262E1E2BD25F64C9BB16E3F0A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230912163735.1075868-3-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20230912163735.1075868-3-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB8246:EE_
x-ms-office365-filtering-correlation-id: c5f91680-0ae0-4c10-67e2-08dbb413d267
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mpSrHTJXWMUj5p9vJJa2nnAIkgvQqvn8tAf0vKgq+QnRSj6nE09qASEeosSdqPn913dQxUqF5UvxVl8+Jpa6dhvu8dp20xBOOOdGhtRympFUEwt5W2BHA6U8PgLZuxs33+TG2fJ6tF335tEIMeEm5RSqMiIO9gMQFogor9fTj91gNuCvYPGxJvFzwTpT82aXwVqmoGxRpNHsmlN8JsfIkZnIuOa7TxN2S5D1WqET1Z4pWGCf/BgtTQ1pL992oY4AaQmq2BHgUPZEFfzs2y8ea0nZgrgFHo4hn7YT4EsJzTz3/HxFGR5nfYX26HmcZeho5jGa/MR1hjsXKZYhEJa/V7yKw/vbN0fZihmPAcO3QMhFksiovxTNPBOTnrNUc/OdD9SaWcq8IFAC4rocHFbPehRqq+aFKHoFXzQkAWnXgsDBqbdc5yzyajCNPczEHQXTu7QGRO5RPmz9lICcP5FtTeIYAiJUeIzKPNkImokHXaqRCJLJKa+TNtuOQFK7WF7szDXJOK10GZTpILLTkpG+Dwdf40/2DlwgQ10iaFExIrxnaXSIn/SWSgwaCHx1dWNYxa3Ryw4FYVeJkUr+OVXKYZnY/82tqsW+6vh+r8Uw2XgBviW6o7S+OJI0oJ7vfh2c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199024)(1800799009)(186009)(66899024)(5660300002)(450100002)(52536014)(4326008)(41300700001)(66946007)(66476007)(8936002)(66556008)(8676002)(316002)(64756008)(66446008)(54906003)(110136005)(76116006)(122000001)(71200400001)(83380400001)(478600001)(38070700005)(33656002)(6506007)(55016003)(30864003)(86362001)(26005)(107886003)(2906002)(38100700002)(7696005)(9686003)(82960400001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JxDbQOgtXj+4hYNRHhbeOEab23Bzav3lrs0jPinrLj7YnAO5+lKqEi9tdB?=
 =?iso-8859-1?Q?7lWZgjd7F7+dbgiAcXUgGwynG1Ef/pN8W3SfyVmFfPLbR/ly/6wtNHdvT1?=
 =?iso-8859-1?Q?KEISw4QQp9cNHJfTM6bWXHGSi51HGn6sbO4WYhATvLhzqBZsxsj4iqHSMw?=
 =?iso-8859-1?Q?UaoaGzLueFEihnG+uGBSF+pn3DY6aGNcvCEhf4ugw296k/X9PMEGxOE9FK?=
 =?iso-8859-1?Q?atkXZUZl7psKbgV1GeZW3kImExWYPu9kTIbyOgQtF4ppQbnZgvbtU/G3TV?=
 =?iso-8859-1?Q?Lsikf5FxWHTHRLNp3Rbf3F2dSw9EgDpfz0t+NMayAroNX6IxiI/Pg6v0mq?=
 =?iso-8859-1?Q?M7uFBQgag2DMIKdyYa6Qws7NvHyrF87x1Oc/M803va0/fd1Ce3pK21lQ6O?=
 =?iso-8859-1?Q?KqowEgvuicpKXrtfRtAZ8wn+jeqURZ/0gG7hrv/vAtwQ4lu28esGVinN2G?=
 =?iso-8859-1?Q?10g9srESOSIzXuEKbqWAIVMY3zADMgfSRd1ZpVElEtTAkedYYv1oedxZi2?=
 =?iso-8859-1?Q?mdflIg2ztTCl0ylHY97I71taqbYoYxUsQsiWsDApMOl3DYUy9A3rCIxZ+U?=
 =?iso-8859-1?Q?jTrPYgCW5zGBMNR3QtZ703+9hOJ/F3J/sLthL4PR5msAqLfvSlX9fJhH4l?=
 =?iso-8859-1?Q?8EvYyZP3VsCTpTT7iiURIabr7NN9WVTOLqasmfOCTkcq0AHsa8TFAJvuqW?=
 =?iso-8859-1?Q?DBC7xgoscFrtJj+6eN5kUfewiMZ+sKLMCR0ZHt+BemeiYCNMjtOQkdTNJ3?=
 =?iso-8859-1?Q?+dB3fiB2Lgx1IQNHFKlKSc2dpzOShDDFfVWa5yBn7ANZiWq8JdKc7bndW/?=
 =?iso-8859-1?Q?alBX/r694MrmIlureeouySEkgerfZ6dcXYq5WS61Qf75uJ9K+jj7BL5UE5?=
 =?iso-8859-1?Q?2B1dOhKa4LSqcf6HfotjS83FoeedcO1XRwwMqmmBlSmbo01a04ws+oHqGm?=
 =?iso-8859-1?Q?44LdHwvXjOQGx9afodNey1VZq9lncrLzsAjMqcbar5mYr8yVFrK9MRU8e5?=
 =?iso-8859-1?Q?uu1t7zaar8L3UZYKMnCBCMg9I1FQ6D9R/z++D/a1fglPOsBxBa34woDWCt?=
 =?iso-8859-1?Q?ZheGDh3a+QLWmAUi6nefOHeBM+d1kMuqwBKr/hpyVKIM55SPkA2W+wfO0j?=
 =?iso-8859-1?Q?2YCtFOKLFF07ciknLYoqCJgYPpYrmamc710QxE96J7SItodohE2xzNfQ/d?=
 =?iso-8859-1?Q?zzbiOa0Wdszajwq1jiXZV5lvxg1p+bskQqh9aJov1/YPaVmsmfSWtgXUXH?=
 =?iso-8859-1?Q?zup4Nj6UuQgVdZz1Sa/7MLM9zqpf9wCFtF0lg6t8VJUbR1d9kMudRGNA0k?=
 =?iso-8859-1?Q?ciWBTGpHBci8KAHSMbOQUs7DAWQNNoHr7PFPF2eEyPGdtAa0ufWWfey+DS?=
 =?iso-8859-1?Q?VAeHp6P7Q4bByndoOZlyIx17zc5Qufb0RZZCYucjAs/9//T5Hh4TwADfAy?=
 =?iso-8859-1?Q?+Z+z1z4RuF2eaLBY7oUW9bUC1jBhy81+ZtmpH4dz0jYWcuKa7UZKosVREr?=
 =?iso-8859-1?Q?KIhfDhqyRNogRRjNlQGlTXLb5hv4ldFCqjkTO84/hDeFWWCvSUDeq8P9a+?=
 =?iso-8859-1?Q?794Qtu9NGyzZJQ3fEXRZe8RxAXWG5Y2i2KPd63U16CsEUVoOsQXSzOqOD0?=
 =?iso-8859-1?Q?LeW2Jc4ZwD4xYgW7HPilHCOMFJNdJ4YZPb?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f91680-0ae0-4c10-67e2-08dbb413d267
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 04:42:23.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/VNArfPI1zCa9QyWrtLh0SUEjUKMS5/3azudehYPxkcNI0CIx2B7Gg7AONyxXPa4c5q355RVjfqkVPB+XP2Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Golani,
 Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 forma=
t
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> DSC parameter bits_per_pixel is stored in U6.4 format.
> The 4 bits represent the fractional part of the bpp.
> Currently we use compressed_bpp member of dsc structure to store only the
> integral part of the bits_per_pixel.
> To store the full bits_per_pixel along with the fractional part, compress=
ed_bpp
> is changed to store bpp in U6.4 formats. Intergral part is retrieved by s=
imply
> right shifting the member compressed_bpp by 4.
>=20
> v2:
> -Use to_bpp_int, to_bpp_frac_dec, to_bpp_x16 helpers while dealing  with
> compressed bpp. (Suraj) -Fix comment styling. (Suraj)
>=20
> v3:
> -Add separate file for 6.4 fixed point helper(Jani, Nikula) -Add comment =
for
> magic values(Suraj)
>=20

A lot of checkpatch issues have been created due to the renaming you can fi=
x that.
Other than that everything else looks good

Regards,
Suraj Kandpal

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +++---
>  drivers/gpu/drm/i915/display/intel_audio.c    |  3 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  6 ++--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +--
>  drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
>  .../drm/i915/display/intel_display_types.h    |  3 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 29 ++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 22 ++++++------
>  .../i915/display/intel_fractional_helper.h    | 36 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |  5 +--
>  10 files changed, 85 insertions(+), 37 deletions(-)  create mode 100644
> drivers/gpu/drm/i915/display/intel_fractional_helper.h
>=20
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c
> b/drivers/gpu/drm/i915/display/icl_dsi.c
> index ad6488e9c2b2..0f7594b6aa1f 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -43,6 +43,7 @@
>  #include "intel_de.h"
>  #include "intel_dsi.h"
>  #include "intel_dsi_vbt.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_panel.h"
>  #include "intel_vdsc.h"
>  #include "intel_vdsc_regs.h"
> @@ -330,7 +331,7 @@ static int afe_clk(struct intel_encoder *encoder,
>  	int bpp;
>=20
>  	if (crtc_state->dsc.compression_enable)
> -		bpp =3D crtc_state->dsc.compressed_bpp;
> +		bpp =3D
> +intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>  	else
>  		bpp =3D mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>=20
> @@ -860,7 +861,7 @@ gen11_dsi_set_transcoder_timings(struct
> intel_encoder *encoder,
>  	 * compressed and non-compressed bpp.
>  	 */
>  	if (crtc_state->dsc.compression_enable) {
> -		mul =3D crtc_state->dsc.compressed_bpp;
> +		mul =3D
> +intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>  		div =3D mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>  	}
>=20
> @@ -884,7 +885,7 @@ gen11_dsi_set_transcoder_timings(struct
> intel_encoder *encoder,
>  		int bpp, line_time_us, byte_clk_period_ns;
>=20
>  		if (crtc_state->dsc.compression_enable)
> -			bpp =3D crtc_state->dsc.compressed_bpp;
> +			bpp =3D
> +intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>  		else
>  			bpp =3D mipi_dsi_pixel_format_to_bpp(intel_dsi-
> >pixel_format);
>=20
> @@ -1451,8 +1452,8 @@ static void gen11_dsi_get_timings(struct
> intel_encoder *encoder,
>  	struct drm_display_mode *adjusted_mode =3D
>  					&pipe_config->hw.adjusted_mode;
>=20
> -	if (pipe_config->dsc.compressed_bpp) {
> -		int div =3D pipe_config->dsc.compressed_bpp;
> +	if (pipe_config->dsc.compressed_bpp_x16) {
> +		int div =3D
> +intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
>  		int mul =3D mipi_dsi_pixel_format_to_bpp(intel_dsi-
> >pixel_format);
>=20
>  		adjusted_mode->crtc_htotal =3D
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c
> b/drivers/gpu/drm/i915/display/intel_audio.c
> index 19605264a35c..4f1db1581316 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -35,6 +35,7 @@
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_lpe_audio.h"
>=20
>  /**
> @@ -528,7 +529,7 @@ static unsigned int calc_hblank_early_prog(struct
> intel_encoder *encoder,
>  	h_active =3D crtc_state->hw.adjusted_mode.crtc_hdisplay;
>  	h_total =3D crtc_state->hw.adjusted_mode.crtc_htotal;
>  	pixel_clk =3D crtc_state->hw.adjusted_mode.crtc_clock;
> -	vdsc_bpp =3D crtc_state->dsc.compressed_bpp;
> +	vdsc_bpp =3D
> +intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>  	cdclk =3D i915->display.cdclk.hw.cdclk;
>  	/* fec=3D 0.972261, using rounding multiplier of 1000000 */
>  	fec_coeff =3D 972261;
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
> b/drivers/gpu/drm/i915/display/intel_bios.c
> index f735b035436c..df3e80a0cd01 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -33,6 +33,7 @@
>  #include "i915_reg.h"
>  #include "intel_display.h"
>  #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_gmbus.h"
>=20
>  #define _INTEL_BIOS_PRIVATE
> @@ -3384,8 +3385,9 @@ static void fill_dsc(struct intel_crtc_state *crtc_=
state,
>=20
>  	crtc_state->pipe_bpp =3D bpc * 3;
>=20
> -	crtc_state->dsc.compressed_bpp =3D min(crtc_state->pipe_bpp,
> -					     VBT_DSC_MAX_BPP(dsc-
> >max_bpp));
> +	crtc_state->dsc.compressed_bpp_x16 =3D
> +		intel_fractional_bpp_to_x16(min(crtc_state->pipe_bpp,
> +				     VBT_DSC_MAX_BPP(dsc->max_bpp)));
>=20
>  	/*
>  	 * FIXME: This is ugly, and slice count should take DSC engine diff --g=
it
> a/drivers/gpu/drm/i915/display/intel_cdclk.c
> b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index ad5251ba6fe1..55d46947d7ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -34,6 +34,7 @@
>  #include "intel_de.h"
>  #include "intel_dp.h"
>  #include "intel_display_types.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_mchbar_regs.h"
>  #include "intel_pci_config.h"
>  #include "intel_pcode.h"
> @@ -2567,8 +2568,8 @@ static int intel_vdsc_min_cdclk(const struct
> intel_crtc_state *crtc_state)
>  		 * =3D> CDCLK >=3D compressed_bpp * Pixel clock  / 2 * Bigjoiner
> Interface bits
>  		 */
>  		int bigjoiner_interface_bits =3D DISPLAY_VER(i915) > 13 ? 36 : 24;
> -		int min_cdclk_bj =3D (crtc_state->dsc.compressed_bpp *
> pixel_clock) /
> -				   (2 * bigjoiner_interface_bits);
> +		int min_cdclk_bj =3D (intel_fractional_bpp_from_x16(crtc_state-
> >dsc.compressed_bpp_x16) *
> +					pixel_clock) / (2 *
> bigjoiner_interface_bits);
>=20
>  		min_cdclk =3D max(min_cdclk, min_cdclk_bj);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 83e1bc858b9f..afcbdd4f105a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5365,7 +5365,7 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>=20
>  	PIPE_CONF_CHECK_I(dsc.compression_enable);
>  	PIPE_CONF_CHECK_I(dsc.dsc_split);
> -	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
> +	PIPE_CONF_CHECK_I(dsc.compressed_bpp_x16);
>=20
>  	PIPE_CONF_CHECK_BOOL(splitter.enable);
>  	PIPE_CONF_CHECK_I(splitter.link_count);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c21064794f32..69bcabec4a29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1353,7 +1353,8 @@ struct intel_crtc_state {
>  	struct {
>  		bool compression_enable;
>  		bool dsc_split;
> -		u16 compressed_bpp;
> +		/* Compressed Bpp in U6.4 format (first 4 bits for fractional
> part) */
> +		u16 compressed_bpp_x16;
>  		u8 slice_count;
>  		struct drm_dsc_config config;
>  	} dsc;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index aa5f602b56fb..1891e3ead174 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -64,6 +64,7 @@
>  #include "intel_dp_mst.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_dpll.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_hdcp.h"
>  #include "intel_hdmi.h"
> @@ -1863,7 +1864,7 @@ icl_dsc_compute_link_config(struct intel_dp
> *intel_dp,
>  					      valid_dsc_bpp[i],
>  					      timeslots);
>  		if (ret =3D=3D 0) {
> -			pipe_config->dsc.compressed_bpp =3D valid_dsc_bpp[i];
> +			pipe_config->dsc.compressed_bpp_x16 =3D
> +intel_fractional_bpp_to_x16(valid_dsc_bpp[i]);
>  			return 0;
>  		}
>  	}
> @@ -1901,7 +1902,7 @@ xelpd_dsc_compute_link_config(struct intel_dp
> *intel_dp,
>  					      compressed_bpp,
>  					      timeslots);
>  		if (ret =3D=3D 0) {
> -			pipe_config->dsc.compressed_bpp =3D
> compressed_bpp;
> +			pipe_config->dsc.compressed_bpp_x16 =3D
> +intel_fractional_bpp_to_x16(compressed_bpp);
>  			return 0;
>  		}
>  	}
> @@ -2085,7 +2086,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct
> intel_dp *intel_dp,
>  	/* Compressed BPP should be less than the Input DSC bpp */
>  	dsc_max_bpp =3D min(dsc_max_bpp, pipe_bpp - 1);
>=20
> -	pipe_config->dsc.compressed_bpp =3D max(dsc_min_bpp,
> dsc_max_bpp);
> +	pipe_config->dsc.compressed_bpp_x16 =3D
> +intel_fractional_bpp_to_x16(max(dsc_min_bpp, dsc_max_bpp));
>=20
>  	pipe_config->pipe_bpp =3D pipe_bpp;
>=20
> @@ -2171,18 +2172,19 @@ int intel_dp_dsc_compute_config(struct intel_dp
> *intel_dp,
>  	ret =3D intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
>  	if (ret < 0) {
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "Cannot compute valid DSC parameters for Input
> Bpp =3D %d "
> -			    "Compressed BPP =3D %d\n",
> +			    "Cannot compute valid DSC parameters for Input
> Bpp =3D %d
> +Compressed BPP =3D %d.%d\n",
>  			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    intel_fractional_bpp_from_x16(pipe_config-
> >dsc.compressed_bpp_x16),
> +
> +intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
>  		return ret;
>  	}
>=20
>  	pipe_config->dsc.compression_enable =3D true;
> -	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp =3D
> %d "
> -		    "Compressed Bpp =3D %d Slice Count =3D %d\n",
> +	drm_dbg_kms(&dev_priv->drm,
> +		    "DP DSC computed with Input Bpp =3D %d Compressed Bpp =3D
> %d.%d Slice
> +Count =3D %d\n",
>  		    pipe_config->pipe_bpp,
> -		    pipe_config->dsc.compressed_bpp,
> +		    intel_fractional_bpp_from_x16(pipe_config-
> >dsc.compressed_bpp_x16),
> +
> +intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16),
>  		    pipe_config->dsc.slice_count);
>=20
>  	return 0;
> @@ -2261,15 +2263,16 @@ intel_dp_compute_link_config(struct
> intel_encoder *encoder,
>=20
>  	if (pipe_config->dsc.compression_enable) {
>  		drm_dbg_kms(&i915->drm,
> -			    "DP lane count %d clock %d Input bpp %d
> Compressed bpp %d\n",
> +			    "DP lane count %d clock %d Input bpp %d
> Compressed bpp %d.%d\n",
>  			    pipe_config->lane_count, pipe_config->port_clock,
>  			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    intel_fractional_bpp_from_x16(pipe_config-
> >dsc.compressed_bpp_x16),
> +
> +intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
>=20
>  		drm_dbg_kms(&i915->drm,
>  			    "DP link rate required %i available %i\n",
>  			    intel_dp_link_required(adjusted_mode->crtc_clock,
> -						   pipe_config-
> >dsc.compressed_bpp),
> +
> +intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16)),
>  			    intel_dp_max_data_rate(pipe_config->port_clock,
>  						   pipe_config->lane_count));
>  	} else {
> @@ -2702,7 +2705,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>  		intel_dp_limited_color_range(pipe_config, conn_state);
>=20
>  	if (pipe_config->dsc.compression_enable)
> -		link_bpp =3D pipe_config->dsc.compressed_bpp;
> +		link_bpp =3D pipe_config->dsc.compressed_bpp_x16;
>  	else
>  		link_bpp =3D intel_dp_output_bpp(pipe_config->output_format,
>  					       pipe_config->pipe_bpp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 1c7f0b6afe47..350c561775d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -41,6 +41,7 @@
>  #include "intel_dp_hdcp.h"
>  #include "intel_dp_mst.h"
>  #include "intel_dpio_phy.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "skl_scaler.h"
> @@ -140,7 +141,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t
> intel_encoder *encoder,
>  		if (!dsc)
>  			crtc_state->pipe_bpp =3D bpp;
>  		else
> -			crtc_state->dsc.compressed_bpp =3D bpp;
> +			crtc_state->dsc.compressed_bpp_x16 =3D
> +intel_fractional_bpp_to_x16(bpp);
>  		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc
> %d\n", slots, bpp, dsc);
>  	}
>=20
> @@ -238,13 +239,14 @@ static int
> intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>  	if (slots < 0)
>  		return slots;
>=20
> -	last_compressed_bpp =3D crtc_state->dsc.compressed_bpp;
> +	last_compressed_bpp =3D
> +intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
>=20
> -	crtc_state->dsc.compressed_bpp =3D
> intel_dp_dsc_nearest_valid_bpp(i915,
> -
> 	last_compressed_bpp,
> -
> 	crtc_state->pipe_bpp);
> +	crtc_state->dsc.compressed_bpp_x16 =3D
> +
> 	intel_fractional_bpp_to_x16(intel_dp_dsc_nearest_valid_bpp(i915,
> +
> 	last_compressed_bpp,
> +								crtc_state-
> >pipe_bpp));
>=20
> -	if (crtc_state->dsc.compressed_bpp !=3D last_compressed_bpp)
> +	if (crtc_state->dsc.compressed_bpp_x16 !=3D
> +intel_fractional_bpp_to_x16(last_compressed_bpp))
>  		need_timeslot_recalc =3D true;
>=20
>  	/*
> @@ -253,14 +255,14 @@ static int
> intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>  	 */
>  	if (need_timeslot_recalc) {
>  		slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder,
> crtc_state,
> -							     crtc_state-
> >dsc.compressed_bpp,
> -							     crtc_state-
> >dsc.compressed_bpp,
> -							     limits, conn_state,
> 2 * 3, true);
> +
> 	intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
> +
> 	intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
> +					limits, conn_state, 2 * 3, true);
>  		if (slots < 0)
>  			return slots;
>  	}
>=20
> -	intel_link_compute_m_n(crtc_state->dsc.compressed_bpp,
> +
> +intel_link_compute_m_n(intel_fractional_bpp_from_x16(crtc_state->dsc.co
> +mpressed_bpp_x16),
>  			       crtc_state->lane_count,
>  			       adjusted_mode->crtc_clock,
>  			       crtc_state->port_clock,
> diff --git a/drivers/gpu/drm/i915/display/intel_fractional_helper.h
> b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
> new file mode 100644
> index 000000000000..0212a9041c8f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +#ifndef __INTEL_FRACTIONAL_HELPERS_H__
> +#define __INTEL_FRACTIONAL_HELPERS_H__
> +
> + /*
> +  * Convert a U6.4 fixed-point bits-per-pixel (bpp) value to an integer =
bpp
> value.
> +  */
> +static inline int intel_fractional_bpp_from_x16(int bpp_x16) {
> +	return bpp_x16 >> 4;
> +}
> +
> +/*
> + * Extract the fractional part of a U6.4 fixed-point bpp value based on
> +the
> + * last 4 bits representing fractional bits, obtained by multiplying by
> +10000
> + * and then dividing by 16, as the bpp value is initially left-shifted
> +by 4
> + * to allocate 4 bits for the fractional part.
> + */
> +static inline int intel_fractional_bpp_decimal(int bpp_x16) {
> +	return (bpp_x16 & 0xf) * 625;
> +}
> +
> +/*
> + * Convert bits-per-pixel (bpp) to a U6.4 fixed-point representation.
> + */
> +static inline int intel_fractional_bpp_to_x16(int bpp) {
> +	return bpp << 4;
> +}
> +
> +#endif /*  __INTEL_FRACTIONAL_HELPERS_H__ */
> +
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 5c00f7ccad7f..1bd9391a6f5a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -15,6 +15,7 @@
>  #include "intel_de.h"
>  #include "intel_display_types.h"
>  #include "intel_dsi.h"
> +#include "intel_fractional_helper.h"
>  #include "intel_qp_tables.h"
>  #include "intel_vdsc.h"
>  #include "intel_vdsc_regs.h"
> @@ -248,7 +249,7 @@ int intel_dsc_compute_params(struct intel_crtc_state
> *pipe_config)
>  	struct intel_crtc *crtc =3D to_intel_crtc(pipe_config->uapi.crtc);
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	struct drm_dsc_config *vdsc_cfg =3D &pipe_config->dsc.config;
> -	u16 compressed_bpp =3D pipe_config->dsc.compressed_bpp;
> +	u16 compressed_bpp =3D
> +intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
>  	int err;
>  	int ret;
>=20
> @@ -874,7 +875,7 @@ static void intel_dsc_get_pps_config(struct
> intel_crtc_state *crtc_state)
>  	if (vdsc_cfg->native_420)
>  		vdsc_cfg->bits_per_pixel >>=3D 1;
>=20
> -	crtc_state->dsc.compressed_bpp =3D vdsc_cfg->bits_per_pixel >> 4;
> +	crtc_state->dsc.compressed_bpp_x16 =3D vdsc_cfg->bits_per_pixel;
>=20
>  	/* PPS 2 */
>  	pps_temp =3D intel_dsc_pps_read_and_verify(crtc_state, 2);
> --
> 2.25.1

