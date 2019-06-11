Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096A3C13F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 04:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65289130;
	Tue, 11 Jun 2019 02:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFB5890EA;
 Tue, 11 Jun 2019 02:32:50 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x2so11893780qtr.0;
 Mon, 10 Jun 2019 19:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wRV0kBqdILRCqeHSeK97VSmtYfGbD9edblmCbM1qxm0=;
 b=T/7+8NU2PTnfK5erxEOlIl/ystfHCmyjMmL2bbcdwsiws8vydrtbcKIwTDT1qBbGtZ
 wLQVQXSzDstg8CnDpf5cEayN/+a2xpN/qm4Ka0/dCrgAgs6HPET5V2zPwwaj7NuYy4iT
 Ji70qGiH1TFS0K77bkjOxCF1f0cu8m6dxodnLg7zoJEHvQ3BgqoaeDCy5vLOz0bwlyxV
 NlEo61hjTEhbg2QsO1MIgDQvsdUcT+sYu84oTj9tRirkJn10QgIHKF7MeCiB98RWesZr
 /AkLdBtAeUyTn49jdVJQFdAHHhBP4vDQMXC7YsDUNuIFHI/JEu8naAYUKBfcpGXj6C0t
 dQxQ==
X-Gm-Message-State: APjAAAU8z7cQ0EmnVgwqgGW54CgKFZaNutIZE52/LKIvSZQ8qv0/13yv
 Loa6zlkXTOa0WYPZghQ/FC5a5S4PG4s=
X-Google-Smtp-Source: APXvYqxS+bCVBAoKLTWOpdDHiiLe4HHk/FsGNjdKGHmQNzJd+JatWw8zJYNEZGMq3mUMPZ2/OT8chg==
X-Received: by 2002:ac8:2318:: with SMTP id a24mr60568616qta.60.1560220369327; 
 Mon, 10 Jun 2019 19:32:49 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id h26sm3523543qta.58.2019.06.10.19.32.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 19:32:48 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: enable modern color management
 properties
Date: Mon, 10 Jun 2019 22:32:45 -0400
Message-Id: <20190611023245.13625-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611023245.13625-1-imirkin@alum.mit.edu>
References: <20190611023245.13625-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRV0kBqdILRCqeHSeK97VSmtYfGbD9edblmCbM1qxm0=;
 b=bfp9bAQfZX8XOrappUTSsVW3NqNcfAmHXKUKE5nAnpFOHLkoH7bWkTznWiWLeJqGra
 euAJgrjOCPmCexx8S7QWQ2VZ7EcWSt9d16wRprqFd35YAWv1PKrt2ZYemY/F23o1FugN
 1sQJ7T9SeSkRncgU6Hxcg8epzMtTLew5Jw/a8YAONPMe/LyEUM6rlwN/VkBJTKmYZowH
 vxLUrq4O4r3wMYWxUhvDlaaUSJlDiOOknGoRt5S+oo79SyHz3DsHylQ/UEjYrRBcu6iU
 VDj1RlgFSONEI6+PmWIgp8NIxj7I/0oh6jvSfpyfSkwIXrWa9oBNILYdo3VMv0jbOACB
 L+9g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIEdGMTE5OkdWMTAwLCB3ZSBjYW4gZW5hYmxlIERFR0FNTUEvQ1RNL0dBTU1BLiBGb3IgZWFy
bGllciBHUFVzLCBhcwp0aGVyZSBpcyBubyBDVE0sIGhhdmluZyBib3RoIGRlZ2FtbWEgYW5kIGdh
bW1hIGlzIGEgYml0IHBvaW50bGVzcy4gTGF0ZXIKR1BVcyBjdXJyZW50bHkgbGFjayBhbiBpbXBs
ZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMgfCA1ICsr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvaGVhZC5jCmluZGV4IDA2ZWUyMzgyM2E2OC4uZjQyYWE3OWYyZjQwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5jCkBAIC00OTksNiArNDk5LDExIEBA
IG52NTBfaGVhZF9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGluZGV4KQogCQkJ
CSAgJm52NTBfaGVhZF9mdW5jLCAiaGVhZC0lZCIsIGhlYWQtPmJhc2UuaW5kZXgpOwogCWRybV9j
cnRjX2hlbHBlcl9hZGQoY3J0YywgJm52NTBfaGVhZF9oZWxwKTsKIAlkcm1fbW9kZV9jcnRjX3Nl
dF9nYW1tYV9zaXplKGNydGMsIDI1Nik7CisJaWYgKGRpc3AtPmRpc3AtPm9iamVjdC5vY2xhc3Mg
Pj0gR0YxMTBfRElTUCAmJgorCSAgICBkaXNwLT5kaXNwLT5vYmplY3Qub2NsYXNzIDwgR1YxMDBf
RElTUCkKKwkJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMjU2LCB0cnVlLCAyNTYp
OworCWVsc2UKKwkJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgZmFsc2UsIDI1
Nik7CiAKIAlpZiAoaGVhZC0+ZnVuYy0+b2x1dF9zZXQpIHsKIAkJcmV0ID0gbnY1MF9sdXRfaW5p
dChkaXNwLCAmZHJtLT5jbGllbnQubW11LCAmaGVhZC0+b2x1dCk7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
