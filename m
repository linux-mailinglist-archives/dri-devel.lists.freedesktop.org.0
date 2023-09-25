Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F27AD211
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46B310E214;
	Mon, 25 Sep 2023 07:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F3E10E215
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:44:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4251860F60;
 Mon, 25 Sep 2023 07:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56685C433CA;
 Mon, 25 Sep 2023 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695627857;
 bh=HGbj+fObT8u6gTICGsTkRzwnurezQLIHLfZnqiBm5js=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GGSj1y/GZBESvrJwHEtIwCeJboCOT+s3GpBV7F/TNSTPOGssUZew5WtCI9hcGY5cl
 SjRTDUZqAANJZcy1iLpI714Y61sc83YcmpxJWTMxEfJxIyeJmn6/c8+hJq26q/RxF0
 RhEaHt7Oq8m5z3tESrmS1AubR6iYJmL3yDEG+I91W3PYCyMPeVYASln5pFRWkSvL8H
 stXmjH278Xof+DRrjbgIgj4XylNG4rzO9ZpOLbMcbgHIzz3yXMbz6TwMyKKrPreK/d
 42H3CHU06G6Fbj6bu1Z9vIbOeX/9AFeFYoNJocJlRVNSTdkCugEpu02cYYo9u9awYg
 soPW50dMpGf/g==
Message-ID: <b96d809490814cce95ec13ef8e21d3d1.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:44:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: dw-hdmi: Remove double encoder cleanup
In-Reply-To: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
Content-Transfer-Encoding: 7bit
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, Maxime
 Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Sep 2023 21:25:59 +0200, Jernej Skrabec wrote:
> It turns out that comment is wrong - dw hdmi driver never does any
> encoder cleanup. In fact, cleanup is done automatically, in destroy
> callback of encoder. Even more, encoder memory will be freed when hdmi
> device is destroyed. However, encoder will be cleaned up after that, in
> drm_mode_config_cleanup(), which is called later. This will cause use
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
