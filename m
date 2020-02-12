Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE4A15A3DA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBA36E9CA;
	Wed, 12 Feb 2020 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60F6E9CA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 08:49:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k7so985701qth.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BPMiAB16vFeuTny9mUeuPkgcErc/c1u/+DPFpZpBO4k=;
 b=OQE3DuQq8CSnmuvX45YQR0RHiYLUGWs9u/r3JwctxlV8TEpNMLx/YMPZIei1Z67SOj
 0gEvNwWN+/xeYQZkOHf+6kBok3+slMsYBUX9OkzK4tjvEd0pZDfxbvlMjSBD0n8hDoTF
 BWP+0WkA8vvCdMDpt2dOH1ibDeLpIIZe+axss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BPMiAB16vFeuTny9mUeuPkgcErc/c1u/+DPFpZpBO4k=;
 b=jgnNI+9WDrCSeYl4Quw+KfYQ6rcMXgWvUo0qZkPQIre9DH37Vv7m1Q8oYbuPQt57ok
 N7+r/OzHVOOhlmmInvil1rdywht1yJACkdyrqgOWbWmy67i166Qpj9j6XhnbBYNDV67b
 r4T3vLmrqJmigsxnvGaoUC2rtKk9WWqXcpbwF+GbqdNY7hrPeIZ7csjICAGDnHSSc2Ls
 ZKBAbaNFnbsFdaNKR7IGPb7Bv2gOzBvWlUfGT0LVQXNtaHGXUxOGDhjlhYZl6mfRfqKm
 snkiGYBzLY8Oj7G/u4tLF0yiKNfgj8WrStEgwNIO+G3MB09x9BrMzfYWr/I6o2dRoLyr
 hX/A==
X-Gm-Message-State: APjAAAWQ7N57N2TXWCGUq5WgOWIuRoF0QzNXpBCOMj/cEQNJLrnw7H0J
 tFj6YBH7pxV7Fj3e9TbTLIWa5ayvLyvfXIwhPeqYng==
X-Google-Smtp-Source: APXvYqzmVKHpUTNXqrbIKC3EqSdbu2muveQewCve0sKVxzWsWtlKrXbYUc3Qqq6GrpJeSuO++OcFsP8+K90kFIcIFgk=
X-Received: by 2002:ac8:4446:: with SMTP id m6mr6253965qtn.159.1581497358305; 
 Wed, 12 Feb 2020 00:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-8-drinkcat@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 12 Feb 2020 16:49:07 +0800
Message-ID: <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Rob Herring <robh+dt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Viresh Kumar +Stephen Boyd for clock advice.

On Fri, Feb 7, 2020 at 1:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
> devfreq, and provides OPP table with 2 sets of voltages.
>
> TODO: This is incomplete as we'll need add support for setting
> a pair of voltages as well.

So all we need for this to work (at least apparently, that is, I can
change frequency) is this:
https://lore.kernel.org/patchwork/patch/1192945/
(ah well, Viresh just replied, so, probably not, I'll check that out
and use the correct API)

But then there's a slight problem: panfrost_devfreq uses a bunch of
clk_get_rate calls, and the clock PLLs (at least on MTK platform) are
never fully precise, so we get back 299999955 for 300 Mhz and
799999878 for 800 Mhz. That means that the kernel is unable to keep
devfreq stats as neither of these values are in the table:
[ 4802.470952] devfreq devfreq1: Couldn't update frequency transition
information.
The kbase driver fixes this by remembering the last set frequency, and
reporting that to devfreq. Should we do that as well or is there a
better fix?

Another thing that I'm not implementing is the dance that Mediatek
does in their kbase driver when changing the clock (described in patch
2/7):
""
The binding we use with out-of-tree Mali drivers includes more
clocks, this is used for devfreq: the out-of-tree driver switches
clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
switches clk_mux back to clk_main_parent:
(see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
clocks =
        <&topckgen CLK_TOP_MFGPLL_CK>,
        <&topckgen CLK_TOP_MUX_MFG>,
        <&clk26m>,
        <&mfgcfg CLK_MFG_BG3D>;
clock-names =
        "clk_main_parent",
        "clk_mux",
        "clk_sub_parent",
        "subsys_mfg_cg";
""
Is there a clean/simple way to implement this in the clock
framework/device tree? Or should we implement something in the
panfrost driver?

Thanks!



>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbfccb..9c0987a3d71c597 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -79,6 +79,21 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>         struct devfreq *devfreq;
>         struct thermal_cooling_device *cooling;
>
> +       /* If we have 2 regulator, we need an OPP table with 2 voltages. */
> +       if (pfdev->comp->num_supplies > 1) {
> +               pfdev->devfreq.dev_opp_table =
> +                       dev_pm_opp_set_regulators(dev,
> +                                       pfdev->comp->supply_names,
> +                                       pfdev->comp->num_supplies);
> +               if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
> +                       ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
> +                       pfdev->devfreq.dev_opp_table = NULL;
> +                       dev_err(dev,
> +                               "Failed to init devfreq opp table: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
>         ret = dev_pm_opp_of_add_table(dev);
>         if (ret == -ENODEV) /* Optional, continue without devfreq */
>                 return 0;
> @@ -119,6 +134,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>         if (pfdev->devfreq.cooling)
>                 devfreq_cooling_unregister(pfdev->devfreq.cooling);
>         dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> +       if (pfdev->devfreq.dev_opp_table)
> +               dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
>  }
>
>  void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index c30c719a805940a..5009a8b7c853ea1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -110,6 +110,7 @@ struct panfrost_device {
>         struct {
>                 struct devfreq *devfreq;
>                 struct thermal_cooling_device *cooling;
> +               struct opp_table *dev_opp_table;
>                 ktime_t busy_time;
>                 ktime_t idle_time;
>                 ktime_t time_last_update;
> --
> 2.25.0.341.g760bfbb309-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
