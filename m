Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D2552E94
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B3F10F0D0;
	Tue, 21 Jun 2022 09:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4410F0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:38:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i81-20020a1c3b54000000b0039c76434147so9005941wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rG7cdlaZzsvS+/wcRKa5BbOU73ovs22jhRt3+Ctv/yI=;
 b=T+boi+A++5/+lX8Q+Ww/GQZ/mzKRMGdI24tbFLYKf8Z9t9gaFw6o8b2HKCZsCBjegQ
 CgVZ6dWLAZMBgzfbMWJjNmz3pGhL/KUNOxGEGMzRC3lN3Nr0oQZXRFSLTh7MMfsjAbJH
 Szu+M2MD7BG5hi5tMSNJV6fLsxLAOM35g+oARFfMUTdPpJwrcnH+l9Rno3oi7E1WB1Bu
 ayRE1gHlAfu/b3UVgWdRAv9ECioVFsoc3r3R13S1c6ERN8im7AKT4vWDc0yg0z6fjAD8
 WC82I6aoJlJBZo59n9+7ztcPavSrmRKRrjbT7bbsw3niDWilzGQK1NelgoI1MbedHKbj
 mC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rG7cdlaZzsvS+/wcRKa5BbOU73ovs22jhRt3+Ctv/yI=;
 b=sUQ5QPUOxP8UAZBc2tpaDC0dTnyXEmJrsWLMrLpeXx76+8LBsAS5D5vEu6Q2nM81Qu
 LZ1UpVLs6EDziLRuSUz2BjAoWMx0lZ4JoopkVS8t3yR9viyTRXniA3/jqF5dG342X6/V
 2ta/9HDyXy2agka2VQ6bDpqXAvR9iiZhwq/4cn0IbSTY31+6FWxhtzZhRNhnUqKl7x1W
 +JwtcCI+o4UL3pVM44HKdxn39JnkqOyruZbwxpVVQh/5NjboGQ7cQ0Tc0e0bMXp+o8n2
 zDoHzsnL/nXQSFWqw04qUP7xAAGGnezCPS8g/cRBCv02zTlIl0JyYkWBMRizloBHIwNT
 e3Fg==
X-Gm-Message-State: AOAM532iP33vQTEEdGJtWT4/069uQhUrZ/O6Tddawn79P7ewv7JDGw26
 rUJMyPswSx6eZVwv4K1Ct9LCB5RzYLKYvqSCQ2enKA==
X-Google-Smtp-Source: ABdhPJwTHofpmOSIaU6nuTZiYCVo8t0WXtDq/8OyIrHTzJ5w2YzZPp4o8NdJ3c2Enyc+y7QQqDBorPuvt8d4H9ps5Dk=
X-Received: by 2002:a05:600c:294a:b0:39c:4df5:f825 with SMTP id
 n10-20020a05600c294a00b0039c4df5f825mr39662307wmd.55.1655804324611; Tue, 21
 Jun 2022 02:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-3-jose.exposito89@gmail.com>
In-Reply-To: <20220620160640.3790-3-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 21 Jun 2022 17:38:33 +0800
Message-ID: <CABVgOSmntjTF3fU9NJ_qwxbOYKudjud4Sey_v8F8UFMX5KgYQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000009bc86e05e1f1fc1a"
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
Cc: dri-devel@lists.freedesktop.org, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009bc86e05e1f1fc1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 12:06 AM Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> wrote:
>
> Test the conversion from XRGB8888 to RGB332.
>
> What is tested?
>
>  - Different values for the X in XRGB8888 to make sure it is ignored
>  - Different clip values: Single pixel and full and partial buffer
>  - Well known colors: White, black, red, green, blue, magenta, yellow
>    and cyan
>  - Other colors: Randomly picked
>  - Destination pitch
>
> How to run the tests?
>
>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/tes=
ts \
>          --kconfig_add CONFIG_VIRTIO_UML=3Dy \
>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=3Dy
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

These tests all pass properly on my system, and look good to me from a
KUnit point of view. Thanks very much.

A couple of small notes below, which you can take or leave as you
wish: they mostly focus on potential future tests.

