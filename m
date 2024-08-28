Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373B962813
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771A10E50A;
	Wed, 28 Aug 2024 13:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IUsWa/cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4410E50A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:00:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42816ca782dso58855425e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724850016; x=1725454816; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=exgXW8MQI91qxxtSMkyGmcZjJTXK1AuFo5AsFdZQpgA=;
 b=IUsWa/cbbe5kSxM0HxGOWZuQgYdkcPM6KlcMXb/nM+bZYoMUxidHxgv8EqCf4zBn6X
 jK7wZxItCgkJrXlT2o1v0eHwygbCj5/zSnd1nXkPaDH8ggGfCYxQJLUAT1kDfG+3goW4
 mWwSxYlIi+4HbXQKQ/kCRJLKh9CQaicuqxBDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724850016; x=1725454816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exgXW8MQI91qxxtSMkyGmcZjJTXK1AuFo5AsFdZQpgA=;
 b=ThyqwI6ML6jBp41U1y56sTXQzPChsmWJSOo9VFraIGcaLvIr/zer6wBrhgcxM60UeD
 tq1IgBDmONFnLGumujINkSzcnhdtXCiPAdZpdluNsl5eRg18ShSPZJPZDozeBHdvtyVv
 FWZkOF5IpUEJ18k11Ta8KjH3wunM4IxMt3hfccp2vrOzESFsP6pWGfsgCFipk592wKNQ
 EIuEBT++lFBFk2ijive20zvUHwbNJlsf8ychEzoq/aDXKe33D0c1yYRy0B/7mNClkc70
 gR01buI/KYa+02cVaFngPY4iezjq3dbf29tjP2/JVmOgC/w/MYbvpTtqcvNZlLswLftj
 E6lw==
X-Gm-Message-State: AOJu0YygdabWVMz3SwfdRrKpWq8e6oiEa5RPw/58fCxHk0hJGrEKQulE
 UB63TcHFDFB7z7eGvbH0x6yxK5ASqhts4/EZEjUh+BtbWDb1j0uZVWgeMHmUi6un9+JNGeHziU6
 b
X-Google-Smtp-Source: AGHT+IHk6nmt4HJIQCszPe8cvSSKGksson9ORY2M6vtDdH7LVdyVKIXGkTPZ5snsIFifaadrm0kBEg==
X-Received: by 2002:a05:600c:4ec6:b0:426:6153:5318 with SMTP id
 5b1f17b1804b1-42acc8dd87amr110090745e9.19.1724850015483; 
 Wed, 28 Aug 2024 06:00:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba9a1eeadsm11022115e9.43.2024.08.28.06.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 06:00:14 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:00:12 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND 1/3] drm/mst: switch to guid_t type for GUID
