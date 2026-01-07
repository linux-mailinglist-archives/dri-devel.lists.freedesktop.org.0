Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D2CFBB7D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 03:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05F610E075;
	Wed,  7 Jan 2026 02:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ehZIrb8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 02:28:06 UTC
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F3C10E08A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 02:28:06 +0000 (UTC)
Date: Tue, 6 Jan 2026 21:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1767752489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqTAq6UdlzaogcPYJn6AWvI2VKiD2JxVWHRitVZZiLs=;
 b=ehZIrb8AqR+gLw2vbmSD/SF5fLe5dLO39wGkedefjDQzmNLtK33Tx0aC3PkOHVpVdeFawe
 j04w2PA0tAV0eBybR5IA8JjCx1p3lTuoSJjBYBKA437j2CHgkKFwiawquJpDrJ1zMHQkHd
 PaP0XMIq2pOD4dEUU6sAlp2zTqmR40UJRWFIuc86VDryLIcc66d/dG/OXPrjGmH+/srjaK
 UCfEUZPUKb6xuE+5ndlg6ZXiXtIZGOtPpPVBbnHo/S/+/awiobFg+X6ulL5Rs6ix4E6+PZ
 /AKqNcTxdnEwKTbc6rHe02c+mYqma2We3fT9jhr4qtqGIXBxvgEs+oRuDHPa/g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
Message-ID: <aV3DENy3WoW7NRZO@fedora>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
X-Migadu-Flow: FLOW_OUT
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

Series is - Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks Janne!

Le Mon, Jan 05, 2026 at 10:03:44PM +0100, Janne Grunau a écrit :
> I will start with upstreaming the asahi DRM render driver. The UAPI was
> merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> driver implementing this fully.
> The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> user space drivers using this UAPI are available in mesa since 25.2.
> 
> This initial submission contains test infrastructure and tests for the
> ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> These two tests are the only ones the initial version of the initial
> upstream submission of the driver will pass.
> 
> I have additional tests which the downstream driver passes as well. I
> was planning to submit them together with upstream driver patches which
> implement the necessary functionality for the tests.
> 
> If preferred I could submit all tests and gate them based on the driver
> version to avoid expected igt-gpu-tools test failures against
> incomplete (as in not implementing the full UAPI) upstream driver
> versions.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       drm-uapi/asahi: Initial import of asahi_drm.h
>       asahi: Add test infrastruture for asahi DRM render driver
>       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
> 
>  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++++++++
>  lib/drmtest.c                  |    1 +
>  lib/drmtest.h                  |    1 +
>  lib/igt_asahi.c                |   58 ++
>  lib/igt_asahi.h                |   15 +
>  lib/meson.build                |    1 +
>  meson.build                    |    8 +
>  tests/asahi/asahi_get_params.c |   55 ++
>  tests/asahi/asahi_get_time.c   |   63 +++
>  tests/asahi/meson.build        |   14 +
>  tests/meson.build              |    2 +
>  11 files changed, 1412 insertions(+)
> ---
> base-commit: cef45b995557367ba082bc460fbab2190af943fd
> change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
