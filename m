Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C714F5A0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 14:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964536E978;
	Sat, 22 Jun 2019 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995389590;
 Sat, 22 Jun 2019 12:12:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so8344584ljh.2;
 Sat, 22 Jun 2019 05:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2muccE2IaGSs+OcGOZD7uoYnZzoAmmUCqNodwBIQe/4=;
 b=omveXKx9YFcL92LoQnYjacvfw5PrDysHn8pWLc2jbW8d93fD5Ss8/Xl/SC+Nw51S26
 EHTflmU5rMlmL8ZB5pMynaFYUakhk3WcTVp49w1Epm0MqUesx9oT1/Z42PU2eUQzBKdC
 eFel/uEQ8NLAFfUQKSZ8P7FPjYUe1jtCIQlGOAgzGyN/frV6vO7O2MBTma0WKgjGQDra
 8nP6zQCqMKNdKUCb1K7dU218PzXVhTOnsPMcE/eoDOkGRh7ov8A1XOwIILCp82QJgqID
 mUVWn7cTs71b59tFfQl8pF98Skk6x0WAfypIg37LBITm+IiR8pJE4aYZdrppZAIEBIP+
 oZWA==
X-Gm-Message-State: APjAAAW/EW9Q/SiB/pKFd1PbQaSMYFK5U/EBn+ivj1hd/dqYFUOS5Fbj
 pWeamLIKMlV/rU275GXrJm0JNOK8WDO54Q==
X-Google-Smtp-Source: APXvYqxE00sGSu9W0fuFsPTc38PAEf4h6ueWRuCXS9TmZ0ctwMIg2R5gYC9saDV2gR4zaXbxzPKqfQ==
X-Received: by 2002:a2e:8613:: with SMTP id a19mr14423342lji.163.1561205524386; 
 Sat, 22 Jun 2019 05:12:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k4sm816910ljg.59.2019.06.22.05.12.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 05:12:03 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm: drop uapi dependency from drm_print.h
Date: Sat, 22 Jun 2019 14:11:55 +0200
Message-Id: <20190622121156.17217-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622121156.17217-1-sam@ravnborg.org>
References: <20190622121156.17217-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2muccE2IaGSs+OcGOZD7uoYnZzoAmmUCqNodwBIQe/4=;
 b=Z3tCShYVg6/DThvw8zbzqKqcmvw/jnn+anCZDjOtjONGaXX6tvNATgD7K5dYEchJAk
 3mzsIOHB9QkWxW3zUyiWlefLBKLXAyVVT04npMtCwb7gr/zMW+epNdbW5jh40wzoKGBI
 ilTQQkL6rGVf7mZKQ75hNiNj9ZtuopGqlS39ZIj25ptstIh48qPPy6pCdDBTtoCAASzq
 1DAwc1uY+AnZsR4nHlonLkhD5X0pSh3eK6S2XKm/EoKpEf52oG8Mzpxpca1NK5bAa526
 t2+l9TnJ3t8oJiXDegHuhkUP9yMusNEaD8w/T6HvewrEFt1Z+aVyuga5gIGj0q+nzzSP
 KHeg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3ByaW50LmggdXNlZCBEUk1fTkFNRSAtIHRodXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBmcm9t
CmluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCgpIYXJkY29kZSB0aGUg
bmFtZSAiZHJtIiB0byBicmVhayB0aGlzIGRlcGVuZGVuY3kuClRoZSBpZGVhIGlzIHRoYXQgdGhl
cmUgc2hhbGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kKYmV0d2VlbiBpbmNsdWRlL2RybS8qIGFu
ZCB1YXBpLyoKClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1l
IFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wcmludC5oIHwg
NCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJp
bnQuaAppbmRleCBhNWQ2ZjJmM2U0MzAuLjc2MGQxYmQwZWFmMSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX3ByaW50LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKQEAgLTMyLDgg
KzMyLDYgQEAKICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtLmg+Ci0KIC8qKgogICogRE9DOiBwcmludAogICoK
QEAgLTI4Nyw3ICsyODUsNyBAQCB2b2lkIGRybV9lcnIoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4p
OwogLyogTWFjcm9zIHRvIG1ha2UgcHJpbnRrIGVhc2llciAqLwogCiAjZGVmaW5lIF9EUk1fUFJJ
TlRLKG9uY2UsIGxldmVsLCBmbXQsIC4uLikJCQkJXAotCXByaW50ayMjb25jZShLRVJOXyMjbGV2
ZWwgIlsiIERSTV9OQU1FICJdICIgZm10LCAjI19fVkFfQVJHU19fKQorCXByaW50ayMjb25jZShL
RVJOXyMjbGV2ZWwgIltkcm1dICIgZm10LCAjI19fVkFfQVJHU19fKQogCiAjZGVmaW5lIERSTV9J
TkZPKGZtdCwgLi4uKQkJCQkJCVwKIAlfRFJNX1BSSU5USygsIElORk8sIGZtdCwgIyNfX1ZBX0FS
R1NfXykKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
