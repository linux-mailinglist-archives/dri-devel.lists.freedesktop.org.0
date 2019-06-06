Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B03798A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF2B89166;
	Thu,  6 Jun 2019 16:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3589166
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:30:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x15so1849179pfq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HUlzUdoZEuwBcIsFcfZEEwizXh8qoMoVTwGXgk651gw=;
 b=C4NyRQx77NXzvvEdxorJHZUjNcVY4IkM5O4YyoFF5YGv3iX44cKZB/88TBW2VKEY0Y
 JxGKUBJUJNuNVWCoa/7u50THavnYEvgoUZ3qI496iaT4d9kDMcWzIMj84xt4lhjev+fu
 l7KhIMC0k09cPXkAf1qdofyEfWUGzkiRQdjS3UHLyeNravWt8YgZ6KlDpqI+hvxg2S7g
 8sKP9eD7YIdMxQIBMRKt/Jm/adxTbpvwe6rMkfNcRnwRcTZRVsrh3Lkb9poN2/1fyah/
 wKYW61gMiBLSEyW68aq8JbbuEflTcUdeybm4JTvBmYmShSEdK66Xcz0osvD6ctxAHp98
 dD/w==
X-Gm-Message-State: APjAAAWXDa2Ufsnh8AwPmVDb8YbAZ0Gk8C//+9K+bVVnymKG0UiXb7sX
 gidXAjewAnlHKllWRVtzBJwGJw==
X-Google-Smtp-Source: APXvYqwWK98UYLF0wDJKBybt9Rv8pjx46kTpnSnQ3dBiL60FgKPLRXlPXhLbIuisO9V+PN/eTZZzkQ==
X-Received: by 2002:a62:2983:: with SMTP id
 p125mr13170922pfp.154.1559838654627; 
 Thu, 06 Jun 2019 09:30:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g8sm2370035pgd.29.2019.06.06.09.30.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:30:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: fix G12A HDMI PLL settings for 4K60 1000/1001
 variations
In-Reply-To: <20190605125320.8708-1-narmstrong@baylibre.com>
References: <20190605125320.8708-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:30:52 -0700
Message-ID: <7hh892fzgj.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=HUlzUdoZEuwBcIsFcfZEEwizXh8qoMoVTwGXgk651gw=;
 b=qETdpu1fq3YKAf+PIZM1StDrgV04HFfNxDbOwFwICih/0OGyExQlCsDvVUOYGpik2Y
 2gjJfDYHyR1f73PJKlKkPLUz0l0GTn/HYutjpmDgQis3C/fLVHDiMPAHQWe5abO1CxR5
 gzEYFYbOrID4vQAzWHjf9Km7CDWQ+YgyDk6XU59IjAjlriBoJDBeFpD1qYriONA0b96g
 as+fClyo/e/mPDsvW3CinLUXehamtCIGCz+GWe39ZTYfBfsTJCpXWi5sbo6KcpZH4vfU
 65XNfvzv4dThucKEFN8kGfxpVv32WFy2ilzisbYA6jRwPLAp4Ty+WQbW+p7s0mzzxyfP
 PCOw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoZSBB
bWxvZ2ljIEcxMkEgSERNSSBQTEwgbmVlZHMgc29tZSBzcGVjaWZpYyBzZXR0aW5ncyB0byBsb2Nr
IHdpdGgKPiBkaWZmZXJlbnQgZnJhY3Rpb25hbCB2YWx1ZXMgZm9yIHRoZSA1LDRHSHogbW9kZS4K
Pgo+IEhhbmRsZSB0aGUgMTAwMC8xMDAxIHZhcmlhdGlvbiBmcmFjdGlvbmFsIGNhc2UgaGVyZSB0
byBhdm9pZCBoYXZpbmcKPiB0aGUgUExMIGluIGFuIG5vbiBsb2NrYWJsZSBzdGF0ZS4KPgo+IEZp
eGVzOiAyMDJiOTgwOGY4ZWQgKCJkcm0vbWVzb246IEFkZCBHMTJBIFZpZGVvIENsb2NrIHNldHVw
IikKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCAxMyArKysr
KysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4gaW5kZXggNDQyNTBlZmY4YTNm
Li44M2ZjMmZjODIwMDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZjbGsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKPiBAQCAt
NTUzLDggKzU1MywxNyBAQCB2b2lkIG1lc29uX2hkbWlfcGxsX3NldF9wYXJhbXMoc3RydWN0IG1l
c29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IG0sCj4gIAo+ICAJCS8qIEcxMkEgSERNSSBQTEwg
TmVlZHMgc3BlY2lmaWMgcGFyYW1ldGVycyBmb3IgNS40R0h6ICovCj4gIAkJaWYgKG0gPj0gMHhm
Nykgewo+IC0JCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05UTDQsIDB4
ZWE2OGRjMDApOwo+IC0JCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05U
TDUsIDB4NjU3NzEyOTApOwo+ICsJCQlpZiAoZnJhYyA8IDB4MTAwMDApIHsKPiArCQkJCXJlZ21h
cF93cml0ZShwcml2LT5oaGksIEhISV9IRE1JX1BMTF9DTlRMNCwKPiArCQkJCQkJCTB4NmE2ODVj
MDApOwo+ICsJCQkJcmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hETUlfUExMX0NOVEw1LAo+
ICsJCQkJCQkJMHgxMTU1MTI5Myk7Cj4gKwkJCX0gZWxzZSB7Cj4gKwkJCQlyZWdtYXBfd3JpdGUo
cHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05UTDQsCj4gKwkJCQkJCQkweGVhNjhkYzAwKTsKPiAr
CQkJCXJlZ21hcF93cml0ZShwcml2LT5oaGksIEhISV9IRE1JX1BMTF9DTlRMNSwKPiArCQkJCQkJ
CTB4NjU3NzEyOTApOwo+ICsJCQl9Cj4gIAkJCXJlZ21hcF93cml0ZShwcml2LT5oaGksIEhISV9I
RE1JX1BMTF9DTlRMNiwgMHgzOTI3MjAwMCk7Cj4gIAkJCXJlZ21hcF93cml0ZShwcml2LT5oaGks
IEhISV9IRE1JX1BMTF9DTlRMNywgMHg1NTU0MDAwMCk7Cj4gIAkJfSBlbHNlIHsKClJldmlld2Vk
LWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgoKbml0OiB0aGlzIGlzIGNv
bnRpbnVpbmcgd2l0aCBtb3JlIG1hZ2ljIGNvbnN0YW50cywgYW5kIGl0IHdvdWxkIGJlIG5pY2UK
dG8gaGF2ZSB0aGVtIGNvbnZlcnRlZCB0byAjZGVmaW5lJ2QgYml0ZmllbGRzLiAgQnV0IHNpbmNl
IHRoYXQgaXNuJ3QgYQpuZXcgcHJvYmxlbSBpbiB0aGlzIHBhdGNoLCBpdCdzIGZpbmUgdG8gY2xl
YW51cCBsYXRlci4KCktldmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
