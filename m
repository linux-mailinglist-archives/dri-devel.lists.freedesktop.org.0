Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1CC0E110
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7310E498;
	Mon, 27 Oct 2025 13:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8ONXjuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110B810E498
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:34:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B301745A28;
 Mon, 27 Oct 2025 13:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BEBC4CEF1;
 Mon, 27 Oct 2025 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761572094;
 bh=CwbhXocmjxTFWUjGdv8larPIeY/QV47kgdj1kXROEQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8ONXjuc/fmeCiRsrIFQ+ouZyIn5sCP9ugBofsPdhICLVSbEAxtdXww682fDWLs/3
 cSLVWsXwxDTSMHjEMFMk52sMh1PR8/hd57Eh6HzSF9ZnoHLUo0zuwGDt+CzSyX3AHJ
 4UfPSgV2dyc5PuFRSmBPoW+YkEMCJ/E/Ho9nVV6cwixUrLRTgOH7GS5raoIdggoXrl
 C3F8ZcOoKYmaVaknLGsyY3HEQ6FMkf5ZgVJoY6bQBWnK8v/hanqesM2dID/pprDhI9
 pZJbGzAshskjSoVw+UI++8E0vYWJDFYKIv1zLiROl5nixXHQUNH8cSOVLFmGzhWdmX
 cO/RcQfOrtjng==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vDNNB-000000000Gj-16R0;
 Mon, 27 Oct 2025 14:34:57 +0100
Date: Mon, 27 Oct 2025 14:34:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
Message-ID: <aP91AfdoyESxqfPG@hovoldconsulting.com>
References: <20250923152340.18234-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
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

On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> This series fixes various probe resource leaks in the mediatek drm
> drivers that were found through inspection.

Can these be picked up (for 6.19) as well?

Johan
