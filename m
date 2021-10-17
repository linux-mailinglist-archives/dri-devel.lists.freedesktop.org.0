Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4F6430C72
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 23:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873F76E02D;
	Sun, 17 Oct 2021 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C001F6E02D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 21:52:39 +0000 (UTC)
Received: from p508fd4f7.dip0.t-ipconnect.de ([80.143.212.247]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mcE56-0004w2-3u; Sun, 17 Oct 2021 23:52:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop: Add timeout for DSP hold
Date: Sun, 17 Oct 2021 23:52:33 +0200
Message-Id: <163450753814.562592.2607935368161273314.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008153102.1.I2a5dbaaada35023a9703a8db7af501528fbb6e31@changeid>
References: <20211008153102.1.I2a5dbaaada35023a9703a8db7af501528fbb6e31@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 8 Oct 2021 15:31:04 -0700, Brian Norris wrote:
> If hardware is malfunctioning (e.g., misconfigured clocks?), we can get
> stuck here forever, holding various DRM locks and eventually locking up
> the entire system. It's better to complain loudly and move on, than to
> lock up the system.
> 
> In local tests, this operation takes less than 20ms.

Applied, thanks!

[1/1] drm/rockchip: vop: Add timeout for DSP hold
      commit: 085af7d28897deb08a4f64a29e55525f963cc041

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
