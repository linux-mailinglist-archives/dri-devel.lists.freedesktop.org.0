Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABAA909CB4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 11:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4409C10E0A1;
	Sun, 16 Jun 2024 09:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402A810E074
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 09:08:43 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6333082fb8fso15074617b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 02:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718528921; x=1719133721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBtpOZr/trZtltPf6YFqTeIEX30vShCauXV7YYWeLaM=;
 b=XYwPmsreyVjjgReFE5pkTGNW9L34QTwW4/8r2RPZ8bkdaylhh3lLntioyngAxyVk4+
 BAUea4tk4t2dxkHKTzsTh5xon6KFkEgutd/07J8YjOu8z2snsWZADEVIGAx3W0Dn/cDN
 p8rxKgRfbrapvNvEpZ4wouitd2V+iMWBjOcEC0YpFQ1SSCZhFRxyoHgXlmbw4X3Zb8vn
 hg1nX8YtT/fHA70tcKas3/8sU8C5LtohLVFaedZ6tsCOMA1rxkFz8YvQ8EeM13ke+Eeg
 oTWGHd83ffUPH+07KMBG0bSSQrORvIv4WBS2afpv8/ed7xePm/F5scuzNBQ3TM8Cq+79
 iWYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdmpHKxos3oMgL4ct39BBPOrKyMpAmgKmEGy4z2+bVoxMb5Ep5YXRJ4oBqhoCs5oVbFoW4/KuTLZNVrqNsOgBFYjUuMW9PxZofRNLNjLkc
X-Gm-Message-State: AOJu0YzyBis6eV1VoBFMqJznzagTqdCvf60D9FughJrTWqJDHnZWRcS3
 8EIwOibyAR4K5K2rx0Tavk8KfsLubBDo10sm/GbG09SfdbPOh65dWvsjj/FZ
X-Google-Smtp-Source: AGHT+IGSU5YyiKext4RoaecozZXPOYQ+kDYl2TVGr4sx7xk5i2n/whziQVMDUNWajGT6YZTogieO7Q==
X-Received: by 2002:a05:690c:7303:b0:618:9407:db0c with SMTP id
 00721157ae682-63223d38bfamr85912357b3.32.1718528919627; 
 Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6311a446cc9sm10123297b3.80.2024.06.16.02.08.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfb05bcc50dso3435907276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLCQuhAWCKgRARVoqMFe2PlZ9IezNUhtwgLXoUGkDW2ZxR8SBfPa2otyFSE0wbThQNRsOO9VTWBUY7DAcBnKfEbcLgAqD14mByh4t8FM5Y
X-Received: by 2002:a25:fe0d:0:b0:dfe:3e88:3649 with SMTP id
 3f1490d57ef6-dff153abc7fmr6851815276.20.1718528918970; Sun, 16 Jun 2024
 02:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
In-Reply-To: <202406151811.yEIZ6203-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:08:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
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

On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on drm-misc/drm-misc-next]
> [cannot apply to linus/master v6.10-rc3 next-20240613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-03=
2053
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4=
286967ee.1718305355.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
> config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/a=
rchive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>    depmod: ERROR: Found 2 modules in dependency cycles!

Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
selecting DRM_KMS_HELPER was wrong in the first place?

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
