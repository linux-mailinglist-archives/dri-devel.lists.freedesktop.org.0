Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D84A4C1CF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1AD10E419;
	Mon,  3 Mar 2025 13:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oRtgcCPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE04210E420
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:24:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45A5D611E2;
 Mon,  3 Mar 2025 13:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419E6C4CED6;
 Mon,  3 Mar 2025 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741008242;
 bh=IZ3D9lv5A0Jgf7RXlIN7/lGIafoJrbkLgYllyfrshF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oRtgcCPE1gmlHlvzup38gZc+gf5jMajVbd+4qbU4svt0wH5ploEBusEBJJwhQjTdH
 CDtSlYX70rc4GvCaW3RKQ72jSRiMKd0WDBvm8oBdN541xcnv5vAEEZKmvF5KCuzTIi
 pZSX5yfrij4d0JDJjS1XRTkqx2F4FqY6nlK0CVYtBUxlgdpbYZPuYI2UyXVipaSPp4
 zgRk3DOBKNGZL0RccdSFaZ6h3T6wTNeKxftm+faSnbcp/AWa1NhEnE52IuY1gQhoFl
 x7JWR2/z3osPHHz6dH1IxZ9ef66NX+wGAtgLnakfZWYEa6ZNurelJWBMERAv8gPqp9
 2zkqbuR/Dgm7Q==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()
Date: Mon,  3 Mar 2025 14:23:58 +0100
Message-ID: <174100823623.41136.20409706387741750.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220132537.2834168-1-mripard@kernel.org>
References: <20250220132537.2834168-1-mripard@kernel.org>
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

On Thu, 20 Feb 2025 14:25:37 +0100, Maxime Ripard wrote:
> lockdep complains when a lock is released in a separate thread the
> lock is taken in, and it turns out that kunit does run its actions in a
> separate thread than the test ran in.
> 
> This means that drm_kunit_helper_acquire_ctx_alloc() just cannot work as
> it's supposed to, so let's just get rid of it.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
