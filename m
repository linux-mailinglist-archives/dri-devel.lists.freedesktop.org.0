Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8C2B91E9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593A16E50C;
	Thu, 19 Nov 2020 11:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195706E50C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:58:24 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DF0B2225B;
 Thu, 19 Nov 2020 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605787103;
 bh=CpurNvymhEWKV47Naleb+jCbGoAPm0c5mF+oQi1St9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QEL3+I9G3+7VCLlsQ9STWPFfiYIAuoxrLymg70K4sqH7rM2AmWzUgGRz15jJ3Ey9a
 WE/+P0J1pf7t9iqipB1tCA8Vdvb5rZGynKZ8jEO/0iQfTmcMYwpMdagMnR7jlYBjeY
 qNHoLfxYdRN2Z1j7jb3ftnFEBcB0o+pCDv1gDLF4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfiZx-00BwVd-E7; Thu, 19 Nov 2020 11:58:21 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 11:58:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <c76273f5fe483766e6a7f509f82d928a@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, guillaume.tucker@collabora.com,
 kernelci-results@groups.io, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0xOSAxMDoyNiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTkvMTEvMjAy
MCAxMToyMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+PiBPbiAyMDIwLTExLTE5IDA4OjUwLCBHdWls
bGF1bWUgVHVja2VyIHdyb3RlOgo+Pj4gUGxlYXNlIHNlZSB0aGUgYXV0b21hdGVkIGJpc2VjdGlv
biByZXBvcnQgYmVsb3cgYWJvdXQgc29tZSBrZXJuZWwKPj4+IGVycm9ycyBvbiBtZXNvbi1neGJi
LXAyMDAuCj4+PiAKPj4+IFJlcG9ydHMgYXJlbid0IGF1dG9tYXRpY2FsbHkgc2VudCB0byB0aGUg
cHVibGljIHdoaWxlIHdlJ3JlCj4+PiB0cmlhbGluZyBuZXcgYmlzZWN0aW9uIGZlYXR1cmVzIG9u
IGtlcm5lbGNpLm9yZywgaG93ZXZlciB0aGlzIG9uZQo+Pj4gbG9va3MgdmFsaWQuCj4+PiAKPj4+
IFRoZSBiaXNlY3Rpb24gc3RhcnRlZCB3aXRoIG5leHQtMjAyMDExMTggYnV0IHRoZSBlcnJvcnMg
YXJlIHN0aWxsCj4+PiBwcmVzZW50IGluIG5leHQtMjAyMDExMTkuwqAgRGV0YWlscyBmb3IgdGhp
cyByZWdyZXNzaW9uOgo+Pj4gCj4+PiDCoCBodHRwczovL2tlcm5lbGNpLm9yZy90ZXN0L2Nhc2Uv
aWQvNWZiNjE5NmJmZDAxMjdmZDY4ZDhkOTAyLwo+Pj4gCj4+PiBUaGUgZmlyc3QgZXJyb3IgaXM6
Cj4+PiAKPj4+IMKgIFvCoMKgIDE0Ljc1NzQ4OV0gSW50ZXJuYWwgZXJyb3I6IHN5bmNocm9ub3Vz
IGV4dGVybmFsIGFib3J0OiA5NjAwMDIxMAo+Pj4gWyMxXSBQUkVFTVBUIFNNUAo+PiAKPj4gTG9v
a3MgbGlrZSB5ZXQgYW5vdGhlciBjbG9jayBvcmRlcmluZyBzZXR1cC4gSSBndWVzcyBkaWZmZXJl
bnQgQW1sb2dpYwo+PiBwbGF0Zm9ybXMgaGF2ZSBzbGlnaHRseSBkaWZmZXJlbnQgb3JkZXJpbmcg
cmVxdWlyZW1lbnRzLgo+PiAKPj4gTmVpbCwgZG8geW91IGhhdmUgYW55IGlkZWEgb2Ygd2hpY2gg
cGxhdGZvcm0gcmVxdWlyZXMgd2hpY2ggb3JkZXJpbmc/Cj4+IFRoZSB2YXJpYWJpbGl0eSBpbiBE
VCBhbmQgcGxhdGZvcm1zIGlzIHByZXR0eSBkaWZmaWN1bHQgdG8gZm9sbG93IChhbmQKPj4gSSBk
b24ndCB0aGluayBJIGhhdmUgc3VjaCBib2FyZCBhcm91bmQpLgo+IAo+IFRoZSByZXF1aXJlbWVu
dHMgc2hvdWxkIGJlIHRoZSBzYW1lLCBoZXJlIHRoZSBpbml0IHdhcyBkb25lIGJlZm9yZSAKPiBj
YWxsaW5nCj4gZHdfaGRtaV9wcm9iZSB0byBiZSBzdXJlIHRoZSBjbG9ja3MgYW5kIGludGVybmFs
cyByZXNldHMgd2VyZSAKPiBkZWFzc2VydGVkLgo+IEJ1dCBzaW5jZSB5b3UgYm9vdCBmcm9tIHUt
Ym9vdCBhbHJlYWR5IGVuYWJsaW5nIHRoZXNlLCBpdCdzIGFscmVhZHkgCj4gYWN0aXZlLgo+IAo+
IFRoZSBzb2x1dGlvbiB3b3VsZCBiZSB0byByZXZlcnQgYW5kIGRvIHNvbWUgY2hlY2sgaW4gCj4g
bWVzb25fZHdfaGRtaV9pbml0KCkgdG8KPiBjaGVjayBpZiBhbHJlYWR5IGVuYWJsZWQgYW5kIGRv
IG5vdGhpbmcuCgpBIGJldHRlciBmaXggc2VlbXMgdG8gYmUgdGhpcywgd2hpY2ggbWFrZXMgaXQg
ZXhwbGljaXQgdGhhdCB0aGVyZSBpcwphIGRlcGVuZGVuY3kgYmV0d2VlbiBzb21lIG9mIHRoZSBy
ZWdpc3RlcnMgYWNjZXNzZWQgZnJvbSAKbWVzb25fZHdfaGRtaV9pbml0KCkKYW5kIHRoZSBpYWhi
IGNsb2NrLgoKR3VpbGxhdW1lLCBjYW4geW91IGdpdmUgdGhpcyBhIGdvIG9uIHlvdXIgZmFpbGlu
ZyBib3g/CgpUaGFua3MsCgogICAgICAgICBNLgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgCmIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYwppbmRleCA3ZjhlZWE0OTQxNDcuLjUyYWY4YmE5NDMxMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHdfaGRtaS5jCkBAIC0xNDYsNiArMTQ2LDcgQEAgc3RydWN0IG1lc29uX2R3
X2hkbWkgewogIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqaGRtaXR4X2N0cmw7CiAgCXN0cnVjdCBy
ZXNldF9jb250cm9sICpoZG1pdHhfcGh5OwogIAlzdHJ1Y3QgY2xrICpoZG1pX3BjbGs7CisJc3Ry
dWN0IGNsayAqaWFoYl9jbGs7CiAgCXN0cnVjdCBjbGsgKnZlbmNpX2NsazsKICAJc3RydWN0IHJl
Z3VsYXRvciAqaGRtaV9zdXBwbHk7CiAgCXUzMiBpcnFfc3RhdDsKQEAgLTEwMzMsNiArMTAzNCwx
MyBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIApz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAgCX0KICAJY2xrX3ByZXBhcmVfZW5hYmxlKG1lc29uX2R3
X2hkbWktPmhkbWlfcGNsayk7CgorCW1lc29uX2R3X2hkbWktPmlhaGJfY2xrID0gZGV2bV9jbGtf
Z2V0KGRldiwgImlhaGIiKTsKKwlpZiAoSVNfRVJSKG1lc29uX2R3X2hkbWktPmlhaGJfY2xrKSkg
eworCQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBnZXQgaWFoYiBjbGtcbiIpOworCQlyZXR1cm4g
UFRSX0VSUihtZXNvbl9kd19oZG1pLT5pYWhiX2Nsayk7CisJfQorCWNsa19wcmVwYXJlX2VuYWJs
ZShtZXNvbl9kd19oZG1pLT5pYWhiX2Nsayk7CisKICAJbWVzb25fZHdfaGRtaS0+dmVuY2lfY2xr
ID0gZGV2bV9jbGtfZ2V0KGRldiwgInZlbmNpIik7CiAgCWlmIChJU19FUlIobWVzb25fZHdfaGRt
aS0+dmVuY2lfY2xrKSkgewogIAkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IHZlbmNpIGNs
a1xuIik7CkBAIC0xMDcxLDYgKzEwNzksOCBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsIApzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCgogIAllbmNvZGVy
LT5wb3NzaWJsZV9jcnRjcyA9IEJJVCgwKTsKCisJbWVzb25fZHdfaGRtaV9pbml0KG1lc29uX2R3
X2hkbWkpOworCiAgCURSTV9ERUJVR19EUklWRVIoImVuY29kZXIgaW5pdGlhbGl6ZWRcbiIpOwoK
ICAJLyogQnJpZGdlIC8gQ29ubmVjdG9yICovCkBAIC0xMDk1LDggKzExMDUsNiBAQCBzdGF0aWMg
aW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIApzdHJ1Y3QgZGV2aWNl
ICptYXN0ZXIsCiAgCWlmIChJU19FUlIobWVzb25fZHdfaGRtaS0+aGRtaSkpCiAgCQlyZXR1cm4g
UFRSX0VSUihtZXNvbl9kd19oZG1pLT5oZG1pKTsKCi0JbWVzb25fZHdfaGRtaV9pbml0KG1lc29u
X2R3X2hkbWkpOwotCiAgCW5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHBkZXYtPmRl
di5vZl9ub2RlKTsKICAJaWYgKG5leHRfYnJpZGdlKQogIAkJZHJtX2JyaWRnZV9hdHRhY2goZW5j
b2RlciwgbmV4dF9icmlkZ2UsCgoKLS0gCkphenogaXMgbm90IGRlYWQuIEl0IGp1c3Qgc21lbGxz
IGZ1bm55Li4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
