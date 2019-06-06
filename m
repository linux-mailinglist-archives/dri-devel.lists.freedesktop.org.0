Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4123770F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 16:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37320892CC;
	Thu,  6 Jun 2019 14:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE2A892CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:45:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56EjQa4001315;
 Thu, 6 Jun 2019 09:45:26 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56EjQLA007371
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2019 09:45:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 6 Jun
 2019 09:45:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 6 Jun 2019 09:45:25 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56EjN04035160;
 Thu, 6 Jun 2019 09:45:24 -0500
Subject: Re: [PATCH 09/13] drm/omap: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
To: Emil Velikov <emil.l.velikov@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-9-emil.l.velikov@gmail.com>
 <CACvgo532qR7QRE+sBBQB_i1skvD2KZTAs=NiNvVVj5okzpv9YA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <50525d27-9fe9-44cf-254c-caa6baea3595@ti.com>
Date: Thu, 6 Jun 2019 17:45:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACvgo532qR7QRE+sBBQB_i1skvD2KZTAs=NiNvVVj5okzpv9YA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559832326;
 bh=hBDzk8u4JVQa9FwkVgclbaK69KM86bxhoD/Wgf8d73s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dGO+EtbuRMixG70eC6RQyzeAjxiIqYoKv4/gYCoGOQkyPJ2ujPNZQr2xDN30NiS6n
 X8nhDCtEoN9kFAkqumwqUcABfgN7LpgL9jBHVMbxcgjGJfRnBgWTDKXK7U4k1IfYUg
 kfjIMLI7qo5bil/oz2VsrGWNPjBeqPv3wrPxQ9vI=
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
Cc: David Airlie <airlied@linux.ie>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwNi8wNi8yMDE5IDEzOjU4LCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gT24gTW9uLCAy
NyBNYXkgMjAxOSBhdCAwOToxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+Pgo+PiBUaGUgYXV0aGVudGljYXRpb24gY2FuIGJlIGNpcmN1bXZlbnRlZCwgYnkg
ZGVzaWduLCBieSB1c2luZyB0aGUgcmVuZGVyCj4+IG5vZGUuCj4+Cj4+ICBGcm9tIHRoZSBkcml2
ZXIgUE9WIHRoZXJlIGlzIG5vIGRpc3RpbmN0aW9uIGJldHdlZW4gcHJpbWFyeSBhbmQgcmVuZGVy
Cj4+IG5vZGVzLCB0aHVzIHdlIGNhbiBkcm9wIHRoZSB0b2tlbi4KPj4KPj4gTm90ZTogdGhlIG91
dHN0YW5kaW5nIERSTV9BVVRIIGluc3RhbmNlIGlzOgo+PiAgIC0gKGJhZGx5IGNvcGVkKSBsZWdh
Y3kgRFJJMSBpb2N0bCwgd2hpY2ggaXMgYSBub29wCj4+Cj4+IENjOiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgo+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+PiBTaWduZWQtb2Zm
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KPj4gLS0t
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyB8IDEwICsrKysrLS0tLS0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPj4gaW5kZXggMWI5YjZmNWU0OGUxLi5mOTc3
ODFmOWQ5MzYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYwo+PiBAQCAtNDkx
LDE5ICs0OTEsMTkgQEAgc3RhdGljIGludCBpb2N0bF9nZW1faW5mbyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAo+Pgo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3Rs
X2Rlc2MgaW9jdGxzW0RSTV9DT01NQU5EX0VORCAtIERSTV9DT01NQU5EX0JBU0VdID0gewo+PiAg
ICAgICAgICBEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFVF9QQVJBTSwgaW9jdGxfZ2V0X3BhcmFt
LAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExP
VyksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4+ICAg
ICAgICAgIERSTV9JT0NUTF9ERUZfRFJWKE9NQVBfU0VUX1BBUkFNLCBpb2N0bF9zZXRfcGFyYW0s
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9BVVRIIHwgRFJNX01BU1RFUiB8IERS
TV9ST09UX09OTFkpLAo+PiAgICAgICAgICBEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFTV9ORVcs
IGlvY3RsX2dlbV9uZXcsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0FVVEggfCBE
Uk1fUkVOREVSX0FMTE9XKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fUkVOREVS
X0FMTE9XKSwKPj4gICAgICAgICAgLyogRGVwcmVjYXRlZCwgdG8gYmUgcmVtb3ZlZC4gKi8KPj4g
ICAgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9HRU1fQ1BVX1BSRVAsIGRybV9ub29wLAo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyks
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4+ICAgICAg
ICAgIC8qIERlcHJlY2F0ZWQsIHRvIGJlIHJlbW92ZWQuICovCj4+ICAgICAgICAgIERSTV9JT0NU
TF9ERUZfRFJWKE9NQVBfR0VNX0NQVV9GSU5JLCBkcm1fbm9vcCwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+PiAgICAgICAgICBEUk1fSU9DVExfREVG
X0RSVihPTUFQX0dFTV9JTkZPLCBpb2N0bF9nZW1faW5mbywKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+PiAgIH07Cj4+Cj4+ICAgLyoKPj4gLS0KPj4g
Mi4yMS4wCj4+Cj4gSHVtYmxlIHBva2U/CgpJIGhhdmUgdG8gc2F5IEknbSBub3QgcmVhbGx5IGZh
bWlsaWFyIHdpdGggdGhlIGF1dGggc3R1ZmYuIEJ1dCAKY29uc2lkZXJpbmcgdGhhdCBvdXIgdXNl
IGNhc2VzIGFyZSBxdWl0ZSB0cml2aWFsLCBhbmQgdGhhdCBpdCdzIGEgRFJNIAp3aWRlIGNoYW5n
ZSAoc28gcHJlc3VtYWJseSBpdCB3b3JrcyA9KToKCkFja2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
