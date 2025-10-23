Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AFC01170
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9BE10E3FF;
	Thu, 23 Oct 2025 12:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PP/U5aeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6F710E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:21:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C67C4182A;
 Thu, 23 Oct 2025 12:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E103EC4CEE7;
 Thu, 23 Oct 2025 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761222117;
 bh=2D6rjf0JutOL5WGu76NFk4Al82GdRGXNKVFy0VCks/Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PP/U5aeoBK2pcOQS0U7/renv+UPQHyQ/UnbnW6+S9KeMtFZsAOg1Q01SCMetY2sH0
 KDEwhOR+wO/1ULGPEhU0m3et/1rXVF3TNl9y7nwS9wXDq89uaWfi3Q2xJAEvaj2PW/
 wWO7ypBQPDde3RXgJT/A0tonL76wIAg+KriUfiaJkNLwfM2vIHMCaMNaTm6NG6EtAl
 LJ0cY6WR4fj9KUf1P8Dfdb94dOif7vmGkqRjPr1GB8HpcKqgJPafZNbK+KXn2Yqf8N
 YpdSLJlFG2dAnCABX9g5d90JJGZdWl0v7Lo4Ix872xlYLTn/vEg7Nw83ztDNGnYoCI
 4JgjirHokk70g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20251013105553.836715-1-tzimmermann@suse.de>
References: <20251013105553.836715-1-tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] backlight: Do not include <linux/fb.h> in
 header file
Message-Id: <176122211561.2126749.14046162402717309142.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 13:21:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Mon, 13 Oct 2025 12:51:57 +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
> 
> 

Applied, thanks!

[1/1] backlight: Do not include <linux/fb.h> in header file
      commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7

--
Lee Jones [李琼斯]

