Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56575A010F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9DB78D5;
	Wed, 24 Aug 2022 18:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92310FBED
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:43:51 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id r12so4842698uaf.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lbaahwH016wMiydKY+Se935tvCLk/BSbkQFYjeeTif4=;
 b=AOw/HTVM0aFm19HS+0cQcnSwmHhj4NjEhygw0cUHjmdCA2BrNiUHl/hJaIM+AeOjSR
 PNLX4ir7c4AeKDNO6Z0+u+cSRZZG3gB4qXq3ZlLezzv17hP8SlbMHcU8E93XjXiDt4Ri
 N2nvf/Cuf7QslykJP41cuyyZnB8XQwqm5v5whuzuxoq58HflVxiEvur4IQ7+oveUZd0m
 SM1IDbkD+E1K6qHlLS8Fab13wVtluwy9bLwn5LingIFOqWK1xpfl8NAMWClR+/cit/OR
 IPkP8Brg/HGpTPxb4D8Bx1N8PrQwSlklhoMv71ZrMCMIJbDNl/zOFVsoB1gU+Amy3iVP
 SMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lbaahwH016wMiydKY+Se935tvCLk/BSbkQFYjeeTif4=;
 b=Nd9S/QqOYv93rF4R/2w6h3QPFot0BWy/tq2Firgk01zqGaUwyhParWz3OID3WCf2HJ
 eRh7f4ZZd57Rq+QRwg9rQOdJfP3POhsgC+XB0jE8uEsdZOignN5HvGEO8xKyhmFCTJf9
 fiwW7uvFtDCIQvvfLYihdtnHUkRmSByUcG/dYSCbuvkPmHiW3UcwTuNBD7VTWEgRv1O4
 2qruUnGc7RzBbY87beYj9NNEqHP8LCZ15X8TI71h/+cuR6FJKfQKIezbuYNMDNx1vRfp
 dbLtxJRR8XI7ByhSIpU9LU+fYI3g/nXB618GzoqOGixYWiOuHBUxKbiYbozD+C88Rmhp
 A5tw==
X-Gm-Message-State: ACgBeo04PZskd2w5irIUID5GmkVXtsx/b59wEATYG/U+A5cl49xFvfgQ
 udehqi7R/bE/3I7j1M81XKidLnDz84mEaEO138xKJw==
X-Google-Smtp-Source: AA6agR5dFAN8peq77stptbBXijXd8Z3RkiJT+y4UE0dgWu2bUGyXJsAKLYOBhMFPi0VQpFqJnXZKLn5aJ4D4Bbd9wG0=
X-Received: by 2002:a05:6130:1102:b0:38c:49b4:bbc3 with SMTP id
 ce2-20020a056130110200b0038c49b4bbc3mr10739363uab.107.1660718630831; Tue, 16
 Aug 2022 23:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
 <20220816102903.276879-4-jose.exposito89@gmail.com>
In-Reply-To: <20220816102903.276879-4-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Wed, 17 Aug 2022 14:43:39 +0800
Message-ID: <CABVgOSktP5nAVc42RR4Sh6WM0qjhbf1yG6HVa7j-nWAL-cxnQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000014373005e66a30ee"
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

--00000000000014373005e66a30ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 6:29 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> Extend the existing test cases to test the conversion from XRGB8888 to
> grayscale.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

This looks good to me as well. The grey8 conversion is a bit trickier
to eyeball due to ITU BT.601 giving the components different weights,
but it seems sensible and passes here.

