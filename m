Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B34B3F86F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690EF10E5DC;
	Tue,  2 Sep 2025 08:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kq3Nd9Xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE910E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:32:36 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5828WHvU2943326;
 Tue, 2 Sep 2025 03:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756801938;
 bh=1mn4GVLgdfXIZW9WLuwx2E9UPpCwZaUs+phlyicQgyE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=kq3Nd9XhI5ai4ln05HfQeOnuqHzaWPwJF9/dxM6akoFOD7KQUZwzu6vCy4T6qu8dj
 zLTj99YfyWMKZo2cM+LfSnWTFUapnwwx2Apkhnx+C/RvAsHuLKmCT5CXWPVFQh2zHn
 q+xFAifiYqagg95UN/qZ1kt57/ni09rM6mar9/eg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5828WH8N2604321
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 2 Sep 2025 03:32:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 03:32:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 03:32:17 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5828W9Rp3500644;
 Tue, 2 Sep 2025 03:32:10 -0500
Message-ID: <49378457-2a75-4db9-9560-5df0c8a9344a@ti.com>
Date: Tue, 2 Sep 2025 14:02:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
 <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
 <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
 <j-choudhary@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <mripard@kernel.org>, <lumag@kernel.org>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250811075904.1613519-1-h-shenoy@ti.com>
 <20250811075904.1613519-3-h-shenoy@ti.com>
 <e1dd9bd1-0e73-4a8d-947b-7c5a117d8827@ideasonboard.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <e1dd9bd1-0e73-4a8d-947b-7c5a117d8827@ideasonboard.com>
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


On 9/1/25 15:30, Tomi Valkeinen wrote:
> Hi,
>
> On 11/08/2025 10:59, Harikrishna Shenoy wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> After adding DBANC framework, mhdp->connector is not initialised during
>> bridge_attach(). The connector is however required in few driver calls
>> like cdns_mhdp_hdcp_enable() and cdns_mhdp_modeset_retry_fn().
> Does this mean that if you apply only the previous commit, mhdp will
> crash/misbehave as mdhp->connector is not initialized?
>
possible of crash/misbehave of driver due to NULL pointer de-reference 
has been discussed

in previous versions of series, will highlight it to make it more clear.

>> Use drm_connector pointer instead of structure, set it in bridge_enable()
>> and clear it in bridge_disable(), and make appropriate changes.
>>
>> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> This also has a fixes tag, but I don't see any mention of any bug being
> fixed.
>
> For the subjects of the whole series, I think you can just use
> "drm/bridge: cdns-mhdp: ...". That's much shorter.
>
>   Tomi

Explanation of bug along with logs are given in previous versions of the 
series,

will include them as highlights in cover letter to make more clear.

>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 ++++++------
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h |  2 +-
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c |  8 ++++----
>>   3 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 08702ade2903..c2ce3d6e5a88 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -1755,7 +1755,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>   	struct cdns_mhdp_bridge_state *mhdp_state;
>>   	struct drm_crtc_state *crtc_state;
>> -	struct drm_connector *connector;
>>   	struct drm_connector_state *conn_state;
>>   	struct drm_bridge_state *new_state;
>>   	const struct drm_display_mode *mode;
>> @@ -1785,12 +1784,12 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>>   	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>>   			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>>   
>> -	connector = drm_atomic_get_new_connector_for_encoder(state,
>> -							     bridge->encoder);
>> -	if (WARN_ON(!connector))
>> +	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
>> +								   bridge->encoder);
>> +	if (WARN_ON(!mhdp->connector))
>>   		goto out;
>>   
>> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> +	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
>>   	if (WARN_ON(!conn_state))
>>   		goto out;
>>   
>> @@ -1853,6 +1852,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>>   		cdns_mhdp_hdcp_disable(mhdp);
>>   
>>   	mhdp->bridge_enabled = false;
>> +	mhdp->connector = NULL;
>>   	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
>>   	resp &= ~CDNS_DP_FRAMER_EN;
>>   	resp |= CDNS_DP_NO_VIDEO_MODE;
>> @@ -2134,7 +2134,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
>>   
>>   	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>>   
>> -	conn = &mhdp->connector;
>> +	conn = mhdp->connector;
>>   
>>   	/* Grab the locks before changing connector property */
>>   	mutex_lock(&conn->dev->mode_config.mutex);
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> index bad2fc0c7306..b297db53ba28 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> @@ -375,7 +375,7 @@ struct cdns_mhdp_device {
>>   	 */
>>   	struct mutex link_mutex;
>>   
>> -	struct drm_connector connector;
>> +	struct drm_connector *connector;
>>   	struct drm_bridge bridge;
>>   
>>   	struct cdns_mhdp_link link;
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> index 42248f179b69..59f18c3281ef 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>> @@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
>>   	int ret;
>>   
>>   	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
>> -		mhdp->connector.name, mhdp->connector.base.id);
>> +		mhdp->connector->name, mhdp->connector->base.id);
>>   
>>   	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
>>   
>> @@ -445,7 +445,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
>>   
>>   	dev_err(mhdp->dev,
>>   		"[%s:%d] HDCP link failed, retrying authentication\n",
>> -		mhdp->connector.name, mhdp->connector.base.id);
>> +		mhdp->connector->name, mhdp->connector->base.id);
>>   
>>   	ret = _cdns_mhdp_hdcp_disable(mhdp);
>>   	if (ret) {
>> @@ -487,13 +487,13 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>>   	struct cdns_mhdp_device *mhdp = container_of(hdcp,
>>   						     struct cdns_mhdp_device,
>>   						     hdcp);
>> -	struct drm_device *dev = mhdp->connector.dev;
>> +	struct drm_device *dev = mhdp->connector->dev;
>>   	struct drm_connector_state *state;
>>   
>>   	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>   	mutex_lock(&mhdp->hdcp.mutex);
>>   	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
>> -		state = mhdp->connector.state;
>> +		state = mhdp->connector->state;
>>   		state->content_protection = mhdp->hdcp.value;
>>   	}
>>   	mutex_unlock(&mhdp->hdcp.mutex);