Regardless,
Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  drivers/gpu/drm/Kconfig                       |  16 ++
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/tests/.kunitconfig            |   3 +
>  drivers/gpu/drm/tests/Makefile                |   3 +
>  .../gpu/drm/tests/drm_format_helper_test.c    | 161 ++++++++++++++++++
>  5 files changed, 184 insertions(+)
>  create mode 100644 drivers/gpu/drm/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/tests/Makefile
>  create mode 100644 drivers/gpu/drm/tests/drm_format_helper_test.c
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 22e7fa48d693..6c2256e8474b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -70,6 +70,22 @@ config DRM_DEBUG_SELFTEST
>
>           If in doubt, say "N".
>
> +config DRM_KUNIT_TEST
> +       tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> +       depends on DRM && KUNIT=3Dy
> +       select DRM_KMS_HELPER
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds unit tests for DRM. This option is not useful for
> +         distributions or general kernels, but only for kernel
> +         developers working on DRM and associated drivers.
> +
> +         For more information on KUnit and unit tests in general,
> +         please refer to the KUnit documentation in
> +         Documentation/dev-tools/kunit/.
> +
> +         If in doubt, say "N".
> +
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 13ef240b3d2b..db8ffcf4e048 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
>  #
>
>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
> +obj-$(CONFIG_DRM_KUNIT_TEST) +=3D tests/
>
>  obj-$(CONFIG_DRM_MIPI_DBI) +=3D drm_mipi_dbi.o
>  obj-$(CONFIG_DRM_MIPI_DSI) +=3D drm_mipi_dsi.o
> diff --git a/drivers/gpu/drm/tests/.kunitconfig b/drivers/gpu/drm/tests/.=
kunitconfig
> new file mode 100644
> index 000000000000..6ec04b4c979d
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/.kunitconfig
> @@ -0,0 +1,3 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_KUNIT_TEST=3Dy
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> new file mode 100644
> index 000000000000..2c8273796d9d
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_DRM_KUNIT_TEST) +=3D drm_format_helper_test.o
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> new file mode 100644
> index 000000000000..98583bf56044
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_rect.h>
> +
> +#include "../drm_crtc_internal.h"
> +
> +#define TEST_BUF_SIZE 50
> +
> +struct xrgb8888_to_rgb332_case {
> +       const char *name;
> +       unsigned int pitch;
> +       unsigned int dst_pitch;
> +       struct drm_rect clip;
> +       const u32 xrgb8888[TEST_BUF_SIZE];
> +       const u8 expected[4 * TEST_BUF_SIZE];

Why is this 4*TEST_BUF_SIZE if there are the same number of pixels
(which in rgb332 are 8-bit, not 32-bit) as in xrgb8888. I see there's
a pitch test, which does need some extra memory, but not a full 4
times (less than double, by the looks of things). Having this be 4 *
implies (to me) that the aim is to have the same total memory
available between xrgb8888 and expected, which doesn't seem to need to
be the case. Maybe make this 2 * or similar?

Relatedly, if instead of naming this 'expected', it were named rgb332,
it'd be possible to extend this struct to add other formats expected
values, and test several formats with the same list of test inputs.
(dst_pitch would probably need to become dst_pitch_rgb332 eventually,
too). This is all something which could wait for a later patch, but is
food for thought. I'd love to see an xrgb8888_to_rgb565 test at some
point, too.


> +};
> +
> +static struct xrgb8888_to_rgb332_case xrgb8888_to_rgb332_cases[] =3D {
> +       {
> +               .name =3D "single_pixel_source_buffer",
> +               .pitch =3D 1 * 4,
> +               .dst_pitch =3D 0,
> +               .clip =3D DRM_RECT_INIT(0, 0, 1, 1),
> +               .xrgb8888 =3D { 0x01FF0000 },
> +               .expected =3D { 0xE0 },
> +       },
> +       {
> +               .name =3D "single_pixel_clip_rectangle",
> +               .pitch =3D 2 * 4,
> +               .dst_pitch =3D 0,
> +               .clip =3D DRM_RECT_INIT(1, 1, 1, 1),
> +               .xrgb8888 =3D {
> +                       0x00000000, 0x00000000,
> +                       0x00000000, 0x10FF0000,
> +               },
> +               .expected =3D { 0xE0 },
> +       },
> +       {
> +               /* Well known colors: White, black, red, green, blue, mag=
enta,
> +                * yellow and cyan. Different values for the X in XRGB888=
8 to
> +                * make sure it is ignored. Partial clip area.
> +                */
> +               .name =3D "well_known_colors",
> +               .pitch =3D 4 * 4,
> +               .dst_pitch =3D 0,
> +               .clip =3D DRM_RECT_INIT(1, 1, 2, 4),
> +               .xrgb8888 =3D {
> +                       0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +                       0x00000000, 0x11FFFFFF, 0x22000000, 0x00000000,
> +                       0x00000000, 0x33FF0000, 0x4400FF00, 0x00000000,
> +                       0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
> +                       0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
> +               },
> +               .expected =3D {
> +                       0xFF, 0x00,
> +                       0xE0, 0x1C,
> +                       0x03, 0xE3,
> +                       0xFC, 0x1F,
> +               },
> +       },
> +       {
> +               /* Randomly picked colors. Full buffer within the clip ar=
ea. */
> +               .name =3D "destination_pitch",
> +               .pitch =3D 3 * 4,
> +               .dst_pitch =3D 5,
> +               .clip =3D DRM_RECT_INIT(0, 0, 3, 3),
> +               .xrgb8888 =3D {
> +                       0xA10E449C, 0xB1114D05, 0xC1A80303,
> +                       0xD16C7073, 0xA20E449C, 0xB2114D05,
> +                       0xC2A80303, 0xD26C7073, 0xA30E449C,
> +               },
> +               .expected =3D {
> +                       0x0A, 0x08, 0xA0, 0x00, 0x00,
> +                       0x6D, 0x0A, 0x08, 0x00, 0x00,
> +                       0xA0, 0x6D, 0x0A, 0x00, 0x00,
> +               },
> +       },
> +};
> +
> +/*
> + * conversion_buf_size - Return the destination buffer size required to =
convert
> + * between formats.
> + * @dst_format: destination buffer pixel format (DRM_FORMAT_*)
> + * @dst_pitch: Number of bytes between two consecutive scanlines within =
dst
> + * @clip: Clip rectangle area to convert
> + *
> + * Returns:
> + * The size of the destination buffer or negative value on error.
> + */
> +static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch=
,
> +                                 const struct drm_rect *clip)
> +{
> +       const struct drm_format_info *dst_fi =3D drm_format_info(dst_form=
at);
> +
> +       if (!dst_fi)
> +               return -EINVAL;
> +
> +       if (!dst_pitch)
> +               dst_pitch =3D drm_rect_width(clip) * dst_fi->cpp[0];
> +
> +       return dst_pitch * drm_rect_height(clip);
> +}
> +
> +static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case =
*t,
> +                                        char *desc)
> +{
> +       strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(xrgb8888_to_rgb332, xrgb8888_to_rgb332_cases,
> +                 xrgb8888_to_rgb332_case_desc);
> +
> +static void xrgb8888_to_rgb332_test(struct kunit *test)
> +{
> +       const struct xrgb8888_to_rgb332_case *params =3D test->param_valu=
e;
> +       size_t dst_size;
> +       __u8 *dst =3D NULL;
> +
> +       struct drm_framebuffer fb =3D {
> +               .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +               .pitches =3D { params->pitch, 0, 0 },
> +       };
> +
> +       dst_size =3D conversion_buf_size(DRM_FORMAT_RGB332, params->dst_p=
itch,
> +                                      &params->clip);
> +       KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +       dst =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
> +
> +       drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb888=
8,
> +                                 &fb, &params->clip);
> +       KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0)=
;
> +}
> +
> +static struct kunit_case drm_format_helper_test_cases[] =3D {
> +       KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
> +                        xrgb8888_to_rgb332_gen_params),
> +       {}
> +};
> +
> +static struct kunit_suite drm_format_helper_test_suite =3D {
> +       .name =3D "drm_format_helper_test",
> +       .test_cases =3D drm_format_helper_test_cases,
> +};
> +
> +kunit_test_suite(drm_format_helper_test_suite);
> +
> +MODULE_DESCRIPTION("KUnit tests for the drm_format_helper APIs");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>");
> --
> 2.25.1
>

