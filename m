Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF781B18D28
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 11:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33BB10E0FB;
	Sat,  2 Aug 2025 09:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Kpbh9ePX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EF210E039
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 09:44:49 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-70739d1f07bso27480676d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 02:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754127888; x=1754732688;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=adWU0nFCMRTXKAUylXimi4KT+8DIgBIKTLqyawSzpXM=;
 b=Kpbh9ePXCCkU7WQZBm7ampWhFAB8TrHLji4w/rrI6DrqhEu/BehPGk+HbUGqif71A9
 g6oO6Xy8A5WjK5dqTGnIxOiq43fBrhIKVfeWMakIpbHB+hOUlS8GnRpAFv12SdFOFxlJ
 auMGRE34YAC+kjLtVoP73gp4yZtv7RBXyzYds0BOTKBmRAfFoSi7H+JIscYgGOSzA5/s
 oLjlVLCinIvjICi3BnohXQsVfwQ1CAFAxuR07XFJaqECyYO1k/smOBMWps97A4exjHai
 s9lpje+uEMxIk+H5JsIccZrOJVXtBRA+r1vKqSaYCjHBiCnqC7DFvwYi7sBpPcONjKp7
 a8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754127888; x=1754732688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=adWU0nFCMRTXKAUylXimi4KT+8DIgBIKTLqyawSzpXM=;
 b=nZCBwSAEG0dRrRJHE6TZlpatlaDHBC2LXpNvEDQprscna7j8vHACRzt/n/Syvs07Oh
 cPhTiE8Qq11XGBD+tZidLuVOTZTkqAi3j3dY39A9BrsNXfeYPJyeEsVdWoSwwlusIOvH
 sDbZbGlsMSHxV0uIVg49FMeXn+FyAndq39fBIAH9zDN1tJ06B81NN74mxriyX+OrRzHZ
 73pWhwULLbcjFyzuscg7UKNym+8AZ7+F1OmkIfEDirbS/Fd0CbZ793daezyB2ztRl7C1
 xXBtiQzFdAKwUFV7dedWozaN0G7+DNIximTk4cZJiR3vvvBXf42KSH5OkYUs78VAitCF
 wkpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBtjsrl0zZdL/XzZQBW+cYazPZ9fZYq1buW1Lg7OBFvkQYY91P5yQO4OacCzWrKbWXQZh3JuYZZ1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuv6ccr9bxWoHZGaYWJY0IXHPeixA53ziFG3cI4yDs0wtmV+NE
 RhSDYny673M+R5cB6OYwZau2IeIuBAhhF4sq+jnjSZ0dQ4RBYVpDNpqZNVJ1OQb0RgLV9KMaIuR
 YZzDBxGGazfCi1c8tLhEpk5FCTRsvP1qJGocnjvN3
X-Gm-Gg: ASbGncvZ/lkBbJ1I33oK7mQP0CBsYxduM7yqJfRITJNMnbBNgAK7j/qeTcPzjxeFs3u
 tjXrSlNi/hQN1XKCd8lsVjx0bSdkxIgkp/2ji3Zvw74W5egTZysnHJBpO+qxPi7vbbBUJkTAC7A
 4thaFfIwBDgWudAO5Jn6YEpnm7Cy618j9DbAGucRbUe4Q2m8YKmwm1Ch5TTHIP0o7/EaQoQ9oow
 fBQat6k3RUXsprdAQs=
X-Google-Smtp-Source: AGHT+IGgWtcROAlZGKditmmadWtgOHmzt43XJix0Nnl2N8/RN5m2Uf+sSWXuLNWifsNrFv3CBM7o5FTuD+PSEqdGTB0=
X-Received: by 2002:a05:6214:5283:b0:6fa:ccb6:602a with SMTP id
 6a1803df08f44-70936539ed7mr35394746d6.20.1754127887787; Sat, 02 Aug 2025
 02:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-2-marievic@google.com>
In-Reply-To: <20250729193647.3410634-2-marievic@google.com>
From: David Gow <davidgow@google.com>
Date: Sat, 2 Aug 2025 17:44:34 +0800
X-Gm-Features: Ac12FXyBddcaH4ASc55JFTtU-OzYr71ML2o65LdxQ89fGSsOvq3Er5PhauJVb-c
Message-ID: <CABVgOSkaqvqU7r51tyyNc+NXD9D72zA_3QeYoYYxO6qszkOHCw@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: Add parent kunit for parameterized test context
To: Marie Zhussupova <marievic@google.com>
Cc: rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000af1d37063b5eb94d"
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

--000000000000af1d37063b5eb94d
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 03:37, Marie Zhussupova <marievic@google.com> wrote:
>
> Currently, KUnit parameterized tests lack a mechanism
> to share resources across individual test invocations
> because the same `struct kunit` instance is reused for
> each test.
>
> This patch refactors kunit_run_tests() to provide each
> parameterized test with its own `struct kunit` instance.
> A new parent pointer is added to `struct kunit`, allowing
> individual parameterized tests to reference a shared
> parent kunit instance. Resources added to this parent
> will then be accessible to all individual parameter
> test executions.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---

I'm definitely a fan of this, though it's not without its downsides.

For most tests, I don't think this will be a noticeable difference,
since the "shared" struct kunit is reset after each parameter anyway,
so this is a pretty safe change.

Having a 'parent' struct kunit, and hence potentially a hierarchy,
does give us a good way of implementing more complicated parameterised
tests which might need some more persistent state. (Ultimately, we
could have another level for suites, and then allow
suite_init/suite_exit to setup something persistent, too.)

