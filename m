Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425F420828
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 11:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF0C6E195;
	Mon,  4 Oct 2021 09:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153076E195
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 09:22:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="222804506"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="222804506"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 02:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="482852136"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Oct 2021 02:22:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 12:22:17 +0300
Date: Mon, 4 Oct 2021 12:22:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: refer to CTA-861-G in the "content type"
 prop docs
Message-ID: <YVrHyUJPQg731vub@intel.com>
References: <20211004091236.82010-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004091236.82010-1-contact@emersion.fr>
X-Patchwork-Hint: comment
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

On Mon, Oct 04, 2021 at 09:12:50AM +0000, Simon Ser wrote:
> The KMS documentation doesn't say much about the meaning of each
> content type. Add a reference to the specification defining them.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 3bc782b630b9..79d8163686cd 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1397,6 +1397,8 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>   *	Game:
>   *		Content type is game
>   *
> + *	The meaning of each content type is defined in CTA-861-G table 15.
> + *

A bit annoying to have to refer to an external spec, but copy pasting
the whole thing here seems a bit questionable.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>   *	Drivers can set up this property by calling
>   *	drm_connector_attach_content_type_property(). Decoding to
>   *	infoframe values is done through drm_hdmi_avi_infoframe_content_type().
> -- 
> 2.33.0
> 

-- 
Ville Syrjälä
Intel
