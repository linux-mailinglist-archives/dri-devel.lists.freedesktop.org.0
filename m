Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490F413099
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E446E912;
	Tue, 21 Sep 2021 09:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922126E912
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:12:24 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mSbp5-0001bM-FU; Tue, 21 Sep 2021 11:12:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, hjc@rock-chips.com,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel-team@android.com,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, airlied@linux.ie,
 linux-arm-kernel@lists.infradead.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused
 warning
Date: Tue, 21 Sep 2021 11:12:17 +0200
Message-Id: <163221552907.1876143.10392170678364292267.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210911034317.1719619-1-palmer@dabbelt.com>
References: <20210911034317.1719619-1-palmer@dabbelt.com>
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

On Fri, 10 Sep 2021 20:43:18 -0700, Palmer Dabbelt wrote:
> cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
> unused function warning is triggered undner !PM_SLEEP.  This marks the
> function as possibly unused, to avoid triggering compiler warnings.

Applied, thanks!

[1/1] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
      commit: f7c57a4566115657c16fd6603b6ef8a21bae5194

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