Anyway, this looks good to me. I've left some small notes below, but
nothing I think is actionable.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  include/kunit/test.h | 12 ++++++++++--
>  lib/kunit/test.c     | 32 +++++++++++++++++++-------------
>  2 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 39c768f87dc9..a42d0c8cb985 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -268,14 +268,22 @@ struct kunit_suite_set {
>   *
>   * @priv: for user to store arbitrary data. Commonly used to pass data
>   *       created in the init function (see &struct kunit_suite).
> + * @parent: for user to store data that they want to shared across
> + *         parameterized tests.

A part of me would prefer this not to explicitly call out
parameterized tests here, as the obvious extensions to this (having
suites have a struct kunit, or other forms of test hierarchy) would
still make use of this in non-parameterised use-cases.

But since parameterised tests are the only current use-case for it, I
can live with it if you'd prefer.

>   *
>   * Used to store information about the current context under which the test
>   * is running. Most of this data is private and should only be accessed
> - * indirectly via public functions; the one exception is @priv which can be
> - * used by the test writer to store arbitrary data.
> + * indirectly via public functions; the two exceptions are @priv and @parent
> + * which can be used by the test writer to store arbitrary data or data that is
> + * available to all parameter test executions, respectively.
>   */
>  struct kunit {
>         void *priv;
> +       /*
> +        * Reference to the parent struct kunit for storing shared resources
> +        * during parameterized testing.
> +        */
> +       struct kunit *parent;
>
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index f3c6b11f12b8..4d6a39eb2c80 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>         struct kunit_case *test_case;
>         struct kunit_result_stats suite_stats = { 0 };
>         struct kunit_result_stats total_stats = { 0 };
> +       const void *curr_param;
>
>         /* Taint the kernel so we know we've run tests. */
>         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -679,36 +680,39 @@ int kunit_run_tests(struct kunit_suite *suite)
>                 } else {
>                         /* Get initial param. */
>                         param_desc[0] = '\0';
> -                       test.param_value = test_case->generate_params(NULL, param_desc);
> +                       /* TODO: Make generate_params try-catch */

Thanks for adding the TODO here: this isn't a regression, but it's
good to note that we should get around to fixing it.

> +                       curr_param = test_case->generate_params(NULL, param_desc);
>                         test_case->status = KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
>                                   "# Subtest: %s", test_case->name);
>
> -                       while (test.param_value) {
> -                               kunit_run_case_catch_errors(suite, test_case, &test);
> +                       while (curr_param) {
> +                               struct kunit param_test = {
> +                                       .param_value = curr_param,
> +                                       .param_index = ++test.param_index,
> +                                       .parent = &test,
> +                               };
> +                               kunit_init_test(&param_test, test_case->name, test_case->log);
> +                               kunit_run_case_catch_errors(suite, test_case, &param_test);
>
>                                 if (param_desc[0] == '\0') {
>                                         snprintf(param_desc, sizeof(param_desc),
>                                                  "param-%d", test.param_index);
>                                 }
>
> -                               kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE_PARAM,
> -                                                     test.status,
> -                                                     test.param_index + 1,
> +                               kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
> +                                                     param_test.status,
> +                                                     param_test.param_index,
>                                                       param_desc,
> -                                                     test.status_comment);
> +                                                     param_test.status_comment);
>
> -                               kunit_update_stats(&param_stats, test.status);
> +                               kunit_update_stats(&param_stats, param_test.status);
>
>                                 /* Get next param. */
>                                 param_desc[0] = '\0';
> -                               test.param_value = test_case->generate_params(test.param_value, param_desc);
> -                               test.param_index++;
> -                               test.status = KUNIT_SUCCESS;
> -                               test.status_comment[0] = '\0';
> -                               test.priv = NULL;
> +                               curr_param = test_case->generate_params(curr_param, param_desc);
>                         }
>                 }
>
> @@ -723,6 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                 kunit_update_stats(&suite_stats, test_case->status);
>                 kunit_accumulate_stats(&total_stats, param_stats);
> +               /* TODO: Put this kunit_cleanup into a try-catch. */
> +               kunit_cleanup(&test);

Hmm... it is a shame we can't easily include this in the existing
try-catch mechanism. Definitely worth fixing in a follow-up.


>         }
>
>         if (suite->suite_exit)
> --
> 2.50.1.552.g942d659e1b-goog
>

--000000000000af1d37063b5eb94d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgjq0kHLJKgEPSKYFuzbuqT1jG2Lz7
9JXirfk9/r/YZtgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
ODAyMDk0NDQ4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAAnW7hmThK50h5iMzYqnRT7s1V+I4foLcmYhnfX7tYIkHcPUBcGn5NwXDfWRthkLr
El1ajeJt0yQvO3GwjK3JCDjU5diH/Ug+YB246MqdtiW6nuEo98V1pi9yagXxCruj/VRwgIwsDpXi
WSBmhuswm3E1F9LwONpl9R1lolU8U1VywH5bpmojenp+s4J7BSn/hYGiPJbR08ZNPx3EEusQiYXt
j3EbsQf8+rZn06iT4nyCOkNum4mbmHACIFs4m01BdlRXWbEo0QjLxNttVyANw+Dww2pQaOBomxGR
xX1zkP4+PHEKmMBDECY/FH8ggK8Eoj6RaReOs8aAhB91wKXCVw==
--000000000000af1d37063b5eb94d--
