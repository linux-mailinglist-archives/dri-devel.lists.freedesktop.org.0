Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93759D131
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 08:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D918AEF67;
	Tue, 23 Aug 2022 06:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3822AB2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 06:23:10 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-333b049f231so353974777b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 23:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1UqKPaGe9Qk3vp8Znc+z/eq2Z9Z5pvzQBDNSmVG3/40=;
 b=bKRmxcLE/SEepkJu/bwoHG3oW0rRSzE/IGah57cca8ytnyqf0gAo+A7EAKR0XUDnt0
 GSqy5qoi9g6qwX5jqvyYvFL5eBYkvHJ3SNVeNRDlacmsm+VLAOYBgeLIsqdKOTk6HBko
 pQhwkzwejgi5bEsahqA311YtpC9fvyA7km+grRp2ZIhhmw7p0tLy1lkLRqd8cigj1Tlb
 AhEYmsDKD+/eDpYCTh0O8vge1OTFYmwCTRX2dprgYEZ0sI2XcNmIXOqb4AReM4Xh4d0c
 Ovyn/Vwalv4tyml3nK2BYjucFUE9IJZkP8cIcZuPyeEoaCea2BkwYZcHviuz649WUIOe
 ohog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1UqKPaGe9Qk3vp8Znc+z/eq2Z9Z5pvzQBDNSmVG3/40=;
 b=7Q4cP+bUIgG9mpPOgxe2YPr48CSQQhdc78m4eDEQbkkUSK5maiQ5QdZubKXSZmAq85
 l7GaC3cUNSBtvKWQim8cPGAOHBvYyZ6lkJcGWUintFFazTwcWQ/2OYXgZEQZjNSG+azo
 sLfzGCAT7Zt/0kehLzs3FSgpJomcJOX+IPhZVdStUjqIfuCxS8xEAju+djIjQ2RdqmKW
 +LlICqRlO7SdK1OVJtqwvCFSyL7/crvE4iRC60E6r4HpLR5+cFwM70z371Kw220lECEN
 dEfvsaXCFOAoX0+31yg74CNeAkU2/GhzALRCgmzIN/QyvXKGvvJ64dm6McOD/21pv4Sk
 G/+A==
X-Gm-Message-State: ACgBeo1UMs4H+Y2pWHoGljZfTeoTFoUXNHk/Z497kUNAPFeAVzY5WkXX
 qFthOoQZguK3PMDoEfs9/3usxC/Fehf9JICcHYW9qw==
X-Google-Smtp-Source: AA6agR7XYC6ur0AAd7uIG5S+tIsX3RSuHdYPq6dKdSapZxWR9BU6yEkCARgRrdeUmn5A8X23pBhZ7sIkWOJY4vR+8zM=
X-Received: by 2002:a25:9d91:0:b0:67b:cd9f:ef88 with SMTP id
 v17-20020a259d91000000b0067bcd9fef88mr22808130ybp.82.1661235789155; Mon, 22
 Aug 2022 23:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
 <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
 <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
 <CAMSo37Uve4qrAA81zrO9eOGc4y7vjg-OZ9L7m9xWM7UkQ6PzmQ@mail.gmail.com>
In-Reply-To: <CAMSo37Uve4qrAA81zrO9eOGc4y7vjg-OZ9L7m9xWM7UkQ6PzmQ@mail.gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Tue, 23 Aug 2022 14:22:58 +0800
Message-ID: <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] regulator: core: Allow specifying an initial load
 w/ the bulk API
To: Doug Anderson <dianders@chromium.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Steve Muckle <smuckle@google.com>,
 Alistair Delva <alistair.delva@linaro.org>, Mark Brown <broonie@kernel.org>,
 John Stultz <jstultz@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Todd Kjos <tkjos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Douglas

