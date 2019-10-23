Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB0E2B19
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0356E10D;
	Thu, 24 Oct 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0346E029
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 11:11:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r141so9649561wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 04:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzSjfdz533CXX+r31DyH1zv/LJLKdHTy5BRlOQmdA1w=;
 b=aHHRyvIFlDnK40ZqJPFcPHSY02VWjdCXj4yhqI/TEmI7a784UdIJNxlhBR0RP+ntRJ
 o5cfNGo7y7oeuyhKQ6uCl5wj3r577cZ4Ulmf6t6F+cYTsLmR7U16sQQ9IKFDeoBmuBNn
 hBn8lhpOT3B+e5EOczJXkVYWw3wWXhoc4kDE94jqGFy4x5Fcg/c9qEUqswQykz75LcTs
 7wt1oexc2HsWEsVJJttaYb4kZ/oe0ABs9r6ij0e/cwJphHCn6xcimImcx+1k+va+oSwI
 JyOlH4nLvHiCssWI3cuCZ1G4o9671BBBxxaUWBlLbpOW1incrKkUdpgTsNgMLpHvvU/x
 4b4g==
X-Gm-Message-State: APjAAAVPEjFV1jIhrrkVjUjdF/L2xvLdjfHaO+KbLDyNScJXDaiBy035
 aZzAszWtDacqkgZ7Dk5JVyKDkV8RKuF9SQ==
X-Google-Smtp-Source: APXvYqzUTDjQy3LrwkwZs2bBatVab+bvLDTd9dRiBCyXxGuu6zQEGe5OeJKmIE0AkB/nB3zMglCIJQ==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr7311192wmq.137.1571829072881; 
 Wed, 23 Oct 2019 04:11:12 -0700 (PDT)
Received: from wambui.brck.local ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id 1sm3850170wrr.16.2019.10.23.04.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 04:11:12 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [Outreachy][PATCH] drm/mediatek: remove cast to pointers passed to
 kfree
Date: Wed, 23 Oct 2019 14:11:07 +0300
Message-Id: <20191023111107.9972-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzSjfdz533CXX+r31DyH1zv/LJLKdHTy5BRlOQmdA1w=;
 b=CsET8hcbLI3OciXqB6UqhYW9x2GYFB7JmE5P+Ooq3o8rcWqs4sM9XhVDqvjGQCjzl5
 IBVclOk7yuYq6LBKSmFVXvlGuyAcFUgCaEuxU6Xj93tUEDx56Pya9PmXn2PQoUPDGxk1
 o4n9TC9BQ4236MlB7JdzJCqKgjdA19hCUu5IFPEkscp6Z55mJBzBXYz0F5Nj4uqMaQpQ
 2u/oZPwHe5g+V1RnSgBQdWlYg4VWkIu2vQ/G5k25KJZax78O4AjmMe/E6hB7mFZgqyt4
 0qOxGSQ9NPcGVn6fPZoo0qP6qygtOLgci+4wSWXBzvzMkJ5kDKFPZg7xq2JlmADh4n4Q
 1zAw==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVjZXNzYXJ5IGNhc3RzIHRvIHBvaW50ZXIgdHlwZXMgcGFzc2VkIHRvIGtmcmVl
LgpJc3N1ZSBkZXRlY3RlZCBieSBjb2NjaW5lbGxlOgpAQAp0eXBlIHQxOwpleHByZXNzaW9uICpl
OwpAQAoKLWtmcmVlKCh0MSAqKWUpOwora2ZyZWUoZSk7CgpTaWduZWQtb2ZmLWJ5OiBXYW1idWkg
S2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZ2VtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0u
YwppbmRleCBjYTY3MmYxZDE0MGQuLmIwNGEzYzJiMTExZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZ2VtLmMKQEAgLTI3MSw3ICsyNzEsNyBAQCB2b2lkICptdGtfZHJtX2dlbV9w
cmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCQkJICAgICAgIHBncHJvdF93
cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKIAogb3V0OgotCWtmcmVlKCh2b2lkICopc2d0KTsK
KwlrZnJlZShzZ3QpOwogCiAJcmV0dXJuIG10a19nZW0tPmt2YWRkcjsKIH0KQEAgLTI4NSw1ICsy
ODUsNSBAQCB2b2lkIG10a19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaiwgdm9pZCAqdmFkZHIpCiAKIAl2dW5tYXAodmFkZHIpOwogCW10a19nZW0tPmt2YWRk
ciA9IDA7Ci0Ja2ZyZWUoKHZvaWQgKiltdGtfZ2VtLT5wYWdlcyk7CisJa2ZyZWUobXRrX2dlbS0+
cGFnZXMpOwogfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
