Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AD1E9491
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 01:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2C89ECD;
	Sat, 30 May 2020 23:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660589ECD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 23:58:34 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA183207BC
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 23:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590883113;
 bh=VUz6nHZXjZ/r4lCM+WBxybE+t4xw4kvQcisbJmoT/Dg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=18ho/PhYFDtcVEFFwa9kL4XMLHSHS3voxfTSEgSRGbxy+wrWU2KJ6VYRzamYa2M4c
 oODZBCidDXttGIIH56KairuG4hGqUTBS3F5Tbg/TAihKM+8KqipnLdYGHacHH++erf
 65sfhOv3W5JIIaGJXkt4EyX7DeBPsLOlDH0XR1Q8=
Received: by mail-lj1-f182.google.com with SMTP id q2so3694776ljm.10
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 16:58:32 -0700 (PDT)
X-Gm-Message-State: AOAM532v09EQ3BLwYYssi8mfPfiQxKOlcbDygxo0PIrIj2Nc5p9I/NkZ
 cfuEWHgxBSJN6K86A4ma6tkiET0+KF/NhZSJkTM=
X-Google-Smtp-Source: ABdhPJzgSmF0+p11oPO+AZBR8CytQW5O5N8qZczqfnM6nRVQcCxJIot76Q2X9ANKtvk8r/cwbxtdchn2Ly+QLKlKomk=
X-Received: by 2002:a05:651c:105a:: with SMTP id
 x26mr7446493ljm.159.1590883111232; 
 Sat, 30 May 2020 16:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200529163225eucas1p1cfb2233c869dcc3dab84b754bbce17b6@eucas1p1.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com>
 <20200529163200.18031-4-s.nawrocki@samsung.com>
In-Reply-To: <20200529163200.18031-4-s.nawrocki@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 31 May 2020 08:57:54 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1KC=jpQ5GXNtEf1cn7+WqXJdqbbVKmpxr8Snh4GEy8bA@mail.gmail.com>
Message-ID: <CAGTfZH1KC=jpQ5GXNtEf1cn7+WqXJdqbbVKmpxr8Snh4GEy8bA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sylwester,

On Sat, May 30, 2020 at 1:33 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> This patch adds registration of a child platform device for the exynos
> interconnect driver. It is assumed that the interconnect provider will
> only be needed when #interconnect-cells property is present in the bus
> DT node, hence the child device will be created only when such a property
> is present.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Changes for v5:
>  - new patch.
> ---
>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 8fa8eb5..856e37d 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -24,6 +24,7 @@
>
>  struct exynos_bus {
>         struct device *dev;
> +       struct platform_device *icc_pdev;
>
>         struct devfreq *devfreq;
>         struct devfreq_event_dev **edev;
> @@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
>         if (ret < 0)
>                 dev_warn(dev, "failed to disable the devfreq-event devices\n");
>
> +       platform_device_unregister(bus->icc_pdev);
> +
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
>         if (bus->opp_table) {
> @@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
>  {
>         struct exynos_bus *bus = dev_get_drvdata(dev);
>
> +       platform_device_unregister(bus->icc_pdev);
> +
>         dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
>  }
> @@ -431,6 +436,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto err;
>
> +       /* Create child platform device for the interconnect provider */
> +       if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
> +                   bus->icc_pdev = platform_device_register_data(
> +                                               dev, "exynos-generic-icc",
> +                                               PLATFORM_DEVID_AUTO, NULL, 0);
> +
> +                   if (IS_ERR(bus->icc_pdev)) {
> +                           ret = PTR_ERR(bus->icc_pdev);
> +                           goto err;
> +                   }
> +       }
> +
>         max_state = bus->devfreq->profile->max_state;
>         min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
>         max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
> --
> 2.7.4
>

It looks like very similar like the registering the interconnect
device of imx-bus.c
and I already reviewed and agreed this approach.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

nitpick: IMHO, I think that 'exynos-icc' is proper and simple without
'generic' word.
If we need to add new icc compatible int the future, we will add
'exynosXXXX-icc' new compatible.
But, I'm not forcing it. just opinion. Anyway, I agree this approach.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
