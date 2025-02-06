Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B9A2A923
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F0010E219;
	Thu,  6 Feb 2025 13:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FWZymsNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB0810E219
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 630825C5822;
 Thu,  6 Feb 2025 13:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86635C4CEDD;
 Thu,  6 Feb 2025 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738847415;
 bh=Zhl4zGvXDdpzXQ7GWRQAco7c9y4WnWXKQfhtR8UZKj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FWZymsNyIvviUI84VwWutdAg2wlF31lzxAUnHilv7g9hVX3Ea3dG8Us+lqHJhGenZ
 xBbzCL7+WuMcVNji42bcXPnKcwrW5E9D2UnNIPXZCSC5ypu9vlQA4DriVb9XDdSSxo
 otndym1KbSaFxC2vyxHv8vTI7X++QlzB0+foaw/Wi4qR0trwzS3MIoBAcRMcp6itOE
 g/VbHkyDmnt4Rs7utxkPb/96Fb4ySOALN8AeocolZjcIGkIO6jKGgCoXoen5jwrPtv
 FhZew/13NodVBJiiW+xFma40/MeD+Xn3MPW1QJh6XZdMj2QHk4gz9IeJCdVCbrHYPw
 /8Z9Ro74bovpQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tests: Fix locking issues (kind of)
Date: Thu,  6 Feb 2025 14:10:11 +0100
Message-ID: <173884739358.560732.9994156025100638634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
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

On Wed, 29 Jan 2025 15:21:52 +0100, Maxime Ripard wrote:
> Here's another attempt at fixing the current locking issues with the
> HDMI kunit tests.
> 
> The initial issue was reported by Dave here:
> https://lore.kernel.org/all/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> 
> After fixing it, there was still a lockdep warning for a circular
> dependency. This series is also fixing the issue.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
