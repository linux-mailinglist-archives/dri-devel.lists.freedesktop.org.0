Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E776291CB5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 07:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B596E096;
	Mon, 19 Aug 2019 05:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34E56E096
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 05:47:44 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x3so468320lfc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 22:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=erjIQpQNUGu7HuSQuJJUvVSR284H0Ix2U9qE6kAaZtg=;
 b=KWzm015pteZfL+U+2UNTvld3MROCsJ3sgnnSGNe6SbfSbLLHE6TsmQM6GFo+5bMvlh
 qmUAcXMWDHdzxOwGQiyqMUbqvEJojSNCBlirk81pTb+aqjZX12ZAfpMY48iud8g43SOY
 oHDo7UFLTbrDItTV7RkAjoumRb4u7JQ5R/DfeSiGIp3vpHuNzxSOP/bqAhnpnvClza6o
 xR8WcSv/6aT1WPUSRW9318t25O8mLkISLLLB0TWFSE/W8TEtDA83+9MMx8EVNIWbHh0W
 3ro/12fZ871OAQTxebgDHhQFfkNTd9SUeBhuLGxjyV28EkxAbXHXPp6YrMQf5h+3WztV
 pZGQ==
X-Gm-Message-State: APjAAAWGHpr08f9K1EQHDpjmycfLw8U8flCgJsHuWCb+SnLWv00WAFPF
 nASpyQaJCSlFSEiOtLM21uI=
X-Google-Smtp-Source: APXvYqz5qQnCdjl9yEjNCdSCR3lrCzcXCqxwHh1I5O+Hoa44a05S8KycXsF/aaYM4JQtZV4V/1KwSA==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr11245747lfn.20.1566193662622; 
 Sun, 18 Aug 2019 22:47:42 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 r68sm2149207lff.52.2019.08.18.22.47.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 22:47:41 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
 <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
 <20190814172620.GO7444@phenom.ffwll.local>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <1eddff91-02d4-4378-e78d-6899dec26a80@gmail.com>
Date: Mon, 19 Aug 2019 08:47:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814172620.GO7444@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=erjIQpQNUGu7HuSQuJJUvVSR284H0Ix2U9qE6kAaZtg=;
 b=E7vNKNhgLv3sU3lnHP4/Mcyg/wtkCiY4YzbNQmnNeDNetcYDSAol+vl5zIRzljkM2F
 jRA2quCnMkvLNmdXPk1x3KewFVT1qrANmZWJI7jCmM+k3NM0TsYzAeItbAjqwYoyzHvI
 LOqx8Dl75txcWwNqQohjMzdkciZlHVbgkKo6t/z4kZyawZipwV7PkaD7mEYUohEMbZig
 0DUtOm7WJyBWTgKrZy0MFdYlG8Z+Q+fYakQBBPbMZD4rJ8VEkzrkxYZvprWbv27PvIs+
 pdSXfp7uLeBB8hA58GBCWau9/g5l+1uZN0DAvLX/2f/DLnPWsys3yN/LZasLOOOnAZD2
 FX1g==
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
Cc: airlied@linux.ie, xen-devel@lists.xenproject.org,
 dri-devel@lists.freedesktop.org, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNC8xOSA4OjI2IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDEz
LCAyMDE5IGF0IDEwOjMyOjAwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Ogo+PiBPbiA4LzEzLzE5IDk6MjcgQU0sIE5pc2hrYSBEYXNndXB0YSB3cm90ZToKPj4+IFN0YXRp
YyBzdHJ1Y3R1cmUgZmJfZnVuY3MsIG9mIHR5cGUgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLCBpcyB1
c2VkIG9ubHkKPj4+IHdoZW4gaXQgaXMgcGFzc2VkIHRvIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhf
ZnVuY3MoKSBhcyBpdHMgbGFzdAo+Pj4gYXJndW1lbnQuIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhf
ZnVuY3MgZG9lcyBub3QgbW9kaWZ5IGl0cyBsc3QgYXJndW1lbnQKPj4+IChmYl9mdW5jcykgYW5k
IGhlbmNlIGZiX2Z1bmNzIGlzIG5ldmVyIG1vZGlmaWVkLiBUaGVyZWZvcmUgbWFrZSBmYl9mdW5j
cwo+Pj4gY29uc3RhbnQgdG8gcHJvdGVjdCBpdCBmcm9tIGZ1cnRoZXIgbW9kaWZpY2F0aW9uLgo+
Pj4gSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5p
c2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGludXhAZ21haWwuY29tPgo+PiBSZXZpZXdlZC1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pgo+IEknbSBhc3N1bWluZyB5b3UnbGwgYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0IHRvbz8g
R29vZCB0byBzdGF0ZSB0aGF0LAo+IHRvIGF2b2lkIGNvbmZ1c2lvbiBhbmQgY29vcmRpbmF0aW9u
IGlzc3Vlcy4KPiAtRGFuaWVsCj4KU29ycnkgZm9yIHRoZSBkZWxheSBhbmQgY29uZnVzaW9uLgpB
cHBsaWVkIHRvIGRybS1taXNjLW5leHQKPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYwo+Pj4gaW5kZXggYzI5NTVkMzc1Mzk0Li40YTk4NGY0NTU1NWUgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+Pj4gQEAgLTQ1LDcg
KzQ1LDcgQEAgc3RhdGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YikKPj4+ICAgIAlkcm1fZ2VtX2ZiX2Rlc3Ryb3koZmIpOwo+Pj4gICAgfQo+Pj4gLXN0YXRpYyBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGZiX2Z1bmNzID0gewo+Pj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGZiX2Z1bmNzID0gewo+Pj4gICAgCS5kZXN0
cm95ID0gZmJfZGVzdHJveSwKPj4+ICAgIH07CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
