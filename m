Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B53AC908F
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EE310E83D;
	Fri, 30 May 2025 13:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAZ97CaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE9710E828;
 Fri, 30 May 2025 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748613103; x=1780149103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pX2PTHtPzqLQ5kA1NmW2FjwzP4CXJktF96ar71uadBI=;
 b=MAZ97CaFRS68genmvJ29uTy9JhdbJ5JyXroJViTtxwHoJC+3TSV37sqS
 O0hBwpLyQqeAAY35UaIjddOSpXCPkvd1kX5GUlNIMt3XBJjaBvzxxZ6ZJ
 26DuiNItOKvY3DwuI57bUI+/jGE5dGtP2D7z8uAHfS/IZhiFZ2Cw8O52T
 VPPHBEYfvZMOCMsT7lntjFHaAOf9qI4v/E4CVPL5vlN+NrKZPL2qUT6IT
 WKFsKficCyJK06oyUXJJBE05Os+xtcXIEiv7fFftnhcRQIyMKIHqmEKB/
 nxvf1qQj6R9JcppmWE+1PcxWXF4xqfJh4fKXM0BLyAi9PRtXG5/nh/28Q A==;
X-CSE-ConnectionGUID: hBiSTodnQECmfo8JGkxRyg==
X-CSE-MsgGUID: t/FrHlvoQoaSzRfclZ6oxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50402016"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50402016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:51:39 -0700
X-CSE-ConnectionGUID: ZJN+7x+rQCm/0h/vPOARow==
X-CSE-MsgGUID: P+15Gi7KSJGyJHH3fdtplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143850083"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:51:34 -0700
Date: Fri, 30 May 2025 16:51:30 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomas Winkler <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v11 04/10] mtd: intel-dg: register with mtd
Message-ID: <aDm34rQxtYhvt6fc@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-5-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-5-alexander.usyskin@intel.com>
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

On Wed, May 28, 2025 at 04:51:09PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
