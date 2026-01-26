Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL8tG902d2nhdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:41:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD986219
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DC110E255;
	Mon, 26 Jan 2026 09:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVp2gkYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C789410E045;
 Mon, 26 Jan 2026 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769420504; x=1800956504;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VdWtn/DsLx7ekUl9poVAlH/1Pk/VuP4qRYCpEVQ5Qy4=;
 b=VVp2gkYN7y9Xp/YD23R5NUksg+PEbNCpyFFvF67PPLbEZmbnYWE5B4to
 CHSIC7lR4Jd/aMJA6MsVEQLQnptxIvLFiig3Ktm0/U6D60032dmay/Qog
 4tqB64A0rxcipNtyALQIjaiimj5+4Ti+Wb9i8+YLYtxDaTJATUvLEs4QJ
 uYR24w19/GlfQTBdi6ht+QBQk07UuDpbURp1Z4IhpKmZpchthcBSuTicc
 C/vMbvegh85dC/mZKV/uJzt1jI326r9HzfCw4jKVqiOhzxgXvZ0eN+KcW
 bS562wuUgz8hCug4U6XpIHu65NQzkWW0QQCtEc1ZAtrJx2nN2YuvhURlR g==;
X-CSE-ConnectionGUID: RggR6yVpR3CaJLLD94AJLQ==
X-CSE-MsgGUID: yCznlKycS1i6aux4I9UYXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81704494"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="81704494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:41:43 -0800
X-CSE-ConnectionGUID: v+rXODGBRIiz2CZpG6+iww==
X-CSE-MsgGUID: CmoHQLDsRZiqB7FHS6Mr6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="206870675"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.75])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:41:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
In-Reply-To: <20260125001111.1269-3-atharvatiwarilinuxdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
 <20260125001111.1269-3-atharvatiwarilinuxdev@gmail.com>
Date: Mon, 26 Jan 2026 11:41:35 +0200
Message-ID: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linux.intel.com,ursulin.net,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 21FD986219
X-Rspamd-Action: no action

On Sun, 25 Jan 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:

[Quoting this part from the cover letter]
> A side effect of this patch is that the iGPU becomes enabled on iMacs.
> However, iMacs can=E2=80=99t use the iGPU for rendering (They can't link-=
train
> the internal display), so displays must be disabled on iMacs.

Rendering and display are quite separate in the hardware and in the
driver. Perhaps you do not mean "rendering" here? Perhaps it can be used
for rendering but not display?

> Disable display on iMacs, as they can't do link training
> on the internal display.

Okay, so perhaps there's no eDP connected. But what about the other
connectors on the iGPU? What about everything else in the display
hardware?

If you can figure out that it's specifically link training that fails (a
dmesg would be useful to show this) there clearly is display hardware,
right?

There's at least three levels where this could be handled, depending on
details:

- Display probe (the patch at hand). Assumes there's no display
  hardware, at all. The driver doesn't touch the hardware, which
  continues to consume power, it's not put in low power states. Not
  optimal if there actually is display hardware.

- Display disable. See intel_display_device_enabled(). The driver takes
  over the hardware, puts it to sleep, but prevents all connectors from
  being connected.

- eDP disable. Add a quirk somewhere to enforce eDP is disconnected, but
  other connectors can be used.

> (tested on iMac20,1)

It would be quite useful to indicate the PCI ID of the device in
question.

>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index 1170afaa8680..3fb47232e7a4 100644
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
> @@ -1657,6 +1658,7 @@ struct intel_display *intel_display_device_probe(st=
ruct pci_dev *pdev,
>  	const struct platform_desc *desc;
>  	const struct subplatform_desc *subdesc;
>  	enum intel_step step;
> +	const char *product_name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
>=20=20
>  	display =3D kzalloc(sizeof(*display), GFP_KERNEL);
>  	if (!display)
> @@ -1674,6 +1676,11 @@ struct intel_display *intel_display_device_probe(s=
truct pci_dev *pdev,
>  		goto no_display;
>  	}
>=20=20
> +	if (dmi_match(DMI_BOARD_VENDOR, "Apple Inc.") && !strncmp(product_name,=
 "iMac", 4)) {
> +		drm_dbg_kms(display->drm, "iMac Detected, Disabling display\n");
> +		goto no_display;
> +	}
> +

This function is high level code, its clarity is important, and low
level device specific quirks do not belong here. They are a
distraction. At a minimum this needs to be hidden away in a function
that gets called from has_no_display() or something.

BR,
Jani.

>  	desc =3D find_platform_desc(pdev);
>  	if (!desc) {
>  		drm_dbg_kms(display->drm,

--=20
Jani Nikula, Intel
