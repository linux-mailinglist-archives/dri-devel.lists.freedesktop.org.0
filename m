Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6511CBB00
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 00:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB326E2C8;
	Fri,  8 May 2020 22:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F986E21D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 22:59:23 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 207so1544967pgc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
 b=n9+oTteokcsg2gGmnR4zRXRtCjsq5CrG2/r4VvKp5PLRS6msCbvUx5BSWg8VI7PfNH
 fzOsZRW3n3BzVqfaRQEfeYZ0ExlYzMI38EGyARXFt1+uLUQiP9Ay33UhJpvbrHKTotIb
 LxOQG9/Gg5iz7YwU/lMlQXNVEpWwfcZUhnxWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
 b=FYaVbhDPJT8nOWNK87tGIN1rwKTt+5D8ZmWNYFmDNgfG4fbxdGVL8JibgdjcpKnQZ8
 9dIcgZgk4PKeJ2OrOWdSJ5FHX0HbHnFVXHDDd/qt7F+SVDvmnSnngfkQ4kU5fuS9Lpbp
 n/edMjF0jnikagpgWtjjanbyafMCBNColdzFAIu6xzcZSDJzv92AXkocyofeNYXBPri6
 XblexQRK/WujlceboknEx66BnWUrpo6nFNaBCPkgTQWxZ5tgncabNGuXrskOBAxrBtub
 Bmf2a6QhjyWWsGfqRLPlteY7O1i9PT+5m6npLMMjvqJK4GHiV0PAydwDCZyKqQhl9Coc
 AcJQ==
X-Gm-Message-State: AGi0PuYgFGU3jTTMHq6JIuUILi/kpy6DEW7Ju5W4KpruPqIywO6p6qm3
 ywvkfWHt50VzxrpgdTkSXiNlMQ==
X-Google-Smtp-Source: APiQypLZztC92CaipNrfEO6dJof+q2mxxAWh+ZlB67X3GIWQuimnyFCwmWlKu1p11C9clTK29MCtRg==
X-Received: by 2002:a62:780b:: with SMTP id t11mr5202971pfc.196.1588978763500; 
 Fri, 08 May 2020 15:59:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 15:59:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add BOE NV133FHM-N62
Date: Fri,  8 May 2020 15:59:01 -0700
Message-Id: <20200508155859.2.I37c879ef4ec6d4028a3d45728bc3a58060bba175@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel appears to be the same or nearly the same as the BOE
NV133FHM-N61, but since (in the very least) it identifies itself as a
different model in the EDID we should add a new compatible string for
it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fdd74d07f645..d6cca1479633 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -75,6 +75,8 @@ properties:
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n61
+        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
