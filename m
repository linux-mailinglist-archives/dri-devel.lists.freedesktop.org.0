Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A15B84F1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38EE10E53C;
	Wed, 14 Sep 2022 09:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294CC10E53C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:27:38 +0000 (UTC)
Received: from [89.101.193.68] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oYOg3-0004qR-32; Wed, 14 Sep 2022 11:27:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Nathan Huckleberry <nhuck@google.com>
Subject: Re: [PATCH] drm/rockchip: Fix return type of
 cdn_dp_connector_mode_valid
Date: Wed, 14 Sep 2022 11:27:24 +0200
Message-Id: <166314762584.32089.13970704876797531888.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913205555.155149-1-nhuck@google.com>
References: <20220913205555.155149-1-nhuck@google.com>
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
Cc: David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Sep 2022 13:55:55 -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
> 				     struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
      commit: b0b9408f132623dc88e78adb5282f74e4b64bb57

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
