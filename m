Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA453FAFD7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 04:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1F89D66;
	Mon, 30 Aug 2021 02:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62DB89D61
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:39:14 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so6062724pjz.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 19:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZWe9odMZgnt9mjtq2iv4uaqfnCxctrfiTl8at5lg+U=;
 b=H5JVPbTHC8SB8r/+TeRp4H245mDk6SyWLQnjgfEMHdAhlNV/mq4L5R5OVUT1A+px2E
 9k4RQmsdK8EjY8F/XWTekRCMfWyNMQkLrtF2uBaMaRH9b/4nR5u3vQ8chIh5pbV+gxvM
 cW1XDRcH3ABMFvihUp/VMVxbZr/M0RU85KKnFQyFOVwevLPn1O57O2ECc//J9MzbOJmU
 WthZaFTkf0SA7M/I9D5FzKm+pJIDPFEL+DZBJHj2YtfJ6jOHBAbXMNp6PPgJcfBMPIGD
 0CRLHlujjrFyWOICoDcacrvJD+h1qeFUNVv69/g8muXTHwq8LWUdPwpQDxBPLKqA7fCU
 Gm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZWe9odMZgnt9mjtq2iv4uaqfnCxctrfiTl8at5lg+U=;
 b=hMSCxjdKmosnkGOYixYcJ7G80anePhTYG0hW5HhiTJNTKfSrEo3Adp2E8bl7Ap91rA
 SFRrFM0bjL42Ztwu1aY3RMs/TKAJwnPimYvIBdabbK5Gp4zw3gzTlvBR0JuLvIh4n0Je
 5MMLbL6vENf7Xy33oo/49L/4UNPLumv7ou+f0HqeedRSVbl8i2yuH/ofbFMbvxv0eedL
 p9WsZ86JWfDdy7gsJ7XImvw3m6sF/71khT9REkfYHKJ62aObgepja1Zc4/FUu7HhNYM/
 sA/dE7ZZKsVb5q/E/9aBaUsbb0XqsxC8x0hsV/IwchoJ27r2y6x/PxzmPEb9gcECSMQ9
 Hydg==
X-Gm-Message-State: AOAM532QSvFYpys62bLjuaVEVo57/zrf13LRkRnyn2jiaO6ucKKDO15P
 73M09upQT6kWnEqtKHku0Uuwnw==
X-Google-Smtp-Source: ABdhPJyCt808VXD8pif69vuHIxZz9bz2CGJZPLiMhs3Yn7Mxjw9rlv0cHRIwrwSM44nC1ZLlM2qE3g==
X-Received: by 2002:a17:90a:598e:: with SMTP id
 l14mr36347757pji.28.1630291154320; 
 Sun, 29 Aug 2021 19:39:14 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id g13sm906839pfi.176.2021.08.29.19.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 19:39:14 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>
Subject: [v4 4/4] dt-bindngs: display: panel: Add BOE and INX panel bindings
Date: Mon, 30 Aug 2021 10:38:49 +0800
Message-Id: <20210830023849.258839-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
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

Add documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index a7091ae0f791..45bd82931805 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -26,6 +26,10 @@ properties:
       - auo,b101uan08.3
         # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
       - boe,tv105wum-nw0
+        # BOE TV110C9M-LL3 10.95" WUXGA TFT LCD panel
+      - boe,tv110c9m-ll3
+        # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
+      - inx,hj110iz-01a
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

