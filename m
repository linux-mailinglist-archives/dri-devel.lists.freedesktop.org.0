Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3CA02165
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561FA10E5ED;
	Mon,  6 Jan 2025 09:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZFpH42oC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9410E5C0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:03:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1A0B5C5889;
 Mon,  6 Jan 2025 09:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30716C4CED2;
 Mon,  6 Jan 2025 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736154228;
 bh=NjvRrMFgAlEw+gqowpSB+Eb0JYxaxvT3eZfqQ3i7LGs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZFpH42oCrthQrsw5h3lD1SMFfG3GjZXYkmMTR78FfYI7MGbnKySDxQHdWTBr/0sFD
 gEw78xTUl7Y7AXaA3rsBX2+rs1Luo9Np7KGuiVtOJ3qcFG1eCW4Bb6yYHtvFxFsf4C
 O93uE1eCi3fU+0DcwDndyPnKdIMf7GKZ3nL/zv0RUeTqIOAoLuEq4ml8HGT7IDb8Tm
 RQrpR/d0b/WSLVx1LK8mKAWdZLSheeo6/Jnb5iunHx9kEdgIRDE/rA712waNhip0ua
 dJ+R9T+kTu2jEMNe0VBpfclQy3q4+JDRHIa01fW7JDTwRBjP1FXAnzE0SujXBRePJq
 75QmyS6cRHs7A==
From: Maxime Ripard <mripard@kernel.org>
To: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, Yu-Chun Lin <eleanor15x@gmail.com>
Cc: ruanjinjie@huawei.com, jserv@ccns.ncku.edu.tw, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20250104165134.1695864-1-eleanor15x@gmail.com>
References: <20250104165134.1695864-1-eleanor15x@gmail.com>
Subject: Re: [PATCH v2] drm/tests: helpers: Fix compiler warning
Message-Id: <173615422573.357198.18339041384692312120.b4-ty@kernel.org>
Date: Mon, 06 Jan 2025 10:03:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 05 Jan 2025 00:51:33 +0800, Yu-Chun Lin wrote:
> Delete one line break to make the format correct, resolving the
> following warning during a W=1 build:
> 
> >> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test
> 
> 

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

