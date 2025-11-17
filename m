Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC6C6391A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30710E00E;
	Mon, 17 Nov 2025 10:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zhxi6nr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D3C10E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 10:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A105F60143;
 Mon, 17 Nov 2025 10:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52231C4CEF1;
 Mon, 17 Nov 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763375626;
 bh=ghcnRQ+nhX7xv2Ba3ggi4m9wIFMl1M+hkyAbVP+4LTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zhxi6nr+jtFF9MxK+qlBz/BSYhzAFGFiT8cO/moudHfhdW742v5PHmOhqpsA2Yr1G
 VL8h941jkiApYZWngPIAiuYK3jkm/craj9Iy3D2fJc3Xl0YbtNcqdWeDVEESGTKqd1
 U2XcIPMt+WuFdnbo/Ra2TdDWLslJe4UwCsNReMMpiGMvFiN6lrGaoVQbgHp9C0JFBb
 PkJp9JcR1a/DtJHrZnRS5Rc+oUlF+YPi/zDnOrfQBxvjpPSx4fCfq+07TmOU56NOxY
 2lw5J+s9I/+NodTxe7Lb9EouI5n5U4RmxpdrlO/eCeydhkIwD2DSu/HW05jtbRJe6y
 3RfTI5LdJGirA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vKwYI-0000000072Q-3Gub;
 Mon, 17 Nov 2025 11:33:43 +0100
Date: Mon, 17 Nov 2025 11:33:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
Message-ID: <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
References: <20250923152340.18234-1-johan@kernel.org>
 <aP91AfdoyESxqfPG@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP91AfdoyESxqfPG@hovoldconsulting.com>
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

Hi Chun-Kuang and Philipp,

On Mon, Oct 27, 2025 at 02:34:58PM +0100, Johan Hovold wrote:
> On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> > This series fixes various probe resource leaks in the mediatek drm
> > drivers that were found through inspection.
> 
> Can these be picked up (for 6.19) as well?

It's been another three weeks and we're at rc6 so sending another
reminder. Can these please be picked up for 6.19?

Johan
