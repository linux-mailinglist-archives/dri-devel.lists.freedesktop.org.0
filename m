Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62E174282
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 23:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D8E6F525;
	Fri, 28 Feb 2020 22:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232446F516
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582930325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTlJa6WwUdbQaYOsXdF1dFcG7jtU78AjCyJA0MfayNM=;
 b=exEkKJ+QUbtPftaqKGE1tX+fTUeYguKTv+83/2DbMsQTcphAihqzjgr4vH8+jA4zVOCMCw
 D4a4CnQdASndID0au2vvTHRcwRnq294W0Kps918VyaSVAALiPI3wT2ua2jo0n7nXEY8PnX
 fp+JKSpwggSMnQTV0zf1GR85+qh8EOc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-HQ3EJIfIM52m28hhqot87A-1; Fri, 28 Feb 2020 17:52:01 -0500
X-MC-Unique: HQ3EJIfIM52m28hhqot87A-1
Received: by mail-qk1-f200.google.com with SMTP id j18so4240797qke.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 14:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TTlJa6WwUdbQaYOsXdF1dFcG7jtU78AjCyJA0MfayNM=;
 b=tfiYpzepoWuu1lvTMABl+apUYXFs4ZDCzG77AQSdqgWEXoWdyTJ31kiblSWk2RTAwm
 KUtOYfpkMUWZHArrmqBqlEAH2DzpBysYKfa20Kl2RvOlUTLf0pf/0h5dX12Bj3OpYnPT
 0bCUHx28XqBgE7w/EjI1QCTis5+Hw0sKyuvmNpbGuxFXYEeHnGSl0W2Ym4kf+NuQsUgH
 M1le0TIAlTJPet2mFNl+cz0McDyKzlMckauF4nxzGgjlbGv5yJ9Iy3onftIdgkVs4/59
 34MRHdTm76bxSXAbuWjBbcLJx+jcLACapWxhR5AFZhtu9lcaVKpreLL43Xw85kUNLRWi
 qARg==
X-Gm-Message-State: APjAAAWBUgtGGElITLRbB0ZkX/tM0/OvwElB2LUbiPfTpXCRckCahVF0
 rKR9Y+1r/sDkg+gkF++eLKeEIpWMCx76sJgJk6pdCBFotmZ7PRXq6i48xVx9ENQ4aNqrA6EvMgL
 6eizvS8+ntpI+Ti07Vrge+LLxYLTP
X-Received: by 2002:a37:4dc4:: with SMTP id a187mr6780964qkb.436.1582930320791; 
 Fri, 28 Feb 2020 14:52:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUJSe/Cw6R+KPC9TqqbYULEK1brH5CSgs9Xyp7td2tfWLkG0LdF7YHpDUx4va0v7JpEQmK6Q==
X-Received: by 2002:a37:4dc4:: with SMTP id a187mr6780946qkb.436.1582930320425; 
 Fri, 28 Feb 2020 14:52:00 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x131sm5801799qka.1.2020.02.28.14.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 14:51:59 -0800 (PST)
Message-ID: <a0d19512b96d7300062dfcad3d9846b38a08f751.camel@redhat.com>
Subject: Re: [PATCH v4 13/14] drm/mst: Add support for
 QUERY_STREAM_ENCRYPTION_STATUS MST sideband message
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Date: Fri, 28 Feb 2020 17:51:58 -0500
In-Reply-To: <20200218220242.107265-14-sean@poorly.run>
References: <20200218220242.107265-1-sean@poorly.run>
 <20200218220242.107265-14-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey - I've got a good bit of stuff on my plate right now since I just got back
from PTO and am going through my backlog of stuff, but I'll try to get this
reviewed first chance I get

