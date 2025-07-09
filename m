Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96BAFE99B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3F810E7DF;
	Wed,  9 Jul 2025 13:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gj9JZTCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1BE10E7DF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:04:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DA145C689E;
 Wed,  9 Jul 2025 13:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3603C4CEEF;
 Wed,  9 Jul 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752066285;
 bh=E4QmnJBfVzoQ0/BAIJV41b1E9Z0Jit+/5FgOr0vgfAQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gj9JZTCRvBDYCXOAb3A22H5HSKxMFEiwwEzsAz+AfkE0zEG7E1yI3PyhQ+t7Uko0B
 5iioB5iEVAgf3DfiJqw/rF5V8lYtvc4OpNFU3Wl/0Vo2DaATnZ9KAGmqPGftva31gH
 6pxhLyMbsHX7xCCpjaeyrWyOOwrkODjkAwkoexuFMNSOmxqaAhCtRH8qMYJpXkH/BQ
 Sez2hHEM3E0jMVtIwtZqDF8z/xvfQJf3WXnx6p+xqFWqF/KaG5bms2wxNE3IJpLIZa
 gqdmBIKlsbMU5sXqHA+2Fcco6vgmrmG0Almos642b4JZNlP3Ru2a8zxc1D8J9kRTgR
 U+vB/g7aAFhDg==
Message-ID: <79f15b1a7f7e138807e25a4bc310fb11@kernel.org>
Date: Wed, 09 Jul 2025 13:04:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 5/6] drm/panel/ls043t1le01: Use refcounted allocation in
 place of devm_kzalloc()
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-5-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-5-630902123ea1@redhat.com>
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

On Tue, 8 Jul 2025 15:35:17 -0500, Anusha Srivatsa wrote:
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
