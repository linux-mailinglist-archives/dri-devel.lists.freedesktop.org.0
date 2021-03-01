Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1AF327CAA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 11:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A26E5A5;
	Mon,  1 Mar 2021 10:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C196E5A5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 10:56:34 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id GgE0lCjqUC40pGgE3lhfts; Mon, 01 Mar 2021 11:56:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614596192; bh=X/+Eyi00WPvKMSECicb3RzcDT/xWAIhYgln3dL3QJtg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=OTLNkhirsaEo9Fptb/KOGIrsTEpfdgqj4+DA1ExVmF29XtDRwh/r49zC17PrD5vX4
 vLYgoV/mAQ3BEte1XgZkloo+hnZvDUJ/gubbv2d/B4BM8URdnZX60whHVaVb9/qMOH
 yXKE5DNQ3sRpTWrOGy/fnofQbxMA3BE8r7NP8onubzsjujrlwvPreZHwvf2GWx+5ep
 hfJ59sVFnbZxVkzr9u/BQjegt+5REya2tGADjztE7mjBymShwm5Y2Ot7zN5j2ljgUl
 6tFd+Ilmm5RSZdkE0oEvXoM5xCyfys4IZwUKCOxYev6bWueOvomq1W4nz4b1bl1BVg
 4nZw5dnufy9/Q==
Subject: Re: [PATCH 1/5] drm: drm_bridge: add cec_init/exit bridge ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-2-hverkuil-cisco@xs4all.nl>
 <YC+oyavcOV0uFJUb@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <663ec8d4-eb1a-a6ed-056f-cc51a544e6a7@xs4all.nl>
