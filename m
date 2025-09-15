Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D6B58384
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBF310E525;
	Mon, 15 Sep 2025 17:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nUl0N/rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023C210E51F;
 Mon, 15 Sep 2025 17:24:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42B8D601F3;
 Mon, 15 Sep 2025 17:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80165C4CEF1;
 Mon, 15 Sep 2025 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757957053;
 bh=7STYzWbQMVyC09sCCmmsDxZCpqXzbEGrpzMTDgjvMt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nUl0N/rkG1GQQYgyQ5VHxpycUsA8D0xkIG8GEI4aZk9JtnwwBIDZF1LykQJfl5Hf5
 AvyLiPWW0c+tqIdNVBrw7xeCnYJl2KDsmddVWtSNi/7dw9p9+BMvmekRupn63JvtjP
 m9Zmk7lfsrFtS5kMcV1ocJCLicp97ZrEgdearK/ZqRmNXyb+FwjB5+0rpu+2IQ034k
 lPtetQX3+awv5YeY/4LkrPIzxYn4UkG9M8EE/+0xAnCevrovPaUWbTKcXf7qv/5/gx
 8HCm22TyEZeGirF4axBMINzViIlvkEb4yxYpkaajm3SpIApk+Ect6v1RHNDB4dPHC3
 GLZyfksGi8vzA==
Date: Mon, 15 Sep 2025 19:24:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Message-ID: <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
 <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
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

Hi,

On Mon, Sep 15, 2025 at 03:42:23PM +0300, Jani Nikula wrote:
> On Mon, 15 Sep 2025, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > PCI core provides pci_rebar_size_supported() that helps in checking if
> > a BAR Size is supported for the BAR or not. Use it in
> > i915_resize_lmem_bar() to simplify code.
> >
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Acked-by: Christian König <christian.koenig@amd.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> and
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Just for some random noise on commit log's bureaucracy: why do we
need both Ack and R-b? I think R-b covers Ack making it
redundant. Right?

Andi
