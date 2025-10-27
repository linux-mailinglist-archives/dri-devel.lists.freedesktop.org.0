Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29799C0F563
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884210E533;
	Mon, 27 Oct 2025 16:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A4at+TJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108810E532;
 Mon, 27 Oct 2025 16:35:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FCD94304A;
 Mon, 27 Oct 2025 16:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BDEC4CEF1;
 Mon, 27 Oct 2025 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761582932;
 bh=Ge/UIR4pXnqyaYzH8mhWZUGnbK+gjSwNEDChUacWybo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A4at+TJNb3FRZo3bvlFzOVkTYKB6d7o97y9mafF9Cvn0TZeWPkvZ4sTdMsN9Lcrdy
 XeoXPjBJ6hDa+sRSgFWPLJb/q/R5BhqFlyehXBChWuhW4otvyh3Shs0LL/d+EUWgiu
 YxioLwF5z2ciP2csgzS8X7TWpLYmJr/eHxRDciFeC6SVDj2RT/+uNqgdTRh1a8IfM7
 /QQgkG2nMSCjmTm2K02f0y3VNf5NYQKqDI5NN4E//zr7j9kC8BUqTiIxls7d2Ikk9E
 RU/m6sSDuFgctr3SbRIeeFnaN9PCA7U7psbFoiyWvmqA+fFq2HCk0aEpkGsFPwA7RX
 L/3Vh0Vg+Xqug==
Date: Mon, 27 Oct 2025 17:35:28 +0100
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
Message-ID: <o77arwh2h36z3ypye46sbi6vmocdubeai5xcdckbcejhlcgrhl@rzm2rd6v7are>
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

Acked-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
