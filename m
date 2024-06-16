Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27933909CB8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 11:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A1D10E074;
	Sun, 16 Jun 2024 09:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769110E074
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 09:12:34 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dff302847a8so883422276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 02:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718529153; x=1719133953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=By6v0+YnSgsH+RWah/gSqD/GguB9CLtqyolfWDQlUF8=;
 b=H5NU6DE/YwNDz4b9c7UVAqSVvCatLj4JG4zZ6lLKX5DIuzYpEXI/B/xtoxYzyYSIHF
 6CrjEU6x5IQHDgfPZqZCzVcVpqIrOkmmL4jZZIIyEWm7UQfT4LYn8TLrgf/yxNjEc/9z
 ogFchwlLKR/eQyOfXJfXR/QZQIqardHCjsymC1mc2EGlky5czqL7ryx/ResrSzrN8FOX
 NeSRFZ1ScDYJqZ6HfYWusl/Ey9rqNX98tpaT9cuthK2s3LMJOA3lS+vQazrCZfw3hQZg
 6Aa6q67TLYXsrMqnFW9eQSXnlYwVYC4JHJ8CXNMQ8yXp7I21QbyTg3PKrkBIJClrVRug
 Md4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkAjy6fG2gZo7cuNCuhZQtH4u8/YvrGodHVp4eSF9HREFMOAB6KsizpJ3Csl6IcbKHV48r7yO6TCwdT3JHfEy5frzONKLdoqDTHn9k+HXQ
X-Gm-Message-State: AOJu0YyASrf6Zk6DoEriSsA91VsXm1xOzsyJhK9DW77heiBg/E4uis+X
 c84FcO1/cLSt9TDGUQY1i4CIiWA4CYAATw6CJk/a0nKCDxyRH9rIUD99Db2l
X-Google-Smtp-Source: AGHT+IHFHsSvSR0m5OxugBsJyFhGdOuRWOo4Yd4LNDu3qzFhFANFAhVgOBi/WDxEgMizcgm+asM4Bg==
X-Received: by 2002:a25:dc4a:0:b0:dfb:cc7:52d5 with SMTP id
 3f1490d57ef6-dff1538332cmr6926756276.16.1718529152944; 
 Sun, 16 Jun 2024 02:12:32 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-dff496518desm25505276.12.2024.06.16.02.12.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jun 2024 02:12:32 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dff0712ede2so3759226276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 02:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEMwUSG0Ui/UZuaLPCdfvLtrc0szDL7KMcuq4qzEN+36uZ9AxM7UFvitQcG6aNk+vs20Fp3ER2R1BymtIN8HSmzeR31BCYLL9IpXmCSWS9
X-Received: by 2002:a25:3dc4:0:b0:dfe:32ba:a877 with SMTP id
 3f1490d57ef6-dff153c36a6mr5976090276.32.1718529152591; Sun, 16 Jun 2024
 02:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
 <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:12:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: kernel test robot <lkp@intel.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Jun 16, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on drm-misc/drm-misc-next]
> > [cannot apply to linus/master v6.10-rc3 next-20240613]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoev=
en/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-=
032053
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9=
b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
> > patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset(=
)
> > config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci=
/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> >    depmod: ERROR: Found 2 modules in dependency cycles!
>
> Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
> selecting DRM_KMS_HELPER was wrong in the first place?

Q: So how does this work with DRM_PANIC calling
   drm_fb_helper_emergency_disable()?
A: drm_fb_helper_emergency_disable() is a dummy if
   !CONFIG_DRM_FBDEV_EMULATION, so I guess no one tried to build
   a failing randconfig with CONFIG_DRM_FBDEV_EMULATION=3Dy yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
