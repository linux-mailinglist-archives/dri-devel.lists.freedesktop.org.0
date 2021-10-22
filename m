Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07016437E63
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D66EDA1;
	Fri, 22 Oct 2021 19:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF536EDA1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 19:13:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="292831800"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="292831800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 12:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="495799065"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 22 Oct 2021 12:12:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 22:12:57 +0300
Date: Fri, 22 Oct 2021 22:12:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
Message-ID: <YXMNOfBS5iFenmx8@intel.com>
References: <20211022144040.3418284-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211022144040.3418284-1-javierm@redhat.com>
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

On Fri, Oct 22, 2021 at 04:40:40PM +0200, Javier Martinez Canillas wrote:
> The simpledrm driver allows to use the frame buffer that was set-up by the
> firmware. This gives early video output before the platform DRM driver is
> probed and takes over.
> 
> But it would be useful to have a way to disable this take over by the real
> DRM drivers. For example, there may be bugs in the DRM drivers that could
> cause the display output to not work correctly.
> 
> For those cases, it would be good to keep the simpledrm driver instead and
> at least get a working display as set-up by the firmware.
> 
> Let's add a drm.remove_fb boolean kernel command line parameter, that when
> set to false will prevent the conflicting framebuffers to being removed.
> 
> Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
> early in their probe callback, this will cause the drivers' probe to fail.

Why is that better than just modprobe.blacklisting those drivers?

-- 
Ville Syrjälä
Intel
