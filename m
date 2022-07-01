Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA3562C98
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F7B10E481;
	Fri,  1 Jul 2022 07:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42E10E481
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 07:28:34 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id z1so3310692qvp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 00:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItiQX8JxxOqPGnMxDgw8fRBl9Ocf7hYz3g9osOjYopM=;
 b=3FasDR05dti2a6Zb3Gni3rKXO8ph2pvrCVXDh1LzBLZfsDlYjwVuAAEeGM+LyFJSho
 ThgFyTa2e9O5PNbNu68GCE1DC9DEoIb91R7rG99i21/fxWUex+U7KyPM1dZFmLul+ua5
 x7AJUVrsne1fyJi0o2S3zfCRq84OvVD7eV5AmSfgOcXX5vOZsqw9ho+3T2n59urWUod2
 4Zsgnpw3UJK7YTfgttLTa4v+2W5HIAa5Mr1P30nAp87KKxdqUBIjm1ZlAYAD+uSsWpgV
 yBUoCgOyfOsB2FBEZ1ugoxNYCO3/l9sZrwQju1Ntqnn6LgEFru0OtOmJ+IYyuiTgNZy3
 d/2Q==
X-Gm-Message-State: AJIora+ogXbsKRbZMWo81lQsMBCiW2JoYoD5ylXOj6T9Z7fZX5vHt2N2
 idTxmjv4jEh8fjxQBq5t/XxXP2BYJdsmEw==
X-Google-Smtp-Source: AGRyM1sYHAjMeeJGeGsGcjNRJOi/eChc93h5MalrdBJJCb3mFj2rIuKmjrsaStj4N5bIDHRLISLuUw==
X-Received: by 2002:ac8:5f13:0:b0:31b:b33f:2c09 with SMTP id
 x19-20020ac85f13000000b0031bb33f2c09mr11101015qta.686.1656660513139; 
 Fri, 01 Jul 2022 00:28:33 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 q8-20020a37f708000000b006b1fe4a103dsm3234547qkj.51.2022.07.01.00.28.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 00:28:32 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-317741c86fdso15506767b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 00:28:32 -0700 (PDT)
X-Received: by 2002:a81:74c5:0:b0:31b:ca4b:4bc4 with SMTP id
 p188-20020a8174c5000000b0031bca4b4bc4mr15131919ywc.358.1656660512246; Fri, 01
 Jul 2022 00:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
 <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
 <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
 <cae3dc86-8156-eef5-1af4-b16cb2a42849@gmx.de>
In-Reply-To: <cae3dc86-8156-eef5-1af4-b16cb2a42849@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2022 09:28:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
Message-ID: <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Thu, Jun 30, 2022 at 10:10 PM Helge Deller <deller@gmx.de> wrote:
> On 6/30/22 22:00, Geert Uytterhoeven wrote:
> > On Thu, Jun 30, 2022 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
> >> On 6/30/22 21:36, Geert Uytterhoeven wrote:
> >>> On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
> >>>> On 6/30/22 21:00, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> >>>>>> The virtual screen size can't be smaller than the physical screen size.
> >>>>>> Based on the general rule that we round up user-provided input if
> >>>>>> neccessary, adjust the virtual screen size as well if needed.
> >>>>>>
> >>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>>>> Cc: stable@vger.kernel.org # v5.4+
> >>>>>
> >>>>> Thanks for your patch!
> >>>>>
> >>>>>> --- a/drivers/video/fbdev/core/fbmem.c
> >>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
> >>>>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>>>>>                         return -EFAULT;
> >>>>>>                 console_lock();
> >>>>>>                 lock_fb_info(info);
> >>>>>> +               /* adjust virtual screen size if user missed it */
> >>>>>> +               if (var.xres_virtual < var.xres)
> >>>>>> +                       var.xres_virtual = var.xres;
> >>>>>> +               if (var.yres_virtual < var.yres)
> >>>>>> +                       var.yres_virtual = var.yres;
> >>>>>>                 ret = fb_set_var(info, &var);
> >>>>>>                 if (!ret)
> >>>>>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> >>>>>
> >>>>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
> >>>>> fb_set_var", I don't think we need this patch.
> >>>>
> >>>> We do.
> >>>
> >>> Why? It will be caught by [PATCH 4/5].
> >>
> >> Right, it will be caught by patch #4.
> >> But if you drop this part, then everytime a user runs
> >>         fbset -xres 800 -yres 600 -xvres 200
> >> users will get the KERNEL BUG WARNING (from patch #4) including
> >> a kernel backtrace in their syslogs.
> >
> > No, they will only see that warning if they are using a broken fbdev
> > driver that implements .fb_check_var(), but fails to validate or
> > update the passed geometry.
>
> IMHO this argument is mood.
> That way you put pressure on and need such simple code in
> each single driver to fix it up, instead of cleaning it up at a central
> place.

Most hardware has restrictions on resolution (e.g. xres must be a
multiple of N), so the driver has to round up the resolution to make
it fit.  And after that the driver has to validate and update the
virtual resolution again anyway...

If a driver does not support changing the video mode, it can leave
out the .fb_check_var() and .fb_set_par() callbacks, so the fbdev
core will ignore the userspace-supplied parameters, and reinstate
the single supported mode. See e.g. "[PATCH] drm/fb-helper:
Remove helpers to change frame buffer config"
(https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k.org).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
