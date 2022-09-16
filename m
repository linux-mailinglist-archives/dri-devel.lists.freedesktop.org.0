Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09B5BA808
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCC110E3BC;
	Fri, 16 Sep 2022 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384A10E3BC;
 Fri, 16 Sep 2022 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663316386; x=1694852386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZHLMkVJH+wTrzkraMPO+ButVUOz0gjhUQzq5UUv9Wgw=;
 b=Y+7A4/J9QaiRiz93HHjgA6qqCBoWC1cpJ1vfxpa0aUWz+xkc1q3yDgN7
 NepKZeIC2abatFzSmtZm1Qf3ncxIg7e7OG8LlJSyTucavpvSji/gTFNvf
 EVkk5YmDyUtIHxZtLxqQivKow9nVjqUEbMz7bfkISkJHjRxZs+9XWiOnV
 CO9ShiqmPHo3kkNQuo1gohp+W30EZxMIs5rzqs6NvHV+4R+bwYbgDAFGt
 aKdAO0RCXlNie7c4oVJVrXDxo47+HIrJh4U78Y3gpecanz4lXn8PQxV6Y
 B9Jo/gdesPQeAazfvOX+1wDl8RhorrLbVfcxE+Ck8Ds0k7lqwvvlcRi2c g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="281970287"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="281970287"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:19:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650797679"
Received: from sischoen-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.208.222])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:19:44 -0700
Date: Fri, 16 Sep 2022 10:19:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/4] drm/i915: Handle all GTs on driver
 (un)load paths
Message-ID: <YyQxi624oZ99TMRw@alfio.lan>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
 <20220915232654.3283095-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915232654.3283095-5-matthew.d.roper@intel.com>
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

Hi Matt,

On Thu, Sep 15, 2022 at 04:26:54PM -0700, Matt Roper wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> This, along with the changes already landed in commit 1c66a12ab431
> ("drm/i915: Handle each GT on init/release and suspend/resume") makes
> engines from all GTs actually known to the driver.
> 
> To accomplish this we need to sprinkle a lot of for_each_gt calls around
> but is otherwise pretty un-eventuful.
> 
> v2:
>  - Consolidate adjacent GT loops in a couple places.  (Daniele)
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
