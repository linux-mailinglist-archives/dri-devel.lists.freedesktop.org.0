Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CCA14FCF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 13:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0528110E23A;
	Fri, 17 Jan 2025 12:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XYCCzkeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB2910E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 12:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C9535C620D;
 Fri, 17 Jan 2025 12:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096F6C4CEDD;
 Fri, 17 Jan 2025 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737118791;
 bh=29ZeJ5djacspL093+9m3ViGC2896wijqy3gsmQtUwz4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=XYCCzkeDTFthZVowiQxiwKl/Zs0l31zwxw82ZoJFgtx9kJPiR8aqRl1VTIcIIv3oo
 FZvmGDABrIX9E217HLcSYAfggTd3shlFnkDISUoPL5yPY+od/uiZ2Wm7GWewN9y50P
 zjGYqofwX+c6flDt8XuKVi2VeUseQNDiMrsBnTd3IjHwfK5nwZJenq9Id9+8fqMcYg
 iAWg9mVmb+ZJS6B/5n8RiRkQr2cpTdfBS1Q1kKzqt0AIQ+CQUpcuTkfLG1ZGJB8EQt
 h2xDQ62q83Jb+GFvUmgrHd2cw1Dx0qEYQthMj0ahro5xM9gWAEQ7YC91SwA0SBccWf
 zEmvFBP+9RQcA==
Message-ID: <8ff0e8c069f5e1e2df8016597f99b11d@kernel.org>
Date: Fri, 17 Jan 2025 12:59:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v9 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
In-Reply-To: <20250116-google-vkms-managed-v9-3-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-3-3e4ae1bd05a0@bootlin.com>
Cc: arthurgrillo@riseup.net, dri-devel@lists.freedesktop.org,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, nicolejadeyee@google.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Thu, 16 Jan 2025 18:47:15 +0100, Louis Chauvet wrote:
> Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
> workqueue cleanup. The workqueue will be destroyed with the final
> reference of the DRM device.
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
