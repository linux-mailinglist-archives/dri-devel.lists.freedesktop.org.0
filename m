Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A6D70EF5D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4AC10E061;
	Wed, 24 May 2023 07:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2F10E061
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:28:28 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so445350b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684913308; x=1687505308; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0swQO8uc/orJERk9QNDSqEvMqkKwss9myYPJSpA3F+U=;
 b=hwp6So7H0IBpB9UdEUqWBOOeX0fbHbYieg9GYt3wSudvtPV9/bzQUEDc8enUTpPquG
 S/fnq7fdQfUCnd3aXZPvMgRa2dUIhapnSfHDr2QPOsQqwPjcNbn1XVunMJuXrH2aVU7/
 wgklQg2pOJAgmN640lmLc91lmvwh7JwUjYoxV6HNXLVe2eCzw1fYyynPZz/X99S34KWI
 CvleHCw292JDSd7cxWANg1ErKpkz1Ethhvp1rGNqipRo9l5/DjvoexpRTCidyuSXopLy
 7ysVgfv4UE6QInDY7U6VUi871h/d/8o1VigqLXUHu5hV19wo4VKTP5ev8t0x5rG0qwpi
 oVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684913308; x=1687505308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0swQO8uc/orJERk9QNDSqEvMqkKwss9myYPJSpA3F+U=;
 b=Gh2+le6C+x999udCDv029hUYgTeqQIAvpXRfR3L4gmjaGy6LHPqkZoWStJSyu7mNb4
 I+M3YosFP2f0egH5dvf8wI/e3cUNinD2et9KxcWZUT0c0/8jHQwrM+BNd/xx9v3u+ZcX
 1Oc4UgeMEyzi/Xin7KOXmYAOpN+lnIPWaPiJfgaZJ0xCL1AHTcTSg3koFZIXrRdfDzNL
 ataagX62YcIXn3Q8LKK7PeMAIPyjqxhn5F7yKoB3JasaZHBG32HvRHF/Z8l85QrVV8C4
 VK2rBxdgmXrUJTtTHpJksXxlNYg1FzKqejsSUOnNHHysyEGw5w6PfmKcnP5rqrD0BQsQ
 ER7Q==
X-Gm-Message-State: AC+VfDw6urpeoI2vYT92LAUc96GwFYG/BXqNlwejCNCBhLHhE++k9+Eh
 2cwgik8ZLXG4X8RcVroRl+TQDQ==
X-Google-Smtp-Source: ACHHUZ7Ze+BDoJpnvtfSS4dM7adgp5rGJ/U8V15YxuYCrayKGaoKZDnsC58WgdG6O3Y3PhNbI20uyQ==
X-Received: by 2002:a17:902:e74f:b0:1af:d1a4:25d with SMTP id
 p15-20020a170902e74f00b001afd1a4025dmr4274273plf.42.1684913308187; 
 Wed, 24 May 2023 00:28:28 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a170902c19400b001ab01598f40sm8007246pld.173.2023.05.24.00.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 00:28:27 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v2 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
Date: Wed, 24 May 2023 15:28:12 +0800
Message-Id: <20230524072816.1131039-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compare V1:Add compatible for Starry himax83102-j02 and Starry-ili9882t
in dt-bindings.

Cong Yang (4):
  drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
  dt-bindings: display: panel: Add compatible for Starry himax83102-j02
  drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
  dt-bindings: display: panel: Add compatible for Starry ili9882t

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 471 ++++++++++++++++++
 2 files changed, 475 insertions(+)

-- 
2.25.1

