Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9742E8DF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 08:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1756ECD4;
	Fri, 15 Oct 2021 06:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26016ECD3;
 Fri, 15 Oct 2021 06:20:46 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id q13so16003042uaq.2;
 Thu, 14 Oct 2021 23:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeqGcsm7RTKlniuoQ/dGkOIPSSc1dZROADBLZSH8YyY=;
 b=jY2Asl6RBYmf3lRkbarvHAR2azLEzgCgrs1Vs58Koo8rAf8JoWeiAfhfokJaw2mv2r
 EmfX3ecG8611yhHbLwvxDwf18yjoEbC+vbryxypvJh2nicfWiBB9FPLfSzKzmoX/2h8G
 xqKTyj4UB6CXMc42jEt40UJhNQuj36VTyW3p5pKKtDTCBZYtnVHNGHBEDV8iP+a5oSUS
 xumbV7wB/tbKzwK5C26MD4NA+OYZBVmZsDBoeSVhU2JtmltrT/b8sX8/7C9BeJvAv3v3
 Xfj0EtCrItxZ5ooRhtzsDA0QIA8jDBGbrmH7jTKJqQd4Uj07jufoPvsFIB161BdF4L9M
 Bsgg==
X-Gm-Message-State: AOAM533H2EAACdV1IrA1/Vk/z4SzM+wseIQ1HhqsNdld8HfsogxKARY1
 UaHAErWNKgxNl8flUPHWY1Y6g+qlwtNj8w==
X-Google-Smtp-Source: ABdhPJx5dq4bAipWjm6O0nc7EJIHUZ7b9UKjsZfNlJvENuavfs7icf9Uy1C9tcFMAngpmXtBLANV1w==
X-Received: by 2002:a05:6102:3f0f:: with SMTP id
 k15mr12132859vsv.10.1634278845340; 
 Thu, 14 Oct 2021 23:20:45 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id g6sm3202334vsj.12.2021.10.14.23.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 23:20:44 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id f4so15977956uad.4;
 Thu, 14 Oct 2021 23:20:43 -0700 (PDT)
X-Received: by 2002:ab0:538a:: with SMTP id k10mr11690117uaa.14.1634278843480; 
 Thu, 14 Oct 2021 23:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org>
 <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
In-Reply-To: <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Oct 2021 08:20:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe74a32nkM0+yETnGL9P6TrtcpXEpHS0j__Ye8GRBKdA@mail.gmail.com>
Message-ID: <CAMuHMdXe74a32nkM0+yETnGL9P6TrtcpXEpHS0j__Ye8GRBKdA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Elder <elder@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hi Dmitry,

On Fri, Oct 15, 2021 at 2:26 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On 13/10/2021 17:42, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> > phy code is left out, which results in a link failure:
> >
> > ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> >
> > This was only exposed after it became possible to build
> > test the driver without the clock interfaces.
> >
> > Make COMMON_CLK a hard dependency for compile testing,
> > and simplify it a little based on that.
> >
> > Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This drops dependency on CONFIG_OF. While ARM64 selects OF, pure ARM
> does not.

But SOC_IMX5 depends on ARCH_MULTI_V7, which depends on
ARCH_MULTIPLATFORM, which selects USE_OF, which selects OF.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