Date: Mon, 1 Mar 2021 11:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC+oyavcOV0uFJUb@pendragon.ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfCB5yZR8/GRlwKkaZLMHSpy3X+eQIjc84djTeI3exsO02J3VgjLPE+XiAReoFVKqwEvev5J0pE/T1J2EOMJTmoCZugpBZmWAxRHGU2k1ic8X6eCWXvmM
 y5wVEuoRuAVpSfck5TTE+wa1wWJvuvSz7c0FYZAh0EoAIlVVFq+ER+oCpgdPqPK2PJXTw1ba+0qcsRUHV6qXBaDIlF8KysNVAYlBLVGGTNw6T4F6P7noyzoG
 9imS4GsXUUyUao7hNe9gVUKpP6ennyw9nujB/TkxNVDpn/SMI4d3V+6v2Uwi6TdRnze+i5273Zb1t0tmN6OptTUjo0qDwCjglDup7J0IiEDNrhgsFR4LkEP7
 BwsZGhBy4gG05AJJsyN7QSgLB56ujoyN+TEaBTuoXmkkMo5ytNZmNyj4RhlTz+VAlos+QMdD
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2021 13:02, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Feb 11, 2021 at 11:36:59AM +0100, Hans Verkuil wrote:
>> Add bridge cec_init/exit ops. These ops will be responsible for
>> creating and destroying the CEC adapter for the bridge that supports
>> CEC.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++++++++++++++++
>>  include/drm/drm_bridge.h               | 31 ++++++++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 791379816837..2ff90f5e468c 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -84,6 +84,13 @@ struct drm_bridge_connector {
>>  	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
>>  	 */
>>  	struct drm_bridge *bridge_modes;
>> +	/**
>> +	 * @bridge_cec:
>> +	 *
>> +	 * The last bridge in the chain (closest to the connector) that provides
>> +	 * cec adapter support, if any (see &DRM_BRIDGE_OP_CEC).
>> +	 */
>> +	struct drm_bridge *bridge_cec;
>>  };
>>  
>>  #define to_drm_bridge_connector(x) \
>> @@ -204,6 +211,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>>  	struct drm_bridge_connector *bridge_connector =
>>  		to_drm_bridge_connector(connector);
>>  
>> +	if (bridge_connector->bridge_cec) {
>> +		struct drm_bridge *cec = bridge_connector->bridge_cec;
>> +
>> +		cec->funcs->cec_exit(cec);
>> +	}
>>  	if (bridge_connector->bridge_hpd) {
>>  		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
>>  
>> @@ -352,6 +364,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>  			bridge_connector->bridge_detect = bridge;
>>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>>  			bridge_connector->bridge_modes = bridge;
>> +		if (bridge->ops & DRM_BRIDGE_OP_CEC)
>> +			bridge_connector->bridge_cec = bridge;
>>  
>>  		if (!drm_bridge_get_next_bridge(bridge))
>>  			connector_type = bridge->type;
>> @@ -374,6 +388,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>  	else if (bridge_connector->bridge_detect)
>>  		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>>  				  | DRM_CONNECTOR_POLL_DISCONNECT;
>> +	if (bridge_connector->bridge_cec) {
>> +		struct drm_bridge *bridge = bridge_connector->bridge_cec;
>> +		int ret = bridge->funcs->cec_init(bridge, connector);
>> +
>> +		if (ret) {
>> +			drm_bridge_connector_destroy(connector);
>> +			return ERR_PTR(ret);
>> +		}
>> +	}
>>  
>>  	return connector;
>>  }
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 2195daa289d2..4c83c2657e87 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -629,6 +629,30 @@ struct drm_bridge_funcs {
>>  	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
>>  	 */
>>  	void (*hpd_disable)(struct drm_bridge *bridge);
>> +
>> +	/**
>> +	 * @cec_init:
>> +	 *
>> +	 * Initialize the CEC adapter.
>> +	 *
>> +	 * This callback is optional and shall only be implemented by bridges
>> +	 * that support a CEC adapter. Bridges that implement it shall also
>> +	 * implement the @cec_exit callback and set the DRM_BRIDGE_OP_CEC flag
>> +	 * in their &drm_bridge->ops.
>> +	 */
>> +	int (*cec_init)(struct drm_bridge *bridge, struct drm_connector *conn);
>> +
>> +	/**
>> +	 * @cec_exit:
>> +	 *
>> +	 * Terminate the CEC adapter.
>> +	 *
>> +	 * This callback is optional and shall only be implemented by bridges
>> +	 * that support a CEC adapter. Bridges that implement it shall also
>> +	 * implement the @cec_init callback and set the DRM_BRIDGE_OP_CEC flag
>> +	 * in their &drm_bridge->ops.
>> +	 */
>> +	void (*cec_exit)(struct drm_bridge *bridge);
> 
> These are very ad-hoc operations. Would it make sense to have something
> that could also be reused for other type of intiialization and cleanup
> that require access to the drm_connector ?

I do not have a very strong opinion, to be honest.

How about this:

	/**
	 * @DRM_BRIDGE_OP_CONN: The bridge can do additional work when
	 * a drm_connector is created or destroyed, such as creating or
	 * removing a CEC adapter.
	 * &drm_bridge_funcs->conn_init and &drm_bridge_funcs->conn_exit
	 * callbacks.
	 */
	DRM_BRIDGE_OP_CONN = BIT(4),

Would that work better for you?

Regards,

	Hans

> 
>>  };
>>  
>>  /**
>> @@ -698,6 +722,13 @@ enum drm_bridge_ops {
>>  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>>  	 */
>>  	DRM_BRIDGE_OP_MODES = BIT(3),
>> +	/**
>> +	 * @DRM_BRIDGE_OP_CEC: The bridge supports a CEC adapter.
>> +	 * Bridges that set this flag shall implement the
>> +	 * &drm_bridge_funcs->cec_init and &drm_bridge_funcs->cec_exit
>> +	 * callbacks.
>> +	 */
>> +	DRM_BRIDGE_OP_CEC = BIT(4),
>>  };
>>  
>>  /**
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
