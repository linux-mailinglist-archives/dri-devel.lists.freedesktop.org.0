Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D511CA562D
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A7E10E02C;
	Thu,  4 Dec 2025 20:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qa6PSTyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3B510E02C;
 Thu,  4 Dec 2025 20:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881711; x=1796417711;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=10O3Z9EzwrNQaT7DVLruEqVLVNeXoYDNreLNZrnC3h0=;
 b=Qa6PSTyp4JyYxiDTxx0enyPXehM9ShVoQPk9tIKWBMx4SK47FDvcNVmn
 8nTBkO1jsB5rDkvv4FvSSu+GW6cpAgP7YcfFlKaRlxSgJNX8gF82sfa0h
 X7mIec2DzwK3CRlJCQ1hvzmYWLHmRK3XruXZc3fIIVDEl+iIq4Wyx68St
 R9Q1jDehPf3lQuR30KFC6oolSm8z4gxHLgtvWOMUuBj4dI1TRTRe6ssRi
 NNGPpZJa+/aV58MLoSrcum5XcXqekvYv/XDES3uDB8MoPY0FlOQmnzJdF
 PrpWqRVZCFGsUlevIJWm0hg5Gq/IfsyDzj9KGOaS71DdIqwkkfqmtygSF w==;
X-CSE-ConnectionGUID: TImZgIwORB+qiW2+UrdYgg==
X-CSE-MsgGUID: bJWYuX0iRGCtGE2hbnRW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66950695"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66950695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:55:11 -0800
X-CSE-ConnectionGUID: DU7VIJAQRF+Q9rP0lQpJ0g==
X-CSE-MsgGUID: i13SVZnkQguv6IlnOSBL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195890988"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:55:09 -0800
Message-ID: <3b1190f22a9c22a704e2d7a43187b28a10191605.camel@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 04 Dec 2025 21:55:06 +0100
In-Reply-To: <20251204193403.930328-2-rodrigo.vivi@intel.com>
References: <20251204193403.930328-2-rodrigo.vivi@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-12-04 at 14:34 -0500, Rodrigo Vivi wrote:
> Add Matt Brost, one of the Xe driver creators, as maintainer.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7774cacab5f6..254649de9c26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,6 +12517,7 @@ F:	include/drm/intel/
> =C2=A0F:	include/uapi/drm/i915_drm.h
> =C2=A0
> =C2=A0INTEL DRM XE DRIVER (Lunar Lake and newer)
> +M:	Matthew Brost <matthew.brost@intel.com>
> =C2=A0M:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> =C2=A0M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> =C2=A0L:	intel-xe@lists.freedesktop.org

