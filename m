Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7C25AA91C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250510E79A;
	Fri,  2 Sep 2022 07:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6210E78A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:52:24 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id g185so595035vkb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=pqlsslotLMD/btH53knPgAVkKUlxlnVr4A921sVHYas=;
 b=aEgk6pJz59lujSkyYSWCJK38qiDqla2V1GaTw1ZiLAAzZBMFy+iMH78dvKX532Il/b
 neBsF8OM8Uwfo+ZhTQJzvOEQ9zficHhsJ+JWQIWdajXJQZGA6HpIe1pjdzNlrfKwQP4A
 QpOh9IfpKil7/RrALgHtLnrcaqq5KRb0UXzCgT/qQyCCmmo1pvtN9jppi0U4fkR7gnTi
 x9lTEemzelgldZetXv1t6DjN80g5hwWChyGwQ1mRmBsmWNTFgG5ZY4JLLcxRhGqGO8QW
 UPGOPjmtDnt09eo9EGGrcsYLePi1mgSAc0osgIbceruzdg9veBw2MeBLZ4cibfc3JKHP
 0xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pqlsslotLMD/btH53knPgAVkKUlxlnVr4A921sVHYas=;
 b=4Thab0zGfFcxhY6bbMsBHfZDfrhY9eHUHT+8nS2EeeJyUA86AIcWnnK5Oy1kaDvjaF
 9OL21Ny9Toh143TqgocZvjQd0/8SLhEmjLy5N6CQQ/yIVzWuotL72vgJYJEmCmaVzY2O
 BBAUbdjsblyyp3g6mAGTm8GgXaL3+NWFYtZOvtV+9E2IWMiNJ323JyaKWcrHI14Y75uU
 plLgkeuLNHrATxxNxtYNSJ3SL5nqF0tx6gOF+gp2fyw9SWs+8U46xLpr9eB8zSsw6pFP
 xzcmXMftpzY57cEMsx9+tS6JObWawxX+maf6Czkq6zP71hsMpR1f0jChz6gl2i0uVj8e
 rbDA==
X-Gm-Message-State: ACgBeo1usI/pKDIblj/EH88tVVLgK4bL7Wk+T9Vj77R9C5FnhhHoRT4X
 VWBaM2y6qbJnR1DRbeoBUEXrfI0fKPnkNKSLyO4gWg==
X-Google-Smtp-Source: AA6agR4nZ0EQZlnyggzdXbc7DyTCbse9fU0U75lWI+RJR+KF4HIVoTQ+PgRGaDZgBJTeRM90lDwoRABzUu5vyfcZ3qc=
X-Received: by 2002:a1f:b248:0:b0:377:aa0c:941 with SMTP id
 b69-20020a1fb248000000b00377aa0c0941mr10401933vkf.37.1662105143265; Fri, 02
 Sep 2022 00:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220901124210.591994-1-mairacanal@riseup.net>
In-Reply-To: <20220901124210.591994-1-mairacanal@riseup.net>
From: David Gow <davidgow@google.com>
Date: Fri, 2 Sep 2022 15:52:11 +0800
Message-ID: <CABVgOSn+03ACbVUQgRPZxLSB5ujU7qVCReP-UsGXrZC+i0C_UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/tests: Split drm_framebuffer_create_test into
 parameterized tests
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: michal.winiarski@intel.com, Arthur Grillo <arthur.grillo@usp.br>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, Tales Aparecida <tales.aparecida@gmail.com>,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendanhiggins@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mwen@igalia.com,
 KUnit Development <kunit-dev@googlegroups.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 1, 2022 at 8:44 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wro=
te:
>
> The igt_check_drm_framebuffer_create is based on a loop that executes
> tests for all createbuffer_tests test cases. This could be better
> represented by parameterized tests, provided by KUnit.
>
> So, convert the igt_check_drm_framebuffer_create into parameterized tests=
.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> Reviewed-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-maira=
canal@riseup.net/
> - Use .init for mock_drm_device instead of a global variable. (Micha=C5=
=82 Winiarski)
> ---

