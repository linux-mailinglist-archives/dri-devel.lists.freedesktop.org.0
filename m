Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6ED7912AC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD4210E2C9;
	Mon,  4 Sep 2023 07:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F1710E2C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:55:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 06BB3CE0E21;
 Mon,  4 Sep 2023 07:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B78C433C7;
 Mon,  4 Sep 2023 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814140;
 bh=r99VUSvLYNfxVQAyOBt/A1/Dqy46dDKhqil9QP9bhIQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=JMmNVPSfJnujgERMh7PJj6OISDlgJjTrqFGqR+Is4V5R0sYCgPpUX/YeujAy21UTK
 wV7ywSrSRqJAPXbBZnTvL9EQnbZKfEMxEopCVt8byaOx4NdlORG156/lbZok/x67X8
 MQJbyaxAFKrt5QRwUKfVP/qbf6yQiO91nwbems5SvOUQTOmvcP56xfBAcQj+JzEmzW
 CNoZ6q9ZRJ34KaRRGXMFUuTjQjsbKFuGwmJ+goa2moc8Rjs07ydIbaOxB5eJlFRg4O
 I4uxTpWIcfZ9VXeuUdePN1tL/4xuXvixQHhlWNLUgJg6iwj9ixMY1DmAEEoQoTowLg
 TDz4klk967Y1A==
Message-ID: <4b3a93c9ab2432f8ae0e9282d9e00d2a.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:55:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 1/6] drm/atomic-helper:
 drm_atomic_helper_shutdown(NULL) should be a noop
In-Reply-To: <20230901163944.RFT.1.I906acd535bece03b6671d97c2826c6f0444f4728@changeid>
References: <20230901163944.RFT.1.I906acd535bece03b6671d97c2826c6f0444f4728@changeid>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:52 -0700, Douglas Anderson wrote:
> As with other places in the Linux kernel--kfree(NULL) being the most
> famous example--it's convenient to treat being passed a NULL argument
> as a noop in cleanup functions. Let's make
> drm_atomic_helper_shutdown() work like this.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
