Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5196BC91D1
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826A510E228;
	Thu,  9 Oct 2025 12:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JopefJMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7D10E228
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760014144; x=1791550144;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OSFdQafboDaUi8Wy4vbAAqnWvuafTu2QD+cLsjQEGus=;
 b=JopefJMYDLlXf0LPIJwLVmpAAItYKKSzxe+/9eAx5BMk5kMZRHqRjdUB
 Y7CyL4QThf23Zwj6YTI7DyS9QYPFo6gjuvHagGdkvnsQx9fnyvKiO0UvS
 s7uNBZTq+LGbdjkRZFtSgUmFl/3V3xPAeKLphvtKnHWHiefwwxRfzsnGg
 c++IidBnCoYJHmTH/+TZqm04O4QGrNldWyi+A6O2KI/L2d/nWMlZpZsMM
 st3sa7fNIFLvrUb6RWzyKWg+iyH75GI9KZ2br63Bt3bGYkW1O63Kp9x8M
 ZzwqpbfJGU6ZYaJUJJEaoy+c/kyqE3v6qSGRUCxhxMxIqO49fgEJeHyl/ A==;
X-CSE-ConnectionGUID: qc8OuPVqRKeG8dK6a7m8pg==
X-CSE-MsgGUID: ODrMn/SNSs2NYD59RUVTvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84842101"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="84842101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:49:03 -0700
X-CSE-ConnectionGUID: f0f9xGnmTki9Z4zY4Af96A==
X-CSE-MsgGUID: qSApt77rQmKInxe4CHo9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180650592"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.113])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:48:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pet Weng <pet.weng@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Pin-yen Lin
 <treapking@google.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: Add ITE IT61620 MIPI DSI to HDMI
 bridge driver
In-Reply-To: <20251009-it61620-0714-v3-2-5d682d028441@ite.com.tw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251009-it61620-0714-v3-0-5d682d028441@ite.com.tw>
 <20251009-it61620-0714-v3-2-5d682d028441@ite.com.tw>
Date: Thu, 09 Oct 2025 15:48:54 +0300
Message-ID: <088cbc524dbb05757f244a6c7f26f3228e554f61@intel.com>
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

On Thu, 09 Oct 2025, Pet Weng <pet.weng@ite.com.tw> wrote:
> +static void it61620_set_capability_from_edid_parse(struct it61620 *it61620,
> +						   const struct edid *edid)
> +{
> +	struct drm_device *drm = it61620->drm;
> +
> +	it61620->is_hdmi = drm_detect_hdmi_monitor(edid);
> +	it61620->en_audio = drm_detect_monitor_audio(edid);

Please don't add new users of drm_detect_monitor_audio() or
drm_detect_hdmi_monitor(). They're basically deprecated.

Use drm_edid_connector_update() and you can get at the same info via
connector->display_info.{is_hdmi,has_audio} members.

> +
> +	drm_dbg(drm, "%s mode, monitor %ssupport audio",
> +		it61620->is_hdmi ? "HDMI" : "DVI",
> +		it61620->en_audio ? "" : "not ");
> +}

> +static const struct drm_edid *it61620_bridge_edid_read(struct drm_bridge *bridge,
> +						       struct drm_connector *connector)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct device *dev = it61620->dev;
> +	const struct drm_edid *cached_edid;
> +
> +	cached_edid = drm_edid_read_custom(connector, it61620_get_edid_block,
> +					   it61620);
> +
> +	if (!cached_edid) {
> +		dev_dbg(dev, "failed to get edid!");
> +		return NULL;
> +	}
> +
> +	it61620_set_capability_from_edid_parse(it61620,
> +					       drm_edid_raw(cached_edid));

Please don't add new users of drm_edid_raw(). It's for transitioning
from struct edid to struct drm_edid only, and you should not add new
uses of struct edid either.

BR,
Jani.

> +	return cached_edid;
> +}

-- 
Jani Nikula, Intel
