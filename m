Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748EAD88A6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0B610E93A;
	Fri, 13 Jun 2025 10:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="dWiB/kdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB70A10E93A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:01:32 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DA15wA3104814;
 Fri, 13 Jun 2025 05:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1749808865;
 bh=UOuiWlX9p7lNVU0QfBFOh9XTcLaprri11iz8KEMFwho=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=dWiB/kdqRYglvWY4MP9yXFY7QgkgOGDQQ+F/9kTNz4JJqX3vnFexfqz7P9j2j6bgR
 9n2dVAANFS0BPDyGt8sSLebLejQV+6kECX9OgLRxSRdNwkXGYK9gN+2HqL2RxLJguW
 IRI0L+zZqVb8TGIvN26JCvuipReHMJmJHajsuZtY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DA14b13357680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 13 Jun 2025 05:01:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 05:01:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 05:01:04 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DA0v3G3579539;
 Fri, 13 Jun 2025 05:00:58 -0500
Message-ID: <1301f0d9-7ebd-44c1-bfcf-a82bbbd92e46@ti.com>
Date: Fri, 13 Jun 2025 15:30:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <devarsht@ti.com>, <geert@linux-m68k.org>, <dianders@chromium.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <max.krummenacher@toradex.com>,
 <ernestvanhoecke@gmail.com>
References: <20250611052947.5776-1-j-choudhary@ti.com>
 <9cd2f481-07e4-4c1e-9daa-aceeec47f871@ideasonboard.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <9cd2f481-07e4-4c1e-9daa-aceeec47f871@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Tomi,

On 12/06/25 11:55, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/06/2025 08:29, Jayesh Choudhary wrote:
>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
>> call which was moved to other function calls subsequently.
>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
>> state always return 1 (always connected state).
>>
>> Set HPD_DISABLE bit conditionally based on connector type.
>> Since the HPD_STATE is reflected correctly only after waiting for debounce
>> time (~100-400ms) and adding this delay in detect() is not feasible
>> owing to the performace impact (glitches and frame drop), remove runtime
>> calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
>> calls, to detect hpd properly without any delay.
>>
>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>>
>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>
>> Changelog v3->v4:
>> - Remove "no-hpd" support due to backward compatibility issues
>> - Change the conditional from "no-hpd" back to connector type
>>    but still address [1]
>>
>> v3 patch link:
>> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>
>>
>> Changelog v2->v3:
>> - Change conditional based on no-hpd property to address [1]
>> - Remove runtime calls in detect() with appropriate comments
>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>>
>> v2 patch link:
>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>>
>> Changelog v1->v2:
>> - Drop additional property in bindings and use conditional.
>> - Instead of register read for HPD state, use dpcd read which returns 0
>>    for success and error codes for no connection
>> - Add relevant history for the required change in commit message
>> - Drop RFC subject-prefix in v2
>> - Add "Cc:" tag
>>
>> v1 patch link:
>> <https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com/>
>>
>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>
>>
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 ++++++++++++++++++++++-----
>>   1 file changed, 41 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 60224f476e1d..b674a1aa1a37 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -348,12 +348,20 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>>   	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
>>   	 * delay in its prepare and always disable HPD.
>>   	 *
>> -	 * If HPD somehow makes sense on some future panel we'll have to
>> -	 * change this to be conditional on someone specifying that HPD should
>> -	 * be used.
>> +	 * For DisplayPort connector type, now that HPD makes sense and is
> 
> This comment also is written like a commit description ("now that HPD
> makes sense").

I will make it more apt.

> 
>> +	 * required, use the connector type to conditionally disable HPD.
>> +	 *
>> +	 * NOTE: The bridge type is set in auxiliary_bridge probe but
>> +	 * enable_comms() can be called before. So for DisplayPort,
>> +	 * HPD will be enabled once bridge type is set.
>> +	 * "no-hpd" property is not used properly in devicetree description
>> +	 * and hence is unreliable. Therefore HPD is being enabled using
>> +	 * this conditional.
>>   	 */
>> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>> -			   HPD_DISABLE);
>> +
>> +	if (pdata->bridge.type != DRM_MODE_CONNECTOR_DisplayPort)
>> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>> +				   HPD_DISABLE);
>>   
>>   	pdata->comms_enabled = true;
>>   
>> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>>   	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>   	int val = 0;
>>   
>> -	pm_runtime_get_sync(pdata->dev);
>> +	/*
>> +	 * The chip won't report HPD right after being powered on as
>> +	 * HPD_DEBOUNCED_STATE reflects correct state only after the
>> +	 * debounce time (~100-400 ms).
>> +	 * So having pm_runtime_get_sync() and immediately reading
>> +	 * the register in detect() won't work, and adding delay()
>> +	 * in detect will have performace impact in display.
>> +	 * So remove runtime calls here.
>> +	 */
>> +
> 
> As Doug mentioned, the style here is more like a commit message. But
> also, in my opinion, it would make more sense to have the comment in
> hpd_enable() rather than having it here, mentioning that the chip needs
> to be powered to have a reliable HPD due to the long debounce time.
> 

So a comment here that runtime references are handled through
hpd_enable() and hpd_disable()

And then in enable(), mentioning that device needs to be powered on
for reliable HPD in detect() due to debounce time

>>   	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>> -	pm_runtime_put_autosuspend(pdata->dev);
>>   
>>   	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>>   					 : connector_status_disconnected;
>> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
>>   	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>>   }
>>   
>> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>> +{
>> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>> +
>> +	pm_runtime_get_sync(pdata->dev);
>> +}
>> +
>> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>> +{
>> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>> +
>> +	pm_runtime_put_sync(pdata->dev);
> 
> No need for _sync, afaics. Why not pm_runtime_put_autosuspend()?

Okay.

> 
>   Tomi
> 
>> +}
>> +
>>   static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>   	.attach = ti_sn_bridge_attach,
>>   	.detach = ti_sn_bridge_detach,
>> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>   	.debugfs_init = ti_sn65dsi86_debugfs_init,
>> +	.hpd_enable = ti_sn_bridge_hpd_enable,
>> +	.hpd_disable = ti_sn_bridge_hpd_disable,
>>   };
>>   
>>   static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>>   			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>>   
>>   	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
>> -		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>> +		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
>> +				    DRM_BRIDGE_OP_HPD;
>>   
>>   	drm_bridge_add(&pdata->bridge);
>>   
> 

Thanks,
Jayesh
