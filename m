Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C5951DE9E
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 20:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0E10F066;
	Fri,  6 May 2022 18:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275B10F0F9;
 Fri,  6 May 2022 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651860337; x=1683396337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xI0jrG6IKrniOor1KHISDBmhbvcYUBhD5Fx58lNc2XE=;
 b=BFIxg5u3ZKtqfUEJtpaniTcHY7h5v9338fIqsPUHg3Myhxnas39NjPux
 NqmZkeTIWt7gqGqxopTJbrLHFzxUZ58tp4/EnB8Dj/m3Ee75HFUczzYc4
 sj2Vbwrd04hgpRx7xeTd80FJ5kmyjVygQM8pcnF4ouJ1/809Y4IJxncHa
 /s01nXW7SgT6KvlVkIA4pOdWbuqiUORjcxhMQ9xYLwX6kVCtMO9EOA/M0
 c0eG4aCVHsAb0jB8wCN7WdC/66yX9f2x6zY7R5KKOkgOY+VyK9O5QVmlc
 tfFRO7gXAZv/Wc/Ml80fCDdhh1rDGB3T2vvjeFka/s4v9Lwkbb9jfnJL3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="331528327"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="331528327"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 11:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="586124152"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga008.jf.intel.com with SMTP; 06 May 2022 11:05:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 May 2022 21:05:33 +0300
Date: Fri, 6 May 2022 21:05:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 17/25] drm/edid: add drm_edid helper for drm_edid_to_sad()
Message-ID: <YnVjbbMz4jvUL5B1@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
 <b3a5a99b1ec07d9b3b2bb9ccfadbf89768213fc6.1651830939.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3a5a99b1ec07d9b3b2bb9ccfadbf89768213fc6.1651830939.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 01:10:24PM +0300, Jani Nikula wrote:
> +int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
> +{
> +	struct drm_edid drm_edid = {
> +		.edid = edid,
> +		.size = edid_size(edid),
> +	};
> +
> +	return _drm_edid_to_sad(&drm_edid, sads);

No need to check for NULL edid in these wrappers?

> +}
>  EXPORT_SYMBOL(drm_edid_to_sad);
>  
>  /**
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
