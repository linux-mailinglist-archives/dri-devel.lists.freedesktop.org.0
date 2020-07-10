Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89AF21E8D6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1FC6E8E1;
	Tue, 14 Jul 2020 07:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219926EBBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so5297340wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=E6ZLdbzEcVMkO+y+P9AnK26+CL9Gii7HowUb0y8r871JmlAOtpsmlg4q3u3RWYvJBz
 Q952Bfv3QVNsjwHmqNLgsp0zBkj/wAEIswxRb8szToMHEwMJWEzSajuvPrXMjyJAbC6l
 2jhisYIBYvelO7bWNmvBhf75KQTxFa2xP0baS4elXjau8Ju9MImntLZJSB4NtvUl7XOf
 24nTmYHNG2sC4aQdoUoz6vm9kKytPw1+Fd2FzGw9VqE/1MyypSXx7wWSs8KmbAn+FA23
 IzXT2tJKkvkNf8SpWQqlClpjMum4AoHDeFGTbeEsMjqDu3BwqocRat4DXYPd2kHZjbUt
 nplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=CpNTRjZURvejQYlx85ygiXZLFTZkwqKQ4uORD+RGo0cYfHo082kGtk6LMngm7yRY68
 Aqg99/QO5r3B/pp3BR+JFxQvNnsMRFfoU346WSOFYsZO7BqWSJCnu08IlVxx6EIYJ4Ql
 xR9uv4uaT9Zfd3P9arT/5vlFWymLQZu1lizeWeITvIGgsX4kggtmSRJ6qNaHoDxyodE/
 qafwKz9XJ3RwZdMI07YHQuYJ31cJh017LMe9JA3dcjVRo5NLsU87Uacw97bj8QogDvJK
 iwUCVJFtXbfrB7//e8HFBrZ1QFiOOkTbC/s8ybyzkXekx6iIqSlIWe92JE+dRqe5glQ8
 PHqA==
X-Gm-Message-State: AOAM533xK5AalP16DMZ+bMJ5ypM6gPz3YXSg5l8xuAQZSyiUevAUe8RS
 Wxl+iz7ExaRlAreFijoFS+A=
X-Google-Smtp-Source: ABdhPJxydbxqntuMQsGKoGZGdLY0/lHB7ypQPuA+b6q6L1xs17oMsk0rnQUbeamN86SZTzmI5d1HCw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr65977070wrq.407.1594374854728; 
 Fri, 10 Jul 2020 02:54:14 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 02/14] drm/panfrost: clean headers in devfreq
Date: Fri, 10 Jul 2020 11:53:57 +0200
Message-Id: <20200710095409.407087-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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

RG9uJ3QgaW5jbHVkZSBub3QgcmVxdWlyZWQgaGVhZGVycyBhbmQgc29ydCB0aGVtLgoKUmV2aWV3
ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClJldmlld2VkLWJ5OiBB
bHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KU2lnbmVk
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
ZXYpCiB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
