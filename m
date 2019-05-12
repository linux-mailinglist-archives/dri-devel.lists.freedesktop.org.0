Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F61B0C2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA4E8961D;
	Mon, 13 May 2019 07:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B5689B30
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e15so311738wrs.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lb3IP/Hl9lXy/TNODmgqSdzhcHKCTOi5Q6K9F3iD6Yc=;
 b=ImhHGhTnth0bWvDxbD6B54A+untG1VVNfITJMStzE86PI8PYEn7vC9QZyY/iMeFZ7d
 KZL3hYupN0HtgD0ipMYk4fpXhzGAeUH78PjH0aivAwRAid7RBM5JmVfriL9lEG6IU0NW
 9q7sUvmjmbizlNReC6bfnJwflh7cN8NNDdmEVtnNm/ug7soNmD1RsPwIuC2vZsKSHw/V
 5KA+qkmoWXaHJG8lVSWnqAgcKRGrN52cTH4xI4dn8QAuL7lmg+dy1njTF2WSzjI6hl1s
 Zux0YZpRDhZc1K3qsg+2mno6ZO7S0+y4efJFtyuWd12+tK4uGy5CoH/+Oyj21fgQ78dh
 cLOA==
X-Gm-Message-State: APjAAAX9IL38bD0hCljFilBdmxrW4Y2JbHsbGOOgeSnP/1MMEzGwDCPZ
 NzMqBLv8/pfsoevVSVSwYPU=
X-Google-Smtp-Source: APXvYqz/VewqOJnmZC2dZcKpaUrdwzIGnGakbHjHUF/LaI2SfDQMiogOyo/etrjKnneSrTsw/xi4RA==
X-Received: by 2002:adf:f9c3:: with SMTP id w3mr5934677wrr.271.1557683184146; 
 Sun, 12 May 2019 10:46:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:23 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 8/8] arm64: dts: allwinner: Add mali GPU supply for
 OrangePi 3
Date: Sun, 12 May 2019 19:46:08 +0200
Message-Id: <20190512174608.10083-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lb3IP/Hl9lXy/TNODmgqSdzhcHKCTOi5Q6K9F3iD6Yc=;
 b=u24eCC2SgKLBkmO/LnDz2izzPhp4h023a+HZEvpM6YzgQ7pIzUHZItuuECjuW4vP60
 E85x71N9IoxOKj5h+cTaH25KQ2NWmsQvioP3XzSdgZBXrg7CLYBHjlWO+zr/r5rnPZ7o
 AJ5kguSwtuaoBFvZ0fpVvxWsAWn7HvTVWdhsyTPpIir82PdndXqLNSrYL8EWwJZPF07H
 TI70oBn08Y/j8mgJdUPt4t8nBIHU7TTUFoK4NO6PQiiKtX3JwedlOTGCBCQLfkTKwxCZ
 18Wxma2Ew8biSRB8zxUY25ZZ7P2x5171XH7oXs8gjEXcdlSdJ7DY6n3VNWzMj5Vjf6/+
 hw2A==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkVuYWJsZSBhbmQg
YWRkIHN1cHBseSB0byB0aGUgTWFsaSBHUFUgbm9kZSBvbiB0aGUKT3JhbmdlIFBpIDMgYm9hcmQu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgot
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0
cyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMK
aW5kZXggMTdkNDk2OTkwMTA4Li5kNGM5ODljYzkyYTcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cworKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMKQEAgLTU4LDYg
KzU4LDExIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmdwdSB7CisJbWFsaS1zdXBwbHkg
PSA8JnJlZ19kY2RjYz47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJm1tYzAgewogCXZtbWMt
c3VwcGx5ID0gPCZyZWdfY2xkbzE+OwogCWNkLWdwaW9zID0gPCZwaW8gNSA2IEdQSU9fQUNUSVZF
X0xPVz47IC8qIFBGNiAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
