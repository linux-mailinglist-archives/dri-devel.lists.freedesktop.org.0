Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F053A685E65
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 05:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6231510E0E6;
	Wed,  1 Feb 2023 04:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BD910E0E6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 04:25:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k16so11757554wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xgXTjz+SeVR3EKSrGhfV4/zhsG+vHk/UwIySr/6HfIU=;
 b=AYmfwFEwoFAJHsR67ZRvUIM+QtmTn9w9foxXMSpVoiK0xUqZzlyGJPNFu6ZfVYCz7I
 qh0tkt/G3nw5MQwJlspg7//65MM9UQ2yytXIXFaO8ax301UBeA9T26uFYQD2bjm/ZoWd
 1nffRToGA9odNgXjSZraKnV5fDYKhqCiA0ecjENF4HR/tbLaohO09t6go3bpzXwaFo+K
 OpCzaekhTl5DguNafWImXYFNU204iHuAEUocMzpMbGcuri/49/HDCqng+s36BD+ny9s1
 KhDvXX75cRozH17CEH1ov+n1xUwnXgdXNrSNROt0twP2aHlgp97xEGYOkzUrAcf1c/OS
 QWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgXTjz+SeVR3EKSrGhfV4/zhsG+vHk/UwIySr/6HfIU=;
 b=d4n12TA+DPXT1rt5BgBOd7ebBNdbPUu9nQoHodj5qLhgCcQWLxBSKR6yXfUjhPb0th
 vM3iUjFVqmc3O3MHR8wOyRcLrV0yo+ymHTTsGxSfd6ws/tiPGhF99mmY+fRnizu0tv2F
 2AOR6plJJdQG0Ycl9l4Phi13b4035vqzluxQA5WVmMn3VK2q2+ALWvn4KLTHQ/c8ctub
 CMmUCuV59bZmb7Uj0a5eSvYbJvGzcMui0l9mrlqb3kWD828jnyuEhPP6s8kO4LmcRpem
 VvKzSMXcyNTYzfXL3xjkacnRsnOITiz5p1nJWsmfRscI1XrpBRk7UyWiul+fnanX8kkj
 OIKA==
X-Gm-Message-State: AO0yUKViR4qD6l+WgtLyb4v2POBLi2sREqKqGhSkRmaAu9wwgSGkknLY
 i2WkWiEYHw1S/mqq9wOdaxO8f6ifMx50oBShOgGR8Q==
X-Google-Smtp-Source: AK7set81EXSiGCojwItpJVX5J+y+r2Yo7QanFg4hXbmpjNn1DjuLKbrSux5gS21fub433E+Crv+VOcNZ6Y1bJjbOm5I=
X-Received: by 2002:a1c:7c0e:0:b0:3da:1f6a:17c5 with SMTP id
 x14-20020a1c7c0e000000b003da1f6a17c5mr26300wmc.58.1675225539494; Tue, 31 Jan
 2023 20:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20230130125554.363481-1-mairacanal@riseup.net>
In-Reply-To: <20230130125554.363481-1-mairacanal@riseup.net>
From: David Gow <davidgow@google.com>
Date: Wed, 1 Feb 2023 12:25:27 +0800
Message-ID: <CABVgOSn38F_a7=2FOrE1kwFbPZ4jW__7MfxssboTFOCp8qZFrw@mail.gmail.com>
Subject: Re: [PATCH] drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000387f3b05f39bd7cc"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000387f3b05f39bd7cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jan 2023 at 20:58, Ma=C3=ADra Canal <mairacanal@riseup.net> wrot=
e:
>
> Commit b8a926bea8b1 ("kunit: Introduce KUNIT_EXPECT_MEMEQ and
> KUNIT_EXPECT_MEMNEQ macros") introduced a new macro to compare blocks of
> memory and, if the test fails, print the result in a human-friendly
> format. Therefore, use KUNIT_EXPECT_MEMEQ to compare memory blocks in
> replacement of the KUNIT_EXPECT_EQ macro.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---

Looks good to me! (I'd vaguely assumed we'd already updated these
tests, but apparently not...)

I expect this'll go in via one of the DRM trees, not the KUnit one (it
doesn't apply to the kselftest/kunit tree as-is).

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  drivers/gpu/drm/tests/drm_format_helper_test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 34e80eb6d96e..9536829c6e3a 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -597,7 +597,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct k=
unit *test)
>
>         drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, =
&params->clip);
>         buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_siz=
e / sizeof(__le16));
> -       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>
>  static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
> @@ -628,7 +628,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct k=
unit *test)
>
>         drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, =
&params->clip);
>         buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_siz=
e / sizeof(__le16));
> -       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>
>  static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
> @@ -659,7 +659,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct k=
unit *test)
>
>         drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, =
&params->clip);
>         buf =3D le16buf_to_cpu(test, (__force const __le16 *)buf, dst_siz=
e / sizeof(__le16));
> -       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>
>  static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
> @@ -724,7 +724,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct k=
unit *test)
>
>         drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, =
&params->clip);
>         buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_siz=
e / sizeof(u32));
> -       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>
>  static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
> @@ -786,7 +786,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struc=
t kunit *test)
>
>         drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &f=
b, &params->clip);
>         buf =3D le32buf_to_cpu(test, (__force const __le32 *)buf, dst_siz=
e / sizeof(u32));
> -       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
> --
> 2.39.1
>

