Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FFAC4C57
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E710E486;
	Tue, 27 May 2025 10:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ktVED9Y3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C5510E481
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:39:51 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RAdRcR1724387;
 Tue, 27 May 2025 05:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1748342367;
 bh=38vvUc4Nl3L09180WOdx9Htk55pL59SU+rIYR7ofHJ4=;
 h=Date:Subject:From:To:CC:References:In-Reply-To;
 b=ktVED9Y3IR+lIHxsUt2OGpVGnmFhaIP3ldxXClr5hT/tNuglA4ZvVO6P5cOKZ/TjH
 1AqaRzOQnoD96/Z99BKpNaO65n4fcEwCQrvyDuBfoQg+3BFcgrgeIajb9Eem2q2kec
 6ab2SUGiZxELTpOn4Rm7xJG/eCZGgN2iqYWID5Uo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RAdRs6680218
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 27 May 2025 05:39:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 05:39:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 05:39:26 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RAdIka3343251;
 Tue, 27 May 2025 05:39:19 -0500
Message-ID: <2a15263b-2d36-4c46-be0f-4145069d134f@ti.com>
Date: Tue, 27 May 2025 16:09:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from pointer to structure
From: Jayesh Choudhary <j-choudhary@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <lumag@kernel.org>, <jani.nikula@intel.com>, <andy.yan@rock-chips.com>,
 <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
 <yamonkar@cadence.com>, <sjakhade@cadence.com>,
 <quentin.schulz@free-electrons.com>, <jsarha@ti.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
 <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <alexander.stein@ew.tq-group.com>
References: <20250521073237.366463-1-j-choudhary@ti.com>
 <20250521073237.366463-3-j-choudhary@ti.com>
 <19dd2795-c693-4c1a-989c-8b3bc2b3cdfd@ideasonboard.com>
 <493afc6c-59a0-4f6b-9a9e-568dd2eff873@ti.com>
Content-Language: en-US
In-Reply-To: <493afc6c-59a0-4f6b-9a9e-568dd2eff873@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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



On 27/05/25 14:59, Jayesh Choudhary wrote:
> Hello Tomi,
> 
> On 27/05/25 13:28, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 21/05/2025 10:32, Jayesh Choudhary wrote:
>>> After adding DBANC framework, mhdp->connector is not initialised during
>>> bridge calls. But the asyncronous work scheduled depends on the 
>>> connector.
>>> We cannot get to drm_atomic_state in these asyncronous calls running on
>>> worker threads. So we need to store the data that we need in mhdp bridge
>>> structure.
>>> Like other bridge drivers, use drm_connector pointer instead of 
>>> structure
>>> and make appropriate changes to the conditionals and assignments related
>>> to mhdp->connector.
>>> Also, in the atomic enable call, move the connector  and connector state
>>> calls above, so that we do have a connector before we can retry the
>>> asyncronous work in case of any failure.
>>>
>>
>> I don't quite understand this patch. You change the mhdp->connector to a
>> pointer, which is set at bridge_enable and cleared at bridge_disable.
>> Then you change the "mhdp->connector.dev" checks to "mhdp->connector".
>>
>> So, now in e.g. cdns_mhdp_fw_cb(), we check for mhdp->connector, which
>> is set at bridge_enable(). Can we ever have the bridge enabled before
>> the fb has been loaded? What is the check even supposed to do there?
>>
>> Another in cdns_mhdp_hpd_work(), it checks for mhdp->connector. So...
>> HPD code behaves differently based on if the bridge has been enabled or
>> not? What is it supposed to do?
>>
>> Isn't the whole "if (mhdp->connector.dev)" code for the legacy
>> non-DRM_BRIDGE_ATTACH_NO_CONNECTOR case?
>>
>>   Tomi
> 
> I misinterpreted your comment in v1[0] regarding finding the connector
> from the current state in cdns_mhdp_modeset_retry_fn() and I missed
> this. I was more focused on finding a connector for that function.
> 
> For the current code, in all the conditionals involving mhdp->connector,
> we are entering else statements as connector is not initialised.
> So I will just drop if statements in cdns_mhdp_fw_cb() and
> cdns_mhdp_hpd_work() (like you said, its legacy case) while still having
> mhdp->connector as pointer as we need it for
> cdns_mhdp_modeset_retry_fn() and in cdns-mhdp8546-hdcp driver.
> 
> That should be okay?
> 
> [0]: 
> https://lore.kernel.org/all/e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com/
> 
> Warm Regards,
> Jayesh
> 
> 

Tomi,

One more thing here. Should this be squashed with the first patch as
this is sort of removing !(DRM_BRIDGE_ATTACH_NO_CONNECTOR) case and
associated changes?


