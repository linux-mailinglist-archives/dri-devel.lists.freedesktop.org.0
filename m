Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A4CE8F48
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D731010E850;
	Tue, 30 Dec 2025 08:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K16J1h0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7AA10E850
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:01:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F26236000A;
 Tue, 30 Dec 2025 08:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CEEC4CEFB;
 Tue, 30 Dec 2025 08:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767081683;
 bh=XzFlufQBAGY1a122gXiQWJa7ASmSs8VApb7l0+3YfiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K16J1h0EerHEiIGYP2K6evJykMweVj4iojSQFbWZBOa2IXOJ1jwrwjlM1lwb5yEsZ
 bFXhlujiNOYh0iqjAJh+18bQFiRpBf8SEUsOhN6OqrMG1raEo/PPlJV0AMr3hv6JeU
 LLk+bDLQr0IIgGJpK8mdlhajRF9EKwFsY9LHXEIeRidCdxAc/vlW1FDnEDCAFixNbT
 EvEmBaABYyNvw1cyYtj+e2g2ucElML0hFCPws708HujrpRFQAzds1Rmvws7/1JKbgQ
 JAO0MM1abZawVu+U9a3uhQkLodF0DSVbsBRwOn/MRvphb4ptdoQ+tnnpSweJ4lF4Au
 qVsnQSk3RUh9w==
Date: Tue, 30 Dec 2025 09:01:19 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
Message-ID: <aVOGz2zGZQ2qBCUy@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-2-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-2-chintanlike@gmail.com>
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

* Chintan Patel <chintanlike@gmail.com>:
> Add dev_of_fbinfo() to return the framebuffer struct device when
> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
> 
> This allows fbdev drivers to use sysfs interfaces via runtime checks
> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
> remaining fully buildable.
> 
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Helge Deller <deller@gmx.de>
