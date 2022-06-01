Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA353A10F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF5D10EB29;
	Wed,  1 Jun 2022 09:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F0710EB29
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:46:44 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id q18so1273668pln.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvYVrSCHuE1p50B2T8AG1mFSUMzRH35rYwVgN1pnAHY=;
 b=VFr+ClLg8bfhBtdYrCra7C+xLD2UYCMvTA/ZuyDiO8wD4ONPpbRBz3vXSv+5c9mvJV
 0KazDP7LcYct+M79b86+YFML//pqwhRdDnznoXtO+FLTA0sVmCu/tUuL7DIxaRN6V0li
 dlUGidNlzChRksOxsxfY7emIpz2VYfPjY1YGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvYVrSCHuE1p50B2T8AG1mFSUMzRH35rYwVgN1pnAHY=;
 b=zN7VFAWxHr84mijroc08YWasuwxGyS7qSwfIUwXIHjO2i2cntfBw94jhaIaneqOOht
 BbGZEEhZRjcSqGdkLAYWsX08gIEPFnZXpKat8ql4PNGsCmtga8DxVgqvS8thvXQBYJMl
 rCHDGT6HtVmASvMNvtqXrc5BpzpqSye32AvbeeWJiU9kpPEKsR9ucg5MoIqDHZZmQq/Z
 K7lhqVgGn2evDT6JD/pJXz6k/XtZqM5r4xvua7gmPwhu7bPSXJ7MXpSpSdX5rF2q0dGW
 rnNwaXKJl4/viFdU0WVa7aZ2xG4LaOC8dWqNoWWT0IZWlYEJtdqct5yOgmbdA0kuXXdE
 H3vQ==
X-Gm-Message-State: AOAM530xIEC/Pmms4uFlqk9IeQ4uk1XZ/tb3gZfvagCtOtecc20t0lEO
 Gt7/KlLTEdSEqjY5yzGuEhyBvg==
X-Google-Smtp-Source: ABdhPJz/lyHkTPTNWf6r3FAfoIfyICC7is3wiA8+I+xC7MUGVd8BMu55GAC4KUIxaK9Y/TNtmKBDEw==
X-Received: by 2002:a17:902:ecc5:b0:164:1a5d:576f with SMTP id
 a5-20020a170902ecc500b001641a5d576fmr4541605plh.19.1654076804179; 
 Wed, 01 Jun 2022 02:46:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:46:43 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 0/8] Add a panel API to return panel orientation
Date: Wed,  1 Jun 2022 17:46:29 +0800
Message-Id: <20220601094637.1200634-1-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
 drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
 drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
 drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 77 insertions(+)

-- 
2.36.1.255.ge46751e96f-goog

