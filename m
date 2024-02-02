Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A3846E9B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160C10EE5A;
	Fri,  2 Feb 2024 11:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7sqhytb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB6C10F010
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706871899; x=1738407899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=q7IX5Ck7p9ObclPnEIIJjPrssh+zna2B8YOn9nxa6vk=;
 b=i7sqhytb0tVRUwQ48QDH2veY4jkL57GZxTvtpr/A0/RVIvX+WrcAz0WG
 2FhulqkGn84J1BIL238wAeAK7NysYyQvNMa98aH8jOCQLHo1l6xWM0mh5
 IHpMQG/K9xzaDSRK6Gx7+6UD+Zo7mxTQpRHnMaRTOuQKXNod+4lK0Exjk
 t76BP11X56TG/jJIAufPVPj2eUJGPrX84tX1djZw6+lVdYH7TP5ZueTVp
 1gaEzVuG3e9VxAPPdsFq+zHeSvyD1b62WZGa9lKd1aX4e6ZutWXFR48R2
 +oNlDiWpT0qRy9svPB/ZVNnDe4qbSz5t313CarxByPJD85RB7oCo0fT8U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435276042"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="435276042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908542172"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="908542172"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:04:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org, Hans
 Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, Chen-Yu
 Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
In-Reply-To: <20240115143308.GA159345@toolbox>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox>
Date: Fri, 02 Feb 2024 13:04:50 +0200
Message-ID: <874jerf7ot.fsf@intel.com>
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

On Mon, 15 Jan 2024, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
>> The i915 driver has a property to force the RGB range of an HDMI output.
>> The vc4 driver then implemented the same property with the same
>> semantics. KWin has support for it, and a PR for mutter is also there to
>> support it.
>> 
>> Both drivers implementing the same property with the same semantics,
>> plus the userspace having support for it, is proof enough that it's
>> pretty much a de-facto standard now and we can provide helpers for it.
>> 
>> Let's plumb it into the newly created HDMI connector.
>> 
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>

[snip]

>> @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>>  /**
>>   * DOC: HDMI connector properties
>>   *
>> + * Broadcast RGB
>> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
>> + *      Infoframes will be generated according to that value.
>> + *
>> + *      The value of this property can be one of the following:
>> + *
>> + *      Automatic:
>> + *              RGB Range is selected automatically based on the mode
>> + *              according to the HDMI specifications.
>> + *
>> + *      Full:
>> + *              Full RGB Range is forced.
>> + *
>> + *      Limited 16:235:
>> + *              Limited RGB Range is forced. Unlike the name suggests,
>> + *              this works for any number of bits-per-component.
>> + *
>> + *      Drivers can set up this property by calling
>> + *      drm_connector_attach_broadcast_rgb_property().
>> + *
>
> This is a good time to document this in more detail. There might be two
> different things being affected:
>
> 1. The signalling (InfoFrame/SDP/...)
> 2. The color pipeline processing
>
> All values of Broadcast RGB always affect the color pipeline processing
> such that a full-range input to the CRTC is converted to either full- or
> limited-range, depending on what the monitor is supposed to accept.
>
> When automatic is selected, does that mean that there is no signalling,
> or that the signalling matches what the monitor is supposed to accept
> according to the spec? Also, is this really HDMI specific?

Automatic is based on the mode as described in the specs
below. Basically certain modes are expected to be broadcast range, and
others full range.

I don't remember why we don't use the full range if the display
indicates it supports selectable quantization range in Video
Capabilities Data Block. It's quite possible there are displays that
declare support but don't. Cc: Ville.

- HDMI 1.4b section 6.6 Video Quantization Ranges

- HDMI 2.1 section 7.3 Video Quantization Ranges

- DP 2.1 (and earlier) section 5.1.1.1 Video Colorimetry

- CTA-861-H (and earlier) section 5.1 Default Encoding Parameters and
  section 6.4.3 Quantization Range

> When full or limited is selected and the monitor doesn't support the
> signalling, what happens?

1) Limited selected, display expects full, colors seem washed out.

2) Full selected, display expects limited, black screen possible.

We receive the occasional bug report for 1, because there are displays
that incorrectly expect full when spec says it should be limited. We
reject the bug reports, because erring the other way can lead to black
screens.


BR,
Jani.



-- 
Jani Nikula, Intel
