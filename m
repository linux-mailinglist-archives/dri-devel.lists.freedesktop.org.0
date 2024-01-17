Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8C8302B2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA5A10E683;
	Wed, 17 Jan 2024 09:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8927D10E652;
 Wed, 17 Jan 2024 09:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1B026159E;
 Wed, 17 Jan 2024 09:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9B7C433C7;
 Wed, 17 Jan 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484831;
 bh=EDFiShPmnlc3Bz+tm7IGonEKApiN8X1nqhV18m3LYRM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rwp/MxHgI8vLpuIjfb1tb7YP/tLNXY67CQiDTOleQmxq/g30I4ZdYK77vnPHmFmOR
 hrH0dft3Aq/LgJ9FAdOyT3s9GfMi+OBBG/0Zg6kqH4BvyGJnMq7qXcR7WtfXMgDe9e
 b8C/k0NyPYQRYJ2U0CxpHzTC3G+Yz0j9L/cJG9G3k7FtlNtdIyg9D+Ey2w1HFYutS/
 qHCjtCh8yOrUwBmdnqsFT51/jShrxSs8Y8Nznlk2oOa1BqGPwlBxhwIUYmk2n0U9Pa
 8YzJmQX4mXPka5XUur5DI+kOzpJZlKNmHnZ/5aECQikep6hAwXyUTWtQD0dqI8B8aC
 rQl1lv8/acjjw==
From: Maxime Ripard <mripard@kernel.org>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
In-Reply-To: <20240115171351.504264-5-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
 <20240115171351.504264-5-michal.winiarski@intel.com>
Subject: Re: (subset) [PATCH v5 4/5] drm/tests: managed: Extract device
 initialization into test init
Message-Id: <170548482927.96553.15455064080012962695.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:47:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 18:13:50 +0100, Michał Winiarski wrote:
> It simplifies the process of extending the test suite with additional
> test cases without unnecessary duplication.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

