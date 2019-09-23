Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D1BC241
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD856E9BC;
	Tue, 24 Sep 2019 07:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291B76E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 18:56:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u17so8494521pgi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 11:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CsMc2OBbadsF5+TBj7fbouJIZuD/T7daovw5hMpIMNM=;
 b=XJdbhQodraEohu4z5UiotpcjUWyCF83LO5lZXrlyk+AmvE3wobkBrFeLLBOiMIewGT
 CK+1CKL7SBjBeCqeqEhnMpyECbnECUpxC8Gt2qprmZUBna9e1UyJvi99ecShO2AS0wLQ
 I7YmqrezDc5oQEEYXZLsh+pIEZBNdn8T/x3TobSGsKhwLyP5q+zus/IU1IDwiiJCaNzm
 G4mFKLzOXCaOL6RdT6hVTmMwhUL4EnQ4cj29HFWkyaHGgbArmL3rtDy5DtmLRrYQHitJ
 qrRlxqpyGdCuiEkkslCQQyWd9045WxYcjdah8z2rs4/67XSZn6BprtTFhTVDPCXI7Ymh
 52og==
X-Gm-Message-State: APjAAAUbjhyDgYsxXJE2v5nyYsKG3zBCC8uHgvLrJhU7EsGS10SvpyJb
 MYT8P6haIIcXns2VZve33LE=
X-Google-Smtp-Source: APXvYqwneQoUpghuUhOTZoR96inZCxNiBb0kHtbFd6BnedAcnXY3e/YuwpBwLaXm8+kvMPnmEBsRXg==
X-Received: by 2002:a63:6c89:: with SMTP id h131mr1424775pgc.322.1569265014534; 
 Mon, 23 Sep 2019 11:56:54 -0700 (PDT)
Received: from [10.230.28.130] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id m2sm9484201pgc.19.2019.09.23.11.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 11:56:53 -0700 (PDT)
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <26e101ad-8b5b-edef-4437-778bc57ae81f@gmail.com>
Date: Mon, 23 Sep 2019 11:56:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CsMc2OBbadsF5+TBj7fbouJIZuD/T7daovw5hMpIMNM=;
 b=A0fvyNz0dJYbt8WldJjdAyaAoG02SFZIB0jGAqxLBHmrKGDZbBYceILw9++VGQNfws
 jPGJC0kExLnyTbzAa+JvU3bCPJn4R7JaRednWtyMjqd1oeiIH1+FYH/ZlHN7L0TKfifP
 rp3gXi0Wgqo+PQe6rFS9K/K7UkO1EyBQDeDyO7I4u1xwZCUpGnL38peAc7JLw3iLzgBb
 vUIsWzhxZQnubTBKjQKzbfpC7bFOZq90nBo6G7EE5YeBDsFodj6psMuaRRT/uN3ZRDsK
 KHO4rejh4bN8A9ZvD1fMefRJU+P0Zhy7EiDbHlKbdVUn9BrxnKQDfFa5hgoAMKlA1erB
 pyyA==
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
Cc: stable@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzgvMjAxOSA4OjQ0IEFNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+IFNpbmNlIHJlbGVh
c2Ugb2YgdGhlIG5ldyBCQ00yODM1IFBNIGRyaXZlciB0aGVyZSBoYXMgYmVlbiBzZXZlcmFsIHJl
cG9ydHMKPiBvZiBWM0QgcHJvYmluZyBpc3N1ZXMuIFRoaXMgaXMgY2F1c2VkIGJ5IHRpbWVvdXRz
IGR1cmluZyBwb3dlcmluZy11cCB0aGUKPiBHUkFGWCBQTSBkb21haW46Cj4gCj4gICBiY20yODM1
LXBvd2VyOiBUaW1lb3V0IHdhaXRpbmcgZm9yIGdyYWZ4IHBvd2VyIE9LCj4gCj4gSSB3YXMgYWJs
ZSB0byByZXByb2R1Y2UgdGhpcyByZWxpYWJsZSBvbiBteSBSYXNwYmVycnkgUGkgM0IrIGFmdGVy
IHNldHRpbmcKPiBmb3JjZV90dXJibz0xIGluIHRoZSBmaXJtd2FyZSBjb25maWd1cmF0aW9uLiBT
aW5jZSB0aGVyZSBhcmUgbm8gaXNzdWVzCj4gdXNpbmcgdGhlIGZpcm13YXJlIFBNIGRyaXZlciB3
aXRoIHRoZSBzYW1lIHNldHVwLCB0aGVyZSBtdXN0IGJlIGFuIGlzc3VlCj4gaW4gdGhlIEJDTTI4
MzUgUE0gZHJpdmVyLgo+IAo+IFVuZm9ydHVuYXRlbHkgdGhlcmUgaGFzbid0IGJlZW4gbXVjaCBw
cm9ncmVzcyBpbiBpZGVudGlmeWluZyB0aGUgcm9vdCBjYXVzZQo+IHNpbmNlIEp1bmUgKG1vc3Rs
eSBpbiB0aGUgbGFjayBvZiBkb2N1bWVudGF0aW9uKSwgc28gaSBkZWNpZGVkIHRvIHN3aXRjaAo+
IGJhY2sgdW50aWwgdGhlIGlzc3VlIGluIHRoZSBCQ00yODM1IFBNIGRyaXZlciBpcyBmaXhlZC4K
PiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvaXNzdWVzLzMw
NDYKPiBGaXhlczogZTFkYzJiMmUxYmVmICgiIEFSTTogYmNtMjgzeDogU3dpdGNoIFYzRCBvdmVy
IHRvIHVzaW5nIHRoZSBQTSBkcml2ZXIgaW5zdGVhZCBvZiBmaXJtd2FyZS4iKQo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFdhaHJlbiA8d2FocmVu
c3RAZ214Lm5ldD4KCkFwcGxpZWQgdG8gZGV2aWNldHJlZS9maXhlcywgdGhhbmtzIQotLSAKRmxv
cmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
