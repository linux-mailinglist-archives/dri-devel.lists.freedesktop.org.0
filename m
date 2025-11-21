Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC4C7ADAE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEFA10E8F0;
	Fri, 21 Nov 2025 16:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qSU1u2/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21210E8F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:31:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 84C83602D6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D926C2BC86
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763742678;
 bh=cyjFZt5pBXnXq1dohzZ9h4FcHLsal8bFkRJaHhMWMaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qSU1u2/6ipckE+A/OsHbqAjCI7HauJiSh2s1S29Ie812amaZwjQ3D1uHEsNymui1D
 WGmrl0EHTPa9Y1RvEF5u0THNmon9mI0hYPxTjjvl6zVdmZg+TDznwbNrL+cEb13ht5
 GPOWRMw/8ZsekvhZPaMBnQ8+tlQVkoNj9q0tUoG8EQC8/MU45wwKg/1qcKNrNkLDd/
 PBHk6omD2z2gPyjqDktFAJv9YCWCL8yUEhrPrZfp3hWVqmGnN5sjWnYhCzvFoloFwx
 OcqRqeIQZLuYAl057xl/eddeQO7fMU/jVtb/7/QjsDeMebFjUwFfoml37ROnHu+nHc
 BWyArk68dF2SA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so3038195e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:31:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhjNCiu6IPhAo9wz4DMSSypvselSSDVuxH7eThqLi9eVRravncbJ6lgp3g+EfddYq+kMbkCyAYdCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaTJfTz0Su4d0N5MkHbDV3y+7NHy59xkDJ4riElfgPoIzyY1RB
 vqqFc2hTuXMIqe1QTGUOD/QRncDd7j3OfNvK8wmKtOTe0bM3Jm33CXRCZ1NlyS6+T5aLK1jPdMR
 7g3PvrcNiHm6B7CY1v57A8YiuNAb7kyI=
X-Google-Smtp-Source: AGHT+IHv94YBPiEOZjVBTWao8a3/iUuQL5cnLW52Wc5H+gjJzlYuoPCzdcoJKR5m6QrcIhi6WOqHYr6zv5IgKHaKwNI=
X-Received: by 2002:a05:6512:1391:b0:594:2bd4:c856 with SMTP id
 2adb3069b0e04-596a374965amr995757e87.6.1763742676554; Fri, 21 Nov 2025
 08:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
 <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de>
 <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
 <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
 <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
In-Reply-To: <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 17:31:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
X-Gm-Features: AWmQ_bn8zhFEK816tkr85kGEYNB_leVhAjJQxQ75BwMURzs3nYpX4WL_zzKYI_Q
Message-ID: <CAMj1kXFdethf2sb1tm1V4wRW1SyPt-OnCmaAXc5cHNKuLJMXWA@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch,
 sysfb: Move screen and edid info into single place
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-fbdev@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Nov 2025 at 17:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 21.11.25 um 17:19 schrieb Ard Biesheuvel:
> > On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >>
> >> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
> >>>> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
> >>>> wrote:
> >>>>> Hi
> >>>>>
> >>>>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> >>>>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>>>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>>>>>>> struct sysfb_display_info. Update all users.
> >>>>>>>>
> >>>>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
> >>>>>>>> when
> >>>>>>>> they should get that information together with the screen_info
> >>>>>>>> from their
> >>>>>>>> device. Wrapping screen_info and edid_info in
> >>>>>>>> sysfb_primary_display and
> >>>>>>>> passing this to drivers enables this.
> >>>>>>>>
> >>>>>>>> Replacing both with sysfb_primary_display has been motivate by
> >>>>>>>> the EFI
> >>>>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>>>>>>> Using struct sysfb_display_info this will become easily possible.
> >>>>>>>> Hence
> >>>>>>>> accept some churn in architecture code for the long-term
> >>>>>>>> improvements.
> >>>>>>> This all looks good to me,
> >>>>>>>
> >>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >>>>> Thanks
> >>>>>
> >>>>>>> It should also bring us one step closer to eventually
> >>>>>>> disconnecting the x86 boot ABI from the kernel-internal
> >>>>>>> sysfb_primary_display.
> >>>>>>>
> >>>>>> Agreed
> >>>>>>
> >>>>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> Thanks
> >>>>>
> >>>>>> I can take patches 1-2 right away, if that helps during the next
> >>>>>> cycle.
> >>>>>    From my sysfb-focused POV, these patches would ideally all go through
> >>>>> the same tree, say efi or generic arch, or whatever fits best. Most of
> >>>>> the other code is only renames anyway.
> >>>>>
> >>>> I don't mind queueing all of it, but I did get a conflict on
> >>>> drivers/pci/vgaarb.c
> >>> Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
> >> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
> >>
> > Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
> > efi/next tree. But then I hit
> >
> > Applying: sysfb: Move edid_info into sysfb_primary_display
> > error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
> > error: could not build fake ancestor
> > Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display
> >
> > If you prefer, you can take the whole lot via the sysfb tree instead,
> > assuming it does not depend on the EDID changes I already queued up?
>
> Sure, I can also add it to the drm-misc tree. ETA in upstream would be
> v6.20-rc1.
>

But does that mean the EDID firmware on non-x86 will have to wait for
6.21? I was trying to avoid making this a 6 month effort.
