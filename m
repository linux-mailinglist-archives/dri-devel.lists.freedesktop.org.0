Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128835AEEE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD386E9DA;
	Sun, 30 Jun 2019 06:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690536E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x144so6585404lfa.9
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NRQqH8KKPivwbK1JiqlDpdz8EUe27AJRtHUa7fDbA5g=;
 b=lfvr8O+I3UqwCJnfVxv+TYFH3dyNrtRsLXW652tg563PFsETrNy05/lf49yStlgHva
 MaOZ2PqZHFH1Ak3lswUElb7RuvTruNxxkU3rNHGFbPXCfMLy4jD87z7Av6vMXEUPJ3yZ
 wDWoPGeLmXB9zmyaITjIQFgxEj9JqYpKBmitWkso2y2wC/zAPA4B76WjUE7aiM0AiIT4
 MZtwUckQ+dE4OidCSyUWtyCyW6t59nbGq7VRBPZw56LxbdeZX0wC5B1wcqleBQ33DxQp
 IwJyTmn+x7yAgQadsFUB9ja0L/Tw2Efl5NPr3HdF0O7Wze88YmCLAcDpPOP51FqbYlYe
 ZoDA==
X-Gm-Message-State: APjAAAVOq0du6S43cpuU+PL7nfX+yWJUmnxXzwb3RnFbBEbnFXPk8gWb
 aTqiviQv00XqrrSsyJySlSXLV/c6oHOLVg==
X-Google-Smtp-Source: APXvYqwYkUyG4LBVcXZ9u45Iylkg7KMjH992e8iWGnYyXFZUK7nYLKeM7PuDsTESYAjR52lDQ/bzNw==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr8825007lft.79.1561875592199;
 Sat, 29 Jun 2019 23:19:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 24/33] drm/i2c/sil164: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:13 +0200
Message-Id: <20190630061922.7254-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRQqH8KKPivwbK1JiqlDpdz8EUe27AJRtHUa7fDbA5g=;
 b=HZ8+EWA96aI61r8BZjUIgsaowhCr0AiTZy8SlTXjvO8Cu1bUsAO5xHvQAMB3E488aS
 ULIcS2uJ1oxC9q253HFfZF7nVOyNvwODJG3/16jMlSYd/rckjlaHPRucdM479BGqq80B
 5tLdU67HFKdTsni9OV8YN6Xep3omfqeVJnyucEGrqSrPmoby+j3vgcxdvR0h72zGYf0N
 FoNtcfHEYqiPOgtmWMb5oJQe6gObuOvaUqoBytYpuUQaka7F531VlxGRficon1HhHPc8
 lIcLRnhdNgPSs+rtzUL+8gh5+W8gSu1hQ2PVPa/f5xFpDym5/QSMPYLGGqsciT63PFHQ
 mM0w==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPgpDYzogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KQ2M6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwotLS0KVGhlIGxpc3Qgb2YgY2M6IHdhcyB0b28gbGFyZ2UgdG8gYWRk
IGFsbCByZWNpcGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIuClBsZWFzZSBmaW5kIGNvdmVyIGxl
dHRlciBoZXJlOgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2
ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sClNlYXJjaCBmb3IgImRybTogZHJvcCB1c2Ugb2YgZHJt
cC5oIGluIGRybS1taXNjIgoKICAgICAgICBTYW0KCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3NpbDE2
NF9kcnYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2kyYy9zaWwxNjRfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTJjL3NpbDE2NF9kcnYuYwppbmRleCA4NzhiYThkMDZjZTIuLjhiY2Yw
ZDE5OTE0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2kyYy9zaWwxNjRfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2kyYy9zaWwxNjRfZHJ2LmMKQEAgLTI2LDggKzI2LDkgQEAKIAog
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlcl9zbGF2ZS5oPgor
I2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBl
ci5oPgogI2luY2x1ZGUgPGRybS9pMmMvc2lsMTY0Lmg+CiAKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
