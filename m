Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5CBA552BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9E10EA33;
	Thu,  6 Mar 2025 17:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qXfD3GW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B088610EA33
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:17:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF386A44F22;
 Thu,  6 Mar 2025 17:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BD1C4CEE0;
 Thu,  6 Mar 2025 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741281449;
 bh=wE8fq9Xqj1ipKusjlJNDPVDEqeo82zu7GP8fRPCWKr4=;
 h=From:Subject:Date:To:Cc:From;
 b=qXfD3GW7mCtmQg6GAXeGiRb4G400UXfB3zA01WSs0aYLyO77Tf4brftJPzbLyYwYt
 Scmq01JJELOGdFJG0Iteuc7ti9kTuuTxTBA+9/y6mWkItpz2HkqvMC6XvI1T96QgrW
 PIJxEui5Nf6YTON9vll7+XW7bMyOQaRbMLkOV5gnaAZPOLOyDhUJrIJf4SK6RnpUc8
 lA6QJxSXivpWwHGlvDAXbiUvb2BX3Fw5OP4FfCzXS22TpWSXWUoCJlBn/I+OtehDnn
 P5d8edHsIlui/PcxNXfcLTYmyRV5e5oqN7IQggARZo9uZgTTRMXPfUp+sxPkVf+FWa
 4N7wo0kSLgKWQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/2] drm/display: HDMI documentation improvements
Date: Thu, 06 Mar 2025 18:17:22 +0100
Message-Id: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLYyWcC/x3MSQqAMAxA0atI1gZqnb2KuLBt1CwcaIoIxbtbX
 L7F/xGEPJPAkEXwdLPweSQUeQZ2m4+VkF0yaKVrVaoGnd9xczujhDkQutMKdn2rSlPoypgFUnl
 5Wvj5r+P0vh8hF1FRZQAAAA==
X-Change-ID: 20250306-drm-hdmi-state-docs-89703b124bbf
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wE8fq9Xqj1ipKusjlJNDPVDEqeo82zu7GP8fRPCWKr4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOknbyxhu3Fpq+W6s39mn38pGuypUSCW9WxKb6bHxDkz1
 0a8Dr7q0FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ9OUwMjzKqk9uu3JdKynJ
 YNrUJyttbzYtTAx45hVi/iJPxOLFDjZGhmsdt7mrRaXdy66eEUmoOuSV93NP0ufN8ecUCw6c+aj
 PygwA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

These patches improve the HDMI infrastructure documentation, in
particular to mention that edid-decode can help debug and check
infoframes issues.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (2):
      drm/display: hdmi: Create documentation section
      drm/display: hdmi: Mention Infoframes testing with edid-decode

 Documentation/gpu/drm-kms-helpers.rst           |  15 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 261 ++++++++++++++++++++++++
 2 files changed, 276 insertions(+)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250306-drm-hdmi-state-docs-89703b124bbf

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

