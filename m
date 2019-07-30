Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741E7B5FC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 01:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F346E63F;
	Tue, 30 Jul 2019 23:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE5B6E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 23:01:08 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f5so21994982pgu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 16:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkytYeH7M66nBAoxCQa0bNBGsymk7oY3s7W/ud/aulQ=;
 b=Tp62zFYNuwCCDr+kbUA7zT8dp7XCPBUkpqfWYifut7UlsjEu1TDNNRD+Mw5NR8PS1y
 C7NUceIWeO5TPoXHblGKELQ+s7UWKpjl/Xd90ckghKu+6i5Z07sgw//C9CRcNCwfHvaO
 g9KTp8TDrSjs5XzIedHKYFWZGorjESTRbirrySn8K3l0QwdyGf126sbI/2dIxDlM5mr3
 97srQx8RWwiRoYBSH5IpaNyFYSlJfZMg07VftKytazn9frh4DaiiFSUzK+ZLGSR1Bcuo
 tSN5Ffy7nNPBNDb2FBILg0K/VzhqGMd63waUNSoTeCrGrdASZt7yHf1Lelqv77ZKvfBT
 j4AQ==
X-Gm-Message-State: APjAAAX1Wi70zfFwouMxZ0eW89tEUV/ItAJFZErpXX7CVws/ZjlIORaF
 WbRfTnfUsHt2T24QiBj+HdxqtGwvjys=
X-Google-Smtp-Source: APXvYqxZB4H2ozpiUg+eNXM9lA/nk8Bx4kCAQNMkihvOXk6znIkuChUDwYlzk05yBdkdNw5K835/HQ==
X-Received: by 2002:a62:87c8:: with SMTP id
 i191mr44314801pfe.133.1564527668085; 
 Tue, 30 Jul 2019 16:01:08 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id q22sm60432615pgh.49.2019.07.30.16.01.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 16:01:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: add cache support for arm64
Date: Tue, 30 Jul 2019 15:58:46 -0700
Message-Id: <20190730225852.30319-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkytYeH7M66nBAoxCQa0bNBGsymk7oY3s7W/ud/aulQ=;
 b=lZbeCYiFHn/t0t6F+ChT5unZY+5uTZKrCGEloLfqvJgD+wwHI7PM6JvcurR3hXG0Yg
 FMyzS5zW3wvGb777PQdA0k1hEHTHyqRgLpfFbmW4JVAnjrPaoPAEeXmDM58BkL8XK+hW
 iCIuaoLH7nMJLLtfhpc0edA6bMMyhCI3DycK/lsZZMyh4E1cxu9gTvcEorjrYA4GRRrq
 4DN1fYDeJ4v6M16KMwtAs4FJa9BE5ha1Qbku48nNtZiy7QxrvrFzs8ASeloSiz8j6jxq
 9JU8uwsvKDTAXzHxc8WM3Y2jpnwxZoLmw5yzswesSEUt4z03NbPtksue8thNq0HpmxCN
 4omw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KTm90IHN1cmUgYWJvdXQgMzJi
