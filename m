Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF210323A8
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D4F89701;
	Sun,  2 Jun 2019 15:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C0D8999C;
 Sun,  2 Jun 2019 14:13:31 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id v9so6714455pgr.13;
 Sun, 02 Jun 2019 07:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SaAxieWedSqrCsn1eZtk8frpM0Ozx5cj9+gtVFSLioA=;
 b=rleMx1S68vn1CN4mEWWdclWrBwB76QDboSHH4biTsI1P6QNB9cIydDslLnvjN0Jeqj
 VaVE88ei9A2htbciciweuNqEHF/ZSSGaWFAqv3XCleRAA1dXfNODPpdq6KBELtogRRMA
 hW0uxlUr09M+x8D4EnZdqRCdHWab9OSV1EYaIagvcj0Fkk1vYE5aQhYf0bmI4xCAbEbm
 vUkYAaHA/+v4tsWVqgTt+WSReXLP8ZFrTf3l72omaZnhrYWA3VbVu2O7GnhD1AC7BeHS
 JGorkzM99PKy6He+E5fGhct8wMXe9/RAffI6g8ED97amw84u0Zwj03z+2xgRZD107cW8
 i8VA==
X-Gm-Message-State: APjAAAWyOHbjOX2US0tfI+Lm2jU8FPKTJaGRnK8pCyFqSh4dV3eJKsid
 4IKc0yY4P4izo4gz2oM4lm8=
X-Google-Smtp-Source: APXvYqwpOneLZKkuOl7f486zM64Y/OQvcykbdFN1AY/pSfx4mQUe+lKV76ssomb8gqFClbHS4hrnNw==
X-Received: by 2002:a17:90a:a608:: with SMTP id
 c8mr22499038pjq.37.1559484811356; 
 Sun, 02 Jun 2019 07:13:31 -0700 (PDT)
Received: from localhost.localdomain
 (119-18-21-111.771215.syd.nbn.aussiebb.net. [119.18.21.111])
 by smtp.gmail.com with ESMTPSA id x66sm12533278pfx.139.2019.06.02.07.13.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 07:13:30 -0700 (PDT)
From: Rhys Kidd <rhyskidd@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 0/2] drm/nouveau/bios/init: Improve pre-PMU devinit opcode
 coverage
Date: Mon,  3 Jun 2019 00:13:13 +1000
Message-Id: <20190602141315.6197-1-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SaAxieWedSqrCsn1eZtk8frpM0Ozx5cj9+gtVFSLioA=;
 b=ci5MFymqmwyE1FbHvEUfTWoN9KfK0OOI8NC4x1fak7yQ+UO43KiT5st644PeuhVHSR
 RnM5tB9j97yPVNtOAWf8Wd0gRoHtOuZirqjmcAWexxhFIlVbLAEAgMqJlH3RfUrbSxbe
 fKwUpyDq8w1UkKUJkqMLT70YFv+sonJx8y3O53sQgJTpH4t1j53mN6pXq9vGPNohEU2l
 AS9J8HkBwPAGhe1hu6VpdwEkz3OPvSHiYhIAiyn7CX0CHHv+jXkBP77TsVSpHePYFK6t
 OvGHIr3m7lcg8amxRuXA3TXkqqxdIBsmn+7uBlaFvMPX5bWLbIFi9YgHU3ddP6j+FfD3
 DDXA==
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
Cc: Rhys Kidd <rhyskidd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TlZJRElBIEdQVXMgaW5jbHVkZSBhIGNvbW1vbiBzY3JpcHRpbmcgbGFuZ3VhZ2UgKGRldmluaXQp
IHRoYXQgY2FuIGJlCmludGVycHJldGVkIGJ5IGEgbnVtYmVyIG9mICJlbmdpbmVzIiwgZS5nLiB3
aXRoaW4gYSBrZXJuZWwtbW9kZSBzb2Z0d2FyZQpkcml2ZXIsIHRoZSBWR0EgQklPUyBvciBhbiBv
bi1ib2FyZCBzbWFsbCBtaWNyb2NvbnRyb2xsZXIgd2hpY2ggcHJvdmlkZXMKY2VydGFpbiBzZWN1
cml0eSBhc3NlcnRpb25zICh0aGUgJ1BNVScpLgoKVGhpcyBzeXN0ZW0gYWxsb3dzIGEgR1BVIHBy
b2dyYW1taW5nIHNlcXVlbmNlIHRvIGJlIHNoYXJlZCBieSBtdWx0aXBsZQplbnRpdGllcyB0aGF0
IHdvdWxkIG5vdCBvdGhlcndpc2UgYmUgYWJsZSB0byBleGVjdXRlIGNvbW1vbiBjb2RlLgoKVGhp
cyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIG5vdXZlYXUgZm9yIHR3byBvcGNvZGVzIHNlZW4gb24g
VkJJT1NlcyBwcmlvcgp0byB0aGUgbG9ja2VkLWRvd24gUE1VIHRha2luZyBvdmVyIHJlc3BvbnNp
YmlsaXR5IGZvciBleGVjdXRpbmcgZGV2aW5pdApzY3JpcHRzLgoKRG9jdW1lbnRhdGlvbiBmb3Ig
dGhlc2UgdHdvIG9wY29kZXMgY2FuIGJlIGZvdW5kIGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20v
ZW52eXRvb2xzL2Vudnl0b29scy9wdWxsLzE4OQoKUmh5cyBLaWRkICgyKToKICBkcm0vbm91dmVh
dS9iaW9zL2luaXQ6IGhhbmRsZSBJTklUX1JFU0VUX0JFR1VOIGRldmluaXQgb3Bjb2RlCiAgZHJt
L25vdXZlYXUvYmlvcy9pbml0OiBoYW5kbGUgSU5JVF9SRVNFVF9FTkQgZGV2aW5pdCBvcGNvZGUK
CiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jICAgfCAyNiArKysr
KysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
