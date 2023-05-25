Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6D71030A
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 04:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8510E490;
	Thu, 25 May 2023 02:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8D10E490
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:50:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-25345ca8748so874518a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 19:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684983013; x=1687575013; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmfOo8sqvCLi6YaDm0ju6+b60CNTopt6QJCHTuHnwbg=;
 b=yNFvwPzHm2u+wIivUiIK0StZNnna/Tvz3GNQeJfpN04nubgBREbFHY73W/FyvnHp07
 yAfy32xCDOWprRGkWrn21mWqyt0wblV06rIENOegGy0dUdkozr2b4lL94WY4bEJ93EeC
 yj4+73udxKROQDIvq5Gc1Tkh0UHg+ZGDeyIxDe35u18FjZuvdr1E17HVgOQaQnz7pv36
 47XZP2zG1hbouhKEdbSc73x2dF+0FQYfnfgQgXrJIxl+8TP0dsklBD3LUhjVBiiHUI/U
 RXhm+Ziy7X8zG3WH/LAPS99xOj1aDZsQtyFEz0euC2piejIZ1cLtZYI92fm08nKhYz0W
 aXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684983013; x=1687575013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmfOo8sqvCLi6YaDm0ju6+b60CNTopt6QJCHTuHnwbg=;
 b=Ufwlve8ShWczLIEagzcKX7JAf1w9Yd57xFon5XV8ZDZFJ/zjW31i98yKe4xfBwTQaO
 E1S85bPGXViEAYO8KIBTjoZkX7oy5dz8ao1WEo8DKp5yDabyF8I6L2zc0QHF7bxjQJP2
 3LiVCqf4V1IVyLZsTQsBV8ySXNiTuKjqSxC8cwcNJIBU1s5/Un/pABl+Qd+wLyyy2mUj
 Dlkad/ZCaQTTl9nNDclbExzDncV7wF3mhlhaxwlfmf0z/H+ObzrnwRRBIDdYpkEubJ+z
 VbgoKwJxLjWy6XdbnyVIEOjfmaifQR8wxMCKGJh8+6xU00JteyUsfT0osta6nMZuOJa6
 G/Ug==
X-Gm-Message-State: AC+VfDxnIDEHmOR1S8qxbUJ+s7FVeDIeldf9lrs0jb7uq+NOOHKo/SZC
 5sQjCBrSttH5UhhclYWwiO3Mqw==
X-Google-Smtp-Source: ACHHUZ73oWmUIbq8e5phwYNP5ISbTeZjLuYBFFgcLut1Bgh5/EgEoO1X+ScWTBtq4EyXoyFGpzfZmQ==
X-Received: by 2002:a17:90a:bb15:b0:253:3b17:de90 with SMTP id
 u21-20020a17090abb1500b002533b17de90mr88634pjr.21.1684983013456; 
 Wed, 24 May 2023 19:50:13 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a734600b00253239144c5sm171815pjs.42.2023.05.24.19.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 19:50:12 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@chromium.org
Subject: [v3 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
Date: Thu, 25 May 2023 10:49:56 +0800
Message-Id: <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compare V2: order of the tables match the order they're
referenced.

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

