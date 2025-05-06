Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F68AAC713
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5ED10E03B;
	Tue,  6 May 2025 13:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtGPYvm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A210E03B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539785; x=1778075785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vOjupuWn+TgFJHKEmQ0woUcxsvlgr8mC2LrclR5Tt0Q=;
 b=KtGPYvm6TCAgSPWnp5YtuyyQKEjmce4y4yfycT1YG4c5z2H+1+tJjO1g
 sIiXfAYenECo2UbtEaGIDwH1W8u+7qusCS2U4WUK/5vG7ngJsDrTKOsFY
 b7X1mvVs/anpReVMklzqSVDMl/CDXIhtLLqGEnH7ZjD0qBlp/uA0WlYag
 ktrDom4DNLxqlNFbMNar6Lj+tbtnRo1FJ1MX3DFlkwIuCQKlOTO1uu57/
 tdL98s6mZe6s0afF1CblbKC898R3CFAw25NEaNMolvr3rfR4KZQqdwZlo
 7Ox3NlrnF2IrBel1fgwh8IN7tNKPfeRIt8zja0iQJ5zazR1uIrfmJxPOj w==;
X-CSE-ConnectionGUID: onuXEKVeRWujV9OAyy5QAQ==
X-CSE-MsgGUID: +jLjI8qBS7ySnX8ByY3wFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48344443"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48344443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:56:24 -0700
X-CSE-ConnectionGUID: ta4+VBYNQXSY5l8FMndKJw==
X-CSE-MsgGUID: TA32Zj7UTmqVDC/LORHeoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="140749929"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.244.65])
 by orviesa005.jf.intel.com with SMTP; 06 May 2025 06:56:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 May 2025 16:56:20 +0300
Date: Tue, 6 May 2025 16:56:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <aBoVBAhk21Dkh5vV@intel.com>
References: <20250414085652.43904-1-contact@emersion.fr>
 <Z_0Nl9Z8GFoiaxTs@intel.com>
 <7fLdC-okfQ3e09zwXInhSeD2aOqmwMIfjKXkBIfKE86bP_Tw3eGwhZj578-18aMD50dM1nv9MtQP-HEIqp_yDwm68RfFng6bNrvR7UTD47k=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fLdC-okfQ3e09zwXInhSeD2aOqmwMIfjKXkBIfKE86bP_Tw3eGwhZj578-18aMD50dM1nv9MtQP-HEIqp_yDwm68RfFng6bNrvR7UTD47k=@emersion.fr>
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

On Thu, May 01, 2025 at 11:25:11AM +0000, Simon Ser wrote:
> Ah, sorry, I missed this message.
> 
> On Monday, April 14th, 2025 at 15:28, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > Should probably add a caveat that this needs to be a sync commit/flip.
> > The way the async flip was specified for atomic explicitly requires the
> > driver to ignore the plane when the fb doesn't change.
> 
> I don't believe so. Async flip should work fine with same FB.

The way you specified this means the kernel has to explicitly ignore
it because not all planes may support async flips. We can't generally
mix async and sync stuff into the same commit.

> The kernel
> will only ignore other props if they match their previous value.
> 
> > Also use dirtyfb instead if you don't want to get throttled to the
> > vrefresh rate. Tthough I think with some drivers you might get
> > throttled even with dirtyfb...
> 
> Like Simona, I'm really not a fan of mixing atomic and non-atomic. It's
> caused issues in the past, e.g. ChromeOS forcing amdgpu to reject atomic
> commits which could cause future cursor IOCTLs to fail.

-- 
Ville Syrjälä
Intel