--0000000000009bc86e05e1f1fc1a
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
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBNgwggPAoAMCAQICEAGH0uAg+eV8wUdHQOJ7
yfswDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMjA2MjAw
MjAzNTNaFw0yMjEyMTcwMjAzNTNaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCv9aO5pJtu5ZPHSb99iASzp2mcnJtk
JIh8xsJ+fNj9OOm0B7Rbg2l0+F4c19b1DyIzz/DHXIX9Gc55kfd4TBzhITOJmB+WdbaWS8Lnr9gu
SVO8OISymO6uVA0Lmkfne3zV0TwRtFkEeff0+P+MqdaLutOmOcLQRp8eAzb/TNKToSROBYmBRcuA
hDOMCVZZozIJ7T4nHBjfOrR+nJ4mjBIDRnDucs4dazypyiYiHYLfedCxp8vldywHMsTxl59Ue9Yk
RVewDw3HWvWUIMbc+Y636UXdUn4axP1TXN0khUpexMoc5qCHxpBIE/AyeS4WPASlE8uVY9Qg8dT6
kJmeOT+ZAgMBAAGjggHUMIIB0DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFDyAvtuc
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDw
EBYTPTejkIAyC4X5WuinxcuvLA3p0NVL6s4XyLvWVzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA2MjEwOTM4NDRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAWUG3PY6NBJ12vdlu//ek
0oexGQWWbjOscae/Z9cK5xsX5AezvNLcAuLpjBbIX29Gf10ngzsBPXPWONiQd1a+RlspAI7+wlMc
odmTS52TToS2l5iU9kR/ztFQAkoy88MtLUsJyVRjX3JRdV6dFGLFYxLhp8k37cWtvW7yd8NwKx1T
243AAulF1qgFYM2OrNOLudiD34Un5lWEknWxcRydhUAr/Hq0BEF7/K0/wX1HO6FLf6Xx8ZLY6UPi
aQGYt72WAreuPOR97fN3Gfh6N53STHDVKvSqknDj9Kdv1tJ3SpzzwY9IMtWwwJVdEBlGBER6IXB5
Rl7nYludFkn/Cdatsw==
--0000000000009bc86e05e1f1fc1a--
