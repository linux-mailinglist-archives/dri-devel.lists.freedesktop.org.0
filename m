Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16784B3DE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796F6112AE3;
	Tue,  6 Feb 2024 11:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qjc9efYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB627112AE2;
 Tue,  6 Feb 2024 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707219985; x=1738755985;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=g1yd67TDqY5Jh0DtJ2vM94qZdQRy9Ffyfjqi/oL+iD4=;
 b=Qjc9efYMAmBQzDSJiFEWpK3uj98dX6yyoiBQ56bHRciNM2Cz/QSJP/Hf
 PxXni1U7qQoSrnJvCLBcuZR4idkMqkNcEv5Lv2l31sMT3908hjpivc35T
 VSBCPfYrCCxPc9+TSRMLCxWAHquJD4NN//1sNOLPH8iI892WhMkZgkt31
 Ti93ZsKm8hmX+e3zIkwjWxKEzRGVzmfNpp5VaGrDQb2LiRZn6r7V2JTKn
 g/VYi+4drAnePxGU96loorSjJYpYO7ZHVLz1zOUqAtdn29XbYuo/jZUWe
 RjJcntULEn57xtkzuq9U7rfXrdoJQAUo3prwfDf4C2LM6KDAH1+ajEb63 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="625017"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="625017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="993166"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.150])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:46:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20240206122822.12a2df89@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240206122822.12a2df89@canb.auug.org.au>
Date: Tue, 06 Feb 2024 13:46:16 +0200
Message-ID: <87plx9dddj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 06 Feb 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
>
> Caused by commit
>
>   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>
> interacting with commit
>
>   dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>
> (and maybe others) from Linus' tree (v6.8-rc1).
>
> I have applied the following merge fix patch for today.  This makes it bu=
ild,
> but more is likely needed ...
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Feb 2024 12:21:07 +1100
> Subject: [PATCH] fix up for "drm/ttm: replace busy placement with flags v=
6"
>
> interacting with commit
>
>   dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 11 -----------
>  1 file changed, 11 deletions(-)

Please see the new MAINTAINERS entry for drm/xe changes:

INTEL DRM XE DRIVER (Lunar Lake and newer)
M:	Lucas De Marchi <lucas.demarchi@intel.com>
M:	Oded Gabbay <ogabbay@kernel.org>
M:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
L:	intel-xe@lists.freedesktop.org

BR,
Jani.


--=20
Jani Nikula, Intel
