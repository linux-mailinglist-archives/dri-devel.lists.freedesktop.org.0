Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6E81934
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D216089259;
	Mon,  5 Aug 2019 12:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4FF6E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so78479190edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZuFMadoyc0ruTNEdKNXhYNHkSU0yt9p9cl6tLk8EAQ=;
 b=m7JrF9YDuAt/9NrBTfG3M7/idFg2SMCgP4oOHWBRMtmuS95VPkEb6aAiOpHryJVrML
 Ba+Dn/owEGUeYgrobu+rXesNaGzIIqNd2Q0VJG6uTnXhTV8eNwqOwtPsl5vEk3Ji+Ya0
 y9YZXJ4N60NisfVfDcH48yYsbrDZAMmHr1xeHcB/VgZrQzQmpqqsw5bXT+nDk0ELq0/5
 CM/iaXrUFGE/7YUD1i8bXvAV6jdv6BSns9AVehwiD0hkWoMl/H6Tx28pHN1ZrhUJ3Dio
 sQ2hdctRJYgWTThKEhovN838SJxCnmqTvBnZ25V2Ekzd+52nLjni0kHsxESy3WJvNAEu
 L0zA==
X-Gm-Message-State: APjAAAUs/Qn3CpKf22cTMbyIVWX/Ak9K5TmuwWCq1oRKog3qeZFZAiq+
 ZVla6ukNWf1JlA3IWE29vELrc/Xz
X-Google-Smtp-Source: APXvYqxLjKYdPTonomOvElKQK6kdAvq2r2FlT+uYd6jTL4ap0c2ep3Ua8VyI4kLyP9U5FoE7ROrrFg==
X-Received: by 2002:a50:8974:: with SMTP id f49mr130430913edf.95.1565007859360; 
 Mon, 05 Aug 2019 05:24:19 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id k3sm12872015ejv.29.2019.08.05.05.24.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/21] drm/dp: Fix a couple of whitespace issues
Date: Mon,  5 Aug 2019 14:23:49 +0200
Message-Id: <20190805122350.8838-20-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4ZuFMadoyc0ruTNEdKNXhYNHkSU0yt9p9cl6tLk8EAQ=;
 b=iieeEY4XxX3tV6FdCweYPrvr+DRY7WdHCX0B/zl8oVeXADt5xLG+YVSkKO4vFjO64u
 pmhK1k/E9QhlnNXkJ0zScdhKKbWfOO8BKHV9UOxQwyVATbG9bTrreFNuZsbgt+AKK8wy
 UYPzszFOUbvC6fNoRlC8D6XH0ydXDS8zrtyuwDRvz2LuoyjVZK17qCW/voakJPb0ndyR
 MMW7p3QnmhWPACUkZXnYNzO6DK+DVKthO6c00lYRHXGH53XUn1JMCKN2DxNOtcDp0bHW
 SCMlQa7Vv81dD5ZAiexuL/geu9KT59cJeVOrvFflO9Jq1drv0nIe/7cNjRGG5Tnqvllv
 JiZQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJlbW92ZSBhIGdyYXR1
aXR1b3VzIGJsYW5rIGxpbmUgaW4gb25lIHBsYWNlIGFuZCBhZGQgYSBibGFuayBsaW5lIGluCmFu
b3RoZXIgdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxw
ZXIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYwppbmRleCAxMzZlZTYwOWYyZWUuLjZiNDQzMWJhZGUzZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jCkBAIC0yMTYsNyArMjE2LDYgQEAgc3RhdGljIGludCBkcm1fZHBfZHBjZF9hY2Nl
c3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTggcmVxdWVzdCwKIAkJfQogCiAJCXJldCA9IGF1
eC0+dHJhbnNmZXIoYXV4LCAmbXNnKTsKLQogCQlpZiAocmV0ID49IDApIHsKIAkJCW5hdGl2ZV9y
ZXBseSA9IG1zZy5yZXBseSAmIERQX0FVWF9OQVRJVkVfUkVQTFlfTUFTSzsKIAkJCWlmIChuYXRp
dmVfcmVwbHkgPT0gRFBfQVVYX05BVElWRV9SRVBMWV9BQ0spIHsKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
