Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFFHJlTOrmnEIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:42:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E345C239E8D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95D810E143;
	Mon,  9 Mar 2026 13:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="QLJRBN+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973199.qiye.163.com (mail-m1973199.qiye.163.com
 [220.197.31.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9210E143
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:42:38 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3645d2e29;
 Mon, 9 Mar 2026 21:42:31 +0800 (GMT+08:00)
Message-ID: <f755bdc8-7324-4dcc-8fc7-8d6224bc89d6@rock-chips.com>
Date: Mon, 9 Mar 2026 21:42:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/15] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
From: Damon Ding <damon.ding@rock-chips.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-11-damon.ding@rock-chips.com>
 <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
 <01983e92-dabb-47f7-ba01-988ea41641db@rock-chips.com>
Content-Language: en-US
In-Reply-To: <01983e92-dabb-47f7-ba01-988ea41641db@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd2d5c65c03a3kunmaaae204b2e0d75
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpJTVYeSU5NTx4eQ0tJQ0JWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=QLJRBN+1lBKotyDGfES/FQ1dQd0Hseec/2zNw/086u6K9Sb1Ig22Tw8gsND7iIO4YlRcsIuWEhuy2I93KTOkG9nhe/cY4xwFBhbCPcM/8HUFEfyDRJ5w0kengu/iNDGUepsMWf5yMeWgdMD6OB9QDWnJNsCfYMwUY/EFI6FV5vE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=dYCVj9FOVuINcVWSh8M7sE+cs2K2DH+OErpTWPY9/Og=;
 h=date:mime-version:subject:message-id:from;
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
X-Rspamd-Queue-Id: E345C239E8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,oss.qualcomm.com,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,rock-chips.com:dkim,rock-chips.com:email,rock-chips.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Luca,

On 3/9/2026 7:51 PM, Damon Ding wrote:
> Hi Luca,
> 
> On 3/3/2026 5:54 PM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>>> Since the panel/bridge should logically be positioned behind the
>>> Analogix bridge in the display pipeline, it makes sense to handle
>>> the panel/bridge parsing on the Analogix side. Therefore, we add
>>> a new API analogix_dp_finish_probe(), which combines the panel/bridge
>>> parsing with component addition, to do it.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>
>> ...
>>
>>> @@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct 
>>> analogix_dp_device *dp)
>>>   }
>>>   EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>>>
>>> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
>>> +{
>>> +    struct analogix_dp_device *dp = to_dp(aux);
>>> +    struct analogix_dp_plat_data *plat_data = dp->plat_data;
>>> +    int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * If drm_of_find_panel_or_bridge() returns -ENODEV, there may 
>>> be no valid panel
>>> +     * or bridge nodes. The driver should go on for the driver-free 
>>> bridge or the DP
>>> +     * mode applications.
>>> +     */
>>> +    ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
>>> +                      &plat_data->panel, &plat_data->next_bridge);
>>> +    if (ret && ret != -ENODEV)
>>> +        return ret;
>>> +
>>> +    return component_add(dp->dev, plat_data->ops);
>>> +}
>>> +
>>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = devm_of_dp_aux_populate_bus(&dp->aux, 
>>> analogix_dp_aux_done_probing);
>>> +    if (ret) {
>>> +        /*
>>> +         * If devm_of_dp_aux_populate_bus() returns -ENODEV, the 
>>> done_probing() will
>>> +         * not be called because there are no EP devices. Then the 
>>> callback function
>>> +         * analogix_dp_aux_done_probing() will be called directly in 
>>> order to support
>>> +         * the other valid DT configurations.
>>> +         *
>>> +         * NOTE: The devm_of_dp_aux_populate_bus() is allowed to 
>>> return -EPROBE_DEFER.
>>
>> Uhm, if it is allowed to return -EPROBE_DEFER...
>>
>>> +         */
>>> +        if (ret != -ENODEV) {
>>> +            dev_err(dp->dev, "failed to populate aux bus\n");
>>> +            return ret;
>>> +        }
>>
>> ...then you shouldn't dev_err() when -EPROBE_DEFER is returned.
>>
>> Either use dev_err_probe() (which would also simplify your code) or check
>> for if (ret != -ENODEV && ret != -EPROBE_DEFER).
> 
> Will fix in v10.
> 
>>
>>> +
>>> +        return analogix_dp_aux_done_probing(&dp->aux);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
>>> +
>>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>>   MODULE_LICENSE("GPL v2");
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/ 
>>> analogix_dp.h
>>> index 3428ffff24c5..bae969dec63a 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>>>       struct drm_bridge *next_bridge;
>>>       struct drm_encoder *encoder;
>>>       struct drm_connector *connector;
>>> +    const struct component_ops *ops;
>>
>> Is adding a new stored field a good idea? Can it be instead passed as an
>> argument to analogix_dp_finish_probe()?
>>
>> Note I don't have a strong opinion here, just the added struct field 
>> seems
>> overkill for being used just once.
>>
> 
> I agree this is a better approach, since the &component_ops is only used 
> during probing.

Sorry for another shamefully incorrect reply!

The &dp_aux_ep_device_with_data.done_probing only supports passing the 
&drm_dp_aux parameter, meaning we can't directly pass &component_ops.

I'll also add extra context to the commit msg – similar to what I did 
for v9 patch 9/15 – so everyone understands why this change was made and 
avoids confusion.

> 
>>> @@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector 
>>> *connector);
>>>
>>>   struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct 
>>> drm_dp_aux *aux);
>>>   struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp);
>>>
>>>   #endif /* _ANALOGIX_DP_H_ */
>>
> 

Best regards,
Damon

