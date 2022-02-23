Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60D4C1F1C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 23:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A3D10E248;
	Wed, 23 Feb 2022 22:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374DE10E248
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 22:51:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id cm8so435235edb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaoqQKaoUHNf2JbZ8IZvxyHtFRMt6ISBuKjiRkt/q+c=;
 b=SIKAbK9okkAUIZpVoBptphQWMSoOisijyRJcv/F8CkNZkKIWMdAxGyGvGfPA4UQ7Pd
 GTkHoIl290LnzcpuMfrHu1Gb0RaiME4I38b+xLtMw89c9TQTLeiBfnPWlkmyOGsTsDbt
 A+lcgd4Gs9ZzOt5zfuHMXi5xBevmD02KJbVOK5ibsExfFzkcTh/c7t2mqZYHVsLcukNd
 nJ678FBs6Q+qyrhljPlSHPhR8K7xWmzpPkiT2HxuEZYjNWK5VEhXuSO/h/tQNxxqsjVZ
 9OiU2FkFFeU2wCFD9u3EUdn3YjP1HYc7GwkGTCVrFxPd7foKGPGjvxptx3WYnLvQ0flk
 tmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaoqQKaoUHNf2JbZ8IZvxyHtFRMt6ISBuKjiRkt/q+c=;
 b=Sucg/PCmyKOvy0yhyS1YEQQBeMgthHk/Cs8ryJL9jn77qMuYZL8p7zGX7BWoDmM/BZ
 cDE7O+vsyqXt/NAR2vWciKutThvBiJcpMDQhe4cqp0GJxfNCdT/Cct0Q2WIu3OoWq/P9
 7iJajb+Cch37F4OEDLhzfMp0cJ920GsiyNPx7CcIuFhw7juyjFozuIVnazrEWGut0s1H
 5lPG1HWvHc972OeD56kPI5bM7bs/bmzHOY+H8I4sTiDSf68E331jOPbhce81hkkkTxyE
 JclLdPvaV5xWBXyhabpSbjeyiCgmzOXSd7qRknvxowG215lH+4jKcZj2ycF6C+Zm1hY1
 YtLg==
X-Gm-Message-State: AOAM530RW1D37n7j5R4yEUN2GEk+FU7bvJnx+CUoglKq76m8rRi4caWM
 pVKJKqGMp7YbiyuGiEgPY/LdGtpsAxyqkYptcISiKg==
X-Google-Smtp-Source: ABdhPJwLB+dFDVxn3OfuYNtWQ2iiUjiifxP/8Gnlc8HDYnao47RWtDIJuGPS5lv4YyUeYK7foUJJosFZKTHaVSRGN8M=
X-Received: by 2002:a05:6402:d0e:b0:412:b108:d839 with SMTP id
 eb14-20020a0564020d0e00b00412b108d839mr1569561edb.88.1645656671437; Wed, 23
 Feb 2022 14:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
In-Reply-To: <20220223105600.1132593-3-maxime@cerno.tech>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 23 Feb 2022 14:50:59 -0800
Message-ID: <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Let's test various parts of the rate-related clock API with the kunit
> testing framework.
>
> Cc: kunit-dev@googlegroups.com
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Daniel Latypov <dlatypov@google.com>

Looks good to me on the KUnit side.
Two small nits below.

FYI, I computed the incremental coverage for this series, i.e.:
1) applied the full series
2) computed the absolute coverage

$  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
--make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
--kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
$ lcov -t "clk_tests" -o coverage.info -c -d .kunit/ --gcov-tool=/usr/bin/gcov-6

3) intersected that with the total diff

