Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF6A2A952
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53C10E2FB;
	Thu,  6 Feb 2025 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="bRFO7kZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625CD10E826
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:13:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21f0c4275a1so12964195ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 05:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1738847590; x=1739452390; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xpq/JlGo1+gTZp4/L5XVxyxFvC99WE7FdLuLF6jJBik=;
 b=bRFO7kZoQAXu05LkGsHvP6U1xnpgQw9l4VzSVCcN5RR16YTgS/dN3qMF66OcB7bMjX
 5o9xDwgtK/lWBDxfrLKzZn8tvZj/Iy5eYG2s0UFMHXtpZfUuegGaFov8Z7510VV5Idtz
 w+rzmZBJcJSIRxLHLCnDJuVmDwXhAuLJvvVgiMmOs0ORTQsShEIeBIu1NOyVEN6jsjDo
 pOvJ5sCmblu+VRuyGQybTlpdZFp+C/ojTxEWP9iEDw52riaD0sPKCbGwEnaq8KES0fmV
 8mlQzOTLO57i0nHdLh7Q0DUI3RJ5fgr4Gsq8p3nhz/FtgwbFholcasNA3LHb9j/IeX95
 AP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847590; x=1739452390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xpq/JlGo1+gTZp4/L5XVxyxFvC99WE7FdLuLF6jJBik=;
 b=ch6artlkbHrfwV8j1OvTHcgazsIydRsEfZ4+lOMMcU36xqq3qHs59NlovvJsS45U0H
 vQP1EDRynTfGphEbKbzHhwkThQKnLWcxctCc2SlKS5p5aXX7FvxNyRu5CZGIB4FP7E5n
 3U2lNLNF04QkUcuOFWKxfsobDLJgo6mF+lUIt96WYTNG/dwG/GGp1K9aMCe0G+MHnbbS
 7slO8pYqLC3n98MzGBDuy/sIZIShlgt8JI6SG7ZtSQZTuRvIUu/BrjZZgQyPq3YJpota
 78DwsU1W39NM2ggPHpG/oWnAhjE7vlGwbaq4Iaajk5hKrSKJ+V4iFqEQpSX9u2FQQT7J
 6Q+w==
X-Gm-Message-State: AOJu0YxMIHk96n5xcoCiqQAbs/ZMJNaahwDiNYeKhrKx+1bxZOXWI5oO
 pTBI/K6FN/NFRRzmmX2Evfi4Gs7WDvnqeYL6s91ZY+9ihLar9RrShmXuX9PKqkI=
X-Gm-Gg: ASbGncsbTt+cSi07kJjP7TSxiI1JgI3cIgBhCoCUjrfECXmK9EhaT8CA2b17PBMnxZP
 nJZYFSam++UONcpdAvclpxOTmQgzECrdtz7V5Rp2duBe063zvxHWGkTrjxfjF0aHg+RV5J7b7XS
 0b1wHS+eFVFPmmHX4PPeGuWmazTn/0J/J4QaW4HmopTNcJ6hxx1gUz77qnPxs88jNbHwNZ87rZr
 BHox1tHywVFiK7RIb5xcGPgK7VUMe03X7sRAqGUPi2Zl7ghfegZI03ukOsmo1vclaECnZBD58tK
 U3QI4yZrXdjGfcsvSo7mRbJHJVbrzgcYewa6xfU2kkNSY/1hYUZUHHgbeOAQxdA=
X-Google-Smtp-Source: AGHT+IHxqvOKzx2p1ONEnCBXtdA3snICrOFz5MyCT5P71N4sfXoXnSCIV8+wBHTzkoWIRuASvb8hrQ==
X-Received: by 2002:a17:903:28d:b0:21f:14e3:165d with SMTP id
 d9443c01a7336-21f17f031a4mr124763555ad.44.1738847589822; 
 Thu, 06 Feb 2025 05:13:09 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:13:09 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] support for csot-pna957qt1-1 MIPI-DSI panel
Date: Thu,  6 Feb 2025 21:12:57 +0800
Message-Id: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

Add "csot" to the Devicetree Vendor Prefix Registry.
Adjust functions and default_mode/desc ordering to match bindings.

Changes in v2:
- PATCH 1/3: Add "csot" to the Devicetree Vendor Prefix Registry.
- PATCH 3/3: Adjust functions and default_mode/desc ordering to match bindings.
- Link to v1: https://lore.kernel.org/all/20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: vendor: add csot
  dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
  drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1 MIPI-DSI
    panel

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 123 ++++++++++++++++++
 3 files changed, 127 insertions(+)

-- 
2.34.1

