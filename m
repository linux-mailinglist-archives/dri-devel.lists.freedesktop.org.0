Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A99898FF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 03:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4A410E39C;
	Mon, 30 Sep 2024 01:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AJvM3ifZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3DB10E38B;
 Mon, 30 Sep 2024 01:44:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53A905C4840;
 Mon, 30 Sep 2024 01:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E7BC4CEC5;
 Mon, 30 Sep 2024 01:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727660696;
 bh=+ywpN1hDCN9fASlkN+6O9aIiu5Jb04ujXzcqkNzfXQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJvM3ifZvu8grGOPE3vToZa70kman3X3CFEA9tUl3xLAJXGvT6tmoRAUgJNfnISoW
 RAEM8Ml7IwLQ+7A7a5c0OMl+rRbZ7xePfqmnQ5+XTrk2w/xc2qU5Ky5EyoGVgiGjGn
 QN85zLrzDSJTqqnfV3yR4agplLQbvw3Bb87erA43PJsaSJVVFKquC8y6TBAwIU16Iz
 0lPoYqQ6ISCzPyU40SF+XpqAGmODIs0IA3uWUORyTrFnBh7KakzoBuckjGI0kFFAzV
 /2ygWUXfcD9Di23b6zHDKd/817C8S95VsYOiTmyoQ85fwO00xlCszKWMS1mo1b9ZCx
 CruDd3erULKYw==
Date: Mon, 30 Sep 2024 01:44:52 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Julius Werner <jwerner@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 chrome-platform@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hugues Bruant <hugues.bruant@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 0/2] firmware: Avoid coreboot and sysfb to register a
 pdev for same framebuffer
Message-ID: <ZvoClJ8lqwH0Bdbj@google.com>
References: <20240916110040.1688511-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916110040.1688511-1-javierm@redhat.com>
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

On Mon, Sep 16, 2024 at 01:00:24PM +0200, Javier Martinez Canillas wrote:
> This is v4 of a fix to prevent both coreboot and sysfb drivers to register
> a platform device to setup a system framebuffer. It has been converted to
> a series since contains changes for both drivers, to prevent build issues
> on architectures that don't define a global struct screen_info.
> 
> Patch #1 adds a sysfb_handles_screen_info() helper that can be used by
> drivers to check whether sysfb can use the data set in screen_info or not.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/2] firmware: sysfb: Add a sysfb_handles_screen_info() helper function
      commit: 6074e905023d09f64f2c896f475820a5623deb2c
[2/2] firmware: coreboot: Don't register a pdev if screen_info data is present
      commit: 67f488dff17e535ac3a8a52b47ff1363d8134983

Thanks!
