Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3EA44FB67
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B789DF9;
	Sun, 14 Nov 2021 20:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A41389DF9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:04:49 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u22so23986607lju.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McOiS/Q0CFO6uwemy53qifQP3mC9vDonaeYr2NzuA14=;
 b=URyDiCvf5kN1pLBxwuj/DOsEWXm3s7PlS6sTafNgjKH+ktnvoqAplLPWskoD/ZKgez
 WSiAiARt1Drp0Sfd8wXjpfzqTd/tCoeldnrn/UiHUwPT29g3HXB/KuUL7QrUr+2dBB3q
 PaEZPXHe58MEcEzrZpfDAfIdJH4G1XDpxCeNMZ9pLHfKvdlzfOTQnHxNLCDYR9sX9SCd
 /IhO3vKZqjSF+W42ADM1/bgD9OlRlkxBli0RMI0qAxhtpxM0lCADzJISbsylnInEWlSc
 /qkUNv2os3SdBSwiE0ISwO2GbupYIM9auJ3oywIFpzjpcpWptEyjCReJvfp4e0HB7XgP
 cDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McOiS/Q0CFO6uwemy53qifQP3mC9vDonaeYr2NzuA14=;
 b=5HAEZlWGAHc8tRFeKl5NDRVLVEtQ7akMdU4moFDHiqQU0TDQ9vlGym7qDZ05bzImxN
 ZGQ805R5xfqhhEPqYFyf5EMkILSi3IJo1WutLjvwo+jN74YTebojwr47d0Wfn46EwMOd
 d0tzvu1gxDojsLcgtc4VK2DIOhH8T70i46aNpqyycQ9YynDakIp9/1dB7m2LZiJYoMw0
 FYmdf53yaxE2CGH8sCL0ITmASrvW/DRI4Y2bvugbreKzMntjdvKNlRrCx5lK5GE2+Nvb
 iIpPISjn86c8KNoaWUTpfgmTiC81o5WzQhXi7wM28z5IMdlDjGXwceRhw0q2VoRAI/hB
 Xkjw==
X-Gm-Message-State: AOAM532qy8jpajwXfZXRhbofkD9NcuHHxLT0b82Y1uJxubuGgNFGTj74
 RG77At1DI02DLcSh1Dsrojo=
X-Google-Smtp-Source: ABdhPJxxL1WqMIAul+o3bZ58Im+ZHiPvwoqlenuOM6pTc/79qVsFAir5bH4M6ujqa4zF5rDn5okzJw==
X-Received: by 2002:a2e:a882:: with SMTP id m2mr34863256ljq.416.1636920287459; 
 Sun, 14 Nov 2021 12:04:47 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:04:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: [PATCH v1 0/2] Support HannStar HSD101PWW2 display panel
Date: Sun, 14 Nov 2021 23:04:29 +0300
Message-Id: <20211114200431.28484-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for HannStar HSD101PWW2 display panel used by ASUS Transformer
TF201T tablet device.

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.33.1

