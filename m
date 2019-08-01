Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DF7D3CF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500A86E33A;
	Thu,  1 Aug 2019 03:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2A56E338
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u14so33172593pfn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=glR6oLsrJBxGZFPDkXtm2pq0TMtj5d9cDHh+aCshZSM=;
 b=ifUjmqde1R5jLKyld9Bb7lxIg+fbVSE40vwmYPNb7MC0+HIOkyLp9vBl8TdJeY7mN2
 iXeO6cdOszcA61LldCMpNrNkMwsJHp1j8N9MyllqxljZ+SddkAf5Dy70vnXFDbvH334T
 F+3tGzwaBn75o7hrb1l2x3ywv/1gskA7SkGML33XaN7UJT/S45Wygoo9+zqe98ZmIlFk
 IrcFSA096otYbk35BN1A3QR8NQNpPCvaX6sNb3vAmzhvZH9G4qbbO1Wjay0LQTqEOPuW
 jwj8TZBFL6x+w+51LAs0xErwFH0RnPaALGNIIG1d8bY3cMPhDjdOly9kcTNqY+X6pOxa
 x5SQ==
X-Gm-Message-State: APjAAAV0LJsycbfVJfCEQWgAbunLQOAwy1y+9fqRIECEOmV4q/0G3sR1
 4BGZLO1UeNd/nVgfzjGLGYcSYg==
X-Google-Smtp-Source: APXvYqwZUyVJCtO5ywHyrzDNXrhYzKt4wEMC/xHUqrhtDKQAar1dMPYAHypw7YosnkttUE4n03KNUg==
X-Received: by 2002:aa7:8dd2:: with SMTP id j18mr50211433pfr.88.1564631088809; 
 Wed, 31 Jul 2019 20:44:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:48 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/26] drm: kirin: Get rid of drmP.h includes
Date: Thu,  1 Aug 2019 03:44:15 +0000
Message-Id: <20190801034439.98227-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=glR6oLsrJBxGZFPDkXtm2pq0TMtj5d9cDHh+aCshZSM=;
 b=MdmQoxQbTaoF/R7+yM5VR/ujeIBF5Fb754pcNDvBMGuz9U/tQe77z4f9FvNzWKoVoG
 Mz02LZDfmF0puZa6CKDNrl8gwFRXEbiivEbkx8WgvhSCOWSic5m399U/oGiIe2RyHBvz
 QsOXc4BKoo73GYJrYKtveMj6NjvGpP4OBC/sSOmuQQr6RT5gnFCvxP0x8uns39qhyXKm
 sOFenrXPARzflNWYvqvqWN2uPlujyQukVt3ELkjt2cwvFM43rCyyrRRXPhJ463+lKecb
 vhhIGfgcbMT3LmhQoEicVKt7ZxJh93HH79tJTQKKHQfvzoMtt5ttIRboolYZoHvlBOja
 Qn6A==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVzZSBvZiBkcm1QLmggaW4ga2lyaW4gZHJpdmVyCgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTdWdnZXN0ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFy
by5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRl
LmMgfCA2ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
ZHJ2LmMgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2ly
aW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
YWRlLmMKaW5kZXggZDY5YjVkNDU4OTUwLi45YTllM2I2ODhiYTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC0xNyw4ICsxNywxMiBA
QAogI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgorI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFu
ay5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kZXZp
Y2UuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWlj
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9jcnRjLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tp
cmluX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2Rydi5jCmluZGV4IDRhN2ZlMTBhMzdjYi4uZmJhYjczYzU4NTFkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwpAQCAtMTQsOCArMTQsMTAg
QEAKICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbXBv
bmVudC5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+CisjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5r
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19o
ZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX2ZiX2hlbHBlci5oPgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
