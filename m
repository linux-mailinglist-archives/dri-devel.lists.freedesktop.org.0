Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B782C2449B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0A910E2BE;
	Fri, 31 Oct 2025 09:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NHoBYsy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C76B10E2BE;
 Fri, 31 Oct 2025 09:55:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 473BF436F9;
 Fri, 31 Oct 2025 09:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC02C4CEE7;
 Fri, 31 Oct 2025 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761904552;
 bh=aUIeKonLEN2Jjqki6gKSV3nqFqO7nZFmZ5zWHzPsnSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NHoBYsy4PtDW3TjuHTjZCx+keyV3OWMVc6hygxn/uM9NmcwywVfer0jPNr3BC3Yrw
 9USgu/zGdDOIsj9jpzgRJcLp3rJ5wi+waj5HwUSBF/zZbS2yikwBzYDmluxWQT0GRj
 IdaDXoQkLT9nD9lduabgz9jInhWylMYPN5EjABWprlGauAbM9qZZkeseEdbAjYoHPB
 EzpN/MHR3Ga6ssB8f7crMkUAQCSJvWSAai0oZEkbHjj7U+W2o51hcgh55zom/W3Mcp
 3JN8HfNdHZTQ+BlEzfgiLzzVrtaoFYEelAuPQ7XHuWobeU6O1k0/bpOc/SXDhpBzLT
 4Q8zyH972bAoQ==
Date: Fri, 31 Oct 2025 10:55:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v3 0/3] drm/i915: Avoid lock inversion when pinning to GGTT
Message-ID: <4qvakezswpevfjzpm3koj2m7l3pxxcfuzngz5j32dzl2w4eokm@5ozk7jbybgpe>
References: <20251023082925.351307-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023082925.351307-5-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

> Janusz Krzysztofik (3):
>   drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
>   drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
>   drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

merged to drm-intel-gt-next.

Thanks,
Andi
