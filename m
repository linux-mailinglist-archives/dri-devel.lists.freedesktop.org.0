Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569515B7C62
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFF910E4E8;
	Tue, 13 Sep 2022 20:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2FD10E4E3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:55:55 +0000 (UTC)
Received: by mail-vs1-xe49.google.com with SMTP id
 m189-20020a6726c6000000b003987fc35d77so783058vsm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
 b=MPz2hm1dNp3wtK0Q6VOZj4HijDeEPDlqtG4P+GnwI1ScUXpTtAiMFQURP2+l0rCUxA
 qmrDRKPBY9MbWm16lKVZvzyIUdJdDUkzzrXDRzHRTJ6GX/yvA5wXbbFrPXBsVfmK5Eo4
 9ogkCukA16YVJLYlQyC6GDCLXZsEW5Jth3oYNbG/63WjVVZ1gvealfQW8jCDjky728Oe
 PBJlPLftoNRA5YfGbbYdkSf/WXE0SzNerEGMYnvyd8sR0THOr0GsvrAeMrBEU6VKtlok
 /9MFSeRwtKp+B3qVEYRyAMqDCg2EYB4UlKeFmcJPYJLNDLU7NZi7lqkjGWIHLveewJpg
 hb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
 b=X4+J7bpfuBE2oRCs8FzMd7nm9fU6L7eymG8bPsPFGRCoJ0PKxjdVBvGhG1k4rv7Jrs
 S8DIgTyxaE6cbJJycB8dw3QHXsLMDlQgU105l7l2JlX7hCkTswmfl7tf72SC2WkxMv/s
 e66VAFL+ElWvPB3WlDLZICJ7gsWIbEwlrDZWAKCV8+MFpmzdKWtw6ukMA6r7rkng3SOT
 d863ubqjMpWiN70zI8hbg++u9jQc/nfVFvKdt4Qj9mZzek6rdGOsaB2akgqBzyrR3Tmf
 tIheYAKdLz0/KtDfzwjR4LMljnqKzYmi7f6MhA74ldU/hvO/TdAJ+UiCP8alBsUuHF6O
 0gCA==
X-Gm-Message-State: ACgBeo0TklFZvarXZQggS2DE1+OABbB+xa/7W2Y4aGyaRMmRcxQpQNwf
 aeVHsasmnqKLFxkMfGZtDi+3rFuq9Q==
X-Google-Smtp-Source: AA6agR5NeheBAt2f63oLFPCmdLpznilELhZXE8PxzUyHeV2qLgMAkY7E8Tau4uJxbQ4Q64hU2nMVSO1q4Q==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2548:0:b0:3a2:5fbb:6485 with
 SMTP id
 l69-20020a1f2548000000b003a25fbb6485mr3366058vkl.18.1663102554926; Tue, 13
 Sep 2022 13:55:54 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:48 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205551.155128-1-nhuck@google.com>
Subject: [PATCH] drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mdp4_lvds_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..7444b75c4215 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+static enum drm_mode_status
+mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct mdp4_lvds_connector *mdp4_lvds_connector =
 			to_mdp4_lvds_connector(connector);
-- 
2.37.2.789.g6183377224-goog

