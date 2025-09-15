Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E4B5839B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0B10E508;
	Mon, 15 Sep 2025 17:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kMzJVgK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D210E508;
 Mon, 15 Sep 2025 17:28:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 92BD743AEF;
 Mon, 15 Sep 2025 17:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA87C4CEF1;
 Mon, 15 Sep 2025 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757957298;
 bh=WBrowgOToiif9/SwrzeA8YZAkvq+V1SbWNrN6GETuZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMzJVgK7y3SLp1fQzrQIWbdZSzzhJca+3uQ+8F092ypr5PzejwQYLqWOEIl1Fg5GQ
 fQ2TIzITlcaP1ZCBbi5xRZzK6Czh8QEvjhZLe1wbXfKEg02QgaE3x3qTKsOHox2rFD
 0HCcQLblpJoNGdLvtsfgiF/ithkqjY5mSxtQRLs9FeJP5KnH7g4zLPD7jKzbinsbv4
 FfcyJyXuVUyOkZcHThzQx2qp/6RnLSNZPjiTaddSBOOntSPHUrLbLSzjF+13Bv66d1
 3fzJy1DeWqICpjFLiP3wHkPEsrvSiuQvH8NJ4icQ1djOnZ6d2C+R6EeZPrKbF6Tw4R
 OSNW0NChAg8ww==
Date: Mon, 15 Sep 2025 19:28:15 +0200
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
Subject: Re: [PATCH v2 05/11] PCI: Add pci_rebar_size_supported() helper
Message-ID: <cduh4ave3lbdgd2kutfhgf3obf3wuskgxf6rrhggsiksw7wrwa@lqly5npj5g3r>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-6-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915091358.9203-6-ilpo.jarvinen@linux.intel.com>
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

> +/**
> + * pci_rebar_size_supported - check if size is supported for BAR
> + * @pdev: PCI device
> + * @bar: BAR to check
> + * @size: size as defined in the PCIe spec (0=1MB, 31=128TB)
> + *
> + * Return: %true if @bar is resizable and @size is a supported, otherwise
> + *	   %false.
> + */
> +bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
> +{
> +	u64 sizes = pci_rebar_get_possible_sizes(pdev, bar);
> +
> +	return BIT(size) & sizes;

I would return here "!!(BIT(size) & sizes)", but it doesn't
really matter.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
