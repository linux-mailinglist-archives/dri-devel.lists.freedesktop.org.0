Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C645AA33A5D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 09:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE9910EA26;
	Thu, 13 Feb 2025 08:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QHCVDPyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69DD10EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:56:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 803B8A41F4D;
 Thu, 13 Feb 2025 08:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E17C4CED1;
 Thu, 13 Feb 2025 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437001;
 bh=u0HLLklJOTFaRYEeDQYu/nDUkCt1ooDe7WmRZLU//hQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QHCVDPyt+W4tprbg/BwpXDdvuglkaaSB65Q+Nd4Rvl5C/zhva/XYfp0ffTgdI0/xb
 tx4uqxfB1rscXDF9FtdCLFKKGi8QRbc6Zp8SWrHIuUOXK8CHZ9vSCJ5kyq4STDUwfY
 pCp43nE++vPlvGhHHmuOxf4g6nv66hNZbJqxPqeLo/LXM+4I72HxibP879CgIaBX5u
 tW02cbYMiXK0SxqXJBogKac9F0KOgQpFf4yN1YSwOVo1V3TWqnhXGHy/JDQ0avyHbQ
 dnn+DUtmWDBI8JtfKu3QEAHy+WzaN+bkpJUFAv8wqgASaZ48maAkd9bHlQl9SGf5dM
 xt4Va2cllf17A==
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: writeback: Fix use after free in
 drm_writeback_connector_cleanup()
Date: Thu, 13 Feb 2025 09:56:33 +0100
Message-ID: <173943698485.1868200.10958498043496540480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
References: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
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

On Wed, 12 Feb 2025 18:23:48 +0300, Dan Carpenter wrote:
> The drm_writeback_cleanup_job() function frees "pos" so call
> list_del(&pos->list_entry) first to avoid a use after free.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
