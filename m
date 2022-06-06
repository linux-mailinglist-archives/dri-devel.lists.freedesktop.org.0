Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A6153E5BC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 18:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347410F852;
	Mon,  6 Jun 2022 16:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA39D10F852
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 16:30:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d14so11570872wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xJwQl/PiEUwiwk52JeaaRavLlxhGbowpTp1ZVoSGKqg=;
 b=XAmkm6HeHfdJZ2x9c75GpfnvFb80dmOF3hQbzJZ3pnpuH2s+eKJ4MTulLbTixbbrzP
 hX2iLDaET9JJC2ywRNuep0vyoObiTJaQs7e+HJ6ziWBvK7JVOeRqqm5d0vyqLc52lXkK
 nI7+hM0umb7pILpvQMJfFEEkHGCQUnUoXFlq1GLd+Uxblg/aOOI1zhLlXS/woiwYyIMS
 yaqJU86mR5V0RVnYUGCBxJgpC9ctLyl2NrokbvLVdQbzS7RfIytd6/O+NMJcggDoF5NZ
 2mZ8CV9V5abU1aAX7nuF0Fox0C+tozWfeL4ya7kE+8W6fRmm3mT1YSEmZEPq76hB6wzW
 rOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xJwQl/PiEUwiwk52JeaaRavLlxhGbowpTp1ZVoSGKqg=;
 b=ca+juF68ZR9U6etW/v1KN0UsZEJCSMruFUeSfDLQ1ZwbhOgvsPuSSyktwVNHH5/52O
 SmlxnLVB2z/yWKM8Yj+YeDRgJaqUFimURLEPC9SDiObfuhsGLd+qbdV5c5UG2l5eV9TA
 uQhD5A99pBC5lseG2DsEQb4LLQ/JR5ZhY7ySp2kO/vmlW4xiDvAZFPf9bry6iyWiJ1I2
 NX2ruliikhL+GsQPkKIKRpskmvsZlvWKX5SMbSlMY0TRn9hBTtFUc4SCqBLrFPDRls5X
 FD65y3KMhnO7mhgMTAoBHIsnm9wt8CI0xQ8sUPCp9r3pqJ5B5ydWB4/f2DwOCppLYGkg
 sRAA==
X-Gm-Message-State: AOAM532zGepyD2lQ7hELT+XJSQEJhq6inABq8pavZwxQU04CGj62PHL2
 9P59DcyA0xatCDMQV0WrLc8=
X-Google-Smtp-Source: ABdhPJxQ3J9vZ+ZM5ZF6/sQz314KJ/6atguYE7HzUvHP+PXE9tWeHbp0/vF63dUCKiZApdTziRo6tw==
X-Received: by 2002:a05:6000:716:b0:213:b7d1:adeb with SMTP id
 bs22-20020a056000071600b00213b7d1adebmr18475559wrb.337.1654533009215; 
 Mon, 06 Jun 2022 09:30:09 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b002183ee5c0c5sm3143096wrs.50.2022.06.06.09.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 09:30:08 -0700 (PDT)
Date: Mon, 6 Jun 2022 18:30:05 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220606163005.GA5274@elementary>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <cbef78d3-c392-37e6-afdd-177806dfb033@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbef78d3-c392-37e6-afdd-177806dfb033@redhat.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Javier Martinez Canillas wrote:
> Hello José,
> 
> On 6/6/22 11:55, José Expósito wrote:
> > Test the conversion from XRGB8888 to RGB332.
> > 
> > What is tested?
> > 
> >  - Different values for the X in XRGB8888 to make sure it is ignored
> >  - Different clip values: Single pixel and full and partial buffer
> >  - Well known colors: White, black, red, green, blue, magenta, yellow
> >    and cyan
> >  - Other colors: Randomly picked
> >  - Destination pitch
> > 
> > How to run the tests?
> > 
> >  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
> >          --kconfig_add CONFIG_VIRTIO_UML=y \
> >          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> > 
> > Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > 
> > ---
> 
> Thanks for addressing the issues pointed out. Patch looks good to me now.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for the quick review Javier :)

Javier Martinez Canillas wrote:
> By the way, I think you should request an account [0], so that you can push
> patches to drm-misc directly. Specially since AFAIU the plan is to add more
> KUnit tests in future patch series.
> 
> [0]: https://www.freedesktop.org/wiki/AccountRequests/

I'll request one, thanks for the tip.

-------

Maxime Ripard wrote:
> > > The following works correctly but it won't use User Mode Linux:
> > >
> > > ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/.kunitconfig --arch=x86_64
> > >
> > > But then, can't we add them to .kunitconfig?
> > >
> >
> > That's what I asked in the previous RFC too. Daniel mentioned that it shouldn't
> > go there because is platform specific (AFAIU, one might want to test it on x86,
> > aarch64, etc) but then I asked why we couldn't have a arch/um/.kunitconfig.
> >
> > The answer was that's not that simple and some agreement on how to do it is needed:
> >
> > https://lists.freedesktop.org/archives/dri-devel/2022-June/357617.html
>
> We should probably just document it somewhere in KMS then? It doesn't
> have to be in this patch series, but I have the feeling that we will end
> up with that discussion a lot from people frustrated to have spent too
> much time figuring it out :)

My understanding from Daniel's comment [1] is also that at the moment
it is not easy to support this use case, so yes, at least copy and
pasting the command in the docs should help everyone figure out how to
run the tests.

Documentation/gpu/drm-internals.rst seems like a good place to add some
information about how to run and add tests.
I'll send a patch with the docs ASAP.

Jose

[1] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com/
