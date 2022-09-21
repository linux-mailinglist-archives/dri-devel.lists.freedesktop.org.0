Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3F5C0494
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 18:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2F10E00F;
	Wed, 21 Sep 2022 16:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4983510E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 16:49:01 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id z9so4877755qvn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 09:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3qFaGkY9CCS42x3fMr78U/0joSy0gdPgTA8V50h7rRU=;
 b=1u+XBVYcMuhXCOltnZH2t3NEcBEY4h4tPHg5wUmKElqO+H3V8Khm0CfoDSumK3/KWr
 mSx9QOxqdtEfzAZCnP8mPNpef8E7SjOgllOdWcAMQod8u/fMuQF4O6cgjfhC25cjlruT
 AvH/LnoqRS0/029K+9bmigjZoscgtIPapaw/JbJcs4WM08I3sB9kgvwMxtRVHYCmD709
 GXPlYKe5Y229K6bff214tnzK1aDWRPOZWJy5DH0z7GzCpmn74gRI/clD/GITZcC3Kw3j
 NtjVjDR3aYQYjLWitRZke0momwJqy9UwKmUfGBTV+KKflicZz6W+mwW+tp3QMEOTfYRD
 AJkw==
X-Gm-Message-State: ACrzQf0fmfi6cJ5A7mb53jAr1vluigDx/4RNUZMzjTWqt7XoyDcn7CEr
 JokZYQhONQ4qFYdcx81KrAgAvP6Xm29ej3j0
X-Google-Smtp-Source: AMsMyM4iYm0eOJy1F2nt9zXR1kiCm15sy7OODp+1rPzSLe5B2LBRo9RxVq0POpUXWFRBYnWK3txo6w==
X-Received: by 2002:a0c:db05:0:b0:4ac:d6ad:379e with SMTP id
 d5-20020a0cdb05000000b004acd6ad379emr24610773qvk.121.1663778940039; 
 Wed, 21 Sep 2022 09:49:00 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05620a0bcc00b006bbe7ded98csm2074339qki.112.2022.09.21.09.48.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 09:48:59 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 198so8973600ybc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 09:48:58 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr23009053ybp.365.1663778938618; Wed, 21
 Sep 2022 09:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
In-Reply-To: <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 18:48:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Message-ID: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org,
 maxime@cerno.tech, mpe@ellerman.id.au, msuchanek@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Sep 21, 2022 at 2:55 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 05.08.22 um 02:19 schrieb Benjamin Herrenschmidt:
> > On Wed, 2022-07-20 at 16:27 +0200, Thomas Zimmermann wrote:
> >> +#if !defined(CONFIG_PPC)
> >> +static inline void out_8(void __iomem *addr, int val)
> >> +{ }
> >> +static inline void out_le32(void __iomem *addr, int val)
> >> +{ }
> >> +static inline unsigned int in_le32(const void __iomem *addr)
> >> +{
> >> +       return 0;
> >> +}
> >> +#endif
> >
> > These guys could just be replaced with readb/writel/readl respectively
> > (beware of the argument swap).
>
> I only added them for COMPILE_TEST. There appears to be no portable
> interface that implements out_le32() and in_le32()?

iowrite32() and ioread32()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
