Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EDA5AF01
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E826E9E7;
	Sun, 30 Jun 2019 06:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE196E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q26so6610098lfc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6OdLZPEmNu2Zwa28LaKjQjd51eAxezD0idFhUT3Wpgg=;
 b=RS8wYu8TV0KcHiiuW8D2ThV0FyPc4loBtDb/pVqeOLMJ7SNkd4OQlNmqaHSdAdgL0K
 lKxK0rlwwIxl4/vviOlWEff6LiS+Q8ksuYP/g1dGEm5vBnvgNDUSuc5UEoM7dGHAw5GL
 XmrFPiaANWToNQCLWQ0G6FGOV+eQqoTFaUF1AVr0ARoNLXucuDXHMyfGeIQGWy1SiIiD
 vx82t+w9F/SSIu3ncv19Arai2NFuyNBKfbZcYOmLgz6zr15Ga+NskmZCinXES+InsE91
 1gmxwX5HIpTxYx0dJa/N+KexRi3e4khwzEKljSdMwULB2dRtoZAeL58UvPBEESjzdLkR
 U+Cg==
X-Gm-Message-State: APjAAAXD2te1GwdD6M4LI1xhtkWv0sHMmdWsVoQ/71AUtaFcN9oAY1sK
 1HnSbnfx2qS24v2PeD2glFOq/EIO5el8Pg==
X-Google-Smtp-Source: APXvYqwezRXJ8Iae3VN+8b9B3vpiBjep3CIjvrvelPJcLc8/cV0zpe0rJjUATSxR12EjRPZZ95bAaw==
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr8727186lfm.87.1561875593311; 
 Sat, 29 Jun 2019 23:19:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 25/33] drm/scheduler: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:14 +0200
Message-Id: <20190630061922.7254-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6OdLZPEmNu2Zwa28LaKjQjd51eAxezD0idFhUT3Wpgg=;
 b=cMH4MnQcNnC2fkMAVZbz4nJ1JhUZsunQ04QU4SNaTZw68dDYK3hK8nONDa3370yoYN
 kGK9Qx6MxxgoRyaJz9fAlOrhfnLE1RVVyjfLHAflY89fhLN5yJcDHfbiTa+NgQ4r40nC
 DV9aYMK+1kJrTp969kphj+5OQFitumjzMCQk5v/RYEYAq0KQw9oh6E0Dh9SEzLdc78Pf
 2K4uTpN78q5Ko8w4qR1GdwHyKBO+iIkpTcncAgsZmjfu2FFpHFektFVngZ9kDjm2R4+E
 hhJy3shLQpgjiK2lRYE2wZQdu2URsvhBJXM4uj1ktBByiGyjXb2pbW8hu5Ytq6k4oISh
 fOwA==
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
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IEJh
cyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4KQ2M6IFNoYXJhdCBNYXNl
dHR5IDxzbWFzZXR0eUBjb2RlYXVyb3JhLm9yZz4KQ2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRl
Y2hhbmNlbGxvckBnbWFpbC5jb20+CkNjOiBOYXlhbiBEZXNobXVraCA8bmF5YW4yNmRlc2htdWto
QGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tClRoZSBs
aXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdlIHRvIGFkZCBhbGwgcmVjaXBpZW50cyB0byB0aGUgY292
ZXIgbGV0dGVyLgpQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS90aHJlYWQuaHRtbApT
ZWFyY2ggZm9yICJkcm06IGRyb3AgdXNlIG9mIGRybXAuaCBpbiBkcm0tbWlzYyIKCiAgICAgICAg
U2FtCgogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9ncHVfc2NoZWR1bGVyX3RyYWNlLmggfCAy
IC0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jICAgICAgICB8IDMg
KysrCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMgICAgICAgICB8IDYg
KysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAgICAgICAgICB8
IDMgKystCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL2dwdV9zY2hlZHVsZXJfdHJh
Y2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvZ3B1X3NjaGVkdWxlcl90cmFjZS5oCmlu
ZGV4IDE2MjZmMzk2NzEzMC4uZDc5MDg2NDk4YWZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL2dwdV9zY2hlZHVsZXJfdHJhY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL2dwdV9zY2hlZHVsZXJfdHJhY2UuaApAQCAtMjgsOCArMjgsNiBAQAogI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvdHJhY2Vwb2ludC5oPgogCi0jaW5j
bHVkZSA8ZHJtL2RybVAuaD4KLQogI3VuZGVmIFRSQUNFX1NZU1RFTQogI2RlZmluZSBUUkFDRV9T
WVNURU0gZ3B1X3NjaGVkdWxlcgogI2RlZmluZSBUUkFDRV9JTkNMVURFX0ZJTEUgZ3B1X3NjaGVk
dWxlcl90cmFjZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9l
bnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKaW5kZXgg
MzVkZGJlYzEzNzVhLi5kNWE2YTk0NmY0ODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9lbnRpdHkuYwpAQCAtMjIsNiArMjIsOSBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9r
dGhyZWFkLmg+CisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCisjaW5jbHVkZSA8ZHJtL2RybV9w
cmludC5oPgogI2luY2x1ZGUgPGRybS9ncHVfc2NoZWR1bGVyLmg+CiAKICNpbmNsdWRlICJncHVf
c2NoZWR1bGVyX3RyYWNlLmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMK
aW5kZXggZDhkMmRmZjllYTJmLi41NDk3NzQwOGY1NzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX2ZlbmNlLmMKQEAgLTIyLDkgKzIyLDExIEBACiAgKi8KIAogI2luY2x1ZGUgPGxp
bnV4L2t0aHJlYWQuaD4KLSNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CisjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KLSNpbmNsdWRlIDxkcm0vZHJtUC5o
PgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CisKICNp
bmNsdWRlIDxkcm0vZ3B1X3NjaGVkdWxlci5oPgogCiBzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUg
KnNjaGVkX2ZlbmNlX3NsYWI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmlu
ZGV4IGMxMDU4ZWVjZTE2Yi4uOWEwZWU3NGQ4MmRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYwpAQCAtNDgsNyArNDgsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4K
ICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPHVhcGkvbGludXgvc2NoZWQvdHlw
ZXMuaD4KLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgorCisjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5o
PgogI2luY2x1ZGUgPGRybS9ncHVfc2NoZWR1bGVyLmg+CiAjaW5jbHVkZSA8ZHJtL3Nwc2NfcXVl
dWUuaD4KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
