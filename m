Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A1456CD6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 10:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AAE6EE25;
	Fri, 19 Nov 2021 09:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CD66EE25;
 Fri, 19 Nov 2021 09:56:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="215104281"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="215104281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="605501829"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 19 Nov 2021 01:56:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 01:56:17 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 01:56:16 -0800
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Fri, 19 Nov 2021 15:26:14 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tangudu, Tilak" <tilak.tangudu@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915/rpm: Enable runtime pm autosuspend by default
Thread-Topic: [PATCH v3] drm/i915/rpm: Enable runtime pm autosuspend by default
Thread-Index: AQHX2wIJy/Eb1GVv70SB+yiWd30GPqwKmoaA
Date: Fri, 19 Nov 2021 09:56:13 +0000
Message-ID: <2411d9693d5845b8873f713cf3ae8c9d@intel.com>
References: <20211116155238.3226516-1-tilak.tangudu@intel.com>
In-Reply-To: <20211116155238.3226516-1-tilak.tangudu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, "Syrjala,
 Ville" <ville.syrjala@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tangudu, Tilak <tilak.tangudu@intel.com>
> Sent: Tuesday, November 16, 2021 9:23 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Tangudu, Tilak <tilak.tangudu@intel.com>; Ewins, Jon
> <jon.ewins@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Nilawar, B=
adal
> <badal.nilawar@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Syrjala, Ville <ville.syrjala@intel.com>
> Subject: [PATCH v3] drm/i915/rpm: Enable runtime pm autosuspend by defaul=
t
>=20
> v1: Enable runtime pm autosuspend by default for Gen12 and later versions=
.
>=20
> v2: Enable runtime pm autosuspend by default for all platforms(Syrjala Vi=
lle)
>=20
> v3: Change commit message(Nikula Jani)
> Let's enable runtime pm autosuspend by default everywhere.
> So, we can allow D3hot and bigger power savings on idle scenarios.
>=20
> But at this time let's not touch the autosuspend_delay time, what caused =
some
> regression on our previous attempt.
>=20
> Also, the latest identified issue on GuC PM has been fixed by commit
> 1a52faed3131 ("drm/i915/guc: Take GT PM ref when deregistering
> context")
>=20
> Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c
> b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 0d85f3c5c526..22dab36afcb6 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -590,6 +590,9 @@ void intel_runtime_pm_enable(struct intel_runtime_pm
> *rpm)
>  		pm_runtime_use_autosuspend(kdev);
>  	}
>=20
> +	/* Enable by default */
> +	pm_runtime_allow(kdev);
> +
BAT is failing due to soft lockup on SKL.
How about to enable the runtime PM only for discrete platforms till we fixe=
s all issues on Gen9 for hybrid gfx use cases.
(when discrete card will used only for rendering)
Thanks,
Anshuman Gupta.
>  	/*
>  	 * The core calls the driver load handler with an RPM reference held.
>  	 * We drop that here and will reacquire it during unloading in
> --
> 2.25.1

