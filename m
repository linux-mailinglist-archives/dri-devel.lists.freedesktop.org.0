Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154901FEC28
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334336EABB;
	Thu, 18 Jun 2020 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEFA6E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 14:20:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i27so3038198ljb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V4JLMz2DyNc9DZlCXfygme3vyorMs8d0BwMT8g/PCDM=;
 b=ED+yIktKhA0fqclBgysqcqOeWWNof0cSIFSi8rQEq55yH64CoqoXNp/x03pSQs9xpK
 zMVzbcH5tNcj2DhO0XujNbVQFA86xg9OPAq/gGFNfkQm8e1bnhRmMWuY/ZuoJZK4uQNG
 55z4eJvSNHuUWXC1RkAPfX3RaHsz7pYNdMMWnUgHhZMZasWiTnDnLD3Vmr3hLns38RGe
 eiJ+X/om3Ar8AoX2ly2vaWFqCtl0EXbD1xa6rFIlSH5kg+t5y4Y0K25r8qCdl+oJaJRB
 CW44eU00qXoE8UkUfqBmuhpgiJPYfqCXYnm0SK4AEzvk/5c+t45oCaaf896dZMUS4yrr
 TEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4JLMz2DyNc9DZlCXfygme3vyorMs8d0BwMT8g/PCDM=;
 b=X8jxhoqspxBv2gyidSF+moUUo60RF8kc/R3OJT0AorOKutvYcbARHxQ155gkAo0meK
 D4Fug5bkeL/wpn5y7NVYrWKNpYCNefxIRSGOumWspWGOWgpsscpn6fyCxgtUJMSJSxxd
 vXHEz8oa7o/MbT0rq74xl1MChbBRJrAAgkaGPsvxHY6XI+9Rf1ULeZ1E7eaf7KDSBg+w
 b1Nc5kek0o/CgwG4b4glAaqby/fPPmfXlcoR3hYSMjGx4WQDshyNHgtdwmgm+zLoOPTo
 6rBf4XXacxUNWVxwCoa60sJm7wpeW9BEKrpf7WaWK067hdm/CyRC3uh3d75N339GF4DR
 rO9Q==
X-Gm-Message-State: AOAM532INnqX+RpIHNlmqDgaXrFOvo9LPO5xfYJNkm93uD/FiJMiULJ6
 +q9lPPROMJ8wDimjMVUKFYw=
X-Google-Smtp-Source: ABdhPJwG66NISXRY5Ia3T+p6a2YHiNyQj6rHxAo8mP76P7n6hnrx1CL++kCOeMz4RC4DyI0W4y4LLA==
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr3961755ljg.372.1592403616226; 
 Wed, 17 Jun 2020 07:20:16 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id s20sm13366ljs.36.2020.06.17.07.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 07:20:15 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
