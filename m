Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233D44FB79
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8516589E39;
	Sun, 14 Nov 2021 20:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EFD89E32
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:07:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id e9so30812985ljl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RU5xQBUXxAeOsUcVaTk34EpclecVINBtsFN9IeNqsuo=;
 b=NpYYTlu7BX++Go6BCjD6CgDjUxAaCvoDImAAVO7yqyhvPBDBZdWGxPwMm9nFsOrrJ0
 g2IwkSTGrldOrGj6q+vbr5gXMEyteOjPp+uS/q+DJiJ4Pw3nUwJWGuCIgASE/iKfzyMe
 4B0jzNLv2slniVlPWRcx3PXDqvYP8+sOh0ujsFfaZkQBGdlmAUIo36H8NXSXCcHBXW8e
 S0LF1tfX9sNOuniDjLDITbFWGERFHSx0eOK/S8mEEcIVOXB9JwsUIstWLyHpN8rCPPyH
 QDFEv3HinBEvc21V21MBLi7fAS6D2N55JBAom47xmMdAWWaovYHVijW+zlXbds41mNJ0
 8iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RU5xQBUXxAeOsUcVaTk34EpclecVINBtsFN9IeNqsuo=;
 b=yJltcBu9xUQ1oOChy6TX4te5h26eeB8Fmw4MY8yQgfb/Tab2ty0g3fjaHrVkTD4zzf
 HdfpHJqbVDSv06zZ0qeOEHP2euMgx6/NhU5NXlzNOw2cAqkXhm0Aen2tFcrCV8lMyo4T
 hqPz1OZVivBIQ7Ywclq7DPnCGPku+tf8AS93xOJdZxAQK6wp4NU9nV0uVP6m3JopLGor
 sCamxwL6Mvgr+hAzsDSXPHcHsG/M3kxQOg5RHJrse/dSvO8XD/7JsZi8Hw9hSklBVTBt
 +iIzJIJgd6TpRIu5qJvdAWUtwf8MdfhnfCuFI4x1xV8WVlsFN4kkQj4/ctkO7G5XaMZz
 Fqhw==
X-Gm-Message-State: AOAM532rlbXkJEShyt3LJD51jIEbDLUkCqSx3pKJPmLOHpKVSZrt2SdC
 DLunGLTxIPzyyDUCpaHj4aI=
X-Google-Smtp-Source: ABdhPJxprP1KeRUC1FhoUhxkXRU3cVbkUfd7QCJSTsCGLNIkePAMX/w/gCEaOn5x+tU6H8IpjYk5+g==
X-Received: by 2002:a2e:a90e:: with SMTP id j14mr31880345ljq.299.1636920462053; 
 Sun, 14 Nov 2021 12:07:42 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:07:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 0/2] Support Sharp LQ101R1SX03 display panel
Date: Sun, 14 Nov 2021 23:07:15 +0300
Message-Id: <20211114200717.28986-1-digetx@gmail.com>
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

Add support for Sharp LQ101R1SX03 display panel used by ASUS Transformer
TF701T tablet device.

Anton Bambura (2):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
  drm/panel: sharp: lq101r1sx01: Support LQ101R1SX03

 .../devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml  | 4 +++-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c               | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.33.1

