Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CAF38544
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB089A4E;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AA3899DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d126so470417pfd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgdOwNqnp0Gjq+joA7V9mjgAs2NzHLkYxSFjvzUHs/4=;
 b=Qr6uoTvU9xCjLAsMnYNPNkhLkmgKzh9W68AhHBbjC6fOuYWYbB/I2dGk/bVJ3RnHgf
 qDpinByrnZFHJpAIkfk/EFHvNUIJC8ztLIDoATJOFKMZqI4xal7s0gyLq6yaFG8vZ2qX
 8IiNXl9MhE7SrE6M7sCcwddSsEQKar3w5cW3U0d5wcTlO/5JIKyWWZJqs9ZN9qHHaXJ8
 SptWwIqLSb4TzUMU2jvqHEkZH2xD7+rrFMUj1XO6F9KIbwFbkRqFzGXEnK1hZCIuO439
 HzaXHyrT3dT8tw/iv4hAghfhEm1Gm5wSAhbc0/FreYit7k+W+ORHe2jj22jA/W43ZAU7
 1Uxw==
X-Gm-Message-State: APjAAAW4xi4XiZbHp6J9SIm91Rt/9NeSMqoFGObEkRpfgJZ514h0LFxs
 4sNiHG4il0KoGSzFUQi1t96ei2aZ1AI=
X-Google-Smtp-Source: APXvYqwam1URsEmZ2ebvDAJp9wTGRh+FONNBUjqu1HieSfLQJEb70uedTW5rIv5SrW0eyZuq8n3sbw==
X-Received: by 2002:a17:90a:8a15:: with SMTP id
 w21mr3466223pjn.134.1559882808233; 
 Thu, 06 Jun 2019 21:46:48 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:47 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 14/15] drm/bridge: tc358767: Drop unnecessary 8 byte buffer
Date: Thu,  6 Jun 2019 21:45:49 -0700
Message-Id: <20190607044550.13361-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgdOwNqnp0Gjq+joA7V9mjgAs2NzHLkYxSFjvzUHs/4=;
 b=PKR+7BpHUqh9GPIvN/+gvMrt3/i06c2a4yG7H7lAt9it+e9pwhD89xHu5hQbjFYXdP
 nmRgQJok/Hr387ZkXklBGvhq2JqdoEOFBbvC25tATmTCNTIuKBb6ibpo1bI70IpSwxvh
 KucuQHoiW7spWGd3Y7TbTrJmxg5iPg7Da8zX5UpzUmv1hoEl+YyTSSBARw2fZ7pYM0pf
 +UnPqJxfEmCbytrWwfBMI74b/45bYMNX4RXB/co/Q0dabWVIw9LEF0g+Gjw639/Tmx85
 Mdbw3ldo2JokvyVKamus/loaq4u5DC5L/LFuxuN3Kj5qh2OHtBR+3EYEoNpwWHHNdl3U
 84yg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNfZ2V0X2Rpc3BsYXlfcHJvcHMoKSBuZXZlciByZWFkcyBtb3JlIHRoYW4gYSBieXRlIHZpYSBB
VVgsIHNvCnRoZXJlJ3Mgbm8gbmVlZCB0byByZXNlcnZlIDggZm9yIHRoYXQgcHVycG9zZS4gTm8g
ZnVuY3Rpb24gY2hhbmdlCmludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3Yg
PGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzog
QW5kcmV5IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBo
aWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5
LnR1c2FyQHppaS5hZXJvPgpDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzog
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMTMgKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKaW5kZXggZTc0N2YxMDAyMWUzLi40YTI0NTE0NGFhODMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKQEAgLTY2MSw4ICs2NjEsNyBAQCBzdGF0aWMgaW50IHRjX2F1eF9s
aW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0YykKIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlf
cHJvcHMoc3RydWN0IHRjX2RhdGEgKnRjKQogewogCWludCByZXQ7Ci0JLyogdGVtcCBidWZmZXIg
Ki8KLQl1OCB0bXBbOF07CisJdTggcmVnOwogCiAJLyogUmVhZCBEUCBSeCBMaW5rIENhcGFiaWxp
dHkgKi8KIAlyZXQgPSBkcm1fZHBfbGlua19wcm9iZSgmdGMtPmF1eCwgJnRjLT5saW5rLmJhc2Up
OwpAQCAtNjc4LDIxICs2NzcsMjEgQEAgc3RhdGljIGludCB0Y19nZXRfZGlzcGxheV9wcm9wcyhz
dHJ1Y3QgdGNfZGF0YSAqdGMpCiAJCXRjLT5saW5rLmJhc2UubnVtX2xhbmVzID0gMjsKIAl9CiAK
LQlyZXQgPSBkcm1fZHBfZHBjZF9yZWFkYigmdGMtPmF1eCwgRFBfTUFYX0RPV05TUFJFQUQsIHRt
cCk7CisJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX01BWF9ET1dOU1BSRUFE
LCAmcmVnKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZHBjZF9yZWFkOwotCXRjLT5saW5r
LnNwcmVhZCA9IHRtcFswXSAmIERQX01BWF9ET1dOU1BSRUFEXzBfNTsKKwl0Yy0+bGluay5zcHJl
YWQgPSByZWcgJiBEUF9NQVhfRE9XTlNQUkVBRF8wXzU7CiAKLQlyZXQgPSBkcm1fZHBfZHBjZF9y
ZWFkYigmdGMtPmF1eCwgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HLCB0bXApOworCXJldCA9
IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcs
ICZyZWcpOwogCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycl9kcGNkX3JlYWQ7CiAKIAl0Yy0+bGlu
ay5zY3JhbWJsZXJfZGlzID0gZmFsc2U7CiAJLyogcmVhZCBhc3NyICovCi0JcmV0ID0gZHJtX2Rw
X2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwgdG1wKTsKKwly
ZXQgPSBkcm1fZHBfZHBjZF9yZWFkYigmdGMtPmF1eCwgRFBfRURQX0NPTkZJR1VSQVRJT05fU0VU
LCAmcmVnKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZHBjZF9yZWFkOwotCXRjLT5saW5r
LmFzc3IgPSB0bXBbMF0gJiBEUF9BTFRFUk5BVEVfU0NSQU1CTEVSX1JFU0VUX0VOQUJMRTsKKwl0
Yy0+bGluay5hc3NyID0gcmVnICYgRFBfQUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9FTkFCTEU7
CiAKIAlkZXZfZGJnKHRjLT5kZXYsICJEUENEIHJldjogJWQuJWQsIHJhdGU6ICVzLCBsYW5lczog
JWQsIGZyYW1pbmc6ICVzXG4iLAogCQl0Yy0+bGluay5iYXNlLnJldmlzaW9uID4+IDQsIHRjLT5s
aW5rLmJhc2UucmV2aXNpb24gJiAweDBmLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
