Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B863C595C8B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BDAA9746;
	Tue, 16 Aug 2022 12:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4978FA9757
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 12:58:53 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32fd97c199fso123384367b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+APQErezRUUuYStoYBWySEt+3xQfH5a4Q9eEyloCdO4=;
 b=x9KuSNkerI+YBEaGzHZaxyQOFaaIhzC2hmxvIzKzaouiPT+YK/IzNMAYIZm4fk8ZIz
 KJTaqm48f+h/6j6WO0/ZX5Yueu4KND2Q4toY6g9zv/VawjxSYddeZY092w9iGpCnd2oS
 5mmVo2B8eyaPhysGyIcStOE9xhUybTw7xGR8I5wt/2KYijQrq1+WUeAKy2aCNFbpODmn
 xWaJpIxSt/5dpXQYkqzb+SpHFwLil9isYYoj3oR16P1aLjE42kg5z5UPEmIPDOjPGKnz
 6U4T2coYJlFYhTfD7aEIEJ/pNyhyRG5kIJhawk5NDEndu8YV0YDxq0A55DxGmqS4gx7M
 tXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+APQErezRUUuYStoYBWySEt+3xQfH5a4Q9eEyloCdO4=;
 b=3HjdAUdkM2rPTjHeDQr0oY1yYzvR0jX5OCHSqJvlUlpNIavjCHgQ6J8E1gj8e0D67E
 2KBYKxSlsyCJraA+Hp43YlyOWHd/jYoQWaRmDtUN8n/8ipx+voUo3ObwqKuGnHaKlt0Y
 uxOnNOIDYiB1vKTmBmU5fb0qG24Jh1jDfwftmiVlTWufByxlmPudJ5VX3qLIKoVh1HAn
 racY+EWuSYHOzbZ6KtyYuZAHto8U+Rs8ozUK4xX1vHGB7O2vyt2vK8g58pXWGx5RTBBV
 igTRufCAu1upIqqr6OrEx4Lumq0x74YaVqwh96/crtwYVF+PQYl8MQGRupFA8EPAmikY
 +Cmw==
X-Gm-Message-State: ACgBeo1r1O7uMcNOKnMwRfam1+QNyS2gR+qyZ6npp50Xzr4iCaKSb5f/
 VZaZyHo0Wr+/3dBNPt7stetL2/4pBNH+GT8KfkaRQw==
X-Google-Smtp-Source: AA6agR4bFaX1jNBrHlmDiDERjLQUfuKqNK4/8sdZ6mHGzjqdQD862rW8hycDmUmJCJ/71dKdH/tropAgISbUudHzrlU=
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr10207096ywf.316.1660654732311; Tue, 16
 Aug 2022 05:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
In-Reply-To: <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Tue, 16 Aug 2022 20:58:41 +0800
Message-ID: <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] regulator: core: Allow specifying an initial load
 w/ the bulk API
To: Douglas Anderson <dianders@chromium.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, John Stultz <jstultz@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI, Douglas

With this change, I get one kernel panic with my hikey960
android-mainline based Android build,
if it's reverted, then the build could boot to the home screen successfully.
From the log information I shared here, not sure if you have any idea
what I could do to have the hikey960
build work with this change,

The kernel panic is something like this, for details, please check the
log here: http://ix.io/47Lq

