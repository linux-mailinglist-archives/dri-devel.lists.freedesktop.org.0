Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CF6042DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 13:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A84810E292;
	Wed, 19 Oct 2022 11:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DBC10E292
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666177890; x=1697713890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=86EgcgO31DFgfH/7s0qgMux/tdlaUrRFi3pvssdkWvc=;
 b=cYxXDnmxQ9a7zlgQ7YkSXmGAyGG7W+d0TNlAii69jN5fNBH+6G22UQsK
 fcPM2VGq36I9oXlsfoem149t+9pvY2A+RiLiT/VhRJwJhT72N3a1qhaee
 jsiQDd2Xt5Tm+4Z73GtIrLihXD8ZXFp4AOmXwUWsE92AegKv9ZgeLyzEW
 ewP2aCvH7eB+QUdzDGGL9mr4dyeadRpyin06US/bGWcSm69b5F4Hlq5Bi
 Pn6zWzlXnwnV3TFezqjRFp2OoDLOy+ejKTViUD3gT7IJWWIuPLpHDuUiT
 RaW9w0A+NDZqEoIq02C4CIPeut3VGhWqHu59mbtgUEwJamMaga/LEpO1i A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="303995674"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="303995674"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 04:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="958285890"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="958285890"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2022 04:08:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ol6wC-009p73-0Q; Wed, 19 Oct 2022 14:08:40 +0300
Date: Wed, 19 Oct 2022 14:08:39 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
Message-ID: <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
 <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp" <etom@igel.co.jp>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 09:32:26AM +0200, Thomas Zimmermann wrote:
> Am 18.10.22 um 17:52 schrieb Zack Rusin:

> IIRC PSB hardware is only available in 32-bit systems.

Dunno about deep details, but IIUC the Intel Tangier and Intel Annioedale
are 64-bit SoCs that have Imagination + Intel IPs, the latter from this
GMA5xx/GMA6xx family.

-- 
With Best Regards,
Andy Shevchenko


