Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C60376D787
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72710E57A;
	Wed,  2 Aug 2023 19:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954BD10E578;
 Wed,  2 Aug 2023 19:13:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B020529A;
 Wed,  2 Aug 2023 21:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691003562;
 bh=CVkqiGN6D6UgmkqJhxQvXwEJAm+V2yj4Zy5N7hQh5Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLWNuwBSmT8O4GPjcjV6r2fo3i09KG+4xa5jcqvTmPP0lxfQLNPNizMo7A2EhQr7O
 ag/0JGGVvJT5DXb8Wfv8vn0bnxrkOLC3Me/FHSqN9je4M6V97qIvve0PbK4K78IXNf
 srsnWIJ68770hFveG9VAnPJe6TQWekzeCaFh5gss=
Date: Wed, 2 Aug 2023 22:13:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Message-ID: <20230802191351.GA1407@pendragon.ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 10:01:19PM +0300, Dmitry Baryshkov wrote:
> On 02/08/2023 21:55, Laurent Pinchart wrote:
> > Hi Dmitry,
> > 
> > Thank you for the patch.
> > 
> > On Sat, Jul 29, 2023 at 03:49:12AM +0300, Dmitry Baryshkov wrote:
> >> To properly define the USB-C DP altmode connectors, add the USB
> >> subconnector type.
> >>
> >> Suggested-by: Simon Ser <contact@emersion.fr>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/drm_connector.c | 1 +
> >>   include/uapi/drm/drm_mode.h     | 1 +
> >>   2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> >> index a6066e4a5e9a..9e96b038f5d0 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -1050,6 +1050,7 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
> >>   	{ DRM_MODE_SUBCONNECTOR_DisplayPort, "DP"        }, /* DP */
> >>   	{ DRM_MODE_SUBCONNECTOR_Wireless,    "Wireless"  }, /* DP */
> >>   	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
> >> +	{ DRM_MODE_SUBCONNECTOR_USB,	     "USB"       }, /* DP */
> > 
> > Should this be DRM_MODE_SUBCONNECTOR_USB_C and "USB-C", in case we get
> > another USB type later ?
> 
> Hmm, which id should I use for micro-USB then? (consider anx7808, 
> SlimPort). I thought about using DRM_MODE_SUBCONNECTOR_USB for both of 
> them. But maybe I should add another subtype for SlimPort.

I suppose it depends on whether userspace needs a way to differentiate
those. Do you have a good visibility on the userspace use cases ?

> >>   };
> >>   
> >>   DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
> >> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >> index 92d96a2b6763..0f74918b011c 100644
> >> --- a/include/uapi/drm/drm_mode.h
> >> +++ b/include/uapi/drm/drm_mode.h
> >> @@ -398,6 +398,7 @@ enum drm_mode_subconnector {
> >>   	DRM_MODE_SUBCONNECTOR_HDMIA       = 11, /*            DP */
> >>   	DRM_MODE_SUBCONNECTOR_Native      = 15, /*            DP */
> >>   	DRM_MODE_SUBCONNECTOR_Wireless    = 18, /*            DP */
> >> +	DRM_MODE_SUBCONNECTOR_USB         = 20, /*            DP */
> >>   };
> >>   
> >>   #define DRM_MODE_CONNECTOR_Unknown	0

-- 
Regards,

Laurent Pinchart
