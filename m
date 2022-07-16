Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B88576F54
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B9110F360;
	Sat, 16 Jul 2022 14:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AF010E0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 09:33:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o8so4130786wms.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 02:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSRrYTHTOCPW6A8KnGxPdoyyI8rFFZEqU5rgpIUGJ2M=;
 b=iWdkMblvITx6Ax14UV8fuK60dnztv5v5LZ4JH6ZKNDlP5vdzfytdrUohVufQ2vwiRp
 2pJe6dKrai6049IPNthid9zt0x07Kdaf9gAKurTYB687KCLQhf1T/0IYcHV+bu5IqOTy
 MYDEXiVBAuRiPrPLG7bDoWXsMTiW5ewKM/PquX4pI0v21mUZ7ChG3/6W0W05p9TGiH8o
 HyFwC3a513f0BjBkUBB22+InklA4zXiXO+A23/u/SB08lX7EnorwqN04ZpDXio/o9H5g
 lcmfDO44pGkBxm1vt7ws8PQaVNA+kKx2vNjU6DSYHrPGF617iF+kdeumfEXtPYk+k2EA
 y+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSRrYTHTOCPW6A8KnGxPdoyyI8rFFZEqU5rgpIUGJ2M=;
 b=Kvnt8Okr30qx8h5hd20vDXEX41izJ//TlxvM1q5Qnsp/eg+o3ZIrJe9Htju02VbJHV
 Wy4XKUPT8bhB8tw7GkLqwcHeN/HR8bU1uvRK/H9YPM51dZ6+1LZGQ2UFtKk97jInRbku
 0n4WdgCSDHfcyASBjpSRaHjU69zwyJuBm7UyBNiugIIc/khEyu9Q2GLcyjGdYADMZSbk
 hS411SkAjrZbuUqbiwmnwUbSYGZplaY0d4bzZumfdfY6ZzMPN58BiTIJAOm9ZBI6ML/b
 KD4jArwY+Yv4Vb8k2t636CCZ9WP+hs4jQE53eV6+vziV0UJ2P1bnrKeQ8tGzPT+dm0i5
 XTuQ==
X-Gm-Message-State: AJIora+f8TQW7rsU9D3SlA3jeY14D/K/p73Q4yBqewdNFks1Kmz+RKL2
 kfM3FjTTXPxHlwgZ+7oele0a51GTOU+UPHoxkby0Hg==
X-Google-Smtp-Source: AGRyM1tNeS5k/SDblsJe4hiov0HrdwLQDGA8Kuhys141gwIsundY9b1Ah87XFPfSwvLN/LopcdrCcvba9Tl8KCzQRsk=
X-Received: by 2002:a7b:ce06:0:b0:3a0:39e0:b322 with SMTP id
 m6-20020a7bce06000000b003a039e0b322mr24737064wmc.55.1657963982253; Sat, 16
 Jul 2022 02:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
In-Reply-To: <20220709115837.560877-5-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 16 Jul 2022 17:32:51 +0800
Message-ID: <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000003b514e05e3e8d2b8"
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
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003b514e05e3e8d2b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 9, 2022 at 7:58 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> Extend the existing test cases to test the conversion from XRGB8888 to
> RGB565.
>
> The documentation and the color picker available on [1] are useful
> resources to understand this patch and validate the values returned by
> the conversion function.
>
> Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Link: http://www.barth-dev.de/online/rgb565-color-picker/ # [1]
> ---

Looks good and passes here.

Reviewed-by: David Gow <davidgow@google.com>

Thanks,
-- David


