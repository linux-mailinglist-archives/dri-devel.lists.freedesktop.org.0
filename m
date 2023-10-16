Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7C7CAB05
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 16:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E0010E1E0;
	Mon, 16 Oct 2023 14:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5910E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 14:11:48 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsOJd-00062e-DJ; Mon, 16 Oct 2023 16:11:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Tomasz Figa <tfiga@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/rockchip: Fix type promotion bug in
 rockchip_gem_iommu_map()
Date: Mon, 16 Oct 2023 16:11:26 +0200
Message-Id: <169746544051.926160.339275214162402772.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
References: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
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
Cc: kernel-janitors@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 rjan Eide <orjan.eide@arm.com>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Shunqian Zheng <zhengsq@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 11:01:48 +0300, Dan Carpenter wrote:
> The "ret" variable is declared as ssize_t and it can hold negative error
> codes but the "rk_obj->base.size" variable is type size_t.  This means
> that when we compare them, they are both type promoted to size_t and the
> negative error code becomes a high unsigned value and is treated as
> success.  Add a cast to fix this.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
      commit: 6471da5ee311d53ef46eebcb7725bc94266cc0cf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
