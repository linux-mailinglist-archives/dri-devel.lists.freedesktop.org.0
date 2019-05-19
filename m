Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E811226EA
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DE589229;
	Sun, 19 May 2019 14:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031278920D;
 Sun, 19 May 2019 14:00:58 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so8431849lfl.3;
 Sun, 19 May 2019 07:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z4zY19Jxb/avqjwVLOTjkhWbgu5rwbeaNrgDzY624B0=;
 b=ZKLIyLK305pRX93nyNPDbtSF82+1nV9pZ6wyRuvZastsl6NYWwNbGOb0UjOfHgAjjC
 xqsUHrZ/Xljy6jvoIry3i2hck5BBKO0xt1ezsy3Vq2oAaeCQe2InR6qpBU8JWEslatyC
 0PuVuPweO84hpl49hl/xmp604suv+BK7cZ0juMS35C1MCGyU9tpwse12JDJAp5oxWqcs
 4wLhoNKYeaKXHuyuVzsL8I5bMvhHYq3bIKaoJHugx+HHszwy2GfJS4aqailO35DeM2FG
 bO7JPbnk/WGQn06TfpZCVfgM5QIqTXsJxRSEho/y1gZdeYOF0REFyoQCj6k1IYVeZ6aI
 ZnhQ==
X-Gm-Message-State: APjAAAVTkm6wSfIOM+bZAM4gBtXCzPVBIJUd+rG8a8a47ffrgScUEo5m
 oCJmYpRcVl0cg0+vdKW7zSw=
X-Google-Smtp-Source: APXvYqy4XfAgbKmBvY2T5/xzj9vWO1nAK8jnTFAvgDr4anyic31UN70HZ/QFTvAj/iyodxogjxErBg==
X-Received: by 2002:a19:a8c8:: with SMTP id r191mr33228852lfe.85.1558274456420; 
 Sun, 19 May 2019 07:00:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k18sm3153572ljk.70.2019.05.19.07.00.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:00:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/nouveau: drop use of drmP.h
Date: Sun, 19 May 2019 16:00:40 +0200
Message-Id: <20190519140044.22142-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4zY19Jxb/avqjwVLOTjkhWbgu5rwbeaNrgDzY624B0=;
 b=bp0PXl1rw+CewZAmrdmKHQ8lR2KTx/U1kIS0VpTthZMyBMMSOE/8ysSLQJAOx9OpRT
 /yW/CnnaXd5VUEBT6chycSkUePZuO4u2qd/n/+Tooj/Gs+R1UX+v/mOZRlawC+dbJUWf
 J0mTyX1soEK/6uHEg65Tztu1uuv48h9xoSaP1ZCNdlLXVBiibetiSpSJpsuKWDX8eST8
 znfsagm3tcersV553kTQc5K/LNnmIQk1/+oib0YuVyDzF2aBGF2ecqZQYDHkszquvjb3
 lJhwBOw0td60RPIQPWB/lmAAMVMys1J6j29vTtjgjDzkyrm07fq502JUaGJHM6wgw8ZK
 l+EQ==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBwYXRjaHNldCByZW1vdmUgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAu
aApoZWFkZXIgZmlsZSBpbiB0aGUgbm91dmVhdSBkcml2ZXIocykuCkFzIHByZXBhcmF0aW9uIGEg
ZGVwZW5kZW5jeSBvbiBkcm1fb3NfbGludXguaCBpcyBkcm9wcGVkLgpUaGUgbGlzdCBvZiBpbmNs
dWRlIGZpbGVzIGFyZSBzb3J0ZWQgYW5kIGFyZSBpbiBzb21lIGNhc2VzCmRpdmlkZWQgdXAgaW4g
YmxvY2tzIG9mIGxpbnV4LyogZHJtLyogZXRjLgoKVGhlIHJlbW92YWwgaXMgZGl2aWRlZCB1cCBp
biBhIGZldyBwYXRjaGVzIHRoYXQgd2FzIHRoZSBsb2dpY2FsCnN0ZXBzIHRvIHJlbW92ZSB0aGUg
dXNlIG9mIGRybVAuaC4KCkJ1aWxkIHRlc3RlZCB3aXRoIGFsbG1vZGNvbmZpZyBhbmQgYWxseWVz
Y29uZmlnIGZvciB4ODYsIGFybSwgYWxwaGEgYW5kIG1vcmUuCgpQYXRjaHNldCBtYWRlIG9uIHRv
cCBvZiBkcm0tbWlzYy1uZXh0LgoKICAgICAgICBTYW0KClNhbSBSYXZuYm9yZyAoNCk6CiAgICAg
IGRybS9ub3V2ZWF1OiBkcm9wIHVzZSBvZiBEUk1fVURFTEFZCiAgICAgIGRybS9ub3V2ZWF1OiBk
cm9wIGRybVAuaCBmcm9tIG5vdXZlYXVfZHJ2LmgKICAgICAgZHJtL25vdXZlYXU6IGRyb3AgZHJt
UC5oIGZyb20gYWxsIGhlYWRlciBmaWxlcwogICAgICBkcm0vbm91dmVhdTogZHJvcCB1c2Ugb2Yg
ZHJtcC5oCgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMgICAgICAgICB8
IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYyAgICAgICAgfCAz
ICsrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3Vyc29yLmMgICAgICB8IDEg
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvZGFjLmMgICAgICAgICB8IDEgLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvZGZwLmMgICAgICAgICB8IDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2Rpc3AuYyAgICAgICAgfCAxIC0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2h3LmMgICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2h3LmggICAgICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjA0L292ZXJsYXkuYyAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjA0L3R2bW9kZXNudjE3LmMgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjA0L3R2bnYwNC5jICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjA0L3R2bnYxNy5jICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Jhc2U1MDdjLmMgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmMgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9vdmx5NTA3ZS5jICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC93bmR3LmMgICAgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iaW9zLmMgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Y29ubmVjdG9yLmMgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY3J0
Yy5oICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RlYnVn
ZnMuaCAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5
LmMgICAgICB8IDQgKysrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5
LmggICAgICB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWEuYyAg
ICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyAgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgICAgICAg
ICAgfCAzICsrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCAgICAgICAg
ICB8IDUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uYyAgICAg
ICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZlbmNlLmMgICAgICAg
IHwgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmggICAgICAgICAg
fCAyIC0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2h3bW9uLmMgICAgICAgIHwg
MiAtLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9pb2MzMi5jICAgICAgICB8IDMg
KystCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgICAgICAgIHwgMSAt
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ZnYS5jICAgICAgICAgIHwgMSAtCiAz
MyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