On Tue, 2020-02-18 at 17:02 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Used to query whether an MST stream is encrypted or not.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v4:
> -Added to the set
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 117 ++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h           |   3 +
>  include/drm/drm_dp_mst_helper.h       |  44 ++++++++++
>  3 files changed, 164 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index a811247cecfef..30b6dc6ce54c2 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -25,6 +25,7 @@
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
>  
> @@ -418,6 +419,22 @@ drm_dp_encode_sideband_req(const struct
> drm_dp_sideband_msg_req_body *req,
>  		memcpy(&buf[idx], req->u.i2c_write.bytes, req-
> >u.i2c_write.num_bytes);
>  		idx += req->u.i2c_write.num_bytes;
>  		break;
> +	case DP_QUERY_STREAM_ENC_STATUS: {
> +		const struct drm_dp_query_stream_enc_status *msg;
> +
> +		msg = &req->u.enc_status;
> +		buf[idx] = msg->stream_id;
> +		idx++;
> +		memcpy(&buf[idx], msg->client_id, sizeof(msg->client_id));
> +		idx += sizeof(msg->client_id);
> +		buf[idx] = 0;
> +		buf[idx] |= msg->stream_event & GENMASK(1, 0);
> +		buf[idx] |= msg->valid_stream_event ? BIT(2) : 0;
> +		buf[idx] |= (msg->stream_behavior & GENMASK(1, 0)) << 3;
> +		buf[idx] |= msg->valid_stream_behavior ? BIT(5) : 0;
> +		idx++;
> +		}
> +		break;
>  	}
>  	raw->cur_len = idx;
>  }
> @@ -926,6 +943,34 @@ static bool
> drm_dp_sideband_parse_power_updown_phy_ack(struct drm_dp_sideband_ms
>  	return true;
>  }
>  
> +static bool
> +drm_dp_sideband_parse_query_stream_enc_status(
> +				struct drm_dp_sideband_msg_rx *raw,
> +				struct drm_dp_sideband_msg_reply_body *repmsg)
> +{
> +	struct drm_dp_query_stream_enc_status_ack_reply *reply;
> +
> +	reply = &repmsg->u.enc_status;
> +
> +	reply->stream_id = raw->msg[3];
> +
> +	reply->reply_signed = raw->msg[2] & BIT(0);
> +
> +	reply->hdcp_1x_device_present = raw->msg[2] & BIT(3);
> +	reply->hdcp_2x_device_present = raw->msg[2] & BIT(4);
> +
> +	reply->query_capable_device_present = raw->msg[2] & BIT(5);
> +	reply->legacy_device_present = raw->msg[2] & BIT(6);
> +	reply->unauthorizable_device_present = raw->msg[2] & BIT(7);
> +
> +	reply->auth_completed = !!(raw->msg[1] & BIT(3));
> +	reply->encryption_enabled = !!(raw->msg[1] & BIT(4));
> +	reply->repeater_present = !!(raw->msg[1] & BIT(5));
> +	reply->state = (raw->msg[1] & GENMASK(7, 6)) >> 6;
> +
> +	return true;
> +}
> +
>  static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
>  					struct drm_dp_sideband_msg_reply_body
> *msg)
>  {
> @@ -960,6 +1005,8 @@ static bool drm_dp_sideband_parse_reply(struct
> drm_dp_sideband_msg_rx *raw,
>  		return drm_dp_sideband_parse_power_updown_phy_ack(raw, msg);
>  	case DP_CLEAR_PAYLOAD_ID_TABLE:
>  		return true; /* since there's nothing to parse */
> +	case DP_QUERY_STREAM_ENC_STATUS:
> +		return drm_dp_sideband_parse_query_stream_enc_status(raw,
> msg);
>  	default:
>  		DRM_ERROR("Got unknown reply 0x%02x (%s)\n", msg->req_type,
>  			  drm_dp_mst_req_type_str(msg->req_type));
> @@ -1113,6 +1160,25 @@ static int build_power_updown_phy(struct
> drm_dp_sideband_msg_tx *msg,
>  	return 0;
>  }
>  
> +static int
> +build_query_stream_enc_status(struct drm_dp_sideband_msg_tx *msg, u8
> stream_id,
> +			      u8 *q_id)
> +{
> +	struct drm_dp_sideband_msg_req_body req;
> +
> +	req.req_type = DP_QUERY_STREAM_ENC_STATUS;
> +	req.u.enc_status.stream_id = stream_id;
> +	memcpy(req.u.enc_status.client_id, q_id,
> +	       sizeof(req.u.enc_status.client_id));
> +	req.u.enc_status.stream_event = 0;
> +	req.u.enc_status.valid_stream_event = false;
> +	req.u.enc_status.stream_behavior = 0;
> +	req.u.enc_status.valid_stream_behavior = false;
> +
> +	drm_dp_encode_sideband_req(&req, msg);
> +	return 0;
> +}
> +
>  static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr
> *mgr,
>  					struct drm_dp_vcpi *vcpi)
>  {
> @@ -3154,6 +3220,57 @@ int drm_dp_send_power_updown_phy(struct
> drm_dp_mst_topology_mgr *mgr,
>  }
>  EXPORT_SYMBOL(drm_dp_send_power_updown_phy);
>  
> +int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr
> *mgr,
> +		struct drm_dp_mst_port *port,
> +		struct drm_dp_query_stream_enc_status_ack_reply *status)
> +{
> +	struct drm_dp_sideband_msg_tx *txmsg;
> +	u8 nonce[7];
> +	int len, ret;
> +
> +	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> +	if (!txmsg)
> +		return -ENOMEM;
> +
> +	port = drm_dp_mst_topology_get_port_validated(mgr, port);
> +	if (!port) {
> +		ret = -EINVAL;
> +		goto out_get_port;
> +	}
> +
> +	get_random_bytes(nonce, sizeof(nonce));
> +
> +	/*
> +	 * "Source device targets the QUERY_STREAM_ENCRYPTION_STATUS message
> +	 *  transaction at the MST Branch device directly connected to the
> +	 *  Source"
> +	 */
> +	txmsg->dst = mgr->mst_primary;
> +
> +	len = build_query_stream_enc_status(txmsg, port->vcpi.vcpi, nonce);
> +
> +	drm_dp_queue_down_tx(mgr, txmsg);
> +
> +	ret = drm_dp_mst_wait_tx_reply(mgr->mst_primary, txmsg);
> +	if (ret < 0) {
> +		goto out;
> +	} else if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
> +		DRM_DEBUG_KMS("query encryption status nak received\n");
> +		ret = -ENXIO;
> +		goto out;
> +	}
> +
> +	ret = 0;
> +	memcpy(status, &txmsg->reply.u.enc_status, sizeof(*status));
> +
> +out:
> +	drm_dp_mst_topology_put_port(port);
> +out_get_port:
> +	kfree(txmsg);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
> +
>  static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
>  				       int id,
>  				       struct drm_dp_payload *payload)
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index b8f6bac6341c1..11b2c49e4f0f4 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1099,6 +1099,9 @@
>  #define DP_POWER_DOWN_PHY		0x25
>  #define DP_SINK_EVENT_NOTIFY		0x30
>  #define DP_QUERY_STREAM_ENC_STATUS	0x38
> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_NO_EXIST	0
> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_INACTIVE	1
> +#define  DP_QUERY_STREAM_ENC_STATUS_STATE_ACTIVE	2
>  
>  /* DP 1.2 MST sideband reply types */
>  #define DP_SIDEBAND_REPLY_ACK		0x00
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index 5483f888712ad..baf3405df44d8 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -305,6 +305,34 @@ struct drm_dp_remote_i2c_write_ack_reply {
>  	u8 port_number;
>  };
>  
> +struct drm_dp_query_stream_enc_status_ack_reply {
> +	/* Bit[23:16]- Stream Id */
> +	u8 stream_id;
> +
> +	/* Bit[15]- Signed */
> +	bool reply_signed;
> +
> +	/* Bit[10:8]- Stream Output Sink Type */
> +	bool unauthorizable_device_present;
> +	bool legacy_device_present;
> +	bool query_capable_device_present;
> +
> +	/* Bit[12:11]- Stream Output CP Type */
> +	bool hdcp_1x_device_present;
> +	bool hdcp_2x_device_present;
> +
> +	/* Bit[4]- Stream Authentication */
> +	bool auth_completed;
> +
> +	/* Bit[3]- Stream Encryption */
> +	bool encryption_enabled;
> +
> +	/* Bit[2]- Stream Repeater Function Present */
> +	bool repeater_present;
> +
> +	/* Bit[1:0]- Stream State */
> +	u8 state;
> +};
>  
>  struct drm_dp_sideband_msg_rx {
>  	u8 chunk[48];
> @@ -378,6 +406,15 @@ struct drm_dp_remote_i2c_write {
>  	u8 *bytes;
>  };
>  
> +struct drm_dp_query_stream_enc_status {
> +	u8 stream_id;
> +	u8 client_id[7];	/* 56-bit nonce */
> +	u8 stream_event;
> +	bool valid_stream_event;
> +	u8 stream_behavior;
> +	u8 valid_stream_behavior;
> +};
> +
>  /* this covers ENUM_RESOURCES, POWER_DOWN_PHY, POWER_UP_PHY */
>  struct drm_dp_port_number_req {
>  	u8 port_number;
> @@ -426,6 +463,8 @@ struct drm_dp_sideband_msg_req_body {
>  
>  		struct drm_dp_remote_i2c_read i2c_read;
>  		struct drm_dp_remote_i2c_write i2c_write;
> +
> +		struct drm_dp_query_stream_enc_status enc_status;
>  	} u;
>  };
>  
> @@ -448,6 +487,8 @@ struct drm_dp_sideband_msg_reply_body {
>  		struct drm_dp_remote_i2c_read_ack_reply remote_i2c_read_ack;
>  		struct drm_dp_remote_i2c_read_nak_reply remote_i2c_read_nack;
>  		struct drm_dp_remote_i2c_write_ack_reply remote_i2c_write_ack;
> +
> +		struct drm_dp_query_stream_enc_status_ack_reply enc_status;
>  	} u;
>  };
>  
> @@ -804,6 +845,9 @@ drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state
> *state,
>  				 struct drm_dp_mst_port *port);
>  int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port, bool power_up);
> +int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr
> *mgr,
> +		struct drm_dp_mst_port *port,
> +		struct drm_dp_query_stream_enc_status_ack_reply *status);
>  int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
>  
>  void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
