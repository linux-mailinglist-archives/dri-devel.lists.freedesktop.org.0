Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF835F94
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8DB89C29;
	Wed,  5 Jun 2019 14:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411E89C29
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:49:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a25so19327211lfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=izNA0Q+uxtkNHRLdzMCjuwQM+R0elafRpiaYh8X4OT8=;
 b=RwEaE82RastEFzKC/InRHHtABpLojnQmYTe1VdMYRrUlToD5JAC3A8GaPzGKzhudHx
 sTkC+znC3khEJRvuCNtipkv8q1S7rpbLh6jl3sZ57wzPaTTl7lK2nYEkFixTokt+yWHS
 NDC1Iv9TyQfaoRoADYhB/+rnC1r9Cx45+QVtBZ+9i2XGyZCMUXPlTqNkL3InosUN5Ydg
 X8PQmwNHwAzYv4IbTQeuO7S8yLv4C9yp73oXracM3D8IITDovyWfZ0lO0AWtyNOJhj+g
 +gEmKkvc4S4/rghiuqPCzY6GJlimyk+gzFZZJ/1+1kjXMjbChuYSA8eOfUSeHEtVoJSR
 N46g==
X-Gm-Message-State: APjAAAWFVTsyD4VRpTQZFsSe4s29QYaRIVfvKIh/2y65Fj9PmOqCxG6p
 zz/MPTS3R5ccRkLr0Tf45/pjMMIp0wLXzQ==
X-Google-Smtp-Source: APXvYqxX2HBu1PKEZ9Lc8Zn3h+QyELD8mgEg8NUjAKlsWnTzVdQTnA+6hKxwcGk1unjXDUEB//e+Kw==
X-Received: by 2002:a19:3f4b:: with SMTP id m72mr20089527lfa.91.1559746163685; 
 Wed, 05 Jun 2019 07:49:23 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 y12sm1563997lfy.36.2019.06.05.07.49.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 07:49:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/1] drm/exynos: drop use of drmP.h
Date: Wed,  5 Jun 2019 16:49:06 +0200
Message-Id: <20190605144907.7291-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=izNA0Q+uxtkNHRLdzMCjuwQM+R0elafRpiaYh8X4OT8=;
 b=mkMa89/AhrePd1xjw1xHABb4pX2iNz66Jx84md7P04LMhNXNKc8PvX98xT24Dhz/AY
 XwfUCQ7p9mGGEDnFv0izVMkMXVHesE8q8wM3RkUR3gYJXfAloFfBkOnqweB5lCuDJSJR
 a+M/rZIHA1WbwCkWXfoutQSO8xSX8OUuViKxVbRXbgcdsxAQvPDYlbRy/S8MAHTDRL2M
 EzXnDGDNZjr9V03MPU99GHSl6wMQ4WLQPNskZqbo4fg2kjttNJAe7KCjdOsFLpV24/oH
 xfJMU9FLxZcbzbbYdLcm6rGhvJkttkmJx4FVa7E7X0NkxOJz6avtkw/RojlkSQf1yphG
 5N3g==
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KCkJ1aWxk
IHRlc3RlZCB1c2luZyBhbGx5ZXNjb25maWcsIGFsbG1vZGNvbmZpZyBmb3IgdmFyaW91cwphcmNo
aXRlY3R1cmVzLgoKCVNhbQoKU2FtIFJhdm5ib3JnICgxKToKICAgICAgZHJtL2V4eW5vczogZHJv
cCBkcm1QLmggdXNhZ2UKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2Rl
Y29uLmMgfCAgNyArKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M3X2RybV9kZWNv
bi5jICAgIHwgIDggKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jICAg
ICAgICAgICAgfCAxMyArKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9jcnRjLmMgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZG1hLmMgICAgICAgfCAgNiArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHBpLmMgICAgICAgfCAgOCArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9kcnYuYyAgICAgICB8IDEyICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHJ2LmggICAgICAgfCAgOCArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9kc2kuYyAgICAgICB8IDIxICsrKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmIuYyAgICAgICAgfCAgNiArKy0tCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyAgICAgfCAgNyArKystLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyAgICAgIHwgMTUgKysrKystLS0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAgICAgIHwgMTQgKysrKystLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgICAgICAgfCAgOCArKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYyAgICAgICB8ICA3ICsrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgICAgICAgfCAxMyArKysrKy0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYyAgICAgICB8ICAzICst
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgICAgICAgfCAyMiArKysr
KysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgICAg
IHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jICAg
fCAxMCArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMg
ICAgfCAxMiArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3ZpZGku
YyAgICAgIHwgIDkgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMg
ICAgICAgICAgfCA0MSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX21peGVyLmMgICAgICAgICB8IDMxICsrKysrKysrKystLS0tLS0tLS0t
CiAyNCBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMTM2IGRlbGV0aW9ucygtKQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
