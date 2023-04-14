Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54B6E2681
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1910E192;
	Fri, 14 Apr 2023 15:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AA610E192
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:10:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EFAQWO107868;
 Fri, 14 Apr 2023 10:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1681485026;
 bh=j36I0SHEL60unIXivNF5NtJiYS+8nIovqEm5U5C62pc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OWqxc4LP0AM4767LfxOn4EznCyjT0ZR1jUvDKbXq66luisSpXDZ2wJmkTlLl7OSxB
 sNlmiO5tl5UOTaBlvGDmeA2cOLQWdde/h35hN/Re0yb6DqoZpKhtjf5vtmWFjr0Fv7
 D3pvyDD2QUAQo1UDqaV/JZrrNt5nX+yYL1lju5GU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EFAQHW031535
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Apr 2023 10:10:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 10:10:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 10:10:26 -0500
Received: from [172.24.145.152] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EFAJ9f089671;
 Fri, 14 Apr 2023 10:10:19 -0500
Message-ID: <83e146a8-0ba6-d49f-cfa8-68ca7f45bcfe@ti.com>
Date: Fri, 14 Apr 2023 20:40:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] drm: bridge: cdns-mhdp8546: Add support for no-hpd
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-3-j-choudhary@ti.com>
 <20230406015207.GO9915@pendragon.ideasonboard.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20230406015207.GO9915@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 jani.nikula@intel.com, robh+dt@kernel.org, neil.armstrong@linaro.org,
 yamonkar@cadence.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06/04/23 07:22, Laurent Pinchart wrote:
> Hi Jayesh,
> 
> Thank you for the patch.
> 
> On Wed, Apr 05, 2023 at 07:54:40PM +0530, Jayesh Choudhary wrote:
>> From: Rahul T R <r-ravikumar@ti.com>
>>
>> In J721S2 EVMs DP0 hpd is not connected to correct
>> hpd pin on SOC, to handle such cases, Add support for
>> "no-hpd" property in the device tree node to disable
>> hpd
> 
> s/hpd/hpd./
> 
> You can also reflow the commit message to 72 columns.

Okay. Thanks for the suggestion. Will do.

> 
>> Also change the log level for dpcd read failuers to
>> debug, since framework retries 32 times for each read
> 
> s/read/read./
> 
> Doesn't this apply to writes as well ?

Based on message request, we went into the conditional that uses
read. So just changing the log-level for dpcd read was enough to
get rid of the debug logs.

> 
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 37 ++++++++++++++++---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>>   2 files changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index f6822dfa3805..e177794b069d 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -54,6 +54,8 @@
>>   #include "cdns-mhdp8546-hdcp.h"
>>   #include "cdns-mhdp8546-j721e.h"
>>   
>> +static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp);
>> +
>>   static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
>>   {
>>   	int ret, empty;
>> @@ -749,7 +751,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
>>   	 * MHDP_HW_STOPPED happens only due to driver removal when
>>   	 * bridge should already be detached.
>>   	 */
>> -	if (mhdp->bridge_attached)
>> +	if (mhdp->bridge_attached && !mhdp->no_hpd)
>>   		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>>   		       mhdp->regs + CDNS_APB_INT_MASK);
>>   
>> @@ -845,7 +847,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
>>   		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
>>   					  msg->buffer, msg->size);
>>   		if (ret) {
>> -			dev_err(mhdp->dev,
>> +			dev_dbg(mhdp->dev,
>>   				"Failed to read DPCD addr %u\n",
>>   				msg->address);
>>   
>> @@ -1738,6 +1740,19 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>>   
>>   	spin_unlock(&mhdp->start_lock);
>>   
>> +	if (mhdp->no_hpd) {
>> +		ret = wait_event_timeout(mhdp->fw_load_wq,
>> +					 mhdp->hw_state == MHDP_HW_READY,
>> +					 msecs_to_jiffies(100));
>> +		if (ret == 0) {
>> +			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
>> +				__func__);
>> +			return -ETIMEDOUT;
>> +		}
>> +
>> +		cdns_mhdp_update_link_status(mhdp);
>> +		return 0;
>> +	}
> 
> Missing blank line.
> 
> It's not clear to me while you need to wait for the state to change to
> MHDP_HW_READY in the no_hpd case. This should be explained in the commit
> message.
> 
>>   	/* Enable SW event interrupts */
>>   	if (hw_ready)
>>   		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>> @@ -2256,7 +2271,16 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
>>   
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>> -	mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
>> +	if (mhdp->no_hpd) {
>> +		ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
>> +		hpd_pulse = false;
>> +		if (ret < 0)
>> +			mhdp->plugged = false;
>> +		else
>> +			mhdp->plugged = true;
> 
> I think there's an issue with how the driver uses mhdp->plugged. In the
> no_hpd case, you try to detect if a display is connected by reading the
> link status at attach time, and then never update mhdp->plugged. This
> means that if no display is connected at that point, functions like
> cdns_mhdp_get_edid() will always fail, even if a display gets plugged
> later. As the goal of this series is (as far as I understand) support
> systems where the HPD signal could be connected to a SoC GPIO instead of
> the bridge, I don't think this is good enough.

In the driver, I see that this is the only call which changes 
mhdp->plugged. Do you have any suggestions on how to work on this?
Polling the value of drm_dp_dpdc_read_link_status does not seem like a
clean way.
Here by doing this, we are settling for few functionalities of display.

Thanks,
-Jayesh

> 
>> +	} else {
>> +		mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
>> +	}
>>   
>>   	if (!mhdp->plugged) {
>>   		cdns_mhdp_link_down(mhdp);
>> @@ -2451,6 +2475,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>>   	mhdp->aux.dev = dev;
>>   	mhdp->aux.transfer = cdns_mhdp_transfer;
>>   
>> +	mhdp->no_hpd = of_property_read_bool(dev->of_node, "cdns,no-hpd");
>> +
>>   	mhdp->regs = devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(mhdp->regs)) {
>>   		dev_err(dev, "Failed to get memory resource\n");
>> @@ -2526,8 +2552,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>>   
>>   	mhdp->bridge.of_node = pdev->dev.of_node;
>>   	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
>> -	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>> -			   DRM_BRIDGE_OP_HPD;
>> +	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
>> +	if (!mhdp->no_hpd)
>> +		mhdp->bridge.ops |= DRM_BRIDGE_OP_HPD;
>>   	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>>   	if (mhdp->info)
>>   		mhdp->bridge.timings = mhdp->info->timings;
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> index bedddd510d17..6786ccb51387 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>> @@ -388,6 +388,7 @@ struct cdns_mhdp_device {
>>   
>>   	bool link_up;
>>   	bool plugged;
>> +	bool no_hpd;
>>   
>>   	/*
>>   	 * "start_lock" protects the access to bridge_attached and
> 