Just an update on the fix you pointed out previously here:
> > [1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid

With it I could boot the hikey960 build to the home screen if it does
not use the GKI kernel.
but the problem will be reproduced if it uses the GKI kernel.

And if this change is reverted, then it could boot with the GKI kernel as well.

I am not sure what's the reason there, but there seems to be some
difference with the fix above and the workaround of revert.
Not sure if you have any idea about that.

Regarding the GKI kernel(Android Generic Kernel Image)[2], it's built
from the android-mainline tree(f51334eac4de) without any workaround.
(Neither the revert, nor the fix applied), and the regulator modules
used for the hikey960 build are hi6421v530-regulator.ko and
hi655x-regulator.ko

I am still not sure if it would work with the GKI kernel that has the
fix that you pointed out in. the case that both the GKI kernel and
vendor tree have the fix.
Will update here when I have some results.

[2]: https://source.android.com/docs/core/architecture/kernel/generic-kernel-image?hl=en

Thanks,
Yongqin Liu

On Thu, 18 Aug 2022 at 00:52, Yongqin Liu <yongqin.liu@linaro.org> wrote:
>
> Hi, Douglas
>
> On Wed, 17 Aug 2022 at 22:26, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Aug 16, 2022 at 5:58 AM Yongqin Liu <yongqin.liu@linaro.org> wrote:
> > >
> > > HI, Douglas
> > >
> > > With this change, I get one kernel panic with my hikey960
> > > android-mainline based Android build,
> > > if it's reverted, then the build could boot to the home screen successfully.
> > > From the log information I shared here, not sure if you have any idea
> > > what I could do to have the hikey960
> > > build work with this change,
> > >
> > > The kernel panic is something like this, for details, please check the
> > > log here: http://ix.io/47Lq
> > >
> > > [   10.738042][  T193] adv7511 1-0039: error 0000000000000000: Failed
> > > to get supply 'v1p2'
> > > [   10.748457][  T194] apexd: Found pre-installed APEX
> > > /system/apex/com.android.os.statsd.apex
> > > [   10.752908][   T67] Unable to handle kernel read from unreadable
> > > memory at virtual address 000000000000004c
> > > [   10.753116][    T8] Unable to handle kernel read from unreadable
> > > memory at virtual address 0000000000000078
> > > [   10.753130][    T8] Mem abort info:
> > > [   10.753135][    T8]   ESR = 0x0000000096000005
> > > [   10.753142][    T8]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [   10.753152][    T8]   SET = 0, FnV = 0
> > > [   10.753159][    T8]   EA = 0, S1PTW = 0
> > > [   10.753166][    T8]   FSC = 0x05: level 1 translation fault
> > > [   10.753174][    T8] Data abort info:
> > > [   10.753179][    T8]   ISV = 0, ISS = 0x00000005
> > > [   10.753184][    T8]   CM = 0, WnR = 0
> > > [   10.753192][    T8] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000003098000
> > > [   10.753204][    T8] [0000000000000078] pgd=0000000000000000,
> > > p4d=0000000000000000, pud=0000000000000000
> > > [   10.753232][    T8] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> > > [   10.753245][    T8] Modules linked in: adv7511(E+) tcpci_rt1711h(E)
> > > hci_uart(E) btqca(E) btbcm(E) cpufreq_dt(E) hi3660_i2s(E)
> > > hisi_hikey_usb(E) hi6421_pmic_core(E) syscon_reboot_mode(E)
> > > reboot_mode(E) hi3660_mailbox(E) dw_mmc_k3(E) hisi_thermal(E)
> > > dw_mmc_pltfm(E) dw_mmc(E) kirin_drm(E) snd_soc_simple_card(E)
> > > snd_soc_simple_card_utils(E) spi_pl022(E) kirin_dsi(E)
> > > phy_hi3660_usb3(E) i2c_designware_platform(E) drm_cma_helper(E)
> > > i2c_designware_core(E) mali_kbase(OE) k3dma(E) cma_heap(E)
> > > system_heap(E)
> > > [   10.753436][    T8] CPU: 2 PID: 8 Comm: kworker/u16:0 Tainted: G
> > >        OE      5.19.0-mainline-03487-g86d047950300-dirty #1
> > > [   10.753454][    T8] Hardware name: HiKey960 (DT)
> > > [   10.753463][    T8] Workqueue: events_unbound async_run_entry_fn
> > > [   10.753497][    T8] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
> > > -SSBS BTYPE=--)
> > > [   10.753516][    T8] pc : regulator_bulk_enable_async+0x3c/0x98
> > > [   10.753540][    T8] lr : async_run_entry_fn+0x30/0xf8
> > > [   10.753559][    T8] sp : ffffffc009ed3d20
> > > [   10.753567][    T8] x29: ffffffc009ed3d40 x28: 0000000000000402
> > > x27: ffffff801ad99828
> > > [   10.753592][    T8] x26: ffffff803217b010 x25: 0000000000000002
> > > x24: ffffff8003385da8
> > > [   10.753617][    T8] x23: ffffff8003385da0 x22: ffffff801ad94805
> > > x21: ffffff8003385da0
> > > [   10.753642][    T8] x20: 0000000000000000 x19: ffffff8003143d20
> > > x18: ffffffc008075028
> > > [   10.753667][    T8] x17: 000000040044ffff x16: 0000000000000001
> > > x15: 0000000000000010
> > > [   10.753691][    T8] x14: 0000000000000000 x13: 0000000000000f58
> > > x12: 0000000082355555
> > > [   10.753715][    T8] x11: 00006acfbfa2f400 x10: 0000000000000016 x9
> > > : 00ffffffffffffff
> > > [   10.753740][    T8] x8 : da9ecda1b63b0500 x7 : 0000000000008080 x6
> > > : 0000000000000000
> > > [   10.753764][    T8] x5 : 0000000000000001 x4 : 0000646e756f626e x3
> > > : ffffff801ad99828
> > > [   10.753788][    T8] x2 : ffffff8003385da8 x1 : ffffffc009ed3d20 x0
> > > : ffffff8003143d20
> > > [   10.753812][    T8] Call trace:
> > > [   10.753818][    T8]  regulator_bulk_enable_async+0x3c/0x98
> > > [   10.753839][    T8]  async_run_entry_fn+0x30/0xf8
> > > [   10.753859][    T8]  process_one_work+0x1d0/0x404
> > > [   10.753879][    T8]  worker_thread+0x25c/0x43c
> > > [   10.753897][    T8]  kthread+0xf0/0x2c0
> > > [   10.753912][    T8]  ret_from_fork+0x10/0x20
> > > [   10.753940][    T8] Code: f81f83a8 f9400814 a900ffff f90003ff (f9403e95)
> > > [   10.753950][    T8] ---[ end trace 0000000000000000 ]---
> > > [   10.760621][  T194] apexd: Found pre-installed APEX
> > > /system/apex/com.android.permission.capex
> > > [   10.767672][   T67] Mem abort info:
> > > [   10.779658][  T194] apexd: Found pre-installed APEX
> > > /system/apex/com.android.art.capex
> > > [   10.783690][   T67]   ESR = 0x0000000096000005
> > > [   10.792424][  T194] apexd: Found pre-installed APEX
> > > /system/apex/com.android.scheduling.capex
> > > [   10.794713][    T8] Kernel panic - not syncing: Oops: Fatal exception
> > > [   10.794723][    T8] SMP: stopping secondary CPUs
> > > [   10.798141][    T8] Kernel Offset: 0x70000 from 0xffffffc008000000
> > > [   10.798150][    T8] PHYS_OFFSET: 0x0
> > > [   10.798156][    T8] CPU features: 0x0000,00649020,00001086
> > > [   10.798167][    T8] Memory Limit: none
> >
> > Are you fixed by the patch ("regulator: core: Fix missing error return
> > from regulator_bulk_get()") [1]
> >
> > [1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid
>
> Thanks for the check!
> I tested the above patch with the android-mainline based kernel,
> and it fixes the regulator_bulk_enable_async kernel panic reported here.
>
> --
> Best Regards,
> Yongqin Liu
> ---------------------------------------------------------------
> #mailing list
> linaro-android@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-android



-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
