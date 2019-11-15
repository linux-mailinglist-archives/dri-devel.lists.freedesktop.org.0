Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D169FD8AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD91E6E1C4;
	Fri, 15 Nov 2019 09:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594266E1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:21:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q70so8899916wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sFDoyGvE0TElP1DDSvUR0jo1soIAcjtkFOowunx7Ft0=;
 b=c1RRHQlSlJtuLSceR4JwncZnFTuijreSgBs4CM4n9RhuH/I9r+yAD8NNVzUiS3rufn
 m4WSKBhIX9Co88IX7XUltRSoo4PsFKKQ5fzUdF1lGju8sXz3CSo+CfzqBNweR1s+WgNK
 TUpJBA1TTNJKEH5JMtjstAP0RJM91xooPz5mdezn6vWtd975v+19CdrJayjrqqUnSl6B
 6/opbyrw/y9FwtplBJYOW2m/jH9naRWruJd/4w9SqszPkTfCsR0VyKPg1cRy4XJ2ND0H
 Dov4mk8WLrTU4xoVnMORbSIUx6Ylwkkv79AquiBwtFAHcz2DFgJnvZkuvY5qudwj40B3
 /zow==
X-Gm-Message-State: APjAAAUGGB1GLTzlbEeQegApfbkPbLygUaeMDZq5kap9l9razttYkv0k
 cLa2gN7xey4x0hFwBQIxxIfWsXXXNjE=
X-Google-Smtp-Source: APXvYqyg3LPdsaax7SG114ffaoDz3JvBTc6+BAyTQu6piQWNDV40HI8EvyOFGQYtRVZPXWHXqsIOVg==
X-Received: by 2002:a05:600c:218e:: with SMTP id
 e14mr12481658wme.22.1573809686669; 
 Fri, 15 Nov 2019 01:21:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/8] fb_create drive-through cleanups
Date: Fri, 15 Nov 2019 10:21:12 +0100
Message-Id: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sFDoyGvE0TElP1DDSvUR0jo1soIAcjtkFOowunx7Ft0=;
 b=SkaBeXTFyOe/KDP07IRWlp1ITkEXumCIHh+XNe97aB0XILvXloVS7HoCRcN5oGRdZN
 E5y/8AjJVt9xGRBWa+HgyTlCSbUfeJ+3Lf4h9vKv/drx9sHxC6i2AAq6V6ZvmlDC0Mzp
 sn8gp7zPcihTaw+6r3tghFBP7aSHAfqqEfs9Y=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSW5zcGlyZWQgYnkgc29tZSBjaGF0dGluZyB3aXRoIFBla2thIG9uIGlyYyBJIGxv
b2tlZCBhIGxvdCBhdCBvdXIKLT5mYl9jcmVhdGUgaW1wbGVtZW50YXRpb25zLiBTb21lIGNsZWFu
dXBzICh0aGUgc2ltcGxlciBvbmVzKSBhbmQgc29tZQp0b2RvcyAodGhlIG1vcmUgaW52b2x2ZWQg
c3R1ZmYpLgoKSXQncyBub3QgYSBsb3Qgb2YgY29kZSB0aGF0IHdlIGNhbiBjb2xsZWN0IGV2ZW4g
d2l0aCBhbGwgdGhlIHRvZG9zLCBidXQgd2UKaGF2ZSBzbyBtYW55IGRyaXZlcnMgbm93YWRheXMg
aXQncyB3b3J0aCBpdCBldmVuIGZvciB0aGUgdGlueSB0aGluZ3MuCgpSZXZpZXcgYW5kIGZvciB0
aGUgZHJpdmVyIHBhdGNoZXMgZXNwZWNpYWxseSBzb21lIHRlc3RpbmcgdmVyeSBtdWNoCndlbGNv
bWUuCgpDaGVlcnMsIERhbmllbAoKRGFuaWVsIFZldHRlciAoOCk6CiAgZHJtL2ZiOiBNb3JlIHBh
cmFub2lhIGluIGFkZGZiIGNoZWNrcwogIGRybS9hdG1lbDogZGl0Y2ggZmJfY3JlYXRlIHdyYXBw
ZXIKICBkcm0vbWVkaWF0ZWs6IGRvbid0IG9wZW4tY29kZSBkcm1fZ2VtX2ZiX2NyZWF0ZQogIGRy
bS9yb2NrY2hpcDogVXNlIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZGlydHkKICBkcm0vdGlsY2Rj
OiBEcm9wIGRybV9nZW1fZmJfY3JlYXRlIHdyYXBwZXIKICBkcm0veGVuOiBTaW1wbGlmeSBmYl9j
cmVhdGUKICBkcm0vaGlibWM6IFVzZSBkcm1fZ2VtX2ZiX2NyZWF0ZQogIGRybS90b2RvOiBBZGQg
ZW50cnkgZm9yIGZiIGZ1bmNzIHJlbGF0ZWQgY2xlYW51cHMKCiBEb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdCAgICAgICAgICAgICAgICAgICAgfCAyNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jICB8ICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZyYW1lYnVmZmVyLmMgICAgICAgICAgICAgfCAxNyArKy0tCiAuLi4vZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2RlLmMgICAgfCAgNCArLQogLi4uL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuaCAgIHwgMTEgKy0tCiAuLi4vZ3B1L2RybS9oaXNpbGljb24v
aGlibWMvaGlibWNfZHJtX2ZiZGV2LmMgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9oaWJtYy9oaWJtY190dG0uYyAgIHwgNjIgKysrLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgMTYgKysrLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZmIuYyAgICAgICAgIHwgOTIgLS0tLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZmIuaCAgICAgICAgIHwgMTMgLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgICAgfCAgMSAtCiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgICAgfCA1NCArLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgICAgICAgICAgIHwgIDggKy0K
IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyAgICAgICB8ICA5ICstCiAx
NCBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspLCAyNTEgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZmIuYwogZGVs
ZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2ZiLmgKCi0t
IAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
