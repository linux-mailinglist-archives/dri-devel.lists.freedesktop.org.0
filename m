Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58E464B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC31289B30;
	Fri, 14 Jun 2019 16:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B4F89B38
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:44:22 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s21so1840217pga.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51aUrymmYRWhKwkwNUN7n3u+csGBwL1xctf+8Q7+DLA=;
 b=HB+Ctyh/Rj6FFlilSgS5sq804n50GDppJ3sLFPcaS1e1Po4aPUIo+vPakqiarRHT+D
 HMkPSmhk9ZtazYEj8BreATo8LxgFOsgZ+EN+UH3k0iBhQxIH0r1qWfTE4OIRykOtQxPV
 zOKe+RMj7FyNuYDkThyu4TlGxatN2N0xUlG9OiaH0mH7nSxS24EUhMiLvNk7Z2NzUMZC
 UwOo6KuC7WbKAf3MhtfzMq2/z6hCDkVXj48lcMVgj9BlHJvKW/UfVozLzdp0DdTv5o1R
 3qJoeExhuOUwdl9wC0cax8ui5eXbn3/HMn1ivcEuITZge9hI3TG/PbTwskHvJuG3bnKr
 MrFg==
X-Gm-Message-State: APjAAAXjoSl6KW8rahGyj40+YmSy7FrjqVbLrZMQfvS7+088/9bqIWyO
 om7fmBMydnipYWj/Pz4S6bakzA==
X-Google-Smtp-Source: APXvYqxIEAB3TnJlinO1JuDerapMhy6++MPoYsHomBgVQizAape63nc5jsF4hTcfUAlwbUSy7R0Mjg==
X-Received: by 2002:a63:894a:: with SMTP id v71mr28214299pgd.302.1560530657663; 
 Fri, 14 Jun 2019 09:44:17 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.44.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:44:17 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [DO NOT MERGE] [PATCH v2 9/9] ARM: dts: sun8i-r40: bananapi-m2-ultra:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Fri, 14 Jun 2019 22:13:24 +0530
Message-Id: <20190614164324.9427-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51aUrymmYRWhKwkwNUN7n3u+csGBwL1xctf+8Q7+DLA=;
 b=hUMZo4w/SMniB83kfAUVnrA1RyVuTWWVAwfEKLY87uPojuFk9UA3Vy/cV9xC+ppKpk
 h0M34u+54Q/wpDfLPPMp9cBRSyRxmEdcUOY/CyweTSAfzIv897kg3mVeMK/JE6GHuRxl
 KRyA05ziGi47yqSHGfgpH6GNszW5S1XRVp9f8=
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
