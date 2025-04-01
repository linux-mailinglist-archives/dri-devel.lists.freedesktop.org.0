Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B0A7815D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51A10E638;
	Tue,  1 Apr 2025 17:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=chir.rs header.i=lotte@chir.rs header.b="YMBsE16Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 907 seconds by postgrey-1.36 at gabe;
 Tue, 01 Apr 2025 08:34:34 UTC
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73B10E512
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743495553; cv=none; d=zohomail.eu; s=zohoarc; 
 b=bnUeaESSZiOvk18jfd9NqyilfTpZ37Z5HjWmmkYPhPFAiwf8aKs/2mxanNYj9WGGTTVjKXoy7VstD24JzEKcXRqCBpJ1gZHXQkTtFPmLnd2gijQBtHkvDc033b65Qb/+BFqngzp4dOiCox2JgU4TKxx29mS1mS9nAAdPUuaj4io=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1743495553;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pTCQB0gM1iH0vy/KyRCFBtfEoTxJD8u1Wse1yiltnjE=; 
 b=P/qmd0BU2fQ2u4aillXudrrxhHymlzpXHo4PpzTg1KRuCuRsATSdE0vulbULBOTiOuYfV0eIDASLA9Tugsvpl+VZYFjXeiW9ch/8pfa017Ilkefr9r8jpXKtVdCGx7CanTSo8yEESBXZSWka3yzA1chxzV0+Z57bQchOCbinnIw=
ARC-Authentication-Results: i=1; mx.zohomail.eu; dkim=pass  header.i=chir.rs;
 spf=pass  smtp.mailfrom=lotte@chir.rs;
 dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743495553; 
 s=zmail; d=chir.rs; i=lotte@chir.rs;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pTCQB0gM1iH0vy/KyRCFBtfEoTxJD8u1Wse1yiltnjE=;
 b=YMBsE16QvUsJcnBVlJKsGQki4FRJQ8sNLhNjuUQpKeIcycJx3XP5mv3GyTSYtv9u
 BVd1UpQxFaTfLoVaqf/YfkCCkOpZMQwvj0qXaYu4iQrpU+2He0eOv6XIJ7HZa4cZZqH
 aBGIY/536PMga1/k3YtAU7TdJZ/CzyTHgDl1/YA8=
Received: by mx.zoho.eu with SMTPS id 1743495550257642.4299015885807;
 Tue, 1 Apr 2025 10:19:10 +0200 (CEST)
From: =?UTF-8?q?Charlotte=20=Dele=C5=84kec?= <lotte@chir.rs>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Introduce ClockworkPi CWD686 DRM panel driver
Date: Tue,  1 Apr 2025 09:18:30 +0100
Message-ID: <20250401081852.283532-1-lotte@chir.rs>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 01 Apr 2025 17:22:19 +0000
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

The ClockworkPi DevTerm (all models) uses a 6.86" IPS display
of unknown provenance, which uses the Chipone ICNL9707 IC driver[1].

The display panel Max Fierke has has two model numbers: TXW686001 and
WTL068601G, but couldn’t find any manufacturer associated with either, so
he opted for the ClockworkPi model number.

This driver is based on the GPL-licensed driver released by ClockworkPi[1],
authored by Pinfan Zhu, with some additional cleanup, rotation support,
and display sleep re-enabling done by Max Fierke.

[1] https://github.com/clockworkpi/DevTerm/blob/main/Schematics/ICNL9707_Datasheet.pdf
[2] https://github.com/clockworkpi/DevTerm/blob/main/Code/patch/armbian_build_a06/patch/kernel-004-panel.patch

Thanks to Krzysztof Kozlowski, Rob Herring, and Sam Ravnborg for their
prior reviews.

I hope this is the correct way of reviving old patches.

Changes in v4:
 - Use existing clockwork vendor ID
 - Update the panel initalization code for DRM changes

Changes in v3:
 - dt-bindings: add missing lines for spacing

Changes in v2:
 - dt-bindings: remove redundant backlight example
 - add missing regulators
 - remove some unused properties from definition (e.g. enable_gpio, supply)
 - reorder includes
 - remove redundant ctx->backlight in favor of backlight through drm_panel_of_backlight
 - remove now-unneeded ctx->enabled and enable/disable hooks
 - replace ICNL9707_DCS macro with mipi_dsi_dcs_write_seq
 - use dev_err_probe instead of checking EPROBE_DEFER
 - fixed return type of cwd686_remove to be void following changes to mipi_dsi_driver
 - add .get_orientation callback


