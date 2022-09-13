Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8C5B7C67
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFC010E261;
	Tue, 13 Sep 2022 20:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A669A10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:55:48 +0000 (UTC)
Received: by mail-ua1-x94a.google.com with SMTP id
 k12-20020ab0538c000000b0039f64f6d1e2so3850522uaa.15
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=B2mqYDiaNl85Fwjyeejod1j2C23kkV3KpQaZ/IDd3G0=;
 b=n5/3ZUe5YW7iVEaFTC1C/QTXggGwKQwtjWMw3jPI0BgMfRYYaenAHMYA7hmpH78woh
 lZrsAverREXV5LS1eNSZiEiLKiM+JXW0zOmxWAdX3LhCwLd9Qf/j9Y5hHtz2sPDqVpOO
 3LE27kbTv/4DXc2cgdQMCkC3yessqW+eRLrKkgNWQ+Ghdk/GB4Xyotg4WWPaHI8nr0ZJ
 DFR3Zt4imBoTKoWRLhRctbaodxm4ndTXJF9eHcqbrD4UR0gehFkZtZ22JU5AJxGutNXu
 2/qLLlTx4A77Jsxp0TXTu22DWntV2xma0eZbyML/CoROivz9n2Cnhwlejron+u+9bLkh
 E7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=B2mqYDiaNl85Fwjyeejod1j2C23kkV3KpQaZ/IDd3G0=;
 b=VctYH8EmbR0PZfDpDE4FdNY6NBRvU4y4J9EdcNAJWWaC53QUHbyxpE1Tg1xMGCL9R/
 afbEEX2XkFeg2OdFgh3NNi17tEFBb4TjeIImxGDIdlN6xXzWe13yQXEp5/a3fGeWMBd4
 WFyYJm2o3DG6pScmMZCf5Fdb5FLL4ELPHfzwF6gKnFhIQZQnzSn2OBkQ6ZAbitfWZ4Pq
 MYicxehs0u6qQ0UbL315LNxaH9eqsRkQ4IjSD1vBR5KKDfrmwH/QADza1XiTKjcRCIXX
 ZcnJw3EXvbtrttePy5n0IGbi5QM4F2PbwqxPOEKupHRhEMnN7EA6i4pKJvgwLQTP/wqT
 9FsQ==
X-Gm-Message-State: ACgBeo03kImVEDvD6eCm6yZqeBxh7j+LFo1usK5cP0S/ftib3avl1q+X
 nlCynNh7JkDWTrxUvqjT5CEaQhoQIw==
X-Google-Smtp-Source: AA6agR6tnOJoQpNye/EaN3VzNTXwqOI2huVgh67Hj9kUaRNfdC+l6rBv/TSOXU4i5MQmCNQ7VhuyBZdcNQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:f6d5:0:b0:398:3cdb:3f99 with
 SMTP id
 v21-20020a67f6d5000000b003983cdb3f99mr9320922vso.85.1663102547645; Tue, 13
 Sep 2022 13:55:47 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:44 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205544.155106-1-nhuck@google.com>
Subject: [PATCH] drm/imx: imx-tve: Fix return type of
 imx_tve_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Huckleberry <nhuck@google.com>,
 Nathan Chancellor <nathan@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Tom Rix <trix@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of imx_tve_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/imx/imx-tve.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 6b34fac3f73a..ab4d1c878fda 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -218,8 +218,9 @@ static int imx_tve_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int imx_tve_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+imx_tve_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
 {
 	struct imx_tve *tve = con_to_tve(connector);
 	unsigned long rate;
-- 
2.37.2.789.g6183377224-goog

