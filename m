Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5528B23BBB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 00:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C7E10E185;
	Tue, 12 Aug 2025 22:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JvsxTsGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329A10E027
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 22:22:17 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-7074a74248dso53826286d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755037337; x=1755642137;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWuryeMFKkS3RAr2vCbtx7LOWzlUOf1ahWxEl9iGYmQ=;
 b=JvsxTsGWKyhdoYLpZUKHVaLiAonprfHC6+dSNx/02r8pXGFTwksT3OEBJ7jV0RODhU
 PjdIn0uBjJ/dm3KaqYIiyfTSexbrDmKkszi7JKHW7kMM2rPclAczvFjdfLoPiAHv+djg
 Rud6VPvmDC8UB0pZ5ECpTHDBmTnA3D+cxrgEdWsfrxwsmJROsCKu/qsSlv/Q2UrjlUUk
 WD6B9tRpu9b8omrR0ehwr+PHbUQXwoKk0Ln5M+Ey7ICUbzmp/1uJknjtndiEEJi1hG3x
 NbS/76rfjOuTUz+BOw/eP14XBlSdcE85CH1IfBXPGB+ogWyLMKE+i52Rovx2JE7rF5Q0
 Yqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755037337; x=1755642137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWuryeMFKkS3RAr2vCbtx7LOWzlUOf1ahWxEl9iGYmQ=;
 b=H4iw7BboTgC0hXb9xGjSFmlcLX5sH95/GrNcGCJwBRAqv0BvOZ7LFjqCtDFa6wieSL
 ZftNqXF5jQOBaV+1pp++r4mgEk5gb1G52sBZN6nY5JMmtMxtBoDsBD8U2iNqlS3ZtsdV
 OicPSiuNaBW9OrNvVH19iI1fqwO7rzGCsRKXfagKudMqeYvC3hju5mAWaQ/P2dnyRje/
 teNATbxSdmVTNYBfH9Qoa8iFhCXKIK3ud1o4mmqg1znYmw1dra4h1+5eli7301v6fP86
 zhGPHYAN/YHv2CaHQerh1egWQSfELUs9A8+OUgcypv7/RT5/alTJbzA+9gNJMuUpioMQ
 HNtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+wKYEkQcC8Mc+n8CRYXjl7WeDcNT3NedEh5ao6MTkXebsZSi+nGUSpCH82ZEWe9jWN+7SQUrepTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxml4CLleBGQyXigmXs9hd/lK/hJY6bshmSV/lS6AE0i5Ns/Czm
 BOPhDzurBVqYsDcIrkuEc6ax3t7XTUAI4Fqfk7oQDh1Mwyi80sd0oMJjo33z71BP4FQc71/uEOH
 rupgQOVdVmrAGgjDL00flxSUdXNQyJ91s/Xy+F4DY
X-Gm-Gg: ASbGncv1uJMlZrQpLYTE1EjGJwr94FqEprrNpT88rXLmwpSMJlDC88EWbu4PMQoJZeS
 IWPH+R/1scYyP52RqSdEWZf2KX7eLypV521eiI03wI/sXvnm70C94nAB+SdF+URXVPl7UQH2tAt
 IohAjLwJp5Fr4OigEanzlzx9kZijwogZIrnV9Qpq58ajKFpQ4gbIzm+sNEaSDFnPP/2vkOEy3Aj
 jqLhMD9nJHgMK8rqq+H52hpiEQ=
X-Google-Smtp-Source: AGHT+IEadRB7taAvJL3meXl06djQ3Xt2tF79cuy40DLQCj2PV7nyTVommhLIfxsMSiSB57BjHwmxI3MbCeBYuqIhz/o=
X-Received: by 2002:a05:6214:dc6:b0:704:7df6:44b4 with SMTP id
 6a1803df08f44-709e893bab1mr14144146d6.23.1755037336426; Tue, 12 Aug 2025
 15:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-2-marievic@google.com>
In-Reply-To: <20250811221739.2694336-2-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 12 Aug 2025 18:22:05 -0400
X-Gm-Features: Ac12FXy4odiVUbmTVSv_FQj3XmTzKCP2JeRGz1wZpwmC4BzXnA3qMhak1o8tSGs
Message-ID: <CA+GJov6aVg70yjXF3=3teg26AKhcOwLEOgGT8by61nMJvB15jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] kunit: Add parent kunit for parameterized test
 context
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 11, 2025 at 6:17=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> Currently, KUnit parameterized tests lack a mechanism
> to share resources across parameter runs because the
> same `struct kunit` instance is cleaned up and
> reused for each run.
>
> This patch introduces parameterized test context,
> enabling test users to share resources between
> parameter runs. It also allows setting up resources
> that need to be available for all parameter runs only once,
> which is helpful in cases where setup is expensive.
>
> To establish a parameterized test context, this
> patch adds a parent pointer field to `struct kunit`.
> This allows resources added to the parent `struct kunit`
> to be shared and accessible across all parameter runs.
>
> In kunit_run_tests(), the default `struct kunit`
> created is now designated to act as the parameterized
> test context whenever a test is parameterized.
>
> Subsequently, a new `struct kunit` is made
> for each parameter run, and its parent pointer is
> set to the `struct kunit` that holds the
> parameterized test context.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>
> Changes in v2:
>
> - Descriptions of the parent pointer in `struct kunit`
>   were changed to be more general, as it could be
>   used to share resources not only between parameter
>   runs but also between test cases in the future.
> - When printing parameter descriptions using
>   test.param_index was changed to param_test.param_index.
> - kunit_cleanup(&test) in kunit_run_tests() was moved
>   inside the parameterized test check.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.

