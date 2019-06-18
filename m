Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8C4B29A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6C6E2A0;
	Wed, 19 Jun 2019 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x464.google.com (mail-wr1-x464.google.com
 [IPv6:2a00:1450:4864:20::464])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94F86E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:53 +0000 (UTC)
Received: by mail-wr1-x464.google.com with SMTP id c2so12741560wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RJV2c/yp+5Do5r3i0Oh53aiXsFA5fZSjKFxBZIwxxB4=;
 b=Usja8uVd2oEWJP+fNKgakCzfHFNMax9XKGsjXAOxupepZj9/N9DV9CJ5EOoPhGJr7n
 mJFN5kCN2Y4t5/6cWKwMFvMGW/0O/YFaa10n8KS6YwO5KDtizAILOMDnZl3YBmjHsvSO
 Sm9WwG3VXTuRoOkURmMMzPtmmjfWOTZA4+xwsSsyEUY3xNuWO2QoDHQrg73kNmqV1z4J
 EtGwG9v7YS2dyKK0S7GOuGadCB0iSWp9KKnL4Jg5ahMQaMbmrR5ExJ9cP2iWXyaydDAC
 chrbDHwukOFp0zLWlMMA4REopUFTKHV37h6ALQtbDCZ4Iv2vo0RlwO0W3f4JM2hja2gl
 32iA==
X-Gm-Message-State: APjAAAXUnrIAuge4zUiEDnRc5NvywoPn69d52Jf6U3/v3FuXqxOQJK2K
 LcrTE3EJ119dTaoLZsV681vE/EdsjdnMneaKviISkktoTZDVhg==
X-Google-Smtp-Source: APXvYqzJtYYrIsIVjU6HwCxdrP51kOs3TdA56llOXfWqnnEnzoFlKNoTYyUl5l8w6i5sbjU9eoegASs4TVgl
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr27917903wrw.8.1560843712369;
 Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] video: ssd1307fb: Remove unneeded semicolons
Date: Tue, 18 Jun 2019 10:41:07 +0300
Message-Id: <20190618074111.9309-3-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RJV2c/yp+5Do5r3i0Oh53aiXsFA5fZSjKFxBZIwxxB4=;
 b=d0+0frtSg952+lM6f0nBtK47869GFo/kZ49bF9nda2IzhOwtCpAxPQQKkPzzfvPy7D
 4eY4ARuUNqbPQwctLijpvGklj6NQIdAQo0vMwPAoFiVihX1737VFcv+1WPV8x0kO0nX5
 DbqE8tyTJHeLE2P/sdmVxB4dYR2ze9fzb51iw=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y29jY2ljaGVjayByZXBvcnRlZCB1bm5lZWRlZCBzZW1pY29sb25zLiBSZW1vdmUgdGhlbS4KClNp
Z25lZC1vZmYtYnk6IE1hcmtvIEtvaHRhbGEgPG1hcmtvLmtvaHRhbGFAb2tva28uZmk+Ci0tLQog
ZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2Zi
LmMKaW5kZXggNmMyOTgwMzMxZmZkLi45YWIwMGUwZGFkYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3
ZmIuYwpAQCAtMzEzLDcgKzMxMyw3IEBAIHN0YXRpYyBpbnQgc3NkMTMwN2ZiX2luaXQoc3RydWN0
IHNzZDEzMDdmYl9wYXIgKnBhcikKIAogCQlkZXZfZGJnKCZwYXItPmNsaWVudC0+ZGV2LCAiVXNp
bmcgUFdNJWQgd2l0aCBhICVkbnMgcGVyaW9kLlxuIiwKIAkJCXBhci0+cHdtLT5wd20sIHBhci0+
cHdtX3BlcmlvZCk7Ci0JfTsKKwl9CiAKIAkvKiBTZXQgaW5pdGlhbCBjb250cmFzdCAqLwogCXJl
dCA9IHNzZDEzMDdmYl93cml0ZV9jbWQocGFyLT5jbGllbnQsIFNTRDEzMDdGQl9DT05UUkFTVCk7
CkBAIC0zMjksNyArMzI5LDcgQEAgc3RhdGljIGludCBzc2QxMzA3ZmJfaW5pdChzdHJ1Y3Qgc3Nk
MTMwN2ZiX3BhciAqcGFyKQogCQlyZXQgPSBzc2QxMzA3ZmJfd3JpdGVfY21kKHBhci0+Y2xpZW50
LCBTU0QxMzA3RkJfU0VHX1JFTUFQX09OKTsKIAkJaWYgKHJldCA8IDApCiAJCQlyZXR1cm4gcmV0
OwotCX07CisJfQogCiAJLyogU2V0IENPTSBkaXJlY3Rpb24gKi8KIAljb21faW52ZGlyID0gMHhj
MCB8IChwYXItPmNvbV9pbnZkaXIgJiAweDEpIDw8IDM7CkBAIC03MTYsNyArNzE2LDcgQEAgc3Rh
dGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAlpZiAo
cGFyLT5kZXZpY2VfaW5mby0+bmVlZF9wd20pIHsKIAkJcHdtX2Rpc2FibGUocGFyLT5wd20pOwog
CQlwd21fcHV0KHBhci0+cHdtKTsKLQl9OworCX0KIHJlZ3VsYXRvcl9lbmFibGVfZXJyb3I6CiAJ
aWYgKHBhci0+dmJhdF9yZWcpCiAJCXJlZ3VsYXRvcl9kaXNhYmxlKHBhci0+dmJhdF9yZWcpOwpA
QCAtNzQwLDcgKzc0MCw3IEBAIHN0YXRpYyBpbnQgc3NkMTMwN2ZiX3JlbW92ZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQogCWlmIChwYXItPmRldmljZV9pbmZvLT5uZWVkX3B3bSkgewogCQlw
d21fZGlzYWJsZShwYXItPnB3bSk7CiAJCXB3bV9wdXQocGFyLT5wd20pOwotCX07CisJfQogCWZi
X2RlZmVycmVkX2lvX2NsZWFudXAoaW5mbyk7CiAJX19mcmVlX3BhZ2VzKF9fdmEoaW5mby0+Zml4
LnNtZW1fc3RhcnQpLCBnZXRfb3JkZXIoaW5mby0+Zml4LnNtZW1fbGVuKSk7CiAJZnJhbWVidWZm
ZXJfcmVsZWFzZShpbmZvKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