[   10.738042][  T193] adv7511 1-0039: error 0000000000000000: Failed
to get supply 'v1p2'
[   10.748457][  T194] apexd: Found pre-installed APEX
/system/apex/com.android.os.statsd.apex
[   10.752908][   T67] Unable to handle kernel read from unreadable
memory at virtual address 000000000000004c
[   10.753116][    T8] Unable to handle kernel read from unreadable
memory at virtual address 0000000000000078
[   10.753130][    T8] Mem abort info:
[   10.753135][    T8]   ESR = 0x0000000096000005
[   10.753142][    T8]   EC = 0x25: DABT (current EL), IL = 32 bits
[   10.753152][    T8]   SET = 0, FnV = 0
[   10.753159][    T8]   EA = 0, S1PTW = 0
[   10.753166][    T8]   FSC = 0x05: level 1 translation fault
[   10.753174][    T8] Data abort info:
[   10.753179][    T8]   ISV = 0, ISS = 0x00000005
[   10.753184][    T8]   CM = 0, WnR = 0
[   10.753192][    T8] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000003098000
[   10.753204][    T8] [0000000000000078] pgd=0000000000000000,
p4d=0000000000000000, pud=0000000000000000
[   10.753232][    T8] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[   10.753245][    T8] Modules linked in: adv7511(E+) tcpci_rt1711h(E)
hci_uart(E) btqca(E) btbcm(E) cpufreq_dt(E) hi3660_i2s(E)
hisi_hikey_usb(E) hi6421_pmic_core(E) syscon_reboot_mode(E)
reboot_mode(E) hi3660_mailbox(E) dw_mmc_k3(E) hisi_thermal(E)
dw_mmc_pltfm(E) dw_mmc(E) kirin_drm(E) snd_soc_simple_card(E)
snd_soc_simple_card_utils(E) spi_pl022(E) kirin_dsi(E)
phy_hi3660_usb3(E) i2c_designware_platform(E) drm_cma_helper(E)
i2c_designware_core(E) mali_kbase(OE) k3dma(E) cma_heap(E)
system_heap(E)
[   10.753436][    T8] CPU: 2 PID: 8 Comm: kworker/u16:0 Tainted: G
       OE      5.19.0-mainline-03487-g86d047950300-dirty #1
[   10.753454][    T8] Hardware name: HiKey960 (DT)
[   10.753463][    T8] Workqueue: events_unbound async_run_entry_fn
[   10.753497][    T8] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[   10.753516][    T8] pc : regulator_bulk_enable_async+0x3c/0x98
[   10.753540][    T8] lr : async_run_entry_fn+0x30/0xf8
[   10.753559][    T8] sp : ffffffc009ed3d20
[   10.753567][    T8] x29: ffffffc009ed3d40 x28: 0000000000000402
x27: ffffff801ad99828
[   10.753592][    T8] x26: ffffff803217b010 x25: 0000000000000002
x24: ffffff8003385da8
[   10.753617][    T8] x23: ffffff8003385da0 x22: ffffff801ad94805
x21: ffffff8003385da0
[   10.753642][    T8] x20: 0000000000000000 x19: ffffff8003143d20
x18: ffffffc008075028
[   10.753667][    T8] x17: 000000040044ffff x16: 0000000000000001
x15: 0000000000000010
[   10.753691][    T8] x14: 0000000000000000 x13: 0000000000000f58
x12: 0000000082355555
[   10.753715][    T8] x11: 00006acfbfa2f400 x10: 0000000000000016 x9
: 00ffffffffffffff
[   10.753740][    T8] x8 : da9ecda1b63b0500 x7 : 0000000000008080 x6
: 0000000000000000
[   10.753764][    T8] x5 : 0000000000000001 x4 : 0000646e756f626e x3
: ffffff801ad99828
[   10.753788][    T8] x2 : ffffff8003385da8 x1 : ffffffc009ed3d20 x0
: ffffff8003143d20
[   10.753812][    T8] Call trace:
[   10.753818][    T8]  regulator_bulk_enable_async+0x3c/0x98
[   10.753839][    T8]  async_run_entry_fn+0x30/0xf8
[   10.753859][    T8]  process_one_work+0x1d0/0x404
[   10.753879][    T8]  worker_thread+0x25c/0x43c
[   10.753897][    T8]  kthread+0xf0/0x2c0
[   10.753912][    T8]  ret_from_fork+0x10/0x20
[   10.753940][    T8] Code: f81f83a8 f9400814 a900ffff f90003ff (f9403e95)
[   10.753950][    T8] ---[ end trace 0000000000000000 ]---
[   10.760621][  T194] apexd: Found pre-installed APEX
/system/apex/com.android.permission.capex
[   10.767672][   T67] Mem abort info:
[   10.779658][  T194] apexd: Found pre-installed APEX
/system/apex/com.android.art.capex
[   10.783690][   T67]   ESR = 0x0000000096000005
[   10.792424][  T194] apexd: Found pre-installed APEX
/system/apex/com.android.scheduling.capex
[   10.794713][    T8] Kernel panic - not syncing: Oops: Fatal exception
[   10.794723][    T8] SMP: stopping secondary CPUs
[   10.798141][    T8] Kernel Offset: 0x70000 from 0xffffffc008000000
[   10.798150][    T8] PHYS_OFFSET: 0x0
[   10.798156][    T8] CPU features: 0x0000,00649020,00001086
[   10.798167][    T8] Memory Limit: none

