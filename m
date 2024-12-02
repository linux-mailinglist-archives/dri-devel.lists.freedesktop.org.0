Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED69E0BEF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 20:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E8110E825;
	Mon,  2 Dec 2024 19:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvsNWSQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778210E072;
 Mon,  2 Dec 2024 19:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733167345; x=1764703345;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wgNs0Q9kAS34l6FO2aSnEXRFLXDW90y6KIaKQiHRaWo=;
 b=bvsNWSQILDVUNeqhuMUcM7kbY4bFgpQbiD4W7IP5Kj9dQmljCnxLa9cE
 UEY2oMoRwBHcgUAvDs4HQcza/9Czr6gL1hjNQhsy0Imco97uMBwP9WOMZ
 dX8fNv+Stt1jW9VV0bwWs0KgIqsz4BAwACKFtLpKY1Sd1Qkzx4xu18ek4
 /wyN2hsJNF04rmPC16XXZ9qgdjTMd3cYxlTHh+GxmIyC0ijxE7XzB/cyh
 pQ2HjzTrN0OxpZhHhd3LWnjeM2Xb7Ntbca+aDtFqdRPDujPiZ1kIOEbUy
 zjb70WRZ/yUBFVKVoYwfbY6hQ6UPhzIYGAjm+QD4rvlXm7An5bAyePUr2 g==;
X-CSE-ConnectionGUID: hT1nwM0PTZ+WRTQv7+s3Uw==
X-CSE-MsgGUID: 3KS0mgFlTECRHkD7dNWvOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33505286"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33505286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 11:22:16 -0800
X-CSE-ConnectionGUID: SrDgd/iYTwOwMliq1pA38Q==
X-CSE-MsgGUID: AUaawnwvTmebleqfO/u0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="124132566"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 11:22:13 -0800
Message-ID: <c87fa6006f356f999a1d5165ee5e58422f68a3a3.camel@linux.intel.com>
Subject: Re: 6.13-rc1 graphics fail
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Genes Lists <lists@sapience.com>, linux-kernel@vger.kernel.org, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, airlied@gmail.com, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Dec 2024 20:22:10 +0100
In-Reply-To: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
References: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 2024-12-02 at 13:40 -0500, Genes Lists wrote:
>=20
> 6.12.1 on same system with same userspace works fine (as did 6.12)
> while 6.13-rc1 boots, but without working graphics using gnome with
> wayland.
>=20
> Laptop is raptor lake with Intel XE (lspci attached).
> No kernel errors are logged, but GDM fails, leading to frozen screen
> with some messages logged most notable seems to be quite a few of
> this
> one:
>=20
> =C2=A0 Failed to ensure KMS FB ID on /dev/dri/card1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drmModeAddFB2WithModifiers failed: I=
nvalid argument
>=20
> which does not happen with 6.12.
>=20
> I can switch to different VTs but GDM appears hung.
>=20
> This is my primary machine so will take some time before I can bisect
> but thought it best to share sooner than later. Maybe this rings a
> bell
> to someone? Or does userspace GDM need to be changed to work with
> 6.13?

Your logs shows the i915 driver loading and not the xe driver. The i915
driver is the correct one for your hardware unless you are
experimenting.

So please file an issue here
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues

And follow up on the intel-gfx list (CC'd)

Thanks,
Thomas


>=20
>=20
> regards
>=20
> gene
>=20
> Larger journal attached along with lspci and kernel config.
> Some possibly relevant additional log bits:
>=20
> -- journal --
>=20
> gnome-shell[1380]: Thread 'KMS thread' will be using high priority
> scheduling
> gnome-shell[1380]: Device '/dev/dri/card1' prefers shadow buffer
> gnome-shell[1380]: Added device '/dev/dri/card1' (i915) using atomic
> mode setting.
> gnome-shell[1380]: Created gbm renderer for '/dev/dri/card1'
> gnome-shell[1380]: GPU /dev/dri/card1 selected primary from builtin
> panel presence
> gnome-shell[1380]: Obtained a high priority EGL context
> gnome-shell[1380]: Running GNOME Shell (using mutter 47.2) as a
> Wayland
> display server
>=20
> /usr/lib/gdm-wayland-session[1367]: dbus-daemon[1367]: [session
> uid=3D120
> pid=3D1367] Activating service=C2=A0=C2=A0=20
> name=3D'org.freedesktop.impl.portal.desktop.gnome' requested by=C2=A0=C2=
=A0
> ':1.39'
> (uid=3D120 pid=3D1777 comm=3D"/usr>
>=20
> gnome-shell[1380]: Failed to ensure KMS FB ID on /dev/dri/card1:=C2=A0=C2=
=A0=20
> drmModeAddFB2WithModifiers failed: Invalid argument
>=20
> meta_frame_native_release: assertion '!frame_native->kms_update'
> failed
>=20
> -- journal --
>=20

