Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E00392871
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFF96EA99;
	Thu, 27 May 2021 07:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2645D6EA99
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:22:18 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id mALMlaDFMVN4kmALPlNUaq; Thu, 27 May 2021 09:22:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1622100136; bh=qUkhE+15QLN3P6Ou/CZcNxg318aR/aNsr+JBp1bVN1k=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=RGMZvDCDQV82TeSGnREl5eM7VOcZia5m+4biKg8s+DC4D5EdwukPMhwmb/NbXyShW
 QYrXDGP3iEkxmImLQJKB3cZjLK4PpHTEAZvBez2BYdhpjpcxyebEtf0h9982hkXb7h
 +M94vYzEG+AWBg6/+oVeDc5Sw/+QB3tQKihj42LF0bf5cajuC3Y0FDTUCBya50RcH1
 nDUnT3V5dro6gP9wtpp7uMbuz5HetEA2R0kK4+eYE7+pT6xjb4MxNje3hzFRbBOBn3
 9rGrn7mObmZkhq07A2/cqdQTnVqw41bL0BZkYt/5Ez38Hn5jPtCq0TrluPX6dk+u2G
 JvuscOIfYxbcQ==
Subject: Re: [PATCHv3 1/6] drm: drm_bridge: add connector_attach/detach bridge
 ops
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
 <20210428132545.1205162-2-hverkuil-cisco@xs4all.nl>
 <bcf1d476-216f-db51-840e-7cda58585b5b@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c3d0a979-ba34-6432-8832-1103c62cd1fd@xs4all.nl>
Date: Thu, 27 May 2021 09:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bcf1d476-216f-db51-840e-7cda58585b5b@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKHqPwDHIDMOnu2l2AaZNS/gYEXzO7WdpUY8oWSy9qWU+bLQyuNhfQ3VP/4C9RskBsHfaf4X2Sy+Q4tqnN9HPd788n8RIhh4CN2rhc+OA+aTThsNJbaf
 dUFikNqpVa972LG3K6I4w7Ei5sSGyaK+L8xpw1nsVyPLZzH//7/92hV1AVfqjRkvu+qOwmNXfnzpw+zSPp+WmLRrod+PZEyYdKKwBWYYxQoAPN+G0K2NXxFC
 bflTFu170IkRd5Eqpkbpi8JKTcF3CxxhKrqsk5EIbCW9pHrVQRegjYO7kw4gQ9+60ggQdUNovjMgQcYmAgz3tqi7ZLucMyd3r7rlBS6yI2LLiGSWOWGii2eF
 P3Jr1KTvAXqHfr5ATsy4Moi8IIr32QqZGEcWzGflghlbN9HjB1JH6nKDm+zGH1lSCKEL+oGLwa7uBVQoN7a/bFW+MyECxHMYogs2giIHOMPllGnqiLvWw2Z+
 v9R0xZBaTwSYAFxSWAQXE9PSDDV0YMwL/jqDgQCE+j6DQ29aPnDIQdOc2HM=
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
Cc: Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2021 10:26, Tomi Valkeinen wrote:
> On 28/04/2021 16:25, Hans Verkuil wrote:
>> Add bridge connector_attach/detach ops. These ops are called when a
>> bridge is attached or detached to a drm_connector. These ops can be
>> used to register and unregister an HDMI CEC adapter for a bridge that
>> supports CEC.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/gpu/drm/drm_bridge_connector.c | 25 +++++++++++++++++++++++-
>>   include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
>>   2 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 791379816837..0676677badfe 100644
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
>> @@ -318,6 +323,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   	struct i2c_adapter *ddc = NULL;
>>   	struct drm_bridge *bridge;
>>   	int connector_type;
>> +	int ret;
>>   
>>   	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>>   	if (!bridge_connector)
>> @@ -375,6 +381,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>>   
>> -	return connector;
>> +	ret = 0;
>> +	/* call connector_attach for all bridges */
>> +	drm_for_each_bridge_in_chain(encoder, bridge) {
>> +		if (!bridge->funcs->connector_attach)
>> +			continue;
>> +		ret = bridge->funcs->connector_attach(bridge, connector);
>> +		if (ret)
>> +			break;
>> +	}
>> +	if (!ret)
>> +		return connector;
>> +
>> +	/* on error, detach any previously successfully attached connectors */
>> +	list_for_each_entry_continue_reverse(bridge, &(encoder)->bridge_chain,
> 
> No need for parenthesis in (encoder) here.
> 
>> +					     chain_node)
>> +		if (bridge->funcs->connector_detach)
>> +			bridge->funcs->connector_detach(bridge, connector);
>> +	return ERR_PTR(ret);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 2195daa289d2..333fbc3a03e9 100644
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
>> +	 *
>> +	 * The @connector_attach callback is optional.
>> +	 *
>> +	 * RETURNS:
>> +	 *
>> +	 * Zero on success, error code on failure.
>> +	 */
>> +	int (*connector_attach)(struct drm_bridge *bridge,
>> +				struct drm_connector *conn);
>> +
>> +	/**
>> +	 * @connector_detach:
>> +	 *
>> +	 * This callback is invoked whenever our bridge is being detached from a
>> +	 * &drm_connector. This is where an HDMI CEC adapter can be
>> +	 * unregistered.
>> +	 *
>> +	 * The @connector_detach callback is optional.
>> +	 */
>> +	void (*connector_detach)(struct drm_bridge *bridge,
>> +				 struct drm_connector *conn);
>>   };
>>   
>>   /**
>>
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> I can take this series as it's mostly omapdrm, but we'll need a 
> reviewed-by/acked-by from a maintainer for this patch.

Laurent, aren't you the drm bridge maintainer?

If so, can you review/ack this patch so Tomi can merge it?

Regards,

	Hans

> 
>   Tomi
> 

