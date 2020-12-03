Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5882CE9CD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03E06EC61;
	Fri,  4 Dec 2020 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BC96EB6F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 16:09:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so2427420wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Egp56+bWfac+3k12p/dmisOXz1k0Ww/MYP5K1gwdQ58=;
 b=IbKIdizWv0uaVk1vhtYurj8fNhCBBnAN4q2j0WS9KRqrF2U6oz3IrfaUHX1Qtrfx3i
 ogaKErJH4njzq3nwtbFQAWMx40OAREHKSdnaxxaEDqG2eqlKRM9i4+OYUz8q0pdywmzJ
 Y+u4VUxK5hAvJpJOhlVNgAbvhzDCmnJAWDGkOUq5QOCsK5EAzxttQ+a5nGdZch+09os6
 py9ikEmpyXVadNtvdOOw/LGKP7EbI0dnf75bFCMvS+ePPdg7udWoXco1Ux1VHxt9CuOW
 v5phtZ8cA4Ye1+BWlVYKx+U7T0+l9yZAAsPVaAEbXQiHo6AFEmiNfFlwvufw2ewYAap8
 Z71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Egp56+bWfac+3k12p/dmisOXz1k0Ww/MYP5K1gwdQ58=;
 b=NvhHvQV0ePa/vw06k3+R9iSw+OFGirFd8GSG9DNBNPvfnM+gCQAQLPVT01ookPW4L/
 N//al6u7TP/f+DpJBq6lv7KttdGQzpLrYe8pOpr35oiqoI3dJ5uTfotjGfV01eNxLJ8Q
 3CBbIOE4coNS08GXi78xc3rAorvoYIfRJ6Yb/wSQAQcN6KI45AfStyujzIx30du1xdR4
 KGiXiu5r/L7FgtsucJNElBHJH6qML3u1apVGOW+DZ+kxwno8UqOnNWPHFf+d8VBrgJm6
 rH19I+0nEjk/rOQDblIhD6VyKcyWSpwyNcscB4k4/upZD5wcuYLF8ebYk0vJMYLkuYQU
 veyQ==
X-Gm-Message-State: AOAM5338vDPWnXtxAPUpYNHahw1+G1E3OJLMO02D12NOO/1kRjPQ8pZA
 PPLjVeclanccPHK73tA9kf/7vA==
X-Google-Smtp-Source: ABdhPJx+gI/bhjY3qusZeY90Fqj3HltB+Pt0HmNnq6N7kRujX0WWTNyi+4zTbYCRxzLDMVulGuZCyA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr4547592wrv.181.1607011788834; 
 Thu, 03 Dec 2020 08:09:48 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:9cff:9584:adb2:6288?
 ([2a01:e34:ed2f:f020:9cff:9584:adb2:6288])
 by smtp.googlemail.com with ESMTPSA id o83sm2009235wme.21.2020.12.03.08.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:09:48 -0800 (PST)
Subject: Re: [PATCH v2 2/5] thermal: devfreq_cooling: get a copy of device
 status
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-3-lukasz.luba@arm.com>
 <5d4743b9-5b2f-8494-8d10-6a5fd2c0fdfd@linaro.org>
 <d9906ed8-e3bf-5e42-2e43-09071848ae48@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <224c6b9b-977a-d553-f22b-2056223a84bc@linaro.org>
