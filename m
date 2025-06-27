Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A728AEB1DB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC01110E98D;
	Fri, 27 Jun 2025 09:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpY0DDfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C7C10E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751014816; x=1782550816;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OFGGtjh9lLAJpazPZciAUtiSAFEWyX3zAFFdP5TVjw0=;
 b=DpY0DDfqkFubl14OEB0aA1+OjkRMJAzIIT3I6XYuCtdmyqZIbyC++AIV
 FR+Gsg+vgKMePVl6H5aL0KarRa2z6zxeT0EBLPe9HT/fSzJJj/5v16G5w
 456DnZDhV0KG3eNGlV5lkPRyU13/jRlE2GW0dgdHgAjLSPJ9I+aMTWtF5
 a/cTXvyESNDwydUhZgUS0gTb2TKkJ+vJVUdLJ5bu72M+e4GnsFwBHOZmW
 Jl2gm8pukQymb3a+kpjm99U63q6HrN0mYrcntS+oezosDkdEQnjPx/M1F
 7YbyL+wIxC6IYBEeYb2lqazEE7q5D25bQtB+SiqjNKBGwsKZSjNCvN12R w==;
X-CSE-ConnectionGUID: g3zW7T5USpecAfDqvgmIqg==
X-CSE-MsgGUID: Qj98ZSMWSYqQF4UeGkqLEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40944764"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="40944764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:00:15 -0700
X-CSE-ConnectionGUID: JqUZiAKiR46VDN/gPt4Vyg==
X-CSE-MsgGUID: emlWJGyaSl2vPUpGyYcGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="183790537"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:00:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kevinpaul468@gmail.com, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] workaround for Sphinx false positive preventing index
In-Reply-To: <20250627071628.30258-1-kevinpaul468@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250627071628.30258-1-kevinpaul468@gmail.com>
Date: Fri, 27 Jun 2025 12:00:07 +0300
Message-ID: <462a34d3027f22a65c129e2305c7aa4d4fda0e43@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 27 Jun 2025, Kevin Paul Reddy Janagari <kevinpaul468@gmail.com> wrote:
> Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
> indexed in the documentation because there are structs with the same name 
> and sphinx is only indexing one of them, Added them to namespaces as a
> workaround for suppressing the warnings and indexing the functions

I think there's a Sphinx bug about this that should be referenced.

Cc: Mauro

> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst  | 2 ++
>  Documentation/gpu/drm-uapi.rst | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1..da865ba1c014 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,6 +357,7 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm_fourcc

I think using c:namespace-push and c:namespace-pop is the better
option. Otherwise c:namespace will be in effect until the end of the rst
file or next c:namespace.

I'm not quite sure what the namespace names should be, but for
referencing anything the names here are pretty bad
e.g. gpu_drm_fourcc.drm_format_info.

As a workaround this does hide the worst fallout, but it's not even
generic enough to handle structs and functions with the same name in the
same file. I'm not sure if there are such cases, but I wouldn't be
surprised if there were.

A more generic (but also invasive) alternative would be to have
kernel-doc always put structs/unions in a namespace, say "type", so
they'd never conflict with functions. The automagic referencing in
kernel-doc could produce those references. The downside is that manual
references should include type.foo, and the produced html also contains
type.foo.

BR,
Jani.


>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c :export:
>  
> @@ -473,6 +474,7 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm_modeset_lock
>  .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
>     :export:
>  
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..37a2bc461326 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -554,6 +554,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
>  .. kernel-doc:: include/drm/drm_ioctl.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
>     :export:

-- 
Jani Nikula, Intel
