Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DF477B08
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D910E235;
	Thu, 16 Dec 2021 17:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D895E10E235
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D0AD41F46708
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639676999; bh=mb9PXcIJOxFFMiNhPVival7wVtn1t9kxa9+SB/qWAzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LXoOO3G0r53PmgAQxgPBsGq8OiP1b73dDUja2Kyxhwyr+UCMEAiNaQwkpoRXpcwNJ
 eRSuBAoQLMjkfUnTAKJ7sZ3F21pdTGCuNx/hIsD9WLwyb7Y+PylMcwFji+am9hOdU2
 0Tqd4pYkhAqLCZpIh8BJSLY8c0dU5NFFC9I4UXQYabQ0RQ7jDSa2vU4INkDcYxLsxl
 TFtCx7tg4B2aNvkh9LKAF3u+cJOeQdMEuDEFaUhtpx8/mv7qxQ2n49kDbiuuX3CV1S
 9F/Atz3wL1TKe/y3qLZbJuaKAq9I/g2iLlvFmkAEayBxHWJxT08JTxxRd3Ou3eukMU
 8R3n4ye6O+q5w==
Date: Thu, 16 Dec 2021 12:49:53 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
Message-ID: <Ybt8QWEAooP++R7a@maud>
References: <20211216161603.983711-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216161603.983711-1-steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This provides an easy method for user
> space to trigger the OOM killer (by temporarily allocating large amounts
> of kernel memory)

panfrost user space has a lot of easy ways to trigger to the OOM killer
unfortunately .... if this is something we want to fix there are a lot
more patches coming :(
