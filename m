Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA60A7C04C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F3410E18B;
	Fri,  4 Apr 2025 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qdmxfg9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD210E18B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:12:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C6DB5C062B;
 Fri,  4 Apr 2025 15:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548E2C4CEE9;
 Fri,  4 Apr 2025 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743779516;
 bh=E5w6pjZPs5pNVgmLcae3JWpXqM9z7gWCU8pWPUyis3o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qdmxfg9sNdy1Qpx8MB/cKv0UT6R2yNNI3F3pH02LLCH7lEt5HwLB3kJcioJIlz5v4
 1+6phH/J2ngQ0t8AXPchQ+4rhZRKkFitqhPUWXZE4u7XLGAHFD1n7zCSfdglt0JAm7
 8TtXmdN5RjJiDh7VaVj6F6A+/HTrA/uQA44C9PeMyWBXfuMjjeGze6U/GoqjDELDg5
 GB7fO0AuX1HXgEuCgE+1EFjRfbGso2ifiLeJTcMtEwHtF4EKGfXrrX/hZuaFPZsUw/
 xw7C3KpGMBES7dCqpkFTIEMb0KkCwrouRo+IX+7fsSGyyqCRGtPFw2doe+8VZ03+Am
 9SpFfoC3n3hvA==
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250401091647.22784-1-bsdhenrymartin@gmail.com>
References: <Z-uqpxcge0J99IPI@aspen.lan>
 <20250401091647.22784-1-bsdhenrymartin@gmail.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in
 wled_configure()
Message-Id: <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 16:11:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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

On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> wled_configure() does not check for this case, which results in a NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Applied, thanks!

[1/1] backlight: pm8941: Add NULL check in wled_configure()
      commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace

--
Lee Jones [李琼斯]

