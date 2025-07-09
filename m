Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A62AFE98C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA410E7E2;
	Wed,  9 Jul 2025 13:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uOLw40w2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09810E7E2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:01:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4DA9613B2;
 Wed,  9 Jul 2025 13:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218F1C4CEEF;
 Wed,  9 Jul 2025 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752066118;
 bh=dgldGePdo0xYCQ3xi+K9t7xCMnl8Jb1Lx8R9fGeh2ro=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=uOLw40w2x4vhX18cvGXbjND6UpMxhTx0tb90K1KNDdtH+Pr8CcxSE20fAKs3+8mJN
 VE8kvGxD0pQdzJO5fj39D48ciB+7EY3Avi523Fj/JzRyf9zakrwJN7ZMXcHocSS1XQ
 eQQm9A61bu8HtlJFzOsSynnhp537l+hNgz6JwfXsr8JlviH+dAW+hGAY9Zev4RQsI8
 lb8jYmDKb07tOFD1fZ5/n+zCzTL40W4//PKNaKJQH28HZoxmmfJZ1X/vAFXihwU0Az
 QmpjJ9Pr0Q2G1QNNsiMZWN3Q0y7MI+Kfglc9u350PhpURdVPxb/x1JkCl0qKYuDyby
 v1mainYJeTViw==
Message-ID: <36860f45ff9311707fcf4028217466bf@kernel.org>
Date: Wed, 09 Jul 2025 13:01:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 2/6] drm/panel/truly-nt35597: Use refcounted allocation
 in place of devm_kzalloc()
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-2-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-2-630902123ea1@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 8 Jul 2025 15:35:14 -0500, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel. In the call to the new API, avoid using explicit type and use
> __typeof() for more type safety.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
