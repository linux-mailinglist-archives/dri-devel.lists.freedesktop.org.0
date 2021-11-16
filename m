Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E22452D12
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA306E95A;
	Tue, 16 Nov 2021 08:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331ED6E95A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:44:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="294467781"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="294467781"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 00:44:20 -0800
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="506339908"
Received: from mramya-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.251.219.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 00:44:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Angus Ainslie <angus@akkea.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: drm_probe_helper: add modes upto 1920x1080
In-Reply-To: <20211115160135.25451-1-angus@akkea.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211115160135.25451-1-angus@akkea.ca>
Date: Tue, 16 Nov 2021 10:44:14 +0200
Message-ID: <87czn01odd.fsf@intel.com>
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
Cc: kernel@puri.sm, David Airlie <airlied@linux.ie>,
 Angus Ainslie <angus@akkea.ca>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Cc: Ville

On Mon, 15 Nov 2021, Angus Ainslie <angus@akkea.ca> wrote:
> Lots of monitors nowdays support more than 1024x768 so if the EDID is
> unknown then add resolutions upto 1920x1080.

IIUC it's supposed to be the fallback that's pretty much guaranteed to
work. What's going to happen if we add 1920x1080 and it fails?


BR,
Jani.

>
> Signed-off-by: Angus Ainslie <angus@akkea.ca>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index e7e1ee2aa352..5ad66ae9916e 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -517,7 +517,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  
>  	if (count == 0 && (connector->status == connector_status_connected ||
>  			   connector->status == connector_status_unknown))
> -		count = drm_add_modes_noedid(connector, 1024, 768);
> +		count = drm_add_modes_noedid(connector, 1920, 1080);
>  	count += drm_helper_probe_add_cmdline_mode(connector);
>  	if (count == 0)
>  		goto prune;

-- 
Jani Nikula, Intel Open Source Graphics Center
