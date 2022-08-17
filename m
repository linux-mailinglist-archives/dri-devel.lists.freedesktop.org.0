Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7159699B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DC410F9B6;
	Wed, 17 Aug 2022 06:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3F10F9B6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:36:28 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id c3so12271130vsc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=YXiiXWUim+UoGVraR1IA/A/PZkLspYKbgwtbNVecVg0=;
 b=q4CYSdng2uE29Es61wrYC67xTrwIle3G2iF5oZwpibzllwMYDVuX5lYEC7+96KTtp1
 HA55CKE8A2Bz/ZUGMdc1VV75lqGXGt+9gn/S4tL87FreBIA0WhZVe5Jx+2i3e4NpOamB
 oT/ZUJeKrzJPUF4kf06FN4xWDkgRv3Rc+x1P1Fe7kuGhftGjsBjUgNqKa4xvglzbCyQq
 ufqm6TdLmCTJ+XU1Pe6M2qhAka1ddfhYc2nvYdxlZrqUDw2ARND+1l7pWeKnWnIccEgE
 0QZyWTQJeSHk+MpMpPeAuvvUHZvT4iAQPbFrrUqqwzoaAxgCMCk6l1eKNzAmaqCk8xEF
 i7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YXiiXWUim+UoGVraR1IA/A/PZkLspYKbgwtbNVecVg0=;
 b=7x+7Bllr6Qy89WVEM3fQsl3jf72HAAXFx4e+CRAV+59sEyojwrFFQVho2z5xFj6R5F
 zza9m9Gn81BqiPbLMbwF75bqc9kWGFRhfvC7qaIdWp3K+lR+QveZff2RfrgX/fkjM7A9
 nHFbgfwpSladoYVb3zKRAQahab8jYLeF8tC20Q5shsAPzXwtFQwmVq2XHj19rXhxtXPH
 zZ8tDXVE+p9Dly+K+zTNOKfGVTqACUTGKYaJW3Dj0pL/clG2Ig3jTJ8Cs1uQg0/g5ykI
 kJsjwms7pU3bRynl9I8LcA3lmKF3n/+DhDDUp2HLjla22+O4zF7qt/lsZo8Q3CF3Ix3m
 So0A==
X-Gm-Message-State: ACgBeo0HCclRFJGdBE7rLfwC/Why+4HGQZJf7LSBbgPpWvkzpQ0SqYWz
 UroTLTB+3rVCK+wdxSE2K2cepWLiBO7NBQr4ts7n7g==
X-Google-Smtp-Source: AA6agR57ZdVtvUBcTZYAHL8yC/KjSc6fYGOGOVdjx63Fkz00KeVDo7dAOzSZpILgl8z03Ra9Wfcca6pvsRYP4l4tVe8=
X-Received: by 2002:a67:fdce:0:b0:388:485c:889c with SMTP id
 l14-20020a67fdce000000b00388485c889cmr9421404vsq.38.1660718187865; Tue, 16
 Aug 2022 23:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
 <20220816102903.276879-3-jose.exposito89@gmail.com>
In-Reply-To: <20220816102903.276879-3-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Wed, 17 Aug 2022 14:36:15 +0800
Message-ID: <CABVgOSnx+RdWWeoNGJE8ReN5HcHpWqN7jU0Oqa9JxWcyLES37A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_xrgb2101010()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000adf3f005e66a15f6"
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000adf3f005e66a15f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 6:29 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> Extend the existing test cases to test the conversion from XRGB8888 to
> XRGB2101010.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

This looks good.

