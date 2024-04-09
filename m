Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBE89D44C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34313112B9F;
	Tue,  9 Apr 2024 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HZ8SO2SG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EA4112B9F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 08:30:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56e67402a3fso10116a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712651401; x=1713256201;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bO3YxxQWjJ6PfYpNGcZ8fHpwKQUCFh3j87HJvrR0FWo=;
 b=HZ8SO2SG+avr3PvE1Nex3Yf6laA5mhfJ7OJfEBH60h3kj6HPKo/Em93D2To9aknqID
 CJXyEdGuTERdw7MMwQkcVJKcKOu0g/BxECH/RGC5U1tZ7MI/Mk2CfWAPVvCetSjjdy06
 xeQYwrz/00pzlJ8e594ekUnaKnOGWN2LfVU1KBI78T8PrFgOxe/oqOwRtRVTzPz20zsW
 VAbgQVrj+tY6k0wuhydoZ8ZWkPBVjfTRFg0L11FiyIvqvTXa/FjC3WKlMhWoO54VDm1N
 EhCTsOZtJ0hXjThtrJb0CmbPIPUQ/VXmjxkIteRsW1+pvPj9mDNI46vAjR4r3Z49Ir1Z
 E+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712651401; x=1713256201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bO3YxxQWjJ6PfYpNGcZ8fHpwKQUCFh3j87HJvrR0FWo=;
 b=P4PRY6zBX6jM4gomN3hrT+QiW9bKSUqJAT4D9pyzh/K9M5NP8wr3hn1XCA8Z8gjbWF
 xuMRhJH9hp0PqPYSbfkThYxl5GwyLdb4cD5X9qJ74iyFSpvUlSU5cwUE3nuibe4VJZ5o
 06yfOMs+XBnO17SvxHTyeQg4M10uBwWisyDdByW994wxJxwRSQdImTcM7XvxLutgfS4q
 TcpmHFWsHoZv2RlWF6EcSBX2pFsi2+QliA1uZF9ni/LfZ7cxbccGK0OMTwYCpZlJjrLf
 P05TU1Y6VtYIDnyN4bx/HqJQKB34pXo+1Eo+rZ5hIANn+tqo2rKNAKAGRx2TcNyyVS1r
 jONw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmhhVA6aBi39gRdKZudcXpKfZdKgmvBbCEiNRVGxrvTLQit05Jx1R9wvhc/E9CJ1EEweveW2viSqWgjKD4RUF+UYIEfOV+j7jnPzdko+1N
X-Gm-Message-State: AOJu0YzDInQlpwj00p37PlO3Wtdjqk9KY+JaVHUgjaXER/YgbO/YMZvu
 6E/yqya4ClhLczdbHDAQcleBkV3krQ02381M+JSsKxIM9HbE/2nINzE02m1gNdh4n8F+Ua03Th8
 IyWYw4RG4pHpa/jTUW5KPx99cIXXpdcPbLmHD
X-Google-Smtp-Source: AGHT+IHYaeERcEkkmGD/A4tACg9YKD4kdNmAMVD2CKRyiAat0V+rnkCQ2SItMKP8w6Jo/7F9MnxE50/WwG55IF7tH+4=
X-Received: by 2002:aa7:d7da:0:b0:56e:76e:6ea9 with SMTP id
 e26-20020aa7d7da000000b0056e076e6ea9mr106213eds.6.1712651400934; Tue, 09 Apr
 2024 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-5-linux@roeck-us.net>
In-Reply-To: <20240403131936.787234-5-linux@roeck-us.net>
From: David Gow <davidgow@google.com>
Date: Tue, 9 Apr 2024 16:29:49 +0800
Message-ID: <CABVgOSkk-QhmemH0p_VmiLrqLDs7SxD-mc-mjzfE4+1tj5mB+w@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] kunit: Add documentation for warning backtrace
 suppression API
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 loongarch@lists.linux.dev, netdev@vger.kernel.org, x86@kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000675c370615a5ba75"
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

