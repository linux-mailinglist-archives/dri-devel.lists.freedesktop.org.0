Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331B98A49F2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2110E2E1;
	Mon, 15 Apr 2024 08:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YHQXtDkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F2910E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:13:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C589CCE0A64;
 Mon, 15 Apr 2024 08:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26D1C113CC;
 Mon, 15 Apr 2024 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713168797;
 bh=kC6AAi/JZRBq8QknujOSktqMQOIYSHhF0EMVUrjpbrM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YHQXtDkKuGTGdZE94jkwbbdlVqtdZVIcDkyXkuSIfO275liUtTM6CjySm/0Lv73S3
 F7ppFMeWToGvNhITdusuEJqOvxS5Bip/y46shQ+majgPCgzjjvRX/3oxabbKRUE9vj
 oAru4fdH1N/XXGbt32ngdNXTzLd5nmr52urFfJuhgwueZZlCHup4Aw93xn4/yCDOpy
 PxjSYn/sVL8OAMXqT1yYbEm52NNgB2wDnjim+e961Dz1W+FyFai9bmK9SAsH+rNfa2
 z75qwmQ+BqaRoSbFnhwp/DzSGfb3nqqxq5cGurdrAv6nRD6VO0xQPC9T5qWxx1za6Z
 Ry/wHNMK4dGnQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Sebastian Wick <sebastian.wick@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
In-Reply-To: <20240410122008.38207-1-sebastian.wick@redhat.com>
References: <20240410122008.38207-1-sebastian.wick@redhat.com>
Subject: Re: (subset) [PATCH v2] drm: Document requirements for
 driver-specific KMS props in new drivers
Message-Id: <171316879419.200641.10651479011126419872.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 10:13:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 10 Apr 2024 14:20:06 +0200, Sebastian Wick wrote:
> When extending support for a driver-specific KMS property to additional
> drivers, we should apply all the requirements for new properties and
> make sure the semantics are the same and documented.
> 
> v2: devs of the driver which introduced property shall help and ack
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

