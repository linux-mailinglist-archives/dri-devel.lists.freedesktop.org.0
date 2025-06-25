Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372CAE7AD7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013CC10E6B3;
	Wed, 25 Jun 2025 08:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGnOhf+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAE10E6B2;
 Wed, 25 Jun 2025 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750841450; x=1782377450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4A2VSTm3feOgZjxgjKFxXi03FSDEinNe7aqgbD/47tQ=;
 b=QGnOhf+LyzNv6scsOs6eafivEZEqF1rv8EMHGzh14okuhCGAcFO6awDW
 j5StYGXFKNCbt1tZT5XD0KUryl3NXBTDtrgbCxCSOM9FZyFgwRRR+LxyB
 wHxhkkGP2VeyYNqlQUvvpP83hz+uUig42Vh8sGgPHiIORpYpA9J8oo3wC
 L96zVUDQ9NBCWjCYl63yY1iw2kTxqXiBR0JlwqdbyuPTAQxns9bx/YWt9
 B0KE3GSn9kZYoyYwTDVCAu03Kk4Y/1tMdEavCb2JjzWHWmU5UhSMmClfa
 3hSKDWjaQRnQtB6yttm2VlWaT7j2VYZDBVZjjN5uMvLyBXyCgX99zVAYQ g==;
X-CSE-ConnectionGUID: Et24SWArT9K6GLA/JKfs9w==
X-CSE-MsgGUID: fmbdgyCqQ/2W1KGXPu4lyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55728884"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="55728884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 01:50:50 -0700
X-CSE-ConnectionGUID: ujPilYwwTlmqvZNqZ4zREA==
X-CSE-MsgGUID: YYs/odi8R5ezT8EfE5NFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="157659107"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.245.155])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 01:50:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 4C4CA11F742;
 Wed, 25 Jun 2025 11:50:46 +0300 (EEST)
Date: Wed, 25 Jun 2025 08:50:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/nouveau/disp: Use dev->dev to get the device
Message-ID: <aFu4ZsbcRVfqZ3fv@kekkonen.localdomain>
References: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
 <db30702c-bda8-49a8-890b-e457dcb66848@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db30702c-bda8-49a8-890b-e457dcb66848@kernel.org>
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

Hi Danilo,

On Wed, Jun 25, 2025 at 10:20:07AM +0200, Danilo Krummrich wrote:
> On 4/9/25 12:33 PM, Sakari Ailus wrote:
> > The local variable dev points to drm->dev already, use dev directly.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi folks,
> > 
> > The background is that I'll be using a Coccinelle spatch soon to remove
> > (most) pm_runtime_mark_last_busy() calls. That won't work if the arguments
> > aren't the same.
> 
> If you want to submit / merge it together with your rework:
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> If I should pick it up, please let me know.

Either is definitely possible. However I'd prefer you to take this in order
to avoid potential conflicts with merging larger patches later on.

Thanks.

-- 
Kind regards,

Sakari Ailus