>  .../gpu/drm/tests/drm_format_helper_test.c    | 76 ++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 0a490ad4fd32..c0592c1235cf 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -21,12 +21,19 @@ struct convert_to_rgb332_result {
>         const u8 expected[TEST_BUF_SIZE];
>  };
>
> +struct convert_to_rgb565_result {
> +       unsigned int dst_pitch;
> +       const u16 expected[TEST_BUF_SIZE];
> +       const u16 expected_swab[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
>         struct drm_rect clip;
>         const u32 xrgb8888[TEST_BUF_SIZE];
>         struct convert_to_rgb332_result rgb332_result;
> +       struct convert_to_rgb565_result rgb565_result;
>  };
>
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
> @@ -39,6 +46,11 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0xE0 },
>                 },
> +               .rgb565_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0xF800 },
> +                       .expected_swab =3D { 0x00F8 },
> +               },
>         },
>         {
>                 .name =3D "single_pixel_clip_rectangle",
> @@ -52,6 +64,11 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .dst_pitch =3D 0,
>                         .expected =3D { 0xE0 },
>                 },
> +               .rgb565_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0xF800 },
> +                       .expected_swab =3D { 0x00F8 },
> +               },
>         },
>         {
>                 /* Well known colors: White, black, red, green, blue, mag=
enta,
> @@ -77,6 +94,21 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                                 0xFC, 0x1F,
>                         },
>                 },
> +               .rgb565_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D {
> +                               0xFFFF, 0x0000,
> +                               0xF800, 0x07E0,
> +                               0x001F, 0xF81F,
> +                               0xFFE0, 0x07FF,
> +                       },
> +                       .expected_swab =3D {
> +                               0xFFFF, 0x0000,
> +                               0x00F8, 0xE007,
> +                               0x1F00, 0x1FF8,
> +                               0xE0FF, 0xFF07,
> +                       },
> +               },
>         },
>         {
>                 /* Randomly picked colors. Full buffer within the clip ar=
ea. */
> @@ -96,6 +128,19 @@ static struct convert_xrgb8888_case convert_xrgb8888_=
cases[] =3D {
>                                 0xA0, 0x6D, 0x0A, 0x00, 0x00,
>                         },
>                 },
> +               .rgb565_result =3D {
> +                       .dst_pitch =3D 10,
> +                       .expected =3D {
> +                               0x0A33, 0x1260, 0xA800, 0x0000, 0x0000,
> +                               0x6B8E, 0x0A33, 0x1260, 0x0000, 0x0000,
> +                               0xA800, 0x6B8E, 0x0A33, 0x0000, 0x0000,
> +                       },
> +                       .expected_swab =3D {
> +                               0x330A, 0x6012, 0x00A8, 0x0000, 0x0000,
> +                               0x8E6B, 0x330A, 0x6012, 0x0000, 0x0000,
> +                               0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
> +                       },
> +               },
>         },
>  };
>
> @@ -120,7 +165,7 @@ static size_t conversion_buf_size(u32 dst_format, uns=
igned int dst_pitch,
>         if (!dst_pitch)
>                 dst_pitch =3D drm_rect_width(clip) * dst_fi->cpp[0];
>
> -       return dst_pitch * drm_rect_height(clip);
> +       return (dst_pitch * drm_rect_height(clip)) / (dst_fi->depth / 8);
>  }
>
>  static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t bu=
f_size)
> @@ -175,8 +220,37 @@ static void xrgb8888_to_rgb332_test(struct kunit *te=
st)
>         KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0)=
;
>  }
>
> +static void xrgb8888_to_rgb565_test(struct kunit *test)
> +{
> +       const struct convert_xrgb8888_case *params =3D test->param_value;
> +       const struct convert_to_rgb565_result *result =3D &params->rgb565=
_result;
> +       size_t dst_size;
> +       __u16 *dst =3D NULL;
> +
> +       struct drm_framebuffer fb =3D {
> +               .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +               .pitches =3D { params->pitch, 0, 0 },
> +       };
> +
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_RGB565, result->dst_p=
itch,
> +                                      &params->clip);
> +       KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +       dst =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
> +
> +       drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, params->xrgb888=
8, &fb,
> +                                 &params->clip, false);
> +       KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0)=
;
> +
> +       drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, params->xrgb888=
8, &fb,
> +                                 &params->clip, true);
> +       KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected_swab, dst_size=
), 0);
> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_pa=
rams),
> +       KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_pa=
rams),
>         {}
>  };
>
> --
> 2.25.1
>

--0000000000003b514e05e3e8d2b8
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBs
nigxcoMNZjhWoKRJ6Fblw2M4ge9J/wZ0W9G9hUORazAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MTYwOTMzMDJaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAeiLZClxOliAyKAy9DPoS
9i1rIAz3jZN1t83Cyl15PC3AO9/uS+b2Yea2yCVvqDVruU4Qal90QvxMu6f+ltyIad2IM2DNL6mi
Itz9EMrYDbXHkfxoKCig0iskNA1BedVfCnHbu1A4oKd1fsroSiC1vLWN46hU2+9ebhgezJ9qqP+w
0a0zmG6ntzpCBHjxFp9jg9//UHIY0DMkw4q5DoFdDur8TP3DT7v40mUQEuCykJI9Kvnt6iGnHtoa
lLk7Hd+xvAg75BVntd+JmklSikvCh/C9Qeogvafl4TRJC1nsRXNsn34/k9hYthSg/KTEFSbFRQwL
Qb4kdxcIbbA8R/K7Aw==
--0000000000003b514e05e3e8d2b8--
