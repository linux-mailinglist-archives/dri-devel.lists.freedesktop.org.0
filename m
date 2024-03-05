Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74BB871D30
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66011112A1F;
	Tue,  5 Mar 2024 11:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VHz02/Vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B253112A1F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:16:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E3D361335;
 Tue,  5 Mar 2024 11:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC864C433C7;
 Tue,  5 Mar 2024 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709637398;
 bh=82TnKfQxhHPjvfZNCare+xueMxM6O7riM34Cl4yT29A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VHz02/Vlmmgs+VZkkiPHpYARitSl3d8bv0NqhnAP4k3UbVa0k/waPiQuyS1dZd2ng
 hpv1GPyNlmmHgdrzdmOxwd2fk9ZXbFqJouaDVbIWSs94VT/F4T5B86dti3BA8YplSL
 rkVxi+8AkN3+xz4Yas5aPdAPxFy63OHOOmfPNeTCBnFTAAyWlsBwTaBHZZnCR7Gajo
 kEjVzskUdO7xG6YJ7/ZW+WPTfVNhbcXpbG7Ovelb0F0supgt8uBzIdYG6ni9qskoBS
 J54JUiVrt0u8vIAlXaceVT6sJa4udfa1g98dZ0/xhzlACv+C+qqAJ4D5U1NhZN4uHZ
 c0Vu4yZtwBvHw==
From: Maxime Ripard <mripard@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo <eballetb@redhat.com>, 
 Andrew Halaney <ahalaney@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
References: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
Subject: Re: [PATCH] drm/tidss: Use dev_err_probe() over dev_dbg() when
 failing to probe the port
Message-Id: <170963739518.522738.2603963239528747970.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 12:16:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Feb 2024 14:12:06 -0600, Andrew Halaney wrote:
> This gets logged out to /sys/kernel/debug/devices_deferred in the
> -EPROBE_DEFER case and as an error otherwise. The message here provides
> useful information to the user when troubleshooting why their display is
> not working in either case, so let's make it output appropriately.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

