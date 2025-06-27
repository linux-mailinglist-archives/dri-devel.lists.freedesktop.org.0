Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78480AEB2C2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ABD10E99B;
	Fri, 27 Jun 2025 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JYsmuVEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658910E990
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:24:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E9F9C61120;
 Fri, 27 Jun 2025 09:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C54C4CEE3;
 Fri, 27 Jun 2025 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751016253;
 bh=+Od3wE0MGFoGPTGx1Gj5nP+HNuBZqUzPen/YCc0gtO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JYsmuVEKovtOUzfIabnNWZx4uk3ktHt55QJP98lONt/RCoDY6q8uRP68Rv/g1HxBJ
 tD1TyUtxMwOZuhEEGrRIjXqgGsepStH/ZK+jKbG21kqv/yrYrFBkEHHdCw68vT8P6J
 m39Irtk75Z4KpExqt90GKottBh0p8QfOkhadJnGVVW18ymWWLlNTQeyZrUOz1SZ3Wq
 gzB4IvtqIiF3Gsq1Au7YbZe9hooVjD556gsGjyEnriNSVuw7a11Y9h3q4mZ8J6TrtM
 ZGoYp1c+EQy3mqLEQbURVrKYJLu/MU6rKbAYc6COo+e1iQQtCOSzuEJ9zDQmg1HyL/
 bEFWDRiWYCVDw==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Date: Fri, 27 Jun 2025 11:24:08 +0200
Message-ID: <175101624570.44642.13183466384528927408.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
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

On Thu, 26 Jun 2025 12:04:58 +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.
> 
> Thanks!
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
