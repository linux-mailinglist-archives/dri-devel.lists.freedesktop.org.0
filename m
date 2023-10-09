Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5B7BEC65
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CED810E2E8;
	Mon,  9 Oct 2023 21:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EDC10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:11:38 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qpx07-00058Z-Dy; Mon, 09 Oct 2023 22:37:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: David Airlie <airlied@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sandy Huang <hjc@rock-chips.com>, Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Fix some error handling paths in
 cdn_dp_probe()
Date: Mon,  9 Oct 2023 22:37:10 +0200
Message-Id: <169688381986.192795.11170132261049443621.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <8494a41602fadb7439630921a9779640698f2f9f.1693676045.git.christophe.jaillet@wanadoo.fr>
References: <8494a41602fadb7439630921a9779640698f2f9f.1693676045.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Sep 2023 19:34:31 +0200, Christophe JAILLET wrote:
> cdn_dp_audio_codec_init() can fail. So add some error handling.
> 
> If component_add() fails, the previous cdn_dp_audio_codec_init() call
> should be undone, as already done in the remove function.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
      commit: 44b968d0d0868b7a9b7a5c64464ada464ff4d532

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
