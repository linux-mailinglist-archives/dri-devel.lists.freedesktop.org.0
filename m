Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ED4C14A14
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068610E3C3;
	Tue, 28 Oct 2025 12:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MWW+zGjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0E10E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:30:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CE5661F79;
 Tue, 28 Oct 2025 12:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089D6C4CEE7;
 Tue, 28 Oct 2025 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761654602;
 bh=wCicmv7BX39dNksXr1oTPJr0GBVwAai5qBVQk0rdTEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWW+zGjxLHgwIjrj5giH0k2xl1dJJvu9U4pDgcsD66QUJwYw15K+JUVFYwpoduZZh
 4huufU9S6GAjSOeV545APhSaz9kdM0nO7ARQfqEb+hKaou/Y2i/cVE08timIH1Kr9n
 vcGkKDup1BF57Ytv811tSGsonQs+Y1OWNyx1UO1gDxqKA8Oxu7RyDZUe9RjyomsY0L
 vP53kaAW9VVWau74qx421Yh0d0JzqPCDp3Zo5wmqIhfquf28ZFKmaz8LgDHoR4zS/V
 Fp4P0Ku33C1m56MeB0hGiC9svx3binWMfkV7ifAoObHzvPRaJwrTyxw1H+Ny6nXIFW
 pWJ7YBhCC3fCg==
Date: Tue, 28 Oct 2025 12:30:51 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: naresh.kamboju@linaro.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, lee@kernel.org,
 jingoohan1@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] powerpc: Fix backlight include fallout
Message-ID: <aQC3e5sbGwIpanf6@aspen.lan>
References: <20251027140646.227025-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027140646.227025-1-tzimmermann@suse.de>
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

On Mon, Oct 27, 2025 at 03:05:39PM +0100, Thomas Zimmermann wrote:
> Fix the fallout from a recent cleanup of the backlight header.
>
> Thomas Zimmermann (2):
>   powermac: backlight: Include <linux/of.h>
>   macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>
>
>  arch/powerpc/platforms/powermac/backlight.c | 1 +
>  drivers/macintosh/via-pmu-backlight.c       | 2 ++
>  2 files changed, 3 insertions(+)

I noticed that both these directory trees are orphaned.

Anyone have any thoughts about what tree these should be delivered via?

Either way, FWIW:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
