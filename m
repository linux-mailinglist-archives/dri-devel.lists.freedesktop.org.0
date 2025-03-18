Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FDA66FA6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770D610E458;
	Tue, 18 Mar 2025 09:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eKHjivh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3F410E458
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:25:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 462125C5816;
 Tue, 18 Mar 2025 09:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5EDC4CEDD;
 Tue, 18 Mar 2025 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742289918;
 bh=j1zdG4ZOjJIBP1tsoIN/vYQ8EZ6ZbGzdt1VixGyX+SU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eKHjivh/F5uMxgduy4ljIwL7yh2tC/xcxKqJYH02Q8jzUU0LWeu0g7uDMcuLAiEx3
 J8CZCseqQX1U0EzshnFHaCSjaJJdAsE8dFyRV7TVlMPa4LcdhHNi9lCKPYQTTV01Dh
 WVxxxLvMhaYEFALYH6SlxE3MXMB+Z9hO6nBvYlHAd35wvJAtFgXX/C025YPVerbo3x
 T01x1VmadmjyXpbWguHQqji9zEedtp7pMxYNACm+jyegWEvmHLvP+Oj4EtSQi5n1Ce
 aSZNUx1zFDmAhDV5XmE05gB7ht4hrxHUSFk56sl5sa98h0E1iLkyTtyaGOBtwlmr4y
 qUWpEWjKpeL+g==
Date: Tue, 18 Mar 2025 09:25:14 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 07/11] backlight: lcd: Move event handling into helpers
Message-ID: <Z9k7-lejr0NU-y1D@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-8-tzimmermann@suse.de>
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

On Thu, Mar 06, 2025 at 03:05:49PM +0100, Thomas Zimmermann wrote:
> Move the handling of display updates to separate helper functions.
> There is code for handling fbdev blank events and fbdev mode changes.
> The code currently runs from fbdev event notifiers, which will be
> replaced.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
