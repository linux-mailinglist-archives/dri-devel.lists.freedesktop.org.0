Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA84A97AA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B869D10F244;
	Fri,  4 Feb 2022 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69910F244
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 10:24:35 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id m90so10068413uam.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 02:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=neWYzNB/qmpg+/pe+fqv1a9W50LwNAnahFMV//r7xao=;
 b=zdlG+FQYu0f+epRMN58stasm4NvvcC0zrVoX6n7nODTOU6RaryXs9h3ZtnV08c8qrF
 hPZerLwCUlZ5Li4Vz3YOgGiC9yhoFBRtMFNQLt03e26LIphVgPbpZi8EhQ5OSYNyOsmD
 KD14UAZHDWJ1TCVVNzXeWthyuGIYN1KNtf5ihr5BJqaILi2gpj1GToJPXYI1B0w95EOW
 sJ/GW3H7F87RXc2CJZ1ltvUEaBWT9gMQM+7g8A8yA2b/COH8Z+7LZ92fM0OSpk2LC07g
 Ll40mapHvs1Mhz+yD4h6JpKluCu9JJ03f6xiQvP14noeur4ZmhntYev1kxrwJ4J+7T1w
 8Gqw==
X-Gm-Message-State: AOAM530fpRaxxB/E6NZ8rei1wazuS4yEgdhuaHoTkIwqRpy3U00AJrjF
 +nFLH4YnlyjH9ySFoOuE4qdetfAeIrfWXg==
X-Google-Smtp-Source: ABdhPJwIPpcGQ4iX1uaVlzj5Ds2DS/DNViPr+eNB25I4w9A1lpS8Yu3g32GcOM1KSMSomRfANK8L5g==
X-Received: by 2002:ab0:604e:: with SMTP id o14mr670717ual.71.1643970274231;
 Fri, 04 Feb 2022 02:24:34 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id r14sm359424vke.26.2022.02.04.02.24.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 02:24:33 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id e17so9982785uad.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 02:24:33 -0800 (PST)
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr862763uah.114.1643970273615; 
 Fri, 04 Feb 2022 02:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20220202135531.92183-1-deller@gmx.de>
 <20220202135531.92183-4-deller@gmx.de>
 <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
 <ee851128-1080-d0ae-6c55-e1816bc89e74@gmx.de>
In-Reply-To: <ee851128-1080-d0ae-6c55-e1816bc89e74@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 11:24:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAs9RC843oL0ME+yJSrSdVVM0Ua+T-KcrX1QTjsO1DZQ@mail.gmail.com>
Message-ID: <CAMuHMdWAs9RC843oL0ME+yJSrSdVVM0Ua+T-KcrX1QTjsO1DZQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fbcon: Add option to enable legacy hardware
 acceleration
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

On Fri, Feb 4, 2022 at 11:17 AM Helge Deller <deller@gmx.de> wrote:
> On 2/4/22 09:37, Geert Uytterhoeven wrote:
> > On Wed, Feb 2, 2022 at 8:05 PM Helge Deller <deller@gmx.de> wrote:
> >> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> >> enable bitblt and fillrect hardware acceleration in the framebuffer
> >> console. If disabled, such acceleration will not be used, even if it is
> >> supported by the graphics hardware driver.
> >
> > Note that this also applies to vertical panning and wrapping.
>
> That's correct.
> Would you mind to send a patch which adds this info?

To add it where? "bitblt and fillrect" are only mentioned in the patch
description.

The Kconfig help entry just talks about "hardware acceleration",
which can mean any trick supported by the hardware.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
