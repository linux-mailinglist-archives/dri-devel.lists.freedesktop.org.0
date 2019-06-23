Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71A4FB1C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 12:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6189AA6;
	Sun, 23 Jun 2019 10:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F7289A98
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:35:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so9868921ljg.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 03:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RAEetxJ9Fewtdu2t5lrNS5e3FQRoR74iEtAfjYK3acc=;
 b=L1+Z1nu7l3CmQGRJOxXcZ8sIwheAl1RkgIaPKe25ug2LJmNlf4COMffoMpz3jq4L2N
 z17URutAFY2vqa4IyeL33TMQd5tDnd9yxmZud+LcnC3X4Omd2n92A0MoTaOIHZ8StG6U
 z7JFP0VzkpRVWe9eJ5o2iwQK9m3rh5kfUwF/MA5HCHkCtbI4Lg10uVhEkhIQ3QKB0XnE
 rDUjJTLBNnNoKU7bxZkDeI6jGMj+mu0QQFreB0Z/oExagAbgHl6j+pYXypqmNVPz/6hM
 XUjmqCbcF7XCOzRqD4JM4EVLDsldM44MuJbBGf28GWKgblJKbEfaSglcCJrCQCtcSUOW
 dE4w==
X-Gm-Message-State: APjAAAWF9x2/Ezug19ZyOCDiJdp3VCxEUn0qNdzzOe0py5aDEOWi/aZu
 33ZFY3Dp5t5WKDkeQ0KdZPlljDX/Y8O6Zg==
X-Google-Smtp-Source: APXvYqwBUudtbkhQu7g/0EYdecpBoJIi0uFgmBz7c/9f0RcOgowkZ/2raycX8Mns8xV+St97eN6/cg==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr49758348ljj.144.1561286153810; 
 Sun, 23 Jun 2019 03:35:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 x22sm1124248lfq.20.2019.06.23.03.35.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:35:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/mga: make header file self contained
Date: Sun, 23 Jun 2019 12:35:40 +0200
Message-Id: <20190623103542.30697-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190623103542.30697-1-sam@ravnborg.org>
References: <20190623103542.30697-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAEetxJ9Fewtdu2t5lrNS5e3FQRoR74iEtAfjYK3acc=;
 b=OH9k9ypTpWY8O2prEdiij/hre++IrHvhl7Rv/In8cLR3OabwcmIL+8dQwMiERHMu6c
 i4/JHSUGYSieP/3bB2+8RpMlR+FWMI+xjil+gyOGcr4/VsJ5QqjK+jXCaL45OWYxtpTJ
 ocQs53GGWpvkbxyAbrMswCFq5Z4xKAgxMwurb6E2SfDGjMobrNL7oPmMUPYuwM4DKb+U
 xsIg+Nri0KWpo2jYuqFAwNk8sZejiX77Iw5KEOvOsczGI2mpL6kR96RJnZ6juKBw7RrJ
 XTZ3TdTQMrqmpTDGgr1QDpvib2a1OIim9yGopwAbgXMzZUJN3ZYZN4TPTVTt5joabrIs
 CSwA==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBtaWdyYXRpb24gYXdheSBmcm9tIGRybVAuaCBzaW1wbGUKYXMgd2UgZG8gbm90
IG5lZWQgdG8gZHVwbGljYXRlIGRlcGVuZGVuY2llcyByZXF1aXJlZCBieSBtZ2FfZHJ2LmgKClNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5oIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWdhL21nYV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5oCmluZGV4IDE3NjZj
MTk1YjM5Ny4uZDVkZWVjYjkzOTc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21n
YV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuaApAQCAtMzEsNyArMzEs
MjAgQEAKICNpZm5kZWYgX19NR0FfRFJWX0hfXwogI2RlZmluZSBfX01HQV9EUlZfSF9fCiAKKyNp
bmNsdWRlIDxsaW51eC9pcnFyZXR1cm4uaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKKyNp
bmNsdWRlIDxkcm0vZHJtX2FncHN1cHBvcnQuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5o
PgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4K
KyNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPgogI2luY2x1ZGUgPGRybS9kcm1fbGVnYWN5Lmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9zYXJlYS5oPgorI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CisjaW5j
bHVkZSA8ZHJtL21nYV9kcm0uaD4KIAogLyogR2VuZXJhbCBjdXN0b21pemF0aW9uOgogICovCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
