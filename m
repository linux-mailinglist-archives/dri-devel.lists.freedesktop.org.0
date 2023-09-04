Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB8791234
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0010E2BC;
	Mon,  4 Sep 2023 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2DB10E2B9;
 Mon,  4 Sep 2023 07:30:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18A1A61209;
 Mon,  4 Sep 2023 07:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881FAC433CB;
 Mon,  4 Sep 2023 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812613;
 bh=9NOrAiqzUZ6+zYyOrUBxeZ6qQTkIQJkolBNmv9q78q8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=NM2dJFERH4BRPJ+D3W4WuU1mRBGJo+8jJ1h4QG2Hjgyl489nFlTzJ4e2HCfUcEa/n
 KAyqWUpRkHO3ZsSSP5IjTim7QrGW8eaK9UgiGKHZsVaEKiIpsbvOnqZ80mfP04aXQz
 aCGOqSn/s/keIuxbqkLdG1wFsF4NnR9uLehGZykcMEjYXtC1IoocHjJXhIsiYmAmuv
 241ePTHSXASLzmTQ7DIfaueiGTMYVj0/oN/Leip4dP+KhvUei7LrBhCO+iB5HT+yk2
 YebkFjly1eKIXSFkpqRQAZHjs8cwJMfVMGleUmopqmJ2d79cdp8XoiWZ6WLmBjBt7d
 Mbrd2gb5STJhA==
Message-ID: <5a1537b6dc242347783dbe17b055a887.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:30:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 14/15] drm/radeon: Call
 drm_helper_force_disable_all() at shutdown/remove time
In-Reply-To: <20230901164111.RFT.14.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
References: <20230901164111.RFT.14.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
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
Cc: Maxime
 Ripard <mripard@kernel.org>, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:25 -0700, Douglas Anderson wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown(), or in this case the
> non-atomic equivalent drm_helper_force_disable_all(), at system
> shutdown time and at driver remove time. This is important because
> drm_helper_force_disable_all() will cause panels to get disabled
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
