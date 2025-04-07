Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55959A7D7F8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BF410E19C;
	Mon,  7 Apr 2025 08:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E8PATd2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1007110E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:34:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E7E861130;
 Mon,  7 Apr 2025 08:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74906C4CEE9;
 Mon,  7 Apr 2025 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744014854;
 bh=El7e2M7rFc/t6PAykKJndkxSK1Jx5JzrAuQLStmKrrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E8PATd2/6V0G8rabK6kh7iog+6FdglCzojEAHUR0fNbDOA2vKhHWlO09Ej/HWHRte
 uzGzp6AxiS1nAwltNCtOJAczI+kkPczm7gqtw+RxWnJtl4cgAS9EmpILrBTO9/02Pf
 00O9VKNoXV5dF0e616nHO2WjsJTLR4vE+vqaWcuH8XANjkWvFDb/kdSi8rBFJT3rr3
 UxvW3fUzpSIwk+vPX6A3ANI7Vw4/7PYlM5kZNEsRdfjYbXks/VL/O9xlBjX95lHiz3
 1vyciGZB0OfKRsCTbAS+G0QxtRBDVsxw/B+4UPWhiN+hfN19GSsy4ijQjSfqTsfjf3
 byvP2AGXCDQYQ==
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/vc4: tests: Fix locking failures
Date: Mon,  7 Apr 2025 10:34:07 +0200
Message-ID: <174401483593.120970.3179575497463002882.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
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

On Thu, 03 Apr 2025 15:33:29 +0200, Maxime Ripard wrote:
> This series deals with (lack of) EDEADLK handling in vc4 PV muxing
> tests.
> 
> This was leading to failures with CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> enabled.
> 
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
