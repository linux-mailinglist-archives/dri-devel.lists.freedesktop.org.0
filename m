Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF1C7AAF2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C715B10E8CF;
	Fri, 21 Nov 2025 15:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DIGPz/iT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7D310E8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:57:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8C0640615
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C41C2BC86
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763740619;
 bh=PxN1kKcbmsayKjAbhYkIf5ei+/f87NdEWIzkcYKf1rA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DIGPz/iTjd1rrI+oKDc0x8sgQ+7u2JmiLppyKdFpsqEuxu/zZGukGjD0jWkrIk9NN
 Q5hCO/wduxP89YcoAVd65lmLHSK6jmTR+XKr31pIuiSrrI2USJa5ArYRaGm9PFyRN0
 xdv+BaKnam4katXkC/DPgjd6G12gVzV0GPmNI3jQpp1dvRTyUwV4pw3Fs/PV3bp7gR
 CfLOisDVuTp8n9p+gXFteSs1MW5aIq8nsYl8CK73Cw6TivYgBzaw8OQrb9EZTGSzi2
 ZlIzym4LPBtOPZ+QVNK/d8LpJwvUL05c9MYMaL0xFLbvK3VF8/y6Coe6xboh30nkFO
 lq4Bu1UNXqoEA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5959d9a8eceso2569649e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 07:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUp5wzaZzChtBFT7cZfLwtmzp7Nb6gNdnCwqPJO0sMnDQDefpQl/kkYnt1NfZlkhVVcECAYg1em80Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5Z/3P17j1xwanNvunwc1wABObZEZ18nwz+xxxUOrRk04N3Z6s
 CNffHd36rtWM0Q6Mbjra0HOG7OKuIV9sqal+5gQnGbE0xfsE/fFqhjLuP9ne7rkn2LpIZDCsRS7
 aQBdx9D8mIosXirlsQsEGkfWCmCqPrVo=
X-Google-Smtp-Source: AGHT+IFc07wm23hRt5x6E5vt9dWJKlKV7r/oPKbOUgisqHzxDRZC6hX2KMiXOjZbJFYb9IW5F8q//Vmfp5+N+9MSM5I=
X-Received: by 2002:a05:6512:224e:b0:593:f74:90c1 with SMTP id
 2adb3069b0e04-596a3eddddemr1011328e87.42.1763740618060; Fri, 21 Nov 2025
 07:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
In-Reply-To: <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 16:56:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
X-Gm-Features: AWmQ_blY0LARqXnA2mx39E1yO5MH1W25KbCHBoidZ2MUQVLTBxhVpSWsyYxPQP4
Message-ID: <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
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

On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> > On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>> struct sysfb_display_info. Update all users.
> >>>
> >>> Sysfb DRM drivers currently fetch the global edid_info directly, when
> >>> they should get that information together with the screen_info from their
> >>> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> >>> passing this to drivers enables this.
> >>>
> >>> Replacing both with sysfb_primary_display has been motivate by the EFI
> >>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>> Using struct sysfb_display_info this will become easily possible. Hence
> >>> accept some churn in architecture code for the long-term improvements.
> >> This all looks good to me,
> >>
> >> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks
>
> >>
> >> It should also bring us one step closer to eventually
> >> disconnecting the x86 boot ABI from the kernel-internal
> >> sysfb_primary_display.
> >>
> > Agreed
> >
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks
>
> >
> > I can take patches 1-2 right away, if that helps during the next cycle.
>
>  From my sysfb-focused POV, these patches would ideally all go through
> the same tree, say efi or generic arch, or whatever fits best. Most of
> the other code is only renames anyway.
>

I don't mind queueing all of it, but I did get a conflict on
drivers/pci/vgaarb.c
