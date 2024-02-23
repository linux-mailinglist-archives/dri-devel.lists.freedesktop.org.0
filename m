Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AF861F17
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E6210ECBF;
	Fri, 23 Feb 2024 21:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6BVZZQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B606D10ECAD;
 Fri, 23 Feb 2024 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708723945; x=1740259945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BpOBW2OaXhGyunTLjE5iB6jsen7ycLdoTgdz/ToRIro=;
 b=D6BVZZQF/a852RRc+ncaxkYXMsj0m3UrY2RDf1mp4MUUd2ZB+LlDr7r1
 GjNOzFLz+XRacxVNrBnBwLikESBKiyGlumdyqdu3QZatFqg1XD+rm5Owa
 AOKREElagAab99qQE7+ROSu7HgOPZKVAY1WZ96jxh4oh6SOmjara/K9aW
 pVenVXbnhO7/NR+thxZdLwAyRg77tYFJKJaXLrzYL0clBKIq9X6GObtfx
 rTII3qOXzTdcjWUNvTnh3IoBDB4j3QTcTcYn4fvq0uuXdL/r4qW9Jql3i
 W8GXK4dhIj8yMKYFuMHre4SehmYOrvtXncAqjN7KQUepXxJ5w8epjV2JW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6878090"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6878090"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 13:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="827767904"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="827767904"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 23 Feb 2024 13:32:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Feb 2024 23:32:21 +0200
Date: Fri, 23 Feb 2024 23:32:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/21] drm/dp: Add support for DP tunneling
Message-ID: <ZdkO5VHKxG4Rbzjf@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220211841.448846-3-imre.deak@intel.com>
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

On Tue, Feb 20, 2024 at 11:18:22PM +0200, Imre Deak wrote:
> +static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref)
> +{
> +	drm_dp_tunnel_put(tunnel_ref->tunnel, &tunnel_ref->tracker);

Should we set tunnel_ref->tunnel=NULL here?

-- 
Ville Syrjälä
Intel
