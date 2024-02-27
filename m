Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6286899D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 08:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868910EE96;
	Tue, 27 Feb 2024 07:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R0mQSrA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C278410EE96
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:11:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 407A7CE1A6C;
 Tue, 27 Feb 2024 07:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E0EC433F1;
 Tue, 27 Feb 2024 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709017874;
 bh=sdiSy1oVUFYAdoH88q1Tjo0+KMxfxx4T0j6prMh1jRA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=R0mQSrA9pxKwA3mF8j7kJptkp8uokIP7wf4ewwJX9mXPPtLWRCHAan/O8VMOd0VD3
 Vk8wPC+ep7aT44+I43NeDeRVvxfnruh8YtAxZuvZx+ttuTSn1luVpeKLXHhqMUGdnC
 QFnfuk7OGPOzb9F+nAzpqVyW8K30frOOxSToPndHMCZbzGWQEkBxa7508aQxLO2P9E
 XRtg82ekFdGQPF34aAuSvmo41Tq0IUkKN1kURvfeWljY2aBaW2AklpmfbtP7nAg+hx
 3IT+Y7jQzFfCVaJk/tHOL7kmQZo1S/mxoty5z7eRFMwjBv64Uwp5NeQ7pdKkOVHydG
 qaM7hQPgjRDfg==
Message-ID: <01960be376e86730100fe2e95c0e8417@kernel.org>
Date: Tue, 27 Feb 2024 07:11:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 00/14] drm: Add a driver for CSF-based Mali GPUs
In-Reply-To: <20240218214131.3035480-1-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 "Chris Diamand" <chris.diamand@foss.arm.com>, 
 =?utf-8?b?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Daniel Stone" <daniels@collabora.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "Faith Ekstrand" <faith.ekstrand@collabora.com>,
 "Heiko
 Stuebner" <heiko@sntech.de>, "Ketil Johnsen" <ketil.johnsen@arm.com>, "Liviu
 Dudau" <Liviu.Dudau@arm.com>,
 "\"\\\"\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Marty
 E .
 Plummer\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\"\\\"\""
 <hanetzer@startmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Nicolas
 Boichat" <drinkcat@chromium.org>, "Rob Herring" <robh@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, "Steven Price" <steven.price@arm.com>,
 "Tatsuyuki Ishi" <ishitatsuyuki@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 18 Feb 2024 22:41:14 +0100, Boris Brezillon wrote:
> Hello,
> 
> This is the 5th version of the kernel driver for Mali CSF-based GPUs,
> and, unless someone has good reasons to block the merging of this
> driver, I expect it to be the last one (the gallium driver is now
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
