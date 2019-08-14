Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD98DD4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D868F6E7D3;
	Wed, 14 Aug 2019 18:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401F6E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:16 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w3so16323280pgt.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mTsaQr/BGfn/0oGZCU1NOuvNsQeVfs5BZ0y5MQK4HZo=;
 b=HFCSeNZeNaWU6EKURhDfdFmlHYCV3QHdgNSEtsbTH0cZo675IEbRQn1Tft0UHjf+pg
 KHFXFNzxA3LQVWR8HdZIfCZa8nwZ3DOgXnrFdswGADIVi9tyCO3GFQe04l6DOLSO9x/G
 +PUQxv1IpsnEO5CjmycNjlcIa954k7HlJ2DwnxgOctg2jfhShY0dpn9pPlAOPfUyzKpH
 fwpp6lq17PHBUZ2CDuc9EY5aaJwjI1sPI5X059ZNINDA149rP2ySDd9dWBJy5C6XDQ6U
 XAUsMc/w+xcb3/8g7+AcHwbdDLNavoxCoYF4d7FmqQycEiCM1u4+bkFlgp07hFbeyL8Q
 S1iQ==
X-Gm-Message-State: APjAAAUNRbs5VyowKymNegfFOUTcPiLNHOe/PYe3bIjvT+QUjKUxvqw+
 /vxXMBKxLHchp0kG2R+n7ls2aQ==
X-Google-Smtp-Source: APXvYqz9sWuMrYnJ71oWGt4PPF5S0nMvyCRFGdTZmp2X1HPVn5mbdmlna+I0NEyr5eJPDQFLrW3tHw==
X-Received: by 2002:aa7:90c9:: with SMTP id k9mr1332133pfk.171.1565808436316; 
 Wed, 14 Aug 2019 11:47:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:15 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 06/26] drm: kirin: Remove out_format from ade_crtc
Date: Wed, 14 Aug 2019 18:46:42 +0000
Message-Id: <20190814184702.54275-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mTsaQr/BGfn/0oGZCU1NOuvNsQeVfs5BZ0y5MQK4HZo=;
 b=o3DL2zjuNDIUowRC65Y7G85lgkhRHxMh346JtwhfodzRxGUaYUKU+thJCSJsBe4WJi
 o7jmKjTDOR/IWLt4CEvdDBzJbCiK0WShw5JO4BzYTiMAqvi7HWFu5LYCg6b2i0126Fxm
 r5ZWEFL1w8WnqZj3ws34aNLYNJa1AdQPUI37trOnmxNtOVF83WFeJ6eLezTeE0zZ+AlO
 fE5d4qz1P03Cz5hCnJ56goR/ZbBos3YU7jph+HMsObrsY3og0t20I7qPD0xApbiUluqI
 GoH4QvAomVPnLnwvhXcLrPsEC2olYCDvoAdTpAYx2C8v1zSx97YBTjrhanjp7IytNT/6
 5V6A==
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
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgb3V0X2Zvcm1hdApmaWVsZCBp
biB0aGUgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3YXMgb25seSBldmVyIHNldCB0bwpMRElfT1VU
X1JHQl84ODguCgpUaHVzIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgZmllbGQgYW5kIGluc3RlYWQg
ZGlyZWN0bHkgdXNlcwpMRElfT1VUX1JHQl84ODguCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25n
cm9uZ0BnbWFpbC5jb20+CkNjOiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29u
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogWHUgWWlQ
aW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0ejogcmV3b3JkZWQgY29tbWl0IG1l
c3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIHwg
OSArKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9k
cm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUu
YwppbmRleCA3NTZhZWZkNWJjZmYuLjczZGZmMjFiZWQ2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTYwLDcgKzYwLDYgQEAgc3Ry
dWN0IGFkZV9jcnRjIHsKIAlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4OwogCXN0cnVjdCB3b3JrX3N0
cnVjdCBkaXNwbGF5X3Jlc2V0X3dxOwogCWJvb2wgZW5hYmxlOwotCXUzMiBvdXRfZm9ybWF0Owog
fTsKIAogc3RydWN0IGFkZV9wbGFuZSB7CkBAIC0zODMsMTEgKzM4MiwxMCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgYWRlX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJcmV0dXJuIElS
UV9IQU5ETEVEOwogfQogCi1zdGF0aWMgdm9pZCBhZGVfZGlzcGxheV9lbmFibGUoc3RydWN0IGFk
ZV9jcnRjICphY3J0YykKK3N0YXRpYyB2b2lkIGFkZV9kaXNwbGF5X2VuYWJsZShzdHJ1Y3QgYWRl
X2h3X2N0eCAqY3R4KQogewotCXN0cnVjdCBhZGVfaHdfY3R4ICpjdHggPSBhY3J0Yy0+Y3R4Owog
CXZvaWQgX19pb21lbSAqYmFzZSA9IGN0eC0+YmFzZTsKLQl1MzIgb3V0X2ZtdCA9IGFjcnRjLT5v
dXRfZm9ybWF0OworCXUzMiBvdXRfZm10ID0gTERJX09VVF9SR0JfODg4OwogCiAJLyogZW5hYmxl
IG91dHB1dCBvdmVybGF5IGNvbXBvc2l0b3IgKi8KIAl3cml0ZWwoQURFX0VOQUJMRSwgYmFzZSAr
IEFERV9PVkxZWF9DVEwoT1VUX09WTFkpKTsKQEAgLTUxNCw3ICs1MTIsNyBAQCBzdGF0aWMgdm9p
ZCBhZGVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAl9CiAKIAlh
ZGVfc2V0X21lZGlhbm9jX3FvcyhjdHgpOwotCWFkZV9kaXNwbGF5X2VuYWJsZShhY3J0Yyk7CisJ
YWRlX2Rpc3BsYXlfZW5hYmxlKGN0eCk7CiAJYWRlX2R1bXBfcmVncyhjdHgtPmJhc2UpOwogCWRy
bV9jcnRjX3ZibGFua19vbihjcnRjKTsKIAlhY3J0Yy0+ZW5hYmxlID0gdHJ1ZTsKQEAgLTEwMjQs
NyArMTAyMiw2IEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJY3R4ID0gJmFkZS0+Y3R4OwogCWFjcnRjID0gJmFkZS0+YWNydGM7CiAJYWNy
dGMtPmN0eCA9IGN0eDsKLQlhY3J0Yy0+b3V0X2Zvcm1hdCA9IExESV9PVVRfUkdCXzg4ODsKIAog
CXJldCA9IGFkZV9kdHNfcGFyc2UocGRldiwgY3R4KTsKIAlpZiAocmV0KQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
