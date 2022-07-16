Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FE576F4C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DF510F69E;
	Sat, 16 Jul 2022 14:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193FA10E0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 09:32:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id b6so3598924wmq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1OQQw8JeGf00YskKGlyiaZsqa97/aua0r8S506ADk8=;
 b=SzBlSwnX2JkSaEZZSNFKWItFCTSfivo6LYYD1hlPkmbX5qlcbLU53VnP9s9E7krpWz
 2P+3FuSWmS1vocg8GnSqUZdeM+sqGSMIft88SJD3IWme/BJCL2o6gXEwAFaK5o6VW3ch
 4N1jw2ZJK3fw1NOqL4HpSlnTjJNPF/4Yb2SA7pqUEXThJ0GcOAW+kPWZkVhQUNd9ul2/
 bKQdBMFxiIT97/WNK/ZQZ0GzsJh224zLQtPsHyMxx0/ldHLv5s2un2Xb/g6Yt6pAY23D
 K1OGFD1QULR9fM3Xq6r/YqY5/ctownBb+HCGb3KjozKCCS+pM8QKFgMARzFTuNq989QP
 FY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1OQQw8JeGf00YskKGlyiaZsqa97/aua0r8S506ADk8=;
 b=V3QPXBMYi38pYXg0cQ/nZtJwjMPMThe16ElPeAA3OoZFHdXinxHZYRxqnf1qCDr37/
 fW8L4D/yMM0u/G1LbPo3D31J8jSOEs5gYK64M0BKPoZlhfpGqsjuBJVvG6OXEtVcDIlO
 uNLJYix4HfO/1uMQibU8OIVy6a/YlVseAZsstCDWNKMFWRVmFlSb+kTgCq7kQTe4oXbI
 qp/eIwNsSJY0tr2PWJHXzRlLZrkWb9ffcgG+Xr+Vw/c3tuyLHLSLyQ3rNa9sJS99b/XS
 rvSx3tDy8i7aLfjRnZ5KPaysGptz4RQohmG7ecx8WPleXk+y1y67EgJx3f40RtJsweBu
 jmOQ==
X-Gm-Message-State: AJIora+z2cp6jgLZmbUJkdlSm2vl4Mp61tv8kCa14G3eAdBjM9erYEc9
 zlWgqFUNbzz2xB42M9d48yExIhgvoKaFPgwC0dfQHA==
X-Google-Smtp-Source: AGRyM1tDo/ZXWn/brdHWnktiZDXwYFhv8+nr+N1DmsiI8lC/A24HpLoNnkV/wM32MnhQTRjkTUsp/mknUGAdnSrscy4=
X-Received: by 2002:a7b:c8d1:0:b0:3a2:e502:79c0 with SMTP id
 f17-20020a7bc8d1000000b003a2e50279c0mr17832619wml.196.1657963957400; Sat, 16
 Jul 2022 02:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-2-jose.exposito89@gmail.com>
In-Reply-To: <20220709115837.560877-2-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 16 Jul 2022 17:32:26 +0800
Message-ID: <CABVgOSmj=SMAcfxN__x2r0GJ5otHjn3YdG-oQi1TN80T3W3gUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Fix test on big endian
 architectures
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000bfe63105e3e8d0a9"
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

--000000000000bfe63105e3e8d0a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 9, 2022 at 7:58 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> The tests fail on big endian architectures, like PowerPC:
>
>  $ ./tools/testing/kunit/kunit.py run \
>    --kunitconfig=3Ddrivers/gpu/drm/tests \
>    --arch=3Dpowerpc --cross_compile=3Dpowerpc64-linux-gnu-
>
> Transform the XRGB8888 buffer from little endian to the CPU endian
> before calling the conversion function to avoid this error.
>
> Fixes: 8f456104915f ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8=
888_to_rgb332()")
> Reported-by: David Gow <davidgow@google.com>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Thanks: I can confirm this now works on big-endian setups.

It might be worth using the __le32 type so that tools like 'sparse'
can verify the expected endianness. At the moment, sparse does
complain about this:

../drivers/gpu/drm/tests/drm_format_helper_test.c:181:26: warning:
cast to restricted __le32

Basically, this would involve replacing the u32 types with __le32 for
things you know to be little-endian. You can then run sparse over the
code with:

./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/tests \
 --arch=3Dpowerpc --cross_compile=3Dpowerpc64-linux-gnu- \
--make_options C=3D2 --make_options CF=3D-D__CHECK_ENDIAN__

Otherwise, this looks good to me, thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  .../gpu/drm/tests/drm_format_helper_test.c    | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 98583bf56044..4d074c2e48bf 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -111,6 +111,21 @@ static size_t conversion_buf_size(u32 dst_format, un=
signed int dst_pitch,
>         return dst_pitch * drm_rect_height(clip);
>  }
>
> +static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t bu=
f_size)
> +{
> +       u32 *dst =3D NULL;
> +       int n;
> +
> +       dst =3D kunit_kzalloc(test, buf_size, GFP_KERNEL);
> +       if (!dst)
> +               return NULL;
> +
> +       for (n =3D 0; n < buf_size; n++)
> +               dst[n] =3D le32_to_cpu(buf[n]);
> +
> +       return dst;
> +}
> +
>  static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case =
*t,
>                                          char *desc)
>  {
> @@ -125,6 +140,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *tes=
t)
>         const struct xrgb8888_to_rgb332_case *params =3D test->param_valu=
e;
>         size_t dst_size;
>         __u8 *dst =3D NULL;
> +       __u32 *src =3D NULL;
>
>         struct drm_framebuffer fb =3D {
>                 .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> @@ -138,8 +154,11 @@ static void xrgb8888_to_rgb332_test(struct kunit *te=
st)
>         dst =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
>
> -       drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb888=
8,
> -                                 &fb, &params->clip);
> +       src =3D le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
> +
> +       drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, src, &fb,
> +                                 &params->clip);
>         KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0)=
;
>  }
>
> --
> 2.25.1
>

--000000000000bfe63105e3e8d0a9
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCz
QLDdNACO+JsEfyGePYWkoniu944ej9UGdKyanvpTWDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MTYwOTMyMzdaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAKr9gfxl+NIqeySNv+XUe
Rrv/yfRXlJOHOmQ+lk5tV3qV0kTVr7bZ/dscRq8M+eQksjHBcmOXRwJtUKds76gTqMwAVg2Ns3bc
QUpCsVUTKislJODWqhtxKquZGpVb8C5FuPLneOvivFIyn2CvjsRnLqO8M1JWrJILTU/LeX95D4/D
ZxaxRUYlEOkqualV7726OAA+szCK6oJ8jtnFKwj+X706LFfgA6YPBW2SupipoidV6eNzfaRJx9+8
kjADXkkCZETZbegpezT3nme4mmvuCMy3IhRFNmgn+t8DMdc6tGI8pbpjZGVEmLQf3nA9O3IjocO/
Q42IjgOMC1F89M1vAA==
--000000000000bfe63105e3e8d0a9--
