Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C60FB242FD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFC110E4C8;
	Wed, 13 Aug 2025 07:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1G9/2Oww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9282A10E4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:43:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso4291357a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755071028; x=1755675828;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0UJVq92P3ua8XtJx9QTbL1ot/TXYdNOLOGqwOrYBgLQ=;
 b=1G9/2OwwRgaMwrWzVA0PkeGevIrBSNqe+iW3s8DYr72apwr178MbhC42Th4H/T9kt2
 1jeGGZWiIaVUq3mZeNfIweB4shPcCx0a14LoN9JQf8H+PDsGz00wv2m6frwc8R1ExZy5
 tvIX2dT5D7jXXmf8j8xi/LKNse9HqKdNyQrDD8qEeOZca0/MjY8wE2sRVsJKAThGfc+0
 71ZpwiZi5+3pJWsyn8JtDcrl06xgALdioGmxP4hok2xBJiGl/EbQDzmsMBil3LpvwOZr
 bjFbTjKpsEnyM5PWgJz9A2KbvOQ/R54eXKh25n+hGlGIrklPYMb9PlJjlJGkLkYb2jyt
 CzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755071028; x=1755675828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UJVq92P3ua8XtJx9QTbL1ot/TXYdNOLOGqwOrYBgLQ=;
 b=huG2YG3LSHtcqG/0aahPBpQH5pEf/CkVW28xa887zW2Qu45DaPY84UQJ0HqRyMdzWG
 2/bAdWp/3jawcav21E1TT89PZ3RDFQaGCtUClaOFtpABq1hhRuKrlaqCZDAFJVibOCZ5
 stvP3UumvSsbwr7DpqIf6DgMMppJGP0HSdzMw/5EOYZjcMOzmghVvgyDxqQg2P3pv9bA
 ufNgvHQvL8uCfk4zZTIFHhhPJHg4Zzpitpvhyh2sYqiK8gF8FHPnm0/d4gDNmajkUbz0
 5TZDgCaMFYJC7AM/Vz/AdufBfMHVu9YMrMoW5IE2AABekVYNLt+Kx2/udUmvg4XUYFrp
 EgAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkdjD/3gjLYY1HxeJaoSVC1vFQw5YNQcOgNegn9n/4M5eTegYDtXQDrq1tKeVU3M+k8P3027etfrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjxQt6+bmENZ66yAAKdJ7mcePxPnav8muH+uvmG85eZzt3Jgo9
 2Rd0n9leDNiCRuV/pYLExXgRwjGJEnj7qSv3vRq8q6pBL+oc89Sm0Dpddo++bwyfBMvWVjYOhkl
 z6/n/DlGTVs887YTUm9dmGzYd8GRh0PIjGxbuFVuj
X-Gm-Gg: ASbGncuhVVJR7a+5WBsViS45UQ5W5ZmBcSQD8blt3rhe1MtijQI+/2HUtQLr7IdQ6uM
 yHGIgb58tETYv5xLOkfBZdl7SXRWEZM5WJh/pnoeXJoFsU7jWTpMqwc+6hvFIU9Tia8tqEjjoCn
 5oJd88nh6ogx5RUMgTWqbMNqFzq9M0EWQ638R+6jzMsTkxiFfNVEEpwJxyaFuu37+Es/UVCKKAC
 kiVT/mJMTZzNLlowgvZSx+neNzGsNtIjTU2gWdGa6rE6dU=
X-Google-Smtp-Source: AGHT+IFBKsPepKKfAaFpZUzYXXEqL+dc/huf3CQooHPkoZL7D7ZLpBzLaNmms9yheE1Vr7uCFzHKue6E5dVtR5dKIRY=
X-Received: by 2002:a17:902:fe97:b0:242:e0f1:f4b9 with SMTP id
 d9443c01a7336-2430d0e6bdcmr25815355ad.20.1755071027377; Wed, 13 Aug 2025
 00:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-4-marievic@google.com>
In-Reply-To: <20250811221739.2694336-4-marievic@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 13 Aug 2025 09:43:10 +0200
X-Gm-Features: Ac12FXxjpczGPECwg-9WltDjK8Gi36eYjjkxdZ5ApzKUTkuNT451Pn6siym2g_E
Message-ID: <CANpmjNOjStrdwpjbyZwk20DNux4nLt2e4T3=yRgAeyxtd7pJQQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] kunit: Pass parameterized test context to
 generate_params()
