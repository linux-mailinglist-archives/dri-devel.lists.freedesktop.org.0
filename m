Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2053E503
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08AF10FB5B;
	Mon,  6 Jun 2022 14:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729EB10EC88
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:20:04 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v1so18576049ejg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zeR4exPLerrOWbFqJdvC1kGSPV0cQ3LiC/P/8HiMc8=;
 b=PonbL/t/3A7d5fxWp714fQaE0asV5scUDmSWkPDH/8ppJ3ACkjD7EQxVjGPRTczbAV
 +ZhuqpjDO9slqOB13l23ZRAGbkF7eFZeKZm7Cu+8FA5rhbqpcoQ+NVZTycnhk3HUoB9F
 jmHkHnS82cP/zG/7a9T1ujSZRRldb5j5Kvc91nEc49qIKGZu5hFv7znxKPK8Xd+Ex8fg
 kDTOkJT1V8c7b91pZjT2ER8nRbYddJvXY7rqbHYtkepKifmL3A/zeDvO0eXoF23oCIUx
 MeD2T/s68EQSuRUjvGt5kc9ECHPodgpZAF470X92i6sC3hSVrYjROw4y0r/c65V2F5JG
 Tc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zeR4exPLerrOWbFqJdvC1kGSPV0cQ3LiC/P/8HiMc8=;
 b=TpfujY592DdZ9/yxPIxl//yWTiCph0zpSwpUmp/PEXOEnYDvWrlAmlmdQZluOLsJfF
 unZT/5y1C4AoJghvGaw25SCb5/rMPvBoiYeHWkDYQWR6dYEGpcNVg1d4O23KghNTbpUA
 ZUVhGnnXysBBHY0DT4AYHQM8aB8NmB7iwnpLh6MI6A0iVcxdHHy36CMxwDms5H1RdKo6
 U+5SfuN0HbSn6hZ1qo0+ICZ1vKFZKVMncWJPSrcRaAb0I+y99wX0hsLq082OKcvDU/2m
 jnfT7xekGjy0b6jnPL47hQNQMzgqA770GNVwpVuvPXsqkvglVwqdKUJknFfwCJfmIefk
 yVfg==
X-Gm-Message-State: AOAM5309cp7yJxTTcGUdq0pW9QRW6p1hPk5bIKM+FE98Se1Nih6NlgmS
 chjcftEdU6joqEb4I51KmZX9Xr6Jh7xBMP3juSLEsQ==
X-Google-Smtp-Source: ABdhPJxDecYJ9aEv69zBvu7MNAmQYz5Y28J8OShJ+zypoo94WzMWVcetkjW5fUL/4qVdb/vHqRg5X8tnlC42fQjH8DA=
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr21651391ejc.631.1654525202555; Mon, 06
 Jun 2022 07:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
 <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
 <20220606135219.nwhp4fdawg2qjeam@houat>
 <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
In-Reply-To: <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Mon, 6 Jun 2022 07:19:51 -0700
Message-ID: <CAGS_qxrPKJrXufMKOCO3eCEpq-Udq6uy32x6aneSPRnm=1O4HQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 davidgow@google.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 6, 2022 at 6:57 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>

<snip>

> >>>>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
> >>>>          --kconfig_add CONFIG_VIRTIO_UML=y \
> >>>>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> >>>
> >>> It's not clear to me why you would need VIRTIO here? The Kunit config
> >>> file should be enough to run the tests properly
> >>>
> >>
> >> It's needed or otherwise KUnit will complain with:
> >>
> >> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig
> >> [15:47:31] Configuring KUnit Kernel ...
> >> Regenerating .config ...
> >> Populating config with:
> >> $ make ARCH=um O=.kunit olddefconfig
> >> ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
> >> This is probably due to unsatisfied dependencies.
> >> Missing: CONFIG_DRM=y, CONFIG_DRM_KUNIT_TEST=y
> >> Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".
> >>
> >> The following works correctly but it won't use User Mode Linux:
> >>
> >> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig --arch=x86_64
> >
> > But then, can't we add them to .kunitconfig?
> >
>
> That's what I asked in the previous RFC too. Daniel mentioned that it shouldn't
> go there because is platform specific (AFAIU, one might want to test it on x86,

Slight correction, it was David who explicitly suggested it shouldn't
go in there.
https://lists.freedesktop.org/archives/dri-devel/2022-June/357611.html

> aarch64, etc) but then I asked why we couldn't have a arch/um/.kunitconfig.
>
> The answer was that's not that simple and some agreement on how to do it is needed:

I'm a bit more in favor of having UML-specific options in the drm
.kunitconfig file, but I agree it's a bit unclear.
If people want to easily run with --arch=x86_64 or others, then
they're indeed a liability.

Another option is to perhaps explicitly name the .kunitconfig file
something like drm/uml.kunitconfig, which doesn't solve the problem
but makes it less of a footgun.

Stepping back, I feel like perhaps a cleaner answer lies in adding a
new Kconfig option that selects CONFIG_UML_PCI_OVER_VIRTIO under UML
and just CONFIG_PCI otherwise.
But that's a bigger discussion still.

Daniel
