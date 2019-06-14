Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B8474F4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BCF891CD;
	Sun, 16 Jun 2019 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35328930A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 23:57:24 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s27so2395386pgl.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q98iyrGWjD0YwRuDYJj8GlFuZI5lhh67IlCxLlcXVmA=;
 b=pe2c1Z6Bl36MQejCmKmUu1h4RlGL832VjJjOb6VFRpLopivUes0RFIWkZm4C7pVKnf
 AWP2HIq/G0VBl5ovSJFoBsEaQ0c2Rqzv6rGzG1/9UFnjIGrm2DAHLtxUYIfve/SuMaDU
 m/B7gb8uEIyfyqbVEDU8YbudDjalULJJzEJ0Os9b72XrdwJiWWzBILVRqPpnRMBO9Xva
 Lt3Jo73XskOdPhST/h5m6uqJgr6TpHsohsJEAJ+EK/YaCYMvDNelra0RjaGToUHPLP8w
 5mb2xK/tTJ16JOLazlbUDXihisJA8cWQtwIUg9idhHe6zaKJx/JRnUgXmbyZtDvkT4f8
 z8IQ==
X-Gm-Message-State: APjAAAUQZnP8hiAXR5052QSUlAaU+fXPsDO91duzwCqoRS0ATxRj0UUU
 D/7+XNwnnPxaExs7wpt5oYhOPr6fraVTHw==
X-Google-Smtp-Source: APXvYqxO5LbnNpF6nCUM1ozAuY8tYMdG9Okq6hVZoCa6Hp0axEd8QmubSP09VeQeaaXyZ4HpN9e32w==
X-Received: by 2002:a62:ee05:: with SMTP id e5mr99169656pfi.117.1560556644477; 
 Fri, 14 Jun 2019 16:57:24 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
 by smtp.gmail.com with ESMTPSA id z13sm3777831pfa.123.2019.06.14.16.57.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 16:57:23 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org
Subject: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Fri, 14 Jun 2019 16:57:19 -0700
Message-Id: <20190614235719.8134-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614203144.3850-2-joseph.kogut@gmail.com>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q98iyrGWjD0YwRuDYJj8GlFuZI5lhh67IlCxLlcXVmA=;
 b=az4+ReQKjM03dCR9+sthGLa8hV6BEVyYvuQMen+YsB1zbfPZOFNzYKf0GShH4ZCZS+
 P/UQ2GFUHlXbGsNrgtUtha8IXW6yFHeO8kYRq5l4M5Tf3VnsRhKP6t41roofEg183KwJ
 qcVI7Yy/HA05K+92MFGmlZ++5Ei8RYEH7xK5m8rR7k0JYd+OBiQb4gKw2teTgZhNG4gC
 d1JoH2zx9Se0ucEanJre1Xly3wEkE+654I4uDeGthvjNv3PsoI7DtjGzNUn28+Ca4fBW
 ymnKkrmJNHjOMHXuyzVMEh9mHo3eZusiyJd+JGS7RFwyFeGOgS9ayIUTlv2td2c8QwTR
 G2jg==
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1IG9uIE9kcm9pZCBYVTMgU29Dcy4KClNp
Z25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KLS0tCgpD
aGFuZ2VzIHYxIC0+IHYyOgotIFVzZSBpbnRlcnJ1cHQgbmFtZSBvcmRlcmluZyBmcm9tIGJpbmRp
bmcgZG9jCi0gU3BlY2lmeSBhIHNpbmdsZSBjbG9jayBmb3IgR1BVIG5vZGUKLSBBZGQgZ3B1IG9w
cCB0YWJsZQotIEZpeCB3YXJuaW5ncyBmcm9tIElSUV9UWVBFX05PTkUKCiAuLi4vYm9vdC9kdHMv
ZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kgfCAyNiArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKaW5kZXggOTNhNDhmMmRkYTQ5
Li5iOGE0MjQ2ZTNiMzcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjIt
b2Ryb2lkeHUzLWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjIt
b2Ryb2lkeHUzLWNvbW1vbi5kdHNpCkBAIC00OCw2ICs0OCwzMiBAQAogCQljb29saW5nLWxldmVs
cyA9IDwwIDEzMCAxNzAgMjMwPjsKIAl9OwoKKwlncHU6IGdwdUAxMTgwMDAwMCB7CisJCWNvbXBh
dGlibGUgPSAic2Ftc3VuZyxleHlub3MtbWFsaSIsICJhcm0sbWFsaS10NjI4IjsKKwkJcmVnID0g
PDB4MTE4MDAwMDAgMHg1MDAwPjsKKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxOSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPEdJQ19TUEkgNzQgIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJICAgICA8R0lDX1NQSSAxMTcgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWludGVycnVw
dC1uYW1lcyA9ICJqb2IiLCAibW11IiwgImdwdSI7CisJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0cz
RD47CisJCW1hbGktc3VwcGx5ID0gPCZidWNrNF9yZWc+OworCQlvcGVyYXRpbmctcG9pbnRzLXYy
ID0gPCZncHVfb3BwX3RhYmxlPjsKKwl9OworCisJZ3B1X29wcF90YWJsZTogZ3B1LW9wcC10YWJs
ZSB7CisJCWNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7CisKKwkJb3BwLTE3NzAw
MDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDExNzAwMDAwMD47CisJCQlvcHAtbWljcm92
b2x0ID0gPDgxMjUwMD47CisJCX07CisKKwkJb3BwLTYwMDAwMDAwMCB7CisJCQlvcHAtaHogPSAv
Yml0cy8gNjQgPDYwMDAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDExNTAwMDA+OworCQl9
OworCX07CisKIAl0aGVybWFsLXpvbmVzIHsKIAkJY3B1MF90aGVybWFsOiBjcHUwLXRoZXJtYWwg
ewogCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0bXVfY3B1MCAwPjsKLS0KMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
