Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D636D720
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3556E0D7;
	Wed, 28 Apr 2021 12:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Wed, 28 Apr 2021 12:17:26 UTC
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E787A6E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:17:26 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id bj15lVL7Qk1MGbj18lOFMe; Wed, 28 Apr 2021 14:10:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619611811; bh=x8Q25aX+Npb9ZR8tRbOZJxa+MhNaTu40hM9OtaCYssg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=eNz4QqzcSAda6vxjk/7qNSjswamv/yOLVFyudswPyl1GNjWnmpXIL3w1tt6YHG/4x
 +0cID/6v1gvzidor8BANi3Lk5MXZ/JDaVlotN252re2wT6rc/15VkUnSDcQKe0qD3Y
 bnitUSwpcKmoeqi3DQeL1mJK3KRMuj9SXrZu6RCfyCroGH8JUjHHNgczD6DgejiU00
 TF56qIeVKRKmem3nXlr5plkku4Wiq3xNmE38YE8yVQlL0aznHrAA4Ddmc5P3j+4Qma
 jtJh4t44tRhn+Q56e+oLbyCCCncXpV7tBz15klrIgAN+cpCCCnFSqo3cxzzyTloXl6
 u4U1v55XIa0xQ==
Subject: Re: [PATCHv2 1/6] drm: drm_bridge: add connector_attach/detach bridge
 ops
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-2-hverkuil-cisco@xs4all.nl>
 <3ba8c7c3-2e86-964d-2e5b-5cdd805def5c@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <54c88a9f-6b80-4d4d-c0e6-c6c7b2a32050@xs4all.nl>
Date: Wed, 28 Apr 2021 14:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3ba8c7c3-2e86-964d-2e5b-5cdd805def5c@ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfLOpfNdVLh3mub3CUnLZYyIn+eAqJ0VAgSEG3mgVP49fHYthJ2LubIw3gJiuc+UsfJpR8DtVTIrEYR5+EAB0jS04uyeMqPgw5+L8zUnLpeNCKEHWgTKr
 Ja6Ad9WtE+wTY+5cO0xSwWi/abxtYsuaeHJvcgk3NrN49wLJUl6gnvPx/SruANEDOY+b3xrD/mch1S0sPAE+DF6+fPOtV0uVGPMW6Hatnofa+yRkfFiPqmX1
 b7XqdJpQZHw5nBpuQ7gwzW20P6BcvV5toqYdAIo+WKP7L65FvrBT+ywN03VEdtml4bRtDC/3zX86e0e793P7Ja4yo+B+eYG2tHDT+mYNNp3FHtXX+7OrT3AR
 Q9MfGwT2GqvO+LAB2+O2s1VZ7wKyOQTaVG0YRMEb+HjhXzrtSjk0EHXuYyMi2G71xUQG+i5Jndju8IR5/ovxECWWKJqI/LmM+V8/b62yEBxCi8JW3yM7FqcP
 /8G2l0quIUC2R0LW
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 09:46, Tomi Valkeinen wrote:
> Hi Hans,
> 
> On 02/03/2021 18:23, Hans Verkuil wrote:
>> Add bridge connector_attach/detach ops. These ops are called when a
>> bridge is attached or detached to a drm_connector. These ops can be
>> used to register and unregister an HDMI CEC adapter for a bridge that
>> supports CEC.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/gpu/drm/drm_bridge_connector.c |  9 +++++++++
>>   include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 791379816837..07db71d4f5b3 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>>   {
>>   	struct drm_bridge_connector *bridge_connector =
>>   		to_drm_bridge_connector(connector);
>> +	struct drm_bridge *bridge;
>> +
>> +	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
>> +		if (bridge->funcs->connector_detach)
>> +			bridge->funcs->connector_detach(bridge, connector);
>>   
>>   	if (bridge_connector->bridge_hpd) {
>>   		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
>> @@ -375,6 +380,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>>   
>> +	drm_for_each_bridge_in_chain(encoder, bridge)
>> +		if (bridge->funcs->connector_attach)
>> +			bridge->funcs->connector_attach(bridge, connector);
>> +
>>   	return connector;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 2195daa289d2..3320a6ebd253 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -629,6 +629,33 @@ struct drm_bridge_funcs {
>>   	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
>>   	 */
>>   	void (*hpd_disable)(struct drm_bridge *bridge);
>> +
>> +	/**
>> +	 * @connector_attach:
>> +	 *
>> +	 * This callback is invoked whenever our bridge is being attached to a
>> +	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
>> +	 * Note that this callback expects that this op always succeeds. Since
>> +	 * HDMI CEC support is an optional feature, any failure to register a
>> +	 * CEC adapter must be ignored since video output will still work
>> +	 * without CEC.
>> +	 *
> 
> Even if CEC support is optional, the callback itself is generic. 
> Wouldn't it be better to make this function return an error, and for 
> CEC, just return 0 if CEC won't get registered correctly?

I'll do that.

> 
> Also, I personally like things to fail if something doesn't go right, 
> instead of continuing, if that thing is never supposed to happen in 
> normal situations. E.g. if CEC registration fails because we're out of 
> memory, I think the op should fail too.

If that happens you have no video output. And that's a lot more important
than CEC! As you suggested, I'll have the cec connector_attach just return
0.

Regards,

	Hans

> 
>   Tomi
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
