Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BF96B820
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4BF10E743;
	Wed,  4 Sep 2024 10:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4+V7wep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E79E10E742;
 Wed,  4 Sep 2024 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725445164; x=1756981164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=N0PbBy5Ao6MuNdFdvZuksajIlLLWYbIn7QFeG11lzhw=;
 b=I4+V7wepwQaVzS38YEzC48SxV+vV/ehkShbNptwNaLE9TWmYHIuQTIzd
 exGqGnE/1EM9rLxPPLEfuEaetHdhj7NjfA5T8Ti7oZAWqMVOkZDQkjfY1
 62u/RziHcZtvR7QEiu808+8ZjN0f7ATlAH8yQqIWslnrmoFcMPXItMdg1
 nmccDo874QE9QbEiuYbbZK5xRUfQFGafwMeUzL7ilXR4y4X60uDQkxdr9
 vnSyuZWvOWqLq9s1jjaNk3mMZL9uFEwa2iJIiLjX9PW8gDQh2aOyph6IB
 JBpHjiUQq0oeT4eTdLXvFcw0l6QRvLybiPUyiYvxWGCX1SlRq5w9Un3Ff g==;
X-CSE-ConnectionGUID: u5W06+eBSXqnXDRpZYyO6g==
X-CSE-MsgGUID: 9AW/uZvITXKGct9OB/eCwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46625973"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="46625973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:19:23 -0700
X-CSE-ConnectionGUID: d8UJR7GcQOO8qqCwn9qMwg==
X-CSE-MsgGUID: EA2wnQljRe6rygHZktpMIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69622166"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:19:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Ni <nichen@iscas.ac.cn>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen Ni
 <nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/i915: convert comma to semicolon
In-Reply-To: <20240903025558.493977-1-nichen@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240903025558.493977-1-nichen@iscas.ac.cn>
Date: Wed, 04 Sep 2024 13:19:01 +0300
Message-ID: <87frqfsove.fsf@intel.com>
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

On Tue, 03 Sep 2024, Chen Ni <nichen@iscas.ac.cn> wrote:
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 19498ee455fa..00e98a5ede09 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1313,8 +1313,8 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
>  	memcpy(&write_buf[1], buffer, size);
>  
>  	msg.addr = DRM_HDCP_DDC_ADDR;
> -	msg.flags = 0,
> -	msg.len = size + 1,
> +	msg.flags = 0;
> +	msg.len = size + 1;
>  	msg.buf = write_buf;
>  
>  	ret = i2c_transfer(ddc, &msg, 1);

-- 
Jani Nikula, Intel
