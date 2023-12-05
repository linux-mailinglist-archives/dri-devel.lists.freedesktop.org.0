Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4F805661
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B910310E53D;
	Tue,  5 Dec 2023 13:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EAC10E53D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:48:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 29AD2B81A3E;
 Tue,  5 Dec 2023 13:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1779DC433C9;
 Tue,  5 Dec 2023 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701784110;
 bh=jn888q/UcAkBrUFljQzymmIT9/ky6nNuCImiG8NUxw4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GQvVSKLjKBczB0uOh0OW9Ho7OYyhpyloy3cVfG8zhaolDFmLX7LptpKD1mG7K6jl9
 i2V1rzh5xoX+kaFCN+OxTWpir/A74TGXRBxW2e3sEOYh2h0zScP4CUJqtEOUkIzUq5
 2HyxmDb1BZj2HOsNmh59Uv506WC0rS2QuSVWtdn3g2UUZqr4zNVSaSV6PLQV/OXVOd
 Y06UqvN4UTjlFumukuqOt/irhEWxu6+AqSQEOl01ifo1oaPWmbj8Z/43jV9NUxzmTh
 SNskKpdNHuk3Lpkv45hVE413iKmakzcVKQFL+NrmhK9slFaxxe7Z6FEd+oHnuzw/0u
 T8htWUK03Qgfg==
From: Robert Foss <rfoss@kernel.org>
To: Sean Paul <seanpaul@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Message-Id: <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 14:48:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> The i2c_master_send/recv() functions return negative error codes or the
> number of bytes that were able to be sent/received.  This code has
> two problems.  1)  Instead of checking if all the bytes were sent or
> received, it checks that at least one byte was sent or received.
> 2) If there was a partial send/receive then we should return a negative
> error code but this code returns success.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876



Rob