Thanks,
Yongqin Liu

On Wed, 27 Jul 2022 at 01:39, Douglas Anderson <dianders@chromium.org> wrote:
>
> There are a number of drivers that follow a pattern that looks like
> this:
> 1. Use the regulator bulk API to get a bunch of regulators.
> 2. Set the load on each of the regulators to use whenever the
>    regulators are enabled.
>
> Let's make this easier by just allowing the drivers to pass the load
> in.
>
> As part of this change we need to move the error printing in
> regulator_bulk_get() around; let's switch to the new dev_err_probe()
> to simplify it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - ("Allow specifying an initial load w/ the bulk API") new for v2.
>
>  drivers/regulator/core.c           | 20 ++++++++++++--------
>  include/linux/regulator/consumer.h | 12 ++++++++----
>  2 files changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 1e54a833f2cf..17c476fc8adb 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -4783,22 +4783,26 @@ int regulator_bulk_get(struct device *dev, int num_consumers,
>                 consumers[i].consumer = regulator_get(dev,
>                                                       consumers[i].supply);
>                 if (IS_ERR(consumers[i].consumer)) {
> -                       ret = PTR_ERR(consumers[i].consumer);
>                         consumers[i].consumer = NULL;
> +                       ret = dev_err_probe(dev, PTR_ERR(consumers[i].consumer),
> +                                           "Failed to get supply '%s'",
> +                                           consumers[i].supply);
>                         goto err;
>                 }
> +
> +               if (consumers[i].init_load_uA > 0) {
> +                       ret = regulator_set_load(consumers[i].consumer,
> +                                                consumers[i].init_load_uA);
> +                       if (ret) {
> +                               i++;
> +                               goto err;
> +                       }
> +               }
>         }
>
>         return 0;
>
>  err:
> -       if (ret != -EPROBE_DEFER)
> -               dev_err(dev, "Failed to get supply '%s': %pe\n",
> -                       consumers[i].supply, ERR_PTR(ret));
> -       else
> -               dev_dbg(dev, "Failed to get supply '%s', deferring\n",
> -                       consumers[i].supply);
> -
>         while (--i >= 0)
>                 regulator_put(consumers[i].consumer);
>
> diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
> index bbf6590a6dec..5779f4466e62 100644
> --- a/include/linux/regulator/consumer.h
> +++ b/include/linux/regulator/consumer.h
> @@ -171,10 +171,13 @@ struct regulator;
>  /**
>   * struct regulator_bulk_data - Data used for bulk regulator operations.
>   *
> - * @supply:   The name of the supply.  Initialised by the user before
> - *            using the bulk regulator APIs.
> - * @consumer: The regulator consumer for the supply.  This will be managed
> - *            by the bulk API.
> + * @supply:       The name of the supply.  Initialised by the user before
> + *                using the bulk regulator APIs.
> + * @init_load_uA: After getting the regulator, regulator_set_load() will be
> + *                called with this load.  Initialised by the user before
> + *                using the bulk regulator APIs.
> + * @consumer:     The regulator consumer for the supply.  This will be managed
> + *                by the bulk API.
>   *
>   * The regulator APIs provide a series of regulator_bulk_() API calls as
>   * a convenience to consumers which require multiple supplies.  This
> @@ -182,6 +185,7 @@ struct regulator;
>   */
>  struct regulator_bulk_data {
>         const char *supply;
> +       int init_load_uA;
>         struct regulator *consumer;
>
>         /* private: Internal use */
> --
> 2.37.1.359.gd136c6c3e2-goog
>


-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
