Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2C357DD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0C8967B;
	Wed,  5 Jun 2019 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D71892AA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 20so11881775pgr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrkvpzIdMBYR+6B1XOi5qDamesEvOXiYhYzlfg/ShYA=;
 b=dv6qSrhkXcR3wqhWLuK6oD7Tt3QWsL4u+SRo09gfOJLkNKUpt0Svmch01WtiA+xaqO
 /MB64jiPo1lsMlUSh0iCEL21ywFo9zghIH+li/MM9a5IyV937dq07cqWUf2Pu5EVfTEG
 ThkasRwNAIobahxkcjnrew/VbDElCMht/kQJHnCAkd43HeveVJsvMbYacwH6n+w304Bm
 zmd9peaeX06L3Agdn1n723M0dPQudChDHnQgvrb3STWsD8FcUkTz4YCKYdE9dH6sCvHy
 BdolAxlAnsspKgJdDhbehnimxZ9M03zO7AlJdlhBGQuY7C6AnVAtQaFf1WoxEKfbn/c3
 SR0A==
X-Gm-Message-State: APjAAAUp22BA4GMNpLvIVjNARUdzOAJvHfxR6Ek4twXZ5Wo3Eflu3Fw/
 Z1K/dBdBYDh9C/09erXSO5yYaphuWQY=
X-Google-Smtp-Source: APXvYqw+xZC+7hjXfGk20eLYBK8EepIKcBqrCE4j8N3tZILC9uyzNyadULeyQv+RW/cmUlTSO7NPbw==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr2428121pgm.10.1559718344605; 
 Wed, 05 Jun 2019 00:05:44 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:43 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 14/15] drm/bridge: tc358767: Drop unnecessary 8 byte buffer
Date: Wed,  5 Jun 2019 00:05:06 -0700
Message-Id: <20190605070507.11417-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrkvpzIdMBYR+6B1XOi5qDamesEvOXiYhYzlfg/ShYA=;
 b=cEQU5N1uQTnf8WgA53Bsfw4aItgE0b7ohuBZXIsACGEzWjpuZOA5nXhdaE12lTADC0
 nFtadpYhSPGFC61TAqneAppwg7sTOPYLwBuKHiV5mqs9Lr3LxXf5EkN/0OHAf4MMlROP
 hZPX/I50VIJVyuxT9PhVStp1EQRwc1YXciLzlcbRcejHKp3m6vVBAq7cLLzfU5GZkXg+
 QicBleD9b18ww0oIO6S/xb5zW0jELkZa/YZhcKDYOFTarQnFP8F4chPj4vo3+iBCl8vt
 ycPPgbRgLI/s7KdZRiNaat80Z2i4Hu/m0x3kTu7KkdMcsE2gaG5R9FyyxFFOXroLDxgC
 m8aw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNfZ2V0X2Rpc3BsYXlfcHJvcHMoKSBuZXZlciByZWFkcyBtb3JlIHRoYW4gYSBieXRlIHZpYSBB
VVgsIHNvCnRoZXJlJ3Mgbm8gbmVlZCB0byByZXNlcnZlIDggZm9yIHRoYXQgcHVycG9zZS4gTm8g
ZnVuY3Rpb24gY2hhbmdlCmludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3Yg
PGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29k
ZWF1cm9yYS5vcmc+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzog
TGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292
IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVy
bz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmlu
ZGV4IDRmZTc2NDFmODRlZS4uNDFhOTc2ZGZmMTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCkBAIC02ODAsOCArNjgwLDcgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1
Y3QgdGNfZGF0YSAqdGMpCiBzdGF0aWMgaW50IHRjX2dldF9kaXNwbGF5X3Byb3BzKHN0cnVjdCB0
Y19kYXRhICp0YykKIHsKIAlpbnQgcmV0OwotCS8qIHRlbXAgYnVmZmVyICovCi0JdTggdG1wWzhd
OworCXU4IHJlZzsKIAogCS8qIFJlYWQgRFAgUnggTGluayBDYXBhYmlsaXR5ICovCiAJcmV0ID0g
ZHJtX2RwX2xpbmtfcHJvYmUoJnRjLT5hdXgsICZ0Yy0+bGluay5iYXNlKTsKQEAgLTY5NywyMSAr
Njk2LDIxIEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoc3RydWN0IHRjX2RhdGEg
KnRjKQogCQl0Yy0+bGluay5iYXNlLm51bV9sYW5lcyA9IDI7CiAJfQogCi0JcmV0ID0gZHJtX2Rw
X2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX01BWF9ET1dOU1BSRUFELCB0bXApOworCXJldCA9IGRy
bV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9NQVhfRE9XTlNQUkVBRCwgJnJlZyk7CiAJaWYg
KHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5zcHJlYWQgPSB0bXBb
MF0gJiBEUF9NQVhfRE9XTlNQUkVBRF8wXzU7CisJdGMtPmxpbmsuc3ByZWFkID0gcmVnICYgRFBf
TUFYX0RPV05TUFJFQURfMF81OwogCi0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgs
IERQX01BSU5fTElOS19DSEFOTkVMX0NPRElORywgdG1wKTsKKwlyZXQgPSBkcm1fZHBfZHBjZF9y
ZWFkYigmdGMtPmF1eCwgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HLCAmcmVnKTsKIAlpZiAo
cmV0IDwgMCkKIAkJZ290byBlcnJfZHBjZF9yZWFkOwogCiAJdGMtPmxpbmsuc2NyYW1ibGVyX2Rp
cyA9IGZhbHNlOwogCS8qIHJlYWQgYXNzciAqLwotCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0
Yy0+YXV4LCBEUF9FRFBfQ09ORklHVVJBVElPTl9TRVQsIHRtcCk7CisJcmV0ID0gZHJtX2RwX2Rw
Y2RfcmVhZGIoJnRjLT5hdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwgJnJlZyk7CiAJaWYg
KHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5hc3NyID0gdG1wWzBd
ICYgRFBfQUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9FTkFCTEU7CisJdGMtPmxpbmsuYXNzciA9
IHJlZyAmIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFOwogCiAJZGV2X2RiZyh0
Yy0+ZGV2LCAiRFBDRCByZXY6ICVkLiVkLCByYXRlOiAlcywgbGFuZXM6ICVkLCBmcmFtaW5nOiAl
c1xuIiwKIAkJdGMtPmxpbmsuYmFzZS5yZXZpc2lvbiA+PiA0LCB0Yy0+bGluay5iYXNlLnJldmlz
aW9uICYgMHgwZiwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