Date: Thu, 3 Dec 2020 17:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d9906ed8-e3bf-5e42-2e43-09071848ae48@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTIvMjAyMCAxNjozOCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gCj4gCj4gT24gMTIvMy8y
MCAxOjA5IFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24gMTgvMTEvMjAyMCAxMzowMywg
THVrYXN6IEx1YmEgd3JvdGU6Cj4+PiBEZXZmcmVxIGNvb2xpbmcgbmVlZHMgdG8gbm93IHRoZSBj
b3JyZWN0IHN0YXR1cyBvZiB0aGUgZGV2aWNlIGluIG9yZGVyCj4+PiB0byBvcGVyYXRlLiBEbyBu
b3QgcmVseSBvbiBEZXZmcmVxIGxhc3Rfc3RhdHVzIHdoaWNoIG1pZ2h0IGJlIGEgc3RhbGUKPj4+
IGRhdGEKPj4+IGFuZCBnZXQgbW9yZSB1cC10by1kYXRlIHZhbHVlcyBvZiB0aGUgbG9hZC4KPj4+
Cj4+PiBEZXZmcmVxIGZyYW1ld29yayBjYW4gY2hhbmdlIHRoZSBkZXZpY2Ugc3RhdHVzIGluIHRo
ZSBiYWNrZ3JvdW5kLiBUbwo+Pj4gbWl0aWdhdGUgdGhpcyBzaXR1YXRpb24gbWFrZSBhIGNvcHkg
b2YgdGhlIHN0YXR1cyBzdHJ1Y3R1cmUgYW5kIHVzZSBpdAo+Pj4gZm9yIGludGVybmFsIGNhbGN1
bGF0aW9ucy4KPj4+Cj4+PiBJbiBhZGRpdGlvbiB0aGlzIHBhdGNoIGFkZHMgbm9ybWFsaXphdGlv
biBmdW5jdGlvbiwgd2hpY2ggYWxzbyBtYWtlcwo+Pj4gc3VyZQo+Pj4gdGhhdCB3aGF0ZXZlciBk
YXRhIGNvbWVzIGZyb20gdGhlIGRldmljZSwgaXQgaXMgaW4gYSBzYW5lIHJhbmdlLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBhcm0uY29tPgo+Pj4gLS0t
Cj4+PiDCoCBkcml2ZXJzL3RoZXJtYWwvZGV2ZnJlcV9jb29saW5nLmMgfCA1MiArKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFs
L2RldmZyZXFfY29vbGluZy5jCj4+PiBiL2RyaXZlcnMvdGhlcm1hbC9kZXZmcmVxX2Nvb2xpbmcu
Ywo+Pj4gaW5kZXggNjU5YzAxNDNjOWYwLi45MjU1MjM2OTQ0NjIgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL3RoZXJtYWwvZGV2ZnJlcV9jb29saW5nLmMKPj4+ICsrKyBiL2RyaXZlcnMvdGhlcm1h
bC9kZXZmcmVxX2Nvb2xpbmcuYwo+Pj4gQEAgLTIyNywyMCArMjI3LDQ2IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZwo+Pj4gZ2V0X3RvdGFsX3Bvd2VyKHN0cnVjdCBkZXZmcmVxX2Nvb2xp
bmdfZGV2aWNlICpkZmMsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9sdGFnZSk7Cj4+PiDCoCB9Cj4+
PiDCoCArc3RhdGljIHZvaWQgX25vcm1hbGl6ZV9sb2FkKHN0cnVjdCBkZXZmcmVxX2Rldl9zdGF0
dXMgKnN0YXR1cykKPj4+ICt7Cj4+PiArwqDCoMKgIC8qIE1ha2Ugc29tZSBzcGFjZSBpZiBuZWVk
ZWQgKi8KPj4+ICvCoMKgwqAgaWYgKHN0YXR1cy0+YnVzeV90aW1lID4gMHhmZmZmKSB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgc3RhdHVzLT5idXN5X3RpbWUgPj49IDEwOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHN0YXR1cy0+dG90YWxfdGltZSA+Pj0gMTA7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvC
oMKgwqAgaWYgKHN0YXR1cy0+YnVzeV90aW1lID4gc3RhdHVzLT50b3RhbF90aW1lKQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHN0YXR1cy0+YnVzeV90aW1lID0gc3RhdHVzLT50b3RhbF90aW1lOwo+Pgo+
PiBIb3cgdGhlIGNvbmRpdGlvbiBhYm92ZSBpcyBwb3NzaWJsZT8KPiAKPiBUaGV5IHNob3VsZCwg
YmUgY2hlY2tlZCBieSB0aGUgZHJpdmVyLCBidXQgSSBjYW5ub3QgdHJ1c3QKPiBhbmQgaGF2ZSB0
byBjaGVjayBmb3IgYWxsIGNvcm5lciBjYXNlczogKGRpdiBieSAwLCBvdmVyZmxvdwo+IG9uZSBv
ZiB0aGVtLCBldGMpLiBUaGUgYnVzeV90aW1lIGFuZCB0b3RhbF90aW1lIGFyZSB1bnNpZ25lZCBs
b25nLAo+IHdoaWNoIG1lYW5zIDRCIG9uIDMyYml0IG1hY2hpbmVzLgo+IElmIHRoZXNlIHZhbHVl
cyBhcmUgY29taW5nIGZyb20gZGV2aWNlIGNvdW50ZXJzLCB3aGljaCBjb3VudCBldmVyeQo+IGJ1
c3kgY3ljbGUgYW5kIHRvdGFsIGN5Y2xlcyBvZiBhIGNsb2NrIG9mIGEgZGV2aWNlIHJ1bm5pbmcg
YXQgZS5nLgo+IDFHSHogdGhleSB3b3VsZCBvdmVyZmxvdyBldmVyeSB+NHMuCgpJIGRvbid0IHRo
aW5rIGl0IGlzIHVwIHRvIHRoaXMgcm91dGluZSB0byBjaGVjayB0aGUgZHJpdmVyIGlzIGNvcnJl
Y3RseQppbXBsZW1lbnRlZCwgZXNwZWNpYWxseSBhdCBldmVyeSBjYWxsIHRvIGdldF9yZXF1ZXN0
ZWRfcG93ZXIuCgpJZiB0aGUgbm9ybWFsaXphdGlvbiBlbmRzIHVwIGJ5IGRvaW5nIHRoaXMga2lu
ZCBvZiB0aGluZywgdGhlcmUgaXMKY2VydGFpbmx5IHNvbWV0aGluZyB3cm9uZyBpbiB0aGUgJ3N0
YXR1cycgY29tcHV0YXRpb24gdG8gYmUgZml4ZWQgYmVmb3JlCnN1Ym1pdHRpbmcgdGhpcyBzZXJp
ZXMuCgoKPiBOb3JtYWxseSBJUEEgcG9sbGluZyBhcmUgMXMgYW5kIDEwMG1zLCBpdCdzIHBsYXRm
b3JtIHNwZWNpZmljLiBCdXQgdGhlcmUKPiBhcmUgYWxzbyAnZW1wdHknIHBlcmlvZHMgd2hlbiBJ
UEEgc2VlcyB0ZW1wZXJhdHVyZSB2ZXJ5IGxvdyBhbmQgZG9lcyBub3QKPiBldmVuIGNhbGwgdGhl
IC5nZXRfcmVxdWVzdGVkX3Bvd2VyKCkgY2FsbGJhY2tzIGZvciB0aGUgY29vbGluZyBkZXZpY2Vz
LAo+IGp1c3QgZ3JhbnRzIG1heCBmcmVxIHRvIGFsbC4gVGhpcyBpcyBwcm9ibGVtYXRpYy4gSSBh
bSBpbnZlc3RpZ2F0aW5nIGl0Cj4gYW5kIHdpbGwgcHJvcG9zZSBhIHNvbHV0aW9uIGZvciBJUEEg
c29vbi4KPiAKPiBJIHdvdWxkIGF2b2lkIGFsbCBvZiB0aGlzIGlmIGRldmZyZXEgY29yZSB3b3Vs
ZCBoYXZlIGRlZmF1bHQgZm9yIGFsbAo+IGRldmljZXMgYSByZWxpYWJsZSBwb2xsaW5nIHRpbWVy
Li4uIExldCBtZSBjaGVjayBzb21lIHBvc3NpYmlsaXRpZXMgYWxzbwo+IGZvciB0aGlzIGNhc2Uu
CgpPaywgbWF5IGJlIGNyZWF0ZSBhbiBBUEkgdG8gY29tcHV0ZSB0aGUgJ2lkbGUsYnVzeSx0b3Rh
bCB0aW1lcycgdG8gYmUKdXNlZCBieSB0aGUgZGlmZmVyZW50IHRoZSBkZXZmcmVxIGRyaXZlcnMg
YW5kIHRoZW4gZml4IHRoZSBvdmVyZmxvdyBpbgp0aGlzIGNvbW1vbiBwbGFjZS4KCj4+PiArwqDC
oMKgIHN0YXR1cy0+YnVzeV90aW1lICo9IDEwMDsKPj4+ICvCoMKgwqAgc3RhdHVzLT5idXN5X3Rp
bWUgLz0gc3RhdHVzLT50b3RhbF90aW1lID8gOiAxOwo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBBdm9p
ZCBkaXZpc2lvbiBieSAwICovCj4+PiArwqDCoMKgIHN0YXR1cy0+YnVzeV90aW1lID0gc3RhdHVz
LT5idXN5X3RpbWUgPyA6IDE7Cj4+PiArwqDCoMKgIHN0YXR1cy0+dG90YWxfdGltZSA9IDEwMDsK
Pj4KPj4gV2h5IG5vdCBiYXNlIHRoZSBub3JtYWxpemF0aW9uIG9uIDEwMjQ/IGFuZCB1c2UgYW4g
aW50ZXJtZWRpYXRlIHU2NC4KPiAKPiBZb3UgYXJlIHRoZSAybmQgcmV2aWV3ZXIgd2hvIGlzIGFz
a2luZyB0aGlzLiBJIHRyaWVkIHRvIGtlZXAgJ2xvYWQnIGFzCj4gaW4gcmFuZ2UgWzAsIDEwMF0g
c2luY2Ugd2UgYWxzbyBoYXZlICdsb2FkJyBpbiBjcHVmcmVxIGNvb2xpbmcgaW4gdGhpcwo+IHJh
bmdlLiBNYXliZSBJIHNob3VsZCBzd2l0Y2ggdG8gMTAyNCAoSW9uZWxhIHdhcyBhbHNvIGFza2lu
ZyBmb3IgdGhpcykuCgpXZWxsIGl0IGlzIGNvbW1vbiBwcmFjdGljZSB0byBjb21wdXRlIG5vcm1h
bGl6YXRpb24gd2l0aCAxMDI0IGJlY2F1c2UKdGhlIGRpdmlzaW9uIGlzIGEgYml0IHNoaWZ0IGFu
ZCB0aGUgY29tcGlsZXIgb3B0aW1pemUgdGhlIGNvZGUgdmVyeSB3ZWxsCndpdGggdGhhdCB2YWx1
ZS4KCgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cu
ZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29t
LyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJs
b2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
