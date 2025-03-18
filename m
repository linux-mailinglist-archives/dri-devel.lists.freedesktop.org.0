Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CCA66F4B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262110E43B;
	Tue, 18 Mar 2025 09:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZjhFxyND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E9810E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D8DCBA48EC0;
 Tue, 18 Mar 2025 09:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5D0C4CEDD;
 Tue, 18 Mar 2025 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742288861;
 bh=IHci5lRxtBx9YJ3KtlM88aIeZwODGFyVgGYkUDGWHEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZjhFxyNDerX+cAU//b+bfZ46cBK2tc7+1OBVTHv2aVNbqukpkAbTUsGTgHNKIU6g9
 ZVb2Ugzk+s2RNW7Md/prcMBthdBTVzTMBppRZ9DIKt5bfWBRb2KF+dhe8cJQXoQ1Ef
 LBU6AqVSb+QCffsHpMCPL3qIACIVlkc/2MH7yMrsfFKbIeyOIlTtCSVoI4YriVtgl1
 qXFksAbfhmf1y5k7Ct9kTlGQ2Wlci8WQMC8S1nRflfoTA7Z/EMSRq9YCBc9tFr4Qr+
 A40+p6aLQQVbyns4Mpq6bayabZjbIuwa/yBpxR2PLUmazLlQMk/7wfH7Ut45FuqBPL
 L8O4Q+YMuKvCA==
Date: Tue, 18 Mar 2025 09:07:36 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 05/11] backlight: Move blank-state handling into helper
Message-ID: <Z9k32GMvv4KSu_Sl@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-6-tzimmermann@suse.de>
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

On Thu, Mar 06, 2025 at 03:05:47PM +0100, Thomas Zimmermann wrote:
> Move the handling of blank-state updates into a separate helper,
> so that is can be called without the fbdev event. No functional
> changes.
>
> As a minor improvement over the original code, the update replaces
> manual locking with a guard.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
