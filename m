Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBB20EE92
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 08:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025D89C1A;
	Tue, 30 Jun 2020 06:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1085589C1A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 06:33:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dp18so19302205ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=LKk+ToMYOSb4aJWV3VDZbncQS34JtMoR633gXdO/qgI=;
 b=pX1Se9MCK8k/fFIkCKjh+uSzWvSKaznj1e0ZIJzbm4hgsCJKOF8N3IMuOmvu9iHe3V
 XSKK3F3SNMCwRJhlnRmNKlC0kfwXXDJLxmoTE+/lKtniP+k+pFYVwxLlNyJDR9xV5LsM
 x2NUytvC5oNT028bAHQYbzjwxuyu7y8Hu0G5+QONwYd2k6jsIwPbls6D0m4eKBdUgmvg
 AuisDPb0YukVBZ0J298DqH72osWlrf1NJA94nUim6SaB0kzDnz0clQW2mUW267Ez/lP2
 Q4KfZzsWoYnkP5DN8Sfu9eUGEKid4CMgUrQOVF0Zep0gHkZ03SDwrba3dZCAz47wcigh
 OngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=LKk+ToMYOSb4aJWV3VDZbncQS34JtMoR633gXdO/qgI=;
 b=dTdzHPgK63KcRLBDW9GF/FaMV5w2/KlYGYYkPGDtdpXqbiud2l7Yl/jnIDEF9N6COI
 9pkPwRaryVST9dadElF7o/I3TQ5TiA/mbga4it95Ae9rPxEhGXrr24johpBXuEHJmbxU
 L+Hl2v9pgka6Idr4XjUJDJGNaV3rBaB2TrGdiKgbxndFaIOEZoSP4oK34qJNoq6qSSI/
 HH8vkhHygbt0Ws8flFRIvguC4ID2J6pF/XbCqwxwQGBkScjouVSWpjQnwgZZo9maR1H7
 q9q3KqxHKfpBieGL5pn3CgvByRjPwcveK42dT4rQEcG8Fk3eK2u7iPGEi5KcfyUDn+Ix
 zT4A==
X-Gm-Message-State: AOAM5336etGpk+BDHesjVqmww8HLMfYtecDJ3pW7/79v+bHZViezfLNR
 WSFRPlPKBQj9D1iniusXmm5eRVyWztjVwXKb/Mqclyrt/4g=
X-Google-Smtp-Source: ABdhPJxdHmT0ExbAB75JmBzqcJQx3eCX2i8EvMbJXdrXJG4pkJZZcoL3q5JBprciDPUNimJ/TawmNz+ZtkO4ZQuEJIk=
X-Received: by 2002:a17:906:70d5:: with SMTP id
 g21mr506912ejk.340.1593498828450; 
 Mon, 29 Jun 2020 23:33:48 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 30 Jun 2020 16:33:37 +1000
Message-ID: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
Subject: warning in omap_connector
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExhdXJlbnQsCgpJIG1lcmdlZCBkcm0tbWlzYy1uZXh0IGFuZCBub3RpY2VkIHRoaXMsIEkn
bSBub3Qgc3VyZSBpZiBpdCdzCmNvbGxhdGVyYWwgZGFtYWdlIGZyb20gc29tZXRoaW5nIGVsc2Ug
Y2hhbmdpbmcgb3IgSSd2ZSBqdXN0IG1pc3NlZCBpdApwcmV2aW91c2x5LiAzMi1iaXQgYXJtIGJ1
aWxkLgoKCi9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9jb25uZWN0b3IuYzoKSW4gZnVuY3Rpb24g4oCYb21hcF9jb25uZWN0b3Jf
bW9kZV92YWxpZOKAmToKL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jOjkyOjk6Cndhcm5pbmc6IGJyYWNlcyBh
cm91bmQgc2NhbGFyIGluaXRpYWxpemVyCiAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbmV3X21v
ZGUgPSB7IHsgMCB9IH07CiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KL2hvbWUvYWlybGllZC9k
ZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rv
ci5jOjkyOjk6Cm5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhuZXdfbW9kZS5jbG9j
a+KAmSkKCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
