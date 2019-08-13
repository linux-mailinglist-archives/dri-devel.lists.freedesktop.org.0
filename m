Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE148E6B3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B2E6E8F5;
	Thu, 15 Aug 2019 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471FE6E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:34:10 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v12so3217967pfn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYvMpGNobVf3AqFb3xy5KgnpYbwIyZqHqD10LEnethw=;
 b=CNY7NNv/BzfQ/OCp6f6rJ4ZOJ9aaG7ibjf3RxVN73U1l8pgjI4nDia2RKo+4q4tvG0
 knLPqhPIa1WmZieskOt1yJhopkOJsQAHJWMVYS3QGculaG5nKl8al3p+a2VgLe51lwnV
 DSmYSGJGyHhR+Z9IYMapN7FBxzKALpTTfPteecOKVY+AcTcFvCCFiV4OPlUWo60lssPr
 8a/ASr/u1lWUjlZTr8PWYzkCj/5j0WIXZVclcfCtB38c6uTawvY977u/1FzYBJSr8Fdc
 EO6qgB8QrDAlDwV8jFAVm59tq3vpo3LhWJxqxwqiqLDRVL1wHfIURHAO4+NBDwEOHl1j
 EDVw==
X-Gm-Message-State: APjAAAX10WXqfQlYuMa/yaZjvsEka2ULd4rdp1k2k8PIhsMePriTICxC
 FkusWGiJGNOzZPF5qx2k4As=
X-Google-Smtp-Source: APXvYqwfms220Vinc5FlyiGQRBQG8JL5P/Qy34knvYhc+hDf7+JQAwz3oRsAYwjQjm6J5gH30+i+ww==
X-Received: by 2002:a62:8648:: with SMTP id x69mr11624925pfd.92.1565678049875; 
 Mon, 12 Aug 2019 23:34:09 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id m34sm624871pje.5.2019.08.12.23.34.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:34:09 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: joel@jms.id.au, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, andrew@aj.id.au,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/aspeed: gfc_crtc: Make structure aspeed_gfx_funcs constant
Date: Tue, 13 Aug 2019 12:03:55 +0530
Message-Id: <20190813063355.25549-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYvMpGNobVf3AqFb3xy5KgnpYbwIyZqHqD10LEnethw=;
 b=Qg+zDHw9r6HZYqflIIV14xf3Uu6U8FtbmN0aBGEn/uk46YC4wb8qwCDmPmzGJV62Z1
 WceSQ6S+tpYamK00BOiIl+8BSOKKbH1L3drOX/2ho7A8kcRVQNICkBRRrUrO0n+Gtbui
 idhYt4DiFtRvwxoT4L5EwB2Zom7HVG2MRXG7XBVjjOy0X686r6oA6m5iAtmhn33Se0/V
 +dTEX4khpmAI4UxF9EeXYccq8z/YDXktgj++QPcTkY/wAp/Gmeq1UD+HZ6F7rBxgfy48
 oZMYoZvo+B1KpvxsYDpaGw0P8nd0PAn347JUf2dYolE9K9Z6FiVBxGLZn4t70QYVAgZ3
 eHFQ==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0YXRpYyBzdHJ1Y3R1cmUgYXNwZWVkX2dmeF9mdW5jcywgb2YgdHlwZQpkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZV9mdW5jcywgaXMgdXNlZCBvbmx5IGFzIGFuIGFyZ3VtZW50IHRvCmRybV9z
aW1wbGVfZGlzcGxheV9waXBlX2luaXQoKSwgd2hpY2ggZG9lcyBub3QgbW9kaWZ5IGl0LiBIZW5j
ZSBtYWtlIGl0CmNvbnN0YW50IHRvIHByb3RlY3QgaXQgZnJvbSB1bmludGVuZGVkIG1vZGlmaWNh
dGlvbi4KSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogTmlzaGth
IERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FzcGVlZC9hc3BlZWRfZ2Z4X2NydGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3Bl
ZWQvYXNwZWVkX2dmeF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhf
Y3J0Yy5jCmluZGV4IDE1ZGI5ZTQyNmVjNC4uMjE4NGI4YmU2ZmQ0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hc3BlZWQvYXNwZWVkX2dmeF9jcnRjLmMKQEAgLTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgdm9p
ZCBhc3BlZWRfZ2Z4X2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlw
ZSAqcGlwZSkKIAl3cml0ZWwocmVnIHwgQ1JUX0NUUkxfVkVSVElDQUxfSU5UUl9TVFMsIHByaXYt
PmJhc2UgKyBDUlRfQ1RSTDEpOwogfQogCi1zdGF0aWMgc3RydWN0IGRybV9zaW1wbGVfZGlzcGxh
eV9waXBlX2Z1bmNzIGFzcGVlZF9nZnhfZnVuY3MgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIGFzcGVlZF9nZnhfZnVuY3MgPSB7CiAJLmVuYWJs
ZQkJPSBhc3BlZWRfZ2Z4X3BpcGVfZW5hYmxlLAogCS5kaXNhYmxlCT0gYXNwZWVkX2dmeF9waXBl
X2Rpc2FibGUsCiAJLnVwZGF0ZQkJPSBhc3BlZWRfZ2Z4X3BpcGVfdXBkYXRlLAotLSAKMi4xOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
