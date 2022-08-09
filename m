Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24258E21A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 23:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D1A5F3C;
	Tue,  9 Aug 2022 21:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA9AA2B05;
 Tue,  9 Aug 2022 21:47:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 279LY7bG026866;
 Tue, 9 Aug 2022 21:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VH6gEG8WQEXtp0QKBiqHq0UZrIEv0Dc2HConOdInAaI=;
 b=K9OnFmVahhYsocNZ/XQT+wtMZ8V+BM/NaDyl5LQiwwqsObYt9A2VdWzLREzjJfwXjm4K
 LEbuHAnKPpwUc8Hk2g1DsODzIAB3O8shpKamQV8m/R0tNlnA2umV7xR3iJBiLvdnIn0/
 FoR9aua2ZGvHSqgAoMK4g5IbI8oE+TLU7PHBfv7+glmfR0MDjE56xtr2jpjr2uQj5cfl
 Ge2PS6Jx3go++uBFRBFC7XgYeA7rl53niLWPkyAr13GT8o4t3kTcFwf690JMTI9KMV+L
 hQnhEXzBq2Ig+ttBI5ry0/VSnODmDvNVRpQpLAtScqWtK7X7bnr4G66YvJ2t4Gm+jR7m OA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwra07uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 21:47:41 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 279LleCj026147
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Aug 2022 21:47:40 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 9 Aug 2022 14:47:39 -0700
Received: from [10.111.167.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 9 Aug 2022
 14:47:34 -0700
Message-ID: <b1a291ca-2a63-47ac-775e-72d2ebfa43fa@quicinc.com>
Date: Tue, 9 Aug 2022 14:47:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC] drm/bridge: adv7533: remove dynamic lane switching from
 adv7533 bridge
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1660005330-12369-1-git-send-email-quic_abhinavk@quicinc.com>
 <YvK4SpvF0zwtaIM9@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YvK4SpvF0zwtaIM9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x5yzIOeQtUpbIu-D2vHh5_mwVgQnnEbV
X-Proofpoint-GUID: x5yzIOeQtUpbIu-D2vHh5_mwVgQnnEbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_05,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208090080
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
Cc: jernej.skrabec@gmail.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 airlied@linux.ie, sam@ravnborg.org, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 robert.foss@linaro.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, colin.king@intel.com,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

Thanks for the response.

On 8/9/2022 12:40 PM, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> Thank you for the patch.
> 
> On Mon, Aug 08, 2022 at 05:35:30PM -0700, Abhinav Kumar wrote:
>> adv7533 bridge tries to dynamically switch lanes based on the
>> mode by detaching and attaching the mipi dsi device.
>>
>> This approach is incorrect because as per the DSI spec the
>> number of lanes is fixed at the time of system design or initial
>> configuration and may not change dynamically.
> 
> Is that really so ? The number of lanes connected on the board is
> certainlyset at design time, but a lower number of lanes can be used at
> runtime. It shouldn't change dynamically while the display is on, but it
> could change at mode set time.

So as per the spec it says this:

"The number of Lanes used shall be a static parameter. It shall be fixed 
at the time of system design or initial configuration and may not change 
dynamically. Typically, the peripheral’s bandwidth requirement and its 
corresponding Lane configuration establishes the number of Lanes used in 
a system."

But I do agree with you that this does not prohibit us from changing the 
lanes during mode_set time because display might have been off.

Although, I really did not see any other bridges doing it this way.

At the same time, detach() and attach() cycle seems the incorrect way to 
do it here.

We did think of another approach of having a new mipi_dsi_op to 
reconfigure the host without the component_del()/component_add() because 
most of the host drivers also do component_del()/component_add() in 
detach()/attach().

But that would not work here either because this bridge is after the DSI 
controller's bridge in the chain.

Hence DSI controller's modeset would happen earlier than this one.

So even if we do have another op to reconfigure the host , this bridge's 
modeset would be too late to call that new op.

