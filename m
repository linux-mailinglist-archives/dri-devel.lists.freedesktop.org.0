Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68993607156
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B07710E624;
	Fri, 21 Oct 2022 07:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410E210E61D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:43:55 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id p7so410796vsr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 00:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3OXCCisAO2Vc1oPU8JAvQd/kB+6L0CRhAsJRD0xKD14=;
 b=RmFBRwnN3sHR9Zmp3hnA2uCUKyTDPzeuonT8Yl9Yg3TfotuBhvxhsdeyjXq4duWIZL
 /LICzpLCyd9oxoDN83VSWLR1xbikpFrAIvq9+wKrfwMoaCcFX3hT0wVUGtexfmQX/d9B
 G0J6qgHCRn1UD10/BABLfa4VrD5scd6hbA+VMylghSmVA032ebFB/b/L+clAFogEZc98
 ZMym+Qp5mLqaumq3MRo2myftW544rg+0hDDIkPoOu57wNnh87NXaAAGLrKpMnO3c3kuk
 wiI3gaxdRr2d13ZgFgHM8VvleRCulPxc9ghhMD/Jx8XbMxxEwkmmKQfZaEYh184UAhhZ
 vv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3OXCCisAO2Vc1oPU8JAvQd/kB+6L0CRhAsJRD0xKD14=;
 b=YRLzTnLFvF4GVWWUdm25ZeoTsfdXXkG+MQiovJKRvAhzcCWKuTkExGxnTIu/QoYZj0
 /PjWuByCpXR4Bd1jyLT4RiomzY4Gh8zTtfrOXFDBkx+88TliHK2/yhM1XwSVfgit4aMf
 cXh03lCi8tj5Nj4AP6rHnFqgWWPCaYkBpfnQsv5eyylOkxbdJky6ZDIR11ScJjemI7ho
 x0OKDbB3LWJSA/RxCrueI262mtV+XUBVRHbNcBEcoP4pUDA9GfRq0qRRz8iktmD3pdfO
 rnIwkyn1hDjQ1bt17Du5c9mwRMkacYFvNX1XPd1nqo6TxCLxLfN9ropmL8r7HkdqKDfC
 pJ6A==
X-Gm-Message-State: ACrzQf1CE19R6WBIdf7+KWRFIRoRWkdIf2TF9Cj6lGXAzhUJ8ZPzAxCa
 oF2/AtXWQ50pEhfrrbjCMtwaWdn4IXlbnejoUWAOjg==
X-Google-Smtp-Source: AMsMyM7c8roYAv0bhhxIs3sWSkrTq2ikats76AE8z4czFMuHVqVA/dTDJUCR+VsHC8FnsuEW8CIdAOWS6ES0bouXlnk=
X-Received: by 2002:a05:6102:284a:b0:3a7:ce5:ca83 with SMTP id
 az10-20020a056102284a00b003a70ce5ca83mr11171350vsb.38.1666338234284; Fri, 21
 Oct 2022 00:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221019073239.3779180-1-davidgow@google.com>
 <6bb18060-158a-a2e7-3382-5d42813fe247@riseup.net>
In-Reply-To: <6bb18060-158a-a2e7-3382-5d42813fe247@riseup.net>
From: David Gow <davidgow@google.com>
Date: Fri, 21 Oct 2022 15:43:42 +0800
Message-ID: <CABVgOSn7cg962HLARiGfOT0tLzra91tESrw1dVk6XK2Y8ZsV5Q@mail.gmail.com>
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000008b720105eb869a8b"
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008b720105eb869a8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 7:36 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> [cc Javier]
>
> Hi David,
>
> On 10/19/22 04:32, David Gow wrote:
> > The xrgb2101010 format conversion test (unlike for other formats) does
> > an endianness conversion on the results. However, it always converts
> > TEST_BUF_SIZE 32-bit integers, which results in reading from (and
> > writing to) more memory than in present in the result buffer. Instead,
> > use the buffer size, divided by sizeof(u32).
> >
> > The issue could be reproduced with KASAN:
> > ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/tests =
\
> >       --kconfig_add CONFIG_KASAN=3Dy --kconfig_add CONFIG_KASAN_VMALLOC=
=3Dy \
> >       --kconfig_add CONFIG_KASAN_KUNIT_TEST=3Dy \
> >       drm_format_helper_test.*xrgb2101010
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrg=
b8888_to_xrgb2101010()")
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Reviewed-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>

Thanks a lot, Ma=C3=ADra!

> > ---
> >
> > This is a fix for the issue reported here:
> > https://lore.kernel.org/dri-devel/CA+G9fYsuc9G+RO81E=3DvHMqxYStsmLURLdO=
B0NF26kJ1=3DK8pRZA@mail.gmail.com/
> >
> > Note that it may conflict with the KUNIT_EXPECT_MEMEQ() series here:
> > https://lore.kernel.org/linux-kselftest/20221018190541.189780-1-mairaca=
nal@riseup.net/
>
> I believe this patch will go to the drm-misc-fixes tree, so I can rebase
> the series (and address the format issues) as this patch hits mainline.

We're probably going to want the KUNIT_EXPECT_MEMEQ() merged in the
kselftest/kunit tree reasonably soon, as there's a few things we'd
like to use it for that we're hoping to get into 6.2.

Given that any conflict is only likely to affect context lines, it
hopefully won't be too much of a problem to resolve it when everything
gets merged, though.

Cheers,
-- David

--0000000000008b720105eb869a8b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDe
6Pyffl9m8tbUT0KX8FWAQfRUJq8yxZIWnOsHKuv+vzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjEwMjEwNzQzNTRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAGU1/ZMSFPcmaG/Dqyss/
EXFCzK980mpRuBfmu8UiKRorkwDkMSdjtT6JVQID2jc30tkHros+T5XANm6nqhKCQ7x4g/f8tvYf
oxgHGkGx/SqQqcRHoK5nixj1zF0WITsy2RSfamy9r4VYVb9SIGrcDecE0eGQb/eUqTYxp/6QhfE5
QFHOd/7tiEhZskQ+HO5qec2YAAWB/huXHH65GJoV1fhwJkpofyjOoCXucTnxFSmTC7vy6CqpsmQN
szmtknxvVKujKZJTUkHHHVeWj+NhtNxXo6pXy5q9puWOc5uf0hMA1Z+fu0lrpz6BNZIzg97uiA96
N5BFeQ3+DJMyOFNEqQ==
--0000000000008b720105eb869a8b--
