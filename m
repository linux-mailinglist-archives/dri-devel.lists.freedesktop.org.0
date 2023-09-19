Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D17A6BC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 21:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91AA10E2AC;
	Tue, 19 Sep 2023 19:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82DB10E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 19:49:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4051039701eso1175e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695152947; x=1695757747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YB5lVTEo2oIGM22JEX9SYzDoyZreOUPzeoeG//8zcw=;
 b=kxzD+OjZZT8ygFUCyOfA3Ak0uU4T3Itu7oSwDwdn0P92ZzC2e/HnL/iTLpG7bE/U2+
 3UICYJwTcjU0hehOQkhwTd0mp29Iif0juDNbXHQfbrfxZfPSe2Jn/jE0AyeGsthG8Nc8
 Yvb+CkNdeprQ5B8R0OnGFwngNjLW3jNjbc6JSpI4084DHNT2uyZ1l1dxwdzVTfz5x0DH
 Thfn4kqYaQDJdo5O6nX7qW4G5DI8SXlAKAJTMfnzRDgJFtoI4dojND/IdcRW5LetBLWa
 ziNa1yuExABnBgp6jYjs7OKMhWqSsByabh05lKqV23QQXj5sBEGcal92L8tcjsIx1xJR
 4DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695152947; x=1695757747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YB5lVTEo2oIGM22JEX9SYzDoyZreOUPzeoeG//8zcw=;
 b=Wp+NoNFnog6sCAvJCcF7sOEjtsG9lVny+X1TZrzhIm091QbKa7P6IPyDW3H6pTZs1d
 7ga14y6goxcKo3fXfvGxcYGgvNMydGpeFf/9AlN6cfIcPdPp3Iyjmz3jBpOEyveYsvUn
 UQWgFyFRr2MYxSiDOnV4o36tiXSCAsAMhW8UunJwHj8RAHme/pwQYEA2y1al/QFw9vjW
 Ig77FvsLoYhohiOkAukAx+QblAW+LRk2U0H5X6Wz7glo6rOeYF5Lq4rN7VizEeNC1sn8
 zfidW+qswvUbTAR47RaWrfh0rDIiPiscKVx2lvN3SxDCwsXZ2eoKQE+CuwmbZqljLDIj
 lurA==
X-Gm-Message-State: AOJu0YwifAPyI7Gfkcovq4So5iXlQYalwU+BaaQGs+E5q70LQcNlhiUl
 9nnBkTzMkNBgYi9okaUnndpDCLmZFP+WwfDfOPP6yg==
X-Google-Smtp-Source: AGHT+IEeHVmf20rC/G4IyqVK9B1XveSpZx9ksqGyeNUYQvj6A7jFxrBpFhywFsvx1XPrY0bCbW2fPEHPrYz5CNEv4jo=
X-Received: by 2002:a05:600c:1d06:b0:3fe:d691:7d63 with SMTP id
 l6-20020a05600c1d0600b003fed6917d63mr16494wms.6.1695152947216; Tue, 19 Sep
 2023 12:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
 <20230911-kms-slow-tests-v1-1-d3800a69a1a1@kernel.org>
In-Reply-To: <20230911-kms-slow-tests-v1-1-d3800a69a1a1@kernel.org>
From: Rae Moar <rmoar@google.com>
Date: Tue, 19 Sep 2023 15:48:55 -0400
Message-ID: <CA+GJov6sQMmEiTQ7cupyC2cx-aWvV7M6ki4W8naEHyA8tbSbdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kunit: Warn if tests are slow
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 5:51=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Kunit recently gained support to setup attributes, the first one being
> the speed of a given test, then allowing to filter out slow tests.
>
> A slow test is defined in the documentation as taking more than one
> second. There's an another speed attribute called "super slow" but whose
> definition is less clear.
>
> Add support to the test runner to check the test execution time, and
> report tests that should be marked as slow but aren't.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Hi!

I like this idea especially if it was helpful in identifying slow
tests already! I have a few thoughts on this. I share Jani's concern
for warning all tests on slow machines. I can think of a few options.

First, we could increase the threshold to about 2s even though that
would eliminate warnings on potentially slow tests. However, this
would point out the slowest tests.

Second, we could change this to warn users only when they choose by
making this a configurable option or making this a script to output a
list of all unmarked slow tests.

Third, we could leave this as is. As the KUnit warnings do not show up
in the kunit.py output and do not cause the test to fail in any way
they are relatively harmless if they are unwanted by the user.

Not quite sure which I prefer? The second option might be the cleanest
for the user and the time threshold could even be customizable. Let me
know what you think.

> ---
>  lib/kunit/test.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 49698a168437..a3b924501f3d 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -379,6 +379,9 @@ static void kunit_run_case_internal(struct kunit *tes=
t,
>                                     struct kunit_suite *suite,
>                                     struct kunit_case *test_case)
>  {
> +       struct timespec64 start, end;
> +       struct timespec64 duration;
> +
>         if (suite->init) {
>                 int ret;
>
> @@ -390,7 +393,20 @@ static void kunit_run_case_internal(struct kunit *te=
st,
>                 }
>         }
>
> +       ktime_get_ts64(&start);
> +
>         test_case->run_case(test);
> +
> +       ktime_get_ts64(&end);
> +
> +       duration =3D timespec64_sub(end, start);
> +
> +       if (duration.tv_sec >=3D 1 &&
> +           (test_case->attr.speed =3D=3D KUNIT_SPEED_UNSET ||
> +            test_case->attr.speed >=3D KUNIT_SPEED_NORMAL))
> +               kunit_warn(test,
> +                          "Test should be marked slow (runtime: %lld.%09=
lds)",
> +                          duration.tv_sec, duration.tv_nsec);

I would consider moving this if statement into a separate function.

>  }
>
>  static void kunit_case_internal_cleanup(struct kunit *test)
>
> --
> 2.41.0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20230911-kms-slow-tests-v1-1-d3800a69a1a1%40kernel.org.
