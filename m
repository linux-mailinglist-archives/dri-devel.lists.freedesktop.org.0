Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C725B5FD2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AC610E07D;
	Mon, 12 Sep 2022 18:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885B10E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 18:05:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p5so11507217ljc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PpWy3jLR5KIjTBJJWAxEoJbR2AdZPLVCiPwsQonLwDQ=;
 b=guO9EpJNiPKcdEEk2GtGSQxx7JEFoEaoNZnXZGRwvYbC7oS+eoTiqd27S7LK3myQui
 0W9oV+lED4A7vmgeL4pThV+8bxs7V9TkuMBmhSaqe6Kh5DJuTc6Qhb8D5DyRh3igHnOk
 S2ESAR20lyEn1oadiGsStLi9U2Ltpytu11PfIaZsA04C8sK8ZAJQHHQ2xQsKNMK6Pl1+
 HXjYieMj6BTYc0qHgVdm9/wQUc3FiMhJIvS01/WASjvJXGKgtzI32G9Yc2BokFrDsfg/
 Mw2y8jTLZStmxFy++4B/1SkePHQgwataLIKrS98DLgeMFO6jXAa0ejwJvSVEBBbbbNFW
 sIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PpWy3jLR5KIjTBJJWAxEoJbR2AdZPLVCiPwsQonLwDQ=;
 b=J5Q/ZzgW8NL5EsSoSngxCblZeOHwHShbm1R6/9M35MITpnE96fLifZZuCSrnZ4DGNR
 ZvO9iPnjKAYaHgLi/m1/Irldtm3Wc3Pu6RWdwK6zxt5WXXK0uJXOtto6zb4OQIPNTr2T
 mbifZdTHRuLkz6f2kSBsyNN7cTdhIvjC220q6HeJPPunS7AlVdJ26Yu6W5eqQ9/w79nz
 5FKKv2Be7wagqLDhXeZsNIgGLvSiM+ZqiShZJ+P+Q+B0dU2XusW4Sqdu5zbMQIV8UehU
 cXY3GSHgRpQRGyM1HQJDqrSmGLmOEuRK1umHNOh+ao8LAw9xJGOyjfT01eosfVhlhMM+
 cXmA==
X-Gm-Message-State: ACgBeo2Tgz14Lpl0tD8W9Qnw0/2MEwx+JjBjn66d2Fc9bGCK1u9XYmLO
 FDu27DL3XzBZZEN2eXCXi8pzrA==
X-Google-Smtp-Source: AA6agR6H1F3P8dmD4rTUq3Zgx2i5lfCIrBOijrKtefvJHLC2CtfufyOKMTMNqfQdJTsgmjD5RI5WfA==
X-Received: by 2002:a05:651c:a07:b0:26c:83c:2a06 with SMTP id
 k7-20020a05651c0a0700b0026c083c2a06mr1832821ljq.115.1663005941350; 
 Mon, 12 Sep 2022 11:05:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a2ea267000000b0025e4e7c016dsm1246702ljm.16.2022.09.12.11.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:05:40 -0700 (PDT)
