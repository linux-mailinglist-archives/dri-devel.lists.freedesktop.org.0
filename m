Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF22A754E7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 09:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441F10E1F8;
	Sat, 29 Mar 2025 08:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D7Pt89nc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396A10E1F8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 08:03:53 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6ecfbf1c7cbso48958396d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743235432; x=1743840232;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vcnn3TyioLOkDNQkhO/N+h0NK+CQ8VCmc4a545Bsv9I=;
 b=D7Pt89ncUDr22Iyqz5QM2NwvFE9CLzvI0jYxLMpU8ohf/GtAuJVEfpg+DpydtGhJ6F
 Ew3GjsWzTZUzNAn9h3SU/LcBotOmyD0luOmHv4MlM4MTSv4zs4RvRIaJ57C9/IZprBP/
 c8jevwmM2XLHje3+huQASr8rJSzuOKNzQKCkkWvgt9pjSn5ah3K8ofbX0yXqYp9ucHE6
 hzIaYucfxVqamUK98OKs0+C6DD2atRajWpnjSK+2tvQDvzKM/zYm1ji01ntw4aLQT3N9
 MIs/6eYxxxDQsEDa6pWNGYsXqn0HbDNf5CG/OYQleicUdsd51z5kCbW23Jsi6Z2OvMX7
 Irdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743235432; x=1743840232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vcnn3TyioLOkDNQkhO/N+h0NK+CQ8VCmc4a545Bsv9I=;
 b=QHidOYwhkdJi4M1I1n+o9fX58KL7wst2IjFtxkJcIkP7h7DLP+HxmYDDu+tdjFrg5N
 OvDA7JXUKQlFFAlg2fD1/pw5qNsdStBkd8bGvesbl7OvPGdRp6fGhiUKvgp7mTnMJ+kD
 N2W/OhRuCsLywxo1rwYoV3qiIP97nBCZBFuKAPKl1urgiQ72NHc8TmSr9mCHRedmiU7n
 TRL1ZacKOUNp7zaeJ3BReeu79K3yL+8UbIOq5rTtB9O83Xp+dr/5U3UyA+fQ00Kp4KXa
 kY8Z6dI8XB/KUQheUfTVwuSrNmlDksxTWTNaBWkQB6VwBMAQcVKmMR+Ze4w6/MsEApec
 cDng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX4CUjCgGZWBFUP2Vr0Fu0wdx2UTIPOXS/EneZu7X3ljWpJUVvkkJt6ammC1hookmsLi42Y7FSr40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSV+ogiTmuagOM3FC+wKgq74CcQHqauoJqK+5Qnuhs3jFmjBTH
 otnh3sL+OfzcogJNAMr8LXjhXk6pUOUXy92zBSAYrJS9noibi+jQMgVTTR6QKdBPsz0MCgIs1+K
 Lr5Nb+cV9X44LiHj3o9cwIfK7g7jrYQozYppN
X-Gm-Gg: ASbGncs17F0N4fhNzLvfMeEPXOREgB6qYvRSZTTeER+l7p03wwtLq2vYk1fchV3tdpl
 T6YaN/s81b16TYE7qN6WpGCEOZwpeqMwENnfOSwvWhtsrP1FpPPhrBa6RP7mIyOxktmUppOZ2V0
 FH0EluKxYrKdrOITRM5rpqr+deD7E=
X-Google-Smtp-Source: AGHT+IEJ8ce7V8CIlKC2A2azWY99VUL4El8Tj9GDvwsAXVoga+qrIDcAvwT96/mFGtya6VF3o6ehcJ+woWz7LYivLLE=
X-Received: by 2002:a05:6214:e67:b0:6e8:fa33:2965 with SMTP id
 6a1803df08f44-6eed5f93113mr33481246d6.14.1743235431710; Sat, 29 Mar 2025
 01:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250313114329.284104-1-acarmina@redhat.com>
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
From: David Gow <davidgow@google.com>
Date: Sat, 29 Mar 2025 16:03:36 +0800
X-Gm-Features: AQ5f1JqXTcD760nl7rxAYS90_BR-Zg4uyvqHwpHf7WGakdu8aw2xd4LNhe4EvmU
Message-ID: <CABVgOSk89WzaptN-peaty6ZLxnOHWRB02_JkjfK+5kCepNsxXg@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Alessandro Carminati <acarmina@redhat.com>
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
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 loongarch@lists.linux.dev, x86@kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000b56be3063176a07f"
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

