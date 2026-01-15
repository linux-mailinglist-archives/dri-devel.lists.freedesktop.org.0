Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99050D252DE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDCE10E786;
	Thu, 15 Jan 2026 15:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/kfq7x/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E110E77E;
 Thu, 15 Jan 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768489841; x=1800025841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zJtKOUTDeVup7QvvLjg/CY50ojhXg1JVcSwyHLTVV5U=;
 b=A/kfq7x/jx/HkHy4MC/gn/Yge3mC+1iBV7Z8atkoNLN3mdooZh9JdFf8
 h4LSnaCfUJ/HCo4l0BCfLQlOW1IzcJtCh0oPAYarB3n1bYYuGqw+AGc3J
 2ugleA6uU3R8/6ojlkJ8Qlm+VnRF3UYtMekqSO6+UjaogTcLw1Ls3pvq/
 ZXp7VDMwrhCym019CzudPArqrYF6sdgUbPwWokDGfCGibpqLI2XB59OpR
 jFeWuO/4/pgTAIuhTJxtTJASHQhPI+PDJx22zOQk/g6AsQEQPpuBgeEoS
 9WuEkRy1Q7zA7dNwxTPCZxeL3l1JB55hEMbchw/K7mU7dZ7cJj8RcyECt g==;
X-CSE-ConnectionGUID: lnR18X7xQGqYtErDZAtzyg==
X-CSE-MsgGUID: w0YUhWm8TMqe0Lwk5K3rpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80439991"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80439991"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:10:39 -0800
X-CSE-ConnectionGUID: QlyxHSHiTzCEbE1DbfKHgA==
X-CSE-MsgGUID: Hevrt8lZSOytYcWKGKE26Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205005261"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:10:28 -0800
Date: Thu, 15 Jan 2026 17:10:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Ce Sun <cesun102@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hansg@kernel.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Helge Deller <deller@gmx.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, spice-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
Message-ID: <aWkDYO1o9T1BhvXj@intel.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Jan 15, 2026 at 03:39:00PM +0100, Christian König wrote:
> Sorry to being late, but I only now realized what you are doing here.
> 
> On 1/15/26 12:02, Thomas Zimmermann wrote:
> > Hi,
> > 
> > apologies for the delay. I wanted to reply and then forgot about it.
> > 
> > Am 10.01.26 um 05:52 schrieb Zack Rusin:
> >> On Fri, Jan 9, 2026 at 5:34 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> Hi
> >>>
> >>> Am 29.12.25 um 22:58 schrieb Zack Rusin:
> >>>> Almost a rite of passage for every DRM developer and most Linux users
> >>>> is upgrading your DRM driver/updating boot flags/changing some config
> >>>> and having DRM driver fail at probe resulting in a blank screen.
> >>>>
> >>>> Currently there's no way to recover from DRM driver probe failure. PCI
> >>>> DRM driver explicitly throw out the existing sysfb to get exclusive
> >>>> access to PCI resources so if the probe fails the system is left without
> >>>> a functioning display driver.
> >>>>
> >>>> Add code to sysfb to recever system framebuffer when DRM driver's probe
> >>>> fails. This means that a DRM driver that fails to load reloads the system
> >>>> framebuffer driver.
> >>>>
> >>>> This works best with simpledrm. Without it Xorg won't recover because
> >>>> it still tries to load the vendor specific driver which ends up usually
> >>>> not working at all. With simpledrm the system recovers really nicely
> >>>> ending up with a working console and not a blank screen.
> >>>>
> >>>> There's a caveat in that some hardware might require some special magic
> >>>> register write to recover EFI display. I'd appreciate it a lot if
> >>>> maintainers could introduce a temporary failure in their drivers
> >>>> probe to validate that the sysfb recovers and they get a working console.
> >>>> The easiest way to double check it is by adding:
> >>>>    /* XXX: Temporary failure to test sysfb restore - REMOVE BEFORE COMMIT */
> >>>>    dev_info(&pdev->dev, "Testing sysfb restore: forcing probe failure\n");
> >>>>    ret = -EINVAL;
> >>>>    goto out_error;
> >>>> or such right after the devm_aperture_remove_conflicting_pci_devices .
> >>> Recovering the display like that is guess work and will at best work
> >>> with simple discrete devices where the framebuffer is always located in
> >>> a confined graphics aperture.
> >>>
> >>> But the problem you're trying to solve is a real one.
> >>>
> >>> What we'd want to do instead is to take the initial hardware state into
> >>> account when we do the initial mode-setting operation.
> >>>
> >>> The first step is to move each driver's remove_conflicting_devices call
> >>> to the latest possible location in the probe function. We usually do it
> >>> first, because that's easy. But on most hardware, it could happen much
> >>> later.
> >> Well, some drivers (vbox, vmwgfx, bochs and currus-qemu) do it because
> >> they request pci regions which is going to fail otherwise. Because
> >> grabbining the pci resources is in general the very first thing that
> >> those drivers need to do to setup anything, we
> >> remove_conflicting_devices first or at least very early.
> > 
> > To my knowledge, requesting resources is more about correctness than a hard requirement to use an I/O or memory range. Has this changed?
> 
> Nope that is not correct.
> 
> At least for AMD GPUs remove_conflicting_devices() really early is necessary because otherwise some operations just result in a spontaneous system reboot.	
> 
> For example resizing the PCIe BAR giving access to VRAM or disabling VGA emulation (which AFAIK is used for EFI as well) is only possible when the VGA or EFI framebuffer driver is kicked out first.
> 
> And disabling VGA emulation is among the absolutely first steps you do to take over the scanout config.

It's similar for Intel. For us VGA emulation won't be used for
EFI boot, but we still can't have the previous driver poking
around in memory while the real driver is initializing. The
entire memory layout may get completely shuffled so there's
no telling where such memory accesses would land.

And I suppose reBAR is a concern for us as well.

-- 
Ville Syrjälä
Intel
