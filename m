Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17DA6B9DF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630D310E7AD;
	Fri, 21 Mar 2025 11:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RSsMPZ2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEFD10E7AD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:27:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0104AA49147;
 Fri, 21 Mar 2025 11:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00132C4CEE3;
 Fri, 21 Mar 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742556449;
 bh=rvjzcfTIqsBtdQ3O3s16B5g9KwEuLjN4A+GexIfIzZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RSsMPZ2X1nNcVAJSFt7oZI9povVzRcXbTJFMcT831k7xReWgUtSWrQH9GTWOJa3pg
 ALsqL8vlJ0n74DbHxSAZPBE/RHnCaIPoZ52E2vuLPQSLiEf5LV4k3c0cgU3v3+lIGm
 tAPfqpHAVE5cZqgOD68wqCCptLgOhVxBPaSQbBDvbK3cfyEQe2vS/BCio3+SB785CT
 Ce0sYCMuL+/tSrInQ/UjhPWmnco37Vrs7G2zuOVThx3Q+AhHUU70N66tYlceb0S4DL
 vHDt9Biy88k2WpwV8axwpnFohs7OOyKy2s0rR+G7N18osea+0KjPBtNBz21XQqXYa9
 s4w3+6m2O/FcA==
Date: Fri, 21 Mar 2025 11:27:24 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <Z91NHP65X9GFIYOe@aspen.lan>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321095517.313713-9-tzimmermann@suse.de>
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

On Fri, Mar 21, 2025 at 10:54:01AM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from the lcd subsystem. Provide the
> helper lcd_notify_blank_all() instead. In fbdev, call
> lcd_notify_blank_all() to inform the lcd subsystem of changes
> to a display's blank state.
>
> Fbdev maintains a list of all installed notifiers. Instead of fbdev
> notifiers, maintain an internal list of lcd devices.
>
> v3:
> - export lcd_notify_mode_change_all() (kernel test robot)
> v2:
> - maintain global list of lcd devices
> - avoid IS_REACHABLE() in source file
> - use lock guards
> - initialize lcd list and list mutex
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
