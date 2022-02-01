Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C654E4A61C8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6A10E14F;
	Tue,  1 Feb 2022 17:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDD110E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:01:06 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id r8so1240105uaj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEgpI3G2nX9Lw9uqceH2eAdidBvBzk5i80XCAAy1o9c=;
 b=6wi4pvDsKsAwK4Oy5+SxBcTVpln2B6cGRVgpv95Ph+L/uRN+o+SGjJUzMbn89LZJk0
 v8wQrj460kNLpxYvdilKjIkKvMKCT5nhoctS5R5C5r7OoT/iTqoIZ9lYZvbi/3XYY5Fh
 DO8u/GFiyufoRm8cX7X2jHZIp0MeR+FVtISz7j7KUhNj8GOGvMK9OUvyaJkHh5b2mUew
 4hFYZoWN4b99bDqc2o5x1aBjkP01orJ8IG3Ob5HU+ibIrHMcJdZN5k2RYaKvLV8x1FQq
 dRlwKS2uJkp9DOM9PPa8WBgUFgmP9TMk5z1GfrHEtZcYdOGhi5WL9G3Ucg/Hn1FDg8vB
 daoA==
X-Gm-Message-State: AOAM532/6Jh71tJJnf0Wa+elrdHzDwP5pSzeEl5ubvFjv4Ku1oIXADkq
 Kpn2KQXhtgQWarY8a5YMEMnr48glowE+d7V0
X-Google-Smtp-Source: ABdhPJybXWYGw0IVzc7l4zTahQnR5TaF/a7jJkgUyCkss/mPjxML5+IlxhVQgnONnsAgsM0PJ7EytQ==
X-Received: by 2002:a67:7206:: with SMTP id n6mr9522347vsc.21.1643734865531;
 Tue, 01 Feb 2022 09:01:05 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id n67sm4908602vkf.41.2022.02.01.09.01.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:01:05 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id m90so14326251uam.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:01:04 -0800 (PST)
X-Received: by 2002:ab0:6cf9:: with SMTP id l25mr10528741uai.122.1643734864638; 
 Tue, 01 Feb 2022 09:01:04 -0800 (PST)
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
In-Reply-To: <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 18:00:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
Message-ID: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Lee Jones <lee.jones@linaro.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Feb 1, 2022 at 5:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 31.01.22 um 11:18 schrieb Javier Martinez Canillas:
> > Another thing that's missing is a DRM_MODE_CONNECTOR_I2C, because I used for
> > now a DRM_MODE_CONNECTOR_Unknown.
>
> That might have implications on userspace. Maybe ask around. (Not that
> we actually run userspace on the device).

Looking at the list of connector types (and wondering if we're gonna
need more when converting existing fbdev drivers to drm drivers),
there seem to be two different families of connector types, for
  1. transports between CRTC and display (e.g. VGA, DVID, HDMI),
  2. transports between CPU and CRTC (e.g. SPI, possibly USB, and
     the proposed I2C)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
