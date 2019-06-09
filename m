Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056FC3AC48
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 00:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C0891E1;
	Sun,  9 Jun 2019 22:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B968B891A1;
 Sun,  9 Jun 2019 22:08:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r15so5224820lfm.11;
 Sun, 09 Jun 2019 15:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U02SpHJhYOk//l8Uc6pt7GGWTIM/IDzeyZPu59ZA520=;
 b=lHYOwVDA6EgyW+KwwXZWnhKW9rIqwTZu8iDuHcbmrV8fG793NfkWlLen9tZIAuHxcq
 OOzgwcSj0e9W9ENMklS39uBJBa5ZgqrAV24q9gjIdRf/DUarxFMZJRCPnJM4qbR9SN2p
 hq/L4LX+qlehwIklQgsIt5fo1RXVjke8Oi+KdOiNDzsXO9gVQAGCqDyHX597Fltl9l6r
 gC88OqN8z8Gf8r0ZmCRqrK0owh95tWMbnk02GgpR4a0OE7iTGQ6UwoH8IjEBKSs1Dss9
 41blwnuIvk3J6NqRhhnstcGrOFVRxieomVOPYWAg9DUUJEhbwXvGE2k9lJUCgAQNS564
 ZwoA==
X-Gm-Message-State: APjAAAVZGkqVbWadSdRaUgaVYt5m00zcSmWhVNpGUMTtI59ll9NV5JIf
 LM10Rn1bWOUE7DNeZGiHRM2QuFrQLXk=
X-Google-Smtp-Source: APXvYqxDWL1TSNYeumyR+7umo48FTJZ2JAxU6pVu5YgBC9kcnFoa/704ayGyx+RDKoQrK20cFBG9Ug==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr32352964lfn.52.1560118112917; 
 Sun, 09 Jun 2019 15:08:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v12sm225476ljk.22.2019.06.09.15.08.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:08:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 07/10] drm/amd: drop use of drmP.h in powerplay/
Date: Mon, 10 Jun 2019 00:07:54 +0200
Message-Id: <20190609220757.10862-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190609220757.10862-1-sam@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U02SpHJhYOk//l8Uc6pt7GGWTIM/IDzeyZPu59ZA520=;
 b=vatwPcSy1CyLZhh+TKeOm8S23MPA/F079u5xVAHtT9lwmoXQXAypgM9SQCyGp+l1EW
 rnjDzsNBZ2UIRucn+8JEgqEWCK2PJiVHMuaBattgiazSrNUW2zO5BoQdGompULJzsACV
 0nFjVUm+24E4KycPFxk5aYkTDmNGz2T/HrN0cfPRrb/0lsQ8BuexcN7CW+F+SSB3W8JI
 ixQCJKSyXxhqAw+GcxSQrTQscfPrPUGnTudIlQnnbnELxV2Yglhkg263g6wpeLAcdrgF
 2Ot0ibqBGXIl8c5AFpWCcAwrEoouVF9ajqE/Ma+bnHKI0SOEBDehg7V/SVFvVCXiWnUK
 mdUA==
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVsZXRlIHRoZSBvbmx5IGluY2x1ZGUgb2YgZHJtUC5oIGluIHBvd2VycGxheS8uCgpTaWduZWQt
b2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJEYXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZpZDEu
WmhvdUBhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKaW5kZXggZWVjMzI5YWI2MDM3Li5hNGM5ZDkyNjdmOGUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTIwLDkgKzIwLDkgQEAKICAqIE9U
SEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICAqLwogCi0jaW5jbHVkZSAicHBfZGVidWcu
aCIKICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgotI2luY2x1ZGUgPGRybS9kcm1QLmg+CisK
KyNpbmNsdWRlICJwcF9kZWJ1Zy5oIgogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFt
ZGdwdV9zbXUuaCIKICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
