Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJMDKPSfnWlrQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:56:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764C187491
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4E410E576;
	Tue, 24 Feb 2026 12:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzME5b7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67C710E576
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771937776; x=1803473776;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CcRt70biYKkDFipZyfmDV53IZKVaZ20bBmMfd8cGroY=;
 b=WzME5b7eBo0GPk3gXZZt5ToofuuRH3s76D6/F1o6O34ofduX2HyTBirX
 ves6Mv/3P3fVImeiLqpUQifylQEOOO0xVJpJryiqbGKKasTMQl/+Mmb7u
 etzpBip92HiT67+edqYmuk4FlhjX48MfHzqLbL+OHL/gO+F9G1Cmvkf/i
 BfUujOiFcyHDc4Z3U56wDauTbp/w19S9uZf5TiS+wokU/gLXqGPattEr3
 IoElgA7V7zNJY4npacPLzfcR+FifLONA57bBzqIPOTYbIHA7RDC67n3KU
 rFrZTTchGIE7/QzcpTd3hvLLKcIpvu7eRqwTr14ktvvPbtDVKV2OXAuyP w==;
X-CSE-ConnectionGUID: I8svHjz0R6WkhRuaHBrkzw==
X-CSE-MsgGUID: YyhM+6xiTFiSKQE7WkQx7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72653392"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72653392"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:56:16 -0800
X-CSE-ConnectionGUID: hoAFSC77RYiRhwwC3QAK+g==
X-CSE-MsgGUID: ONZjiCbyTne3EjtXYkL+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220413191"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:56:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, Hermes Wu
 <Hermes.Wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hermes Wu
 <Hermes.wu@ite.com.tw>
Subject: Re: [PATCH 1/3] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
 driver
In-Reply-To: <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
 <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
Date: Tue, 24 Feb 2026 14:56:06 +0200
Message-ID: <7b5286af8694712a8a65f6aad5e965418b6b3109@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+Hermes.wu.ite.com.tw@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:Hermes.Wu@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Hermes.wu@ite.com.tw,m:devnull@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,Hermes.wu.ite.com.tw,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0764C187491
X-Rspamd-Action: no action

On Mon, 23 Feb 2026, Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org> wrote:
> +static const struct drm_edid
> +		*it6162_bridge_read_edid(struct drm_bridge *bridge,
> +					 struct drm_connector *connector)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +	const struct drm_edid *edid;
> +
> +	drm_dbg(it6162->drm, "it6162_bridge_read_edid");
> +	edid = drm_edid_read_custom(connector, it6162_get_edid_block, it6162);
> +	if (!edid) {
> +		drm_err(it6162->drm, "failed to read EDID");
> +		return 0;

Just checking the EDID stuff in passing, and noticed this returns plain
0 for NULL, which is discouraged.

In any case, I'm not sure what the extra error message is worth here
anyway. Your low level it6162_infoblock_request_data() prints errors and
drm_edid_read_custom() prints (some) errors as well. Too many?

BR,
Jani.

> +	}
> +
> +	return edid;
> +}

-- 
Jani Nikula, Intel
