Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B3901F9A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B1510E32F;
	Mon, 10 Jun 2024 10:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TkzfbU2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A29C10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:46:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6CCACE1192;
 Mon, 10 Jun 2024 10:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C32C2BBFC;
 Mon, 10 Jun 2024 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718016365;
 bh=ZvmWNkqtnIkP/GSS8Mvn1rp3F3QT+Ac9zEEHAh777Ok=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TkzfbU2GWOQ14hYlAbuLwNfRKI4I7XPPqDyZcaA6q30GJbqVm/MX0K7ydInP7XdUV
 fhBRPQynK6wre7Tt2Z6CSCVZoWtWzlxiUSseR7rPA+J9CS2kSLgqrrOzGo+q04OwGI
 uGsAs+C7qKfG/eMOUKAE0MSwWKwKIRH9hYG4Gxou637P1Unrf9Yd2tyUMKzMIiHVqB
 MODIT7cz3wiCyI+jISBPXbnsK5AFNoPe+/ZDXAV/MgdfOjk2i6DHZRQlWj8QdrZJVW
 DsWXgsNZFI/r1w3AA3VsUbwb+98rYCDHKxAUFsVFLF+ldtIzWaaK86WOjY//TVJFCo
 yAGZQPtTVO3Ow==
From: Maxime Ripard <mripard@kernel.org>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
References: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
Subject: Re: (subset) [PATCH] drm/tiny: add missing MODULE_DESCRIPTION() macros
Message-Id: <171801636247.423417.4844444283186848367.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:46:02 +0200
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

On Sun, 09 Jun 2024 10:20:27 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

