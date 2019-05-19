Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8DD226E5
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 15:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34301891CA;
	Sun, 19 May 2019 13:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB2C891CA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 13:51:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r76so10034343lja.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 06:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tSDY8qCfN3tlT6t+R2GiMImeFNXG9SWQiFQPA4hdzSc=;
 b=fvhEHn1QHrLNcyeEeaFJNTOTC5HfBJQXby+WNO1KqBN81xApLeKjAlOgUtOegFJrw1
 h30xwD0Bd8U5i4LMBOowrSXtjDv6ratt6PoVutMnXZxbVD3mA0pf54Wp+0/VwZcR+IG8
 S45XYU/xlj2Zke59nBXjhqLbH45KlB7/rD32B0OvnXW0TzjNB37MQcC/AJtZItlHVIbP
 qXmWae6yatEi7XHldhHIw56vsMb2+bu7oah89O9mhFUDocWmZhSKfsUbpFJy1NsKHG2V
 9X29JKTJ2rjzKdj0eBSGSzSaFDyI4fvEKAIsjKnQ/ndeh2qxYDPvW19i12Hues1Fthyv
 ZbGQ==
X-Gm-Message-State: APjAAAX3wblb3b/NrtZzCDLAV5z/vxpu89TlU9aXllUx/jAZuRJlfTC+
 raHok4QeNiGZdSQqlsgxKrfFP4Ig
X-Google-Smtp-Source: APXvYqwpFDTV7pAV/UJKEg6jpB7W6ZOQwtxKPgqUaTJPoH3+vPs7GT0M/HYg3ESN5o2Id19Byu8BYw==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr26954255ljk.122.1558273896657; 
 Sun, 19 May 2019 06:51:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w26sm3724462lfl.0.2019.05.19.06.51.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 06:51:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] drm/gma500: drop use of DRM_UDELAY wrapper
Date: Sun, 19 May 2019 15:51:08 +0200
Message-Id: <20190519135109.21536-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519135109.21536-1-sam@ravnborg.org>
References: <20190519135109.21536-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSDY8qCfN3tlT6t+R2GiMImeFNXG9SWQiFQPA4hdzSc=;
 b=dUvPv7OsR54P7D8ZlgQ2P3BZhOuoKd/qipnGzEucUHXp2FGNVQlGp+TeRjE6VAauu3
 ZNSEW3fTFXgq749leV9lzLPK8BDnu1Hzlhlst0HV/0Mee0Z0fRwlgZxanlFmaWC1jF/z
 Msi734fvoKKSe8+iXc0b7OoSLBCgS8ObGGto2cld02a0nUcfH8vSs+2kzUbxJkWqasIZ
 z3RZLSsPKKPtA0WytP5ZaqBF8yfvypj9lr88oSZtnfEZKveTiAoZmntkJLytDnd6U92m
 GX7eEHpI0W9pUEQzyb+G3hqi4yYhFdaV3NOwYot988x+ATouGgtsaqB7xFop1M50jylz
 cRPA==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9VREVMQVkgd3JhcHBlciBmcm9tIGRybV9vc19saW51eC5oIGlzIHVzZWQgaW4gYSBm
ZXcgcGxhY2VzLAphbGwgb3RoZXIgcGxhY2VzIGNhbGxzIHVkZWxheSgpIHdpdGggbm8gd3JhcHBl
ci4KClRoZXJlIGlzIG5vIHJlYXNvbiB0byBjb250aW51ZSB0byB1c2UgdGhpcyB3cmFwcGVyIC0g
c28gZHJvcCBpdAphbmQgZGlyZWN0IGNhbGwgdWRlbGF5KCkuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsu
ci5qYWtvYnNzb25AZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfZGV2aWNlLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3Ry
YWlsX2hkbWkuYyAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMKaW5kZXggNTg1
ZWMyZTQ2MTY2Li5lZGI5YjFiYmQ2YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvbWRmbGRfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kZXZp
Y2UuYwpAQCAtMzQ0LDcgKzM0NCw3IEBAIHN0YXRpYyBpbnQgbWRmbGRfcmVzdG9yZV9kaXNwbGF5
X3JlZ2lzdGVycyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgcGlwZW51bSkKIAogCWlmIChw
aXBlbnVtID09IDEpIHsKIAkJLyogcmVzdG9yZSBwYWxldHRlIChnYW1tYSkgKi8KLQkJLypEUk1f
VURFTEFZKDUwMDAwKTsgKi8KKwkJLyogdWRlbGF5KDUwMDAwKTsgKi8KIAkJZm9yIChpID0gMDsg
aSA8IDI1NjsgaSsrKQogCQkJUFNCX1dWREMzMihwaXBlLT5wYWxldHRlW2ldLCBtYXAtPnBhbGV0
dGUgKyAoaSA8PCAyKSk7CiAKQEAgLTQwNiw3ICs0MDYsNyBAQCBzdGF0aWMgaW50IG1kZmxkX3Jl
c3RvcmVfZGlzcGxheV9yZWdpc3RlcnMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IHBpcGVu
dW0pCiAJUFNCX1dWREMzMihwaXBlLT5jb25mLCBtYXAtPmNvbmYpOwogCiAJLyogcmVzdG9yZSBw
YWxldHRlIChnYW1tYSkgKi8KLQkvKkRSTV9VREVMQVkoNTAwMDApOyAqLworCS8qIHVkZWxheSg1
MDAwMCk7ICovCiAJZm9yIChpID0gMDsgaSA8IDI1NjsgaSsrKQogCQlQU0JfV1ZEQzMyKHBpcGUt
PnBhbGV0dGVbaV0sIG1hcC0+cGFsZXR0ZSArIChpIDw8IDIpKTsKIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMKaW5kZXggZjA4NzJlMmMyMmQ1Li4yZDhhZmJiNTFhNzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9kZXZpY2UuYwpAQCAtMzI3LDcgKzMy
Nyw3IEBAIHN0YXRpYyBpbnQgb2FrdHJhaWxfcmVzdG9yZV9kaXNwbGF5X3JlZ2lzdGVycyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJLyogQWN0dWFsbHkgZW5hYmxlIGl0ICovCiAJUFNCX1dW
REMzMihwLT5kcGxsLCBNUlNUX0RQTExfQSk7Ci0JRFJNX1VERUxBWSgxNTApOworCXVkZWxheSgx
NTApOwogCiAJLyogUmVzdG9yZSBtb2RlICovCiAJUFNCX1dWREMzMihwLT5odG90YWwsIEhUT1RB
TF9BKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5j
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMKaW5kZXggYzZkNzJkZTFj
MDU0Li43OTczMjkwMjg0MzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2Fr
dHJhaWxfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5j
CkBAIC04MTUsNyArODE1LDcgQEAgdm9pZCBvYWt0cmFpbF9oZG1pX3Jlc3RvcmUoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9BREpVU1QsIERQ
TExfQURKVVNUKTsKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9VUERBVEUsIERQTExf
VVBEQVRFKTsKIAlQU0JfV1ZEQzMyKGhkbWlfZGV2LT5zYXZlRFBMTF9DTEtfRU5BQkxFLCBEUExM
X0NMS19FTkFCTEUpOwotCURSTV9VREVMQVkoMTUwKTsKKwl1ZGVsYXkoMTUwKTsKIAogCS8qIHBp
cGUgKi8KIAlQU0JfV1ZEQzMyKHBpcGViLT5zcmMsIFBJUEVCU1JDKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
