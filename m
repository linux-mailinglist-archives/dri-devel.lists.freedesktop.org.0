Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5566E144
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C986110E547;
	Tue, 17 Jan 2023 14:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C634410E547
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PFUlLh98KQfIh3spS9gmqRf+MPIh1NqTR9WBTgIIHIo=;
 b=KElbSFmR2by+yPr7z3jle5wmNClJ/zBxbKCHP0JejAJE3W1hympe4R4XZEKCg3a1jX3/paZzgawpe
 1VRQ3WH0n8vZa97WzzquVokbgo9/vZXWvCIFN3vJTCuoofxmXR10T2O3qE6yIhV74YcDBSUZtwK2OY
 qqaS6lEJXj4OdORhV3NbujaGidg0lbLXUVoPwT/YwHOVcRqAz3jySVvpnU9f+rfzIE1zUCED15GF7f
 X1++X2alAR+fb+oHjoZWLDTRniWCFrlYt+EOIQ4qZU7W+OMSb75P4bgImuD4sG7YexYoc0AmStBrgE
 S9m15bvXyiReebc7tWGDhbRtLQpvFTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PFUlLh98KQfIh3spS9gmqRf+MPIh1NqTR9WBTgIIHIo=;
 b=LrU1AHCpG9beXuxia2gP2XMhQewocJXCCDL9tr0boLGRdYEzAoEm3dPWpqSpPhMpRQJ/uIjEylkhN
 w4Jl6NFDA==
X-HalOne-ID: 2049ee29-9676-11ed-934e-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 2049ee29-9676-11ed-934e-7703b0afff57;
 Tue, 17 Jan 2023 14:49:23 +0000 (UTC)
Date: Tue, 17 Jan 2023 15:49:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Message-ID: <Y8a1ciLKt9uLZDh6@ravnborg.org>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117115350.1071-1-nirmoy.das@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy

On Tue, Jan 17, 2023 at 12:53:49PM +0100, Nirmoy Das wrote:
> Add a function for ratelimitted debug print.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks for adding this.
The patch as-is is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It would have been nice to start adding kernel-doc to the
non-deprecated logging functions. But as everyone else is missing this,
it is OK that we miss it here.

A couple of nice follow-up patches would be to introduce a KMS variant
and replace the only user of DRM_DEBUG_KMS_RATELIMITED with the new
variant and remove the old one.

And maybe even update the remaining *ERROR_RATELIMITED users to a new
variant - and drop the deprecated ones.

	Sam

> ---
>  include/drm/drm_print.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..1d839f507319 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
>  		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>  })
>  
> +#define drm_dbg_ratelimited(drm, fmt, ...) \
> +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> +
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>  	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>  
> -- 
> 2.39.0
