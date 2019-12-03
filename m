Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822D110134
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E146E9CC;
	Tue,  3 Dec 2019 15:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC75A6E9CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 15:26:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 21so4335651ljr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 07:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sm3QHMu/Fk8SMomPjdukInd9S9h4QQbvy1NjNDZ1Z8=;
 b=UQ+xzW/jb0QGmAGHBRmnr+QI7UI3Jgk3OQXdI1m9ttxdYl4cA50EqXNv2xIqTUlfrc
 00oLTcZcUyAL2Bbx+0SHowYE+4f8pcjM1QnD2tXoMGBtg/lDDLFZo4aKV2E73kUzPuMU
 P9VMXTQ0nOqk2z1LRUVY124hb+BYviEmpsX17dq4BiSPyQ02kEqAyxl+bb2/XxcHKfLb
 KeKiwgBzJ4iTE9BXtOXvqSUU5zkF5bsTKUcCXGTk5Arpz7f1wD7jsYRfrzvnRId/c+Hy
 Zf9rtQalv/3Kl4foGsYW4iNz3hENTyjoEFVhr3xh9UjM/aawfKQpob4f3JT5kkNK+pcj
 kctQ==
X-Gm-Message-State: APjAAAW1xfbOupDJ3FM6SZeDHP9bWPV6tWlK86sm7A+ZzVY7OCHTPrVb
 HtLaX1szRNu+l1mfJEEpQpiVuA==
X-Google-Smtp-Source: APXvYqx62wGzY0ep5deX/bLZdFdfJNeqmA4FvhANsSoZiwOuLRXzfxKFrrm0e7MP5XqQduPglwXjEA==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr2879741ljj.97.1575386818091;
 Tue, 03 Dec 2019 07:26:58 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id s20sm1537955lfc.8.2019.12.03.07.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 07:26:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH] drm/panel: rpi: Drop unused GPIO includes
Date: Tue,  3 Dec 2019 16:26:55 +0100
Message-Id: <20191203152655.159281-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sm3QHMu/Fk8SMomPjdukInd9S9h4QQbvy1NjNDZ1Z8=;
 b=Jr4C+2/ujTKurV2QJQhUtbwjQrMzkKFHI8uQz2nnrqfT5m41Qmb9GBm3ixqTqSwfGc
 XDszg95N/QuqIyr8RCX/sMHYKf2byPH2/Wz6vM9Qsrbs3E6Jvs4kv1ti+3sHWvfMuNmC
 gnL50cicbuGinl4ultl+Ex1o0ZrBwo0hnlGFA7fSwYS8ZDqBLXmaJ/jUOD5GDEPp5RLq
 8N7BQ4pF3WI4nxTDa9lhMsOwEvWYhGhip16kGTtwJh4gYC0I+oErCz8cA9PH/XmaN+DV
 brEEm2Kt2i5ytNzAS5NGCTst1S3+dSqyqUIg1/5a8Ko0iQfghZzkiVVLiYkJjjQMogVl
 9byw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFJwaSBwYW5lbCBkcml2ZXIgZG9lc24ndCB1c2UgYW55IHN5bWJvbHMgZnJvbSB0aGVzZQpH
UElPIGluY2x1ZGVzIHNvIGp1c3QgZHJvcCB0aGVtLgoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFu
aG9sdC5uZXQ+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91
Y2hzY3JlZW4uYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVl
bi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVu
LmMKaW5kZXggMDk4MjRlOTJmYzc4Li5hZGYyZGFjZTk2ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCkBAIC00NCw4
ICs0NCw2IEBACiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIu
aD4KICNpbmNsdWRlIDxsaW51eC9mYi5oPgotI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KLSNpbmNs
dWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvaTJjLmg+CiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
