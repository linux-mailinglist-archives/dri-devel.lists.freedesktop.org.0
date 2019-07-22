Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB370AC4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC789EFF;
	Mon, 22 Jul 2019 20:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989189ECB;
 Mon, 22 Jul 2019 20:36:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x3so27724218lfc.0;
 Mon, 22 Jul 2019 13:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1iBifPGWP2LTcxOEVRu3kZ1JATkzIMZLD68+EVqSeBE=;
 b=mYFNVRCMQA4KDLByX68bBb5eQK5OEKWQgQxttsFqWWa2/N+aC1uaX/ZQVmW70w5+Hh
 hj+kRFZ2qYmkc7G0E011wnfVOyu/K76bHzeVVn34yVoFPOTEMYYU1LdKEFWRM4TW+RrZ
 E7s6his5/cn8LXEqsGufaFuUajgA52ohBOvMfLmIgkYM5ZPqhkQNMqowQ96R71C3X9/b
 jKlCTvkw9T07lGIrLZ1/m0CAp/7rKaK0zAmPZfhcW99aToGSyWLO5/NIb/UfOuzJZn+g
 EeK6Rv4u2Luu0R/coxi+TteGKEPIDsY1zLAuIIsQahD6stXBQjU0QrDIBAx9VJ3aVvGo
 7p3Q==
X-Gm-Message-State: APjAAAVOoCh/xQvADqYJdlkSihJnSprmJ6y3cbtfKhJ7/L7yH92oqrhe
 Np1W73353AEZS21JQ+njTWlaYFw0B38=
X-Google-Smtp-Source: APXvYqwJvDjGNfG9LX0sRTha+399edOJ7YNoRyrld/NwuoaNqg65WBXPGHOXzCMunVen1pXMoysA2g==
X-Received: by 2002:a05:6512:48f:: with SMTP id
 v15mr1892255lfq.37.1563827771179; 
 Mon, 22 Jul 2019 13:36:11 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u9sm6154398lfb.38.2019.07.22.13.36.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:36:10 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/via: make via_drv.h self-contained
Date: Mon, 22 Jul 2019 22:35:44 +0200
Message-Id: <20190722203545.8612-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722203545.8612-1-sam@ravnborg.org>
References: <20190722203545.8612-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iBifPGWP2LTcxOEVRu3kZ1JATkzIMZLD68+EVqSeBE=;
 b=JMGcIA1fUMQCiPvlrcUXG/JFY+grajlhOyPlKDY3mZ8H+Mhjdz1x/a2N86IoB48q5X
 JqF0FZQMKmIUzPgDtf/xYY0ULWoQur4B1vaTutSXgq5XuEonCnm1p7ltUihZE/+IAA1U
 ScptT5RLwHVHnoSpyNW+Ub1t8+/MP6Xx+crkCrVqViREhGLPXxvSGYPG7tD+ESGB+bWy
 A5WvcAItneVLXccQ1GnNiclIokl88PtBnVvxOcSBhD7lHRTgT0FqSlpPeWFq6aZx6S8N
 v4+wqzUEUlt7BX6mbgw2EigCNq5Jy93MpdH8nVZXr5VpN5z7M8blQC2j3E2i0W1E7JIS
 aZMQ==
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
L2RybS92aWEvdmlhX2Rydi5oCmluZGV4IDNlYjkyZTgxNjU1ZS4uODhkZWI5ZDhiNzY1IDEwMDY0
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