Incremental coverage for 3/9 files in --diff_file
Total incremental: 99.29% coverage (281/283 lines)
  drivers/clk/clk.c: 84.62% coverage (11/13 lines)
  drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
  include/linux/clk.h: 100.00% coverage (1/1 lines)

Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the diff:
+       if (ret) {
+               /* rollback the changes */
+               clk->min_rate = old_min; <- 2397
+               clk->max_rate = old_max; <- 2398

These are from before and were just moved around.

Note: this filters out code that wasn't compiled in and wasn't executable.
So that's why it's missing clk-raspberrypi.c and friends and it says
clk.c had 13 changed lines (since most of the lines are comments).

>
> ---
>  drivers/clk/.kunitconfig |   1 +
>  drivers/clk/Kconfig      |   7 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk_test.c   | 786 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 795 insertions(+)
>  create mode 100644 drivers/clk/clk_test.c
>
> diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
> index 3754fdb9485a..cdbc7d7deba9 100644
> --- a/drivers/clk/.kunitconfig
> +++ b/drivers/clk/.kunitconfig
> @@ -1,3 +1,4 @@
>  CONFIG_KUNIT=y
>  CONFIG_COMMON_CLK=y
> +CONFIG_CLK_KUNIT_TEST=y
>  CONFIG_CLK_GATE_KUNIT_TEST=y
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3cdf33470a75..2ef6eca297ff 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -429,6 +429,13 @@ source "drivers/clk/xilinx/Kconfig"
>  source "drivers/clk/zynqmp/Kconfig"
>
>  # Kunit test cases
> +config CLK_KUNIT_TEST
> +       tristate "Basic Clock Framework Kunit Tests" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         Kunit tests for the common clock framework.
> +
>  config CLK_GATE_KUNIT_TEST
>         tristate "Basic gate type Kunit test" if !KUNIT_ALL_TESTS
>         depends on KUNIT
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6a98291350b6..8f9b1daba411 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -2,6 +2,7 @@
>  # common clock types
>  obj-$(CONFIG_HAVE_CLK)         += clk-devres.o clk-bulk.o clkdev.o
>  obj-$(CONFIG_COMMON_CLK)       += clk.o
> +obj-$(CONFIG_CLK_KUNIT_TEST)   += clk_test.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-fixed-rate.o
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> new file mode 100644
> index 000000000000..0ca6cd391c8e
> --- /dev/null
> +++ b/drivers/clk/clk_test.c
> @@ -0,0 +1,786 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for clk rate management
> + */
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>

Very nit:
Is this #include <linux/slab.h> necessary?
I removed it and added a check that its header guard is not defined:

+#ifdef _LINUX_SLAB_H
+#error "Included slab.h indirectly"
+#endif

The test still compiled, so afaik, nothing here needs it.

>
> +
> +/* Needed for clk_hw_get_clk() */
> +#include "clk.h"
> +
> +#include <kunit/test.h>
> +
> +#define DUMMY_CLOCK_INIT_RATE  (42 * 1000 * 1000)
> +#define DUMMY_CLOCK_RATE_1     (142 * 1000 * 1000)
> +#define DUMMY_CLOCK_RATE_2     (242 * 1000 * 1000)
> +
> +struct clk_dummy_context {
> +       struct clk_hw hw;
> +       unsigned long rate;
> +};
> +
> +static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
> +                                          unsigned long parent_rate)
> +{
> +       struct clk_dummy_context *ctx =
> +               container_of(hw, struct clk_dummy_context, hw);
> +
> +       return ctx->rate;
> +}
> +
> +static int clk_dummy_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       /* Just return the same rate without modifying it */
> +       return 0;
> +}
> +
> +static int clk_dummy_maximize_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
> +{
> +       /*
> +        * If there's a maximum set, always run the clock at the maximum
> +        * allowed.
> +        */
> +       if (req->max_rate < ULONG_MAX)
> +               req->rate = req->max_rate;
> +
> +       return 0;
> +}
> +
> +static int clk_dummy_minimize_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
> +{
> +       /*
> +        * If there's a minimum set, always run the clock at the minimum
> +        * allowed.
> +        */
> +       if (req->min_rate > 0)
> +               req->rate = req->min_rate;
> +
> +       return 0;
> +}
> +
> +static int clk_dummy_set_rate(struct clk_hw *hw,
> +                             unsigned long rate,
> +                             unsigned long parent_rate)
> +{
> +       struct clk_dummy_context *ctx =
> +               container_of(hw, struct clk_dummy_context, hw);
> +
> +       ctx->rate = rate;
> +       return 0;
> +}
> +
> +static const struct clk_ops clk_dummy_rate_ops = {
> +       .recalc_rate = clk_dummy_recalc_rate,
> +       .determine_rate = clk_dummy_determine_rate,
> +       .set_rate = clk_dummy_set_rate,
> +};
> +
> +static const struct clk_ops clk_dummy_maximize_rate_ops = {
> +       .recalc_rate = clk_dummy_recalc_rate,
> +       .determine_rate = clk_dummy_maximize_rate,
> +       .set_rate = clk_dummy_set_rate,
> +};
> +
> +static const struct clk_ops clk_dummy_minimize_rate_ops = {
> +       .recalc_rate = clk_dummy_recalc_rate,
> +       .determine_rate = clk_dummy_minimize_rate,
> +       .set_rate = clk_dummy_set_rate,
> +};
> +
> +static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
> +{
> +       struct clk_dummy_context *ctx;
> +       struct clk_init_data init = { };
> +       int ret;
> +
> +       ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +       ctx->rate = DUMMY_CLOCK_INIT_RATE;
> +       test->priv = ctx;
> +
> +       init.name = "test_dummy_rate";
> +       init.ops = ops;
> +       ctx->hw.init = &init;
> +
> +       ret = clk_hw_register(NULL, &ctx->hw);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int clk_test_init(struct kunit *test)
> +{
> +       return clk_test_init_with_ops(test, &clk_dummy_rate_ops);
> +}
> +
> +static int clk_maximize_test_init(struct kunit *test)
> +{
> +       return clk_test_init_with_ops(test, &clk_dummy_maximize_rate_ops);
> +}
> +
> +static int clk_minimize_test_init(struct kunit *test)
> +{
> +       return clk_test_init_with_ops(test, &clk_dummy_minimize_rate_ops);
> +}
> +
> +static void clk_test_exit(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx = test->priv;
> +
> +       clk_hw_unregister(&ctx->hw);
> +}
> +
> +/*
> + * Test that the actual rate matches what is returned by clk_get_rate()
> + */
> +static void clk_test_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx = test->priv;
> +       struct clk_hw *hw = &ctx->hw;
> +       struct clk *clk = hw->clk;
> +       unsigned long rate;
> +
> +       rate = clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);

nit:
  KUNIT_ASSERT_GT(test, rate, 0);

Looks like we updated the others below but forgot this one.
