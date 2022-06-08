Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19B5420C1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 04:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0651E112899;
	Wed,  8 Jun 2022 02:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA8111288F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 02:36:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o7so5421641eja.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 19:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3PNQE7ifO0DggXcwYs9YFh34R1R2x1W2ohTO1J3pgNk=;
 b=bIkpGxR1KslYHpBjcwf9MLkVbruN/ZgKY5HSQxF9H7oW5FX5aEZL6xhhasOj5FYFKx
 fTcOEQgpCsavi/64twjKFY1aYhERK9BdnsprP6w9FBdXxwTR4p16/Q0Dbq6/4AHLjVGS
 RJL+N/H67Sa5kBX4bq+piQVn8ArHPHYxLjt+5C+VQ2qB44zqNy05+VTP7Z0jPLc3j/OT
 kmyRqJcbnm9vrbCdlU7300OQ5qELvLijaIJSrPowKuU8L0uckSV0EIFUG2ZIZBQ63+DC
 BmfQrRWhXQyAhHXulr98ZHvXGOMUz/z3Uxi/JVGFi2f8h4rNbj3w5HelZJKfU8MehF2D
 1HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3PNQE7ifO0DggXcwYs9YFh34R1R2x1W2ohTO1J3pgNk=;
 b=AQ/wWAx9nkM3eUfTJjqJMKIyHnZzN9gLw3P4wLcHWyGvqPWxdLywx4hEPRFp48a5/A
 g3QpXlHBXB6PgKKq1rxj5PAcu8lmBM0/iZh0q9FUSlYSDW9asRj38Kyd+y01YTlN1TZZ
 ZApghTR91ibJVQNM6i2wrWG0biLxAx1MqvOL2M3sF3m07+/Ln9M2dvhLFDfHfRKXv7wY
 EmT+3ojZ+t1Qjclbs16Uj+WJ0gvr9ezv7am1xhRMac4+/NvmqxIHjoGEehl45yTTmeab
 p9P66ilQJz7UCcZ4QUHuwsV9Su+HxqkpKCHpFeuiNdCDPXhPs8TDpVzdFQIl5e+ePDmB
 ivWQ==
X-Gm-Message-State: AOAM5304ShF60J8QcW7g8Ey6GZmnzNR/bxfp0mTWuQp+GDDdsiiOw/Qs
 qNczY+ybU+IK06b6uxt3dHjaxL0UTPfWPllopcQLIw==
X-Google-Smtp-Source: ABdhPJx9GQvWIrjjffvcBYMYjDyP2zTc0R9z72LxUj4TwlQBDpCMSnLZEgRRIwlPcg8coyaljwc9iYKmlpUTHxAU2+8=
X-Received: by 2002:a17:906:7308:b0:710:dabe:d651 with SMTP id
 di8-20020a170906730800b00710dabed651mr19042504ejc.75.1654655798153; Tue, 07
 Jun 2022 19:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220608010709.272962-1-maira.canal@usp.br>
 <20220608010709.272962-2-maira.canal@usp.br>
In-Reply-To: <20220608010709.272962-2-maira.canal@usp.br>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 7 Jun 2022 19:36:26 -0700
Message-ID: <CAGS_qxpiBOJ5OnQREo33LCtgROSuvTNWgwgkKN4P7TF1+4kcSQ@mail.gmail.com>
Subject: Re: [RFC 1/3] drm/amd/display: Introduce KUnit to DML
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: Harrison Chiu <harrison.chiu@amd.com>, brendanhiggins@google.com,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Jun Lei <jun.lei@amd.com>, magalilemes00@gmail.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, mwen@igalia.com,
 Sean Paul <seanpaul@chromium.org>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com, Mark Yacoub <markyacoub@chromium.org>,
 linux-kernel@vger.kernel.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, tales.aparecida@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 6:09 PM Ma=C3=ADra Canal <maira.canal@usp.br> wrote:
>
> KUnit unifies the test structure and provides helper tools that simplify
> the development. Basic use case allows running tests as regular

Thanks for sending this out!
I've added some comments on the KUnit side of things.

Wording nit: was this meant to be "the development of tests." ?

> processes, which makes easier to run unit tests on a development machine
> and to integrate the tests in a CI system.
>
> This commit introduce a basic unit test to one part of the Display Mode

Also very minor typo: "introduces"

