Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF79517A69
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 01:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC8C10EDF3;
	Mon,  2 May 2022 23:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC810EDF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 23:07:23 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nleSf-0005bu-N0; Tue, 03 May 2022 00:24:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wenst@chromium.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: Support YUV formats with U/V swapped
Date: Tue,  3 May 2022 00:24:05 +0200
Message-Id: <165153020899.255051.8265541516247012144.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220114074038.2633848-1-wenst@chromium.org>
References: <20220114074038.2633848-1-wenst@chromium.org>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jan 2022 15:40:38 +0800, Chen-Yu Tsai wrote:
> The VOP in Rockchip SoCs that support YUV planes also support swapping
> of the U and V elements. Supporting the swapped variants, especially
> NV21, would be beneficial for multimedia applications, as the hardware
> video decoders only output NV21, and supporting this pixel format in
> the display pipeline would allow the decoded video frames to be output
> directly.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Support YUV formats with U/V swapped
      commit: 3fa50896c35982afb59ad5bcbe04ec2e91bb54a5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
