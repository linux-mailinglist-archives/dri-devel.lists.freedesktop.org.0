Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E097553900
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 19:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D6A10E83D;
	Tue, 21 Jun 2022 17:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552A910E83D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 17:37:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n1so19705835wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vpkerxjI2bVCUwBu2TqOMcIJPwr5ktQseMgFP8QQMNg=;
 b=V6lRlgLpxQGeiIHZmLpabeazuSqDwEOLTP+n/scvR2nTqz6GdOqXw0WYzRuzE2j0rC
 PbBWOsW2vM4BzfxBi5vE1V7wBKRRvEHOESpQhRpocPAh49goA0UrmoUB0SbrqMNQb4yl
 8D+jaVlXcunixC1W9O+IDDzQdSioLQ+SHwFMNwaMEEObpCB08TkRyAgPEFCzNrseEokf
 xSGOD/EBMAbzVZwOaEXwtck8Zv/ePjeI7cciXr311LIdm+FmSWWWwVAjMqvvVgU70JrK
 wr/CQnBjhlJVSQYEwOHFnAR75UltByiaxhbPHapFf7ySMHjw5rO662okm1yN8u7WXNei
 kVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vpkerxjI2bVCUwBu2TqOMcIJPwr5ktQseMgFP8QQMNg=;
 b=TxsiWqjHGX9SI6hKd//NFNBRVXK8RD5iCuHeVurhX3FBtOjJ/exAz6zE8nOQqRh07y
 84WaREGf5oKuc7oBVPzqdWGg+XXnnsVxXrIIwY7cu9/KmfzqQ+7zPV36MvlFL0iahFPu
 5jFoYybUEED8IfjRIee7E/BkZxE90LNjvlnt+ZIY7237kkDi7e7OhrjTC+wbiA5MpCUW
 7IxTF2DoM2bDYtZ8bXM8XkbQxv1GUuJ1M/KnTg1Seuy2GiNp6GO+A0XRGThugbPSmfxF
 CbCd7wmxXAJ6yM2bRKE1s3BZhmN+W9QujFGdlcEjYb9S6bvo9PL8R0tkBzO/pMczzUFx
 qKgg==
X-Gm-Message-State: AJIora874w3Pg7vCZJFHa2Pjn+c9FRfnw6hvx97arM6OxSF+766P+lEa
 T2tSW0ZIGVQvCWhuSqJ1rWWrQYljnj1Mlg==
X-Google-Smtp-Source: AGRyM1sWjJ4WZct8Py0+j6dgxLlQ/3ZrXFUZboubPVCFS+6a2xp4CIZkYuxZlcb4IEccSU1lW/BsSQ==
X-Received: by 2002:a05:6000:1888:b0:218:3fab:c510 with SMTP id
 a8-20020a056000188800b002183fabc510mr29904831wri.473.1655833058630; 
 Tue, 21 Jun 2022 10:37:38 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 c14-20020adffb4e000000b0021b8863514fsm10298232wrs.79.2022.06.21.10.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:37:38 -0700 (PDT)
Date: Tue, 21 Jun 2022 19:37:32 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v4 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220621173732.GA3209@elementary>
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-3-jose.exposito89@gmail.com>
 <CABVgOSmntjTF3fU9NJ_qwxbOYKudjud4Sey_v8F8UFMX5KgYQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOSmntjTF3fU9NJ_qwxbOYKudjud4Sey_v8F8UFMX5KgYQA@mail.gmail.com>
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
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Tue, Jun 21, 2022 at 05:38:33PM +0800, David Gow wrote:
> On Tue, Jun 21, 2022 at 12:06 AM José Expósito
> <jose.exposito89@gmail.com> wrote:
> >
> > Test the conversion from XRGB8888 to RGB332.
> >
> > What is tested?
> >
> >  - Different values for the X in XRGB8888 to make sure it is ignored
> >  - Different clip values: Single pixel and full and partial buffer
> >  - Well known colors: White, black, red, green, blue, magenta, yellow
> >    and cyan
> >  - Other colors: Randomly picked
> >  - Destination pitch
> >
> > How to run the tests?
> >
> >  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
> >          --kconfig_add CONFIG_VIRTIO_UML=y \
> >          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> >
> > Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> 
> These tests all pass properly on my system, and look good to me from a
> KUnit point of view. Thanks very much.
> 
> A couple of small notes below, which you can take or leave as you
> wish: they mostly focus on potential future tests.
> 
> Regardless,
> Reviewed-by: David Gow <davidgow@google.com>

Thanks a lot for your review :)
 
