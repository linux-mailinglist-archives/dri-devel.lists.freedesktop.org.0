Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F90666E5B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9F710E8B5;
	Thu, 12 Jan 2023 09:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838B10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:35:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t5so13056431wrq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PpYV6rV+fk0YxlB+9/YwdZY/rAefDrIMcFnzL6jEEDc=;
 b=UvdNuRP8KaIb9+dstbkYeimNsT+6edKqrkloFihV1UkN6lhQVxrqt7HbwYbu/zgHET
 QjAjeIW95rRY091J3mHumRijNGdJcc4lOcQzsnqJcm4401brHZOqX8xaPsGT6xF5LHkw
 5qQujl4oCk+3gRT9OyO6XMvM+N2htQnrf8XdH2TEe74tbTyvRxj+MmKE83APOkrZo4ba
 o2OxtXQMI/en+hrk5unAJ5b2OeJFKDeNhx/p0JgDLhsR9ViXvpRZMTHTulbJagmvxhLl
 EgKAHV4EfC+6fzz6AgtVfSXtl4uYhnAgwyYIHVjQlYFRwZxr3f99pccVuAHMBzpsyEIv
 YhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PpYV6rV+fk0YxlB+9/YwdZY/rAefDrIMcFnzL6jEEDc=;
 b=thLRvrE/2rCRWp6D8yfBX641jJDmmmjqIofws2XQf8EvvXf3HTqysFNqilV1CT08Lr
 cu+nViY34jKbtZgL87vWxF4F2Nr1fLlrRjSceZDp6+bz2zFfswG7r8bUw2LoYpwV+vRp
 p+/tUi2JWDjFECAI2WK99GvVfBViL9DoPKVJ8hbilHIGdBdrjVoefYJ5VJo2N0GKg2da
 ZawmtFwRuho+LR86uno2z/tTY28np7LEx8xpsDEzl9KeFOb7U9SliM/9dSdVlLYegXRY
 bP3quw0My3bkuBaSo1ixJkcggA/1muW4TfjprHYuK2B8P3oa4sHMfe76LoO1wbXW+BzB
 ReNg==
X-Gm-Message-State: AFqh2kqyEMBb1/b9oFo7MEcu/I1NHiS4ZpQmWfFenG9OWmDd5xWyLjOj
 03OcG7ahYMfpLAUMPzPqt9eLgw==
X-Google-Smtp-Source: AMrXdXv6lxqBhbejVaQGpYaPxpjQdzrHzk14dFGEAAxhorwSZFVIYk75EyEjK2+VSemnG8dJ4TlRXg==
X-Received: by 2002:a05:6000:1c9:b0:2bb:edc7:504 with SMTP id
 t9-20020a05600001c900b002bbedc70504mr10251049wrx.26.1673516103753; 
 Thu, 12 Jan 2023 01:35:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm16275560wre.3.2023.01.12.01.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:35:03 -0800 (PST)