--000000000000b56be3063176a07f
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 19:44, Alessandro Carminati <acarmina@redhat.com> wrote:
>
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multiple
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.
>
> With CONFIG_KUNIT enabled, image size increase with this series applied is
> approximately 1%. The image size increase (and with it the functionality
> introduced by this series) can be avoided by disabling
> CONFIG_KUNIT_SUPPRESS_BACKTRACE.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
>   to avoid image size increases if CONFIG_KUNIT is disabled. There would be
>   some benefits to adding those pointers all the time (reduced complexity,
>   ability to display function names in BUG/WARNING messages). That change,
>   if desired, can be made later.
>
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
>
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
>
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
>
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
>
> Changes since v3:
> - Rebased to v6.14-rc6
> - Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
>   since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
> - Added __kunit_ and KUNIT_ prefixes.
> - Tested on interessed architectures.
>
> ----

Sorry: I also thought this had already landed.

I'm definitely in favour of us taking this, though agree that we
definitely can't afford to break the s390x build.

I've (re-)reviewed the early patches as well, and am generally acking
the series (though some of the architecture-specific patches are
definitely beyond my expertise to review fully).

Acked-by: David Gow <davidgow@google.com>

Cheers,
-- David


> Guenter Roeck (14):
>   bug/kunit: Core support for suppressing warning backtraces
>   kunit: bug: Count suppressed warning backtraces
>   kunit: Add test cases for backtrace warning suppression
>   kunit: Add documentation for warning backtrace suppression API
>   drm: Suppress intentional warning backtraces in scaling unit tests
>   x86: Add support for suppressing warning backtraces
>   arm64: Add support for suppressing warning backtraces
>   loongarch: Add support for suppressing warning backtraces
>   parisc: Add support for suppressing warning backtraces
>   s390: Add support for suppressing warning backtraces
>   sh: Add support for suppressing warning backtraces
>   sh: Move defines needed for suppressing warning backtraces
>   riscv: Add support for suppressing warning backtraces
>   powerpc: Add support for suppressing warning backtraces
>
>  Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
>  arch/arm64/include/asm/asm-bug.h        |  27 ++++--
>  arch/arm64/include/asm/bug.h            |   8 +-
>  arch/loongarch/include/asm/bug.h        |  42 +++++++---
>  arch/parisc/include/asm/bug.h           |  29 +++++--
>  arch/powerpc/include/asm/bug.h          |  37 +++++++--
>  arch/riscv/include/asm/bug.h            |  38 ++++++---
>  arch/s390/include/asm/bug.h             |  17 +++-
>  arch/sh/include/asm/bug.h               |  28 ++++++-
>  arch/x86/include/asm/bug.h              |  21 +++--
>  drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
>  include/asm-generic/bug.h               |  16 +++-
>  include/kunit/bug.h                     |  56 +++++++++++++
>  include/kunit/test.h                    |   1 +
>  include/linux/bug.h                     |  13 +++
>  lib/bug.c                               |  51 +++++++++++-
>  lib/kunit/Kconfig                       |   9 ++
>  lib/kunit/Makefile                      |   7 +-
>  lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++
>  lib/kunit/bug.c                         |  42 ++++++++++
>  20 files changed, 519 insertions(+), 73 deletions(-)
>  create mode 100644 include/kunit/bug.h
>  create mode 100644 lib/kunit/backtrace-suppression-test.c
>  create mode 100644 lib/kunit/bug.c
>
> --
> 2.34.1
>

--000000000000b56be3063176a07f
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg1KtAiaINglwhUWIlJLOFKwhrb9oC
EXUsWOFmB2dsYDcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MzI5MDgwMzUyWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAnzJsFiWer46vSKVW1QjXqf699AQUVA+HmwLnHxfkgE4DkAQIs7EeaTRYR2VX8SLi
SY8ykrWn8vVJmrwWqpEY/Yn9JZzHhb1R8F66DZa5ZSN7EB6H6CRRl7zmMIhpTj4qOYxjjg0R8Amu
shB5i6l7iobEzFyA6JThpc9yhvlBKnMAQT3LL62JPe//PRbe0eBoJ+VhwGxjfhWz3WF5mBqcs6lL
RmfEesTaO/m+uSCweSJ7rVLqowWJj36Hc89esKapStkOblU0wmGpaR+qwfzcekgvAkLvS1b0QObY
oovwPT4iwO5QNcterb6T2ox5iO+vQLGtq7P05W2X11Ycv5eUIQ==
--000000000000b56be3063176a07f--
