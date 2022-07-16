Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782D576F5A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467610F4F5;
	Sat, 16 Jul 2022 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9223210E111
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 09:32:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r14so9831864wrg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmxssdeGBWPWgPuyJS6m5AUf2MYdv18zgChwPpwW4zc=;
 b=JtJaYQpWFtOI48afEVjqiUjEgKHhCSB2vY/NOFEtB3bpvTFs8TNs7sTFugY5ae+QT2
 IfcIixekJyilo3lHUHRSO3/NPmhuR3LN7rZKXICGxc/7MLNnsvJ3wr3/7kw8/p9Y/PDF
 nIWt9sbj+kxDpIr1ktplMGZ6115FdF19G9Vcvv00Zm36KLuuyyS1WVZwxs7zgK0C2JHL
 mh0ZDFuUau+jG7LKHE3URF2GRlfrtZQ+4A9IGNOkMb44T2FQDsjR+deE24GfEbboNZnu
 lNzLAKpILtFTc/iEccEMDPcf5W6kxis9ejqRBMaVlFVFE5y5m44yHQcjnxoef52XQsG9
 ojKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmxssdeGBWPWgPuyJS6m5AUf2MYdv18zgChwPpwW4zc=;
 b=tbFoEYTz5Fi7OqYWkP5pEkpLhWh8zaCGJfNhrGlV1qcpznzCWBOlCH0YcKDqW/FCYq
 kjByfy7tQEerGuSYSAt/b9BqkP8VELvjWYHocOcyu1h+enbVxMRPId7Y0oxuZGaWBM94
 XyCa+uhlwpLXm0JET4hTsuv+YZ5oOfw3OowzLhIJWwzhMJ7FW9CJPt5Zyl+gXQwpdgOG
 AFwDkaKGcRSJk22iy3qMaJztOgjPAHdGCrV6/A9Tu9WMpxqsI/Di0fJH55Dq6ZiUBwId
 8px7Ly3oBDE08ulRhBA74H1kihVCENyzfK5vSjGriNaOpLHAp3pPVSCnf8rC2WI5mVSW
 BQ5w==
X-Gm-Message-State: AJIora87Kt7nL/tqjGsQG/v3ur0HxqMtv7oiEia1oNg/LJ7/gG59HWf+
 cC6NMY+o3pcK2Mtchk+yule0L+bZk10qo+U30+xQ7Q==
X-Google-Smtp-Source: AGRyM1vKL6BCiCzeLOaIkuPyxrKrN1Jf7xBXnKhfql86nf0W51V1CxNGp5N0PwXYRAJWS4vsy0VZCq5u0ZuefBnuYIw=
X-Received: by 2002:a5d:64e1:0:b0:21d:80d0:a09d with SMTP id
 g1-20020a5d64e1000000b0021d80d0a09dmr15992709wri.433.1657963965044; Sat, 16
 Jul 2022 02:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-4-jose.exposito89@gmail.com>
In-Reply-To: <20220709115837.560877-4-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 16 Jul 2022 17:32:33 +0800
Message-ID: <CABVgOSmMZfsmAq4zw2a2X0jmmMuDky6_-jbGUA+fGOJ=UUqa4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/format-helper: Support multiple target formats
 results
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000033e81805e3e8d1c8"
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

