Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407ED53E08C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBF010E06B;
	Mon,  6 Jun 2022 04:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B899C10E06B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:27 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso11668602pjg.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V48jIpUPpkwi/mXw0vV1qlo/0R+nh6UqO3bUzG0QHns=;
 b=nqQSjOvanX+8t+tfNQWjxQaFfRS/+GiSKg6PgDaC+vs0EtY834wW/8lUSx+MIh6+66
 QxSZBzAa72S8ewu9/W+7na7Kc7k0dqpizfCf/j+3vNxRtbDBwkBlrf52exTYP/uHo+77
 Ssb8uKKBEcUSKuPtsbTbCH81UkVrmiSnDCncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V48jIpUPpkwi/mXw0vV1qlo/0R+nh6UqO3bUzG0QHns=;
 b=GXX9RwXJfvG2jB5xiD90lfQv2GmPZQIEae0Nlb+8KOURC7lt11n+coqzUojALf9zFI
 acIMlxicI5Z8PPs8iI6tn0iBpe0kyvgpWP40u6bI13WjVRjZllK0qFG37Gbzp/PSWOj9
 YovClAQCCuX+FnLn3aHHbG4VGkOgNsOmBLl1BQ69v6D3tvMirG5KZjFQao8PrTjOYEX0
 DdyQ4kbQoWT4KdNF8bmO5lyyXtt+JacoXAOCyYX+ci3hnlg3Suc//eGR32WZ5QKO0etI
 CzrRFsaCkqUxezvN1K2BxmD5wGbNb5noKu6o/lr+1iT0bo3+6lRp+t6d2VXDBbiqCYEX
 ksEA==
X-Gm-Message-State: AOAM533m8624VrKTKU7Qqm/MLTUMThz1+Y3E218XJjLC3GJQ6wISvFUT
 R48KsZwBw5VHXDm/aA4DRFphJg==
X-Google-Smtp-Source: ABdhPJwNc9WTpHKy7nu/+3cTPEdExZl8996ly7Ju/bCZ1Rjy5dZNznjIR0+wzUFpxhRy9BhxaOu5oQ==
X-Received: by 2002:a17:90a:c002:b0:1d9:250a:73c8 with SMTP id
 p2-20020a17090ac00200b001d9250a73c8mr24459800pjt.133.1654490847065; 
 Sun, 05 Jun 2022 21:47:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 0/8] Add a panel API to return panel orientation
Date: Mon,  6 Jun 2022 12:47:12 +0800
Message-Id: <20220606044720.945964-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

The series add a panel API drm_panel_get_orientation() for drm/kms
drivers. The drivers can use the API to get panel's orientation, so they
can call drm_connector_set_panel_orientation() before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API drm_panel_get_orientation() to return panel
    orientation
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm/mediatek: Config orientation property if panel provides it

 drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c              | 15 ++++++++++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c             | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c           | 16 +++++++++++++++-
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