--000000000000675c370615a5ba75
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Document API functions for suppressing warning backtraces.
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

This looks good to me: thanks for adding the documentation!

If we add integration between this and the KUnit resource system,
we'll need to add that to this documentation.

I wonder if it would make sense to have an example where the
DEFINE_SUPPRESSED_WARNING() is global, e.g., in the test init/exit
functions. That might overcomplicate it a bit.

It also might be nice to document the individual macros with kerneldoc
comments. (Though, that could equally fit in patch #1).

Still, this is the most important bit, so I'm happy to have it as-is.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> v3:
> - Rebased to v6.9-rc2
>
>  Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 22955d56b379..8d3d36d4103d 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
>         if (some_setup_function())
>                 KUNIT_FAIL(test, "Failed to setup thing for testing");
>
> +Suppressing warning backtraces
> +------------------------------
> +
> +Some unit tests trigger warning backtraces either intentionally or as side
> +effect. Such backtraces are normally undesirable since they distract from
> +the actual test and may result in the impression that there is a problem.
> +
> +Such backtraces can be suppressed. To suppress a backtrace in some_function(),
> +use the following code.
> +
> +.. code-block:: c
> +
> +       static void some_test(struct kunit *test)
> +       {
> +               DEFINE_SUPPRESSED_WARNING(some_function);
> +
> +               START_SUPPRESSED_WARNING(some_function);
> +               trigger_backtrace();
> +               END_SUPPRESSED_WARNING(some_function);
> +       }
> +
> +SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
> +suppressed backtrace was triggered on purpose, this can be used to check if
> +the backtrace was actually triggered.
> +
> +.. code-block:: c
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
>
>  Test Suites
>  ~~~~~~~~~~~
> @@ -857,4 +885,4 @@ For example:
>                 dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
>
>                 // Everything is cleaned up automatically when the test ends.
> -       }
> \ No newline at end of file
> +       }
> --
> 2.39.2
>

--000000000000675c370615a5ba75
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
7xDrOPfX3COqq162RFg/MFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AK0lDd6/eSh3qHmXaw1YUfIFy07B25BEcTvWgOdla99gF1O7sOsdYaTz/DFkZI5ghjgaPJCovgla
mRMfNcxZCfoBtsB7mAS6iOYjuwFOZxi9cv6jhfiON6b89QWdMaPeDddg/F2Q0bxZ9Z2ZEBxyT34G
wlDp+1p6RAqlDpHifQJW16h5jWIIwYisvm5QyfxQEVc+XH1lt+taSzCfiBT0ZLgjB9Sg+zAo8ys6
5PHxFaT2a5Td/fj5yJ5hRSrqy/nj/hjT14w3/ZdX5uWg+cus6VjiiR/5qGSZRjHt8JoApD6t6/tg
ITv8ZEy6ByumbU23nkHTMOzzQSxczHkT+0q10/MxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAHS+TgZvH/tCq5FcDC0n9IwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIMXhuV4hAHg3WgSFIsVm8yZuEYXLcz0bF2GnnCPTizkFMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDQwOTA4MzAwMVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBDmb9s
luNjFtSKUt94yd39an5GkioJdQi7RC0pT3hYcoy6KF55ujlFc7E549YObxZARF6tf59fXC/TQ1nI
VkzuQXeeCx3jyjDBT2X/hZ/8/vo281f9Gi5wZmL51A+PK4VqiMELHh+2a1y1YRNlpwT8M4860S9j
OCpKRcQFu1NMo9RHq35B2nYyjsqJCVJvEhvkhZXKyfSKXwYqH2VzB5YRJdrtGPFFMNsEFOOWOLZ3
YmzFe3uye13PO4CKPtjeic5tmA6SrmKVXs78+06XherENkLGiMkChl3KDKXAr8dz3M+bmur0vO3k
b/OoQc4mFepL31ZARxwvAIoOcJB1bh/F
--000000000000675c370615a5ba75--