IGFybSwgYnV0IGF0IGxlYXN0IGZvciBhYXJjaDY0IHRoaXMgaXMgcmVsYXRpdmVseQplYXN5LiAg
U28gbGV0cyBhdCBsZWFzdCBlbmFibGUgZm9yIGFybTY0LgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Y2FjaGUuYyB8IDIwICsrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKaW5kZXggM2JkNzZlOTE4
YjVkLi45MDEwNWM2Mzc3OTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKQEAgLTY5LDYgKzY5LDE0IEBAIHN0
YXRpYyB2b2lkIGRybV9jYWNoZV9mbHVzaF9jbGZsdXNoKHN0cnVjdCBwYWdlICpwYWdlc1tdLAog
fQogI2VuZGlmCiAKKyNpZiBkZWZpbmVkKF9fcG93ZXJwY19fKQorc3RhdGljIHZvaWQgX19mbHVz
aF9kY2FjaGVfYXJlYSh2b2lkICphZGRyLCBzaXplX3QgbGVuKQoreworCWZsdXNoX2RjYWNoZV9y
YW5nZSgodW5zaWduZWQgbG9uZylhZGRyLAorCQkJICAgKHVuc2lnbmVkIGxvbmcpYWRkciArIFBB
R0VfU0laRSk7Cit9CisjZW5kaWYKKwogLyoqCiAgKiBkcm1fY2xmbHVzaF9wYWdlcyAtIEZsdXNo
IGRjYWNoZSBsaW5lcyBvZiBhIHNldCBvZiBwYWdlcy4KICAqIEBwYWdlczogTGlzdCBvZiBwYWdl
cyB0byBiZSBmbHVzaGVkLgpAQCAtOTAsNyArOTgsNyBAQCBkcm1fY2xmbHVzaF9wYWdlcyhzdHJ1
Y3QgcGFnZSAqcGFnZXNbXSwgdW5zaWduZWQgbG9uZyBudW1fcGFnZXMpCiAJaWYgKHdiaW52ZF9v
bl9hbGxfY3B1cygpKQogCQlwcl9lcnIoIlRpbWVkIG91dCB3YWl0aW5nIGZvciBjYWNoZSBmbHVz
aFxuIik7CiAKLSNlbGlmIGRlZmluZWQoX19wb3dlcnBjX18pCisjZWxpZiBkZWZpbmVkKF9fcG93
ZXJwY19fKSB8fCBkZWZpbmVkKENPTkZJR19BUk02NCkKIAl1bnNpZ25lZCBsb25nIGk7CiAJZm9y
IChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKSB7CiAJCXN0cnVjdCBwYWdlICpwYWdlID0gcGFn
ZXNbaV07CkBAIC0xMDAsOCArMTA4LDcgQEAgZHJtX2NsZmx1c2hfcGFnZXMoc3RydWN0IHBhZ2Ug
KnBhZ2VzW10sIHVuc2lnbmVkIGxvbmcgbnVtX3BhZ2VzKQogCQkJY29udGludWU7CiAKIAkJcGFn
ZV92aXJ0dWFsID0ga21hcF9hdG9taWMocGFnZSk7Ci0JCWZsdXNoX2RjYWNoZV9yYW5nZSgodW5z
aWduZWQgbG9uZylwYWdlX3ZpcnR1YWwsCi0JCQkJICAgKHVuc2lnbmVkIGxvbmcpcGFnZV92aXJ0
dWFsICsgUEFHRV9TSVpFKTsKKwkJX19mbHVzaF9kY2FjaGVfYXJlYShwYWdlX3ZpcnR1YWwsIFBB
R0VfU0laRSk7CiAJCWt1bm1hcF9hdG9taWMocGFnZV92aXJ0dWFsKTsKIAl9CiAjZWxzZQpAQCAt
MTM1LDYgKzE0MiwxMyBAQCBkcm1fY2xmbHVzaF9zZyhzdHJ1Y3Qgc2dfdGFibGUgKnN0KQogCiAJ
aWYgKHdiaW52ZF9vbl9hbGxfY3B1cygpKQogCQlwcl9lcnIoIlRpbWVkIG91dCB3YWl0aW5nIGZv
ciBjYWNoZSBmbHVzaFxuIik7CisjZWxpZiBkZWZpbmVkKENPTkZJR19BUk02NCkKKwlzdHJ1Y3Qg
c2dfcGFnZV9pdGVyIHNnX2l0ZXI7CisKKwlmb3JfZWFjaF9zZ19wYWdlKHN0LT5zZ2wsICZzZ19p
dGVyLCBzdC0+bmVudHMsIDApIHsKKwkJc3RydWN0IHBhZ2UgKnAgPSBzZ19wYWdlX2l0ZXJfcGFn
ZSgmc2dfaXRlcik7CisJCWRybV9jbGZsdXNoX3BhZ2VzKCZwLCAxKTsKKwl9CiAjZWxzZQogCXBy
X2VycigiQXJjaGl0ZWN0dXJlIGhhcyBubyBkcm1fY2FjaGUuYyBzdXBwb3J0XG4iKTsKIAlXQVJO
X09OX09OQ0UoMSk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
