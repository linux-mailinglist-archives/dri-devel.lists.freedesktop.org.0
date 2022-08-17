Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D1596998
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C0210F8F1;
	Wed, 17 Aug 2022 06:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633C10F8C5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:34:46 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id t21so4839366uaq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=m97G1KuyN56UxuVUV7+nJ4/SqHtWx5n8iCgIQ+T71PY=;
 b=N/IN4KbVgY5leO9ElsIJB2dsuHuPfpzmlHeejQ0+7NueiQT78mZ22MI4MSw+t1tux8
 r2Hwf/hRadSmmxBrFPuPPMNTcPAijnQ0owQZ/Jg7rXzbKnmxoe6s/BbzQ2Mx67A6tBQb
 D3i9/MZGPV68VXQnR9bSuiae28usXCjim7P6xRBBC0UjfNGeKDCBL3+5h5c7saq9xct/
 mbzJNAidRgAcmLrYGugPfCNb8huqNYWxG2zycfmJCtBYkTQO5OvfBAQlWMlM4V5qAp2F
 wEGqPEPoj4oJripufiFKqR6bXej9yBt01ho0lHe2XzW6rhNFw1U2xTbD4aqSXiJchYkP
 B46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=m97G1KuyN56UxuVUV7+nJ4/SqHtWx5n8iCgIQ+T71PY=;
 b=oT36JVP/EPVjeoBBJcdwK0EHvjclGARsH1H8VS9fXH3zYzGNw81IeWTVKS7JIkUJ5L
 viCoPAy2G1HzrFw6VIlXTn10TpVSKH9GdJiHpXpWxRrZh/BcAl0nN3kohgjaAb6PImXY
 hoWIgezpiMDN6n86QN+LHTU12KKcQ3C5Ci27eS8KZWXa96RzlJldjHDwzzqBs6j2znAv
 6MjsTSJqhf3szz/W+v5hQogL32t4PalRCVO7W95YwbwusZxscEeld5hel6mwcGQ0kxhz
 aKgM44DTE/7rGCrfpM+/MTT43OLRXqqlNOKjHhnf4dlBw4Dq3Kv/Iqw1J+ubDs8XcPwr
 YU8Q==
X-Gm-Message-State: ACgBeo3IQ6JjrL5XIsq8GyhaMoK9g7YdpjwYl09wnLU/nXRu3olVMokP
 mlQw+nio3/kcRJRgkm/EqmCFWn8r+spbKEskgxru8g==
X-Google-Smtp-Source: AA6agR6oar65EZGYf1KEkrgIJuPsCHDEPxSpzy9iRlStEnYgfYgoxN86EJ4HKv2MSoPW2McGA8e/2Q+sNbu/zy21WYI=
X-Received: by 2002:ab0:385:0:b0:393:1cee:aad9 with SMTP id
 5-20020ab00385000000b003931ceeaad9mr2183923uau.104.1660718085515; Tue, 16 Aug
 2022 23:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220816102903.276879-1-jose.exposito89@gmail.com>
 <20220816102903.276879-2-jose.exposito89@gmail.com>
In-Reply-To: <20220816102903.276879-2-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Wed, 17 Aug 2022 14:34:33 +0800
Message-ID: <CABVgOSm25=ioOa8q52+5Hd=FVqpzu6A8YW=U0GDOM=mGSFNNeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb888()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000094d18505e66a0f14"
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

--00000000000094d18505e66a0f14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 6:29 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> Extend the existing test cases to test the conversion from XRGB8888 to
> RGB888.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

On the whole, this looks good to me. I'd like to see these tests use
KUNIT_EXPECT_MEMEQ(), but that might have to wait.

