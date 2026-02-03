Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pb+NojXgWlYKgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:10:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CED8173
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ED710E611;
	Tue,  3 Feb 2026 11:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNrsjF8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C80B10E31F;
 Tue,  3 Feb 2026 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770116996; x=1801652996;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=56R1y2uK0WuvOdgZJclIVIEh40jpSjHWy/rEnFSTa0o=;
 b=CNrsjF8B4UfOpmrDYEi83CKK/BpgB5QpKYGUu+brhTQEk0lST82KA5T7
 fKPbBqRTWKfkTuzq6wiyHH240+MhTspUXVptlENmKx0KpjPZE2YvHzJT5
 HL++qgDigcIiRtroDzVpaH09x3xdiBFpgY/x/iNeXXUeDvaOh6f64YgPT
 2MjqrylH7QS1UuQmcAeyln4lO+BzYUGGFQvHEZROD+omwlueM9NhZrAh7
 2gEtR8+z+XP9PucybTTlKTFEGVEC8J+kPN5v8U4GMgBG4qq/f6SvBa/uk
 X88XhzzaX4eq68SGPgUBXXPDrLo0d6hQu0OTO+o5ShONMdh1lk/aFGBX1 g==;
X-CSE-ConnectionGUID: wCLVyc5JSNyVOoY47SghUg==
X-CSE-MsgGUID: tZr8KUfvT2ilZ/Qdx+aqpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71324878"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71324878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:09:55 -0800
X-CSE-ConnectionGUID: OxGEck8HTBaQAzssDpnRaQ==
X-CSE-MsgGUID: tc1n5BauSTyToFVHotTZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247426838"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:09:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, Ard Biesheuvel
 <ardb@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar
 <mingo@kernel.org>, Francesco Pompo <francescopompo2@gmail.com>, Lenny
 Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] drm/i915/display: Disable display for iMac's
In-Reply-To: <20260203073130.1111-3-atharvatiwarilinuxdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
 <20260203073130.1111-3-atharvatiwarilinuxdev@gmail.com>
Date: Tue, 03 Feb 2026 13:09:46 +0200
Message-ID: <f24d637ed1a44014a27d420c2a7137ed52e29982@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,linux.intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 8F6CED8173
X-Rspamd-Action: no action

On Tue, 03 Feb 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
> Disable display on iMacs, as they can't do link training
> on the internal display.
>
> (tested on iMac20,1)

I thought there were open review comments about this. Why are you
resending the same thing?

BR,
Jani.


>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  .../gpu/drm/i915/display/intel_display_device.c    | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index 1170afaa8680..b1fec1018d7e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -3,6 +3,7 @@
>   * Copyright =C2=A9 2023 Intel Corporation
>   */
>=20=20
> +#include <linux/dmi.h>
>  #include <linux/pci.h>
>=20=20
>  #include <drm/drm_color_mgmt.h>
> @@ -1435,7 +1436,18 @@ static bool has_no_display(struct pci_dev *pdev)
>  		{}
>  	};
>=20=20
> -	return pci_match_id(ids, pdev);
> +	static const struct dmi_system_id dmi_ids[] =3D {
> +		{
> +			.ident =3D "Apple Inc. iMac",
> +			.matches =3D {
> +				DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Apple Inc."),
> +				DMI_MATCH(DMI_PRODUCT_NAME, "iMac"),
> +			}
> +		},
> +		{}
> +	};
> +
> +	return pci_match_id(ids, pdev) || dmi_check_system(dmi_ids);
>  }
>=20=20
>  #define INTEL_DISPLAY_DEVICE(_id, _desc) { .devid =3D (_id), .desc =3D (=
_desc) }

--=20
Jani Nikula, Intel
