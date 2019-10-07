Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423B8CDA52
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 03:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A216E40A;
	Mon,  7 Oct 2019 01:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D24D6E40A;
 Mon,  7 Oct 2019 01:57:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id y35so7247463pgl.1;
 Sun, 06 Oct 2019 18:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2bhwS/SnHsqondyimF4YNq31YFsWVxNjhPDLbhSOJg4=;
 b=Pw/zpktFF3iZ4Pyuda6ijsHvyMoeSWhuUFwLsQ4yVxezH7vAV2TCsqLFoDNUMsImlv
 RQ4W28Q7z1ro79+ma22LAdh8zGzfRbW+5CX2nJfR7+FZbyL5mQdy0huTEbMtlqDWJaUA
 ccR6xRb8lzNgR5jAU6Ytz4xYsm9VI2msgDuOQ0KLxYCWB2DcoysuWwhQE2+gVvKJZLHl
 zPjCpCb+9IW+VnRksZUO4xR8HVg6VrE5C0qtHh5RP1xkzLorKOoeU1NUga1Fjax/YuHj
 RRE/1c05XMs/McDmB3GPDJWtLWP6tu2P0cYsw/w+mrEt3h1PiGs9qLNPGdYAnYrbYjrr
 BdVw==
X-Gm-Message-State: APjAAAU3MFZrF04SQyI+wEEv7oOucxbYLePeeZka9DJClEh8mcY2Oesr
 U5lafmFm90VCSlPMhBUCoEgQ4cVRQWw=
X-Google-Smtp-Source: APXvYqxpJfT0BrRua7QU2H1BcE5+SiqSvmgJQt+qT5ktV9LqqwKRB1IT3fY3VkEAIQM0f6V8JClMVQ==
X-Received: by 2002:a17:90a:24a1:: with SMTP id
 i30mr32034346pje.128.1570413430867; 
 Sun, 06 Oct 2019 18:57:10 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 b123sm18328536pgc.72.2019.10.06.18.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 18:57:10 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/lima: simplify driver by using more drm helpers
Date: Mon,  7 Oct 2019 09:54:24 +0800
Message-Id: <20191007015430.20829-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2bhwS/SnHsqondyimF4YNq31YFsWVxNjhPDLbhSOJg4=;
 b=QD6C5I62nwIwALeKCWetD4hX7iw+c77A7lzpL9Tbli707itE4Eemt4CNgsWNmRWVxG
 7GpHnfh8YyNV4ovYrR5qRYsNimG68N3OKt+71HqVpi4aLkocx/QGCKo1SylDTHPOHm0q
 7fp1AlqBtokPJjy10nnURc+pqZZnI17aYQAQPY2QQ0SUDxFG/bRhNDtISZ7SOof0RFRy
 GfhAMwB7zeMJL5ZdLGBNcrUpJe2tbXzaGCV1Zb41gq/cEnPBIrAc7h8e22uq5Nz7+7lJ
 8bMmKlnnaojjEOCNPnW0aisp2BjB3qj3Ai0/XV6jQ9fq1PU5DbqSoE3IlArzeUqKVSvf
 87gg==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnkgdXNpbmcgc2hhcmVkIGRybSBoZWxwZXJzOgoxLiBkcm1fZ2VtX29iamVjdHNfbG9va3VwCjIu
IGRybV9nZW1fKHVuKWxvY2tfcmVzZXJ2YXRpb25zCjMuIGRybV9nZW1fc2htZW1faGVscGVycwp3
ZSBjYW4gc2ltcGxpZnkgbGltYSBkcml2ZXIgYSBsb3QgYW5kIGJlbmlmaXQgZnJvbSB1cGRhdGVz
IHRvCnRoZXNlIGZ1bmN0aW9ucy4KCmRybV9nZW1fb2JqZWN0c19sb29rdXAgbmVlZCBhIHJlZmlu
ZSBpbiBvcmRlciB0byBiZSB1c2VkIGJ5IGxpbWEuCgpOb3RlOgoxLiBjaGFuZ2VzIHRvIHBhbmZy
b3N0IGFuZCB2M2QgYXJlIGp1c3QgY29tcGlsZSB0ZXN0ZWQuCjIuIHBhdGNoIHNlcmllcyBpcyBi
YXNlZCBvbiBkcm0tbWlzYy1uZXh0IGJyYW5jaAoKdjI6CkFkZCBkcm1fZ2VtX29iamVjdHNfbG9v
a3VwX3VzZXIgYW5kIHVzZSBpdCBmb3IgZHJpdmVyIHdoaWNoCnBhc3MgdXNlciBHRU0gaGFuZGxl
cyBpbiBjb250aW91cyBhcnJheS4KCnYzOgppbXByb3ZlIGNvbW1pdCBjb21tZW50LgoKUWlhbmcg
WXUgKDYpOgogIGRybS9nZW06IHJlZmluZSBkcm1fZ2VtX29iamVjdHNfbG9va3VwCiAgZHJtL3Yz
ZDogdXNlIGRybV9nZW1fb2JqZWN0c19sb29rdXBfdXNlcgogIGRybS9saW1hOiB1c2UgZHJtX2dl
bV9vYmplY3RzX2xvb2t1cAogIGRybS9saW1hOiB1c2UgZHJtX2dlbV9zaG1lbV9oZWxwZXJzCiAg
ZHJtL2xpbWE6IHVzZSBkcm1fZ2VtXyh1bilsb2NrX3Jlc2VydmF0aW9ucwogIGRybS9saW1hOiBh
ZGQgX19HRlBfTk9XQVJOIGZsYWcgdG8gYWxsIGRtYV9hbGxvY193YwoKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMgICAgICAgICAgICAgICB8ICA1NyArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9s
aW1hL0tjb25maWcgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9NYWtl
ZmlsZSAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNl
LmMgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYyAgICAgICAg
IHwgIDI3ICstLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyAgICAgICAgIHwgMjU0
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0u
aCAgICAgICAgIHwgIDMyICsrLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUu
YyAgIHwgIDQ2IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbV9wcmltZS5oICAg
fCAgMTMgLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfbW11LmMgICAgICAgICB8ICAgMSAt
CiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5jICAgICAgfCAxMTkgLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmggICAgICB8ICAzNSAtLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfdm0uYyAgICAgICAgICB8ICA4NyArKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0v
djNkL3YzZF9nZW0uYyAgICAgICAgICAgfCAgNDkgKy0tLS0KIGluY2x1ZGUvZHJtL2RybV9nZW0u
aCAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogMTcgZmlsZXMgY2hhbmdlZCwgMjM5IGluc2Vy
dGlvbnMoKyksIDUwNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vbGltYS9saW1hX2dlbV9wcmltZS5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuaAogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vbGltYS9saW1hX29iamVjdC5oCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
