Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76643856376
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9180410E762;
	Thu, 15 Feb 2024 12:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5110E762
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:41:44 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
 by michel.telenet-ops.be with bizsmtp
 id nQhQ2B00E0LVNSS06QhQ84; Thu, 15 Feb 2024 13:41:32 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rab3M-000gwM-Hm;
 Thu, 15 Feb 2024 13:41:24 +0100
Date: Thu, 15 Feb 2024 13:41:24 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@redhat.com>
cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PULL] drm-misc-fixes
In-Reply-To: <b4ffqzigtfh6cgzdpwuk6jlrv3dnk4hu6etiizgvibysqgtl2p@42n2gdfdd5eu>
Message-ID: <723b78e0-5462-23f-a7d4-c8b9b614c0@linux-m68k.org>
References: <b4ffqzigtfh6cgzdpwuk6jlrv3dnk4hu6etiizgvibysqgtl2p@42n2gdfdd5eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

 	Hi Maxime,

On Thu, 15 Feb 2024, Maxime Ripard wrote:
> Here's this week drm-misc-fixes PR
>
> Maxime
>
> drm-misc-fixes-2024-02-15:
> A suspend/resume error fix for ivpu, a couple of scheduler fixes for
> nouveau, a patch to support large page arrays in prime, a uninitialized
> variable fix in crtc, a locking fix in rockchip/vop2 and a buddy
> allocator error reporting fix.
> The following changes since commit 5f8408aca66772d3aa9b4831577b2ac5ec41bcd9:
>
>  accel/ivpu: Add job status for jobs aborted by the driver (2024-02-06 13:37:34 +0100)
>
> are available in the Git repository at:
>
>  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-02-15
>
> for you to fetch changes up to a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea:
>
>  drm/tests/drm_buddy: add alloc_contiguous test (2024-02-14 15:22:21 +0100)
>
> ----------------------------------------------------------------
> A suspend/resume error fix for ivpu, a couple of scheduler fixes for
> nouveau, a patch to support large page arrays in prime, a uninitialized
> variable fix in crtc, a locking fix in rockchip/vop2 and a buddy
> allocator error reporting fix.

> Matthew Auld (1):
>      drm/tests/drm_buddy: add alloc_contiguous test

Please drop this one.

noreply@ellerman.id.au reported a build failure on m68k (and presumably
other 32-bit platforms) in next-20240215:

ERROR: modpost: "__umoddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
ERROR: modpost: "__moddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!

Reverting commit a64056bb5a3215bd ("drm/tests/drm_buddy: add
alloc_contiguous test") fixes the issue.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
