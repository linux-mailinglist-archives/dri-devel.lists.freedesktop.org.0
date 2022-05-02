Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A9517A6A
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 01:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5210EE08;
	Mon,  2 May 2022 23:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F310EE01
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 23:07:25 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nleSf-0005bu-Cw; Tue, 03 May 2022 00:24:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Tom Rix <trix@redhat.com>, hjc@rock-chips.com, daniel@ffwll.ch,
 airlied@linux.ie
Subject: Re: [PATCH] drm/rockchip: cdn-dp: change rk3399_cdn_dp from global to
 static
Date: Tue,  3 May 2022 00:24:04 +0200
Message-Id: <165153020899.255051.8052745569188083636.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421144304.586396-1-trix@redhat.com>
References: <20220421144304.586396-1-trix@redhat.com>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 10:43:04 -0400, Tom Rix wrote:
> Smatch reports this issue
> cdn-dp-core.c:51:20: warning: symbol 'rk3399_cdn_dp' was not declared. Should it be static?
> 
> rk3399_cdn_dp is only used in cdn-dp-core.c so change
> its storge-class specifier to static.

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: change rk3399_cdn_dp from global to static
      commit: 7494b1ed1df414e43dc8429f0c016b2054b1b5da

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