Message-ID: <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
Date: Thu, 12 Jan 2023 10:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [v3, 3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for
 HPD enablement
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen <tomba@kernel.org>
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
 <CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
 <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/01/2023 13:41, Marek Szyprowski wrote:
> On 02.11.2022 19:07, Dmitry Baryshkov wrote:
>> Use drm_connector's helpers enable_hpd and disable_hpd to enable and
>> disable HPD automatically by the means of drm_kms_helper_poll_*
>> functions. As the drm_bridge_connector_enable_hpd() and
>> drm_bridge_connector_disable_hpd() functions are now unused, replace
>> them with stubs to ease driver migration.
>>
>> Enabling the HPD from drm_bridge_connector_init() can happen too early,
>> before the driver is prepared to handle HPD events. As the
>> drm_bridge_connector_enable_hpd() is empty anyway, drop this call
>> anyway.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> This patch, merged to recent linux-next as commit 92d755d8f13b
> ("drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD
> enablement"), triggers the following warning on all my Amlogic Meson
> based boards:
> 
> ------------[ cut here ]------------
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 285 at drivers/gpu/drm/drm_bridge.c:1257
> drm_bridge_hpd_enable+0x90/0xa0
> Modules linked in: snd_soc_meson_axg_frddr snd_soc_meson_axg_fifo
> dwmac_generic panfrost(+) reset_meson_audio_arb(+) drm_shmem_helper
> meson_dw_hdmi(+) dw_hdmi rc_odroid drm_display_helper meson_ir(+)
> gpu_sched meson_rng rng_core meson_gxbb_wdt crct10dif_ce dwmac_meson8b
> stmmac_platform snd_soc_meson_axg_sound_card snd_soc_meson_card_utils
> mdio_mux_meson_g12a stmmac meson_drm pwm_meson pcs_xpcs meson_canvas
> snd_soc_meson_axg_tdm_interface rtc_meson_vrtc
> snd_soc_meson_axg_tdm_formatter nvmem_meson_efuse display_connector
> CPU: 2 PID: 285 Comm: systemd-udevd Not tainted 6.1.0-rc6+ #13236
> Hardware name: Hardkernel ODROID-C4 (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x90/0xa0
> lr : drm_bridge_hpd_enable+0x90/0xa0
> ...
> Call trace:
>    drm_bridge_hpd_enable+0x90/0xa0
>    _drm_bridge_connector_enable_hpd+0x24/0x34

Weird because _drm_bridge_connector_enable_hpd() has been removed with
4c00ac500d0e ("drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()")


>    drm_kms_helper_poll_enable.part.0+0x50/0xd0

It seems drm_kms_helper_poll_enable is called again by
drm_helper_probe_single_connector_modes() because poll_running isn't set.

Can you try with this change:
===============><===========================================
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 7973f2589ced..5d60d4fd868f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -245,7 +245,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
  	struct drm_connector_list_iter conn_iter;
  	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;

-	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
+	if (!dev->mode_config.poll_init || !drm_kms_helper_poll || dev->mode_config.poll_enabled)
  		return;

  	drm_connector_list_iter_begin(dev, &conn_iter);
@@ -279,6 +279,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)

  	if (poll)
  		schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
+
+	dev->mode_config.poll_enabled = true;
  }
  EXPORT_SYMBOL(drm_kms_helper_poll_enable);

@@ -561,7 +563,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
  		 * disable itself again.
  		 */
  		dev->mode_config.delayed_event = true;
-		if (dev->mode_config.poll_enabled)
+		if (dev->mode_config.poll_init)
  			schedule_delayed_work(&dev->mode_config.output_poll_work,
  					      0);
  	}
@@ -703,7 +705,7 @@ static void output_poll_execute(struct work_struct *work)
  	bool repoll = false, changed;
  	u64 old_epoch_counter;

-	if (!dev->mode_config.poll_enabled)
+	if (!dev->mode_config.poll_init)
  		return;

  	/* Pick up any changes detected by the probe functions. */
@@ -813,11 +815,11 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
  	struct drm_connector *connector;
  	struct drm_connector_list_iter conn_iter;

-	if (!dev->mode_config.poll_enabled)
+	if (!dev->mode_config.poll_init || !dev->mode_config.poll_enabled)
  		return;

  	if (fini)
-		dev->mode_config.poll_enabled = false;
+		dev->mode_config.poll_init = false;

  	drm_connector_list_iter_begin(dev, &conn_iter);
  	drm_for_each_connector_iter(connector, &conn_iter) {
@@ -830,6 +832,8 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
  	drm_connector_list_iter_end(&conn_iter);

  	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+
+	dev->mode_config.poll_enabled = false;
  }

  /**
@@ -874,7 +878,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_disable);
  void drm_kms_helper_poll_init(struct drm_device *dev)
  {
  	INIT_DELAYED_WORK(&dev->mode_config.output_poll_work, output_poll_execute);
-	dev->mode_config.poll_enabled = true;
+	dev->mode_config.poll_init = true;

  	drm_kms_helper_poll_enable(dev);
  }
@@ -1003,7 +1007,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
  	struct drm_connector_list_iter conn_iter;
  	int changed = 0;

-	if (!dev->mode_config.poll_enabled)
+	if (!dev->mode_config.poll_init)
  		return false;

  	mutex_lock(&dev->mode_config.mutex);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22..86c5f66f1a6c 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -345,6 +345,7 @@ struct drm_mode_config_funcs {
   * @max_width: maximum fb pixel width on this device
   * @max_height: maximum fb pixel height on this device
   * @funcs: core driver provided mode setting functions
+ * @poll_init: track polling initialization for this device
   * @poll_enabled: track polling support for this device
   * @poll_running: track polling status for this device
   * @delayed_event: track delayed poll uevent deliver for this device
@@ -543,6 +544,7 @@ struct drm_mode_config {
  	const struct drm_mode_config_funcs *funcs;

  	/* output poll support */
+	bool poll_init;
  	bool poll_enabled;
  	bool poll_running;
  	bool delayed_event;
===============><===========================================

Neil

