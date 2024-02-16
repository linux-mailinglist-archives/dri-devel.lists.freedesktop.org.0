Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8485892F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 23:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C24F10ECD0;
	Fri, 16 Feb 2024 22:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6FC10ECD0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 22:51:26 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rb73A-0005aX-53; Fri, 16 Feb 2024 23:51:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>,
	neil.armstrong@linaro.org
Cc: conor+dt@kernel.org, quic_jesszhan@quicinc.com, robh+dt@kernel.org,
 quentin.schulz@theobroma-systems.com, linux-kernel@vger.kernel.org,
 sam@ravnborg.org, krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH 0/3] drm/panel: add one more Leadtek panel,
 the ltk101b4029w
Date: Fri, 16 Feb 2024 23:51:18 +0100
Message-Id: <170812382120.3827147.1835380121153532051.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215090515.3513817-1-heiko@sntech.de>
References: <20240215090515.3513817-1-heiko@sntech.de>
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

On Thu, 15 Feb 2024 10:05:12 +0100, Heiko Stuebner wrote:
> Similar in setup to the ltk500hd1829, group it with this driver.
> 
> Heiko Stuebner (3):
>   drm/panel: ltk500hd1829: make room for more similar panels
>   dt-bindings: display: ltk500hd1829: add variant compatible for
>     ltk101b4029w
>   drm/panel: ltk500hd1829: add panel type for ltk101b4029w
> 
> [...]

Applied, thanks!

Adapted the commit message in the binding patch to show
where the panels are similar but also different (init-sequence)

[1/3] drm/panel: ltk500hd1829: make room for more similar panels
      commit: f9488c160d6e8e5e548452a0d36057a1f8c04045
[2/3] dt-bindings: display: ltk500hd1829: add variant compatible for ltk101b4029w
      commit: c71efc6337135670164334404ef11506b31b7a81
[3/3] drm/panel: ltk500hd1829: add panel type for ltk101b4029w
      commit: 239cce651ea617002ff26f068f2568b2baf6421a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