This looks good to me, and worked well here.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 45 ++++++++++++--------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index ec7a08ba4056..564794917784 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -25,7 +25,7 @@ struct drm_framebuffer_test {
>         const char *name;
>  };
>
> -static struct drm_framebuffer_test createbuffer_tests[] =3D {
> +static const struct drm_framebuffer_test drm_framebuffer_create_cases[] =
=3D {

FYI: It shouldn't be _necessary_ to namespace this, though I quite
like it personally. I definitely approve of the const, though.

>  { .buffer_created =3D 1, .name =3D "ABGR8888 normal sizes",
>         .cmd =3D { .width =3D 600, .height =3D 600, .pixel_format =3D DRM=
_FORMAT_ABGR8888,
>                  .handles =3D { 1, 0, 0 }, .pitches =3D { 4 * 600, 0, 0 }=
,
> @@ -330,43 +330,52 @@ static struct drm_mode_config_funcs mock_config_fun=
cs =3D {
>         .fb_create =3D fb_create_mock,
>  };
>
> -static struct drm_device mock_drm_device =3D {
> -       .mode_config =3D {
> +static int drm_framebuffer_test_init(struct kunit *test)
> +{
> +       struct drm_device *mock;
> +
> +       mock =3D kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
> +
> +       mock->mode_config =3D (struct drm_mode_config) {
>                 .min_width =3D MIN_WIDTH,
>                 .max_width =3D MAX_WIDTH,
>                 .min_height =3D MIN_HEIGHT,
>                 .max_height =3D MAX_HEIGHT,
>                 .funcs =3D &mock_config_funcs,
> -       },
> -};
> +       };
>
> -static int execute_drm_mode_fb_cmd2(struct drm_mode_fb_cmd2 *r)
> +       test->priv =3D mock;
> +       return 0;
> +}
> +
> +static void test_drm_framebuffer_create(struct kunit *test)
>  {
> +       const struct drm_framebuffer_test *params =3D test->param_value;
> +       struct drm_device *mock =3D test->priv;
>         int buffer_created =3D 0;
>
> -       mock_drm_device.dev_private =3D &buffer_created;
> -       drm_internal_framebuffer_create(&mock_drm_device, r, NULL);
> -       return buffer_created;
> +       mock->dev_private =3D &buffer_created;
> +       drm_internal_framebuffer_create(mock, &params->cmd, NULL);
> +       KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
>  }
>
> -static void igt_check_drm_framebuffer_create(struct kunit *test)
> +static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_te=
st *t, char *desc)
>  {
> -       int i =3D 0;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(createbuffer_tests); i++) {
> -               KUNIT_EXPECT_EQ_MSG(test, createbuffer_tests[i].buffer_cr=
eated,
> -                                   execute_drm_mode_fb_cmd2(&createbuffe=
r_tests[i].cmd),
> -                    "Test %d: \"%s\" failed\n", i, createbuffer_tests[i]=
.name);
> -       }
> +       strcpy(desc, t->name);
>  }
>
> +KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
> +                 drm_framebuffer_test_to_desc);
> +
>  static struct kunit_case drm_framebuffer_tests[] =3D {
> -       KUNIT_CASE(igt_check_drm_framebuffer_create),
> +       KUNIT_CASE_PARAM(test_drm_framebuffer_create, drm_framebuffer_cre=
ate_gen_params),
>         { }
>  };
>
>  static struct kunit_suite drm_framebuffer_test_suite =3D {
>         .name =3D "drm_framebuffer",
> +       .init =3D drm_framebuffer_test_init,
>         .test_cases =3D drm_framebuffer_tests,
>  };
>
> --
> 2.37.2
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20220901124210.591994-1-mairacanal%40riseup.net.
