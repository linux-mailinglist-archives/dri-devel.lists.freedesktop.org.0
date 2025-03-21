Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA94A6B9DB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7473C10E7AC;
	Fri, 21 Mar 2025 11:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9VFGP+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20A10E7AC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:26:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C698B615CE;
 Fri, 21 Mar 2025 11:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8A0C4CEE3;
 Fri, 21 Mar 2025 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742556390;
 bh=oIXbbNCkaseqpieTiSdrkNX3iw0rOQQiUfY5EkA1+Pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9VFGP+aMsESMR3fUMqSmy42B1aE3a6EPUk7uOSFDvJ8dGHDZQ0vaIDk6Az+EojrC
 CofkyQx8ca4WF0lM0kQcQ7SAqZMT7KPa/k7aaSh+6L+LaVTe/0P7QIr6RcWDTYyBsy
 66JxnYlc6PmzBROANs2yj9kNVyXZ6cCH0/sS3+w6QG7zdtOtBuqjRCTYJRgoCiBtUt
 rZtKkfB8phCH+xLMbm5tbzBMOmSW/if8/wQ3ylGvnOXhx3nC5XvjcFPeoA0sYV+FHX
 mNzOGwey3hXy+W7ScDAuSbMHgBqhoEU5dy6VFkQJ+6L3cW8zW3Wec94p4rBw9TPO4F
 zXGSs0cR6LOIA==
Date: Fri, 21 Mar 2025 11:26:25 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <Z91M4fxbAUJOJy5E@aspen.lan>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321095517.313713-7-tzimmermann@suse.de>
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

On Fri, Mar 21, 2025 at 10:53:59AM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from backlight subsystem. Provide the
> helper backlight_notify_blank_all() instead. Also export the existing
> helper backlight_notify_blank() to update a single backlight device.
>
> In fbdev, call either helper to inform the backlight subsystem of
> changes to a display's blank state. If the framebuffer device has a
> specific backlight, only update this one; otherwise update all.
>
> v4:
> - protect blacklight declarations with IS_REACHABLE() (kernel test robot)

I was convinced by the replies to other things in v4. Thanks!

> v3:
> - declare empty fb_bl_notify_blank() as static inline (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>


Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
