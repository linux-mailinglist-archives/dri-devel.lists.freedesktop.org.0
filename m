Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E079A77E7F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B213B10E5BD;
	Tue,  1 Apr 2025 15:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nE6OsoDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCA510E108
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:05:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C45DB5C5CE9;
 Tue,  1 Apr 2025 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB2CC4CEE4;
 Tue,  1 Apr 2025 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743519907;
 bh=KRgV7yJH945Q5nu3x0ZiSC+43M9bs5mHPyrtYvEUW7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nE6OsoDElJSJlzX9Vsj/7LjL0iPhy1OliuuDGUDFixP5oEZAEjtFYxUV+edeJg8+i
 kyfD1kiObZk9fh/D6FNa7Jff6E0dEl0SdxWRIEuBOnPiSJ9pjjx1dJdtS9VdpdJXyu
 wq12rSlwURBch0HWBRMoWa0OIEoR+9Lr9HxoTdgzotLZY+DFj9lXY+nKiTBy2QS9yS
 EkHYbb4DhxwGBiEOWh99Z6uo6BsIPit0HUQ6ejoG0oyi2S5jtHSbr/xasjySsK1/z7
 fQiesMBXbdtnRA1kKNdrQK9j6iPqj6RlDhg+KJcf6ol+JAVXwBLgfc2T8a5sxfXhAE
 C3iWfqulultUA==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 0/4] drm/panel: Panel Refcounting infrastructure
Date: Tue,  1 Apr 2025 17:05:02 +0200
Message-ID: <174351989816.2705096.7881070574042680174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
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

On Mon, 31 Mar 2025 11:15:24 -0400, Anusha Srivatsa wrote:
> This series adds the infrastructure needed for the refcounting
> allocations for panels similar to Luca's efforts with bridges.
> Underlying intention and idea is the same - avoid use-after-free
> situations in panels. Get reference to panel when in use and put
> the reference back (down) when not in use.
> Once this gets approved, rest of the drivers will have to be
> mass converted to use this API.  All the callers of of_drm_find_panel()
> will have to be converted too.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
