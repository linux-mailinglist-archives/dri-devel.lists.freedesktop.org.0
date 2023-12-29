Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318581FF38
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 12:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374F810E0C1;
	Fri, 29 Dec 2023 11:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3310E0C1;
 Fri, 29 Dec 2023 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703850168; x=1735386168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dAS9P/54UQNO0nMPbKSc45N56/5YdBhRyYmLD1EKfjc=;
 b=VvIHr2UQ4GGltA6vD0VzaXVa4oXwYwXhtz/RZauwgddCFeZauWRhgunK
 S9eReGVIAktKJY7XjmTb32kwZGJ7Zy26urx25FEHiT1o3kgxgLN1OoGNP
 3fks+9/QTE5PBqI0UoAKwDUsCOGM3wqf3KUQE9ojxYQPh47494PhkdCg8
 gS/VevVYIkxRNej4/eTY3FeV9BXOJjd6R7eQZRQpYKD5kG80eEawzauns
 FJ8xlYNi6GIinU44rJPBqgk8pBfgRDqKV+dPytrdvZT/Bv8DYSMcUQvBf
 UAhgaHUjQUq9C7Jd5IAbWznEV6ckSQiZk5Et5cY6lULddt4fesPt4VdZ8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="387077529"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="387077529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 03:42:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="13266452"
Received: from dmansoco-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.87])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 03:42:36 -0800
Date: Fri, 29 Dec 2023 12:42:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2.1 2/4] drm/i915/gt: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZY6wo9U-PdmC7QWw@ashyti-mobl2.lan>
References: <20231228234946.12405-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228234946.12405-1-rdunlap@infradead.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Thu, Dec 28, 2023 at 03:49:46PM -0800, Randy Dunlap wrote:
> Document nested struct members with full names as described in
> Documentation/doc-guide/kernel-doc.rst.
> 
> intel_gsc.h:34: warning: Excess struct member 'gem_obj' description in 'intel_gsc'
> 
> Also add missing field member descriptions.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed and applied.

Thanks,
Andi