> Library: display_mode_lib, in order to introduce the basic structure of t=
he
> tests on the DML.
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/display/Kconfig           |  1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  5 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 +
>  .../drm/amd/display/amdgpu_dm/tests/Kconfig   | 29 +++++++
>  .../drm/amd/display/amdgpu_dm/tests/Makefile  | 14 ++++
>  .../amdgpu_dm/tests/display_mode_lib_test.c   | 83 +++++++++++++++++++
>  .../amd/display/amdgpu_dm/tests/dml_test.c    | 23 +++++
>  .../amd/display/amdgpu_dm/tests/dml_test.h    | 13 +++
>  9 files changed, 174 insertions(+)
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_m=
ode_lib_test.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.=
c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.=
h
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/di=
splay/Kconfig
> index 127667e549c1..83042e2e4d22 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -53,5 +53,6 @@ config DRM_AMD_SECURE_DISPLAY
>              of crc of specific region via debugfs.
>              Cooperate with specific DMCU FW.
>
> +source "drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig"
>
>  endmenu
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu=
/drm/amd/display/amdgpu_dm/Makefile
> index 718e123a3230..d25b63566640 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -24,6 +24,11 @@
>  # It provides the control and status of dm blocks.
>
>
> +AMDGPU_DM_LIBS =3D tests
> +
> +AMD_DM =3D $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/a=
mdgpu_dm/,$(AMDGPU_DM_LIBS)))
> +
> +include $(AMD_DM)
>
>  AMDGPUDM =3D amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm=
_color.o
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cb1e9bb60db2..f73da1e0088f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1655,6 +1655,7 @@ static int amdgpu_dm_init(struct amdgpu_device *ade=
v)
>                 goto error;
>         }
>
> +       amdgpu_dml_test_init();
>
>         DRM_DEBUG_DRIVER("KMS initialized.\n");
>
> @@ -1678,6 +1679,8 @@ static void amdgpu_dm_fini(struct amdgpu_device *ad=
ev)
>  {
>         int i;
>
> +       amdgpu_dml_test_exit();
> +
>         if (adev->dm.vblank_control_workqueue) {
>                 destroy_workqueue(adev->dm.vblank_control_workqueue);
>                 adev->dm.vblank_control_workqueue =3D NULL;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 3cc5c15303e6..e586d3a3d2f0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -749,4 +749,7 @@ int dm_atomic_get_state(struct drm_atomic_state *stat=
e,
>  struct amdgpu_dm_connector *
>  amdgpu_dm_find_first_crtc_matching_connector(struct drm_atomic_state *st=
ate,
>                                              struct drm_crtc *crtc);
> +
> +int amdgpu_dml_test_init(void);
> +void amdgpu_dml_test_exit(void);
>  #endif /* __AMDGPU_DM_H__ */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig b/driver=
s/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
> new file mode 100644
> index 000000000000..bd1d971d4452
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: MIT
> +menu "DML Unit Tests"
> +       depends on DRM_AMD_DC && KUNIT=3Dm
> +
> +config DISPLAY_MODE_LIB_KUNIT_TEST
> +       bool "Enable unit tests for dml/display_mode_lib" if !DML_KUNIT_T=
EST
> +       default y if DML_KUNIT_TEST
> +       help
> +               Enables unit tests for the dml/display_mode_lib. Only use=
ful for kernel
> +               devs running KUnit.
> +
> +               For more information on KUnit and unit tests in general p=
lease refer to
> +               the KUnit documentation in Documentation/dev-tools/kunit/=
.
> +
> +               If unsure, say N.
> +
> +config DML_KUNIT_TEST
> +       bool "Run all unit tests for DML" if !KUNIT_ALL_TESTS
> +       default KUNIT_ALL_TESTS
> +       help
> +               Enables unit tests for the Display Mode Library. Only use=
ful for kernel
> +               devs running KUnit.
> +
> +               For more information on KUnit and unit tests in general p=
lease refer to
> +               the KUnit documentation in Documentation/dev-tools/kunit/=
.
> +
> +               If unsure, say N.
> +
> +endmenu
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
> new file mode 100644
> index 000000000000..53b38e340564
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for the KUnit Tests for DML
> +#
> +
> +DML_TESTS =3D dml_test.o
> +
> +ifdef CONFIG_DISPLAY_MODE_LIB_KUNIT_TEST
> +DML_TESTS +=3D display_mode_lib_test.o
> +endif
> +
> +AMD_DAL_DML_TESTS =3D $(addprefix $(AMDDALPATH)/amdgpu_dm/tests/,$(DML_T=
ESTS))
> +
> +AMD_DISPLAY_FILES +=3D $(AMD_DAL_DML_TESTS)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib=
_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test=
.c
> new file mode 100644
> index 000000000000..3ea0e7fb13e3
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * KUnit tests for dml/display_mode_lib.h
> + *
> + * Copyright (C) 2022, Ma=C3=ADra Canal <mairacanal@riseup.net>
> + */
> +
> +#include <kunit/test.h>
> +#include "../../dc/dml/display_mode_lib.h"
> +#include "../../dc/dml/display_mode_enums.h"
> +#include "dml_test.h"
> +
> +/**
> + * DOC: Unit tests for AMDGPU DML display_mode_lib.h
> + *
> + * The display_mode_lib.h holds the functions responsible for the instan=
tiation
> + * and logging of the Display Mode Library (DML).
> + *
> + * These KUnit tests were implemented with the intention of assuring the=
 proper
> + * logging of the DML.
> + *
> + */
> +
> +static void dml_get_status_message_test(struct kunit *test)
> +{

I think this is a case where an exhaustive test might not be warranted.
The function under test is entirely just a switch statement with
return statements, so the chances of things going wrong is minimal.
But that's just my personal preference.

> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_VALIDATION_OK=
), "Validation OK");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_SCALE_RA=
TIO_TAP), "Scale ratio/tap");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_SOURCE_P=
IXEL_FORMAT), "Source pixel format");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_VIEWPORT=
_SIZE), "Viewport size");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_TOTAL_V_=
ACTIVE_BW), "Total vertical active bandwidth");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DIO_SUPP=
ORT), "DIO support");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_NOT_ENOU=
GH_DSC), "Not enough DSC Units");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DSC_CLK_=
REQUIRED), "DSC clock required");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_URGENT_L=
ATENCY), "Urgent latency");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_REORDERI=
NG_BUFFER), "Re-ordering buffer");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DISPCLK_=
DPPCLK), "Dispclk and Dppclk");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_TOTAL_AV=
AILABLE_PIPES), "Total available pipes");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_NUM_OTG)=
, "Number of OTG");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBAC=
K_MODE), "Writeback mode");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBAC=
K_LATENCY), "Writeback latency");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBAC=
K_SCALE_RATIO_TAP), "Writeback scale ratio/tap");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_CURSOR_S=
UPPORT), "Cursor support");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PITCH_SU=
PPORT), "Pitch support");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PTE_BUFF=
ER_SIZE), "PTE buffer size");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DSC_INPU=
T_BPC), "DSC input bpc");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PREFETCH=
_SUPPORT), "Prefetch support");
> +       KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_V_RATIO_=
PREFETCH), "Vertical ratio prefetch");

