Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D32AEB863
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85E10EA15;
	Fri, 27 Jun 2025 13:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMg6AESJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB1410EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751029419; x=1782565419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yLjtgMRMU2cpI0DE9ZxiLsKQBe07OjkZ3ktOz8r7re4=;
 b=dMg6AESJQii8wbv8r27o6HglyryjJDJRFkGWFpdxyieGtEvcwTDARIil
 tfoodzdLa7pKRiLv6x8hgzdG+reYU9+W7HXgyZtT7xMS+jmIa3FcLKuWC
 tuacqDK0b4t6GRZLYZs5qqEqNIchpwZoCpqbmT3fCBVZVa/oCYRi0H3vR
 GDiShV56XLitvpGVZy8tz0lsc4JoR8yMd4XuGAFZ+2ZRIPiV4X9mtr1ql
 KktDojTWq2FpiiHF2k6o2SimZ+YAD3Q8jKMZFd30UaYSVtr3cql6r8rdW
 KsfnaJVvCRon3boxLCmoLdDRwiBLnn5wBgCIuuaVtnsaVjobCnwtJOfgZ w==;
X-CSE-ConnectionGUID: +vzRTIH9SgSC2hSl2+LRAw==
X-CSE-MsgGUID: Oi8GhueITdOUvej3U543nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57123505"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57123505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:03:38 -0700
X-CSE-ConnectionGUID: 7qcoc1HiRV29Zltj/dwo+g==
X-CSE-MsgGUID: wVDW1LARQJOSzRebyi347w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153516197"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:03:36 -0700
Date: Fri, 27 Jun 2025 16:03:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v2 2/2] drm: Add missing struct drm_wedge_task_info
 kernel doc
Message-ID: <aF6WpMe9Ar8jmXOX@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
 <20250619140655.2468014-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619140655.2468014-2-andrealmeid@igalia.com>
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

On Thu, Jun 19, 2025 at 11:06:55AM -0300, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..aae0800ccef1 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -33,6 +33,8 @@ struct pci_controller;
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> + * @pid:	the pid of the task
> + * @comm:	the command name of the task

Redundant tabs. A whitespace is ususally good enough for docs.

Raag

>   */
>  struct drm_wedge_task_info {
>  	pid_t pid;
> -- 
> 2.49.0
> 
