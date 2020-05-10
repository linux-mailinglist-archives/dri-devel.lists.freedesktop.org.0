Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67971CD25C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC9C6E1DE;
	Mon, 11 May 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7459589F8E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w19so1556065wmc.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8UE18pCOZAfJo/w5THwQJ6FMg6LICrZ1Evr9g3xVdI=;
 b=EDkMYRXi7wtLjEhK2L0/ce9M37GzwRQ+JciCHsBHDqE8BSg395qaMTKehVjyf3wERr
 lHpTMZpUeL7LiZMTKM23Q6B9IxKp/OjcOamFqu/FTiAIvIgHKSi7ZDAyI2gNwhqyEjQv
 3KNolQxMevQ7uSA/y/XtAU/pDqsY4xetoZEySMxoZ0sszpktEn+vBcLM+EsIbo8mPcIb
 LbjWBB7Kqv0+AFyVwIJRM/y7KvUMeScFkmF/hq3XQzrS1wt7vqhAlzMZZitbR0X6tlaz
 +lgdw3cO8PZVFimCOHSTMxVQNDe+YLumbioRF+i6XkvkJjwvmhGZ9o8+8cQUU9S6PW+E
 rpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8UE18pCOZAfJo/w5THwQJ6FMg6LICrZ1Evr9g3xVdI=;
 b=ngiSn/ruO0/N/l/XGQUvgH7M1/01BJCRwkoed662tQEdX8NvE02O+TT5FcqEHG1NXw
 dg3BoTr5nEXg8nvSAEFb8vLWe3LjUeBKVL3WTCBTYfGqXBfkS/gp3owcKiYC8QOSCuLU
 7WuLPPCwyN8afKC9fV/gG4CJ7kxiKZNs8V9OpUioGV5H9auVkFDDFlEuxOf4cDrB9Aj5
 SmETzDFizJPbiWlQo89Jhu1qvE5oKDVKaD9JN28WfLs9HCAXYvHo19Cghl6zwhX/zws9
 tEN8VPUGnZM8mqCdNUBowFnrb/nqOUTMz9pvAbOozxl4hrqnM5AEd8170JGi5KxyLms5
 oyjw==
X-Gm-Message-State: AGi0PuYcTAJHK7Wrz+inlwEBLw3UoxwSnh0rW/6idQo0uYCdiTzBgaIO
 BRE0I/D5aG/2o36Aj7y9RM0=
X-Google-Smtp-Source: APiQypJJwRD+VbQWR/BDoQEXOHxwwcjQSwAjkeW+rRkHkwxah1eAHal5gfV7ivYVJ81DX7eY5fpRIg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr27009245wma.32.1589129744055; 
 Sun, 10 May 2020 09:55:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 02/15] drm/panfrost: clean headers in devfreq
Date: Sun, 10 May 2020 18:55:25 +0200
Message-Id: <20200510165538.19720-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgaW5jbHVkZSBub3QgcmVxdWlyZWQgaGVhZGVycyBhbmQgc29ydCB0aGVtLgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgOCArKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCAxYjU2MGI5MDNlYTYuLmRm
N2I3MWRhOWE4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jCkBAIC0xLDE4ICsxLDE0IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAogLyogQ29weXJpZ2h0IDIwMTkgQ29sbGFib3JhIGx0ZC4gKi8KKworI2luY2x1ZGUgPGxpbnV4
L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmZyZXEuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZm
cmVxX2Nvb2xpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9wbV9vcHAuaD4KLSNpbmNsdWRlIDxsaW51eC9jbGsuaD4KLSNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAogI2luY2x1ZGUgInBhbmZyb3N0X2RldmljZS5o
IgogI2luY2x1ZGUgInBhbmZyb3N0X2RldmZyZXEuaCIKLSNpbmNsdWRlICJwYW5mcm9zdF9mZWF0
dXJlcy5oIgotI2luY2x1ZGUgInBhbmZyb3N0X2lzc3Vlcy5oIgotI2luY2x1ZGUgInBhbmZyb3N0
X2dwdS5oIgotI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKIAogc3RhdGljIHZvaWQgcGFuZnJv
c3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
