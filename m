Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8A979D61
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDB110E310;
	Mon, 16 Sep 2024 08:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b1I807zE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6CF10E182;
 Mon, 16 Sep 2024 08:57:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B2A78A414A4;
 Mon, 16 Sep 2024 08:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387CBC4CEC4;
 Mon, 16 Sep 2024 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726477032;
 bh=PcBTAwXOWPj47CjUgTUY9x+/PCIpKzX5I+Fb50RUGH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b1I807zEv2QNBqhK00UPY0QSDLzVfjXcjoQ66JeOO9pQtEmZedwg8ZRP1sPDAEkz7
 St24H0/TohUxUQr8OCq3v/ic1b6KeKs2wEXmtqbUfRgGHxo875DkggBaOA1VG4HYBO
 FXuu4BYyrScj6FsZLeb+h7gdiVQVRRmFRFasQ7bIg1gls7dD62YnHKGZQdacMG9UzM
 eBb+f0fyKc2nsyNBGlVPBPsUbTLldtkeNR25lHQlAVAU2BIfF3xhEwNcBGb4EScPvN
 odvFY2gKWfqYUFfKATW6edPjc5AQmZfgwJ9FWGTfGaetlOW5fHYfybv9a7kXh80Qd2
 CZobHmyRxM2wA==
Date: Mon, 16 Sep 2024 10:57:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zhang He <zhanghe9702@163.com>
Cc: andi.shyti@linux.intel.com, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gt: Fixed an typo
Message-ID: <d7ofced5jycyryh3su6qmv7wrait243rnznapcsfh3nawngeag@s6eqm4kiqufy>
References: <20240913140721.31165-1-zhanghe9702@163.com>
 <20240914013146.65757-1-zhanghe9702@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914013146.65757-1-zhanghe9702@163.com>
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

Hi Zhang He,

I merged your previous patch so that you don't need to resend it
anymore.

I already asked you not to resend it in the past version. Please,
read carefully the comments you receive.

I repeat: add the versioning. When you do:

   git format patch ...

you get:

   [PATCH 1/1] drm/....

if you do

   git format patch -v 2 ...

you get:

   [PATCH v2 1/1] drm/....

This is what I asked you to do.

The 1/1 or 2/2 is the patch counter for multi patch series, not
the version. The version is given by "-v 2" from the git
format-patch command.

Please read the SubmittingPatches document, it's essential for
sending patches.

On Sat, Sep 14, 2024 at 09:31:46AM GMT, Zhang He wrote:
> column header should be GPU, not CPU
> 
> ---
> ChangeLog:
>     v1: use correct name as Author and Signer
>     v2: change one line in drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c,
>         LLC's information header from "Effective CPU freq" to "Effective GPU freq"

Good that the changelog is here. The v2, though, is not a
changelog, but a description.

> Signed-off-by: Zhang He <zhanghe9702@163.com>

The signature goes above the "---" section, otherwise it doesn't
show up when I apply the patch.

Thanks for your patch,
Andi
