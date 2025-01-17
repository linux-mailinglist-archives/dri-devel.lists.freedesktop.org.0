Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B06A14FBC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 13:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0617A10E1E6;
	Fri, 17 Jan 2025 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XVutlGSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3D410E1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 12:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18AD45C61FE;
 Fri, 17 Jan 2025 12:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282D4C4CEE6;
 Fri, 17 Jan 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737118621;
 bh=Ng8c8u9mGMsnr89/0ZbFiDettIc2FYU96JTg/Manq1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XVutlGSJ02ENDzZnXyyURYUHhTJxQLMOtOOuiDwvDS0K0dlxiovJL/S0RQTZ2llrr
 fFGN7zqU1hdnUzACq//OSqhRPCMWULLSsQLqRtX16McWrllt+BQFEZMNyBKiByZupr
 oZHiqAXt2XI9hjPXr7aQIL1tOA5UP758bx9NFGSeDXGMp1T0G1CVDFwuqaDDl1yM/W
 nkVzRU29GQ17TAkp8TAqkSCpOe3fdtVOZQ2CQjhsro6Cvd0e9Ydsgn7Lt1yqXHjL/J
 y2DoKHoS05M7UGrq9KG+jwD6S3IyL50HYeNfFE7E3zK8NkS+boaHHSM7DkTNJnlici
 Eo4oon6spCaXg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>,
 Friedrich Vock <friedrich.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] cgroup/rdma: Drop bogus PAGE_COUNTER select
Date: Fri, 17 Jan 2025 13:56:57 +0100
Message-ID: <173711861436.353110.4495844008892869326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <b4d462f038a2f895f30ae759928397c8183f6f7e.1737020925.git.geert+renesas@glider.be>
References: <b4d462f038a2f895f30ae759928397c8183f6f7e.1737020925.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 16 Jan 2025 10:56:35 +0100, Geert Uytterhoeven wrote:
> When adding the Device memory controller (DMEM), "select PAGE_COUNTER"
> was added to CGROUP_RDMA, presumably instead of CGROUP_DMEM.
> While commit e33b51499a0a6bca ("cgroup/dmem: Select PAGE_COUNTER") added
> the missing select to CGROUP_DMEM, the bogus select is still there.
> Remove it.
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime
