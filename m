Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E123A576F59
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F681127F6;
	Sat, 16 Jul 2022 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AE510E0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 09:32:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q9so9793022wrd.8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpyRhxVOAw0+FBiBmSlfqruGt8tDAvWc+k0qaDvUyw8=;
 b=U376b61VnGMrJvaYihP8YnKXeNPhSSlgCqQ/P2vFr/eoFMO5D2GtRXdQD3QW6ZomtD
 lwLGl6o2nn3jTSBKmk4IMNBAYH1uR1RgHwwelmq4gJ5HvX9tTHi06gS3ixVh9eqmK4Z1
 Gk8gMiirpVSGg4fH2hUK0OM35gN4O3LCVW+EVJ5RlQffqE/d6mwScyH6O2UAJPp5V9Ah
 bryK3zneJS+YdEMBkJwTWoOlJeFDhhCX/xowqhngaEmqh4BcmFUCFcxponXiwaWLcRWh
 s8z0fixInBMhNL60fgH0WxK6CckOg3AKs7DnfDc0PkZIcLLHax/p1AcEM9x0IfdMvCeI
 OdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpyRhxVOAw0+FBiBmSlfqruGt8tDAvWc+k0qaDvUyw8=;
 b=kLw6UEcVIYxHIZRMPDLc3NPlj2BpCPqMMtSug2WvWJX/uJ9cCVRZHBJQx5IKqvzSW8
 jGgPxihJrIwWds4aKWz1Rm2FBd/pHE+NoModdtUWDC/gBLy7mN15bILhqnglKdtz4ub8
 CjLvbU5WFvON16fEbS0HVm9G+NtIZ02Q67PzypQB3lzHp396zmhHzgadwWxw/yhNUub4
 0b5UrGNQPyYGGWR87jul07tFdnPJ8BFqCA021byyW5oVoMTUUAQ2Ptab97xmdYVJtfZO
 TC1wOPhl+5JbJhnTyu8mAhJY7/EHbDsiUJZnT6ASKA1jYya6W85Lz2JN5V6czBKn2LzE
 kPsA==
X-Gm-Message-State: AJIora9W/sfAPd23GrAAx04AwKIeCvjQtkNF1mI+KIbk2Bf0L+wp5UBP
 eQgzr6eRld/rEp3fDAKif55DtO2PCq3BClVVBJW/yA==
X-Google-Smtp-Source: AGRyM1summfnIu3TqgbWBvwhtJvPBKZY/jnw9uchFStXcGhPyhZ3+MaioTu6ksYWJp6mCpMwDZFODsBhVnPeQNmpEbE=
X-Received: by 2002:a05:6000:2ab:b0:21d:b410:5999 with SMTP id
 l11-20020a05600002ab00b0021db4105999mr15633161wry.517.1657963974012; Sat, 16
 Jul 2022 02:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-3-jose.exposito89@gmail.com>
In-Reply-To: <20220709115837.560877-3-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 16 Jul 2022 17:32:42 +0800
Message-ID: <CABVgOSmNroVNyLMdaU3b77G=HRgS9J6hvx9UWAyA28P_kZuONw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/format-helper: Rename test cases to make them
 more generic
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000bcda1005e3e8d1a3"
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

--000000000000bcda1005e3e8d1a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 9, 2022 at 7:58 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> The tests available at the moment only check the conversion from
> XRGB8888 to RGB332. However, more conversions will be tested in the
> future.
>
> In order to make the struct and functions present in the tests more
> generic, rename xrgb8888_to_rgb332_* to convert_xrgb8888_*.
>
> Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Looks good to me from the KUnit point of view.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  drivers/gpu/drm/tests/drm_format_helper_test.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 4d074c2e48bf..f66aaa0e52c9 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -16,7 +16,7 @@
>
>  #define TEST_BUF_SIZE 50
>
> -struct xrgb8888_to_rgb332_case {
> +struct convert_xrgb8888_case {
>         const char *name;
>         unsigned int pitch;
>         unsigned int dst_pitch;
> @@ -25,7 +25,7 @@ struct xrgb8888_to_rgb332_case {
>         const u8 expected[4 * TEST_BUF_SIZE];
>  };
>
> -static struct xrgb8888_to_rgb332_case xrgb8888_to_rgb332_cases[] =3D {
> +static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
>         {
>                 .name =3D "single_pixel_source_buffer",
>                 .pitch =3D 1 * 4,
> @@ -126,18 +126,18 @@ static u32 *le32buf_to_cpu(struct kunit *test, cons=
t u32 *buf, size_t buf_size)
>         return dst;
>  }
>
> -static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case =
*t,
> -                                        char *desc)
> +static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
> +                                      char *desc)
>  {
>         strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>  }
>
> -KUNIT_ARRAY_PARAM(xrgb8888_to_rgb332, xrgb8888_to_rgb332_cases,
> -                 xrgb8888_to_rgb332_case_desc);
> +KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_cases,
> +                 convert_xrgb8888_case_desc);
>
>  static void xrgb8888_to_rgb332_test(struct kunit *test)
>  {
> -       const struct xrgb8888_to_rgb332_case *params =3D test->param_valu=
e;
> +       const struct convert_xrgb8888_case *params =3D test->param_value;
>         size_t dst_size;
>         __u8 *dst =3D NULL;
>         __u32 *src =3D NULL;
> @@ -163,8 +163,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *tes=
t)
>  }
>
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
> -       KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
> -                        xrgb8888_to_rgb332_gen_params),
> +       KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_pa=
rams),
>         {}
>  };
>
> --
> 2.25.1
>

--000000000000bcda1005e3e8d1a3
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCA/
cdEVOC4AO37QkqFFEQwGQoAqRnZsYlJjRUOaTcMU+zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MTYwOTMyNTRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAjQVwTM+UWzAUs/HQKUaF
pcQg+HX8oXyqSkY7jw6PdZh6oAcyxneKeU9Ze9FzjaEvB5j4ueruQQSOuXje/CKJRKORuFNPc57d
q0/Ch5+sIwczcLCSy5AQa0jrvoRb/IAZSQaoGMkq38Dp3t32iyh/aVZB7MVvuAOWtMRD4yQMVDNu
8N4tg8osXQI5RisDeWyXS+aMkBn1Ee0FfrdZdl8yH4I8kvxgrreK9UAgD9TABs/KnUaFmR40tSR/
wnNJ92G5HXX+hzi+ZQoU92nKB2e1K6gEddlbnL3wUZji+8tWZOuC9kfLJorTZM53CnTj3M4PYebj
16blfiE8Mb0xNIlGMA==
--000000000000bcda1005e3e8d1a3--
