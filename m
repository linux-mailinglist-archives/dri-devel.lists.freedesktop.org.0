Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA84BF4C2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34310E813;
	Tue, 22 Feb 2022 09:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33D810E813
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:31:42 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id g21so20435598vsp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9+nPoKijn+B5JvUYIGON25vpNUK9SwZAed4YYcFvJs=;
 b=QQ77hQ9yF9Pbwj6Edyk0nciHaeecodCV3dbEPaUNx672osp43x31ypTmp67Yef8qnC
 CYwTMUAX3U4OcfJ5ZNgOnKS2osy+gF7HinDyxqP6gMCVjd1OPBaFbQapY8IVBhiLFhU/
 81GiIRziaezJJ3YI6wmCksK05tdSeJplO2PvU1F+wto3aWVcinVl3VVJhnptoVBzveFX
 EZwK2CUJOtkKCA7/YVm8PsCzPKYAIMNmN8GkqXrHPssJH0SAi+ubEDIPvREnLxbR9rkl
 mKqBJnYtZCnYU1W2XNBTOdUmuh+Uslmm+zoVbsnSMGphkZK0wLgciIgUNk1/sxF/gMAo
 NkHw==
X-Gm-Message-State: AOAM5329RlR6sXg+DgMfqyRvoCnpQN8y32OPDN2SgxBfZ/eR48qCgUyj
 hf9maTFw66rJZVsYrl3ZpRSEJuRN3djGpQ==
X-Google-Smtp-Source: ABdhPJzKMBPEttYBLQsApVi12rvZDxyfojgAHMR/3hj7H7R9JQkpDz1Awb9pBGzv7WlWyijLOSlTeg==
X-Received: by 2002:a05:6102:41a9:b0:31b:9e61:f10d with SMTP id
 cd41-20020a05610241a900b0031b9e61f10dmr9267246vsb.85.1645522301490; 
 Tue, 22 Feb 2022 01:31:41 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id u7sm703985vkl.36.2022.02.22.01.31.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 01:31:40 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id l10so10046418vki.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:31:40 -0800 (PST)
X-Received: by 2002:a05:6122:114e:b0:32d:4662:65a8 with SMTP id
 p14-20020a056122114e00b0032d466265a8mr9828450vko.0.1645522300176; Tue, 22 Feb
 2022 01:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20220203093922.20754-1-tzimmermann@suse.de>
 <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 10:31:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
Message-ID: <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Doug Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 10:39 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Feb 7, 2022 at 12:31 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> > the option to fix the build failure. The error message is shown
> > below.
> >
> >   arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
> >     `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
> >     `drm_panel_dp_aux_backlight'
> >   make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
> >
> > The issue has been reported before, when DisplayPort helpers were
> > hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
> >
> > v2:
> >         * fix and expand commit description (Arnd)
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Thanks for your patch!
>
> This fixes the build errors I'm seeing, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Is this planned to be queued? This is still failing in drm-next.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
