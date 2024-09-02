Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8AA9683D6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11C010E252;
	Mon,  2 Sep 2024 09:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdyPVhpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4810E252
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:56:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1B805C57E2;
 Mon,  2 Sep 2024 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2B0C4CEC9;
 Mon,  2 Sep 2024 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725270982;
 bh=K300WKnaTS4abPUqq0WlJ0Pe4/16zx5wnDedk/d6tsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tdyPVhpFmv9UpRPOZQgtm+w2Vv7pzOC+9O0JR4S5A6ijfDM2m/JKNEPRd/1Lhp0HQ
 hqOy96A62Oq7ETyk5Q2CzR+M7F2+O27auJ6n6lyc7PFaKOjmvE2mqV8lrbi0uUSWoO
 7oihVzHOAQNKWjWE+4MWlGFQVvbjIXOZmatHFPomPKgj6fEHOQCcXX4HgdtkUYTSiw
 NXQVzJEJINdrnxO0UeYTkmfr6XFh6+Di9ciAPikBxmCnVNVA4b5kaJ0WMX/O60RrZs
 zqBF675RkCaaphG66Mux4M/eo7COj6rk2r24dNrzv1+hHYH3hOGbzravT44aYecTva
 jz2IwkrSS/pSg==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] drm/panel: ili9341: Remove duplicate code
Date: Mon,  2 Sep 2024 11:56:16 +0200
Message-ID: <172527097257.1571890.1200730115855091676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813091258.1625646-1-andriy.shevchenko@linux.intel.com>
References: <20240813091258.1625646-1-andriy.shevchenko@linux.intel.com>
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

On Tue, 13 Aug 2024 12:12:58 +0300, Andy Shevchenko wrote:
> Remove duplicate code that is handled by tinyDRM,
> i.e. drivers/gpu/drm/tiny/ili9341.c.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
