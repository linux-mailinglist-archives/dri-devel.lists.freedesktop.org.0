Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31FC74196
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 14:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CAB10E1C1;
	Thu, 20 Nov 2025 13:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WLIf89DD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DEE10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 13:10:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD73244170;
 Thu, 20 Nov 2025 13:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2865C4CEF1;
 Thu, 20 Nov 2025 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763644248;
 bh=tInkj9k/KoTfRE/DCb2/fIYjK50Qkfn/zzltlCIrwn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WLIf89DD66733v36XtULgPqICwqz2b4vsfxkfIANlg8yqOIFKayEZe/IS4gN91nQi
 OXUt9d3hp/w+2cMByRe3OnKwvUWiNU9tnh9Y6RuDnWwj/7474eROt/WyT9ZgItFdka
 5qLInIwFsbUQtZx3c3in6mV2AoBqEaQANwx1i2zl6asIYhFWrxS0CaqMexYkgAzFhY
 1Gx4lg17VPqWEX7B2rnf1NtL8iBgVpZrYiFStHKt/J9jx8BRdILJ0JqmmEAKFJ9lk2
 fLwpli0JV3s3BBkf8P146ECYnE6aQYuICXVf1pNSi4Pea3XeUOoWjFLVl44TIqzNsS
 c/6FPDUQ5+Eiw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vM4Qy-000000003jl-3z4E;
 Thu, 20 Nov 2025 14:10:49 +0100
Date: Thu, 20 Nov 2025 14:10:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
References: <20251030163456.15807-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030163456.15807-1-johan@kernel.org>
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

On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> Make sure to drop the reference taken to the DDC device during probe on
> probe failure (e.g. probe deferral) and on driver unbind.
> 
> Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> Cc: stable@vger.kernel.org	# 3.10
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> Changes in v2:
>  - add missing NULL ddc check

Can this one be picked up for 6.19?

Johan
