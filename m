Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C093F9600
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DC689308;
	Fri, 27 Aug 2021 08:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1389308
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:24:13 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m4so3508871pll.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CnQHZ7OHj8PYIqCneFXHqZGg6bFZw4p6vs1f3Gs6uwM=;
 b=dxJqFOoPY8wPi8gLe0f2xlGZmgweXxliaEtfzrMiuc21g4Bj750eiDF/bS7XKfr9H0
 mcKcZvq2EATPKfJwP9Oe/vr51jxfb7Qf0uhwnViklEkeoPuX9ZtkacK55ZRj0uTOwbqk
 2wgWucaMvLs8/csJtOYxvXEj+ZhDlS/vePLO5H23dPOYqL92EE3ywjragTUNYUojPnvT
 M7qhIGHIsUbXc7Rr2Ehd4KwOXR+POqnpt1S4GPzMqyBodG8XixXQFFdRxn7Cc0BUGlWf
 C2pecOJdTKIKunoLFYymLhyv/fvue9FH+LVAz14KWlA1hcZSdIMQRtvq80yvLgXIZsoO
 S4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CnQHZ7OHj8PYIqCneFXHqZGg6bFZw4p6vs1f3Gs6uwM=;
 b=En+Xh8UQoR9zlgs41x3ys66k7hvoX9MN4DIygjIZLfKdGh/Ig1aIf9F150Hg7kIOhP
 RvkhJSSV3kZav2jVrzZgJM6pjT0avSqz4qoV3N+63+oFfs/wbWKvsqAJS0OegICVo3ro
 aW5d/1YbQUim4TT6CfKFA1UlpzPYCpq/3xExAhbj0F9LE30eX/+rCiFY8wZuS/8b4iWs
 ub5A2RlokxeiBLYPhT1nsZJSEapPK9X78JHylqPyXebsnXdUbO5voMNF3dALtTREU5ha
 GO8lh1Ww2XCLQbQD6jIRBAVHjfjDWRK2VD6+VbUON2dmx/I9rFIFVgprTSCLxcADcgCv
 rHmw==
X-Gm-Message-State: AOAM531jmSc+snOZgbgkKhee1wYSuBeemgEcg+i4AiA9WAVBRMsxI7Hg
 MkiYJdIbAslJ1yOI5ovzHyhByg==
X-Google-Smtp-Source: ABdhPJzw4pDHx0EMRNGp+WS529vxWxckErf3pl+6/0Z0VJdHVur0BVdRZEVSEldDiI+i+NCCTDWBlw==
X-Received: by 2002:a17:902:7882:b0:131:2e12:c928 with SMTP id
 q2-20020a170902788200b001312e12c928mr7555092pll.74.1630052653443; 
 Fri, 27 Aug 2021 01:24:13 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id m18sm5391371pjq.32.2021.08.27.01.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:24:13 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 0/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Fri, 27 Aug 2021 16:24:03 +0800
Message-Id: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to v2, support for BOE tv1110c9m-ll3 and Inx hj110iz-01a 
video mode panel.

yangcong (4):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  drm/panel: support for BOE and INX video mode panel
  dt-bindngs: display: panel: Add BOE and INX panel bindings

 .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 926 +++++++++++++++++-
 2 files changed, 930 insertions(+), 3 deletions(-)

-- 
2.25.1

