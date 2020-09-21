Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395DD272454
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 14:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5976E34E;
	Mon, 21 Sep 2020 12:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265796E34E;
 Mon, 21 Sep 2020 12:55:03 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD225221EC;
 Mon, 21 Sep 2020 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600692902;
 bh=5O0cAAXtuqI4SBzaqKAjJmi8X79NcwFPjsFqFs/2jy0=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=cyDkGeju7lETEwZiG9s1kejkccsKOsyqokIzM6OfxnW5y90eBnc+v3FjNxH7JnHn9
 MfNIda228f0j+lF47dUOwEfU1odtdpZ9Z3iJKh3oKiw0qEcVpkjzoTarFUdZGJK4IN
 37mGcIV+6QMueKqBqaorKvjUH3K4rM+x0zqz88QA=
Date: Mon, 21 Sep 2020 12:55:02 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
In-Reply-To: <20200916132017.1221927-1-alexander.deucher@amd.com>
References: <20200916132017.1221927-1-alexander.deucher@amd.com>
Message-Id: <20200921125502.BD225221EC@mail.kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 stable@vger.kernel.org, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations").

The bot has tested the following trees: v5.8.10, v5.4.66.

v5.8.10: Build OK!
v5.4.66: Failed to apply! Possible dependencies:
    8b53e1cb2728 ("drm/radeon: switch to gem vma offset manager")
    9d6f4484e81c ("drm/ttm: turn ttm_bo_device.vma_manager into a pointer")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