One other nitpick below, but otherwise:
Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  .../gpu/drm/tests/drm_format_helper_test.c    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 828487071796..08d08e7ab19a 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -27,6 +27,11 @@ struct convert_to_rgb565_result {
>         const u16 expected_swab[TEST_BUF_SIZE];
>  };
>
> +struct convert_to_rgb888_result {
> +       unsigned int dst_pitch;
> +       const u8 expected[TEST_BUF_SIZE];

Could this maybe be 3*TEST_BUF_SIZE? That should match the other,
existing formats, which have room for TEST_BUF_SIZE pixels worth of
data, not TEST_BUF_SIZE bytes.


> +};
> +
>  struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
> @@ -34,6 +39,7 @@ struct convert_xrgb8888_case {
>         const u32 xrgb8888[TEST_BUF_SIZE];
>         struct convert_to_rgb332_result rgb332_result;
>         struct convert_to_rgb565_result rgb565_result;
> +       struct convert_to_rgb888_result rgb888_result;
>  };
>
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
> @@ -51,6 +57,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .expected =3D { 0xF800 },
>                         .expected_swab =3D { 0x00F8 },
>                 },
> +               .rgb888_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x00, 0x00, 0xFF },
> +               },
>         },
>         {
>                 .name =3D "single_pixel_clip_rectangle",
> @@ -69,6 +79,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>                         .expected =3D { 0xF800 },
>                         .expected_swab =3D { 0x00F8 },
>                 },
> +               .rgb888_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D { 0x00, 0x00, 0xFF },
> +               },
>         },
>         {
>                 /* Well known colors: White, black, red, green, blue, mag=
enta,
> @@ -109,6 +123,15 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0xE0FF, 0xFF07,
>                         },
>                 },
> +               .rgb888_result =3D {
> +                       .dst_pitch =3D 0,
> +                       .expected =3D {
> +                               0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
> +                               0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00,
> +                               0xFF, 0x00, 0x00, 0xFF, 0x00, 0xFF,
> +                               0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
> +                       },
> +               },
>         },
>         {
>                 /* Randomly picked colors. Full buffer within the clip ar=
ea. */
> @@ -141,6 +164,17 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                                 0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
>                         },
>                 },
> +               .rgb888_result =3D {
> +                       .dst_pitch =3D 15,
> +                       .expected =3D {
> +                               0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11, 0x03,=
 0x03, 0xA8,
> +                               0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                               0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E, 0x05,=
 0x4D, 0x11,
> +                               0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                               0x03, 0x03, 0xA8, 0x73, 0x70, 0x6C, 0x9C,=
 0x44, 0x0E,
> +                               0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                       },
> +               },
>         },
>  };
>
> @@ -255,9 +289,40 @@ static void xrgb8888_to_rgb565_test(struct kunit *te=
st)
>         KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size=
), 0);
>  }
>
> +static void xrgb8888_to_rgb888_test(struct kunit *test)
> +{
> +       const struct convert_xrgb8888_case *params =3D test->param_value;
> +       const struct convert_to_rgb888_result *result =3D &params->rgb888=
_result;
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
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_RGB888, result->dst_p=
itch,
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
> +       drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &p=
arams->clip);
> +       KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;

At some point, this should use KUNIT_EXPECT_MEMEQ() rather than
KUNIT_EXPECT_EQ(..., memcmp(...), 0):
https://lore.kernel.org/all/20220808125237.277126-1-mairacanal@riseup.net/

Of course, since that's not upstream yet (and  probably will go in via
a different tree), it's fine to leave this as-is in this patch, and
tidy it up after they're merged.

> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_pa=
rams),
>         KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_pa=
rams),
> +       KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_pa=
rams),
>         {}
>  };
>
> --
> 2.25.1
>

--00000000000094d18505e66a0f14
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBm
xxX4PqX1/OcZdIl/r4d9UDYm2BWOAR90X3McHe47izAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA4MTcwNjM0NDVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAlJYd7/GhZ/t94UyiqWVz
pxMmsX6H5PypS1zwkCUn0TLhOVrBNHqdit6bFwbc3DpHExo1GAmEqJj7JxTcSpqoExOABpT65ZdB
yABHrB96wUF2/L87fnZIH4qOjH0B/7qGKle92JZjSTchCtPA2mQAUZZ/PqsCtC75x99VBcWLf7eI
pv0elpg9cyheF5ZgMDGK7zk01lEL35sWYwSmu2nPYCr9U1oOlvNbBW/JaTKkk34mmiGLRw7BfZRd
1YmkaCiVVsHrV46mhj9V+leFb8JCQfr6GsI10mggCwCijpT1uiZq7xY4k1NYgO8YKlQJMuuda5jV
zmDyA1OmH6L23KeZ2Q==
--00000000000094d18505e66a0f14--
