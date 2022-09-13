Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D75B7C2C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5825410E482;
	Tue, 13 Sep 2022 20:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x42.google.com (mail-oa1-x42.google.com
 [IPv6:2001:4860:4864:20::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6137D10E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:23:15 +0000 (UTC)
Received: by mail-oa1-x42.google.com with SMTP id
 586e51a60fabf-1279948d93dso35263692fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6X33VZ9xVlzasDbOaFozkt+4gqxM1mm4FvPj9a+zgss=;
 b=hJ/3uTYUr+vuvwzF4Q2GgiFbAuB2lW1NlkbB9S6lLQCf3jZxqHSFGiJHWgeb4M7Ajy
 And+dqPXJ9KASQDFhQEOLx9eebbFE4QezQE8pcq50oXDtrXRvOvYMpdoyxdHK1BewraC
 89mp1O4VBXPfw21kBZONEEPhBa+yHEwlXfI70SuJPocETURRIDMfWuOEYhKPRR0yfFl8
 um0CV4CfKSfeX5u3+Ry//tpKCS+lr5EJlGcv7Qw47tPgV6YwM2VBELMbrzxAJmI+l1yQ
 +IJTg97nDYqjYw6448qp21eMXNbtHoEnnCfW8KBLunyehbpkIsGg2vk9glNktcBvz1yQ
 p/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6X33VZ9xVlzasDbOaFozkt+4gqxM1mm4FvPj9a+zgss=;
 b=yLw9eDvTPjaJx3o83T+I4sKA5pzyxECy4ZC+F639+Ni3NrHot3pOr5I8SL9uV1negA
 UjBZCRCbgwveEFiEuybHs1wxGcqYJiAd+UA5AlztmxmktaM9CL0wJjJjTLe3t2p+LSFw
 P9SxOgTHaHV4DHZBvKO/j194MZr+3KvUVktdo1nKA/fgYoyoA1i6NwVcGijbE8zaNnzb
 CByhpiljTdHbaVP0XLmkoDR7JSDdo45mZdrYqA4cgHtqdDR/cpvPKJhuAfAmHnKID2XW
 SsprD3l6MHJs6CVEY7JPGygGF1eV5OST3OluHPKfiihug7yHH/FvCFtAPdP6Fk0ZLcU5
 noHg==
X-Gm-Message-State: ACgBeo3LYA3qZruEDUtc8lBd4C6i1UdrvK5IH1yK7BHcR4LkO+gYrm4R
 4KwO9Lk9ZyvwCoauEiGdmohcnA==
X-Google-Smtp-Source: AA6agR4sE6iO299k1441Fl9TgoF2WviuxUixje8L0+45xbHkQDDXYigU7ZN+I2PbTcMNCSwZcbhUEA==
X-Received: by 2002:a05:6870:64a2:b0:12b:7db:b8e1 with SMTP id
 cz34-20020a05687064a200b0012b07dbb8e1mr546286oab.212.1663100594351; 
 Tue, 13 Sep 2022 13:23:14 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 d3-20020a9d5e03000000b00636d4e8d480sm6377224oti.19.2022.09.13.13.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 13:23:13 -0700 (PDT)
Message-ID: <ca6a97c5-1abe-b215-0ff2-443f4ed9a25f@kali.org>
Date: Tue, 13 Sep 2022 15:23:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220913085320.8577-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan,

On 9/13/22 3:53 AM, Johan Hovold wrote:
> The MSM DRM driver is currently broken in multiple ways with respect to
> probe deferral. Not only does the driver currently fail to probe again
> after a late deferral, but due to a related use-after-free bug this also
> triggers NULL-pointer dereferences.
>
> These bugs are not new but have become critical with the release of
> 5.19 where probe is deferred in case the aux-bus EP panel driver has not
> yet been loaded.
>
> The underlying problem is lifetime issues due to careless use of
> device-managed resources.
>
> Specifically, device-managed resources allocated post component bind
> must be tied to the lifetime of the aggregate DRM device or they will
> not necessarily be released when binding of the aggregate device is
> deferred.
>
> The following call chain and pseudo code serves as an illustration of
> the problem:
>
>   - platform_probe(pdev1)
>     - dp_display_probe()
>       - component_add()
>
>   - platform_probe(pdev2) 				// last component
>     - dp_display_probe()					// d0
>         - component_add()
>           - try_to_bring_up_aggregate_device()
> 	   - devres_open_group(adev->parent)		// d1
>
> 	   - msm_drm_bind()
> 	     - msm_drm_init()
> 	       - component_bind_all()
> 	         - for_each_component()
> 		   - component_bind()
> 		     - devres_open_group(&pdev->dev)	// d2
> 	             - dp_display_bind()
> 		       - devm_kzalloc(&pdev->dev)	// a1, OK
> 		     - devres_close_group(&pdev->dev)	// d3
>
> 	       - dpu_kms_hw_init()
> 	         - for_each_panel()
> 	           - msm_dp_modeset_init()
> 		     - dp_display_request_irq()
> 		       - devm_request_irq(&pdev->dev)	// a2, BUG
> 		     - if (pdev == pdev2 && condition)
> 		       - return -EPROBE_DEFER;
>
> 	      - if (error)
>   	        - component_unbind_all()
> 	          - for_each_component()
> 		    - component_unbind()
> 		      - dp_display_unbind()
> 		      - devres_release_group(&pdev->dev) // d4, only a1 is freed
>
>             - if (error)
> 	     - devres_release_group(adev->parent)	// d5
>
> The device-managed allocation a2 is buggy as its lifetime is tied to the
> component platform device and will not be released when the aggregate
> device bind fails (e.g. due to a probe deferral).
>
> When pdev2 is later probed again, the attempt to allocate the IRQ a
> second time will fail for pdev1 (which is still bound to its platform
> driver).
>
> This series fixes the lifetime issues by tying the lifetime of a2 (and
> similar allocations) to the lifetime of the aggregate device so that a2
> is released at d5.
>
> In some cases, such has for the DP IRQ, the above situation can also be
> avoided by moving the allocation in question to the platform driver
> probe (d0) or component bind (between d2 and d3). But as doing so is not
> a general fix, this can be done later as a cleanup/optimisation.
>
> Johan
>
> Changes in v2
>   - use a custom devres action instead of amending the AUX bus interface
>     (Doug)
>   - split sanity check fixes and cleanups per bridge type (Dmitry)
>   - add another Fixes tag for the missing bridge counter reset (Dmitry)
>
>
> Johan Hovold (10):
>    drm/msm: fix use-after-free on probe deferral
>    drm/msm/dp: fix memory corruption with too many bridges
>    drm/msm/dsi: fix memory corruption with too many bridges
>    drm/msm/hdmi: fix memory corruption with too many bridges
>    drm/msm/dp: fix IRQ lifetime
>    drm/msm/dp: fix aux-bus EP lifetime
>    drm/msm/dp: fix bridge lifetime
>    drm/msm/hdmi: fix IRQ lifetime
>    drm/msm/dp: drop modeset sanity checks
>    drm/msm/dsi: drop modeset sanity checks
>
>   drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++++++++-------
>   drivers/gpu/drm/msm/dp/dp_parser.c  |  6 +++---
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  5 +++--
>   drivers/gpu/drm/msm/dsi/dsi.c       |  9 +++++----
>   drivers/gpu/drm/msm/hdmi/hdmi.c     |  7 ++++++-
>   drivers/gpu/drm/msm/msm_drv.c       |  1 +
>   6 files changed, 37 insertions(+), 17 deletions(-)
>
I've tested this on both sc8180x (Lenovo Flex 5G) and sdm850 (Lenovo 
Yoga C630), and both of them show the same issue:

[ 7.449305] platform ae9a000.displayport-controller: Fixing up cyclic 
dependency with ae01000.mdp [ 7.454344] Unable to handle kernel NULL 
pointer dereference at virtual address 0000000000000008 [ 7.454406] Mem 
abort info: [ 7.454423] ESR = 0x0000000096000004 [ 7.454446] EC = 0x25: 
DABT (current EL), IL = 32 bits [ 7.454475] SET = 0, FnV = 0 [ 7.454494] 
EA = 0, S1PTW = 0 [ 7.454512] FSC = 0x04: level 0 translation fault [ 
7.454539] Data abort info: [ 7.454556] ISV = 0, ISS = 0x00000004 [ 
7.454577] CM = 0, WnR = 0 [ 7.454595] user pgtable: 4k pages, 48-bit 
VAs, pgdp=0000000101504000 [ 7.454629] [0000000000000008] 
pgd=0000000000000000, p4d=0000000000000000 [ 7.454669] Internal error: 
Oops: 96000004 [#1] PREEMPT SMP [ 7.454700] Modules linked in: 
i2c_hid_of i2c_hid leds_qcom_lpg led_class_multicolor rtc_pm8xxx msm 
mdt_loader gpu_sched drm_dp_aux_bus drm_display_helper drm_kms_helper 
drm phy_qcom_edp llcc_qcom i2c_qcom_geni phy_qcom_qmp_combo 
phy_qcom_snps_femto_v2 phy_qcom_qmp_ufs phy_qcom_qmp_pcie ufs_qcom 
pwm_bl [ 7.454860] CPU: 2 PID: 76 Comm: kworker/u16:2 Not tainted 
5.19.0-rc8-next-20220728 #26 [ 7.454902] Hardware name: LENOVO 
82AK/LNVNB161216, BIOS EACN43WW(V1.15) 09/13/2021 [ 7.454941] Workqueue: 
events_unbound deferred_probe_work_func [ 7.454982] pstate: 40400005 
(nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--) [ 7.455020] pc : 
dp_display_request_irq+0x50/0xdc [msm] [ 7.455145] lr : 
dp_display_request_irq+0x2c/0xdc [msm] [ 7.455265] sp : ffff800008c1bb30 
[ 7.455285] x29: ffff800008c1bb30 x28: 0000000000000000 x27: 
0000000000000000 [ 7.455327] x26: ffffc9c918420000 x25: ffffc9c9186ec570 
x24: 000000000000003a [ 7.455368] x23: ffffc9c918811d30 x22: 
ffff2a5806baa998 x21: ffff2a5806ba3410 [ 7.455410] x20: ffff2a5806baa880 
x19: ffff2a5806baa998 x18: ffffffffffffffff [ 7.455451] x17: 
0000000000000038 x16: ffffc9c9164eeb24 x15: ffffffffffffffff [ 7.455492] 
x14: ffff2a5806bc3004 x13: ffff2a5806bc3000 x12: 0000000000000000 [ 
7.455533] x11: 0000000000000040 x10: ffffc9c918493080 x9 : 
ffffc9c918493078 [ 7.455574] x8 : ffff2a5800681b88 x7 : 0000000000000000 
x6 : ffff2a5806baa880 [ 7.455616] x5 : ffffc9c8ca2de000 x4 : 
0000000000080004 x3 : 0000000000000000 [ 7.455656] x2 : ffffc9c8ca296000 
x1 : 00000000000000a8 x0 : 0000000000000000 [ 7.455698] Call trace: [ 
7.455714] dp_display_request_irq+0x50/0xdc [msm] [ 7.455834] 
dp_display_probe+0xf8/0x4a4 [msm] [ 7.455950] platform_probe+0x6c/0xc4 [ 
7.455976] really_probe+0xbc/0x2d4 [ 7.455999] 
__driver_probe_device+0x78/0xe0 [ 7.456025] 
driver_probe_device+0x3c/0x13c [ 7.456051] 
__device_attach_driver+0xb8/0x120 [ 7.456077] bus_for_each_drv+0x78/0xd0 
[ 7.456105] __device_attach+0x9c/0x1a0 [ 7.456129] 
device_initial_probe+0x18/0x2c [ 7.456154] bus_probe_device+0x9c/0xa4 [ 
7.456178] deferred_probe_work_func+0x88/0xc0 [ 7.456204] 
process_one_work+0x1d4/0x330 [ 7.456231] worker_thread+0x70/0x42c [ 
7.456255] kthread+0x10c/0x110 [ 7.456278] ret_from_fork+0x10/0x20 [ 
7.456306] Code: aa1403e6 f2a00104 f0000225 f0ffffe2 (f9400400) [ 
7.456341] ---[ end trace 0000000000000000 ]---

This is from the sc8180x, sdm850 is the same call stack, just with 
different addresses.

I do have 
https://lore.kernel.org/all/20220712132258.671263-1-dmitry.baryshkov@linaro.org/ 
applied here which makes the 10th patch not apply cleanly.

It fails actually, but I applied it manually here.

