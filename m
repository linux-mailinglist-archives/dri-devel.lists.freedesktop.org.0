Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA679129C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F84B10E2BF;
	Mon,  4 Sep 2023 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5B10E2BF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:54:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 89DD8CE0E29;
 Mon,  4 Sep 2023 07:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4CDC433C8;
 Mon,  4 Sep 2023 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814036;
 bh=dmzqGBUff9Yr13wXotSze7kw3hfPIZnUlWO8Z7MFVDM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=sTpFZGD31/ErzSQUGdXIniQKZ7n8p3JabQI3T6vZztfL0eo8PaOJ9lDBdlFvCSTe3
 TKFodxyxa53YGHnwW/ukm0E45tcKRsO7KMSeWuQ37pLMjnk0LxjgqnjfapNJXABrFV
 /hYRfyISO3fAoZzGHZdmqfmhZ+8b5fde8rYTYKSnmpTr0O0xiofuNHnAf+Pu9zlxDe
 BrSoKAMOFg68XWRn89XDbNbqczpwyFX3C0IumQxRpT780HWaWNFWog3CLinGBdX4NQ
 ztrZ+ngF852fUrgUozz31f4mfzYVAtHDUvCv9ji9Noer+T4fDmtXiCg/Fc6wuD/jx0
 ynu/Y296+EfSw==
Message-ID: <98537f0b4fb383f5f41f4d3819481df5.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:53:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
In-Reply-To: <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
References: <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
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
Cc: linux@armlinux.org.uk, Maxime
 Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:12 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