Hello!

Thanks for making these changes! I really like the change to the new
terminology for parameterized tests, as well as the description change
for "parent".

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae


>
> ---
>  include/kunit/test.h |  8 ++++++--
>  lib/kunit/test.c     | 34 ++++++++++++++++++++--------------
>  2 files changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 39c768f87dc9..b47b9a3102f3 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -268,14 +268,18 @@ struct kunit_suite_set {
>   *
>   * @priv: for user to store arbitrary data. Commonly used to pass data
>   *       created in the init function (see &struct kunit_suite).
> + * @parent: reference to the parent context of type struct kunit that ca=
n
> + *         be used for storing shared resources.
>   *
>   * Used to store information about the current context under which the t=
est
>   * is running. Most of this data is private and should only be accessed
> - * indirectly via public functions; the one exception is @priv which can=
 be
> - * used by the test writer to store arbitrary data.
> + * indirectly via public functions; the two exceptions are @priv and @pa=
rent
> + * which can be used by the test writer to store arbitrary data and acce=
ss the
> + * parent context, respectively.
>   */
>  struct kunit {
>         void *priv;
> +       struct kunit *parent;
>
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index f3c6b11f12b8..14a8bd846939 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>         struct kunit_case *test_case;
>         struct kunit_result_stats suite_stats =3D { 0 };
>         struct kunit_result_stats total_stats =3D { 0 };
> +       const void *curr_param;
>
>         /* Taint the kernel so we know we've run tests. */
>         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -679,37 +680,42 @@ int kunit_run_tests(struct kunit_suite *suite)
>                 } else {
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
> -                       test.param_value =3D test_case->generate_params(N=
ULL, param_desc);
> +                       /* TODO: Make generate_params try-catch */
> +                       curr_param =3D test_case->generate_params(NULL, p=
aram_desc);
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "# Subtest: %s", test_case->name);
>
> -                       while (test.param_value) {
> -                               kunit_run_case_catch_errors(suite, test_c=
ase, &test);
> +                       while (curr_param) {
> +                               struct kunit param_test =3D {
> +                                       .param_value =3D curr_param,
> +                                       .param_index =3D ++test.param_ind=
ex,
> +                                       .parent =3D &test,
> +                               };
> +                               kunit_init_test(&param_test, test_case->n=
ame, test_case->log);
> +                               kunit_run_case_catch_errors(suite, test_c=
ase, &param_test);
>
>                                 if (param_desc[0] =3D=3D '\0') {
>                                         snprintf(param_desc, sizeof(param=
_desc),
> -                                                "param-%d", test.param_i=
ndex);
> +                                                "param-%d", param_test.p=
aram_index);
>                                 }
>
> -                               kunit_print_ok_not_ok(&test, KUNIT_LEVEL_=
CASE_PARAM,
> -                                                     test.status,
> -                                                     test.param_index + =
1,
> +                               kunit_print_ok_not_ok(&param_test, KUNIT_=
LEVEL_CASE_PARAM,
> +                                                     param_test.status,
> +                                                     param_test.param_in=
dex,
>                                                       param_desc,
> -                                                     test.status_comment=
);
> +                                                     param_test.status_c=
omment);
>
> -                               kunit_update_stats(&param_stats, test.sta=
tus);
> +                               kunit_update_stats(&param_stats, param_te=
st.status);
>
>                                 /* Get next param. */
>                                 param_desc[0] =3D '\0';
> -                               test.param_value =3D test_case->generate_=
params(test.param_value, param_desc);
> -                               test.param_index++;
> -                               test.status =3D KUNIT_SUCCESS;
> -                               test.status_comment[0] =3D '\0';
> -                               test.priv =3D NULL;
> +                               curr_param =3D test_case->generate_params=
(curr_param, param_desc);
>                         }
> +                       /* TODO: Put this kunit_cleanup into a try-catch.=
 */
> +                       kunit_cleanup(&test);
>                 }
>
>                 kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CAS=
E);
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>
