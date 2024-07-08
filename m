Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C692A12C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D037410E1B7;
	Mon,  8 Jul 2024 11:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LBI6hagt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EB110E1B7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:29:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90C5760B73;
 Mon,  8 Jul 2024 11:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AF3C116B1;
 Mon,  8 Jul 2024 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438147;
 bh=AJX4JJPeImfTEiasi4WTYkC4srF1L06nqHvoXhLRadE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=LBI6hagtTRfbr3ZpXuCZjgqSQZ0j2q1TQXSEyqB316nRH7VWz1QKQ9Mvk5ff3i+RZ
 HEQ48jG4JWhaCkMzBsJ+FjtsEHyX1RHVsEUOARvtnGEpq9QltYyLcwhJ9NcPqLmOCx
 cbptQCfCn+yJ8Lbe/kB9GMDW+a6De+BQIQtN9iZrpsfOXYWNEQgEKKo7+/9GIaa+c5
 eBWLMyjD9x6Np5V88P6LPE16txoKFIl8cx/0y63wAkbb8qw4EMHCmB1gmDwkxrLnv6
 3kMRDDmcWzU4VuWHgJ+NmNyp11nblgxQcqpmSeYa1yixmQOFaEGTpWhZ89mMHOUiHd
 BLgvzGUEsonEA==
Message-ID: <43ab87898753393007ba324e8be6e6d5@kernel.org>
Date: Mon, 08 Jul 2024 11:29:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 6/9] drm/tests: Add test for drm_framebuffer_cleanup()
In-Reply-To: <20240703172228.11166-7-gcarlos@disroot.org>
References: <20240703172228.11166-7-gcarlos@disroot.org>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?b?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Arthur
 Grillo" <arthurgrillo@riseup.net>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, "Tales
 Lelo da Aparecida" <tales.aparecida@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 3 Jul 2024 14:22:25 -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_cleanup function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
