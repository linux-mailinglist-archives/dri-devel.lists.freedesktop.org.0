Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E8881935
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6B7893D0;
	Mon,  5 Aug 2019 12:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809DE6E440
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s49so43653833edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dSSh3AWRWOFiRSakSJ8xcVa2ECYJjZ8khcpcMOQxNs=;
 b=UYm6dGA06GQRrQKCy7omnSQjki3ypQGcLxUTdTHn0EdI+/QUtwvEX6uZ5p+0DvHLsP
 ftsBRY4I9/t+AvtJVEjFif0lX+XeWZ8npUDGJpELyiQyisDYFtBiwdoQSn52A7oLiQ0J
 n2l8YoC44v0WcGInbYNOU+Qk+LPE9PuBekjFIDs4uM1MR/6D9v890JLqv8M98bE/AcL9
 StD6LSHQJMZXBEFm4J/rNLJ7geN9A8MDl7hzF9zrLG1ute58Mx57uunDRcaamnCnUItK
 868SXHwtPQDrzV5fdfAkZ/Psdk4Avu8m6HXIqR4FNY2P276+b6bk+p+kvF5EclbInqvA
 z3TQ==
X-Gm-Message-State: APjAAAVbOQzHv+X2S1G3dR/Mc9+xLxv5RrWooDrKEvs5Y3M631wJXmyD
 pBXEaCiO1lCHknuxByUdei4s9OSx
X-Google-Smtp-Source: APXvYqzuiObkhlCob4zHBRVGO+xAEYxWobyi6MRSyP4wppdHV7XjgNq9cAF8qSjVAqXcle4MADqqFg==
X-Received: by 2002:a05:6402:14c4:: with SMTP id
 f4mr131030539edx.170.1565007860830; 
 Mon, 05 Aug 2019 05:24:20 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id c15sm1895461edf.37.2019.08.05.05.24.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/21] drm/bridge: tc358767: Use DP nomenclature
Date: Mon,  5 Aug 2019 14:23:50 +0200
Message-Id: <20190805122350.8838-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9dSSh3AWRWOFiRSakSJ8xcVa2ECYJjZ8khcpcMOQxNs=;
 b=VRzaa3kye5CwI7E6BLSHQpIOn/fn02zOHsSE6YyXAiRvSa9WXgS3Blt1JK5vHzV0BV
 eVlXQGv5AmrPtZ9bxJz9UReErPDoYoq4G2e0jkcFmHmydpZvGAjcZRD2Tm7QUpFH+X7d
 x5VevPwsf/IhhZYJJLm9dSMGaIYMYkHBxWccIi2j1VzRGA+f1aAlfHbmyPkx3ruUczZC
 gnmqd7EiGakZ705cL7zz5JkqX4Vwp+t5QbtuhrDX+TG6H4AyUhVxkpRVDcfPJLftQQ2p
 dFrjxkgLCxbl8I2Y5/87W9KrS2wKQiHIUT4fas+1TL96cqR3+zGLxkDDzNK5D/1bjNaW
 ayJg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUCBzcGVjaWZp
Y2F0aW9uIHVzZXMgdGhlIHRlcm0gImRlZmF1bHQgZnJhbWluZyIgaW5zdGVhZCBvZiAibm9uLQpl
bmhhbmNlZCBmcmFtaW5nIi4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggMWJiZmNjNTUzNGFiLi5jNzc5ZmU2NDI3ZjYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTY5OSw4ICs2OTksNyBAQCBzdGF0aWMgaW50
IHRjX2dldF9kaXNwbGF5X3Byb3BzKHN0cnVjdCB0Y19kYXRhICp0YykKIAkJdGMtPmxpbmsuYmFz
ZS5yZXZpc2lvbiA+PiA0LCB0Yy0+bGluay5iYXNlLnJldmlzaW9uICYgMHgwZiwKIAkJKHRjLT5s
aW5rLmJhc2UucmF0ZSA9PSAxNjIwMDApID8gIjEuNjJHYnBzIiA6ICIyLjdHYnBzIiwKIAkJdGMt
PmxpbmsuYmFzZS5sYW5lcywKLQkJdGMtPmxpbmsuYmFzZS5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcg
PyAiZW5oYW5jZWQiIDoKLQkJCSJub24tZW5oYW5jZWQiKTsKKwkJdGMtPmxpbmsuYmFzZS5jYXBz
LmVuaGFuY2VkX2ZyYW1pbmcgPyAiZW5oYW5jZWQiIDogImRlZmF1bHQiKTsKIAlkZXZfZGJnKHRj
LT5kZXYsICJEb3duc3ByZWFkOiAlcywgc2NyYW1ibGVyOiAlc1xuIiwKIAkJdGMtPmxpbmsuc3By
ZWFkID8gIjAuNSUiIDogIjAuMCUiLAogCQl0Yy0+bGluay5zY3JhbWJsZXJfZGlzID8gImRpc2Fi
bGVkIiA6ICJlbmFibGVkIik7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
