Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FE63B8A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED5789FBC;
	Tue,  9 Jul 2019 19:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EF389FBC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:00:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i8so9889814pgm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 12:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agNl784XHpZcC5LqJknrXQYgxU0CtqquUElpKGVsi2U=;
 b=GQ74zqAw7apDmhuMx9WRwaOzwRPiyskB1evj7YpP94wY06rOQPG7TinU+UnvBHkvfK
 A9/LxHbQJcnWeUhQQ6jX+P1S1D0Y39LcWR5a88akLD2hAM/cvtSXreq+7/BBcw09cLPo
 CwoH3Fke6Q3lzddEuQHuSXQsywYW3xm8hh0MRsBJYk1Qgsad9QKaV2JgkLmldn43oLm0
 EsZIA6+AdKUxul+gOfct0/C/I3+VWsKvOwbvZSBWNNbgM5ZKUIfZMlzHT7BJHwFYwgGR
 9ehhBVqhhQYZmR9LZbgsqvUjBcNkcgfT/oiMKQ2z1+KeK5GUD/35Xsf7vErbx4/eYM/A
 3w+g==
X-Gm-Message-State: APjAAAUfAIDbeNfkVnQZr1hUjGki4CrUrhXzLXmDcpl1DanxNUhGh9Ny
 IIVUsl/vfin3Bq9PORScyLw5cg==
X-Google-Smtp-Source: APXvYqzgiljPNQtmksVwQeu0mnKjNy5a2B+0y32N9WtWnsDmQw+D32h0y78iStJjuRbgrXwJH1vfTw==
X-Received: by 2002:a63:1658:: with SMTP id 24mr33215318pgw.167.1562698812609; 
 Tue, 09 Jul 2019 12:00:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id x26sm22747410pfq.69.2019.07.09.12.00.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 12:00:12 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 0/4] backlight: Expose brightness curve type through sysfs
Date: Tue,  9 Jul 2019 12:00:03 -0700
Message-Id: <20190709190007.91260-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agNl784XHpZcC5LqJknrXQYgxU0CtqquUElpKGVsi2U=;
 b=mM+cViIx9xyiXexrT0Zh5UFoRyGLEmGjKHq5xGLVtu+6hX2D9Xflb35m087yPOGTEv
 2Xd3YFtFbsxce06tMJnfUqCnxvQ8BI99jPS6rnPRrckKhk2lty/H/3JDLY34nN0jGr+0
 Jhznan7TeSV+j2PqhnFvH4vf4Y2JUaaRQLcvs=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVudCBzaGFwZXMuIFRo
ZSB0d28gbWFpbgp0eXBlcyBhcmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1
bWFuIGV5ZSBkb2Vzbid0CnBlcmNlaXZlIGxpbmVhcmx5IGluY3JlYXNpbmcvZGVjcmVhc2luZyBi
cmlnaHRuZXNzIGFzIGxpbmVhciAoc2VlCmFsc28gODhiYTk1YmVkYjc5ICJiYWNrbGlnaHQ6IHB3
bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRApsaW5lYXJseSB0byBodW1hbiBleWUiKSwg
aGVuY2UgbWFueSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgpsb2dhcml0aG1pYykg
YnJpZ2h0bmVzcyBjdXJ2ZXMuIFRoZSB0eXBlIG9mIGN1cnZlIGlzIGN1cnJlbnRseSBvcGFxdWUK
dG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4gcmVsaWVzIG9uIG1vcmUgb3IgbGVzcyBy
ZWxpYWJsZQpoZXVyaXN0aWNzIChsaWtlIHRoZSBudW1iZXIgb2YgYnJpZ2h0bmVzcyBsZXZlbHMp
IHRvIGRlY2lkZSB3aGV0aGVyCnRvIHRyZWF0IGEgYmFja2xpZ2h0IGRldmljZSBhcyBsaW5lYXIg
b3Igbm9uLWxpbmVhci4KCkV4cG9ydCB0aGUgdHlwZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2
aWEgYSBuZXcgc3lzZnMgYXR0cmlidXRlLgoKTWF0dGhpYXMgS2FlaGxja2UgKDQpOgogIE1BSU5U
QUlORVJTOiBBZGQgZW50cnkgZm9yIHN0YWJsZSBiYWNrbGlnaHQgc3lzZnMgQUJJIGRvY3VtZW50
YXRpb24KICBiYWNrbGlnaHQ6IEV4cG9zZSBicmlnaHRuZXNzIGN1cnZlIHR5cGUgdGhyb3VnaCBz
eXNmcwogIGJhY2tsaWdodDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3IgQ0lFIDE5MzEgY3Vy
dmVzCiAgYmFja2xpZ2h0OiBwd21fYmw6IFNldCBzY2FsZSB0eXBlIGZvciBicmlnaHRuZXNzIGN1
cnZlcyBzcGVjaWZpZWQgaW4KICAgIHRoZSBEVAoKIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1jbGFz
cy1iYWNrbGlnaHQgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvYmFja2xpZ2h0LmMgICAgICAgICAgIHwgMTkgKysrKysrKysrKwogZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvcHdtX2JsLmMgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysr
LQogaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaCAgICAgICAgICAgICAgICAgICAgIHwgIDggKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtY2xhc3MtYmFj
a2xpZ2h0CgotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
