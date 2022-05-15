Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4252799A
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 21:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD06C10E1F2;
	Sun, 15 May 2022 19:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4BC10E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 May 2022 19:47:51 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqKDV-00064B-PE; Sun, 15 May 2022 21:47:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Peter Geis <pgwipeout@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] add Pine64 touch panel support to
 rockpro64
Date: Sun, 15 May 2022 21:47:47 +0200
Message-Id: <165264375744.2524444.9780498055058874635.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511113517.4172962-1-pgwipeout@gmail.com>
References: <20220511113517.4172962-1-pgwipeout@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 07:35:13 -0400, Peter Geis wrote:
> Good Morning,
> 
> Apologies Heiko on taking so long for this v2.
> 
> This patch series adds support for the Pine64 touch panel to the
> rockpro64 single board computer.
> This panel attaches to the dsi port and includes an i2c touch screen.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: rockchip: add pine64 touch panel display to rockpro64
 ... for 5.20 .

The binding- and driver-change most likely won't reach drm-main and thus
the next merge-window in time, so I've put the dts patch on a branch for
5.20 instead.

I've also made some ordering changes and dropped both the "force X to vopY"
parts. DT is a hardware-description and not a configuration space ;-) .
And a devicetree should definitly not try to work around implementation
deficits of the kernel driver.

Both VOPs are capable of driving both hdmi and dsi with their relevant
deficiencies being in terms of resolution or clock rates I guess, so
anything related to selecting a matching VOP should be done in code in
the kernel.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