>>
>>> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 
>>> DPI/DP bridge")
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 28 +++++++++----------
>>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  2 +-
>>>   .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  8 +++---
>>>   3 files changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c 
>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> index 66bd916c2fe9..5388e62f230b 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> @@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware 
>>> *fw, void *context)
>>>       bridge_attached = mhdp->bridge_attached;
>>>       spin_unlock(&mhdp->start_lock);
>>>       if (bridge_attached) {
>>> -        if (mhdp->connector.dev)
>>> +        if (mhdp->connector)
>>>               drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>>>           else
>>>               drm_bridge_hpd_notify(&mhdp->bridge, 
>>> cdns_mhdp_detect(mhdp));
>>> @@ -1759,17 +1759,25 @@ static void cdns_mhdp_atomic_enable(struct 
>>> drm_bridge *bridge,
>>>       struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>>       struct cdns_mhdp_bridge_state *mhdp_state;
>>>       struct drm_crtc_state *crtc_state;
>>> -    struct drm_connector *connector;
>>>       struct drm_connector_state *conn_state;
>>>       struct drm_bridge_state *new_state;
>>>       const struct drm_display_mode *mode;
>>>       u32 resp;
>>> -    int ret;
>>> +    int ret = 0;
>>>       dev_dbg(mhdp->dev, "bridge enable\n");
>>>       mutex_lock(&mhdp->link_mutex);
>>> +    mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
>>> +                                   bridge->encoder);
>>> +    if (WARN_ON(!mhdp->connector))
>>> +        goto out;
>>> +
>>> +    conn_state = drm_atomic_get_new_connector_state(state, 
>>> mhdp->connector);
>>> +    if (WARN_ON(!conn_state))
>>> +        goto out;
>>> +
>>>       if (mhdp->plugged && !mhdp->link_up) {
>>>           ret = cdns_mhdp_link_up(mhdp);
>>>           if (ret < 0)
>>> @@ -1789,15 +1797,6 @@ static void cdns_mhdp_atomic_enable(struct 
>>> drm_bridge *bridge,
>>>       cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>>>                   resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>>> -    connector = drm_atomic_get_new_connector_for_encoder(state,
>>> -                                 bridge->encoder);
>>> -    if (WARN_ON(!connector))
>>> -        goto out;
>>> -
>>> -    conn_state = drm_atomic_get_new_connector_state(state, connector);
>>> -    if (WARN_ON(!conn_state))
>>> -        goto out;
>>> -
>>>       if (mhdp->hdcp_supported &&
>>>           mhdp->hw_state == MHDP_HW_READY &&
>>>           conn_state->content_protection ==
>>> @@ -1857,6 +1856,7 @@ static void cdns_mhdp_atomic_disable(struct 
>>> drm_bridge *bridge,
>>>           cdns_mhdp_hdcp_disable(mhdp);
>>>       mhdp->bridge_enabled = false;
>>> +    mhdp->connector = NULL;
>>>       cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
>>>       resp &= ~CDNS_DP_FRAMER_EN;
>>>       resp |= CDNS_DP_NO_VIDEO_MODE;
>>> @@ -2157,7 +2157,7 @@ static void cdns_mhdp_modeset_retry_fn(struct 
>>> work_struct *work)
>>>       mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>>> -    conn = &mhdp->connector;
>>> +    conn = mhdp->connector;
>>>       /* Grab the locks before changing connector property */
>>>       mutex_lock(&conn->dev->mode_config.mutex);
>>> @@ -2234,7 +2234,7 @@ static void cdns_mhdp_hpd_work(struct 
>>> work_struct *work)
>>>       int ret;
>>>       ret = cdns_mhdp_update_link_status(mhdp);
>>> -    if (mhdp->connector.dev) {
>>> +    if (mhdp->connector) {
>>>           if (ret < 0)
>>>               schedule_work(&mhdp->modeset_retry_work);
>>>           else
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h 
>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>> index bad2fc0c7306..b297db53ba28 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>> @@ -375,7 +375,7 @@ struct cdns_mhdp_device {
>>>        */
>>>       struct mutex link_mutex;
>>> -    struct drm_connector connector;
>>> +    struct drm_connector *connector;
>>>       struct drm_bridge bridge;
>>>       struct cdns_mhdp_link link;
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c 
>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>>> index 42248f179b69..59f18c3281ef 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>>> @@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct 
>>> cdns_mhdp_device *mhdp)
>>>       int ret;
>>>       dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
>>> -        mhdp->connector.name, mhdp->connector.base.id);
>>> +        mhdp->connector->name, mhdp->connector->base.id);
>>>       ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
>>> @@ -445,7 +445,7 @@ static int cdns_mhdp_hdcp_check_link(struct 
>>> cdns_mhdp_device *mhdp)
>>>       dev_err(mhdp->dev,
>>>           "[%s:%d] HDCP link failed, retrying authentication\n",
>>> -        mhdp->connector.name, mhdp->connector.base.id);
>>> +        mhdp->connector->name, mhdp->connector->base.id);
>>>       ret = _cdns_mhdp_hdcp_disable(mhdp);
>>>       if (ret) {
>>> @@ -487,13 +487,13 @@ static void cdns_mhdp_hdcp_prop_work(struct 
>>> work_struct *work)
>>>       struct cdns_mhdp_device *mhdp = container_of(hdcp,
>>>                                struct cdns_mhdp_device,
>>>                                hdcp);
>>> -    struct drm_device *dev = mhdp->connector.dev;
>>> +    struct drm_device *dev = mhdp->connector->dev;
>>>       struct drm_connector_state *state;
>>>       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>>       mutex_lock(&mhdp->hdcp.mutex);
>>>       if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>>> -        state = mhdp->connector.state;
>>> +        state = mhdp->connector->state;
>>>           state->content_protection = mhdp->hdcp.value;
>>>       }
>>>       mutex_unlock(&mhdp->hdcp.mutex);
>>
