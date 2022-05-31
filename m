Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F589539675
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 20:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C910E21A;
	Tue, 31 May 2022 18:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A84A10E00E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 18:45:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u3so19847211wrg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ufq4juBqH6XITsb+q5X7DDcR92uEar1MrrL/a6XKOUk=;
 b=pcuXu6/u1DzbPyJqNaFZ/OQ0MblqkROjkYnB6xMQDrwHbAKj1+noWWb5/5mqG5zpwT
 uYDHOpPbKIfZh53Q+UQZwxNpnjfiO3nkixi/TLmJuqFz/A8Jv1qQkBZXgQ8R1y9s+t7J
 ZhAFCHFQ2Urr2b/iZNd6z3GTnf0iDVzgbosZ3U3LEs7C6RynAbep8I5UXeFI8P0zFicS
 IFJVSnBa61TbBUiUMObA+UdfSCz7FVmCMfWLdO+0tazuoiCeFzwUSEtN+Ndl1cONWLsi
 iNAPXBSJ5chrs6/FaQ/b+LJkKATnJvNT/WYq/XcK74mNxdVi8kl4RfNL7eWj/P8Q5y2q
 22vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ufq4juBqH6XITsb+q5X7DDcR92uEar1MrrL/a6XKOUk=;
 b=Vmfn/Wt/OtXEuyAW7U7aFFEu5NIr1NY0Lm1N57U+GLIJCWoyZGwfSu4YpP9qgFK02C
 LN5c55ic88BGj2uDnXUrhy7PDRA4lsoDuzNbunZLo/0vjzaRuo0NCA9AKoGq+OXkqnhK
 oKA6fgfovM5tjE/LCFGvPah+daRpo6cCB4/4xopopuMmAbnrQ6pFDfTmXH3ycapP3t6y
 00NAFluR0ZgMH4BN+djYV1XWhTJrvm+f+IDa5bNqCnC7G/8VT5+KZM79iPs01N12u97e
 zeDiB4PVui57dyHHfmc/wLwx1nav3YsFe5Y80vdjTKtboUu9VyUGp3g8W4WHmn064/7B
 X6Pg==
X-Gm-Message-State: AOAM532YK4Bb6cT1Gvdrwl3yZ03FesYrCIBcVi1SrJN2wGOVD4bvMH5X
 OKe+Scc99ySp1MOBCkFiZ7U=
X-Google-Smtp-Source: ABdhPJzK59uQPpVU7uX5l5VrkSg9oqIF78rhBv5/YuQvWGjVXXtUKr8zDYdIXYDKlXWH9Mk2Kc/tzA==
X-Received: by 2002:adf:f0cc:0:b0:20f:fa73:b668 with SMTP id
 x12-20020adff0cc000000b0020ffa73b668mr29414960wro.539.1654022700538; 
 Tue, 31 May 2022 11:45:00 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1ca404000000b003973b9d0447sm3486816wme.36.2022.05.31.11.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 11:44:59 -0700 (PDT)
Date: Tue, 31 May 2022 20:44:54 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220531184454.GA237621@elementary>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <20220530131158.kqq2mohxoh52xpeg@penduick>
 <20220530162903.GA6546@elementary>
 <CAGS_qxpV2SsihEdgXZ6+7N0dxLmdRANq+qE4iUZ2aNrf6vuLYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGS_qxpV2SsihEdgXZ6+7N0dxLmdRANq+qE4iUZ2aNrf6vuLYg@mail.gmail.com>
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
Cc: airlied@linux.ie, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for looking into the patch and for your comments.

On Mon, May 30, 2022 at 03:57:56PM -0700, Daniel Latypov wrote:
> A few initial notes:
> a) normally, `select`ing other kconfigs is discouraged. It's not
> explicitly called out in
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html#test-kconfig-entries
> but this was the conclusion after  some debate on the mailing lists
> earlier.
>
> b) I see `dst` is allocated with kzalloc but not freed. Should we use
> `kunit_kzalloc()` instead so it does get automatically freed?

