Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D06809F8B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2910EA37;
	Fri,  8 Dec 2023 09:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593C010EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 09:36:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E2088B82BAD;
 Fri,  8 Dec 2023 09:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32B3C433C7;
 Fri,  8 Dec 2023 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702028184;
 bh=2CP+g0JFWDQiXDkdMQf10ayFgPRTjEJo99EqpGJ8aOk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qGGib1lagyidxAtZKdJT5zotbna+a0mat76lxP/Bh9bceaO81OJbA93b9DXkUgsXh
 lk8R7EENn2x8Ue3sBwDwUEE48g2azhiJMI5REeDUYOzcdCEPyl62naOz/J6o7MT8yi
 c3Dgvi1M6cB6DJOPl8DMWZ1Fk/HJshGl4vqfGCx6L1lrISTT/BvCr+pBpdLii2AWAK
 ObS+PJiKulS5b+nxAfXqJpScGIE169Bh0OhExwdgev1q1fCxWlD3BMgi0yVeN6oDhB
 0y5E1Kozo1vXkaTmOzk6JjJkYtFhVIJUM1d4GFRYy1oXz2J3mIL92tapptGYB8noSY
 UA49V64VxheHA==
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
References: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/imagination: Move dereference after NULL
 check in pvr_mmu_backing_page_init()
Message-Id: <170202818166.16687.13249105887832691264.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel-janitors@vger.kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Dec 2023 17:37:24 +0300, Dan Carpenter wrote:
> This code dereferences "page->pvr_dev" and then checked for NULL on the
> next line.  Re-order it to avoid a potential NULL pointer dereference.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

