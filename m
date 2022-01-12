Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257448BF5F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 08:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C951811222A;
	Wed, 12 Jan 2022 07:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61D11222A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 07:57:56 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id l15so3142748uai.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 23:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dlv4bb07uQ08vixl16O6rQbCEVIDaSU7CPtshf2sCJ8=;
 b=27yCDrqn7VFq79LZVVZ9oO3A5Tlo6+x3IYZsUMCaU8CN1laWvEZPzfQXKKI6qcYesF
 3sJfuixEAESOu37IduOWRO7Jn9CW9zn7FInQmDAUxo00zxk0f6BdavJaATnk9ONMrv5c
 W2OmnIBoTPnuHjlVeQQDVI0QRN6sixEuOLCdiD0tXAJtGjoomLo9C3F4CR6XP+3wXU/I
 lGkQIaFD3GJho1E51nC+axl0XFPoyRNsSzBPz4E4B9wCSVO4r/UXvws5bIpvXOpsuo4S
 zKZRs+jpGvGuD6sMdYL/Mwe3rliBZAttyndfWJD5iJBVLL/sfIAOuTe1hjEcoPgXozr5
 3OEQ==
X-Gm-Message-State: AOAM531fqOKF7T3qLZBKMOqEYtrFMlL3y60vPuvu4fpJpybqFcZQS7IT
 T2ZZuXt7CEpmk2evzlJ1x2g30n//FADCbQ==
X-Google-Smtp-Source: ABdhPJwOMWl/52ULcgI+HbMwtv58yM8WuPaiiIjTwSAbW7C7kdGTmef+oSVhNunILlaid3RCQ4ppIA==
X-Received: by 2002:a67:f116:: with SMTP id n22mr3610472vsk.71.1641974275769; 
 Tue, 11 Jan 2022 23:57:55 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id g43sm6969404uae.2.2022.01.11.23.57.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 23:57:55 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id r15so3238135uao.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 23:57:54 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr3471391vso.77.1641974274526;
 Tue, 11 Jan 2022 23:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20220110095625.278836-1-javierm@redhat.com>
 <65a13d92-93fc-25d2-0009-b7e60f3392c4@moonlit-rail.com>
In-Reply-To: <65a13d92-93fc-25d2-0009-b7e60f3392c4@moonlit-rail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 08:57:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWBfA2rqu4DhWkpDt+PmNdZLC6_zcG+W+m=8UDudO+vA@mail.gmail.com>
Message-ID: <CAMuHMdXWBfA2rqu4DhWkpDt+PmNdZLC6_zcG+W+m=8UDudO+vA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] video: A couple of fixes for the vga16fb driver
To: "Kris Karas (Bug reporting)" <bugs-a21@moonlit-rail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kris,

On Wed, Jan 12, 2022 at 3:19 AM Kris Karas (Bug reporting)
<bugs-a21@moonlit-rail.com> wrote:
> Javier Martinez Canillas wrote:
> > Changes in v2:
> > - Make the change only for x86 (Geert Uytterhoeven)
> > - Only check the suppported video mode for x86 (Geert Uytterhoeven).
>
> I just updated Bug 215001 to reflect that I have tested this new, V2
> patch against 4 systems, one more than last time - 2 BIOS/VGAC and 2
> UEFI - and it works perfectly on all four.
>
> Thanks, Javier, for the excellent work!
> I didn't test with non-X86, but the code appears to bypass the patch on
> non-X86, so should work fine for Geert.

Note that I can no longer test the PPC use case, as the hardware
died a long time ago.

> Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
