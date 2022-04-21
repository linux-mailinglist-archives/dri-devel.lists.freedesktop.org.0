Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3A50A01A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1DC10E6E6;
	Thu, 21 Apr 2022 12:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1E310E6E6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:54:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u15so1373468ple.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbT0ufs8hhFUmGFXmvk8EHCBgVcwB+SywVbegWDB+bs=;
 b=HkSXIHtS+C43UypZg4urQxLWl81TI5WPaZcpcHogdhzQ1qIwaFTq0hVztAYUoI6C+0
 kVxg/tBsW2Yazj5CCvgeE4QHtnoRBRAM3IJ9Bgw8NyBxDfgf+oHDRAWT2R0ptK4KEoer
 xlQHrdNivGcRlsYe+v473ZA/qNcTDBkjJvG6ghQvIjsI6AtvMR2XpHniouJlQOXL+bjM
 Cp7ljott8sZXx5JVGSvZJbtqsINKGNpbxsIFciv7oLxxUOk+rYId3ON2A3qpLOkCus9B
 a/gYyu2cKp+wqRe5giSE9WqqtU0rI6I+jDpwdPK/o/uIVisOArAmUzBXVHmprkXeNLV4
 xIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbT0ufs8hhFUmGFXmvk8EHCBgVcwB+SywVbegWDB+bs=;
 b=lJeGVqExIrUtry/TQPZkwbl/XBGwDZ8FyUH5q/Fz+kl6sC0LP2milnR5RFagGamTK9
 3PR8tY14CFTKG2Erqe6o9+ov4CEgiHKVekD2Npymz66qnWeWjGNudVuCCQMUZix3mu52
 VBTxIadGUN2ooWk5xuE390R8pU1pwzrpliVqDfjCrbvJVcqtmcd36Azn7SMXEjeT8hOK
 V+I6q1unZ1dcARrNSDN3vsDzRRt343rJu+YHT4Jf+gf3aTkjMU6VgSitWn84QmmjPZuu
 SxF60dKIq97tubJZ+BD0TppGuWY9kP11qRT9oUE1Bw7pG6uLw7BJfZ9CxGDT79PqRsyz
 wXtg==
X-Gm-Message-State: AOAM5323ZCXHinrlQpRuRvpX1dUFIj5ukU6A7JGN8t41cGovSR4++xQd
 gvR8C7rA4zqfj3Lo9C1NvVC5JMxt3jZ/J4wwZ6Y=
X-Google-Smtp-Source: ABdhPJx+8395YqausJ5yKUEqAmsX6qaS7KThwCRy2ZPLMLA3pGeKRsSBn+8saoZhtpNw6BfhbSsSGsDTgWnX84jOevA=
X-Received: by 2002:a17:902:7e0d:b0:156:47a4:a7c4 with SMTP id
 b13-20020a1709027e0d00b0015647a4a7c4mr25977133plm.141.1650545689357; Thu, 21
 Apr 2022 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
In-Reply-To: <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 21 Apr 2022 14:54:37 +0200
Message-ID: <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 2:47 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Patrik,
>
> On 4/21/22 14:39, Patrik Jakobsson wrote:
> > On Thu, Apr 21, 2022 at 1:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 09.04.22 um 06:23 schrieb James Hilliard:
> >>> Select the efi framebuffer if efi is enabled.
> >>>
> >>> This appears to be needed for video output to function correctly.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>> Changes v2 -> v3:
> >>>    - select EFI_FB instead of depending on it
> >>> Changes v1 -> v2:
> >>>    - use depends instead of select
> >>> ---
> >>>   drivers/gpu/drm/gma500/Kconfig | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> >>> index 0cff20265f97..a422fa84d53b 100644
> >>> --- a/drivers/gpu/drm/gma500/Kconfig
> >>> +++ b/drivers/gpu/drm/gma500/Kconfig
> >>> @@ -2,11 +2,13 @@
> >>>   config DRM_GMA500
> >>>       tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> >>>       depends on DRM && PCI && X86 && MMU
> >>> +     depends on FB
> >>
> >> Why do we need FB here? Framebuffer support should be hidden by DRM's
> >> fbdev helpers.
> >
> > It is not needed but gives him video output since it enables the drm
> > fbdev emulation.
> >
>
> I'm not sure to understand this. Shouldn't depend on DRM_FBDEV_EMULATION then?

No, it shouldn't depend on any FBDEV stuff since it's not actually
required. It just happens to help in this case since weston + fbdev
backend works but not weston with drm backend (or whatever config
James have set).

>
> > I looked some more at the logs and it seems weston doesn't work on his
> > system without the fbdev backend. So the question is why weston isn't
> > working without fbdev? Perhaps this is just a Weston configuration
> > issue?
> >
>
> But is weston using the fbdev emulated by DRM or the one registered by
> efifb? I thought that the latter from what was mentioned in this thread.

It's using drm fbdev emulation with gma500 so EFIFB has nothing to do
with this. I believe it was just simply incorrectly reported. If I'm
correct then "depends on FB" is what makes video output work for
James.

>
> --
> Best regards,
>
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>