To: Marie Zhussupova <marievic@google.com>
Cc: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev, mark.rutland@arm.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, 12 Aug 2025 at 00:17, Marie Zhussupova <marievic@google.com> wrote:
>
> To enable more complex parameterized testing scenarios,
> the generate_params() function needs additional context
> beyond just the previously generated parameter. This patch
> modifies the generate_params() function signature to
> include an extra `struct kunit *test` argument, giving
> test users access to the parameterized test context when
> generating parameters.
>
> The `struct kunit *test` argument was added as the first parameter
> to the function signature as it aligns with the convention
> of other KUnit functions that accept `struct kunit *test` first.
> This also mirrors the "this" or "self" reference found
> in object-oriented programming languages.
>
> This patch also modifies xe_pci_live_device_gen_param()
> in xe_pci.c and nthreads_gen_params() in kcsan_test.c
> to reflect this signature change.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>
> Changes in v2:
>
> - generate_params signature changes in
>   xe_pci.c and kcsan_test.c were squashed
>   into a single patch to avoid in-between
>   breakages in the series.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.
>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>  include/kunit/test.h              | 9 ++++++---
>  kernel/kcsan/kcsan_test.c         | 2 +-

Acked-by: Marco Elver <elver@google.com>

>  lib/kunit/test.c                  | 5 +++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 1d3e2e50c355..62c016e84227 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -129,7 +129,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
>   * Return: pointer to the next &struct xe_device ready to be used as a parameter
>   *         or NULL if there are no more Xe devices on the system.
>   */
> -const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
> +const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc)
>  {
>         const struct xe_device *xe = prev;
>         struct device *dev = xe ? xe->drm.dev : NULL;
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index d2e1b986b161..b527189d2d1c 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -128,7 +128,8 @@ struct kunit_attributes {
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> -       const void* (*generate_params)(const void *prev, char *desc);
> +       const void* (*generate_params)(struct kunit *test,
> +                                      const void *prev, char *desc);
>         struct kunit_attributes attr;
>         int (*param_init)(struct kunit *test);
>         void (*param_exit)(struct kunit *test);
> @@ -1691,7 +1692,8 @@ do {                                                                             \
>   * Define function @name_gen_params which uses @array to generate parameters.
>   */
>  #define KUNIT_ARRAY_PARAM(name, array, get_desc)                                               \
> -       static const void *name##_gen_params(const void *prev, char *desc)                      \
> +       static const void *name##_gen_params(struct kunit *test,                                \
> +                                            const void *prev, char *desc)                      \
>         {                                                                                       \
>                 typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {                                   \
> @@ -1712,7 +1714,8 @@ do {                                                                             \
>   * Define function @name_gen_params which uses @array to generate parameters.
>   */
>  #define KUNIT_ARRAY_PARAM_DESC(name, array, desc_member)                                       \
> -       static const void *name##_gen_params(const void *prev, char *desc)                      \
> +       static const void *name##_gen_params(struct kunit *test,                                \
> +                                            const void *prev, char *desc)                      \
>         {                                                                                       \
>                 typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {                                   \
> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> index c2871180edcc..fc76648525ac 100644
> --- a/kernel/kcsan/kcsan_test.c
> +++ b/kernel/kcsan/kcsan_test.c
> @@ -1383,7 +1383,7 @@ static void test_atomic_builtins_missing_barrier(struct kunit *test)
>   * The thread counts are chosen to cover potentially interesting boundaries and
>   * corner cases (2 to 5), and then stress the system with larger counts.
>   */
> -static const void *nthreads_gen_params(const void *prev, char *desc)
> +static const void *nthreads_gen_params(struct kunit *test, const void *prev, char *desc)
>  {
>         long nthreads = (long)prev;
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 49a5e6c30c86..01b20702a5a2 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -695,7 +695,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         /* Get initial param. */
>                         param_desc[0] = '\0';
>                         /* TODO: Make generate_params try-catch */
> -                       curr_param = test_case->generate_params(NULL, param_desc);
> +                       curr_param = test_case->generate_params(&test, NULL, param_desc);
>                         test_case->status = KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
> @@ -726,7 +726,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                                 /* Get next param. */
>                                 param_desc[0] = '\0';
> -                               curr_param = test_case->generate_params(curr_param, param_desc);
> +                               curr_param = test_case->generate_params(&test, curr_param,
> +                                                                       param_desc);
>                         }
>                         /*
>                          * TODO: Put into a try catch. Since we don't need suite->exit
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>