Ooops yes, it was in my "I'll handle that once it works" list, but I
forgot to fix it, thanks for pointing it out
 
> > > > ---
> > > >  drivers/gpu/drm/Kconfig                  |  12 ++
> > > >  drivers/gpu/drm/Makefile                 |   3 +
> > > >  drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
> > > >  3 files changed, 181 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/drm_format_helper_test.c
> > > >
> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index e88c497fa010..d92be6faef15 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -76,6 +76,18 @@ config DRM_KMS_HELPER
> > > >     help
> > > >       CRTC helpers for KMS drivers.
> > > >
> > > > +config DRM_FORMAR_HELPER_TEST
> > > > +   bool "drm_format_helper tests" if !KUNIT_ALL_TESTS
> > > > +   depends on DRM && KUNIT=y
> > > > +   select DRM_KMS_HELPER
> 
> From above, a)
> Specifically here, it'd be encouraged to instead do
>   depends on DRM && KUNIT=y && DRM_KMS_HELPER

My first attempt was to go with:

	depends on KUNIT=y && DRM && DRM_KMS_HELPER

However, when I try to run the tests I get this error:

	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm --arch=x86_64
	Regenerating .config ...
	Populating config with:
	$ make ARCH=x86_64 olddefconfig O=.kunit
	ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
	This is probably due to unsatisfied dependencies.
	Missing: CONFIG_DRM_KMS_HELPER=y, CONFIG_DRM_FORMAR_HELPER_TEST=y

I wasn't able to figure out why that was happening, so I decided to use
"select", which seems to solve the problem.

Do you know why this could be happening?

> Ideally, using a .kunitconfig file would make it so having to select
> DRM_KMS_HELPER manually isn't that annoying.
> 
> > > AFAIK, kunit test cases are supposed to have a .kunitconfig too to
> > > enable the kunit tests easily.
> > >
> > > Maxime
> >
> > A .kuniconfig example is present in the cover letter. My understanding
> > from the docs:
> >
> > https://docs.kernel.org/dev-tools/kunit/run_wrapper.html#create-a-kunitconfig-file
> 
> The bit of the documentation you're looking for is
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.html#defining-a-set-of-tests
> You can create a drivers/gpu/drm/.kunitconfig file and run with
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm --arch=x86_86
> 
> The contents of that file would be just like
>   CONFIG_KUNIT=y
>   CONFIG_DRM=y
>   CONFIG_DRM_KMS_HELPER=y  # if no `select`
>   CONFIG_DRM_FORMAR_HELPER_TEST=y

Noted, thanks a lot, I'll include it in the final version of the patch.

By the way, I also included it in an unrelated patch, just in case you
are wondering why I emailed you a random patch:
https://lore.kernel.org/linux-input/20220531181246.190729-1-jose.exposito89@gmail.com/T/

Thanks a lot for your help,
José Expósito

> Re "kunit test cases are supposed to have a .kunitconfig too"
> As I noted in the docs:
>   This is a relatively new feature (5.12+) so we don’t have any
> conventions yet about on what files should be checked in versus just
> kept around locally. It’s up to you and your maintainer to decide if a
> config is useful enough to submit (and therefore have to maintain).
> 
> So it's up to whatever people think works best/is worth it.
> I think in this case, it makes sense to add the file.
> 
> > Is that, like the .config file, the .kunitconfig file is not meant to
> > be included in git, but I'm sure someone else will clarify this point.
> 
> That bit of the docs needs to be rewritten.
> You're recommended to check in a drivers/gpu/drm/.kunitconfig file into git.
> 
> Context: `kunit.py` used to use the "<root>/.kunitconfig" file.
> Anytime you wanted to run more tests, you'd append to that file.
> So we agreed that no one should check in that file specifically.
> 
> Now kunit.py
> * uses "<build-dir>/.kunitconfig", by default: ".kunit/.kunitconfig"
> * has the --kunitconfig flag so you can use different files
> so it's no longer as relevant.
> 
> Hope that helps,
> Daniel
