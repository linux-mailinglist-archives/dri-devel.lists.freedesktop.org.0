Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B858134BD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2589510E90D;
	Thu, 14 Dec 2023 15:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97D10E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:28:22 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6ce72730548so7572641b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702567702; x=1703172502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9CkKINM+/aPcMo5tRDcD7LWm4cDJht/J5IJH55/f6lA=;
 b=K1L++/uFt7nxnIyv/rK605RoUM/cQdT3jtgmZC1zJs3nMfU5MWPML1RvvbT/zr1LCZ
 OKhjmK4hBgqsOx6ljmIpRN9pDM43t5Ei3Ma8hxfqURPa118jhuksu/v1QZ5s9wBrPyjl
 oZwXQ891olIRab3btWCNk0NCEO1cUFg+4XyoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702567702; x=1703172502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9CkKINM+/aPcMo5tRDcD7LWm4cDJht/J5IJH55/f6lA=;
 b=Dio9NGqwApBNL9dugwsU9M+BVSF3yEcJomZtXr+5olUlyzWHoKBuy/zcFlXmcmEqlr
 A92BA76CJYBAJMWSJw8vyRe2PZy+9NRBaR5GHX0Cf1g6qnFVQAt9gXEaOTwDxiNCOZDz
 nqZtj2DJj2fg3nFR9zbgKv13dwXAObRouV8qzezOq9DRr6LA8BofkyqP8brv1R7FB6Ue
 dc/VPy6F42WwwwtYSxqfnDtGbgDeEGCD7QisG4VKHFnIa3aOeV/cAwMPax3bnInQAj/E
 9OLukuazUAydkqGOfIPKdmOiMPGUMuB7pzHwBFQfkpKvIlxDnjWHErbhZyF7Tnq4zn9y
 2T0w==
X-Gm-Message-State: AOJu0Ywp1Rjx2oZOxU207Jn+9PwecuS0kvV1ST7DhCKwEdsCNfmnm6q2
 SFsVoHnjanvdhofG685/QaMarg==
X-Google-Smtp-Source: AGHT+IFVpd7HM90GGPHMDCXvLlO+AseYoQy9SqoZkiiBOJY7xvw6IVDAwUP+f1hTU7nY4fn5zSUY8w==
X-Received: by 2002:a05:6a20:3b86:b0:18b:fc33:a617 with SMTP id
 b6-20020a056a203b8600b0018bfc33a617mr10380206pzh.1.1702567702487; 
 Thu, 14 Dec 2023 07:28:22 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:6530:8349:4ba8:984a])
 by smtp.gmail.com with ESMTPSA id
 b8-20020aa78108000000b006ce7bd009c0sm12281179pfi.149.2023.12.14.07.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:28:22 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/3] Support panels used by MT8173 Chromebooks in edp-panel
Date: Thu, 14 Dec 2023 23:27:49 +0800
Message-ID: <20231214152817.2766280-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 4 patches:
1. Add a new panel delay to support some BOE panels
2. Add panel entries used by Mediatek MT8173 Chromebooks.
3. Add panels missing data sheets but used to work in older kernel version
   without any specified delays.

Changes in v3:
- Collect review tag.
- Update the commit message.

Changes in v2:
- Add a new patch to sort the list, and rebase the rest patches.

Pin-yen Lin (3):
  drm/panel-edp: Add powered_on_to_enable delay
  drm/edp-panel: Add panels delay entries
  drm/panel-edp: Add some panels with conservative timings

 drivers/gpu/drm/panel/panel-edp.c | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

-- 
2.43.0.472.g3155946c3a-goog

