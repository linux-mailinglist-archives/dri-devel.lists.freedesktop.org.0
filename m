Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E751E563628
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 16:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25F614A4C3;
	Fri,  1 Jul 2022 14:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4FE14A4C3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 14:52:13 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id g1so1970167qkl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 07:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hEuYzOoTmg7yPcz0VJpLuuzVEe9N67BOF/CjxNnnUk=;
 b=I/6YUQkkvy4VYstkJbo61reZxVgNnq7vgi5ChbFZ8aKyaoRtRkPM80VPuR2W073V2u
 dV7JSd/jsGLau/E2sOLFz19MFhv0hSc8uk8ng+tiu7m3l4iM0XCADLkd5zPg71Wo0iLd
 1o7oELzs4WfbEdbB/joPdfzZE36avDdpaZa+C/yOqyWTTxF9heaaRFpTDYbKPWQYSGST
 PXOebzkVtQ1jYuDrHe8FYV8OQ8iAO+BxMLnwKjfvbWUPev+afmzkaedsnbcajutfZRbb
 8tWBXhb4WpvWUk8EYZLc2F6OaUNWipzaVOCK6b+w70oaMqtrPil7JzzmIB6MmnQwZdlI
 0n4g==
X-Gm-Message-State: AJIora9P15WmK8p7C5/wo9+qz7plFcW3Z73gnPM65qnFpyzD/XG7D8eC
 Zje4Bw+zGKbo/XuYePqId/jKc7znb2pTqA==
X-Google-Smtp-Source: AGRyM1vEmykkJkseKrxhd4kuALA0BPqs4LPr8M+/RQcGl94IB7SSmAJ/5iPOqlf0QlNDOwC2VuglOQ==
X-Received: by 2002:a05:620a:8001:b0:6af:6a8b:c093 with SMTP id
 ee1-20020a05620a800100b006af6a8bc093mr10816924qkb.263.1656687132650; 
 Fri, 01 Jul 2022 07:52:12 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05622a199400b0031bf484079esm6996039qtc.18.2022.07.01.07.52.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 07:52:12 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id h187so4548956ybg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 07:52:12 -0700 (PDT)
X-Received: by 2002:a25:be49:0:b0:64a:2089:f487 with SMTP id
 d9-20020a25be49000000b0064a2089f487mr1473340ybm.202.1656687131970; Fri, 01
 Jul 2022 07:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
 <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
 <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
 <cae3dc86-8156-eef5-1af4-b16cb2a42849@gmx.de>
 <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
 <4580aa35-5a34-0d81-56d1-1f10218375d2@gmx.de>
In-Reply-To: <4580aa35-5a34-0d81-56d1-1f10218375d2@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2022 16:52:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_8+Cp=BCWhADQ-2B9o3sk6GSdmxxVLLiAnWV-Nwncug@mail.gmail.com>
Message-ID: <CAMuHMdV_8+Cp=BCWhADQ-2B9o3sk6GSdmxxVLLiAnWV-Nwncug@mail.gmail.com>
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

On Fri, Jul 1, 2022 at 11:30 AM Helge Deller <deller@gmx.de> wrote:
> On 7/1/22 09:28, Geert Uytterhoeven wrote:
> > On Thu, Jun 30, 2022 at 10:10 PM Helge Deller <deller@gmx.de> wrote:
> >> On 6/30/22 22:00, Geert Uytterhoeven wrote:
> >>> On Thu, Jun 30, 2022 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
> >>>> On 6/30/22 21:36, Geert Uytterhoeven wrote:
> >>>>> On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
> >>>>>> On 6/30/22 21:00, Geert Uytterhoeven wrote:
> >>>>>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> >>>>>>>> The virtual screen size can't be smaller than the physical screen size.
> >>>>>>>> Based on the general rule that we round up user-provided input if
> >>>>>>>> neccessary, adjust the virtual screen size as well if needed.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>>>>>> Cc: stable@vger.kernel.org # v5.4+
> >>>>>>>
> >>>>>>> Thanks for your patch!
> >>>>>>>
> >>>>>>>> --- a/drivers/video/fbdev/core/fbmem.c
> >>>>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
> >>>>>>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>>>>>>>                         return -EFAULT;
> >>>>>>>>                 console_lock();
> >>>>>>>>                 lock_fb_info(info);
> >>>>>>>> +               /* adjust virtual screen size if user missed it */
> >>>>>>>> +               if (var.xres_virtual < var.xres)
> >>>>>>>> +                       var.xres_virtual = var.xres;
> >>>>>>>> +               if (var.yres_virtual < var.yres)
> >>>>>>>> +                       var.yres_virtual = var.yres;
> >>>>>>>>                 ret = fb_set_var(info, &var);
> >>>>>>>>                 if (!ret)
> >>>>>>>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> >>>>>>>
> >>>>>>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
> >>>>>>> fb_set_var", I don't think we need this patch.
> >>>>>>
> >>>>>> We do.
> >>>>>
> >>>>> Why? It will be caught by [PATCH 4/5].
> >>>>
> >>>> Right, it will be caught by patch #4.
> >>>> But if you drop this part, then everytime a user runs
> >>>>         fbset -xres 800 -yres 600 -xvres 200
> >>>> users will get the KERNEL BUG WARNING (from patch #4) including
> >>>> a kernel backtrace in their syslogs.
> >>>
> >>> No, they will only see that warning if they are using a broken fbdev
> >>> driver that implements .fb_check_var(), but fails to validate or
> >>> update the passed geometry.
> >>
> >> IMHO this argument is mood.
> >> That way you put pressure on and need such simple code in
> >> each single driver to fix it up, instead of cleaning it up at a central
> >> place.
> >
> > Most hardware has restrictions on resolution (e.g. xres must be a
> > multiple of N), so the driver has to round up the resolution to make
> > it fit.  And after that the driver has to validate and update the
> > virtual resolution again anyway...
> >
> > If a driver does not support changing the video mode, it can leave
> > out the .fb_check_var() and .fb_set_par() callbacks, so the fbdev
> > core will ignore the userspace-supplied parameters, and reinstate
> > the single supported mode. See e.g. "[PATCH] drm/fb-helper:
> > Remove helpers to change frame buffer config"
> > (https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k.org).
>
> I implemented all of your suggested changes - from this mail and the others.
> I've committed a new testing tree to the fbcon-fix-testing branch at:
> https://github.com/hdeller/linux/tree/fbcon-fix-testing
> The diff is here:
> https://github.com/torvalds/linux/compare/master...hdeller:linux:fbcon-fix-testing
>
> Although your idea is good since we now would find issues in the drivers,
> I don't think we want to commit it, since the testcase from
> the bug report then immediately crashes the kernel - see below.

That is expected behavior with panic_on_warn?
The right fix is to fix the broken .fb_check_var() implementation.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