--000000000000387f3b05f39bd7cc
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
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBNgwggPAoAMCAQICEAHHLXCbS0CYcocWQtL1
FY8wDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMzAxMjkw
NjQ2MThaFw0yMzA3MjgwNjQ2MThaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+31G8qfgjYj6KzASqulKfP5LGLw1o
hZ6j8Uv9o+fA+zL+2wOPYHLNIb6jyAS16+FwevgTr7d9QynTPBiCGE9Wb/i2ob9aBcupQVtBjlJZ
I6qUXdVBlo5zsORdNV7/XEqlpu+X5MK5gNHlWhe8gNpAhADSib2H4rjBvFF2yi9BHBAYZU95f0IN
cSS0WDNSSCktPaXtAGsI3tslroyjFYUluwGklmQms/tV8f/52zc7A5lzX+hxnnJdsRgirJRI9Sb6
Uypzk06KLxOO2Pg9SFn6MwbAO6LuInpokhxcULUz3g/CMQBmEMSEzPPnfDIAqwDI0Kqh0NAin+V4
fQxJfDCZAgMBAAGjggHUMIIB0DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFJyglaiY
64VRg2IjDI2fJVE9RD6aMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQA2lZLYRLu7foeR
cHo1VeNA974FZBiCm08Kd44/aCMEzdTJvxAE9xbUJf7hS1i6eW49qxuSp3/YLn6U7uatwAcmZcwp
Zma19ftf3LH+9Hvffk+X8fbPKe6uHkJhR2LktrhRzF159jj67NvXyGQv8J4n7UNeEVP0d5ByvRwv
tF2bJwlOwRGLoxasKSyDHIyUpwTfWYPq7XvjoGqQ/tDS7Khcc5WncJl0/ZEj7EKjtoGbsDbLdXEF
m/6vdcYKJzF9ghHewtV3YIU4RE3pEM4aCWWRtJwbExzeue6fI7RqURbNCAyQuSpWv0YQvzsX3ZX3
c1otrs50n1N0Sf8/rfJxq7sWMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBz
1lLdWN7YzfjW9LEIebxifpPlkxBHWdZf3Ucyf5K1mjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAyMDEwNDI1MzlaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAtIXg6iWqzhYuZbIudWR6
XJMqj5buNW7+udcK2KJCS7ymKgcihreNeKaj74+VJzz224ffQV+PKsA4b5Anybio4NKDu2PwOrlb
tHrmjxTT3ZmGbItlei/UjVR5WiJEdmLABWjHk+YSPd3acUIiLL0lEanF40zhP7Rv4yk54TCZhxOT
MKOqfiHGYTBpdttyxMxr1t1I5kWmYJGv509Mo8ngcSDjMcHUIPznCuHXI0nkteU8UBK0hmc1ULDB
E63cCIDSem+m4Q5rqkJrE0EpIuTMTxng5Xcxb6N/E3vDyqZX0rLPPvaZjV8SL6ayo/1gnZawICN2
L75ctAGOpTsV0AwQMw==
--000000000000387f3b05f39bd7cc--