Message-ID: <Zs8fXM8vHAPigE-s@phenom.ffwll.local>
References: <20240812122312.1567046-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812122312.1567046-1-jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Aug 12, 2024 at 03:23:10PM +0300, Jani Nikula wrote:
> The kernel has a guid_t type for GUIDs. Switch to using it, but avoid
> any functional changes here.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I didn't cross-check everything, I'll trust the compiler on this. But
functionally lgtm

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reading code a bit I did wonder whether we could have send/receive macros
that just work for compile-time statically sized types ... but not even
kmalloc is there yet I think, at least haven't seen anything.
-Sima

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 67 +++++++++++--------
>  include/drm/display/drm_dp_mst_helper.h       | 12 ++--
>  3 files changed, 45 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7e7929f24ae4..72c10fc2c890 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2610,7 +2610,7 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>  		}
>  	}
>  
> -	memcpy(mgr->mst_primary->guid, guid, 16);
> +	import_guid(&mgr->mst_primary->guid, guid);
>  
>  out_fail:
>  	mutex_unlock(&mgr->lock);
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 379a449a28a2..39f1dc45004e 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -89,7 +89,7 @@ static int drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
>  					   struct drm_dp_mst_branch *mstb,
>  					   struct drm_dp_mst_port *port);
>  static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
> -				 u8 *guid);
> +				 guid_t *guid);
>  
>  static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port);
>  static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
> @@ -801,7 +801,7 @@ static bool drm_dp_sideband_parse_link_address(const struct drm_dp_mst_topology_
>  	int idx = 1;
>  	int i;
>  
> -	memcpy(repmsg->u.link_addr.guid, &raw->msg[idx], 16);
> +	import_guid(&repmsg->u.link_addr.guid, &raw->msg[idx]);
>  	idx += 16;
>  	repmsg->u.link_addr.nports = raw->msg[idx] & 0xf;
>  	idx++;
> @@ -829,7 +829,7 @@ static bool drm_dp_sideband_parse_link_address(const struct drm_dp_mst_topology_
>  			idx++;
>  			if (idx > raw->curlen)
>  				goto fail_len;
> -			memcpy(repmsg->u.link_addr.ports[i].peer_guid, &raw->msg[idx], 16);
> +			import_guid(&repmsg->u.link_addr.ports[i].peer_guid, &raw->msg[idx]);
>  			idx += 16;
>  			if (idx > raw->curlen)
>  				goto fail_len;
> @@ -1029,7 +1029,7 @@ static bool drm_dp_sideband_parse_reply(const struct drm_dp_mst_topology_mgr *mg
>  	msg->req_type = (raw->msg[0] & 0x7f);
>  
>  	if (msg->reply_type == DP_SIDEBAND_REPLY_NAK) {
> -		memcpy(msg->u.nak.guid, &raw->msg[1], 16);
> +		import_guid(&msg->u.nak.guid, &raw->msg[1]);
>  		msg->u.nak.reason = raw->msg[17];
>  		msg->u.nak.nak_data = raw->msg[18];
>  		return false;
> @@ -1078,7 +1078,7 @@ drm_dp_sideband_parse_connection_status_notify(const struct drm_dp_mst_topology_
>  	if (idx > raw->curlen)
>  		goto fail_len;
>  
> -	memcpy(msg->u.conn_stat.guid, &raw->msg[idx], 16);
> +	import_guid(&msg->u.conn_stat.guid, &raw->msg[idx]);
>  	idx += 16;
>  	if (idx > raw->curlen)
>  		goto fail_len;
> @@ -1107,7 +1107,7 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
>  	if (idx > raw->curlen)
>  		goto fail_len;
>  
> -	memcpy(msg->u.resource_stat.guid, &raw->msg[idx], 16);
> +	import_guid(&msg->u.resource_stat.guid, &raw->msg[idx]);
>  	idx += 16;
>  	if (idx > raw->curlen)
>  		goto fail_len;
> @@ -2174,20 +2174,24 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
>  				      offset, size, buffer);
>  }
>  
> -static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
> +static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
>  {
>  	int ret = 0;
>  
> -	memcpy(mstb->guid, guid, 16);
> +	guid_copy(&mstb->guid, guid);
> +
> +	if (!drm_dp_validate_guid(mstb->mgr, &mstb->guid)) {
> +		u8 buf[UUID_SIZE];
> +
> +		export_guid(buf, &mstb->guid);
>  
> -	if (!drm_dp_validate_guid(mstb->mgr, mstb->guid)) {
>  		if (mstb->port_parent) {
>  			ret = drm_dp_send_dpcd_write(mstb->mgr,
>  						     mstb->port_parent,
> -						     DP_GUID, 16, mstb->guid);
> +						     DP_GUID, sizeof(buf), buf);
>  		} else {
>  			ret = drm_dp_dpcd_write(mstb->mgr->aux,
> -						DP_GUID, mstb->guid, 16);
> +						DP_GUID, buf, sizeof(buf));
>  		}
>  	}
>  
> @@ -2567,9 +2571,9 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
>  	return mstb;
>  }
>  
> -static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
> -	struct drm_dp_mst_branch *mstb,
> -	const uint8_t *guid)
> +static struct drm_dp_mst_branch *
> +get_mst_branch_device_by_guid_helper(struct drm_dp_mst_branch *mstb,
> +				     const guid_t *guid)
>  {
>  	struct drm_dp_mst_branch *found_mstb;
>  	struct drm_dp_mst_port *port;
> @@ -2577,10 +2581,9 @@ static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
>  	if (!mstb)
>  		return NULL;
>  
> -	if (memcmp(mstb->guid, guid, 16) == 0)
> +	if (guid_equal(&mstb->guid, guid))
>  		return mstb;
>  
> -
>  	list_for_each_entry(port, &mstb->ports, next) {
>  		found_mstb = get_mst_branch_device_by_guid_helper(port->mstb, guid);
>  
> @@ -2593,7 +2596,7 @@ static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
>  
>  static struct drm_dp_mst_branch *
>  drm_dp_get_mst_branch_device_by_guid(struct drm_dp_mst_topology_mgr *mgr,
> -				     const uint8_t *guid)
> +				     const guid_t *guid)
>  {
>  	struct drm_dp_mst_branch *mstb;
>  	int ret;
> @@ -2695,17 +2698,20 @@ static void drm_dp_mst_queue_probe_work(struct drm_dp_mst_topology_mgr *mgr)
>  }
>  
>  static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
> -				 u8 *guid)
> +				 guid_t *guid)
>  {
>  	u64 salt;
> +	u8 buf[UUID_SIZE];
>  
> -	if (memchr_inv(guid, 0, 16))
> +	if (!guid_is_null(guid))
>  		return true;
>  
>  	salt = get_jiffies_64();
>  
> -	memcpy(&guid[0], &salt, sizeof(u64));
> -	memcpy(&guid[8], &salt, sizeof(u64));
> +	memcpy(&buf[0], &salt, sizeof(u64));
> +	memcpy(&buf[8], &salt, sizeof(u64));
> +
> +	import_guid(guid, buf);
>  
>  	return false;
>  }
> @@ -2945,7 +2951,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
>  	drm_dbg_kms(mgr->dev, "link address reply: %d\n", reply->nports);
>  	drm_dp_dump_link_address(mgr, reply);
>  
> -	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
> +	ret = drm_dp_check_mstb_guid(mstb, &reply->guid);
>  	if (ret) {
>  		char buf[64];
>  
> @@ -3799,8 +3805,9 @@ EXPORT_SYMBOL(drm_dp_mst_topology_mgr_suspend);
>  int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
>  				   bool sync)
>  {
> +	u8 buf[UUID_SIZE];
> +	guid_t guid;
>  	int ret;
> -	u8 guid[16];
>  
>  	mutex_lock(&mgr->lock);
>  	if (!mgr->mst_primary)
> @@ -3821,13 +3828,15 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
>  	}
>  
>  	/* Some hubs forget their guids after they resume */
> -	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
> -	if (ret != 16) {
> +	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
>  		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>  		goto out_fail;
>  	}
>  
> -	ret = drm_dp_check_mstb_guid(mgr->mst_primary, guid);
> +	import_guid(&guid, buf);
> +
> +	ret = drm_dp_check_mstb_guid(mgr->mst_primary, &guid);
>  	if (ret) {
>  		drm_dbg_kms(mgr->dev, "check mstb failed - undocked during suspend?\n");
>  		goto out_fail;
> @@ -4005,12 +4014,12 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
>  	bool hotplug = false, dowork = false;
>  
>  	if (hdr->broadcast) {
> -		const u8 *guid = NULL;
> +		const guid_t *guid = NULL;
>  
>  		if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY)
> -			guid = msg->u.conn_stat.guid;
> +			guid = &msg->u.conn_stat.guid;
>  		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
> -			guid = msg->u.resource_stat.guid;
> +			guid = &msg->u.resource_stat.guid;
>  
>  		if (guid)
>  			mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 02b037d3a93f..f6a1cbb0f600 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -244,18 +244,18 @@ struct drm_dp_mst_branch {
>  	bool link_address_sent;
>  
>  	/* global unique identifier to identify branch devices */
> -	u8 guid[16];
> +	guid_t guid;
>  };
>  
>  
>  struct drm_dp_nak_reply {
> -	u8 guid[16];
> +	guid_t guid;
>  	u8 reason;
>  	u8 nak_data;
>  };
>  
>  struct drm_dp_link_address_ack_reply {
> -	u8 guid[16];
> +	guid_t guid;
>  	u8 nports;
>  	struct drm_dp_link_addr_reply_port {
>  		bool input_port;
> @@ -265,7 +265,7 @@ struct drm_dp_link_address_ack_reply {
>  		bool ddps;
>  		bool legacy_device_plug_status;
>  		u8 dpcd_revision;
> -		u8 peer_guid[16];
> +		guid_t peer_guid;
>  		u8 num_sdp_streams;
>  		u8 num_sdp_stream_sinks;
>  	} ports[16];
> @@ -348,7 +348,7 @@ struct drm_dp_allocate_payload_ack_reply {
>  };
>  
>  struct drm_dp_connection_status_notify {
> -	u8 guid[16];
> +	guid_t guid;
>  	u8 port_number;
>  	bool legacy_device_plug_status;
>  	bool displayport_device_plug_status;
> @@ -425,7 +425,7 @@ struct drm_dp_query_payload {
>  
>  struct drm_dp_resource_status_notify {
>  	u8 port_number;
> -	u8 guid[16];
> +	guid_t guid;
>  	u16 available_pbn;
>  };
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
