Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C397674F0D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855E910EA72;
	Fri, 20 Jan 2023 08:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4097B10E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:49:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h24so309694lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tYQWEbUqqtKGBVD+CO4A492dYz/WsYLmCYf41kZNY0=;
 b=n4+uFCk4bo7SZ7RmgW5WWFS2/uh17oFHi2Wu9OV80FtxP/hAJM9pjaHBJ5mpNMX4zp
 iqUbr25lWZiyYIdkoLZHprxJ4JDQEiSqI7v0q/QYCLR3UBEKWET2ObvRHhWUKDyvsB2s
 YObPiYCnEY0r7z+Keof0aqnZ1Zi5fNiEVxqf5FsInWplXEqz/kqY1BirhVrF1e8YKUuq
 fkW05KcHdREfG9ceIUhO+7zrn3HBd5vnYGE0aAo2VdY+Cnz7OlDJj/JN5qfDJUxYqRBB
 CADly1MC2ftqbiAlNtjs0w5MBnay+SAahDiPJ7cUj9iSDgEtV2qFXwdkpcv6hBBR7nTq
 rkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tYQWEbUqqtKGBVD+CO4A492dYz/WsYLmCYf41kZNY0=;
 b=UUfW8mpRqHBlgIkLFblgRSImPRJ8T2vrIZ8fnE5PY2pPKNI5ymA0cKOrvAmG/HzdQ6
 cVmv5XHH19xQAqg+Z0QaTzCxgkjjYgZqNxvEGLx3UmVIuCGn5wY5HnAXrailN7vBfUFP
 kQJ7CLukzEBft+wryCWm2fKMSWseVprWbasUmplefseQiGSBhIPKOvbsmmgzpNIJx2cp
 HD57ObnEf2RhUgUFRIYzEvdSMEhWiGGq+Z8JVJ3fxrGfxnaQpCy0m5EXa8Qz28BDj8c3
 WwB9abjiCBEgqu/z4bcDXM0Bn+vFeHP4E7m2GVO4S4E2zmxzj7+M+d74lOwEOOQWobTd
 71YQ==
X-Gm-Message-State: AFqh2koYvfjT2iuteGNQJq75IoGpUeK908mggR6vDMmjxt+pkBs77MsZ
 BwYk9y0hy7R51Hc0OLpQs2E=
X-Google-Smtp-Source: AMrXdXsjFhKWKq7za7X1ZzjrMsEeb9ETu3sg+Kbqp8I3AZi5X5TNNlg+CZgXDBTXn0b9+8w2zTN+zw==
X-Received: by 2002:ac2:57cd:0:b0:4cd:afbf:c206 with SMTP id
 k13-20020ac257cd000000b004cdafbfc206mr2700092lfo.22.1674154157481; 
 Thu, 19 Jan 2023 10:49:17 -0800 (PST)
Received: from U19.ag.local (static.187.76.181.135.clients.your-server.de.
 [135.181.76.187]) by smtp.gmail.com with ESMTPSA id
 b31-20020a0565120b9f00b004d30752a561sm2112737lfv.298.2023.01.19.10.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:49:16 -0800 (PST)
From: Alibek Omarov <a1ba.omarov@gmail.com>
To: 
Subject: [PATCH 0/3] drm/rockchip: lvds: add support for rk356x
Date: Thu, 19 Jan 2023 21:48:02 +0300
Message-Id: <20230119184807.171132-1-a1ba.omarov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 alexander.sverdlin@siemens.com, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, macromorgan@hotmail.com,
 a1ba.omarov@gmail.com, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for the LVDS controller on the Rockchip RK3566 and
RK3568. First patch adds the support in rockchip-lvds.c driver, setting all
the needed GRF registers. Second patch adds device tree bindings, and third
patch adds a note in the documentation.

LVDS controller on rk356x does share DSI DPHY with MIPI DSI, and all
groundwork on enabling it is done by Chris Morgan.

Tested on Autogramma Monitor RockChip, custom board based on Radxa Rock 3
Computing Module Plus.

Alibek Omarov (3):
  drm/rockchip: lvds: add rk3568 support
  arm64: dts: rockchip: rk356x: add LVDS bindings
  dt-bindings: display: rockchip-lvds: add compatible string for RK3568

 .../display/rockchip/rockchip-lvds.txt        |   1 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  25 +++
 drivers/gpu/drm/rockchip/rockchip_lvds.c      | 144 +++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_lvds.h      |  10 ++
 4 files changed, 173 insertions(+), 7 deletions(-)

-- 
2.34.1