Again, KUNIT_EXPECT_MEMEQ() will be nice one day, but shouldn't hold this u=
p.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index d8536db4de1e..2f548aa51a30 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
>         const u32 expected[TEST_BUF_SIZE];
>  };
>
> +struct convert_to_gray8_result {
> +       unsigned int dst_pitch;
> +       const u8 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
> @@ -46,6 +51,7 @@ struct convert_xrgb8888_case {
>         struct convert_to_rgb565_result rgb565_result;
>         struct convert_to_rgb888_result rgb888_result;
>         struct convert_to_xrgb2101010_result xrgb2101010_result;
> +       struct convert_to_gray8_result gray8_result;
>  };
>
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
> @@ -71,6 +77,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0x3FF00000 },
>                 },
> +               .gray8_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x4C },
> +               },
>         },
>         {
>                 .name =3D "single_pixel_clip_rectangle",
> @@ -97,6 +107,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_=
cases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0x3FF00000 },
>                 },
> +               .gray8_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x4C },
> +               },
>         },
>         {
>                 /* Well known colors: White, black, red, green, blue, mag=
enta,
> @@ -155,6 +169,15 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0x3FFFFC00, 0x000FFFFF,
>                         },
>                 },
> +               .gray8_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D {
> +                               0xFF, 0x00,
> +                               0x4C, 0x99,
> +                               0x19, 0x66,
> +                               0xE5, 0xB2,
> +                       },
> +               },
>         },
>         {
>                 /* Randomly picked colors. Full buffer within the clip ar=
ea. */
> @@ -206,6 +229,14 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0x2A20300C, 0x1B1705CD, 0x03844672, 0x000=
00000, 0x00000000,
>                         },
>                 },
> +               .gray8_result =3D {
> +                       .dst_pitch =3D 5,
> +                       .expected =3D {
> +                               0x3C, 0x33, 0x34, 0x00, 0x00,
> +                               0x6F, 0x3C, 0x33, 0x00, 0x00,
> +                               0x34, 0x6F, 0x3C, 0x00, 0x00,
> +                       },
> +               },
>         },
>  };
>
> @@ -381,11 +412,42 @@ static void xrgb8888_to_xrgb2101010_test(struct kun=
it *test)
>         KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
>  }
>
> +static void xrgb8888_to_gray8_test(struct kunit *test)
> +{
> +       const struct convert_xrgb8888_case *params =3D test->param_value;
> +       const struct convert_to_gray8_result *result =3D &params->gray8_r=
esult;
> +       size_t dst_size;
> +       __u8 *buf =3D NULL;
> +       __u32 *xrgb8888 =3D NULL;
> +       struct iosys_map dst, src;
> +
> +       struct drm_framebuffer fb =3D {
> +               .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +               .pitches =3D { params->pitch, 0, 0 },
> +       };
> +
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch=
,
> +                                      &params->clip);
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
> +       drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &pa=
rams->clip);
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
>         KUNIT_CASE_PARAM(xrgb8888_to_xrgb2101010_test, convert_xrgb8888_g=
en_params),
> +       KUNIT_CASE_PARAM(xrgb8888_to_gray8_test, convert_xrgb8888_gen_par=
ams),
>         {}
>  };
>
> --
> 2.25.1
>

--00000000000014373005e66a30ee
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAN
hFNOYKEQZJeWFeIYO1imq3Vlj68IuaCg3+/G0Izh1zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA4MTcwNjQzNTFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAANoKP0EV7AJbHIV+gWuS
uV1tBZDbqbqS/8mml3JlQ5J54fvId0pAEM8RqJeacDVByi5/ZztMGKQDkauJfsGUdR3svqoWqr+q
G9gF6hh/vGsadU1V1ejfrHQbK0+oNMcn0qzaQy7FBYW6z6dQzILiKsT6fQEOKmP8UZ5pqxCSoaSN
8+UAxmFErC4nYKRIDB3co1DUolkdMhgf2D4GVU5Q/jXK+yuM9VmpzC85afHs63dagvg9nDzMxFsE
JgLVOG29dlzdmiTrLHOiXk0XlZyd+/5gpPw958nAQjo6GFa8CetWyp8z2dDpSoUOuLmo5A5rs24K
6zXwVJrYWpkpbhrmJg==
--00000000000014373005e66a30ee--
