Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC7CD2E64
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 12:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E9610E0EE;
	Sat, 20 Dec 2025 11:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NnhVTffi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047110E114
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:39:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6DC8960008;
 Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9AA8C4CEF5;
 Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766230739;
 bh=TGiVH1O1BaiBopdUw2gkpw7DmrxZfIrUFSr5F56AaSY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=NnhVTffit68eDXsvrwsf5MBbzZxemcEO0jhPFlG+yjdg8SgAUejijQaRmrgmEXmMN
 ftF0D0K4gXurl3VZqIsL8qxkEID/oyM9BGs8Jdqru0X8agctw2VvQSr+P3yTOgZAMx
 zt5PY7LLhQ+ZZ19QpirneyDBajcVa1zVqfI4IS/KbDSrEyQZf9ZwIexkZdioI+TmdV
 RGQ5gWzpwHw8od2j1kZkLXcsZ78CbAqjwYlLKKc93D7CDLHBcjjHiHAdIX8J/u7lNO
 ODnKmAE1aPZb14kAxder3XrmGa4DxZpVZ49HkV4wv++VojMdaeQie17If1iDOrkluy
 0HPR/SJZt1GDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A5C1AD78797;
 Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sat, 20 Dec 2025 12:38:56 +0100
Message-Id: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCKRmkC/12NzQ6CMBAGX4X0bE1/oKGefA9jSClbaSIUW2g0h
 He34EHxON9mZmcUwFsI6JTNyEO0wbo+AT9kSLeqvwG2TWLECCuIoDlWYQrVFGpdNQMmjHDFcqa
 FLFFSBg/GPrfc5fphD48pVcfv2NowOv/aXka6rludUkL39UgxwdI0OdRS8gLKc+vGTtn7UbsOr
 anIfnQq/nSWdK1Lk25caGn2+rIsb9Xtudf+AAAA
X-Change-ID: 20250614-asus_usbc_dp-0203a242c698
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766230738; l=1498;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=TGiVH1O1BaiBopdUw2gkpw7DmrxZfIrUFSr5F56AaSY=;
 b=F8/YRwOlXoGGF5HmjbtgIHp/0i7lIYXo5TLYYwg8+F1iZG0IGp2fsyJ4YHYtN0xAKYFWweLEH
 AviZ9MPR6JEBB8uWD1POJx0tpsfnkSXovMthf/fnVhob/c24RpHDl03
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are still many missing features on this machine, add the ps8830
retimers for display over usb-c, the simple bridge/HDMI port and set up
to use IRIS.

Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.

lots of these patches are very strongly based on the work of other
maintainers of these snapdragon machines, like the HDMI part on that of
Neil Armstrong, many thanks to those who laid the baseline for me to
follow.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Changes in v3:
- drop merged patches
- drop nvmem patch as it wasn't tested properly and didn't seem to work
- update tags
- rebase on the latest next as there was a conflict
- Link to v2: https://lore.kernel.org/r/20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com

Changes in v2:
- Fix the place of the rtmr regs to maintain alphabetical order
- Link to v1: https://lore.kernel.org/r/20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com

---
Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 396 ++++++++++++++++++++-
 1 file changed, 388 insertions(+), 8 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20250614-asus_usbc_dp-0203a242c698

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>


