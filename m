Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5E1199B0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0D06E17D;
	Tue, 10 Dec 2019 21:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99286E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:52:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65324DBF;
 Tue, 10 Dec 2019 22:52:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576014727;
 bh=Ih8EqcfA4nD8hACm8d/yLl08r2Db3KdImZJ3njZhk8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e+CNvBHvYgFhT/I85xrhtTzkQLHns7WVHJpYg3UMd4sJbpHR6Qd23yypDPmqv0757
 GVaIZwYM2MzQ5Shu5N/q/keQ5SHPHq86mwcwACrbDvIG4VRowIPbQuRgVes+Pi+7UZ
 CvHmfF8nUh6qaN5KnXOf/GZJLZ1wiHpMqXg4W3o0=
Date: Tue, 10 Dec 2019 23:51:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v5 2/4] Revert "drm/tegra: Move drm_dp_link helpers to
 Tegra DRM"
Message-ID: <20191210215158.GA13051@pendragon.ideasonboard.com>
References: <1575957299-12977-1-git-send-email-allen.chen@ite.com.tw>
 <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Allen,

Thank you for the patch.

On Tue, Dec 10, 2019 at 01:53:40PM +0800, allen wrote:
> This reverts commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292.

Why ?

> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 128 ++++++
>  drivers/gpu/drm/tegra/Makefile  |   1 -
>  drivers/gpu/drm/tegra/dp.c      | 876 ----------------------------------------
>  drivers/gpu/drm/tegra/dp.h      | 177 --------
>  drivers/gpu/drm/tegra/dpaux.c   |   1 -
>  drivers/gpu/drm/tegra/sor.c     |   1 -
>  include/drm/drm_dp_helper.h     |  16 +
>  7 files changed, 144 insertions(+), 1056 deletions(-)
>  delete mode 100644 drivers/gpu/drm/tegra/dp.c
>  delete mode 100644 drivers/gpu/drm/tegra/dp.h

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
