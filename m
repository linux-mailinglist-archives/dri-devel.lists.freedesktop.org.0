Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AAA724547
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282C10E352;
	Tue,  6 Jun 2023 14:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC510E352
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:08:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30e5289105cso367009f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686060521; x=1688652521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nEguAEjaUZuH5f9mkKjoRfJYtn4sBJWyZOqN3ONfKgg=;
 b=npYbs7JmwiQxzf9JlCFyhzW3qC4071I8viVqb+RtLUeKPAtNxQJpqYmyaY1InCiqWl
 MWOLREhVsDEYz83h0p+CJOcso4Dez5Ozwh8tadFN9MVEaoMgzcu4JvOiQERV+jcXdBBM
 m5W1EufUJAqZrHdRFADnN8xcVW+3XDphd6f53xPN4oN0iBA3V706PF4sEqFNWVB2C/O1
 zlIWLNBYQlg0491dnHGA8HcEoWmAboZfcJyYn/5dep/5qbGtO3z1mjiUjPciFnoxCtw2
 iUO/EZDyKCCYiqnYQMAvIXDLQsA4hFMwl4IFyRN0y2hwXA4F1AG0iEfDrYiFmUouqpTA
 gkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060521; x=1688652521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nEguAEjaUZuH5f9mkKjoRfJYtn4sBJWyZOqN3ONfKgg=;
 b=mDOzdWxUFTgHMbrJgYca4c3Ww2m2lzNV40TRCC6/RPh8wZsYE/5rS3WkKrDc/Y4Lci
 dWweJEoMFq6NHEhjIPqDKuuaO700M//UOHusey2JsO5oxDP6SpK0277Q8r8TDkJu1L6P
 VPysGObeNnsv6dSI2cLms5BEEh6MF1jkwQIAQ0dXxmum1IexBrUPVAST6JSa3Kir823N
 qvEhYd74EaO+P0zEHwspOBRsXF5K99vNWakh1HUFl3nD1piwbZ3/EUj0o1bIk/ittaWi
 qX00n9rcoJtlN/xwdYdnTtQTxyWyGYTN7hTgGINOdbEIB9mNGxkjW56jOyXrQ4ZlZo+k
 kBng==
X-Gm-Message-State: AC+VfDx87TDFzWNKcbb5Yrs/JwDb/c8P5dnFaClW+9G9UquTcnC9sRZ2
 RmDMgDZS3mH1hcvFC5XaYls=
X-Google-Smtp-Source: ACHHUZ6ENEiuQm4TEr/naGDnZLYWe7o/zzetEiafiqwV4/DSy/+2om7JMLlc1VzI0GYenJlJ+fb6/A==
X-Received: by 2002:adf:e752:0:b0:30e:5364:bf04 with SMTP id
 c18-20020adfe752000000b0030e5364bf04mr727730wrn.27.1686060520520; 
 Tue, 06 Jun 2023 07:08:40 -0700 (PDT)
Received: from fedora.. ([212.15.177.3]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b0030903371ef9sm12694315wrv.22.2023.06.06.07.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 07:08:21 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v3 0/3] drm/panel: add fannal c3004 panel
Date: Tue,  6 Jun 2023 16:07:54 +0200
Message-Id: <20230606140757.818705-1-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal C3004 is a 2 lane MIPI DSI 480x800 panel which requires initialization with DSI DCS
commands. After few initialization commands delay is required.

Paulo Pavacic (3):
  dt-bindings: add fannal vendor prefix
  dt-bindings: display: panel: add fannal,c3004
  drm/panel-fannal-c3004: Add fannal c3004 DSI panel

 .../bindings/display/panel/fannal,c3004.yaml  |  78 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c    | 318 ++++++++++++++++++
 6 files changed, 417 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

-- 
2.40.1

