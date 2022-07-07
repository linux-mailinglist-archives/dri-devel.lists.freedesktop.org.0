Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6F569D26
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3463112FF9;
	Thu,  7 Jul 2022 08:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA761134DE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:18:18 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id r2so1042270qtx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGKt7asbys1Oz0aLnMDeHXY5fIlvUf4cm0RM9Yv1HI4=;
 b=ItfkWoJIxCsjHcCP4AMjwffq4Cyy1PH0Kl6SUxCUQGDnMAzm+cG/bVK2pyfzs1qSsx
 ko2s60bnEq5Lw6rKA4H1lza3yGD0QuvmznxH7PTwSaqoQnSIvKOiA5H8IKPMiG0nVrrL
 r3qfeNyCYtyTT5A5HJJYRAO2RqmSetHaGRYMFlEA6+UVE/01aqSUIbj/OgdGS6enxske
 qIMEN9GIQ668b3wI9f1c/GSQ1FRFhVaiwjT3ul989JEV7jJGtenAN6XgaqehiX4c0O17
 QRv05s+h3cmPidxXRqlG7rO63Lb48OVu9rXJAp5d71UCdC1Ebj1Ue76nMDK1yL/655vn
 YFkQ==
X-Gm-Message-State: AJIora+ViRqjJ+Vxxw0m9OK3cLiI9ahE+xYbH9daqmyScvSsmlv3t4aQ
 BrxgEaouuVgcVYF1wZi2E0fJ4xNRc9SMxgq3
X-Google-Smtp-Source: AGRyM1ugGEYe1qJo+hGeBDh3MO6Wg1dTBtk+558OxG3Fkhd3VYPe9B8k4QB6qevHaErUcRZs06wWSA==
X-Received: by 2002:a05:622a:1904:b0:31d:3e23:7bf9 with SMTP id
 w4-20020a05622a190400b0031d3e237bf9mr21256722qtc.630.1657181897484; 
 Thu, 07 Jul 2022 01:18:17 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 p20-20020ac84614000000b00304fe96c7aasm22157251qtn.24.2022.07.07.01.18.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 01:18:17 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y195so36165yby.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:18:17 -0700 (PDT)
X-Received: by 2002:a05:6902:1143:b0:66e:8ad6:34c with SMTP id
 p3-20020a056902114300b0066e8ad6034cmr11261585ybu.89.1657181896856; Thu, 07
 Jul 2022 01:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220706150253.2186-1-deller@gmx.de>
 <20220706150253.2186-3-deller@gmx.de>
In-Reply-To: <20220706150253.2186-3-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jul 2022 10:18:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-KwFM-pSqaN0vx6aPD68hWtVoZLRQmGfsfFdaJXx-eA@mail.gmail.com>
Message-ID: <CAMuHMdU-KwFM-pSqaN0vx6aPD68hWtVoZLRQmGfsfFdaJXx-eA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] fbcon: Prevent that screen size is smaller than
 font size
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

On Wed, Jul 6, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
>
> This patch adds a new function fbcon_modechange_possible() which
> implements this check and which later may be extended with other checks
> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> for a too small screen size.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
