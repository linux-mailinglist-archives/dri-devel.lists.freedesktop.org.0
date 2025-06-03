Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC46ACCDBA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4C610E5B3;
	Tue,  3 Jun 2025 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YV/sgM8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057C610E19C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:41:59 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-40667dc8a62so2830163b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748979719; x=1749584519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MSyG5GucZ6AHzHmHwEn8qWQPSg1ugWMZS3LrrRmBg9o=;
 b=YV/sgM8GE2VZD85XOATpe7CtIwrw3DkMXau/E2l4BsJezPsd/byUOvdr5GXsSC6B4m
 KU+ubMkQcO00fHLw5G66jzVSQrWVzYB8LIl3/TqN9BZic2fbbXaYsQ3+/hGEdiyzUNOl
 fJLcGhVAY9GbAiDub32MCNfPpsxWb/v+Im1BHZRtHuaETgXNcVRy10kx4bf5oq5AHJD2
 d0nC0Pc67p+7kSP+dQhQmNbt/FXj0omcDqJDIUPXddQ0Q+LCji8lbLz54PhoQU+klfiq
 aMnD6Tgr+Jo0hHD2FEw+NMhiLaHvL2RTseC7ETPkPyTm1ES6Hw/IkkB3j+NdhToZhx+v
 GJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748979719; x=1749584519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSyG5GucZ6AHzHmHwEn8qWQPSg1ugWMZS3LrrRmBg9o=;
 b=FrtJQgH8Vg7uKMFwyoUpQPY3uKE9yPKzpR2OUNRyT8MQEuLs6Sx2UdFezFol6d8AMF
 2nktKbiNedw6EsIvPe5iYxC9BBMd+P+QDjBuf6F+PWh996g1jlw6ILN4G+dfU+3up+eA
 iNlspEwYqhJZmgX6mumQG30AEZbYVUc7XJRic0uulKM4TOpQh9IgfPGMnG7KfnzhMixX
 Gc/0d8SYrx/7MnRFbEXpY5ozS/AMDF+7qX/sajGBB9HZEyLNTsID4/nJ3YR5qGxf3Qo/
 16LE/fpuqM/23fr78Jf8mbtIbdDiZKOuhDf+qQCKvYjxk5szSHTJudkCPFYmRazoG0XB
 176Q==
X-Gm-Message-State: AOJu0YxBO85RVK6MCYec8oiQjb4dZJiMbfQumQkr7H11MLXBWoeXx8P0
 S5BcJu5O5y9Pou/HYXpKZGOObG8FhXhoJA2r482t4wQj+agzY7dkEUWJ/A0ocA==
X-Gm-Gg: ASbGncuS/li4BVsbpK1t4JzTyYuDOlHFNmvwMSvMhIL16e1+Y1J76QakcXqsrccCVOS
 KjFUuA/EI6jQJKSEZm909DazGWqEiAeVImsTvukIEiuVSgylWosjWs68a7X9wPcQ9KyPYP1hY1y
 B4qNbl0Y5MNkzmjQUtEWWuR4kBWh7YBzjZN/qmo3MzJnjXTDgow9jJxX6O0x1YlTHZeJO+ssaCc
 VvZ/cL4NPYwvR04LSmYy70B3HkRe1Mm6zw/bMGSQXCFL3odHJmsG6iuKLGfyNDTdg7dMyk+kQYG
 RBfSdLLKPc16OlM/KxTMMcYouIvfydqWN9PgKIi4qTvIT4/4Duljo2MAi0wEzUXcHAcwrjk=
X-Google-Smtp-Source: AGHT+IElN/Ck5z9ng0Rakn/a4qKt/JIiKWpHTNjCGckeAoEv0oDayE2LOTvb/CPVlFlHYkXf/jaksg==
X-Received: by 2002:a05:6808:1c06:b0:406:7a50:948c with SMTP id
 5614622812f47-408f0ff6cb0mr301894b6e.21.1748979718893; 
 Tue, 03 Jun 2025 12:41:58 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d19a:d10c:4358:1346])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c88f96sm1967615eaf.17.2025.06.03.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:41:58 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/4] Add DSI Panel for Gameforce Ace
Date: Tue,  3 Jun 2025 14:39:26 -0500
Message-ID: <20250603193930.323607-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the DSI panel as found on the Gameforce Ace handheld
gaming console based on the RK3588s.

Chris Morgan (4):
  dt-bindings: vendor-prefixes: Add prefix for Huiling
  dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
  drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c
  arm64: dts: rockchip: Add DSI panel support for gameforce-ace

 .../bindings/display/panel/himax,hx8394.yaml  |  17 ++-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../dts/rockchip/rk3588s-gameforce-ace.dts    |  66 ++++++++
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 142 ++++++++++++++++++
 4 files changed, 221 insertions(+), 6 deletions(-)

-- 
2.43.0

