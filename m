Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AFC0E143
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18210E49C;
	Mon, 27 Oct 2025 13:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xbruydx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE1F10E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:36:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4AD360623;
 Mon, 27 Oct 2025 13:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AEDC4CEF1;
 Mon, 27 Oct 2025 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761572181;
 bh=9gkc51HKyIGzpsiSokYYslNBHWpyEyG9Ffyln4h27oA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xbruydx+db5r1jHlh07/my5RnAn05zlmS3pRDwbS+gXzLEA8b1WQQanvl1YEwX325
 2FZbYXimrbVzYfBsaF8iLvTFMB+2bMXHdU1j8qLjAHB4+K1gljpiyWtm33dNQz4OYs
 unyTvaOe/ni42NafFcE/X3x8dOXb63CVxC9AnLpIaygx2Jcdb8lJoXag+Dd3mfSvL0
 FD/bCgCsiR5nCbrBxYH164GRfSyvOKlD0M1jTsmq4wYRBoGtjOP3eKYH0IhQbMtg6l
 RKpcblsgG6XTgu5hSaTLhD4S6kIuI5k8FhHlp/yZHKPDZqQmHY6A1Fd4Bb77yycmjT
 cIMfb4kTs55AQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vDNOb-000000000IK-0dDL;
 Mon, 27 Oct 2025 14:36:25 +0100
Date: Mon, 27 Oct 2025 14:36:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: fix probe device leak
Message-ID: <aP91WYeEEvEFIrfe@hovoldconsulting.com>
References: <20250923151346.17512-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923151346.17512-1-johan@kernel.org>
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

On Tue, Sep 23, 2025 at 05:13:46PM +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the DDC device during probe on
> probe failure (e.g. probe deferral) and on driver unbind.
> 
> Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> Cc: stable@vger.kernel.org	# 3.10
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Can this one be picked up for 6.19?

Johan
