Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0658CFA08
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583D110F914;
	Mon, 27 May 2024 07:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OrAlROMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2B10F914
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:25:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44R7PHbK089293;
 Mon, 27 May 2024 02:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716794717;
 bh=gg/2NUdGsCVlHuMqI515D/cJ1DeVonBL1Ro+MsON7QU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OrAlROMtYR9Iv36t+7dSdEurT784F1cdMcFIvz0toxbjAbv60k54ke3/ZoqzzSuAN
 Q5i2get1oYXX9t5PCZzbQbIeS0W0X4eI/LLufT2BJ3MheYHawC7HzVB5QXF287mKgV
 gnQkVCQnA8nG/oUApvSR7plElzn6Aj6jAw8VDK9g=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44R7PHLK061750
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2024 02:25:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 May 2024 02:25:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 May 2024 02:25:16 -0500
Received: from [172.24.227.102]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.102])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44R7PAmo049060;
 Mon, 27 May 2024 02:25:11 -0500
Message-ID: <5e7c1f01-70ad-4383-a785-91b0405f3b7d@ti.com>
Date: Mon, 27 May 2024 12:55:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Add mode_valid hook for the
 drm_bridge_funcs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <u.kleine-koenig@pengutronix.de>, <a-bhatia1@ti.com>,
 <javierm@redhat.com>, <nikhil.nd@ti.com>, <jani.nikula@intel.com>,
 <amishin@t-argos.ru>
References: <20240524071348.106210-1-j-choudhary@ti.com>
 <unpyokzp44mxbycjam375zp3xhxz4vtrhjbafg2hnwycm6e3g3@ywv6hwkdenlz>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <unpyokzp44mxbycjam375zp3xhxz4vtrhjbafg2hnwycm6e3g3@ywv6hwkdenlz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/05/24 15:13, Dmitry Baryshkov wrote:
> On Fri, May 24, 2024 at 12:43:48PM +0530, Jayesh Choudhary wrote:
>> With the support for the 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' case,
>> the connector_helper funcs are not initialized if the encoder has this
>> flag in its bridge_attach call. Till now we had mode_valid hook only in
>> the drm_connector_helper_funcs. Add this hook in drm_bridge_funcs to
>> validate the modes in this case as well.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 31 +++++++++++++++----
>>   1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 8a91ef0ae065..0aee038f5db7 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -1617,12 +1617,10 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
>>   	return true;
>>   }
>>   
>> -static
>> -enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
>> -					  struct drm_display_mode *mode)
>> +static enum
>> +drm_mode_status cdns_mhdp_mode_valid(struct cdns_mhdp_device *mhdp,
>> +				     const struct drm_display_mode *mode)
>>   {
>> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>> -
>>   	mutex_lock(&mhdp->link_mutex);
>>   
>>   	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
>> @@ -1635,6 +1633,16 @@ enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
>>   	return MODE_OK;
>>   }
>>   
>> +static enum drm_mode_status
>> +cdns_mhdp_connector_mode_valid(struct drm_connector *conn,
>> +			       struct drm_display_mode *mode)
>> +{
>> +	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
>> +	const struct drm_display_mode *mod = mode;
>> +
>> +	return cdns_mhdp_mode_valid(mhdp, mod);
>> +}
>> +
>>   static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
>>   					    struct drm_atomic_state *state)
>>   {
>> @@ -1678,7 +1686,7 @@ static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
>>   static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
>>   	.detect_ctx = cdns_mhdp_connector_detect,
>>   	.get_modes = cdns_mhdp_get_modes,
>> -	.mode_valid = cdns_mhdp_mode_valid,
>> +	.mode_valid = cdns_mhdp_connector_mode_valid,
> 
> Just move it to bridge_funcs and drop it from connector_helper_funcs. It
> should be enough.

Okay.
Will change in v2.

Thanks,
Jayesh

> 
>>   	.atomic_check = cdns_mhdp_connector_atomic_check,
>>   };
>>   
>> @@ -2233,6 +2241,16 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
>>   	return cdns_mhdp_edid_read(mhdp, connector);
>>   }
>>   
>> +static enum drm_mode_status
>> +cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
>> +			    const struct drm_display_info *info,
>> +			    const struct drm_display_mode *mode)
>> +{
>> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>> +
>> +	return cdns_mhdp_mode_valid(mhdp, mode);
>> +}
>> +
>>   static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>   	.atomic_enable = cdns_mhdp_atomic_enable,
>>   	.atomic_disable = cdns_mhdp_atomic_disable,
>> @@ -2247,6 +2265,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>   	.edid_read = cdns_mhdp_bridge_edid_read,
>>   	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
>>   	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
>> +	.mode_valid = cdns_mhdp_bridge_mode_valid,
>>   };
>>   
>>   static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
>> -- 
>> 2.25.1
>>
> 