> Cheers,
> -- David
> 
> >  drivers/gpu/drm/Kconfig                       |  16 ++
> >  drivers/gpu/drm/Makefile                      |   1 +
> >  drivers/gpu/drm/tests/.kunitconfig            |   3 +
> >  drivers/gpu/drm/tests/Makefile                |   3 +
> >  .../gpu/drm/tests/drm_format_helper_test.c    | 161 ++++++++++++++++++
> >  5 files changed, 184 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tests/.kunitconfig
> >  create mode 100644 drivers/gpu/drm/tests/Makefile
> >  create mode 100644 drivers/gpu/drm/tests/drm_format_helper_test.c
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 22e7fa48d693..6c2256e8474b 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -70,6 +70,22 @@ config DRM_DEBUG_SELFTEST
> >
> >           If in doubt, say "N".
> >
> > +config DRM_KUNIT_TEST
> > +       tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> > +       depends on DRM && KUNIT=y
> > +       select DRM_KMS_HELPER
> > +       default KUNIT_ALL_TESTS
> > +       help
> > +         This builds unit tests for DRM. This option is not useful for
> > +         distributions or general kernels, but only for kernel
> > +         developers working on DRM and associated drivers.
> > +
> > +         For more information on KUnit and unit tests in general,
> > +         please refer to the KUnit documentation in
> > +         Documentation/dev-tools/kunit/.
> > +
> > +         If in doubt, say "N".
> > +
> >  config DRM_KMS_HELPER
> >         tristate
> >         depends on DRM
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 13ef240b3d2b..db8ffcf4e048 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> >  #
> >
> >  obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> > +obj-$(CONFIG_DRM_KUNIT_TEST) += tests/
> >
> >  obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
> >  obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> > diff --git a/drivers/gpu/drm/tests/.kunitconfig b/drivers/gpu/drm/tests/.kunitconfig
> > new file mode 100644
> > index 000000000000..6ec04b4c979d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tests/.kunitconfig
> > @@ -0,0 +1,3 @@
> > +CONFIG_KUNIT=y
> > +CONFIG_DRM=y
> > +CONFIG_DRM_KUNIT_TEST=y
> > diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> > new file mode 100644
> > index 000000000000..2c8273796d9d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tests/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o
> > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > new file mode 100644
> > index 000000000000..98583bf56044
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include <kunit/test.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_format_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_framebuffer.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_mode.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_rect.h>
> > +
> > +#include "../drm_crtc_internal.h"
> > +
> > +#define TEST_BUF_SIZE 50
> > +
> > +struct xrgb8888_to_rgb332_case {
> > +       const char *name;
> > +       unsigned int pitch;
> > +       unsigned int dst_pitch;
> > +       struct drm_rect clip;
> > +       const u32 xrgb8888[TEST_BUF_SIZE];
> > +       const u8 expected[4 * TEST_BUF_SIZE];
> 
> Why is this 4*TEST_BUF_SIZE if there are the same number of pixels
> (which in rgb332 are 8-bit, not 32-bit) as in xrgb8888. I see there's
> a pitch test, which does need some extra memory, but not a full 4
> times (less than double, by the looks of things). Having this be 4 *
> implies (to me) that the aim is to have the same total memory
> available between xrgb8888 and expected, which doesn't seem to need to
> be the case. Maybe make this 2 * or similar?

To be honest, TEST_BUF_SIZE length is quite arbitrary. I chose a
number big enough so large formats, like RGB565, fit in the buffer
without changing the constant in future patches unnecessarily.
I added some extra space so other possible test cases don't need to
change it if testing with larger input.

The *4 multiplier is there so both buffers have the same size.

> Relatedly, if instead of naming this 'expected', it were named rgb332,
> it'd be possible to extend this struct to add other formats expected
> values, and test several formats with the same list of test inputs.
> (dst_pitch would probably need to become dst_pitch_rgb332 eventually,
> too). This is all something which could wait for a later patch, but is
> food for thought. I'd love to see an xrgb8888_to_rgb565 test at some
> point, too.

The patches for RGB565, including the small refactors you mentioned
plus the avility to swap or not bytes are already available in my
tree [1] (last 4 patches, in case you want to look at them).

They are waiting to be rebased once this series is merged.

As you pointed out, some minor refactoring is required and you are
right about the destination pitch. Hopefully, the end result is simple
and easy to follow despite the refactor patches.

Thanks again for your review,
Jose

[1] https://github.com/JoseExposito/linux/commits/patch-drm-format-helper-rgb565-kunit

> > +};
> > +
> > +static struct xrgb8888_to_rgb332_case xrgb8888_to_rgb332_cases[] = {
> > +       {
> > +               .name = "single_pixel_source_buffer",
> > +               .pitch = 1 * 4,
> > +               .dst_pitch = 0,
> > +               .clip = DRM_RECT_INIT(0, 0, 1, 1),
> > +               .xrgb8888 = { 0x01FF0000 },
> > +               .expected = { 0xE0 },
> > +       },
> > +       {
> > +               .name = "single_pixel_clip_rectangle",
> > +               .pitch = 2 * 4,
> > +               .dst_pitch = 0,
> > +               .clip = DRM_RECT_INIT(1, 1, 1, 1),
> > +               .xrgb8888 = {
> > +                       0x00000000, 0x00000000,
> > +                       0x00000000, 0x10FF0000,
> > +               },
> > +               .expected = { 0xE0 },
> > +       },
> > +       {
> > +               /* Well known colors: White, black, red, green, blue, magenta,
> > +                * yellow and cyan. Different values for the X in XRGB8888 to
> > +                * make sure it is ignored. Partial clip area.
> > +                */
> > +               .name = "well_known_colors",
> > +               .pitch = 4 * 4,
> > +               .dst_pitch = 0,
> > +               .clip = DRM_RECT_INIT(1, 1, 2, 4),
> > +               .xrgb8888 = {
> > +                       0x00000000, 0x00000000, 0x00000000, 0x00000000,
> > +                       0x00000000, 0x11FFFFFF, 0x22000000, 0x00000000,
> > +                       0x00000000, 0x33FF0000, 0x4400FF00, 0x00000000,
> > +                       0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
> > +                       0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
> > +               },
> > +               .expected = {
> > +                       0xFF, 0x00,
> > +                       0xE0, 0x1C,
> > +                       0x03, 0xE3,
> > +                       0xFC, 0x1F,
> > +               },
> > +       },
> > +       {
> > +               /* Randomly picked colors. Full buffer within the clip area. */
> > +               .name = "destination_pitch",
> > +               .pitch = 3 * 4,
> > +               .dst_pitch = 5,
> > +               .clip = DRM_RECT_INIT(0, 0, 3, 3),
> > +               .xrgb8888 = {
> > +                       0xA10E449C, 0xB1114D05, 0xC1A80303,
> > +                       0xD16C7073, 0xA20E449C, 0xB2114D05,
> > +                       0xC2A80303, 0xD26C7073, 0xA30E449C,
> > +               },
> > +               .expected = {
> > +                       0x0A, 0x08, 0xA0, 0x00, 0x00,
> > +                       0x6D, 0x0A, 0x08, 0x00, 0x00,
> > +                       0xA0, 0x6D, 0x0A, 0x00, 0x00,
> > +               },
> > +       },
> > +};
> > +
> > +/*
> > + * conversion_buf_size - Return the destination buffer size required to convert
> > + * between formats.
> > + * @dst_format: destination buffer pixel format (DRM_FORMAT_*)
> > + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> > + * @clip: Clip rectangle area to convert
> > + *
> > + * Returns:
> > + * The size of the destination buffer or negative value on error.
> > + */
> > +static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
> > +                                 const struct drm_rect *clip)
> > +{
> > +       const struct drm_format_info *dst_fi = drm_format_info(dst_format);
> > +
> > +       if (!dst_fi)
> > +               return -EINVAL;
> > +
> > +       if (!dst_pitch)
> > +               dst_pitch = drm_rect_width(clip) * dst_fi->cpp[0];
> > +
> > +       return dst_pitch * drm_rect_height(clip);
> > +}
> > +
> > +static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case *t,
> > +                                        char *desc)
> > +{
> > +       strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> > +}
> > +
> > +KUNIT_ARRAY_PARAM(xrgb8888_to_rgb332, xrgb8888_to_rgb332_cases,
> > +                 xrgb8888_to_rgb332_case_desc);
> > +
> > +static void xrgb8888_to_rgb332_test(struct kunit *test)
> > +{
> > +       const struct xrgb8888_to_rgb332_case *params = test->param_value;
> > +       size_t dst_size;
> > +       __u8 *dst = NULL;
> > +
> > +       struct drm_framebuffer fb = {
> > +               .format = drm_format_info(DRM_FORMAT_XRGB8888),
> > +               .pitches = { params->pitch, 0, 0 },
> > +       };
> > +
> > +       dst_size = conversion_buf_size(DRM_FORMAT_RGB332, params->dst_pitch,
> > +                                      &params->clip);
> > +       KUNIT_ASSERT_GT(test, dst_size, 0);
> > +
> > +       dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> > +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
> > +
> > +       drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
> > +                                 &fb, &params->clip);
> > +       KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
> > +}
> > +
> > +static struct kunit_case drm_format_helper_test_cases[] = {
> > +       KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
> > +                        xrgb8888_to_rgb332_gen_params),
> > +       {}
> > +};
> > +
> > +static struct kunit_suite drm_format_helper_test_suite = {
> > +       .name = "drm_format_helper_test",
> > +       .test_cases = drm_format_helper_test_cases,
> > +};
> > +
> > +kunit_test_suite(drm_format_helper_test_suite);
> > +
> > +MODULE_DESCRIPTION("KUnit tests for the drm_format_helper APIs");
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
> > --
> > 2.25.1
> >


