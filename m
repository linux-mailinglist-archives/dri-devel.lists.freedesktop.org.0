Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B8539F21
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0ED1134AF;
	Wed,  1 Jun 2022 08:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608761134AF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:31 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so2311424pjm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GemiEwLCjqeqzreRXrlIOTn/YyLsal6nhhhXl7NXlqk=;
 b=fUCScFzCpuzwgyHn7xrFQ7LGQY1FA++dCWMbhVb83r3eKHVpLa283g3v7wU3WUEKzm
 JGCGzFjgej+HQwWcdTNenFSje7ses1XT25cOmGt+ACU0UKCpvDLhllWBp1y2kuWuZGLT
 jy0QT+usJUmu/D0p+bU7o518zh0ElhfJMicpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GemiEwLCjqeqzreRXrlIOTn/YyLsal6nhhhXl7NXlqk=;
 b=6Ou6P5g/pi+bqoyiBNfdUH98lfaW9k8PdC78lxTL+YaA+lXLjEg/Ay9OI2welUxG02
 O3FumfrLgxX3SMi5nrZXprfDZ28CjbaWbCl+NoPbuR/mQ2zdpH+U8geenlsv9vU7pZ7U
 3sGfqiq1sR+SSDOVE106Fx9lu9NUBPtM/2aXehALsUlTxZjQpR53Tf34r+64qj6yDaNs
 2r8OKi/oGG8t+nehy+VDGWJ6Qe9QltalTZEdxq8fHvfDFqq8hGVNVc1GoDbnjl6PHQrm
 +bCjn5OXghSLixQMFx72F9dT1H6ejlBTONu6kxtjZMk8dIRSrQAQeS3Dk17IA5oms+T4
 tlOA==
X-Gm-Message-State: AOAM532uoGAuXsGzLYyddOLfHtKHjsM95tZmkbsV2tnlrWwFkctUXHAA
 XC1qwOx4xCu1UwBNQfHy/UfwRQ==
X-Google-Smtp-Source: ABdhPJyLFVUlLgJ+84lYTY5lEbCVVe3v3IQgMn9ywuY3YaByw8oDrtX0EITnzMoe+Ibd0yBMOKH7fA==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id
 w5-20020a170902a70500b001569cc51d6fmr64614112plq.66.1654071510782; 
 Wed, 01 Jun 2022 01:18:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 0/8] Add a panel API to return panel orientation
Date: Wed,  1 Jun 2022 16:18:15 +0800
Message-Id: <20220601081823.1038797-1-hsinyi@chromium.org>
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
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
 drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
 drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
 drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 81 insertions(+)

-- 
2.36.1.255.ge46751e96f-goog

