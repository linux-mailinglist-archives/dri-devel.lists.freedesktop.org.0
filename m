Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A76A594F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FFE10E410;
	Tue, 28 Feb 2023 12:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196E710E410
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677588299; x=1709124299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GAjNgTd4fR9g2LISlN8k9+jlTFOk04d0l5abxMu+Z2s=;
 b=mtrPOkePxeZUcVh1oeHGTRMl3BXxkFyqFf0NxE0Uj+w0x156//IzUvmn
 K+7YTGU63XNBi9iVktl57mYO4XLQxTX7b/pG3xzfe80ScxiZ1uhDbxImu
 oKaE+RyjgP+Ku0Ko/cX+0wImxS2QEgk8lNehhL4/d3q0Rpv+FnTq266rh
 HfqrxfwgbyFuk/2Im/u6wNknVqwvVzqf5fkIv8oRgPlk7xq62/F7zMCRS
 bw7Ma3Ex/z399TZakm++knYCqlEYKIpFlHZn8+4SnmdgLPkU18evRwf1o
 nt+QCgKrxPCDqCwiT+DiMrZ3kG3yBi/pzddcX9iLdmn58LilTolDFjsSb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334165613"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="334165613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706557550"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="706557550"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 28 Feb 2023 04:44:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 14:44:54 +0200
Date: Tue, 28 Feb 2023 14:44:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document connector margin properties
Message-ID: <Y/33RipzQtGhPJCg@intel.com>
References: <20230228123156.175973-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228123156.175973-1-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 12:32:04PM +0000, Simon Ser wrote:
> Add docs for "{left,right,top,bottom} margin" properties.
> 
> v2:
> - Mention the purpose: mitigate underscan on TVs
> - Move out of analog TV section into standard props (Pekka)
> - Mention HDMI AVI InfoFrames (Pekka, Ville)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index ffd65eddce42..a180f541736a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1446,6 +1446,20 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *	a firmware handled hotkey. Therefor userspace must not include the
>   *	privacy-screen sw-state in an atomic commit unless it wants to change
>   *	its value.
> + *
> + * left margin, right margin, top margin, bottom margin:
> + *	Add margins to the connector's viewport. This is typically used to
> + *	mitigate underscan on TVs.

"used to mitigate overscan" or "used to underscan" would make
more sense to me.

> + *
> + *	The value is the size in pixels of the black border which will be
> + *	added. The attached CRTC's content will be scaled to fill the whole
> + *	area inside the margin.

Dunno if there should be something even more explicit here
about the CRTCs viewport/canvas/<whatever you call it> size
remaining unchaned, ie. still 'hdisplay x vdisplay'?

Another very open question is how these would interact with
the 'scaling mode' property/connectors that already scale
the passed in mode to whatever fixed size the panel needs.
In my i915 patches I totally sidestepped that question by
not registering the margin properties for eDP at all.

-- 
Ville Syrjälä
Intel