Hmm, perhaps we could add a test like checking that
dml_get_status_message(-1) gives the expected value ("Unknown
Status")?
Checking values that are too small and too big is generally a nice
thing to check as some of these enum->str funcs are implemented as
array lookups.

> +}
> +
> +static struct kunit_case display_mode_library_test_cases[] =3D {
> +       KUNIT_CASE(dml_get_status_message_test),
> +       {  }
> +};
> +
> +static struct kunit_suite display_mode_lib_test_suite =3D {
> +       .name =3D "dml-display-mode-lib",

Perhaps "display_mode_lib"?

It sounds like DML stands for that, so having both might not be necessary.
Also, it seems like the agreed upon convention is to use "_" instead
of "-" per https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.htm=
l#suites.

> +       .test_cases =3D display_mode_library_test_cases,
> +};
> +
> +static struct kunit_suite *display_mode_lib_test_suites[] =3D { &display=
_mode_lib_test_suite, NULL };
> +
> +int display_mode_lib_test_init(void)
> +{
> +       pr_info("=3D=3D=3D> Running display_mode_lib KUnit Tests");
> +       pr_info("********************************************************=
**");
> +       pr_info("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   =
**");
> +       pr_info("**                                                      =
**");
> +       pr_info("** display_mode_lib KUnit Tests are being run. This     =
**");
> +       pr_info("** means that this is a TEST kernel and should not be   =
**");
> +       pr_info("** used for production.                                 =
**");
> +       pr_info("**                                                      =
**");
> +       pr_info("** If you see this message and you are not debugging    =
**");
> +       pr_info("** the kernel, report this immediately to your vendor!  =
**");
> +       pr_info("**                                                      =
**");
> +       pr_info("********************************************************=
**");

David Gow proposed tainting the kernel if we ever try to run a KUnit
test suite here:
https://lore.kernel.org/linux-kselftest/20220513083212.3537869-2-davidgow@g=
oogle.com/

If that goes in, then this logging might not be as necessary.
I'm not sure what the status of that change is, but we're at least
waiting on a v4, I think.

> +
> +       return __kunit_test_suites_init(display_mode_lib_test_suites);
> +}
> +
> +void display_mode_lib_test_exit(void)
> +{
> +       return __kunit_test_suites_exit(display_mode_lib_test_suites);
> +}

Other tests have used `return` here, but it's void, so it's not really
necessary.

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
> new file mode 100644
> index 000000000000..9a5d47597c10
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "dml_test.h"
> +
> +/**
> + * amdgpu_dml_test_init() - Initialise KUnit Tests for DML
> + *
> + * It aggregates all KUnit Tests related to the Display Mode Library (DM=
L).
> + * The DML contains multiple modules, and to assure the modularity of th=
e
> + * tests, the KUnit Tests for a DML module are also gathered in a separa=
ted
> + * module. Each KUnit Tests module is initiated in this function.
> + *
> + */
> +int amdgpu_dml_test_init(void)
> +{
> +       display_mode_lib_test_init();
> +       return 0;

Optional: we can make this func void.
It looks like we're never looking at the return value of this func and
we don't need it to make a certain signature (since we're not using it
for module_init).

Daniel