Message-ID: <155f8ef1-195f-0fc5-6358-ba5598f57db5@linaro.org>
Date: Mon, 12 Sep 2022 21:05:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] drm/msm/dp: add atomic_check to bridge ops
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1663004049-32702-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1663004049-32702-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2022 20:34, Kuogee Hsieh wrote:
> DRM commit_tails() will disable downstream crtc/encoder/bridge if
> both disable crtc is required and crtc->active is set before pushing
> a new frame downstream.
> 
> There is a rare case that user space display manager issue an extra
> screen update immediately followed by close DRM device while down
> stream display interface is disabled. This extra screen update will
> timeout due to the downstream interface is disabled but will cause
> crtc->active be set. Hence the followed commit_tails() called by
> drm_release() will pass the disable downstream crtc/encoder/bridge
> conditions checking even downstream interface is disabled.
> This cause the crash to happen at dp_bridge_disable() due to it trying
> to access the main link register to push the idle pattern out while main
> link clocks is disabled.
> 
> This patch adds atomic_check to prevent the extra frame will not
> be pushed down if display interface is down so that crtc->active
> will not be set neither. This will fail the conditions checking
> of disabling down stream crtc/encoder/bridge which prevent
> drm_release() from calling dp_bridge_disable() so that crash
> at dp_bridge_disable() prevented.
> 
> There is no protection in the DRM framework to check if the display
> pipeline has been already disabled before trying again. The only
> check is the crtc_state->active but this is controlled by usermode
> using UAPI. Hence if the usermode sets this and then crashes, the
> driver needs to protect against double disable"
> 
> SError Interrupt on CPU7, code 0x00000000be000411 -- SError
> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
> Hardware name: Google Lazor (rev3 - 8) (DT)
> pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __cmpxchg_case_acq_32+0x14/0x2c
> lr : do_raw_spin_lock+0xa4/0xdc
> sp : ffffffc01092b6a0
> x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 0000000000000038
> x26: 0000000000000004 x25: ffffffd2973dce48 x24: 0000000000000000
> x23: 00000000ffffffff x22: 00000000ffffffff x21: ffffffd2978d0008
> x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 0000000000000000
> x17: 004800a501260460 x16: 0441043b04600438 x15: 04380000089807d0
> x14: 07b0089807800780 x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000000438 x10: 00000000000007d0 x9 : ffffffd2973e09e4
> x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 0000000000000001
> x5 : ffffff808902e880 x4 : 0000000000000000 x3 : ffffff80ff759fc0
> x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffffff80ff759fc0
> Kernel panic - not syncing: Asynchronous SError Interrupt
> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
> Hardware name: Google Lazor (rev3 - 8) (DT)
> Call trace:
>   dump_backtrace.part.0+0xbc/0xe4
>   show_stack+0x24/0x70
>   dump_stack_lvl+0x68/0x84
>   dump_stack+0x18/0x34
>   panic+0x14c/0x32c
>   nmi_panic+0x58/0x7c
>   arm64_serror_panic+0x78/0x84
>   do_serror+0x40/0x64
>   el1h_64_error_handler+0x30/0x48
>   el1h_64_error+0x68/0x6c
>   __cmpxchg_case_acq_32+0x14/0x2c
>   _raw_spin_lock_irqsave+0x38/0x4c
>   lock_timer_base+0x40/0x78
>   __mod_timer+0xf4/0x25c
>   schedule_timeout+0xd4/0xfc
>   __wait_for_common+0xac/0x140
>   wait_for_completion_timeout+0x2c/0x54
>   dp_ctrl_push_idle+0x40/0x88
>   dp_bridge_disable+0x24/0x30
>   drm_atomic_bridge_chain_disable+0x90/0xbc
>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>   msm_atomic_commit_tail+0x1d0/0x374
>   commit_tail+0x80/0x108
>   drm_atomic_helper_commit+0x118/0x11c
>   drm_atomic_commit+0xb4/0xe0
>   drm_client_modeset_commit_atomic+0x184/0x224
>   drm_client_modeset_commit_locked+0x58/0x160
>   drm_client_modeset_commit+0x3c/0x64
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x98/0xac
>   drm_fb_helper_set_par+0x74/0x80
>   drm_fb_helper_hotplug_event+0xdc/0xe0
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x7c/0xac
>   drm_fb_helper_restore_fbdev_mode_unlocked+0x20/0x2c
>   drm_fb_helper_lastclose+0x20/0x2c
>   drm_lastclose+0x44/0x6c
>   drm_release+0x88/0xd4
>   __fput+0x104/0x220
>   ____fput+0x1c/0x28
>   task_work_run+0x8c/0x100
>   do_exit+0x450/0x8d0
>   do_group_exit+0x40/0xac
>   __wake_up_parent+0x0/0x38
>   invoke_syscall+0x84/0x11c
>   el0_svc_common.constprop.0+0xb8/0xe4
>   do_el0_svc+0x8c/0xb8
>   el0_svc+0x2c/0x54
>   el0t_64_sync_handler+0x120/0x1c0
>   el0t_64_sync+0x190/0x194
> SMP: stopping secondary CPUs
> Kernel Offset: 0x128e800000 from 0xffffffc008000000
> PHYS_OFFSET: 0x80000000
> CPU features: 0x800,00c2a015,19801c82
> Memory Limit: none
> 
> Changes in v2:
> -- add more commit text
> 
> Changes in v3:
> -- add comments into dp_bridge_atomic_check()
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 6df25f7..baff1c2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -31,6 +31,33 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
>   					connector_status_disconnected;
>   }
>   
> +static int dp_bridge_atomic_check(struct drm_bridge *bridge,
> +			    struct drm_bridge_state *bridge_state,
> +			    struct drm_crtc_state *crtc_state,
> +			    struct drm_connector_state *conn_state)
> +{
> +	struct msm_dp *dp;
> +
> +	dp = to_dp_bridge(bridge)->dp_display;
> +
> +	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
> +		(dp->is_connected) ? "true" : "false");
> +
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +		return (dp->is_connected) ? 0 : -ENOTCONN;
> +
> +	/*
> +	 * There is no protection in the DRM framework to check if the display
> +	 * pipeline has been already disabled before trying again. 

.. trying to disable it again.

> The only
> +	 * check is the crtc_state->active but this is controlled by usermode
> +	 * using UAPI. Hence if the usermode sets this and then crashes, the
> +	 * driver needs to protect against double disable

Not quite. A slightly better wording might be:

"Hence if the sink is unplugged, the pipeline gets disabled, but the 
crtc->active is still true. Any attempt to set the mode or manually 
disable this encoder will result in the crash.

TODO: add support for telling the DRM subsystem that the pipeline is 
disabled by the hardware and thus all access to it should be forbidden.
After that this piece of code can be removed."

Also could you please move the comment before the conditions, not after 
them.

> +	 */
> +
> +	return 0;
> +}
> +
> +
>   /**
>    * dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
>    * @bridge: Poiner to drm bridge
> @@ -61,6 +88,9 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
>   }
>   
>   static const struct drm_bridge_funcs dp_bridge_ops = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset           = drm_atomic_helper_bridge_reset,
>   	.enable       = dp_bridge_enable,
>   	.disable      = dp_bridge_disable,
>   	.post_disable = dp_bridge_post_disable,
> @@ -68,6 +98,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>   	.mode_valid   = dp_bridge_mode_valid,
>   	.get_modes    = dp_bridge_get_modes,
>   	.detect       = dp_bridge_detect,
> +	.atomic_check = dp_bridge_atomic_check,
>   };
>   
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,

-- 
With best wishes
Dmitry

