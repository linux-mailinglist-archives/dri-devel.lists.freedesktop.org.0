Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA7979F12
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 12:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B610E338;
	Mon, 16 Sep 2024 10:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dEzADLZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD710E334;
 Mon, 16 Sep 2024 10:15:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2BCC8A41CB8;
 Mon, 16 Sep 2024 10:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC5AC4CEC4;
 Mon, 16 Sep 2024 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726481738;
 bh=0TWt/E9h071v0SXzRGXM9nnf0J/m4R13yaLwwe6bf10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dEzADLZ4RGCV0L+G+Czd2Xd5vHF6iwN2UjHqi6a0RWxck6/GVtjtyJytxOUXYAZgI
 RVq9FGPCuNz7fMzCfziql9jlUXZxovU3wl4PRQknhuzdv3iecp6sMRXKFBypyBL1xs
 gi9kpVI2+DoiKDz9LHQQ34nqYFJXMCocl8PRGALFkrk+fzUXClvR87gfuL6a7asDJZ
 2I2yHLU6Q2t6yxs9C8rXY+geuDoexSKSFVuKehzuPQEULVrtyxdZzZ6lD5Qwi1rBhn
 9azIrJbRenzWIXAcAaAYPWaIoElENeqbCqfj5T2m2QtsrVTSfz+Y4T5nNEYUJER/HL
 WQWEP+5Gr2FMQ==
Date: Mon, 16 Sep 2024 12:15:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] drm/i915: Fix typos
Message-ID: <gamwfgmreryzvy6fazduxs4z3sfjxck7xmsho4elpemcf7llpl@epzlqmudvrzx>
References: <20240915120155.101395-1-algonell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915120155.101395-1-algonell@gmail.com>
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

Hi Andrew,

On Sun, Sep 15, 2024 at 03:01:55PM GMT, Andrew Kreimer wrote:
> Fix typos in documentation.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Because we are receiving lots of typos patches in this period,
it's nice to have the context written in the subject, e.g., in
this case, Fix "bellow" -> "below" typo.

Don't worry, I will take care of it.

Thanks,
Andi
