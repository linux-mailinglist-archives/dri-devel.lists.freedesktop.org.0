Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2B53BD81
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DF911331F;
	Thu,  2 Jun 2022 17:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E18711331C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:45:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v19so7212361edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/j8ff/empoIVzIPqKgRJrZ1yf+Uabh8CB6phARQHw8=;
 b=pjj97zVwrM2CrMZNQ3YkjATsb+hGhtkoV0IpDJjgCaefeTLDdnSoin2KLI9/QKKmxO
 oA3TdT7FkZz2tbI4HStW8JyPCbfhVf0FHFBe6OppQ77QKTNmsKLy/hQckjF20VRrgdna
 WwLC6aH/+MnQQ7yWyEgjSOj1N779suPF85G7D73rEpHEoJwWe38490e8Ul2h9EviJOzQ
 dZsuwxUIzJbucpc5J+ygfZ8y4wx580vg1bv3nY1mJ+Ger3GGq95WzFb6ykyto88yD8av
 OchcgEkqmZiP0Sys7Ju/I+lMSWVVA4zu+08fZAJUvuParWjBk3U901h2VCPqXupCrG07
 4+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/j8ff/empoIVzIPqKgRJrZ1yf+Uabh8CB6phARQHw8=;
 b=zH7XJ6GezSGjoK578FtxyQSaXmiP4dbf2blfD92PwR8/6DdpeaSK3hycm6P3tCXC0A
 l3Ir4fyunkmJbmIXBDv0T4R1DjBViCEVVUyKcXBqFhbcXrfOwc9G84GM/m9monD0HNb5
 G2j5ZN7amnOfYjMJdO3eDwhSAhDuP1fGA8bloge5yrk+T1MIoeDjzjhilJgr9anDtT45
 sNOWzuezEW/jbNKP/DSkzmFYGFscDZhiS/BfJgBVfPTJ4eok7wwNJF3TvUm3CK7tCbXD
 NH4EigN85Mcu9SZp8tJYIiqdvDKdcDv1ny67odyBGnLEb6jMoc9z+SxsW0HsxAPv/+y9
 10rg==
X-Gm-Message-State: AOAM531NgGbIqMterTWhT6vN2VAsN6l5P4Jx60Jw8gVeOZjUG2ID4y/k
 pHU5HOBT5N8tNBLfJ31W9Nsd6pad12i+Ks1LudoTeg==
X-Google-Smtp-Source: ABdhPJzvUvlqNLSSWFHR1VOLU0xd2hgNWjjf5TY1pOrfxuPXl16DBLKRH8bOnbtdyu7oiCDTr/0gmfUg7LVZaOjTtN0=
X-Received: by 2002:a05:6402:2806:b0:42b:67fc:8565 with SMTP id
 h6-20020a056402280600b0042b67fc8565mr6689418ede.230.1654191934879; Thu, 02
 Jun 2022 10:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <20220530131158.kqq2mohxoh52xpeg@penduick>
 <20220530162903.GA6546@elementary>
 <CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com>
 <fea8f80a-939b-2c73-d94b-5179d1e65be9@redhat.com>
In-Reply-To: <fea8f80a-939b-2c73-d94b-5179d1e65be9@redhat.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 2 Jun 2022 10:45:23 -0700
Message-ID: <CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
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
Cc: David Gow <davidgow@google.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 tzimmermann@suse.de,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 10:29 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> > Or, without the .kunitconfig:
> > ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_DRM=y
> > --kconfig_add CONFIG_DRM_FORMAR_HELPER_TEST=y --kconfig_add
> > CONFIG_VIRTIO_UML=y  --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> > 'drm-*'
> >
>
> I wonder if would make sense to have for example an arch/um/.kunitconfig
> with those symbols and maybe others and then the tests could also be run
> with something like:
>
> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig \
> --kunitconfig=arch/um/.kunitconfig

Yeah, this came up before.
It'd be nice to have
* --kunitconfig be repeatable (it isn't right now)
* a "uml_pci.config" with the magic needed to set CONFIG_PCI=y on UML

Another example where this would be useful, coverage on UML
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
CONFIG_GCOV=y

I did prototype the changes to support this but never sent anything
out since I had some concerns, namely:
1. we'd be blindly appending them, but that won't always work. Would
users be ok with that?
2. people are already confused about .kunitconfig. It seems like the
most confusing part to new people, especially those new to kernel
development. Would adding this make them even more lost? Perhaps
making the docs clearer on this would a good pre-req.
3. What conventions should there be around these partial configs? I
think the idea should be more generic than just kunit.
4. --kconfig_add now makes this possible, even if in a noisier way
than another --kunitconfig
5. we didn't have a good way of reporting options set to different
values. https://lore.kernel.org/linux-kselftest/20220520224200.3764027-1-dlatypov@google.com/
would help by giving us an easier way to give clearer error messages.

That said, I'm willing to whip up another version based on the patch in #5.
I think we need a docs rewrite for #2, which I can take a stab at.
But I think we'll need some bikeshedding about naming (#3).

Daniel
