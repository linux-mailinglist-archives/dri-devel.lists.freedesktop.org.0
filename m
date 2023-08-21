Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32367827C4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEFC10E230;
	Mon, 21 Aug 2023 11:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B08310E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 11:17:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7265D6152D;
 Mon, 21 Aug 2023 11:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FEBC433C7;
 Mon, 21 Aug 2023 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692616655;
 bh=V/jiRj5wmrCoPlTqxTwhl6K9aF48O4FnW83gBBmAXtw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=DQ4LIs0gYWuj/vywUoTgThh6rWDgJROGSzxuu3tA2nHYjbSfxv6aQ97oGZ7RWk1S1
 6n2M0PC5ncMJRsovFV9xr/6+HAClf/9TRK7CF4oRiciaWC7rUlXZTMTngTPw3dK//M
 e90wLhDmrtzEA7CIYwBx0fwSPznTikYrH18rkXMaVYwWos8ZAMP+QpEFP7aC6rVHpm
 qi56oawtf5bnj32baNKkBe8f/UOwl9MsBRrn7zsL8XOBRrznpp+ElsexPb7ICEt1x4
 OxIm4BOw05M6fQiaXoCPlqiVKHBCiK2irITjBzb9bP7Xu1bZytp6ZoFEu6DXRSKTXL
 ySDlNcetDqn0g==
From: Lee Jones <lee@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230818012308.2058373-1-ruanjinjie@huawei.com>
References: <20230818012308.2058373-1-ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next RESEND] backlight: led_bl: Remove
 redundant of_match_ptr()
Message-Id: <169261665381.1545342.12598274786028807236.b4-ty@kernel.org>
Date: Mon, 21 Aug 2023 12:17:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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

On Fri, 18 Aug 2023 09:23:08 +0800, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> 

Applied, thanks!

[1/1] backlight: led_bl: Remove redundant of_match_ptr()
      commit: a4464092f2c514a7f0788906d340f0bab59fdd73

--
Lee Jones [李琼斯]

