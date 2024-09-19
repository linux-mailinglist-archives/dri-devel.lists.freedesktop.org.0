Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C397C4FE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 09:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2310E248;
	Thu, 19 Sep 2024 07:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nS/18fNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB49D10E248;
 Thu, 19 Sep 2024 07:40:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B82FBA43B06;
 Thu, 19 Sep 2024 07:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5344DC4CEC4;
 Thu, 19 Sep 2024 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726731651;
 bh=gQRmcFYRoZm4qHxTTfbTBJ7+y1B2sC1lIyz//eggaQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nS/18fNUL1PdRlVmyNDtvYHS6AhOhe/5hxZcv94zW9lArDJrF3hccwdRBbRkmbSMR
 6A/znhPYqZguTWq1T/6AV3NZvXH9DjltxK2Fd76kh5VJNHbEOMqW36YjK6xevXx/uq
 KSRbfk88WMjgBj6ESfCMB0Z5ObyrVXqrbyHgf85UGyyRARxi8WZkRlUZ4g1yk6hYBi
 UctfmLg4Fa8Ta0HJf18F0uJ5XfEOizbSNVCDIIovKagdAoASh5gYpXKKBBT4sylrGD
 GAvHs1NXe0BhAcDDONy8ZOWejRyKyL6yCQJojIjFaG679RwGObnjzdVrzI0TnDR+AD
 b0ngA2VutG0mA==
Date: Thu, 19 Sep 2024 07:40:47 +0000
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
Message-ID: <ZuvVf5XRMqjD8G9T@google.com>
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
> The patches have only been compiled tested because I don't have access to
> a coreboot machine. Please let me know if you plan to merge both patches
> through the chrome-platforms tree or if you prefer to get merged through
> the drm-misc tree.
> 
> [...]
> Javier Martinez Canillas (2):
>   firmware: sysfb: Add a sysfb_handles_screen_info() helper function
>   firmware: coreboot: Don't register a pdev if screen_info data is
>     present

I'll queue both patches through the chrome-platform tree for v6.13 if there is
no objections.
