Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E760A646
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A4410E416;
	Mon, 24 Oct 2022 12:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10EB10E416
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:33:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2C1A6121A;
 Mon, 24 Oct 2022 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5F4C433C1;
 Mon, 24 Oct 2022 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666614799;
 bh=N9wIamNHKy/+ppn5xdXN60PJL5TdYTrdbc8ReqtAUWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hc+bbdp2OxajHemJUi1ByRJcqctWsgYxL+m97MF0ouspSYiNXzJPUEVwtgIu0C5F/
 NfilP+ZE42qTeLFm1OBSYes5Aqp1wXga76NRZwQL0s5mFADGc1bCDN9bdasq9Pd/Rq
 T2YFBccOh+0s3xOVUa4xg5ARCcXgBqNQGrLRqAJqErHzVwChtoFu4jYvTzdZYUivo3
 lslINB7FjHzmbSkMbemuKML3VQAFbMMXRloYuvEi+lcpvAs7OiI6diV4VB0vp3ZiD/
 e2ZAj6aP9A8C3ORRfAEXdq84vtDrJfIELLlQAPbGcc7mGt2Obvg6sdLpEBhirzlYp0
 IZbZNRM7dPiRw==
Date: Mon, 24 Oct 2022 13:33:15 +0100
From: Lee Jones <lee@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next resend] backlight: ktd253: Switch to use
 dev_err_probe() helper
Message-ID: <Y1aGC36X50XvlNwm@google.com>
References: <20220926142059.2294282-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926142059.2294282-1-yangyingliang@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, daniel.thompson@linaro.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022, Yang Yingliang wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Resend for adding Sob.
> ---
>  drivers/video/backlight/ktd253-backlight.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