>    drm_helper_probe_single_connector_modes+0x400/0x530
>    drm_client_modeset_probe+0x1ec/0xba0
>    __drm_fb_helper_initial_config_and_unlock+0x4c/0x630
>    drm_fb_helper_initial_config+0x50/0x60
>    drm_fbdev_client_hotplug+0xc4/0x150
>    drm_fbdev_generic_setup+0x88/0x150
>    meson_drv_bind_master+0x3d4/0x4a0 [meson_drm]
>    meson_drv_bind+0x14/0x20 [meson_drm]
>    try_to_bring_up_aggregate_device+0x164/0x1d0
>    __component_add+0xa8/0x174
>    component_add+0x14/0x20
>    meson_dw_hdmi_probe+0x1c/0x30 [meson_dw_hdmi]
>    platform_probe+0x68/0xe0
>    really_probe+0xbc/0x2e0
>    __driver_probe_device+0x78/0xe0
>    driver_probe_device+0x3c/0x160
>    __driver_attach+0x88/0x1a0
>    bus_for_each_dev+0x70/0xd0
>    driver_attach+0x24/0x30
>    bus_add_driver+0x154/0x204
>    driver_register+0x78/0x130
>    __platform_driver_register+0x28/0x34
>    meson_dw_hdmi_platform_driver_init+0x24/0x1000 [meson_dw_hdmi]
>    do_one_initcall+0x74/0x400
>    do_init_module+0x48/0x1d4
>    load_module+0x1818/0x1de0
>    __do_sys_finit_module+0xc0/0x114
>    __arm64_sys_finit_module+0x20/0x30
>    invoke_syscall+0x48/0x114
>    el0_svc_common.constprop.0+0x60/0x11c
>    do_el0_svc_compat+0x1c/0x40
>    el0_svc_compat+0x48/0xc0
>    el0t_32_sync_handler+0x90/0x140
>    el0t_32_sync+0x190/0x194
> irq event stamp: 17422
> hardirqs last  enabled at (17421): [<ffff800009196058>]
> __schedule+0x998/0xa14
> hardirqs last disabled at (17422): [<ffff80000918e4a4>] el1_dbg+0x24/0x90
> softirqs last  enabled at (17404): [<ffff80000801046c>] _stext+0x46c/0x5d8
> softirqs last disabled at (17383): [<ffff8000080166d0>]
> ____do_softirq+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> I looks that this change requires some additional changes/fixes in the
> drivers/gpu/drm/meson/meson_dw_hdmi.c
> 
> 
>>    drivers/gpu/drm/drm_bridge_connector.c | 18 +++++++++++++-----
>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 1c7d936523df..0e13bc87a6ac 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -136,6 +136,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>>     * This is typically used by display drivers in their resume handler.
>>     */
>>    void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>> +{
>> +}
>> +EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
>> +
>> +static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>>    {
>>    	struct drm_bridge_connector *bridge_connector =
>>    		to_drm_bridge_connector(connector);
>> @@ -145,7 +150,6 @@ void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>>    		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
>>    				      bridge_connector);
>>    }
>> -EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
>>    
>>    /**
>>     * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
>> @@ -156,6 +160,11 @@ EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
>>     * This is typically used by display drivers in their suspend handler.
>>     */
>>    void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>> +{
>> +}
>> +EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
>> +
>> +static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>>    {
>>    	struct drm_bridge_connector *bridge_connector =
>>    		to_drm_bridge_connector(connector);
>> @@ -164,7 +173,6 @@ void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>>    	if (hpd)
>>    		drm_bridge_hpd_disable(hpd);
>>    }
>> -EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
>>    
>>    /* -----------------------------------------------------------------------------
>>     * Bridge Connector Functions
>> @@ -305,6 +313,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
>>    static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
>>    	.get_modes = drm_bridge_connector_get_modes,
>>    	/* No need for .mode_valid(), the bridges are checked by the core. */
>> +	.enable_hpd = _drm_bridge_connector_enable_hpd,
>> +	.disable_hpd = _drm_bridge_connector_disable_hpd,
>>    };
>>    
>>    /* -----------------------------------------------------------------------------
>> @@ -387,10 +397,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>    				    connector_type, ddc);
>>    	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
>>    
>> -	if (bridge_connector->bridge_hpd) {
>> +	if (bridge_connector->bridge_hpd)
>>    		connector->polled = DRM_CONNECTOR_POLL_HPD;
>> -		drm_bridge_connector_enable_hpd(connector);
>> -	}
>>    	else if (bridge_connector->bridge_detect)
>>    		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>>    				  | DRM_CONNECTOR_POLL_DISCONNECT;
> 
> Best regards

