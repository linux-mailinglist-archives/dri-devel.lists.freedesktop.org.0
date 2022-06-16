Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A554E98C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 20:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42D10E4A7;
	Thu, 16 Jun 2022 18:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F364610E413
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 18:39:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hj18so3755820ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 11:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Vvtlw+iEsaS/na3D2WFoyiU6cxwYhF3nUwVfDlaBBY4=;
 b=KWqtjeF0lt8BmXzIhDVi8wNK0hTc2uUic8LB1N7qa04xJfx0dow3FO5m1NutF5917G
 fb4s84h1Sgt4mKBPJwcmbYbwdTmfQOqmQuFg5KGbRet4iuZmRvCFWDAflpEjyiWB4599
 2Ayn0RycL/0iqsGAG2zWrnt7u684fSfWFpEYyMjS5CnsFd60o1zZrrYvJfajWMeLxIev
 CMuQr3ggcIHxRjyKu/NwsgpY2yPxpZrxXMiRFQL65EGa2GdrAxuyeGHJtu2Fp2s3tAEm
 O1M9qsb8eY0w1eTcO0OHirT4hMPunuAPVjEktbKyf6wd2oOnunAOOVWb0TymeyhLxAjQ
 C20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Vvtlw+iEsaS/na3D2WFoyiU6cxwYhF3nUwVfDlaBBY4=;
 b=gepWhxuD3AlzmrnJzVcQmdpXOBheRG62/K2pmzM7wdOy5y8zV6iQHoOpFEtcvhGt0M
 aj3J1xWO5L/YlU2/jdQohCsrsZAFHvFGI2SGBNGQWiXvAnjdtMxHZ6i08YW3XictAS/P
 nsLq1SULAkc+XkUSS3s+uPw+r0rWGVzf2UueBRWAY8F33bfOjxtScF/xiQ85uXLnQC49
 kUogER7L9H/3LFCHnQpHgLNUsic+UTp/UUncpM/dwyhUqhJlW1Adio3GbC1hC/Lw67Vi
 Eo801k4u2cQbNDdprL3DuFt5KQa8U3YWFR1EsHT9uXb/yk3hYpNv35hT1cJvB81lsFSm
 4lJQ==
X-Gm-Message-State: AJIora+JiJO5qMu2DyW0nRef1YWf3IdunchyMG/KhqWD5fsx+6xCDtuE
 f6+A6oe2f/x++0oW7nwcFR4FXSLd0isqsA==
X-Google-Smtp-Source: AGRyM1uTNc2ADuMhHieithn5hIvSIQUyuc8ucmAt29mfzYWtFQB6+pLmyfSp4MexbMuo0vMAa6k/0g==
X-Received: by 2002:a05:6000:1c09:b0:20f:cd6f:f88b with SMTP id
 ba9-20020a0560001c0900b0020fcd6ff88bmr5877180wrb.571.1655404735346; 
 Thu, 16 Jun 2022 11:38:55 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b0039db7f1a3f5sm2976079wmh.45.2022.06.16.11.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 11:38:54 -0700 (PDT)
Date: Thu, 16 Jun 2022 20:38:52 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v3 0/3] KUnit tests for drm_format_helper
Message-ID: <20220616183852.GA12343@elementary>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <CABVgOSn3zAGsphdEpuevhTo1xoYqHWNF4qty=gR22LcRiUkz0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOSn3zAGsphdEpuevhTo1xoYqHWNF4qty=gR22LcRiUkz0A@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tzimmermann@suse.de,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Javier Martinez Canillas wrote:
> Before merging this, could you please reach the folks working on [0] ?
> I think that would be good to have some consistency with regard to KUnit
> tests from the start to avoid future refactorings. For instance, you are
> adding the tests under a `kunit` sub-directory while they are doing it
> in a `tests` sub-dir.
>
> Also there may be other things that could be made more consistent, like
> the naming conventions for the tests, suites, etc.
>
> [0]: https://lore.kernel.org/all/20220608010709.272962-4-maira.canal@usp.br/T/

David Gow wrote:
> [+Maíra, Isabella, Tales, Magali for other drm,amdgpu,KUnit work.]
> 
> These seem pretty good to me, but I'd echo Javier's comments about
> consistency with other DRM tests.

I agree, I'd need to look with more detail into the selftest conversion
and the AMD series, but it'd be nice to avoid unnecessary refactors.
 
> In particular, we now have three concurrently developed DRM-related
> test suites, each doing things slightly differently:
> - This series is putting tests in drm/kunit, and providing a
> .kunitconfig in that directory,
>
> - The selftest ports here[1] are putting tests in drm/tests, and
> provide a separate Kconfig file, as well as a .kunitconfig

Now that "selftests/" is going to be removed, "tests/" is a good name
for the folder, I'll rename it in v4.

> - And the AMDGPU tests[2] are doing something totally different, with
> their own tests in drm/amd/display/amdgpu_dm/tests, which get compiled
> directly into the amdgpu module (and, at present, can't be run at all
> via kunit_tool)
> 
> Certainly the general DRM tests should be in the same place, and use
> the same Kconfig entries, etc. A mix of the separate Kconfig file from
> [1] (if there's enough benefit to having the ability to turn on and
> off suites individually, which seems plausible) and the documentation
> from this series seems good to me.

I agree about having the DRM-core tests in drm/tests/ and driver tests
in drm/driver/tests/.

About allowing turning on or off test suites, it was agreed to use a
generic symbol to group them (DRM_KUNIT_TEST) [1].
I won't have time merge all patches toghether and run them until next
week, but if it takes too long to run them or you find it beneficial to
split the symbols, I'll change my patch.

[1] https://lore.kernel.org/dri-devel/e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com/
 
> There's some basic guidelines around test nomenclature in
> Documentation/dev-tools/kunit/style.rst[3], though all of these
> patches seem pretty consistent with that. Either 'kunit' or 'tests'
> would work as a directory name: given the AMDGPU patches are using
> 'tests', maybe that's easier to stick with.

I'll have to rename my kunit_suite to use underscores, as well as the
test cases, that at the moment are using English sentences.

Maíra: We'd also need to agree on the file names used, the
documentation [2] suggest to use *_test.c, it'd need to be changed in
the selftest to KUnit series.

Best wishes,
Jose

[2] https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html#test-file-and-module-names 
> Cheers,
> -- David
> 
> [1]: https://lore.kernel.org/linux-kselftest/20220615135824.15522-1-maira.canal@usp.br/
> [2]: https://lore.kernel.org/dri-devel/20220608010709.272962-1-maira.canal@usp.br/
> [3]: https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html
