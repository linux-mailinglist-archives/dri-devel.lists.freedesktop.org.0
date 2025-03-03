Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF745A4C120
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F83410E410;
	Mon,  3 Mar 2025 13:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nchwyBUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACE010E40C;
 Mon,  3 Mar 2025 13:00:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 234D661195;
 Mon,  3 Mar 2025 13:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531B8C4AF0B;
 Mon,  3 Mar 2025 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741006811;
 bh=RVOfscREw4GtPB4azPGZinG7tSiPuv/uEy+UwtEpZQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nchwyBUwicCSYaNel8bwyqk++4HG9lq6UyVsa3Yt5G8sVfsqdOlDxIVPoyBGNjAY1
 6Fyz0tkHgx7CPxWbjD8oV6a0c6j86yNWPzRNoVt1s1aj5pYa5XGQKglltX2YAMefzT
 1K1+KH8Bn3DnNpE/HpmZ/2xpHfDKpKOrq6A/U6/rAubeS0XvoU/djnPmZmgtnR6FXp
 0n3RaP5Z2aFcqk/BsfsOyZKArzD3s6COrbV1Za511dMxae/fewcZ9WY+0VEU+RA4sE
 nh9j7a6thKqmnNrbigkiZh4sB8f8xF06FpOcd6+pBe++Boi4iDapluZFemeVum5Csb
 s8maBu1zLlbZA==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54298ec925bso6657864e87.3; 
 Mon, 03 Mar 2025 05:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXo4UwyujLvMkg7tC9ZGszsPvVsmizFKU2rLDhrrDfE7syV4qdH3KMkDoHsEM4o0XpbF7oiWKwJ1RQ=@lists.freedesktop.org,
 AJvYcCXuaQu6rK+qv2E9hWwcFC53w89bq0o/EldJWoSiQkmqrrITKtNIzAieRVU8xP1LMvr4bstKXj5ze7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl28CtYjyWqUX8z7TsbiuVl9+jF3fSH/ucXI1SQ2YEK/QI9cyP
 WYdXcWxeofLUCE2YxMJMZjEzus5QPErB3KZpOy3LQqW5xMxpAJK2Evew5Gmf6jDnd/g5xe4xxus
 zE8tQ4eq14Bb/AXNYU7PQdMpEDpQ=
X-Google-Smtp-Source: AGHT+IETebjLZgobBPu92rQ56cmnkFN8aUcSOW9fFKm5LgbF9Yc/aA2hoLDU95Na24bCBQRb/Eb0MDiwk5krC3W5jHs=
X-Received: by 2002:a05:6512:308f:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-5496cac6755mr962478e87.53.1741006809916; Mon, 03 Mar 2025
 05:00:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
In-Reply-To: <87r03e1lft.fsf@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 21:59:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-xOt0Zjm6RgkHvxBJFiKhzMczkhCsDSwP_YDiPua8QVxnAvviV1MQ_fI
Message-ID: <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Mon, Mar 3, 2025 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > +CC: Linus
> >
> > On Wed, Jan 22, 2025 at 11:41=E2=80=AFPM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>
> >> Ensure drm headers build, are self-contained, have header guards, and
> >> have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=3Dy.
> >>
> >> The mechanism follows similar patters used in i915, xe, and usr/includ=
e.
> >>
> >> To cover include/drm, we need to recurse there using the top level
> >> Kbuild and the new include/Kbuild files.
> >
> > NACK.
> >
> > I replied here:
> > https://lore.kernel.org/all/CAK7LNARJgqADxnOXAX49XzDFD4zT=3D7i8yTB0o=3D=
EmNtxmScq8jA@mail.gmail.com/T/#u
>
> I really don't find it fair to completely ignore several pings over an
> extended period of time, and then show up to NAK after the patches have
> been merged.


Sorry, I didn't mean to ignore it - I simply didn't notice it.

I regularly check linux-kbuild and linux-kernel MLs (though I still miss
responding to many emails).
However, I don't check the drm ML at all.
I need to reconsider my email filtering rules, but in reality,
I can't respond to all emails in time.

I believe you are re-adding something Linus was negative about:
https://lore.kernel.org/all/87a7982hwc.fsf@intel.com/




> > I CCed Linus to avoid him accidentally pulling this.
> > He disliked this misfeature.
>
> I believe being able to statically check the headers at build time, both
> by the developers and CI, depending on a config option, makes for a more
> pleasant development experience.
>
> We've had this in i915 and xe for a long time, and we avoid a lot of
> build breakage due to missing includes e.g. while refactoring, and we
> don't get reports about kernel-doc issues either. Because they all fail
> at build, and we catch the issues pre-merge. We skip a whole class of
> merge->dammit->fix cycles with this.
>
> All of the drm headers are clean and pass. We don't add any exception
> lists. It's not enabled by default.

