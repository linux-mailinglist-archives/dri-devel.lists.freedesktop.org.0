Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D5A8101D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA710E6D6;
	Tue,  8 Apr 2025 15:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NexMqlTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599CE10E6D6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:34:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59E435C5D6D;
 Tue,  8 Apr 2025 15:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8651C4CEE5;
 Tue,  8 Apr 2025 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744126458;
 bh=WQftzQO++oPoj/m65/7HbOAr97ECatUT7IUw/jtlkoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NexMqlTXfGxWJCHOpLBOQoheYIDIr3/P4EbuJrPmMusoL4QXiYv0AYdkuOCJGfqGW
 qM8P+Gs/DAStvJ9Nc0W/xEtb0MYTMjjFAbWkPZjXmFeCefpUJmZAJb4NeKFlJ162dQ
 3HN4FQT0my2oZ+1WJSa/noN2KLHLQPnku0RkXz90CJ4YgyW+Pd4QjuA3R4uhcfZTdF
 td/X5EQHYPzH9KXhnYSTFuVG1ufMiH1IEdD9OtQVkRj0wZWDUqjxFdPiCxVg2SY3sU
 P/d3/dcVHvwingfQZvbQDqNCeXGRSSAGnsi0rf4W9t1jLfIG16tcnOJIIRX6tpWDHx
 u63n1qXXlz0Aw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/tests: Fix drm_display_mode memory leaks
Date: Tue,  8 Apr 2025 17:34:13 +0200
Message-ID: <174412644317.1850669.11850198768886971879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
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

On Tue, 08 Apr 2025 09:34:06 +0200, Maxime Ripard wrote:
> Here's a series that fixes some memory leaks in our kunit tests that
> eventually show up in kmemleak.
> 
> Let me know what you think,
> Maxime
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
