Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C508E5AEF8
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52C66E9E0;
	Sun, 30 Jun 2019 06:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFB96E9CD
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:49 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v18so9805260ljh.6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RHGZucV2AQ7tre3WUECKcEuFlASZ2SedUl75/uBkYxc=;
 b=Wh8qPoRxAgav4ffRomqyP1VI3w4duZQwDZBE9HwjM5NXBLFnEg6+JfhmugNJQpUnHR
 4qBU8KsyjRdoa+uLZgy5Ozt0JhSbTfEGFNPplNUOvyQU3pSbepKSyUOgzxZ5WoM/s4aa
 J8Y2ECf+NeipsaJQwrt0iWNSG1OnNlkXNcTVl0WOJldbqEoL42Qq72un/kaeqT1jy4Ru
 MvWnLnHUOx0V1VTo+fOrOCcXXqF2xV16ry9paZrhDioBByq4OqrJWsVOnQZDLQVUV9gT
 zCrrCBVI6McgtW8nfJMLvU0Q3HlcCvsA7vImUuKwP5I3atHJg1fD633o8tMVkj/D33x0
 kIzQ==
X-Gm-Message-State: APjAAAWJZo2zHfPvQIEl2oP1AZbawppYtCrz7SMfevurLGzf//We65tR
 TuCGpZJfctLIvoswnL4kE33nkBkwDkrOtw==
X-Google-Smtp-Source: APXvYqx0kNKuVrFZxWlDN5eZDwiNmBNJvFM+BAfo5ifV7SsKBTyKqwX57KSodpkrh1RKhSHaadxlaw==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr9297932ljk.29.1561875587355;
 Sat, 29 Jun 2019 23:19:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 19/33] drm/tdfx: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:08 +0200
Message-Id: <20190630061922.7254-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHGZucV2AQ7tre3WUECKcEuFlASZ2SedUl75/uBkYxc=;
 b=EeJH/L04nWN92ikJj7YnyWvxnx8hlbJwdwbXk2RoQ8uWIXKfQOYY3LeywwzkOJXhH2
 FLuONCCaskAdBIHEdRNgiIvRMbW0g0TVC9rPvs9wydluF1kHSeb5h2WXch3xpS+fwsvw
 7orOenhpxz8Bk3bSGbXN9SNZgTHTAWLeknBdDT5+J4w1kpXYsp1IvamGl/pUwfJmYOYG
 NxM3UzQQTDAhjOnQj6c/av+3HfrD/64SOF6sQKzRMpFmHo/1guUkQ21+HBnsdnmBKaWH
 +zarhEYaDNAKze8g6rMOyV5TnvXmTwHxL7vFh2Z167mhNJIGJAX2blKK08cUjig72vE9
 12lg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBkcm1QLmggaW5jbHVkZSB3aXRoIG5lY2Vzc2FyeSBpbmNsdWRlIGZpbGVzLgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KVGhlIGxpc3Qgb2YgY2M6
IHdhcyB0b28gbGFyZ2UgdG8gYWRkIGFsbCByZWNpcGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIu
ClBsZWFzZSBmaW5kIGNvdmVyIGxldHRlciBoZXJlOgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sClNlYXJjaCBmb3Ig
ImRybTogZHJvcCB1c2Ugb2YgZHJtcC5oIGluIGRybS1taXNjIgoKICAgICAgICBTYW0KCiBkcml2
ZXJzL2dwdS9kcm0vdGRmeC90ZGZ4X2Rydi5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RkZngvdGRmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZGZ4L3RkZnhfZHJ2
LmMKaW5kZXggM2ExNDc2ODE4YzY1Li5jMjQzYWYxNTZlZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90ZGZ4L3RkZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RkZngvdGRmeF9k
cnYuYwpAQCAtMzIsMTEgKzMyLDE0IEBACiAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KIAot
I2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSAidGRmeF9kcnYuaCIKLQotI2luY2x1ZGUg
PGRybS9kcm1fcGNpaWRzLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNsdWRlIDxk
cm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9sZWdhY3kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgorI2luY2x1ZGUgPGRybS9k
cm1fcGNpaWRzLmg+CisKKyNpbmNsdWRlICJ0ZGZ4X2Rydi5oIgogCiBzdGF0aWMgc3RydWN0IHBj
aV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAJdGRmeF9QQ0lfSURTCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