I'm not a big fan of the header tests in i915 and xe.
However, you've built a fence and you are dong what you want
in driver-local Makefiles, so I can't avoid them.


>
> I can appreciate this might not be the best approach for all of
> include/linux, but for include/drm, I think it's definitely a win.
>
> And one of the underlying goals is to make for minimal headers with
> minimal includes and minimal dependencies, preferring forward
> declarations over includes, splitting functionality by header, etc. It's
> just that doing that often leads to broken headers, unless you actually
> build test them... and here we are.


What I learned from my last attempt is that we cannot avoid
false positives without adding a lot of exceptions.

We can never be certain whether you are making DRM headers
self-contained for valid reasons or for hypothetical, invalid ones.







>
> BR,
> Jani.
>
>
> >
> >
> >
> >
> >>
> >> v4: check for CONFIG_WERROR in addition to CONFIG_DRM_WERROR
> >>
> >> v3: adapt to upstream build changes
> >>
> >> v2: make DRM_HEADER_TEST depend on DRM
> >>
> >> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  Kbuild                   |  1 +
> >>  drivers/gpu/drm/Kconfig  | 11 +++++++++++
> >>  drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
> >>  include/Kbuild           |  1 +
> >>  include/drm/Makefile     | 18 ++++++++++++++++++
> >>  5 files changed, 49 insertions(+)
> >>  create mode 100644 include/Kbuild
> >>  create mode 100644 include/drm/Makefile
> >>
> >> diff --git a/Kbuild b/Kbuild
> >> index 464b34a08f51..f327ca86990c 100644
> >> --- a/Kbuild
> >> +++ b/Kbuild
> >> @@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES) +=3D samples/
> >>  obj-$(CONFIG_NET)      +=3D net/
> >>  obj-y                  +=3D virt/
> >>  obj-y                  +=3D $(ARCH_DRIVERS)
> >> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D include/
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index fbef3f471bd0..f9b3ebf63fa9 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -494,6 +494,17 @@ config DRM_WERROR
> >>
> >>           If in doubt, say N.
> >>
> >> +config DRM_HEADER_TEST
> >> +       bool "Ensure DRM headers are self-contained and pass kernel-do=
c"
> >> +       depends on DRM && EXPERT
> >> +       default n
> >> +       help
> >> +         Ensure the DRM subsystem headers both under drivers/gpu/drm =
and
> >> +         include/drm compile, are self-contained, have header guards,=
 and have
> >> +         no kernel-doc warnings.
> >> +
> >> +         If in doubt, say N.
> >> +
> >>  endif
> >>
> >>  # Separate option because drm_panel_orientation_quirks.c is shared wi=
th fbdev
> >> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >> index 85af94bb907d..42901f877bf2 100644
> >> --- a/drivers/gpu/drm/Makefile
> >> +++ b/drivers/gpu/drm/Makefile
> >> @@ -222,3 +222,21 @@ obj-y                      +=3D solomon/
> >>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> >>  obj-$(CONFIG_DRM_LOONGSON) +=3D loongson/
> >>  obj-$(CONFIG_DRM_POWERVR) +=3D imagination/
> >> +
> >> +# Ensure drm headers are self-contained and pass kernel-doc
> >> +hdrtest-files :=3D \
> >> +       $(shell cd $(src) && find . -maxdepth 1 -name 'drm_*.h') \
> >> +       $(shell cd $(src) && find display lib -name '*.h')
> >> +
> >> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> >> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> >> +
> >> +# Include the header twice to detect missing include guard.
> >> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >> +      cmd_hdrtest =3D \
> >> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include=
 $< -include $<; \
> >> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERR=
OR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> >> +               touch $@
> >> +
> >> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> >> +       $(call if_changed_dep,hdrtest)
> >> diff --git a/include/Kbuild b/include/Kbuild
> >> new file mode 100644
> >> index 000000000000..5e76a599e2dd
> >> --- /dev/null
> >> +++ b/include/Kbuild
> >> @@ -0,0 +1 @@
> >> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/
> >> diff --git a/include/drm/Makefile b/include/drm/Makefile
> >> new file mode 100644
> >> index 000000000000..a7bd15d2803e
> >> --- /dev/null
> >> +++ b/include/drm/Makefile
> >> @@ -0,0 +1,18 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +
> >> +# Ensure drm headers are self-contained and pass kernel-doc
> >> +hdrtest-files :=3D \
> >> +       $(shell cd $(src) && find * -name '*.h' 2>/dev/null)
> >> +
> >> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> >> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> >> +
> >> +# Include the header twice to detect missing include guard.
> >> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >> +      cmd_hdrtest =3D \
> >> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include=
 $< -include $<; \
> >> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERR=
OR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> >> +               touch $@
> >> +
> >> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> >> +       $(call if_changed_dep,hdrtest)
> >> --
> >> 2.39.5
> >>
>
> --
> Jani Nikula, Intel



--=20
Best Regards
Masahiro Yamada
