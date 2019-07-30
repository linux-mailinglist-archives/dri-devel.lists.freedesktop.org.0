Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F97A9BE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314E895F5;
	Tue, 30 Jul 2019 13:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DB6895F5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:36:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v15so57220479wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ffi+HwEc8+Pz1Mrc1/61eaKvvYzNahI+KcpnHDHp+xk=;
 b=oYsTqIHXixDRnmc8e5zDP7MlVpKcXQt8hzKVe1bDRuLYMyKnlxxAt1M6dX5Pi7aGEP
 b+gfJh3AwGgvfPMalchh2GSbhsXC5cPt79/0QEr6GUEu19qsKH14MfNJAP1mUtGTTMfi
 zz+oAfR1uJfYTL5fKELSblRk6FsaDzqW3vme+rYgN5QHQmepcGeaPPkswmF8U2Zdp6PM
 aG4h20skmV2NuBl+ATE4Cgzi7vxjTgnUflAKGxjWHCApPw6Omu8pXUZBSJg8TsDUtWKM
 u5P/q+ktyAPmWhxfdBjmO5hrP0O0AUV4JVILy3p0M+PSiP38d51o4R73IISsJ4LFEoJg
 ZOlw==
X-Gm-Message-State: APjAAAWQkQ733wGHZT2ti553eeCnkMQMt2TQ2g2JEq46OIoJiF8q3kVU
 9oiGHn7FYje33+URAyrkcMH/7c9RzwU=
X-Google-Smtp-Source: APXvYqx3bov7fhKer18U9G6YicXw1p021k5rCZBpVCmPxJulM6PrT1nfQwE9h9qg4Iu6T12a5x37Sw==
X-Received: by 2002:a1c:ddc1:: with SMTP id
 u184mr102629097wmg.158.1564493760354; 
 Tue, 30 Jul 2019 06:36:00 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id x185sm57002599wmg.46.2019.07.30.06.35.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 06:35:59 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
 <fc848de3-93b3-5299-261d-475b7277cb83@redhat.com>
 <5a340b9f-6329-f9a0-991e-47d67c9ab481@tronnes.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4a85d3d2-9c80-3674-fcd8-b2562e3541e0@redhat.com>
Date: Tue, 30 Jul 2019 15:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a340b9f-6329-f9a0-991e-47d67c9ab481@tronnes.org>
Content-Language: en-US
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzMC0wNy0xOSAxNTozNCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERl
biAzMC4wNy4yMDE5IDE1LjE5LCBza3JldiBIYW5zIGRlIEdvZWRlOgo+PiBIaSwKPj4KPj4gT24g
MjUtMDctMTkgMTI6NTEsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4+IFRoaXMgbWFrZXMgdGhl
IHRpbnkgZHJpdmVycyB2aXNpYmxlIGJ5IGRlZmF1bHQgd2l0aG91dCBoYXZpbmcgdG8gZW5hYmxl
IGEKPj4+IGtub2IuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4+PiAtLS0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tj
b25maWcgfCAzNyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4+ICDCoCAyIGZp
bGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnCj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL0tjb25maWcKPj4+IGluZGV4IDQyYjA2ZjRmODk4OS4uZjhjOWEwZTcx
ZGRlIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+Pj4gQEAgLTEsMTYgKzEsOSBA
QAo+Pj4gIMKgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+Pj4gLW1l
bnVjb25maWcgRFJNX1RJTllEUk0KPj4+IC3CoMKgwqAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIHNp
bXBsZSBkaXNwbGF5cyIKPj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBEUk0KPj4+IC3CoMKgwqAgc2Vs
ZWN0IERSTV9LTVNfSEVMUEVSCj4+PiAtwqDCoMKgIHNlbGVjdCBEUk1fS01TX0NNQV9IRUxQRVIK
Pj4+IC3CoMKgwqAgaGVscAo+Pj4gLcKgwqDCoMKgwqAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlv
dSBoYXZlIGEgdGlueWRybSBzdXBwb3J0ZWQgZGlzcGxheS4KPj4+IC3CoMKgwqDCoMKgIElmIE0g
aXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCB0aW55ZHJtLgo+Pj4gLQo+Pj4g
IMKgIGNvbmZpZyBUSU5ZRFJNX0hYODM1N0QKPj4+ICDCoMKgwqDCoMKgIHRyaXN0YXRlICJEUk0g
c3VwcG9ydCBmb3IgSFg4MzU3RCBkaXNwbGF5IHBhbmVscyIKPj4+IC3CoMKgwqAgZGVwZW5kcyBv
biBEUk1fVElOWURSTSAmJiBTUEkKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBEUk0gJiYgU1BJCj4+
PiArwqDCoMKgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+Pj4gK8KgwqDCoCBzZWxlY3QgRFJNX0tN
U19DTUFfSEVMUEVSCj4+PiAgwqDCoMKgwqDCoCBzZWxlY3QgRFJNX01JUElfREJJCj4+PiAgwqDC
oMKgwqDCoCBzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQo+Pj4gIMKgwqDCoMKgwqAgaGVs
cAo+Pgo+PiA8c25pcD4KPj4KPj4gZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vTWFrZWZpbGUgaGFz
Ogo+Pgo+PiBvYmotJChDT05GSUdfRFJNX1RJTllEUk0pwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArPSBjb3JlLwo+Pgo+PiBBbmQgQUZBSUsgYXQgbGVhc3QgbW9zdCBvZiB0aGUgZHJpdmVy
cyB1bmRlciBkcml2ZXJzL2dwdS9kcm0vdGlueWRybQo+PiBhY3R1YWxseSBuZWVkIHRoZSB0aW55
ZHJtLWNvcmUuCj4+Cj4gCj4gVGhpcyBpcyBnb25lIGluIGN1cnJlbnQgZHJtLW1pc2MtbmV4dC4K
PiBJdCB3ZW50IGF3YXkgd2l0aDoKPiBkcm0vdGlueWRybTogUmVtb3ZlIHRpbnlkcm0ua28KPiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYzODExLwoKQWggSSBzZWUu
CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
