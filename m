Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FA043CA4B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF56E7D9;
	Wed, 27 Oct 2021 13:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDC6E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:05:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="253704712"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="253704712"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 06:05:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="497857247"
Received: from smaharan-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.214.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 06:05:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez
 Canillas <javierm@redhat.com>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
In-Reply-To: <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
Date: Wed, 27 Oct 2021 16:05:08 +0300
Message-ID: <87wnlyhb3v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 27 Oct 2021, Arnd Bergmann <arnd@kernel.org> wrote:
> On a related note, I did manage to sort out the backlight dependency issue
> (intel_panel.c:(.text+0x2f58): undefined reference to
> `backlight_device_register'),
> but haven't sent that one again yet, but I can if you like. This one changes
> DRM_I915 and all of drivers/video/fbdev from 'select BACKLIGHT_CLASS_DEVICE'
> to 'depends on', which I think moves everything into broadly the right
> direction.
>
> Let me know if you would like me to send those now, or have a look at the
> top 3 patches in [1] if you are interested. This has passed a few
> thousand randconfig
> builds and should not depend on additional patches.

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

on the patches. I think I've sent patches before to do the same change
from "select" to "depends on", but they went nowhere. IIRC the
opposition was that people wanted to be able to find and enable their
driver in menuconfig without first having to enable
BACKLIGHT_CLASS_DEVICE.

BR,
Jani.



>
>         Arnd
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=randconfig-5.16-next

-- 
Jani Nikula, Intel Open Source Graphics Center