Date: Wed, 17 Jun 2020 17:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617141015.GB3536291@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDYuMjAyMCAxNzoxMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEp1
biAxNiwgMjAyMCBhdCAwOTozOToxOVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE2LjA2LjIwMjAgMjE6MTQsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBGcm9tOiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4KPj4+IEFzIG9mIGNvbW1pdCA0
ZGM1NTUyNWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkgdGhhdCBubyBvciBhbGwgcGxhbmVzCj4+
PiBoYXZlIGEgenBvcyBwcm9wZXJ0eSIpIGEgd2FybmluZyBpcyBlbWl0dGVkIGlmIHRoZXJlJ3Mg
YSBtaXggb2YgcGxhbmVzCj4+PiB3aXRoIGFuZCB3aXRob3V0IGEgenBvcyBwcm9wZXJ0eS4KPj4+
Cj4+PiBPbiBUZWdyYSwgY3Vyc29yIHBsYW5lcyBhcmUgYWx3YXlzIGNvbXBvc2l0ZWQgb24gdG9w
IG9mIGFsbCBvdGhlcgo+Pj4gcGxhbmVzLCB3aGljaCBpcyB3aHkgdGhleSBuZXZlciBoYWQgYSB6
cG9zIHByb3BlcnR5IGF0dGFjaGVkIHRvIHRoZW0uCj4+PiBIb3dldmVyLCBzaW5jZSB0aGUgY29t
cG9zaXRpb24gb3JkZXIgaXMgZml4ZWQsIHRoaXMgaXMgdHJpdmlhbCB0bwo+Pj4gcmVtZWR5IGJ5
IHNpbXBseSBhdHRhY2hpbmcgYW4gaW1tdXRhYmxlIHpwb3MgcHJvcGVydHkgdG8gdGhlbS4KPj4+
Cj4+PiB2MzogZG8gbm90IGhhcmRjb2RlIHpwb3MgZm9yIG92ZXJsYXkgcGxhbmVzIHVzZWQgYXMg
Y3Vyc29yIChEbWl0cnkpCj4+PiB2MjogaGFyZGNvZGUgY3Vyc29yIHBsYW5lIHpwb3MgdG8gMjU1
IGluc3RlYWQgb2YgMCAoVmlsbGUpCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IEpvbmF0aGFuIEh1bnRl
ciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGlu
ZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RjLmMgfCAxICsKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYwo+Pj4gaW5kZXggODNmMzFjNmU4OTFjLi4wNGQ2ODQ4ZDE5ZmMgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RjLmMKPj4+IEBAIC05NTcsNiArOTU3LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1f
cGxhbmUgKnRlZ3JhX2RjX2N1cnNvcl9wbGFuZV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwKPj4+ICAJfQo+Pj4gIAo+Pj4gIAlkcm1fcGxhbmVfaGVscGVyX2FkZCgmcGxhbmUtPmJhc2Us
ICZ0ZWdyYV9jdXJzb3JfcGxhbmVfaGVscGVyX2Z1bmNzKTsKPj4+ICsJZHJtX3BsYW5lX2NyZWF0
ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIDI1NSk7Cj4+PiAgCj4+PiAg
CXJldHVybiAmcGxhbmUtPmJhc2U7Cj4+PiAgfQo+Pj4KPj4KPj4gTG9va3MgbmljZSwgdGhhbmtz
ISBTaW5jZSB5b3UgZHJvcHBlZCBhbGwgb3RoZXIgenBvcyBjaGFuZ2VzIGZvciBvdGhlcgo+PiBw
bGFuZXMgYW5kIGdpdmVuIHRoYXQgdGhlIG90aGVyIHBsYW5lcyBoYXZlIDI1NSBmb3IgdGhlIG1h
eCB6cG9zLCB3aGF0Cj4+IGFib3V0IHRvIHNldCB0aGUgY3Vyc29yJ3MgenBvcyB0byAyNTY/Cj4g
Cj4gSSdkIHByZWZlciB0byBoYXZlIGFsbCBvZiB0aGUgcGxhbmVzJyB6cG9zIHdpdGhpbiB0aGUg
c2FtZSByYW5nZS4gQnkKPiBkZWZhdWx0IHRoZSBvdGhlciBwbGFuZXMgd2lsbCBiZSBvbiB0aGUg
dmVyeSBib3R0b20gZW5kIG9mIHRoYXQgcmFuZ2UKPiBhbmQgdGhlIGF0b21pYyBjb3JlIHdpbGwg
bm9ybWFsaXplIHRoZSB6cG9zIGZvciBhbGwgcGxhbmVzIGFueXdheSwgc28KPiB0aGUgY3Vyc29y
IHBsYW5lIHdpbGwgZW5kIHVwIHdpdGggYSB2ZXJ5IHNtYWxsIG5vcm1hbGl6ZWQgenBvcyBpbiB0
aGUKPiBlbmQuCj4gCj4gVGhlIHpwb3MgZG9jdW1lbnRhdGlvbiBhbHJlYWR5IG1lbnRpb25zIHRo
YXQgdGhlIGJlaGF2aW91ciBpcyB1bmRlZmluZWQKPiBpZiB0d28gcGxhbmVzIGhhdmUgdGhlIHNh
bWUgenBvcyB2YWx1ZSwgc28gSSB0aGluayB1c2Vyc3BhY2UgaXMgZ29pbmcgdG8KPiBrbm93IGhv
dyB0byBzZXQgdGhlc2UgYW55d2F5Lgo+IAo+IEl0IG1pZ2h0IGJlIHdvcnRoIHRvIGRvIGEgZm9s
bG93LXVwIHBhdGNoIHRoYXQgaXMgc21hcnRlciBhYm91dCBzZXR0aW5nCj4gdGhlIHJhbmdlIG9m
IHZhbGlkIHZhbHVlcy4gMC0yNTUgaXMgdHJ1ZSBvbiBsYXRlciBjaGlwcyB3aGVyZSB3ZQo+IGFj
dHVhbGx5IGhhdmUgYSBwcm9wZXIgImxheWVyIGRlcHRoIiByZWdpc3RlciBmaWVsZCBhbmQgSSB3
YW50ZWQgdGhpcyB0bwo+IGJlIHVuaWZvcm0gYWNyb3NzIGFsbCBnZW5lcmF0aW9ucy4gT3RoZXIg
ZHJpdmVycyBzZWVtIHRvIHNldCB0aGUgdXBwZXIKPiBsaW1pdCBvbiB0aGUgenBvcyByYW5nZSB0
byBiZSBlcXVhbCB0byB0aGUgbnVtYmVyIG9mIHBsYW5lcyBhdmFpbGFibGUsCj4gc28gdGhhdCB0
aGVyZSBhcmVuJ3QgcG90ZW50aWFsbHkgYmlnIGdhcHMgaW4gdGhlIG51bWJlcmluZy4gVGhhdCBz
YWlkLAo+IHNpbmNlIHRoZSBjb3JlIGFscmVhZHkgbm9ybWFsaXplcyB0aGUgenBvcyBmb3IgdXMs
IEkgZG9uJ3Qgc2VlIGEgYmlnCj4gYmVuZWZpdCBpbiBleHBsaWNpdGx5IGNsaXBwaW5nIHRoZSBy
YW5nZS4KCkJ1dCB0aGUgY3Vyc29yIHBsYW5lIGRvZXNuJ3QgdXNlIHRoZSAibGF5ZXIgZGVwdGgi
IHJlZ2lzdGVyLCBkb2Vzbid0IGl0PwpTbyB0aGUgenBvcyBvdmVyIDI1NSBzaG91bGRuJ3QgbWF0
dGVyIGluIHRoaXMgY2FzZS4KCkkga25vdyB0aGF0IERSTSBzaG91bGQgbm9ybWFsaXplcyB0aGUg
Z2l2ZW4genBvcywgYnV0IHN0aWxsIGl0IG1ha2VzIG1lCmEgYml0IHVuY29tZm9ydGFibGUga25v
d2luZyB0aGF0IHRoZXJlIGFyZSB0aGUgcmFuZ2VzIG92ZXJsYXAgdmlzaWJsZSB0bwp1c2Vyc3Bh
Y2UgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
