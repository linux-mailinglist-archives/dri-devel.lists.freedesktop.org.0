Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3F44C72
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EAB88F93;
	Thu, 13 Jun 2019 19:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253288F93
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:43:31 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bi6so8177037plb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/JBzTlaIRys/4FXlOVowrLaN7Y7ioCSg9apqikje/Y=;
 b=Z+ec0sbjc1h/8DV8EkP/O+tAKMwnZQFNf6vJ1QnCfrJie/+K3SAAqsBGHLT6EPASqJ
 59NXZRvV46D/rVI6TwRqwKUhKJt9XT86nZeQyjMOW0+5H4TBE4AiJlx5CcDfmYFEzATX
 I64X4mQse0EDZnlpm2DeE4DbPmwJpIxW9vNcwYuDAv9xkgoX+B01Hj57D8eJhcbLROgx
 VlvizU/QI3oBSIGYSIi9o6R8zsq42EYhfAQcfRw1FgQ0rahD8Lr0SBfIvNK93QsglSLl
 m1gOP5Ohm8QJzbvZdAD24F3LbAFOEsgpEtQccMfoHAFuOfI0Hf0qJyB59JDpLuZ4NhDH
 DSKQ==
X-Gm-Message-State: APjAAAWeD3VMlZ/5XxmMGyohdgzAGMYHWMsQylIQfol5FSQOpXzAwJS1
 1hKS+w4+Q1SUJpKaLR3m/ZgJ7Q==
X-Google-Smtp-Source: APXvYqy985in01FdAKRYCWFmFh62RofTuNsQ+FVfIK1rCnkbbPytQd81yY4V9MCH3ohqvL1VEyDFfA==
X-Received: by 2002:a17:902:21:: with SMTP id
 30mr88301989pla.302.1560455011492; 
 Thu, 13 Jun 2019 12:43:31 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id f2sm498807pgs.83.2019.06.13.12.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 12:43:31 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/4] backlight: Expose brightness curve type through sysfs
Date: Thu, 13 Jun 2019 12:43:22 -0700
Message-Id: <20190613194326.180889-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/JBzTlaIRys/4FXlOVowrLaN7Y7ioCSg9apqikje/Y=;
 b=gy6E/NSdOlgf6LDqxXvrrdZaWN9fZiGtU2p+2qfuTU2RRFBgGSCkswaDXP5lnek7Gt
 gIVtAu43gayoXBKbFHeReMDQsGHMe0OrC+LStPfMP/aB3BLgPDlqHg6jhTl5BH7TWDvR
 ALcClNEmwV9FnItsyQwG8b7Eyniz5DLVJMvZ8=
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
cy1iYWNrbGlnaHQgICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9iYWNrbGlnaHQuYyAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrCiBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyAgICAgICAgICAgICAgfCAzMCArKysrKysrKysr
KysrKysrLQogaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaCAgICAgICAgICAgICAgICAgICAgIHwg
MTAgKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWNs
YXNzLWJhY2tsaWdodAoKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