--00000000000033e81805e3e8d1c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 9, 2022 at 7:58 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> In order to support multiple destination format conversions, store the
> destination pitch and the expected result in its own structure.
>
> Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Looks good to me. You could probably merge this with the previous
patch if you wanted to, IMO, but it's also fine like this.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  .../gpu/drm/tests/drm_format_helper_test.c    | 53 ++++++++++++-------
>  1 file changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index f66aaa0e52c9..0a490ad4fd32 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -16,34 +16,42 @@
>
>  #define TEST_BUF_SIZE 50
>
> +struct convert_to_rgb332_result {
> +       unsigned int dst_pitch;
> +       const u8 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
> -       unsigned int dst_pitch;
>         struct drm_rect clip;
>         const u32 xrgb8888[TEST_BUF_SIZE];
> -       const u8 expected[4 * TEST_BUF_SIZE];
> +       struct convert_to_rgb332_result rgb332_result;
>  };
>
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
>         {
>                 .name =3D "single_pixel_source_buffer",
>                 .pitch =3D 1 * 4,
> -               .dst_pitch =3D 0,
>                 .clip =3D DRM_RECT_INIT(0, 0, 1, 1),
>                 .xrgb8888 =3D { 0x01FF0000 },
> -               .expected =3D { 0xE0 },
> +               .rgb332_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0xE0 },
> +               },
>         },
>         {
>                 .name =3D "single_pixel_clip_rectangle",
>                 .pitch =3D 2 * 4,
> -               .dst_pitch =3D 0,
>                 .clip =3D DRM_RECT_INIT(1, 1, 1, 1),
>                 .xrgb8888 =3D {
>                         0x00000000, 0x00000000,
>                         0x00000000, 0x10FF0000,
>                 },
> -               .expected =3D { 0xE0 },
> +               .rgb332_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0xE0 },
> +               },
>         },
>         {
>                 /* Well known colors: White, black, red, green, blue, mag=
enta,
> @@ -52,7 +60,6 @@ static struct convert_xrgb8888_case convert_xrgb8888_ca=
ses[] =3D {
>                  */
>                 .name =3D "well_known_colors",
>                 .pitch =3D 4 * 4,
> -               .dst_pitch =3D 0,
>                 .clip =3D DRM_RECT_INIT(1, 1, 2, 4),
>                 .xrgb8888 =3D {
>                         0x00000000, 0x00000000, 0x00000000, 0x00000000,
> @@ -61,28 +68,33 @@ static struct convert_xrgb8888_case convert_xrgb8888_=
cases[] =3D {
>                         0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
>                         0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
>                 },
> -               .expected =3D {
> -                       0xFF, 0x00,
> -                       0xE0, 0x1C,
> -                       0x03, 0xE3,
> -                       0xFC, 0x1F,
> +               .rgb332_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D {
> +                               0xFF, 0x00,
> +                               0xE0, 0x1C,
> +                               0x03, 0xE3,
> +                               0xFC, 0x1F,
> +                       },
>                 },
>         },
>         {
>                 /* Randomly picked colors. Full buffer within the clip ar=
ea. */
>                 .name =3D "destination_pitch",
>                 .pitch =3D 3 * 4,
> -               .dst_pitch =3D 5,
>                 .clip =3D DRM_RECT_INIT(0, 0, 3, 3),
>                 .xrgb8888 =3D {
>                         0xA10E449C, 0xB1114D05, 0xC1A80303,
>                         0xD16C7073, 0xA20E449C, 0xB2114D05,
>                         0xC2A80303, 0xD26C7073, 0xA30E449C,
>                 },
> -               .expected =3D {
> -                       0x0A, 0x08, 0xA0, 0x00, 0x00,
> -                       0x6D, 0x0A, 0x08, 0x00, 0x00,
> -                       0xA0, 0x6D, 0x0A, 0x00, 0x00,
> +               .rgb332_result =3D {
> +                       .dst_pitch =3D 5,
> +                       .expected =3D {
> +                               0x0A, 0x08, 0xA0, 0x00, 0x00,
> +                               0x6D, 0x0A, 0x08, 0x00, 0x00,
> +                               0xA0, 0x6D, 0x0A, 0x00, 0x00,
> +                       },
>                 },
>         },
>  };
> @@ -138,6 +150,7 @@ KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_=
cases,
>  static void xrgb8888_to_rgb332_test(struct kunit *test)
>  {
>         const struct convert_xrgb8888_case *params =3D test->param_value;
> +       const struct convert_to_rgb332_result *result =3D &params->rgb332=
_result;
>         size_t dst_size;
>         __u8 *dst =3D NULL;
>         __u32 *src =3D NULL;
> @@ -147,7 +160,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *tes=
t)
>                 .pitches =3D { params->pitch, 0, 0 },
>         };
>
> -       dst_size =3D conversion_buf_size(DRM_FORMAT_RGB332, params->dst_p=
itch,
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_RGB332, result->dst_p=
itch,
>                                        &params->clip);
>         KUNIT_ASSERT_GT(test, dst_size, 0);
>
> @@ -157,9 +170,9 @@ static void xrgb8888_to_rgb332_test(struct kunit *tes=
t)
>         src =3D le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
>
> -       drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, src, &fb,
> +       drm_fb_xrgb8888_to_rgb332(dst, result->dst_pitch, src, &fb,
>                                   &params->clip);
> -       KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0)=
;
> +       KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0)=
;
>  }
>
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
> --
> 2.25.1
>

--00000000000033e81805e3e8d1c8
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBa
ss6YU53KJwoqT/C6T3M2/7unUWLOiQxO6NZObdXHtTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MTYwOTMyNDVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAWfgZRRgQh7iw5DjiMqZe
5dv4a/lJ/VuGIG6kfgyTMcqFPd5FGz0dQcm+wHOn/+X3GYvS+XX/tNCG1S6MBo0+JhojtVBpmcxX
20R85h8NHQ3VMyd/B+gclYtq840D6jy3oHdE5lm85YrOQBeFoUgk9io8yq2AM6RphdCbBi1CruI6
Cq0AX4eylgJ+em0BawPXbvlJDKI6qRI1QflQc8CgfiY4BWEkwT2XovFSyrnc0lhTdMqKtf+759Vj
ufAuOXLsaqk1639crUrEP/7a+n+JweNqCkNx9iaudm0T1tlEouithqAIurrQuxqV5vh0SFBMvKYn
q3cvTmrpXUTiq2eWog==
--00000000000033e81805e3e8d1c8--
