Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91EBB57F89
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D7310E4D6;
	Mon, 15 Sep 2025 14:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FqXeQ9/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FB610E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:52:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5CCC402EA;
 Mon, 15 Sep 2025 14:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E63C4CEF1;
 Mon, 15 Sep 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757947973;
 bh=RlgkNdnWQ5dTMluE1r0no4k85o7lN8vC1qiDzEi0o1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqXeQ9/qGMI3Xz8b/u13HhaAN30nR3xuJgGTTixqhp3D8kOkTbPhDQ0eAkP2tpKdO
 VG1V3FMAvMrME64Dwpm0REXMmZVRGLdeMfrBrtTD9PW8tt4T64JlHtl08Q0s95xpSp
 OOTrOKCMfiru9V78lj/zyVjLhjq49sukE654Q2UcDx+4SsLCLua3mLsVd//P2fOEMT
 faryL7F97MuR9JJO6b4QrlI1vxbNwT/Ajuo1jVMmufOqBVJNNoSR8vPw3kkUAlc9Le
 fud8gm6CdbgCD4H4zdIpa57utEou+HsfskAO9ETfJpaLhf23OJHbR47Hzh63kspoCx
 tOraXDjDEu3YQ==
Date: Mon, 15 Sep 2025 15:52:46 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
 j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 12/15] backlight: led_bl: Include <linux/of.h>
Message-ID: <aMgoPjEoogukj9uj@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-13-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:49PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare struct of_count_phandle_with_args().
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
