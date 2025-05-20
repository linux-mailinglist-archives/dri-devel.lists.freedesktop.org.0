Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A08ABD8F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 15:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35D10E5D4;
	Tue, 20 May 2025 13:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DD510E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:10:12 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2d4e91512b4so1767116fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 06:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747746610; x=1748351410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PihPyOnVfAc0awqgzD+HWXM/THFITbZ4L2dMvsSbwyw=;
 b=usI7swwferSfhtHXlo2sNOtB/VeBL2U+NZAo2zJ4OI49+ClqJTBL7YqhgNkApEZcef
 ynA+iJXN10geL5LuY4whGRhjroiClg/uY5g3OURufpLOJCeVMkJWP2OzN2OPRA07vhf/
 XSKmHY1Ir+dd2na1tF4CMlRz87UI46MnOwcS4/6wTLJ619e8ZJeKXSbV/Xv+sIi7uhpT
 yjH8U5xzPDmF8CpOnk6+UOUPfv4h+rWJDeldh5eOmpl3T9K2SvPft0nHZ+YyLj+HfX2U
 4pxgROi1aG0XNw0UetXzD2jaSGEoW4mImHpnYu2mV2Kap3CksWIRA3H5ASQUrUDhXgVU
 CPzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDurJmlxDymeGaoNZ3x3pv9oybKSdTN/FBAE2JLE2TrDmRcurtsw7Zw+whjE+VHfBPKdXg0ER1vuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmTs4EQ2wa7fmb8eo2asJrPHdM4Bo5jEWPi/t6RpB53AnJQUU4
 bJsUF8xFtIC7R9WUckfLAuzfczZPvRMYHfGKb4WWJN3vsAQ6KTHUyBeFyO0dXBUS
X-Gm-Gg: ASbGncsEowfSWU2VvEuhNnM41aKx8gHX1UW7c9YHfNP0Qo9tWgio6aGCE7MKLNx1v3H
 8cp1ww5JM6fUGUt4LLPu1IYKYDxhpqJ/fbQgwkw/Rt1AM93hJiGlUJs2AqsaswLgjhDydbYylRD
 A53IHTX++OLW7hURZ7l0EwpR0t72sr7yNCTJlwPl8QyRznkY0I8uxRg48/vz2Rdptbdeo0bcslw
 Tr9G1gX8owrujYNJ6eiaqnauwf28E/Q2vdpUPMLWF+4CxNXNSzNrv2aDFChpewv1jP6BNAuOnmR
 nugVA34AFB2d6xjswpnKMncCvUjDRhvqkQknjR4x4EdNqHL/RgidN+owgZbjz6fObw2VOrT5WDJ
 CysuoGlNfKU/TWw==
X-Google-Smtp-Source: AGHT+IENdGKM47O21UWjXJ9d15Z9IChfZ1NSB4qgP/MMZ6hNRCi5PdVFYPd6YQ3Y+ATZwNvGRwPbwQ==
X-Received: by 2002:a05:6871:5e14:b0:296:b0d8:9025 with SMTP id
 586e51a60fabf-2e3c8376c64mr9588651fac.20.1747746609656; 
 Tue, 20 May 2025 06:10:09 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2e3c06a93d5sm2189302fac.12.2025.05.20.06.10.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 06:10:09 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-6062e41916dso3323559eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 06:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ5Hk9JNWyhuquNT1FxiGc4XrM8NUwPpE4GGwanMldJLKhaqBRkhngBJDlJtuFwWCCuYkbSSaDcZU=@lists.freedesktop.org
X-Received: by 2002:a05:6871:6089:b0:2d4:ce45:6985 with SMTP id
 586e51a60fabf-2e3c82002c8mr9244405fac.11.1747746608411; Tue, 20 May 2025
 06:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
 <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
In-Reply-To: <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 15:09:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
X-Gm-Features: AX0GCFuWRN-2Q9BJGy-nr1GbiWBc5HMiQPDlkidfm2ZCaSPcGNWJYB8zl_mxdns
Message-ID: <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
Subject: Re: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Thomas,

On Tue, 20 May 2025 at 15:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.05.25 um 14:40 schrieb Geert Uytterhoeven:
> > When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
> > the old symbols were kept, aiming to provide a seamless migration path
> > when running "make olddefconfig" or "make oldconfig".
> >
> > However, the old compatibility symbols are not visible.  Hence unless
> > they are selected by another symbol (which they are not), they can never
> > be enabled, and no backwards compatibility is provided.
> >
> > Fix this by making them visible, and inverting the selection logic.
> > Add comments to make it clear why there are two symbols with the same
> > description.
>
> These symbols were only meant for variants of 'make oldconfig' to pick
> up th enew symbols. They where never for being selected manually.

But that pick-up does not work, unfortunately...
(I know, I had one of them enabled in one of my configs ;-)

The alternative is to just drop the old symbols, and ignore current users.
Which is not that uncommon...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
