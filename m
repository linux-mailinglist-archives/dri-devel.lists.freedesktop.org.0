Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51928AAD92
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1239C10E68C;
	Fri, 19 Apr 2024 11:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108A010E5F7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:19:13 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.intern)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rxmGk-0000RL-88; Fri, 19 Apr 2024 13:19:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: vop2: Do not divide height twice for YUV
Date: Fri, 19 Apr 2024 13:18:56 +0200
Message-Id: <171352551020.2525344.5153295478231203220.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240414182706.655270-1-detlev.casanova@collabora.com>
References: <20240414182706.655270-1-detlev.casanova@collabora.com>
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

On Sun, 14 Apr 2024 14:27:06 -0400, Detlev Casanova wrote:
> For the cbcr format, gt2 and gt4 are computed again after src_h has been
> divided by vsub.
> 
> As src_h as already been divided by 2 before, introduce cbcr_src_h and
> cbcr_src_w to keep a copy of those values to be used for cbcr gt2 and
> gt4 computation.
> 
> [...]

Applied, thanks!

[1/1] drm: vop2: Do not divide height twice for YUV
      commit: e80c219f52861e756181d7f88b0d341116daac2b

But changed the subject to
    drm/rockchip: vop2: .....


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
