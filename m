Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD6824206
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 13:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579F610E304;
	Thu,  4 Jan 2024 12:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 12:51:51 UTC
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch
 [84.16.66.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EDA10E473
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 12:51:51 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4T5R7F66TfzMpnVZ;
 Thu,  4 Jan 2024 12:42:17 +0000 (UTC)
Received: from unknown by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4T5R7C6rXxzMpnPs; Thu,  4 Jan 2024 13:42:15 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/panel: ltk050h3146w: error-path debug message
 improvements
Date: Thu,  4 Jan 2024 13:41:56 +0100
Message-ID: <20240104-ltk-dev_err_probe-v1-0-8ef3c0b585d8@theobroma-systems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
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
Cc: Quentin Schulz <foss+kernel@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This hides an error message if EPROBE_DEFER was returned when trying to
get the reset GPIO.

This also makes use of dev_err_probe in lieu of hand-crafted logic
inside the driver.

Thanks,
Quentin

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Quentin Schulz (2):
      drm/panel: ltk050h3146w: only print message when GPIO getting is not EPROBE_DEFER
      drm/panel: ltk050h3146w: use dev_err_probe wherever possible

 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 23 +++++++---------------
 1 file changed, 7 insertions(+), 16 deletions(-)
---
base-commit: ac865f00af293d081356bec56eea90815094a60e
change-id: 20240104-ltk-dev_err_probe-3c93c1b09242

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

