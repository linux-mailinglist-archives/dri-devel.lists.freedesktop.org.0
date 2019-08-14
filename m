Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651108DD61
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0369C6E807;
	Wed, 14 Aug 2019 18:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34916E7F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:40 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m12so1511plt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jr0LHNXFLRr/YgSdWt3cOqmTd6edKKK0IXkakE1rRaM=;
 b=n5N6zNqHyDQEkmlocx7p3nuFeDcO3eXNosSLhbOORPIFyf/ci3qYaxaPOkuj5kYpBP
 wmH+tYNzYlPqhyuXfGpr3PTXtrBxkI0ZykUY95w76QZYgHmsSUpbOfUt4Cld+C5HjNzx
 rVMm+gnAyUl6dCKqwAs+IyikyB0WG5OxPlTTA7W4Q0eTxanswEZpg9HBusJtn9l+hp43
 MT0E/IPS6ZTYpKT4XSmp1mylEbvr98DCPiHhvYWwWZLaJ4oW5oFvTGiOl9fwnvE6zsA6
 wgJ3JIjGm3IqOzpcEIumWreCzZ/EKmR7c/G8OUqiN03IH6WXo+XCq568FvlxmoEsg6bl
 uepw==
X-Gm-Message-State: APjAAAWdbUEM/85sMX5kLfabBAfKhSzaE0EXpwrG79hfKcTkROvwRbWO
 LHxjKSwD9ggqOP2lAP5/EkqbcA==
X-Google-Smtp-Source: APXvYqzo/mdKFHRoq5DJ0COo3YXh5eNMJS7NWWZWkEwSch3MmurQnHJAW/u19PUU2WoblQ7z19983Q==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
 w13mr736590plp.157.1565808459554; 
 Wed, 14 Aug 2019 11:47:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:38 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 21/26] drm: kirin: Rename plane_init and crtc_init
Date: Wed, 14 Aug 2019 18:46:57 +0000
Message-Id: <20190814184702.54275-22-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jr0LHNXFLRr/YgSdWt3cOqmTd6edKKK0IXkakE1rRaM=;
 b=Rv+Gl8eCcK5oQSZmfccdJupNqiSkL5PLZeiuBMuUviSXpb018SThybZruQCixf9sc+
 5T+plvMnfu8014K2hxyhCEeEiSTQfuOG5dkABwYp4wGXGWaYhQy7FxfUsejxGvAyiJJU
 bNgQ9/UXRNO/cUtGhoO1Fg/xSrXtLjA6FU8Q2TVLyunHqshmY0QE5/6+/eRFgs/1A0yY
 4dlbRdiymYQSL72JNwf1JCBPeXaSEGipD7/SPNiZrMZ0vIa4yBLJ1r1Y3Q0DZNYVWGZJ
 WiDByytAZVSJpM8gWUIT1HLUk05RwvQ/7jVEu0mbAHdj41nVdfiRd2tYCHRvJ0nrqQhw
 NsDg==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVuYW1lcwphZGVfY3J0Yy9wbGFuZV9pbml0IGtp
cmluX3BsYW5lL2NydGNfaW5pdCwgYXMgdGhleSB3aWxsIGxhdGVyIGJlCm1vdmVkIHRvIGtpcmlu
IGRybSBkcnYgYW5kIHNoYXJlZCB3aXRoIHRoZSBraXJpbjk2MCBoYXJkd2FyZQpzdXBwb3J0LgoK
Q2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1
IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+ClNpZ25lZC1vZmYtYnk6IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pz
dHVsdHo6IHJld29yZGVkIGNvbW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0
eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2tpcmluL2tpcmluX2RybV9hZGUuYyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKaW5kZXggNjY0MzRjMGNjZTZlLi4wYmRjYWM5
ODFkOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5f
ZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2FkZS5jCkBAIC01NzEsNyArNTcxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19m
dW5jcyBhZGVfY3J0Y19mdW5jcyA9IHsKIAkuZGlzYWJsZV92YmxhbmsJPSBhZGVfY3J0Y19kaXNh
YmxlX3ZibGFuaywKIH07CiAKLXN0YXRpYyBpbnQgYWRlX2NydGNfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCitzdGF0aWMgaW50IGtpcmluX2RybV9j
cnRjX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9jcnRjICpjcnRjLAog
CQkJIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogewogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcG9y
dDsKQEAgLTg5Miw4ICs4OTIsOSBAQCBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBhZGVf
cGxhbmVfZnVuY3MgPSB7CiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxw
ZXJfcGxhbmVfZGVzdHJveV9zdGF0ZSwKIH07CiAKLXN0YXRpYyBpbnQgYWRlX3BsYW5lX2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGtpcmluX3BsYW5lICprcGxhbmUsCi0JCQkg
IGVudW0gZHJtX3BsYW5lX3R5cGUgdHlwZSkKK3N0YXRpYyBpbnQga2lyaW5fZHJtX3BsYW5lX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQlzdHJ1Y3Qga2lyaW5fcGxhbmUgKmtwbGFu
ZSwKKwkJCQllbnVtIGRybV9wbGFuZV90eXBlIHR5cGUpCiB7CiAJaW50IHJldCA9IDA7CiAKQEAg
LTEwMjQsMTMgKzEwMjUsMTMgQEAgc3RhdGljIGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJZWxzZQogCQkJdHlwZSA9IERSTV9QTEFORV9UWVBFX09WRVJM
QVk7CiAKLQkJcmV0ID0gYWRlX3BsYW5lX2luaXQoZGV2LCBrcGxhbmUsIHR5cGUpOworCQlyZXQg
PSBraXJpbl9kcm1fcGxhbmVfaW5pdChkZXYsIGtwbGFuZSwgdHlwZSk7CiAJCWlmIChyZXQpCiAJ
CQlyZXR1cm4gcmV0OwogCX0KIAogCS8qIGNydGMgaW5pdCAqLwotCXJldCA9IGFkZV9jcnRjX2lu
aXQoZGV2LCAma2NydGMtPmJhc2UsCisJcmV0ID0ga2lyaW5fZHJtX2NydGNfaW5pdChkZXYsICZr
Y3J0Yy0+YmFzZSwKIAkJCQkmYWRlLT5wbGFuZXNbYWRlX2RyaXZlcl9kYXRhLnByaW1fcGxhbmVd
LmJhc2UpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
