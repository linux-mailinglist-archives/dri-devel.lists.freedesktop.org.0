Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B84A61E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED08410E6EF;
	Tue,  1 Feb 2022 17:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7510E6EF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:06:46 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id b186so28373886oif.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdQTcqQ9Qr4h0L2NlLlM99qGIKmmmXyVpgAfVQlyXvw=;
 b=aBXJGsBy39GcwPGw1gQwRkkKV6thDHpcyarDrmkoubQM6M8m7KheFYLmVcR/iba2MT
 ++t5VYXBHifuxfZgt0rPdm2eEQIi4to/6t4QII6YDcjxIphQkcY9ydqlzF1HGNKaSs9V
 IvfM1MNQmBgOqUNJRefzdJIahGbbWzxTo2tEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdQTcqQ9Qr4h0L2NlLlM99qGIKmmmXyVpgAfVQlyXvw=;
 b=i/L80ib5bAj9XdFIhWGvwYn8kV1wIo6GrYJswqNcKKkvduXfjbLwjG4KGSBaIjW5Rl
 DfE0AT5CbI7HYdFvyUbRRg0ZqJeZ5F5x5/hExf1oaQwZn9x/VBE4NCaW9/AcKkQk+jzd
 AIoQLeYPF142T47KQCI6imHAePhpje6ujVGJC/XUK5yq9nLs15wXDaOsd0GGS+zPaNIG
 Fx2uI6wfD1r/0OdYntjkiJ/fOCwOxmo5d/n8pAgEpvt8C/jsQPmyeFYKa6L8Fvj4eMlm
 RhmayTTjfRjQvWADcK386C0FdARNLjBvv/rJ9D42Q5aIK82ec/ObQawpzdbxOMU0I5gj
 +cwg==
X-Gm-Message-State: AOAM5302MESPCSMp4lBMpGmYWlKKuBCpKtHIFML1Fwj+gMZPVGTyw3Nf
 8CrLSNixNwZN6owjMADpGbZ+VcNdJbYufrZgh8fpBTvcir0=
X-Google-Smtp-Source: ABdhPJxmJTT10BhmESxaD9wSsaXi2TyqjKpx8TF/TQp9so++NA/uk65aK3wvzaI2XbQCX3/1SL7QYNE/AkpMguwVMkA=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr1928959oib.278.1643735204982; 
 Tue, 01 Feb 2022 09:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
 <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
 <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
In-Reply-To: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Feb 2022 18:06:33 +0100
Message-ID: <CAKMK7uEPuw1+-=h7gvSyCxW4zNuTK3UNZP6yjpP6MPV17sAasQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 6:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Thomas,
>
> On Tue, Feb 1, 2022 at 5:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 31.01.22 um 11:18 schrieb Javier Martinez Canillas:
> > > Another thing that's missing is a DRM_MODE_CONNECTOR_I2C, because I used for
> > > now a DRM_MODE_CONNECTOR_Unknown.
> >
> > That might have implications on userspace. Maybe ask around. (Not that
> > we actually run userspace on the device).
>
> Looking at the list of connector types (and wondering if we're gonna
> need more when converting existing fbdev drivers to drm drivers),
> there seem to be two different families of connector types, for
>   1. transports between CRTC and display (e.g. VGA, DVID, HDMI),
>   2. transports between CPU and CRTC (e.g. SPI, possibly USB, and
>      the proposed I2C)?

I was trying to argue for a panel connector type and stop doing all
these internal things because like you point out, it kinda doesn't,
only the external connectors are relevant to users. But it didn't
stick anywhere yet, we keep adding more connector types and then
having to update userspace, which should map these all to "it's the
panel" or something like that. But also since various technicolor
abbreviations are about as useful to end-users as "unknown" it really
doesn't matter, so I'm happy to let this bikeshed get a tad fancier
every year :-)
-Daniel

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
