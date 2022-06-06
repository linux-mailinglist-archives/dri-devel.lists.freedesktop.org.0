Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83C53E3FA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46DC11326F;
	Mon,  6 Jun 2022 09:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8013111326E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 09:55:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n185so7376343wmn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvF3M+uYRlSr3a5KCLyADnsjEKpxlfPHpuUaTqCte5k=;
 b=TMLYk3P5KEeYKrnQQoCZUXZVPwB2mbU7alH5Gx4k/19pdn3njqwEFTMI+7m8VKErN6
 TyOXzpHBdLR0Kt3x1tROE5OXVWNksjfmAQxhr3HUQi/pjx7V5dSmeVRXKTzOcN7Hg/qQ
 mjVY8F8yOQ1tfO/CSoQ6FzRT5Rf55hvOnRoozHGfV4IP8maZVO0DxJiSVaXHmrPfY3GT
 wQpGeV5A2/Dy510LdMvlPlWFMB/7/yJOz7Tup27ELisnmIXT5KkFNZwhHLO4o6Bx3onR
 MQArlYX11jqdswVBqYmZSvONbiMv0eqZfDkd1nSO6+Ox+7wufKpxu+RiuZ1mCaA85CV5
 vCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvF3M+uYRlSr3a5KCLyADnsjEKpxlfPHpuUaTqCte5k=;
 b=yyF/brTKOtfoSIdAyPdLVdKgq3ix+50Z2yoi8KredkB53Qb4LoSMQJRZCYlmT+JrhU
 sgI/ROxKCyxwvhOb8AThRssW6S7bpP9IB5UkP6/niCTBeKi6M0ZCVF4AxPKVm8G56h9W
 IOH9in7FiOyhgxKzW+HtoIbA/NwWNL9HTBsCl+1m8joMEcLKXAu+gqLkYwiFXU87G7KA
 MMY0TFuv+8yRolETdKTM7Z/9aFFkSVpSqi5aymFfx5hJGAxzf3cJK1zLA10D7NwKA3W8
 D/kbNJoZ+J8vQtwPGSxLKN7C7LL2PJ1qOmA+6t2UCyi2BHMJ+0yhD0kW3LexYjiCZEe9
 P9yw==
X-Gm-Message-State: AOAM532qHiWz5tUwVb2SE0OPN2/p08wSEuvymE9yOeAjF5DJTSF9NCiB
 MMJfsQGZ/qAzatz4RRvwkTU=
X-Google-Smtp-Source: ABdhPJweK6O54b1wrPEaEYBA76q/aE6w57fAhWpEqGNMnJj5PnHBvLp+W+RHTDNJYZJcvI32S5M60A==
X-Received: by 2002:a05:600c:1992:b0:397:8d3b:8a9b with SMTP id
 t18-20020a05600c199200b003978d3b8a9bmr46251245wmq.20.1654509326115; 
 Mon, 06 Jun 2022 02:55:26 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039c325eaff2sm13654326wmq.26.2022.06.06.02.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 02:55:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 0/1] KUnit tests for drm_format_helper
Date: Mon,  6 Jun 2022 11:55:15 +0200
Message-Id: <20220606095516.938934-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

Recently Javier added a new task in the ToDo list [1] to create KUnit
tests for the functions present in "drm_format_helper".

This patch includes the changes suggested in the RFC version [2].

Best wishes,
José Expósito

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=596c35b1440e
[2] https://lore.kernel.org/dri-devel/20220530102017.471865-1-jose.exposito89@gmail.com/T/

José Expósito (1):
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()

 drivers/gpu/drm/.kunitconfig             |   3 +
 drivers/gpu/drm/Kconfig                  |  16 +++
 drivers/gpu/drm/Makefile                 |   2 +
 drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/.kunitconfig
 create mode 100644 drivers/gpu/drm/drm_format_helper_test.c

-- 
2.25.1

