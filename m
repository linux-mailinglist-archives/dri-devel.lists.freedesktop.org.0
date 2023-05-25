Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC47108EA
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 11:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1D510E868;
	Thu, 25 May 2023 09:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82D310E868
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:32:07 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1afeec98a00so8328095ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1685007127; x=1687599127; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pI/JSFAyYGipbA4uL3stbZaz5dYY5JtH3gdway4WSgc=;
 b=boYi4NLXerPw97PswPhsYDxCqgI3jujXAEbpHtDkemVKS062IlrXyMZhbtOF9TaRoo
 +OzXk1JU0LSMpCbkRh+BZ/uDUJvB2a7ztAgzldZetfGDqCnkz+pGZMeBexDuysX9hZIu
 kxRcTZDTIZM4P6pS6txQn9r0Kh/TzgNw4vAuQ9JTdvD+sOsiL+X9pz55tgLfGs66x1wF
 eLc29YlpeDTWc2OBGjesOdLGkLPpkXN2Yds1JXO0bKKcHu/ob3hxp/zv7E620ZYBIfKd
 Q4A036oUJoe0N92ikeeKm4WlmbKHOvcI9FgxHcDRYv3PbODFzFy5JFKi6O/+pDDMftSF
 x7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685007127; x=1687599127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pI/JSFAyYGipbA4uL3stbZaz5dYY5JtH3gdway4WSgc=;
 b=garl0heTkmkw1yNZ35MOuO9GuKGH/TiKFSzEIiHyLYAgDZvjb6vFmA0Fx2pOrxO8Xw
 c+fVkUoPdnzR+ZEUspkz+pxYjvRUvhlmGxmehPmh1jHVqNVp/pmZWFUfpzZ8xXb5C42D
 DVtqJjtuXjHuB/L6NvicTa3yx3Jw4ZngcuQQMHlSs1WPsbDJziREEEmz2GC5FPV8avAA
 Yrl2liwxWb0srmYHtqZKY0xGcX9h/BB8idfxPQwCAC8qLzs9evzOYT2i3ETOppwEi7v7
 lVNkzpVmOlGBWEn0AlpfAZBYZV9YCOTKo4SGOAQTiJC0tUDHg2AlafyNee9wblsIhQrS
 RO5w==
X-Gm-Message-State: AC+VfDxHXVUrknme8KjfCWEWJCGt5v35zRYwJ15k85pKGiLkK5yD23Fu
 cGcibUpoANqOxt0Kzl+yZX46ULLzedszg9JdW+U=
X-Google-Smtp-Source: ACHHUZ6Gpg14W4sxMXQqBgOORHLA/TU8V3NBkldPWO4L0bafwxjOTd6MsgABzWE6mFVD+PVFtrvdkA==
X-Received: by 2002:a17:903:124b:b0:1ae:a44:841c with SMTP id
 u11-20020a170903124b00b001ae0a44841cmr1157895plh.42.1685007126912; 
 Thu, 25 May 2023 02:32:06 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001afa7040a70sm951039plf.276.2023.05.25.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 02:32:06 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v4 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
Date: Thu, 25 May 2023 17:31:47 +0800
Message-Id: <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
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

Copare V3:Resend without Conor's acks on patches 2 and 4.

Cong Yang (4):
  dt-bindings: display: panel: Add compatible for Starry himax83102-j02
  drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
  dt-bindings: display: panel: Add compatible for Starry ili9882t
  drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel

 .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 471 ++++++++++++++++++
 2 files changed, 475 insertions(+)

-- 
2.25.1

