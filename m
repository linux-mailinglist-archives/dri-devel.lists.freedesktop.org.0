Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFD97DBF6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9B110E0A3;
	Sat, 21 Sep 2024 07:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T/8CF+vi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416910E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 07:19:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F5885C05DB;
 Sat, 21 Sep 2024 07:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC81C4CEC2;
 Sat, 21 Sep 2024 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726903163;
 bh=2CSVsbBzGUSYhZ7xAMjXq61nK8MSePG4jJZJy4WhDCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/8CF+vi7cr9jxFFVYtyhlL4DgW6YpNM76umOQRMfKcKXOuuvZCyj4USISY7agLG3
 8zgpLAgo9I9rrMn0gyJdekfi0tCQJG6bPAvZD/kfeSZv0dIZeHouK49Zk8vvT68q3V
 ndsJYrga1t9JUKYFgRfgnrph4s1g36nosWod3J0NjmyQR/Baus2c4ZBBHLJqI1s7qy
 9xPXbPi2K4Xb1++Z+1CeycXvXrRHM6x/9mRyMRVI4Esr5QVN0Zj8LKix2exuwdGzDa
 dSj82YxuUIHExOHIsKh9yvegqaauqde2sIovn2ISimPfGGSsw7e/0Ja/zxPim25Fgr
 IK74D53nAN+1Q==
Date: Sat, 21 Sep 2024 09:19:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags
Message-ID: <20240921-autoteile-fahrlehrer-201ea80e1ea2@brauner>
References: <20240920102802.2483367-1-liviu.dudau@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920102802.2483367-1-liviu.dudau@arm.com>
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

On Fri, Sep 20, 2024 at 11:28:02AM GMT, Liviu Dudau wrote:
> Since 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> the FMODE_UNSIGNED_OFFSET flag has been moved to fop_flags and renamed,
> but the patch failed to make the changes for the panthor driver.
> When user space opens the render node the WARN() added by the patch
> gets triggered.
> 
> Fixes: 641bb4394f40 ("fs: move FMODE_UNSIGNED_OFFSET to fop_flags")
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>
