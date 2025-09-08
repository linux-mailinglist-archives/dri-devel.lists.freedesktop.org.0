Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA28B48B08
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EEF10E4D3;
	Mon,  8 Sep 2025 11:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmB/tSVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D704110E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757329434; x=1788865434;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3dqcemedClx68uAGeZQS7UWOgcFnTMM2pGWwRIX9XOY=;
 b=fmB/tSVOAHE5bBQ8NhTS8UwwJGX6Xz+bW8v7EJvVGmXQEYSaiCFyAcqk
 sW67YCzL7e9oocPuguwW0Z1oLWWyAL0iPZS4kWsxXoxYNy3PB6LxMTGLu
 w8e2//Nspe+SYD/9RdBHZ7o+dkHKLxrCIvxMGjgZgAskG6eyMetTIfctD
 M84lwhfeO5qYoGAiMmBS2GpqHdxZCvQIfPThQci+HZQbwFpGBy0EBSJsw
 i3dveNHQ6c3S7hNdoXa2xsIAN7g7WwFdQ6WBZF9lNpLpd2X7HUOzQ/Ixt
 mX0rKv22AGnk/XdIbto2xTD4Wa2kq+PhkFeDj/vkj/aQ2GKjh1nV9d5Lm Q==;
X-CSE-ConnectionGUID: u0NUfZuZQjG1QTmzAELVmQ==
X-CSE-MsgGUID: fxI/pHNNQ7mMUqNb/6ycUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="70960714"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70960714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:03:54 -0700
X-CSE-ConnectionGUID: t2zGP7lPTUGzuyMfHSqnTQ==
X-CSE-MsgGUID: re4nqNyiQPG37gmTOTCDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172349127"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:03:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: syyang <syyang@lontium.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yangsunyun1993@gmail.com, syyang <syyang@lontium.com>
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
In-Reply-To: <20250903123825.1721443-3-syyang@lontium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
Date: Mon, 08 Sep 2025 14:03:45 +0300
Message-ID: <52330c2afbf6bab7c06fbdd2b5cb9b2a4e24319b@intel.com>
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

On Wed, 03 Sep 2025, syyang <syyang@lontium.com> wrote:
> +static int lt9611c_read_edid(struct lt9611c *lt9611c)
> +{
> +	struct device *dev = lt9611c->dev;
> +	int ret, i, bytes_to_copy, offset = 0;
> +	u8 packets_num;
> +	u8 read_edid_data_cmd[5] = {0x52, 0x48, 0x33, 0x3A, 0x00};
> +	u8 return_edid_data[37];
> +	u8 read_edid_byte_num_cmd[5] = {0x52, 0x48, 0x32, 0x3A, 0x00};
> +	u8 return_edid_byte_num[6];
> +
> +	ret = i2c_read_write_flow(lt9611c, read_edid_byte_num_cmd, 5, return_edid_byte_num, 6);
> +	if (ret) {
> +		dev_err(dev, "Failed to read EDID byte number\n");
> +		lt9611c->edid_valid = false;
> +		return ret;
> +	}
> +
> +	lt9611c->edid_len = (return_edid_byte_num[4] << 8) | return_edid_byte_num[5];
> +
> +	if (!lt9611c->edid_buf || lt9611c->edid_len > (lt9611c->edid_valid ?
> +				lt9611c->edid_len : 0)) {
> +		kfree(lt9611c->edid_buf);
> +		lt9611c->edid_buf = kzalloc(lt9611c->edid_len, GFP_KERNEL);
> +		if (!lt9611c->edid_buf) {
> +			dev_err(dev, "Failed to allocate EDID buffer\n");
> +			lt9611c->edid_len = 0;
> +			lt9611c->edid_valid = false;
> +			return -ENOMEM;
> +		}
> +	}

If you want to do caching, store a struct drm_edid pointer at a higher
level, not dumb buffers at the low level. Might be easier to start off
without any caching.

> +
> +	packets_num = (lt9611c->edid_len % 32) ? (lt9611c->edid_len / 32 + 1) :
> +		(lt9611c->edid_len / 32);
> +	for (i = 0; i < packets_num; i++) {
> +		read_edid_data_cmd[4] = (u8)i;
> +		ret = i2c_read_write_flow(lt9611c, read_edid_data_cmd, 5, return_edid_data, 37);
> +		if (ret) {
> +			dev_err(dev, "Failed to read EDID packet %d\n", i);
> +			lt9611c->edid_valid = false;
> +			return -EIO;
> +		}
> +		offset = i * 32;
> +		bytes_to_copy = min(32, lt9611c->edid_len - offset);
> +		memcpy(lt9611c->edid_buf + offset, &return_edid_data[5], bytes_to_copy);
> +		}

And really, you wouldn't have to implement the custom get edid block at
all, if you added a proper i2c adapter implementation and passed that to
drm_edid_read_ddc().

> +
> +	lt9611c->edid_valid = true;
> +
> +	return ret;
> +}
> +
> +static int lt9611c_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct lt9611c *lt9611c = data;
> +	struct device *dev = lt9611c->dev;
> +	unsigned int total_blocks;
> +	int ret;
> +
> +	if (len > 128)
> +		return -EINVAL;
> +
> +	guard(mutex)(&lt9611c->ocm_lock);
> +	if (block == 0 || !lt9611c->edid_valid) {
> +		ret = lt9611c_read_edid(lt9611c);
> +		if (ret) {
> +			dev_err(dev, "EDID read failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	total_blocks = lt9611c->edid_len / 128;
> +	if (!total_blocks) {
> +		dev_err(dev, "No valid EDID blocks\n");
> +		return -EIO;
> +	}
> +
> +	if (block >= total_blocks) {
> +		dev_err(dev,  "Requested block %u exceeds total blocks %u\n",
> +			block, total_blocks);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(buf, lt9611c->edid_buf + block * 128, len);

The get edid block hook is supposed to read *one* block. Can't you
implement reading one block? This now reads the entire edid for every
block.

Again, better yet, i2c adapter implementation.

> +
> +	return 0;
> +}
> +
> +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_bridge *bridge,
> +						       struct drm_connector *connector)
> +{
> +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> +
> +	usleep_range(10000, 20000);
> +	return drm_edid_read_custom(connector, lt9611c_get_edid_block, lt9611c);
> +}

-- 
Jani Nikula, Intel
