Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727A59C587
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC79141A;
	Mon, 22 Aug 2022 17:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B412B647
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:54:38 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id 2so10640246pll.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kVfoZhmtTtg50QC8HN2WpAxI8M7n5JgORmykDE3kKsE=;
 b=ex8+AFJr958wVkeLDtFOFTNG4S6PuxUOEUJ302qWzN1ns6MzQDhh5xNOf4cebaELXZ
 JE1xEvJAZda5+vGNaYhg6BZGpjObgPfWfjcOuxsDsYZnZwgue3H5y1XospGYbe1b49kd
 s6JAibLMo8RrAbyiGULc8Eu4sz1YYttLG+pTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kVfoZhmtTtg50QC8HN2WpAxI8M7n5JgORmykDE3kKsE=;
 b=fp+lYhTLMerFRwIltZFBNhlwBM/Ejf2j8S5HIZjdOoepzOfWLGDcphA99E51fXkMgD
 jTVhkKofuUDkVJ61qWeBY29eED8/QxppPFL1OjuKaQx1kb67gB9VWOI3BAe5u9/RXAsT
 sc1J8Ym0OlUNq7/NYCYOaW5ZckIunYu25TKCXS5XhJFcuGq0J864YW4JGJProgEJ8ubW
 sJvyqztca5s1VHR1ECsCeNv9xCLvtw+yc/FqXs2+O+hLnJnUTRjQteE/SvN/cqueEupu
 JXv7R4IpFQRolxqqDSbv35W5TTKbw19SdNb4Po9Sb7pKJ+jVSm2b+zthRzAPnoZDu3lE
 zV+Q==
X-Gm-Message-State: ACgBeo2YwTXgTvUOy2rMHBitbIWVGvNNpJdlfB9McOyZsGwilPnX06rn
 1abwvsXJWKWX/1fX9hGczM1TWci3qQ517sZH
X-Google-Smtp-Source: AA6agR57wxjf/2ZQ0TI1hnwsMJDxfzNE1alik7oxQcsLCLejTac3WzelCkKFF9Ccs9X2LyWZYvgSjw==
X-Received: by 2002:a17:90b:4d0e:b0:1f7:ae99:4d7f with SMTP id
 mw14-20020a17090b4d0e00b001f7ae994d7fmr29382895pjb.200.1661190878070; 
 Mon, 22 Aug 2022 10:54:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:2d6b:83ed:6a4a:9f9e])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa7990c000000b00536431c6ae0sm5297578pff.101.2022.08.22.10.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:54:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for panel-edp.c
Date: Mon, 22 Aug 2022 10:53:59 -0700
Message-Id: <20220822105340.1.I66a9a5577f9b0af66492ef13c47bc78ed85e5d6b@changeid>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panel-edp changes go through the drm-misc tree (as per the "DRM PANEL
DRIVERS" entry in MAINTAINERS), but ever since splitting panel-edp out
of panel-simple I've been trying to keep a close eye on it. Make that
official by listing me as a reviewer.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f9366144d31..fc62434f693f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6343,6 +6343,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 
+DRM DRIVER FOR GENERIC EDP PANELS
+R:	Douglas Anderson <dianders@chromium.org>
+F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
+F:	drivers/gpu/drm/panel/panel-edp.c
+
 DRM DRIVER FOR GENERIC USB DISPLAY
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
-- 
2.37.2.609.g9ff673ca1a-goog

