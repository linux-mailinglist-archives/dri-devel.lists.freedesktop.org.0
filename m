Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DB7243C0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 15:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96610E23F;
	Tue,  6 Jun 2023 13:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F16D10E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686056896; x=1717592896;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EGypTDkiiflKHYna6oC/dC9BQiC2e9SaCPgHT4ONrUQ=;
 b=Cm/NiDEQY76eIdtlKCe0o1T7HnfAj7dinXB9qJn21wkhMwiKMIxT23VO
 3x3EpsQJ1q+NHScFC+6c4ghJNKCg41eZ6VqAm5kzq/T1+uD0PmLoYilUw
 8tZlVT97E2rxs7wE5Iu5D0cxgZWeX7rjGiHkeh1PYJ2132E3x2t1Wa/a4
 XL9WKOWrJ0CdH6BSv6oIkwgigyKz0DwxXAI2c4zlImOyFPgFpjXuw+LB2
 yXzQcJIABJdr0LS9EZ8KkIPMvv/C8M988gqSE8JZHSmJYhvyfp1yGl13o
 hNdv9usDf2+rCOTmGPEXefM1Uxno6tq3BlJmyritU53ZdkQnAvaTySS2I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443041116"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443041116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821626227"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="821626227"
Received: from abobyr-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.59.4])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:07:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Siddh Raman Pant
 <code@siddh.me>
Subject: Re: [PATCH v9 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
In-Reply-To: <20230606125537.GC25774@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1686047727.git.code@siddh.me>
 <bff523677c65a4a6b1c06152b154cf5651f51d68.1686047727.git.code@siddh.me>
 <20230606125537.GC25774@pendragon.ideasonboard.com>
Date: Tue, 06 Jun 2023 16:07:47 +0300
Message-ID: <87pm68u4bg.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Hi Siddh,
>
> Thank you for the patch.
>
> On Tue, Jun 06, 2023 at 04:15:15PM +0530, Siddh Raman Pant wrote:
>> This reverts commit 1040e424353f5f4d39f6f3aa8723eb3bd6ea6446.
>> 
>> It used an incorrect way to use drm_* functions. Only drm_device ptrs
>> should be passed, but the mentioned commit passed mipi_dsi_host ptr.
>> It worked by accident due to macro magic.
>> 
>> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Siddh Raman Pant <code@siddh.me>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Any chance we could prevent this from happening by turning the macros
> into inline functions ?

Patch 2 adds static inline struct device *__drm_dev_ptr(const struct
drm_device *drm) which should tackle this.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_mipi_dsi.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
>> index 3fd6c733ff4e..a37af4edf394 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -33,7 +33,6 @@
>>  
>>  #include <drm/display/drm_dsc.h>
>>  #include <drm/drm_mipi_dsi.h>
>> -#include <drm/drm_print.h>
>>  
>>  #include <video/mipi_display.h>
>>  
>> @@ -156,18 +155,19 @@ static int mipi_dsi_device_add(struct mipi_dsi_device *dsi)
>>  static struct mipi_dsi_device *
>>  of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
>>  {
>> +	struct device *dev = host->dev;
>>  	struct mipi_dsi_device_info info = { };
>>  	int ret;
>>  	u32 reg;
>>  
>>  	if (of_alias_from_compatible(node, info.type, sizeof(info.type)) < 0) {
>> -		drm_err(host, "modalias failure on %pOF\n", node);
>> +		dev_err(dev, "modalias failure on %pOF\n", node);
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>>  	ret = of_property_read_u32(node, "reg", &reg);
>>  	if (ret) {
>> -		drm_err(host, "device node %pOF has no valid reg property: %d\n",
>> +		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
>>  			node, ret);
>>  		return ERR_PTR(-EINVAL);
>>  	}
>> @@ -202,21 +202,22 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>>  			      const struct mipi_dsi_device_info *info)
>>  {
>>  	struct mipi_dsi_device *dsi;
>> +	struct device *dev = host->dev;
>>  	int ret;
>>  
>>  	if (!info) {
>> -		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
>> +		dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>>  	if (info->channel > 3) {
>> -		drm_err(host, "invalid virtual channel: %u\n", info->channel);
>> +		dev_err(dev, "invalid virtual channel: %u\n", info->channel);
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>>  	dsi = mipi_dsi_device_alloc(host);
>>  	if (IS_ERR(dsi)) {
>> -		drm_err(host, "failed to allocate DSI device %ld\n",
>> +		dev_err(dev, "failed to allocate DSI device %ld\n",
>>  			PTR_ERR(dsi));
>>  		return dsi;
>>  	}
>> @@ -227,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>>  
>>  	ret = mipi_dsi_device_add(dsi);
>>  	if (ret) {
>> -		drm_err(host, "failed to add DSI device %d\n", ret);
>> +		dev_err(dev, "failed to add DSI device %d\n", ret);
>>  		kfree(dsi);
>>  		return ERR_PTR(ret);
>>  	}
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
