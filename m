Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2E39AB1C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA56E5B9;
	Thu,  3 Jun 2021 19:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AA06E5A1;
 Thu,  3 Jun 2021 19:54:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C47E961403;
 Thu,  3 Jun 2021 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622750056;
 bh=A8bTRZWGyUBja/MSUQ29VA/mAZj6QtYjbvJCbANIqsE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lfvGW1xaIASaWdfnsj8Xa660kIIT0mmbK6felqgEx4EDG7tPnuUtWGLq9bZeqboYv
 jFvKEAaYpYW6PQOCOemYaLD6rVqaUJmOPXUycexgYypJfAlqP1xhsXpPhj2AD6fGgE
 iOAZbfFS2LGvC0fw2keWywTtHxmEkVsSa5/RR0djNImU9X2aZtCSVY5pViIUIC+7MU
 AYBLRvSSIkgyKad41421ycs7ejiZ1pdWOJMQJYtt6D8qItdbbJI89CpbkYfsaKPBLb
 mGpj8e8CkhwtWk0dhrRb/AiSG6CcvKzb6zYq4JfvZ2Zvbzw+RRp0UHjrjQ6u3Mkr6i
 XrlU86O1/zRgg==
Received: by mail-ej1-f48.google.com with SMTP id jt22so11004529ejb.7;
 Thu, 03 Jun 2021 12:54:16 -0700 (PDT)
X-Gm-Message-State: AOAM531Iwb6eZQLhFRmIgQIpHWSFw/ifI+y+LhmiidXQ+T2AmjqSDYvy
 +SxYtdMjaGbvNeGJlMUZ6+rrotjOwyYpvNzN7g==
X-Google-Smtp-Source: ABdhPJwDQD3xcAB0EXKWI0UDWW+ahHSVny9rQ0wOAWpa2cEgFyxpNPLRRrZrFwuDL+b/HEK8on4d0VTBOUxATJD7qJU=
X-Received: by 2002:a17:906:fa13:: with SMTP id
 lo19mr895806ejb.468.1622750055293; 
 Thu, 03 Jun 2021 12:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
In-Reply-To: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jun 2021 14:54:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLF6WhsoSWtxVUqUPDRMM8qwGwZqWa_xtNqsVyq8OCz6w@mail.gmail.com>
Message-ID: <CAL_JsqLF6WhsoSWtxVUqUPDRMM8qwGwZqWa_xtNqsVyq8OCz6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
To: Kees Cook <keescook@chromium.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 1:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
>
> pl111_vexpress_clcd_init() starts with:
>
> if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> Isn't that supposed to be enough to avoid an undefined reference?
>
> Making the whole file depend on VEXPRESS_CONFIG is not right either.
> Not all platforms need it.

Specifically, these defconfigs will break as they all use PL111 but
don't need nor enable VEXPRESS_CONFIG:

arch/arm/configs/integrator_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/lpc18xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/lpc32xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/nhk8815_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/realview_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/spear3xx_defconfig:CONFIG_DRM_PL111=y
arch/arm/configs/versatile_defconfig:CONFIG_DRM_PL111=y

These defconfigs should all be failing with the same error, but don't
from what I've tried nor have I seen any kernelci failures.

Rob
