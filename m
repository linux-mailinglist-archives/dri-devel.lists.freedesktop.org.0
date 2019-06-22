Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE44F59C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 14:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5A26E96B;
	Sat, 22 Jun 2019 12:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A3689590;
 Sat, 22 Jun 2019 12:12:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 131so8335351ljf.4;
 Sat, 22 Jun 2019 05:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=a/TuWqneVz9sQ3lzjiEmzAMcNwIxCEDhv3/M4OHDBvQ=;
 b=hfwk0HTxIOqof5CL9HPUdJKwxVcKUToA+e377YmmSy0DrPrvv5h6C1VCQuVfJEENBW
 VdYk8CTJ/FE9PBO/tbdbqnUjz7jDBNS7aJN3M2AzrxrjAk+nm38Q6vK7DitYpWeXIwjm
 n5Ts+Qd5YAm0TzNyjiPiXThpqnirSSvrxjNmG4uhh9ra3PdgtqHi7XuJtC+2KKbnYYBc
 6y6Xk8fU4T8x1tdVrAx7PYv/0vAIeqATQrJHq9eZQp4nBiHKAQzrWRFkqaKY2e87XSPS
 bbeI0+z3biyBKXk+a4cB9ersX/tOhXI9WtuZ+dwBWbQ1QS8zBI6egczD/TMhBMHLQiVk
 Z7Qg==
X-Gm-Message-State: APjAAAWuW5sfPudhZlsaYiXwFKGcj9UjPwt8SuZeuh+CC4bzPT5aEoEY
 L10n+ZtW5AGUwSV6ZJ/JYten5FN80b4IyQ==
X-Google-Smtp-Source: APXvYqxh23ZfIPf5yPhS6P2jzopsUlwV6Ds60eLrZqEcOPK4gbNQ7j0L2hUJ54WP2ngHVYVJKux0Xg==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr6899492ljs.54.1561205523394; 
 Sat, 22 Jun 2019 05:12:03 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k4sm816910ljg.59.2019.06.22.05.12.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 05:12:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] drm: drop uapi dependencies from include/drm
Date: Sat, 22 Jun 2019 14:11:54 +0200
Message-Id: <20190622121156.17217-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/TuWqneVz9sQ3lzjiEmzAMcNwIxCEDhv3/M4OHDBvQ=;
 b=htTd/GxSUA1JSDdppR2sdw33Xs4aB9F0PRhTiXMAsHFdqoYYgY3ffn2XskqDgmFARU
 UiuykU3uogXAUrAsTYtPU8iU0cDCiPEy4FOkk7TCfaGxIBEkb4i9y6ZDsHiBScT3Eyn3
 goM2Pzy/V4XErTqzV9xFP1XG4tw1XzIjXPsFn0o8D6v2IhOBHBfSd2Svf/7IZB/vD9uO
 yq+fMktjqDL28xB+6sutC7mOCi5+h7ojhbhj7oWJL27V+Pp5HShyT/3FmwI2CFhqkwGC
 i50Ls9zLSrMT8MzUfrxAok5EuJg6GyRL4fWgueXZ8O/9qZ83VQ9uM+Dl5w0Vh/u504aJ
 Pqxg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aW5jbHVkZS9kcm0vKiBzaGFsbCBoYXZlIG5vIG9yIGF0IGxlYXN0IG1pbmltYWwgZGVwZW5kZW5j
aWVzCnRvIGluY2x1ZGUvdWFwaS9kcm0vKi4KRm9sbG93aW5nIHR3byBwYXRjaGVzIGRvIGEgc21h
bGwgZWZmb3J0IHRvIGRyb3Agc3VjaCBkZXBlbmRlbmNpZXMuCgpBZnRlciB0aGVzZSBwYXRjaGVz
IHRoZXJlIGFyZSB0d28gdXNlcnMKb2YgdWFwaS9kcm0vZHJtLmggbGVmdCBpbiBpbmNsdWRlL2Ry
bToKCmRybV9maWxlLmg6Ci0gbmVlZHMgZHJtX21hZ2ljX3QKICBkcm1fbWFnaWNfdCBpcyBhIHNp
bXBsZSB0eXBlZGVmLCBhIHNpbXBsZSB1bnNpZ25lZCBpbnQgd291bGQgZG8gdGhlIHRyaWNrCgpk
cm1fbGVnYWN5LmgKLSBuZWVkcyBkcm1fbWFwX3R5cGUgYW5kIGRybV9tYXBfZmxhZ3MuIFNlZW1z
IGxlZ2l0LgoKSSBkaWQgbm90IHNwZW5kIHRpbWUgdG8gYW5hbHl6ZSBmdXJ0aGVyIGRlcGVuZGVu
Y2llcy4KClBhdGNoZXMgYXJlIGJ1aWxkIHRlc3RlZC4KCglTYW0KClNhbSBSYXZuYm9yZyAoMik6
CiAgICAgIGRybTogZHJvcCB1YXBpIGRlcGVuZGVuY3kgZnJvbSBkcm1fcHJpbnQuaAogICAgICBk
cm06IGRyb3AgdWFwaSBkZXBlbmRlbmN5IGZyb20gZHJtX3ZibGFuay5oCgogaW5jbHVkZS9kcm0v
ZHJtX3ByaW50LmggIHwgNCArLS0tCiBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggfCAxIC0KIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
