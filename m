Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA5687962B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4483510ED82;
	Tue, 12 Mar 2024 14:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDsxMypk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586CF10F07B;
 Tue, 12 Mar 2024 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253744; x=1741789744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c9oGuSpWxFH8zeIAp2Q94TNjGqegFD7NlLav1iwOVz8=;
 b=oDsxMypkSnd94QzSfdKmnygKootQdyfCCXNWHskYUPF+ql6Ld0pZ+Nuo
 LJtfx8hh7NLqzqTM9K1OyDX75njCtntXueSIeDZmP9r7fU4NqQWvCjmvD
 sRp7QzC1ArJOvLowDH7QKbEdNkEaj4RUgO6/qHpBOVxTiyf14pkskbegs
 0XbwkJx6aXaH4NG3wjI1H1X4FM4z33FuMuFD86C4549JJ207jOHkDDbTg
 8UhNzrmLf14vwSTLdfPK2HsJUFOltuuxMiJiYIohDOlwwYtn6GAx8433Z
 xhFdzAQe9GIOWuGox7hSecMYDBn3iuVo1jl002IUc0gJyQtXyRudwZs7/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8728948"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8728948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="34725107"
Received: from unknown (HELO intel.com) ([10.247.118.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:28:58 -0700
Date: Tue, 12 Mar 2024 15:28:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Pick correct caching mode.
Message-ID: <ZfBmpJE7xKsZMgh5@ashyti-mobl2.lan>
References: <20240312111815.18083-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312111815.18083-1-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Tue, Mar 12, 2024 at 12:18:15PM +0100, Nirmoy Das wrote:
> Caching mode is HW dependent so pick a correct one using
> intel_gt_coherent_map_type().
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10249
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

I think it's a good choice not to have the Fixes tag here either.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