It complicates things a bit, so we thought that not supporting dynamic 
lane switching would be the better way forward unless there is another 
suggestion on how to support this.

> 
>> In addition this method of dynamic switch of detaching and
>> attaching the mipi dsi device also results in removing
>> and adding the component which is not necessary.
> 
> Yes, that doesn't look good, and the .mode_valid() operation is
> definitely not the right point where to set the number of lanes.
> 

I didnt follow this. Did you mean mode_set() is not the right point to 
set the number of lanes?

So without this change, adv7533 changes the number of lanes during 
mode_set time followed by a detach/attach cycle.


>> This approach is also prone to deadlocks. So for example, on the
>> db410c whenever this path is executed with lockdep enabled,
>> this results in a deadlock due to below ordering of locks.
>>
>> -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>>          lock_acquire+0x6c/0x90
>>          drm_modeset_acquire_init+0xf4/0x150
>>          drmm_mode_config_init+0x220/0x770
>>          msm_drm_bind+0x13c/0x654
>>          try_to_bring_up_aggregate_device+0x164/0x1d0
>>          __component_add+0xa8/0x174
>>          component_add+0x18/0x2c
>>          dsi_dev_attach+0x24/0x30
>>          dsi_host_attach+0x98/0x14c
>>          devm_mipi_dsi_attach+0x38/0xb0
>>          adv7533_attach_dsi+0x8c/0x110
>>          adv7511_probe+0x5a0/0x930
>>          i2c_device_probe+0x30c/0x350
>>          really_probe.part.0+0x9c/0x2b0
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __device_attach_driver+0xbc/0x124
>>          bus_for_each_drv+0x78/0xd0
>>          __device_attach+0xa8/0x1c0
>>          device_initial_probe+0x18/0x24
>>          bus_probe_device+0xa0/0xac
>>          deferred_probe_work_func+0x90/0xd0
>>          process_one_work+0x28c/0x6b0
>>          worker_thread+0x240/0x444
>>          kthread+0x110/0x114
>>          ret_from_fork+0x10/0x20
>>
>> -> #0 (component_mutex){+.+.}-{3:3}:
>>          __lock_acquire+0x1280/0x20ac
>>          lock_acquire.part.0+0xe0/0x230
>>          lock_acquire+0x6c/0x90
>>          __mutex_lock+0x84/0x400
>>          mutex_lock_nested+0x3c/0x70
>>          component_del+0x34/0x170
>>          dsi_dev_detach+0x24/0x30
>>          dsi_host_detach+0x20/0x64
>>          mipi_dsi_detach+0x2c/0x40
>>          adv7533_mode_set+0x64/0x90
>>          adv7511_bridge_mode_set+0x210/0x214
>>          drm_bridge_chain_mode_set+0x5c/0x84
>>          crtc_set_mode+0x18c/0x1dc
>>          drm_atomic_helper_commit_modeset_disables+0x40/0x50
>>          msm_atomic_commit_tail+0x1d0/0x6e0
>>          commit_tail+0xa4/0x180
>>          drm_atomic_helper_commit+0x178/0x3b0
>>          drm_atomic_commit+0xa4/0xe0
>>          drm_client_modeset_commit_atomic+0x228/0x284
>>          drm_client_modeset_commit_locked+0x64/0x1d0
>>          drm_client_modeset_commit+0x34/0x60
>>          drm_fb_helper_lastclose+0x74/0xcc
>>          drm_lastclose+0x3c/0x80
>>          drm_release+0xfc/0x114
>>          __fput+0x70/0x224
>>          ____fput+0x14/0x20
>>          task_work_run+0x88/0x1a0
>>          do_exit+0x350/0xa50
>>          do_group_exit+0x38/0xa4
>>          __wake_up_parent+0x0/0x34
>>          invoke_syscall+0x48/0x114
>>          el0_svc_common.constprop.0+0x60/0x11c
>>          do_el0_svc+0x30/0xc0
>>          el0_svc+0x58/0x100
>>          el0t_64_sync_handler+0x1b0/0x1bc
>>          el0t_64_sync+0x18c/0x190
>>
>> Due to above reasons, remove the dynamic lane switching
>> code from adv7533 bridge chip and filter out the modes
>> which would need different number of lanes as compared
>> to the initialization time using the mode_valid callback.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++----
>>   drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++------------
>>   3 files changed, 29 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> index 9e3bb8a8ee40..0a7cec80b75d 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> @@ -417,7 +417,8 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>   
>>   void adv7533_dsi_power_on(struct adv7511 *adv);
>>   void adv7533_dsi_power_off(struct adv7511 *adv);
>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>> +		const struct drm_display_mode *mode);
>>   int adv7533_patch_registers(struct adv7511 *adv);
>>   int adv7533_patch_cec_registers(struct adv7511 *adv);
>>   int adv7533_attach_dsi(struct adv7511 *adv);
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 5bb9300040dd..1115ef9be83c 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
>>   }
>>   
>>   static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
>> -			      struct drm_display_mode *mode)
>> +			      const struct drm_display_mode *mode)
>>   {
>>   	if (mode->clock > 165000)
>>   		return MODE_CLOCK_HIGH;
>> @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>>   	regmap_update_bits(adv7511->regmap, 0x17,
>>   		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>>   
>> -	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>> -		adv7533_mode_set(adv7511, adj_mode);
>> -
>>   	drm_mode_copy(&adv7511->curr_mode, adj_mode);
>>   
>>   	/*
>> @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
>>   	adv7511_mode_set(adv, mode, adj_mode);
>>   }
>>   
>> +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
>> +		const struct drm_display_info *info,
>> +		const struct drm_display_mode *mode)
>> +{
>> +	struct adv7511 *adv = bridge_to_adv7511(bridge);
>> +
>> +	if (adv->type == ADV7533 || adv->type == ADV7535)
>> +		return adv7533_mode_valid(adv, mode);
>> +	else
>> +		return adv7511_mode_valid(adv, mode);
>> +}
>> +
>>   static int adv7511_bridge_attach(struct drm_bridge *bridge,
>>   				 enum drm_bridge_attach_flags flags)
>>   {
>> @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
>>   	.enable = adv7511_bridge_enable,
>>   	.disable = adv7511_bridge_disable,
>>   	.mode_set = adv7511_bridge_mode_set,
>> +	.mode_valid = adv7511_bridge_mode_valid,
>>   	.attach = adv7511_bridge_attach,
>>   	.detect = adv7511_bridge_detect,
>>   	.get_edid = adv7511_bridge_get_edid,
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> index ef6270806d1d..4a6d45edf431 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
>> @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>>   	regmap_write(adv->regmap_cec, 0x27, 0x0b);
>>   }
>>   
>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>> +		const struct drm_display_mode *mode)
>>   {
>> +	int lanes;
>>   	struct mipi_dsi_device *dsi = adv->dsi;
>> -	int lanes, ret;
>> -
>> -	if (adv->num_dsi_lanes != 4)
>> -		return;
>>   
>>   	if (mode->clock > 80000)
>>   		lanes = 4;
>>   	else
>>   		lanes = 3;
>>   
>> -	if (lanes != dsi->lanes) {
>> -		mipi_dsi_detach(dsi);
>> -		dsi->lanes = lanes;
>> -		ret = mipi_dsi_attach(dsi);
>> -		if (ret)
>> -			dev_err(&dsi->dev, "failed to change host lanes\n");
>> -	}
>> +	/*
>> +	 * number of lanes cannot be changed after initialization
>> +	 * as per section 6.1 of the DSI specification. Hence filter
>> +	 * out the modes which shall need different number of lanes
>> +	 * than what was configured in the device tree.
>> +	 */
>> +	if (lanes != dsi->lanes)
>> +		return MODE_BAD;
>> +
>> +	return MODE_OK;
>>   }
>>   
>>   int adv7533_patch_registers(struct adv7511 *adv)
> 
