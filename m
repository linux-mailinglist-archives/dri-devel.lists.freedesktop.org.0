Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1FA44B45
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D47898C4;
	Thu, 13 Jun 2019 18:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161F898C4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:29 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k187so50211pga.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51aUrymmYRWhKwkwNUN7n3u+csGBwL1xctf+8Q7+DLA=;
 b=H4AXX8FC/QvHV4NLrwTgqqAcYXNjJkLgDuxYpkEHwpk9BzGwyWIxqqyRx0quzjlHDs
 ihS9igoFgfY6unv7ERUBmtOVTzf60Whk/MwP4TvDj71kkzbtFbvja2b2YZ5x2WCM9Qy/
 vt3AiyDA0SLuewdG5DqjWpUNYQX8VRczJTeQYYr36SnrqfN5SpN0ewhGvXXUBb8uo9d7
 2vh0SCvNAlJLApegO7Vo2fc1wMUs4YkgbuxtankY8Co0+RAQALMwJv0RqMjAOipAIv9v
 aA7d+SOEP8stqilY7OxdV7R6WDJy0c8nil7rQ+uj4guaXmV2YHkR8uhoCeNa7zLFB1Qu
 28OA==
X-Gm-Message-State: APjAAAU5Q1ug+4zJ+yj3f95o4MxSjE4ek4o8S0rgNXfCoxHxAp4cIqIN
 ewXaCbF8RQBRu804VDxpP5nePw==
X-Google-Smtp-Source: APXvYqxqijGllEM8BePLuPvJoKeIttgVA+/8EZLqrhEKLrYZeUUspp4gxqijr25B/gWI/ezvpiv7Dw==
X-Received: by 2002:a17:90a:2e87:: with SMTP id
 r7mr6985533pjd.121.1560452069402; 
 Thu, 13 Jun 2019 11:54:29 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:29 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [DO NOT MERGE] [PATCH 9/9] ARM: dts: sun8i-r40: bananapi-m2-ultra:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Fri, 14 Jun 2019 00:22:41 +0530
Message-Id: <20190613185241.22800-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51aUrymmYRWhKwkwNUN7n3u+csGBwL1xctf+8Q7+DLA=;
 b=obuL5/C42QfViGv2M11cQMRWQiX1z9dY9xUgzGHJ8NeL1sx8uHGlJasRlLYFQ1YskL
 8eAvCBiXsgXvWRYkP5PhrvbLIdNNx755GmlgY6YtPlRzIgCm6Xdv5D952vrXYOR1+On2
 2woijmdL+4cAKfID+4iZjOSHRiu1BqYj3E498=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU0yVSBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRENEQzEgYXMgVkNDLURTSSBzdXBwbHkKLSBQSDE4IGdwaW8gZm9yIGxjZCBl
bmFibGUgcGluCi0gUEQxNyBncGlvIGZvciBsY2QgcmVzZXQgcGluCi0gUEQxNiBncGlvIGZvciBi
YWNrbGlnaHQgZW5hYmxlIHBpbgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4uL2Jvb3QvZHRzL3N1bjhpLXI0MC1iYW5hbmFwaS1t
Mi11bHRyYS5kdHMgIHwgMzYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yNDAt
YmFuYW5hcGktbTItdWx0cmEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLWJhbmFu
YXBpLW0yLXVsdHJhLmR0cwppbmRleCBjNDg4YWFhY2JkNjguLjVmMzkzMTdiNzgzZSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLWJhbmFuYXBpLW0yLXVsdHJhLmR0cwor
KysgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yNDAtYmFuYW5hcGktbTItdWx0cmEuZHRzCkBA
IC00NSw2ICs0NSw3IEBACiAjaW5jbHVkZSAic3VuOGktcjQwLmR0c2kiCiAKICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wd20vcHdtLmg+
CiAKIC8gewogCW1vZGVsID0gIkJhbmFuYSBQaSBCUEktTTItVWx0cmEiOwpAQCAtNTUsNiArNTYs
MTQgQEAKIAkJc2VyaWFsMCA9ICZ1YXJ0MDsKIAl9OwogCisJYmFja2xpZ2h0OiBiYWNrbGlnaHQg
eworCQljb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOworCQlwd21zID0gPCZwd20gMCA1MDAw
MCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+OworCQlicmlnaHRuZXNzLWxldmVscyA9IDwxIDIgNCA4
IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8OD47CisJ
CWVuYWJsZS1ncGlvcyA9IDwmcGlvIDcgMTYgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1CTC1F
TjogUEgxNiAqLworCX07CisKIAljaG9zZW4gewogCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjEx
NTIwMG44IjsKIAl9OwpAQCAtMTE3LDYgKzEyNiwyMyBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07
CiAKKyZkcGh5IHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismZHNpIHsKKwl2Y2MtZHNpLXN1
cHBseSA9IDwmcmVnX2RjZGMxPjsJCS8qIFZDQy1EU0kgKi8KKwlzdGF0dXMgPSAib2theSI7CisK
KwlwYW5lbEAwIHsKKwkJY29tcGF0aWJsZSA9ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2LWljbjYy
MTEiOworCQlyZWcgPSA8MD47CisJCWVuYWJsZS1ncGlvID0gPCZwaW8gNyAxOCBHUElPX0FDVElW
RV9ISUdIPjsgLyogTENELVBXUi1FTjogUEgxOCAqLworCQlyZXNldC1ncGlvcyA9IDwmcGlvIDcg
MTcgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1SU1Q6IFBIMTcgKi8KKwkJYmFja2xpZ2h0ID0g
PCZiYWNrbGlnaHQ+OworCX07Cit9OworCiAmZWhjaTEgewogCXN0YXR1cyA9ICJva2F5IjsKIH07
CkBAIC0yMDMsNiArMjI5LDEyIEBACiAJcGluY3RybC0wID0gPCZjbGtfb3V0X2FfcGluPjsKIH07
CiAKKyZwd20geworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZw
d21fcGlucz47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJnJlZ19hbGRvMiB7CiAJcmVndWxh
dG9yLWFsd2F5cy1vbjsKIAlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwyNTAwMDAwPjsKQEAg
LTI5MCw2ICszMjIsMTAgQEAKIAlyZWd1bGF0b3ItbmFtZSA9ICJ2ZGQxdjItc2F0YSI7CiB9Owog
CismdGNvbl9sY2QwIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmdGNvbl90djAgewogCXN0
YXR1cyA9ICJva2F5IjsKIH07Ci0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
