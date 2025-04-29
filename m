Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B2AA1088
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B0810E143;
	Tue, 29 Apr 2025 15:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dDIzEsOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2461610E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:32:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87D354A860;
 Tue, 29 Apr 2025 15:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FABC4CEEE;
 Tue, 29 Apr 2025 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745940718;
 bh=0CJuKxneljMQjy0TNkbiQplHcDMmpr97N876+7s1Nfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dDIzEsOJOg0Oy2aclf/zG8gYR3Y1Eu1FxjrrO5MSwVXztWVrwF+2i8qR2N8ltgtfu
 W+VA8UmiKPBb93pstfoTxPM+/6TbKMZDJsF7JnPEHYFhJl+OiemYMVsNmpr7R9c0bV
 sz26LG0puNbj5uhweuMkduKDM0YbHzbl7s56yXYvjKqQLD4yJx5XLc5XIJInhewyRz
 uYr/1oraajbH613Ctatmcxx3N7qHBaZMnikUnZoaKnmLb196CQp2DbjZTe4q9dpzdt
 NozCupYGUULW1V29H0fXpVi5XMipyvMPRQpUUh7xJMmaWVlXubHWw5/l56FsgC/xsx
 9c8qlo8ur5Abw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Russell Cloran <rcloran@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/mipi-dbi: Fix blanking for non-16 bit formats
Date: Tue, 29 Apr 2025 17:31:50 +0200
Message-ID: <174594070795.925005.288282754813754693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415053259.79572-1-rcloran@gmail.com>
References: <20250415053259.79572-1-rcloran@gmail.com>
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

On Mon, 14 Apr 2025 22:32:59 -0700, Russell Cloran wrote:
> On r6x2b6x2g6x2 displays not enough blank data is sent to blank the
> entire screen. When support for these displays was added, the dirty
> function was updated to handle the different amount of data, but
> blanking was not, and remained hardcoded as 2 bytes per pixel.
> 
> This change applies almost the same algorithm used in the dirty function
> to the blank function, but there is no fb available at that point, and
> no concern about having to transform any data, so the dbidev pixel
> format is always used for calculating the length.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
