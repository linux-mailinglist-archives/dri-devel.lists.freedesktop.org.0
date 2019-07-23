Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6172087
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 22:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81A6E3C6;
	Tue, 23 Jul 2019 20:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC8C6E3C4;
 Tue, 23 Jul 2019 20:10:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r15so13253063lfm.11;
 Tue, 23 Jul 2019 13:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRbdeKxq1WceYm3ON6sAN9EwfwauBB40B7hIiCmHnkc=;
 b=ltUyWH9dNLzr+XvE84+VvN99gEcY6iAVeD1HdYAQ5fgEZBkiOH0Gt5CnIVoVFclFOK
 rCQwk4Fkz+XNsA6Jz108TyDa4dI3rWJ01+Uit8joHbzcFHO9skbJXPTgb9zqklGOPoPF
 to2xA4sk1JqzWFTSKx/dpaOdVWc+bpA8rnV1PQAQn8+XpxJ18sC3omQgmmcm0V5G2RsB
 MY/WrJw47srYOZCIec2VZ+nBH2dkEaEKUsD94j0yUCEiU+EAGLuDTECqe5f5C5WkKUIh
 4tv0xgafgPY9oLLYDRoP2muJKU2leV4RoTM3eSQyhYxmEthC8xo4nZw2UuEl4QHi592D
 sWFw==
X-Gm-Message-State: APjAAAW8RtDXEON/SAnxPc+YPYA7f+M1XH0Ncp45ZkSrlJJ4cx+Hnwg0
 EmFQCeVk1kyg1wsKfb9mvfrwS5p83lM=
X-Google-Smtp-Source: APXvYqw1WC+lI+gN6EQv8XyrRKE14u2Dg215/AaRKRGZngiXydKpWiixPEXgKZDDXfQe2gCtzoaXiA==
X-Received: by 2002:ac2:4901:: with SMTP id n1mr22919963lfi.153.1563912641701; 
 Tue, 23 Jul 2019 13:10:41 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p21sm6708006lfc.41.2019.07.23.13.10.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 13:10:41 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/via: make via_drv.h self-contained
Date: Tue, 23 Jul 2019 22:09:43 +0200
Message-Id: <20190723200944.17285-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723200944.17285-1-sam@ravnborg.org>
References: <20190723200944.17285-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRbdeKxq1WceYm3ON6sAN9EwfwauBB40B7hIiCmHnkc=;
 b=LfwXifSLymAIjiRyen5fIGK0UqRFYZWeFSyxy/LWJyUOM66XPWgFP66+rAacrzAYsw
 cP/XgI0gtuA8/+gEPXlK7Lk92yfpPSK39PHAsD287ltQg1JVdDPvMS3GtwpN1rQH47kA
 iqXg/WsKcJRfxCSkFQqb94H+s/dwI68i9fkfbdKy8yVmq7RwA7Lv7zmOkcVFoh/ykxe8
 1x6IJ/7W7WUvtb24go9L0TrHKvg2CNQl6YjLfrTJeWhAn0ln1pPtmNANp4r7PNJndy6e
 NPpgDTse7tujYaLKP+kOju+7EcJ4VZFYZoOGZI1xDFE7w4LFWPtGL7N6Dwjhkxe13TTr
 7puA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgaW5jbHVkZSBvZiBoZWFkZXIgZmlsZXMgdG8gbWFrZSB2aWFfZHJ2Lmggc2VsZi1jb250
YWluZWQuCgp2MzoKLSBSZXdvcmRlZCBjaGFuZ2Vsb2cgYSBsaXR0bGUgLSB0byByZWZsZWN0IHRo
YXQgbW9yZSB0aGFuIG9uZQogIGhlYWRlciBmaWxlcyBhcmUgYWRkZWQKClNpZ25lZC1vZmYtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtv
diA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBLZXZpbiBCcmFjZSA8a2V2aW5icmFj
ZUBnbXguY29tPgpDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpD
YzogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgpDYzogTWlr
ZSBNYXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KQ2M6IElyYSBXZWlueSA8aXJhLndlaW55
QGludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNj
OiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92aWEvdmlhX2Rydi5oIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCBiL2RyaXZlcnMvZ3B1
L2RybS92aWEvdmlhX2Rydi5oCmluZGV4IDllNmEwYzVmMzE2Yy4uZDVhZDFiMDViZjc3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmlhL3ZpYV9kcnYuaApAQCAtMjQsMTMgKzI0LDE2IEBACiAjaWZuZGVmIF9WSUFfRFJWX0hf
CiAjZGVmaW5lIF9WSUFfRFJWX0hfCiAKKyNpbmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4KICNp
bmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CiAKKyNp
bmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX21tLmg+CisjaW5jbHVkZSA8ZHJtL3ZpYV9kcm0uaD4KIAogI2RlZmlu
ZSBEUklWRVJfQVVUSE9SCSJWYXJpb3VzIgogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
