Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FF946240
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 19:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BFB10E15A;
	Fri,  2 Aug 2024 17:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="KuCuIm7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBD010E15A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 17:08:12 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1722618490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDf+A9txkVqV1W2Ctpc6t6vDZn8LLAQXpSRjiyJzMOU=;
 b=KuCuIm7EjTaDAWS+pem9FA5VGekuTecxRgvzgPRfLBUP9PekSaU0a03rI1qpbWZMGQbvJL
 qv6GlRUcB64STvmMlbm24I2DOKR8MdmiEmegNdShlEo5VBMBP8NqYsVcygy2lKPZiqWk/F
 zFS7H31XC4cVdQwPyuUsL4VN1WzstzwqHTu3piXCO8r/a0k9cy4rPKH3GMRcuWrQP7gAUC
 GppNzsrsuRNrL1eOCUf0MtNVCq/mDNtCju4relzGX7oDWpXAEg/BVaZgam3g/dZmzTO6OC
 vXSxUVI8DVd9sj/TPEJnnGC/j0dV+65AsFAiaQt0qnmYJU//jgOf8B9AzAzLYQ==
Date: Fri, 02 Aug 2024 19:08:09 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Clean up a few logged messages
In-Reply-To: <62c163be6ba3eeb9af82672d41e93b78@manjaro.org>
References: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
 <62c163be6ba3eeb9af82672d41e93b78@manjaro.org>
Message-ID: <ee2476ba76d91682ba53248df4789e90@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

On 2024-07-25 11:33, Dragan Simic wrote:
> Hello all,
> 
> Just checking, is this patch good enough to be accepted?  If not, is 
> there
> some other preferred way for cleaning up the produced messages?

Just a brief reminder...

> On 2024-07-04 01:32, Dragan Simic wrote:
>> Clean up a few logged messages, which were previously worded as rather
>> incomplete sentences separated by periods.  This was both a bit 
>> unreadable
>> and grammatically incorrect, so convert them into partial sentences 
>> separated
>> (or connected) by semicolons, together with some wording improvements.
>> 
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 16 +++++++---------
>>  1 file changed, 7 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> index bd7aa891b839..ee9def197095 100644
>> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> @@ -969,46 +969,44 @@ static void cdn_dp_pd_event_work(struct 
>> work_struct *work)
>> 
>>  	/* Not connected, notify userspace to disable the block */
>>  	if (!cdn_dp_connected_port(dp)) {
>> -		DRM_DEV_INFO(dp->dev, "Not connected. Disabling cdn\n");
>> +		DRM_DEV_INFO(dp->dev, "Not connected; disabling cdn\n");
>>  		dp->connected = false;
>> 
>>  	/* Connected but not enabled, enable the block */
>>  	} else if (!dp->active) {
>> -		DRM_DEV_INFO(dp->dev, "Connected, not enabled. Enabling cdn\n");
>> +		DRM_DEV_INFO(dp->dev, "Connected, not enabled; enabling cdn\n");
>>  		ret = cdn_dp_enable(dp);
>>  		if (ret) {
>> -			DRM_DEV_ERROR(dp->dev, "Enable dp failed %d\n", ret);
>> +			DRM_DEV_ERROR(dp->dev, "Enabling dp failed: %d\n", ret);
>>  			dp->connected = false;
>>  		}
>> 
>>  	/* Enabled and connected to a dongle without a sink, notify 
>> userspace */
>>  	} else if (!cdn_dp_check_sink_connection(dp)) {
>> -		DRM_DEV_INFO(dp->dev, "Connected without sink. Assert hpd\n");
>> +		DRM_DEV_INFO(dp->dev, "Connected without sink; assert hpd\n");
>>  		dp->connected = false;
>> 
>>  	/* Enabled and connected with a sink, re-train if requested */
>>  	} else if (!cdn_dp_check_link_status(dp)) {
>>  		unsigned int rate = dp->max_rate;
>>  		unsigned int lanes = dp->max_lanes;
>>  		struct drm_display_mode *mode = &dp->mode;
>> 
>> -		DRM_DEV_INFO(dp->dev, "Connected with sink. Re-train link\n");
>> +		DRM_DEV_INFO(dp->dev, "Connected with sink; re-train link\n");
>>  		ret = cdn_dp_train_link(dp);
>>  		if (ret) {
>>  			dp->connected = false;
>> -			DRM_DEV_ERROR(dp->dev, "Train link failed %d\n", ret);
>> +			DRM_DEV_ERROR(dp->dev, "Training link failed: %d\n", ret);
>>  			goto out;
>>  		}
>> 
>>  		/* If training result is changed, update the video config */
>>  		if (mode->clock &&
>>  		    (rate != dp->max_rate || lanes != dp->max_lanes)) {
>>  			ret = cdn_dp_config_video(dp);
>>  			if (ret) {
>>  				dp->connected = false;
>> -				DRM_DEV_ERROR(dp->dev,
>> -					      "Failed to config video %d\n",
>> -					      ret);
>> +				DRM_DEV_ERROR(dp->dev, "Failed to configure video: %d\n", ret);
>>  			}
>>  		}
>>  	}
