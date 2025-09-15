Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC4FB5836E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618010E51E;
	Mon, 15 Sep 2025 17:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VjDqza8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0E10E51C;
 Mon, 15 Sep 2025 17:22:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C414F601EF;
 Mon, 15 Sep 2025 17:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117F2C4CEF1;
 Mon, 15 Sep 2025 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757956961;
 bh=MwPTWHMVS1a2WpMTOzVZuU4xM9Y5h1sGMnVe69pXgjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjDqza8jv0gA0NJzp1Vlgkr2sR1NKkLU/5WdofDyBASVSIFQgpoEiIxs5PesEGi1y
 2o2BytLlFLV/gOAGMcy9dUVP0PSrSEA1AkV2XG3ZauUz5qTmhQZUH0mx4ONdOh3poV
 9NUAnIizt9aFOCrfNNmKAuK+JHUtFMzB5wm2Hm0B0DfGEU/Os281Q3jthCbhJw6+uH
 snOxqCkLry2LmLMNaO4fZUbKjqKmGxUn6cLMVz+T1mFZaJX9mdjiNP1Rcnafh93S+C
 8V3sFrkj+O5vvR+384HssSuJHcgUcCg6j+M2aH1DIj3kWPXR8uNWorXrWPIAD6lkdc
 mrrE1BhrJo1hA==
Date: Mon, 15 Sep 2025 19:22:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Message-ID: <e6t3dzohiyz36jfe4xjcjgm3zi4h2ln5ocxbvgv3gqt6oipb6h@p2j3o6jeqj45>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
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

Hi Ilpo,

On Mon, Sep 15, 2025 at 12:13:53PM +0300, Ilpo Järvinen wrote:
> PCI core provides pci_rebar_size_supported() that helps in checking if
> a BAR Size is supported for the BAR or not. Use it in
> i915_resize_lmem_bar() to simplify code.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
