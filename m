Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B24B2D7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775436E2EC;
	Wed, 19 Jun 2019 07:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70FA6E293
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:52 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so9028380pfl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1kqfNfq2UBNDicaf5X51z/Q4e+iOBdOxSEncrwbn1+g=;
 b=Y4kRO05RMrOWnohOJF9z5MOFoedzCjEzi5tGevzY8zZ7l3wfd8vT5rk7PSWh2gVT8P
 C3O4gqG6dKNwpVgjRR8t0UK3jPIfTUXywmADlFlCnUT3JybTHB/1tkwnclVqITEzY81A
 DUpUkjHcc9HfxdJb7u7mQhceprB0+ZGPNFtv8hcLeTDlOD4EiCobn7clWDkv/ycxHaBD
 L/pLYTPlVqyqxCoMLorAUjW3mL1inawO8omRh5fhxT/0fsXXF5OPTqXlD9cYwHgEjLUB
 VI8ktqzJjkkC5QdrSuHlb7gCpJBUFuxqVTO5OLYTKjX6icRGPBrdmLbHE+UiDV3vhBPG
 c4pQ==
X-Gm-Message-State: APjAAAVFFC6r6aDRz5gHhtzgrlFcE36d+OkeijeQQHX0xP2tawz/hL9I
 Jlg152mGHvWoXVtZRkS9H1UR+OedjN4=
X-Google-Smtp-Source: APXvYqzriyZXGK0wY5cBfBCHFDASRS5djuRj1Oe3WfuNFONcc9OeF9VJ2Cz2byzINYz71aJ1lkXkWw==
X-Received: by 2002:a62:28b:: with SMTP id 133mr1226137pfc.251.1560922071770; 
 Tue, 18 Jun 2019 22:27:51 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:51 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 13/15] drm/bridge: tc358767: Drop unnecessary 8 byte buffer
Date: Tue, 18 Jun 2019 22:27:14 -0700
Message-Id: <20190619052716.16831-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1kqfNfq2UBNDicaf5X51z/Q4e+iOBdOxSEncrwbn1+g=;
 b=VKnkGBzwHQed1BokAjAHwbkD/TQscY7KgmLWz4WdOquEFfqFRAZMniBRgtbwAGhdCZ
 CWEPO8uqUbasup+P9Un0t7HUaoDCoAqyb7iGAUnlARMggtNed+AzAombOeiZS0J/ZV5C
 IMWe3vhqlOvDoNU7ugT2zAnE5JR93SzAlkEqDuHL3grfWAg9Jt/zEG50YpJuJjpBgNUo
 dpgh3dZpBHZaT9CvzHUQzydshxWMwsCnjUzrrgIA7hCDxVChUnZFT0xcc1D8Zm/u/RCz
 SgS1TFbGHqq2waIaDKgFAS79RyMfBCwTbEBA4ibAuYCr/npcF2zEnZFyxH4wlrJUuGdE
 wS4w==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
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
PGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBH
dXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6
aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0
YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCmluZGV4IDdjYzI2ZTI2ZjM3MS4uZjBiYWY2ZDdjYTgwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCkBAIC02NDUsOCArNjQ1LDcgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1
cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiBzdGF0aWMgaW50IHRjX2dldF9kaXNwbGF5X3Byb3BzKHN0
cnVjdCB0Y19kYXRhICp0YykKIHsKIAlpbnQgcmV0OwotCS8qIHRlbXAgYnVmZmVyICovCi0JdTgg
dG1wWzhdOworCXU4IHJlZzsKIAogCS8qIFJlYWQgRFAgUnggTGluayBDYXBhYmlsaXR5ICovCiAJ
cmV0ID0gZHJtX2RwX2xpbmtfcHJvYmUoJnRjLT5hdXgsICZ0Yy0+bGluay5iYXNlKTsKQEAgLTY2
MiwyMSArNjYxLDIxIEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoc3RydWN0IHRj
X2RhdGEgKnRjKQogCQl0Yy0+bGluay5iYXNlLm51bV9sYW5lcyA9IDI7CiAJfQogCi0JcmV0ID0g
ZHJtX2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX01BWF9ET1dOU1BSRUFELCB0bXApOworCXJl
dCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9NQVhfRE9XTlNQUkVBRCwgJnJlZyk7
CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5zcHJlYWQg
PSB0bXBbMF0gJiBEUF9NQVhfRE9XTlNQUkVBRF8wXzU7CisJdGMtPmxpbmsuc3ByZWFkID0gcmVn
ICYgRFBfTUFYX0RPV05TUFJFQURfMF81OwogCi0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIoJnRj
LT5hdXgsIERQX01BSU5fTElOS19DSEFOTkVMX0NPRElORywgdG1wKTsKKwlyZXQgPSBkcm1fZHBf
ZHBjZF9yZWFkYigmdGMtPmF1eCwgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HLCAmcmVnKTsK
IAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZHBjZF9yZWFkOwogCiAJdGMtPmxpbmsuc2NyYW1i
bGVyX2RpcyA9IGZhbHNlOwogCS8qIHJlYWQgYXNzciAqLwotCXJldCA9IGRybV9kcF9kcGNkX3Jl
YWRiKCZ0Yy0+YXV4LCBEUF9FRFBfQ09ORklHVVJBVElPTl9TRVQsIHRtcCk7CisJcmV0ID0gZHJt
X2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwgJnJlZyk7
CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5hc3NyID0g
dG1wWzBdICYgRFBfQUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9FTkFCTEU7CisJdGMtPmxpbmsu
YXNzciA9IHJlZyAmIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFOwogCiAJZGV2
X2RiZyh0Yy0+ZGV2LCAiRFBDRCByZXY6ICVkLiVkLCByYXRlOiAlcywgbGFuZXM6ICVkLCBmcmFt
aW5nOiAlc1xuIiwKIAkJdGMtPmxpbmsuYmFzZS5yZXZpc2lvbiA+PiA0LCB0Yy0+bGluay5iYXNl
LnJldmlzaW9uICYgMHgwZiwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
