Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E207FB7A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65BE10E4B0;
	Tue, 28 Nov 2023 10:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D340C10E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8D1DAB83A09;
 Tue, 28 Nov 2023 10:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6646EC433C7;
 Tue, 28 Nov 2023 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167173;
 bh=cUa4ZlT2wSGqeoteiiVi9GhpPWDTIxakVCkbOrAWqhE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W4G1+yHf4q4qdzWaCZ0zaZPPwnZ/tZIjmiCHIlYpugGhS2FL+kwZigcQ/qanYEv+4
 EIWfy2NIXA3qWL1DbqztIeKrNayT/LDe0joxo2kICSS6/3rucmk9xaT+7nC3oOju0n
 aYK32vV/ceIRD4F9Pmg8chQ0vNCFhVBchBY0Fh4EPD3ev1WiPa1zM+Qpb6jhTr33gi
 IOo/NutJaRTsGCEYklCjtRiazWKO558LysQ5uJ49+GYr6fCNOxUH0vzJSzjPZTN47y
 pq56dFgNHN+uBy6yII96q8shvhjKlpSXxul456JC9bbjn1YB6+CTXJGXqiXpMkgY8t
 wP3dVjPVtzAPg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:50 +0100
Subject: [PATCH v4 39/45] drm/rockchip: inno_hdmi: Remove unused drm device
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-39-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cUa4ZlT2wSGqeoteiiVi9GhpPWDTIxakVCkbOrAWqhE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y/Pdd0bzHQv4ciEvveMrg8PivQclp22IO5jwVq93
 unblu851lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJPH7L8L/SMrxDvOHuz/2v
 whdpzW/0ct+p+SXZbldkXrgfk7yUbgsjQ4+YLduC1b+jpQtuXJHfHGXdrW15pqH71aVVWx6tnRL
 3kx8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_dev field in the inno_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index ed1d10efbef4..d0b463d166fb 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -39,7 +39,6 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 
 	int irq;
 	struct clk *pclk;
@@ -732,7 +731,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))

-- 
2.41.0

