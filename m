Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKdOMFvMrmnEIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:34:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE548239CFC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8931D10E163;
	Mon,  9 Mar 2026 13:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="M4Y5MGyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49228.qiye.163.com (mail-m49228.qiye.163.com
 [45.254.49.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C608610E163
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:34:13 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 364581b40;
 Mon, 9 Mar 2026 21:34:08 +0800 (GMT+08:00)
Message-ID: <8df0574d-c4c8-4a6d-a357-7b8c82a38acb@rock-chips.com>
Date: Mon, 9 Mar 2026 21:34:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/15] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
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
 <20260210071225.2566099-10-damon.ding@rock-chips.com>
 <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
 <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Content-Language: en-US
In-Reply-To: <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd2ce18f603a3kunm414b5e452e0573
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0geTFYdSkNLSUoeH0hNGktWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=M4Y5MGyxF/AdrP3ihZXEHSWnvV2h0B7W+h5SyJclBYmjiA7VtwI0rHMg3a5WDAVUW1I4A4n6VdStslrwNpjxSWCf7wHBGc8pCPvWNfwSRNB7ZZM3WIAq5RiP696HMrrMqVVlvCKfwdKCWgoMWA7Or616ir+NiRL6F2BKRX2eYPc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=m+pjJ8AYp8UNMrQ2/YzyBJ5hJEx0e6GJLawz++scizw=;
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
X-Rspamd-Queue-Id: AE548239CFC
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,samsung.com:email,rock-chips.com:dkim,rock-chips.com:email,rock-chips.com:mid]
X-Rspamd-Action: no action

Hi Luca,

On 3/9/2026 7:25 PM, Damon Ding wrote:
> Hi Luca,
> 
> On 3/3/2026 5:42 PM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>>> Apply drm_bridge_connector helper for Analogix DP driver.
>>>
>>> The following changes have been made:
>>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>>    and &drm_connector_helper_funcs.
>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>    &analogix_dp_plat_data.attach.
>>> - Remove &analogix_dp_device.connector.
>>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>>    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>>    &drm_bridge_funcs.edid_read().
>>> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>>>    binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>>                               ^
>>
>> Do you mean "!DRM_BRIDGE_ATTACH_NO_CONNECTOR" here (i.e. missing '!')?
>>
>> Also, unsuppported -> unsupported (typo)
>>
> 
> Will fix in v10.
> 
>>>    in analogix_dp_bridge_attach().
>>> - Set &drm_bridge.ops according to different cases.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>
>> I had a quick look, looks good overall, for the moment I have only a
>> question, see below.
>>
>> I aim at reviewing this patch in depth, but it's not an easy one to
>> digest. Would it be feasible to split it in smaller logical steps? If it
>> is, please do, it would be very helpful for reviewing.
> 
> Yes, this commit will be split into several smaller ones in v10.
> 
>>
>>> @@ -1532,6 +1481,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>>
>>>   int analogix_dp_bind(struct analogix_dp_device *dp, struct 
>>> drm_device *drm_dev)
>>>   {
>>> +    struct drm_bridge *bridge = &dp->bridge;
>>>       int ret;
>>>
>>>       dp->drm_dev = drm_dev;
>>> @@ -1545,7 +1495,18 @@ int analogix_dp_bind(struct analogix_dp_device 
>>> *dp, struct drm_device *drm_dev)
>>>           return ret;
>>>       }
>>>
>>> -    ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>> +    if (dp->plat_data->panel)
>>> +        bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>>> +    else
>>> +        bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>> +
>>> +    bridge->of_node = dp->dev->of_node;
>>> +    bridge->type = DRM_MODE_CONNECTOR_eDP;
>>> +    ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>
>> Can devm_drm_bridge_add() be added to analogix_dp_probe() instead?
> 
> Will do in v10.

My apologies for my somewhat irresponsible reply earlier!

When I was splitting this commit, I realized that moving 
devm_drm_bridge_add() to analogix_dp_probe() is actually not feasible – 
the type of the downstream bridge of the Analogix bridge can only be 
determined after the entire probe process is fully completed.

rockchip_dp_probe()/exynos_dp_probe() ->
   analogix_dp_finish_probe() ->
     analogix_dp_aux_done_probing() ->
       drm_of_find_panel_or_bridge() ->
         rockchip_dp_bind()/exynos_dp_bind() ->
           analogix_dp_bind()->
             devm_drm_bridge_add()

To avoid confusion, I’ve added some comments for this easily 
misunderstood logic to the commit message of v10, so the reasoning is 
clear for everyone.

> 
>>
>>> +    if (ret)
>>> +        goto err_unregister_aux;
>>> +
>>> +    ret = drm_bridge_attach(dp->encoder, bridge, NULL, 
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>       if (ret) {
>>>           DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>           goto err_unregister_aux;
> 

Best regards,
Damon

