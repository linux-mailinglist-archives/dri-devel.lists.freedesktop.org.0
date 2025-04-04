Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA423A7C051
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7110EBE6;
	Fri,  4 Apr 2025 15:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gUPQmRq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F397610EBE6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5364CA471ED;
 Fri,  4 Apr 2025 15:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F390CC4CEDD;
 Fri,  4 Apr 2025 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743779584;
 bh=FP3tFb7Y7bfvGa0ApcazABFfYZtkfCm210aLvxNGQGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUPQmRq5EXOp+mQwNUabADYpwjaWw+w7ZokORBXILQBS4O84eA2+5q9p7wrXn1LTL
 JGTQgnVUhgiAzxW+DMk4b0Cc8BrrgKRVntfqBYhyVRnaMNobzueZB5Qdim4GVC7t+L
 h4TgRmemcobifY1FCComkjQ08o+gaXP9oOgLgabmSLeMFA8JVEhgYeHo0tdrW5ahM0
 05A0FB/9/7QcBbFA8TnLbx6wFaTedMXxUsJYjbZXIcrhVO1l+oZjUQfElG2ZSWcBMm
 YmIEYsdvMpPBnA5gYZDA0MVhMQa9VWg8UXJ8Us650LR1E2Ik17WCxM2j8fraH/d2KL
 GBCR57oBvKTLQ==
Date: Fri, 4 Apr 2025 16:13:00 +0100
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
Cc: jingoohan1@gmail.com, deller@gmx.de, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in
 wled_configure()
Message-ID: <20250404151300.GD372032@google.com>
References: <Z-uqpxcge0J99IPI@aspen.lan>
 <20250401091647.22784-1-bsdhenrymartin@gmail.com>
 <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
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

On Fri, 04 Apr 2025, Lee Jones wrote:

> On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > wled_configure() does not check for this case, which results in a NULL
> > pointer dereference.
> > 
> > Add NULL check after devm_kasprintf() to prevent this issue.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] backlight: pm8941: Add NULL check in wled_configure()
>       commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace

Next time, please send subsequent patch versions independently.

-- 
Lee Jones [李琼斯]