Again, it'd be nice to use KUNIT_EXPECT_MEMEQ() when it's available,
but if you don't want to add a dependency on that patchset now,
keeping it as-is in this patch and fixing it later is also fine.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 08d08e7ab19a..d8536db4de1e 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -32,6 +32,11 @@ struct convert_to_rgb888_result {
>         const u8 expected[TEST_BUF_SIZE];
>  };
>
> +struct convert_to_xrgb2101010_result {
> +       unsigned int dst_pitch;
> +       const u32 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
> @@ -40,6 +45,7 @@ struct convert_xrgb8888_case {
>         struct convert_to_rgb332_result rgb332_result;
>         struct convert_to_rgb565_result rgb565_result;
>         struct convert_to_rgb888_result rgb888_result;
> +       struct convert_to_xrgb2101010_result xrgb2101010_result;
>  };
>
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
> @@ -61,6 +67,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0x00, 0x00, 0xFF },
>                 },
> +               .xrgb2101010_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x3FF00000 },
> +               },
>         },
>         {
>                 .name =3D "single_pixel_clip_rectangle",
> @@ -83,6 +93,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0x00, 0x00, 0xFF },
>                 },
> +               .xrgb2101010_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x3FF00000 },
> +               },
>         },
>         {
>                 /* Well known colors: White, black, red, green, blue, mag=
enta,
> @@ -132,6 +146,15 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
>                         },
>                 },
> +               .xrgb2101010_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D {
> +                               0x3FFFFFFF, 0x00000000,
> +                               0x3FF00000, 0x000FFC00,
> +                               0x000003FF, 0x3FF003FF,
> +                               0x3FFFFC00, 0x000FFFFF,
> +                       },
> +               },
>         },
>         {
>                 /* Randomly picked colors. Full buffer within the clip ar=
ea. */
> @@ -175,6 +198,14 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>                         },
>                 },
> +               .xrgb2101010_result =3D {
> +                       .dst_pitch =3D 20,
> +                       .expected =3D {
> +                               0x03844672, 0x0444D414, 0x2A20300C, 0x000=
00000, 0x00000000,
> +                               0x1B1705CD, 0x03844672, 0x0444D414, 0x000=
00000, 0x00000000,
> +                               0x2A20300C, 0x1B1705CD, 0x03844672, 0x000=
00000, 0x00000000,
> +                       },
> +               },
>         },
>  };
>
> @@ -319,10 +350,42 @@ static void xrgb8888_to_rgb888_test(struct kunit *t=
est)
>         KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
>  }
>
> +static void xrgb8888_to_xrgb2101010_test(struct kunit *test)
> +{
> +       const struct convert_xrgb8888_case *params =3D test->param_value;
> +       const struct convert_to_xrgb2101010_result *result =3D &params->x=
rgb2101010_result;
> +       size_t dst_size;
> +       __u32 *buf =3D NULL;
> +       __u32 *xrgb8888 =3D NULL;
> +       struct iosys_map dst, src;
> +
> +       struct drm_framebuffer fb =3D {
> +               .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +               .pitches =3D { params->pitch, 0, 0 },
> +       };
> +
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_XRGB2101010,
> +                                      result->dst_pitch, &params->clip);
> +       KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +       buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +       iosys_map_set_vaddr(&dst, buf);
> +
> +       xrgb8888 =3D le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +       iosys_map_set_vaddr(&src, xrgb8888);
> +
> +       drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &f=
b, &params->clip);
> +       buf =3D le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
> +       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_pa=
rams),
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_pa=
rams),
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_pa=
rams),
> +       KUNIT_CASE_PARAM(xrgb8888_to_xrgb2101010_test, convert_xrgb8888_g=
en_params),
>         {}
>  };
>
> --
> 2.25.1
>

--000000000000adf3f005e66a15f6
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCC6
0hl3jw3RH5/oFYVM7y3WnlqfW0QCzGOP/eDp1zpnBjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA4MTcwNjM2MjhaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAcHSCQqzlYB6Wx9bhc4+Q
bTVrdS12m4RIRDngw6/plh95GDx3vYFZwj7tHWjzWN177E04X1uDdB0uLWqJK3ryVu9A/y51vY4W
JHJT6NoiIiqSkL4Z/p53nLLfxB5sB1II1V8z5HEgkcgcuQ08FdPPphIT6+uP87ChXTaWvN+ElwUH
Qv11ab0cxRYaJA2bspKxRc1h4n/jJ+u67mFzfMJEsj8pYIcn7bchIpeoA+hghR/zft4rdx9NOuLy
kScPbVkNofPrr+z5ly816mA/wrDIpVDrpjya2WHKPSqq1vE5HK4ZNsA9v1SoE08HsO6wju3Vo1Gd
uDudXsI8JksEc6w+mg==
--000000000000adf3f005e66a15f6--
