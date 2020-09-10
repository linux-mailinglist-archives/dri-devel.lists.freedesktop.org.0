Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E3264F5F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160936E98F;
	Thu, 10 Sep 2020 19:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CFF89D40
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599766853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=py4E6jjsaB6tFKns23cJSXMhicLmq+W4Y0FHZhkr7oQ=;
 b=YC5EMwWkmAg2nUJNNC+LP3mW1RKUQHEPeHqbI21Du0kiTIclYWT8YmBpsYDNMqeCNzOxLD
 SaNRGbZY4jENUuSUtQ+iJStkFzq8rRt0t9XRzvvyJY8L1FPb4Zqza8kUb40goaBgvJoQxV
 1Y05oAUsdnUc5HobmuvolH8LXPQ1xYc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-dT-QE_DaPbSkd8xFbqWrYA-1; Thu, 10 Sep 2020 15:40:52 -0400
X-MC-Unique: dT-QE_DaPbSkd8xFbqWrYA-1
Received: by mail-qt1-f200.google.com with SMTP id o14so4971253qtq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 12:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=py4E6jjsaB6tFKns23cJSXMhicLmq+W4Y0FHZhkr7oQ=;
 b=XRgM5M2nu5hpyINUaWYbqkH6xs+PXH3X8C0nz7x/Ns0AST42RGseez/Jnk1GSO980z
 r5DSQyj/9CDY+EgBz2k0sFSn0qhiQJpww29P3GBKzUM67Q9CDNOdcGjAp9/FVEMh1Jwz
 zhy0v36ogkNhUqh+wm3PodJhY77CuR1Kt1xa+FGBA4azxrOWr5uLw6sHgMaSNEXqScg7
 UUS+OWi45/UHK44xFZIGMhRtr8dui1nJ5rlW6XzCsmBKHK5auoWEQgIeIFZsvAQ2KHNr
 qBpx0WlcN0/2wf3dePmuqE7oQ/XFlhHrN9hCCZreEMIcmJVZCEv9cE1lVzFU4hs0SPWk
 UlIg==
X-Gm-Message-State: AOAM533L4wxwhdEX7G0KLARmZEAKGSpo3t97U2DHVxhc+nmPzF3xQb49
 WD4GIzF2rAxnGKRjXkkengQwp/2lVQJmI/vDB0cjlPGhNlXRHMYroNqVetlSrr6uwr6hB8bUKWP
 rfx0KsP0fV3vSwiry80ENoLfomRt6
X-Received: by 2002:ac8:5205:: with SMTP id r5mr9217433qtn.371.1599766851825; 
 Thu, 10 Sep 2020 12:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsMVnF0T3KnEJtpnAztaiRpRQdWDYuHLyrD+q46R2kuaHeZ2D0GDtri32E5IQLrZdvEXxQ8Q==
X-Received: by 2002:ac8:5205:: with SMTP id r5mr9217426qtn.371.1599766851583; 
 Thu, 10 Sep 2020 12:40:51 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 71sm7137842qki.85.2020.09.10.12.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 12:40:50 -0700 (PDT)
Message-ID: <b34dc9c6f84d153707a0d49cd2f3f54bd848abc9.camel@redhat.com>
Subject: Re: [PATCH v2 10/18] drm/dp: Add
 drm_dp_downstream_{min,max}_tmds_clock()
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 10 Sep 2020 15:40:50 -0400
In-Reply-To: <20200910135551.GZ6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-11-ville.syrjala@linux.intel.com>
 <d4293cb17ee4ece5820c2513861768e2be2054ee.camel@redhat.com>
 <20200910135551.GZ6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA5LTEwIGF0IDE2OjU1ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVHVlLCBTZXAgMDgsIDIwMjAgYXQgMDI6MDg6MTdQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IE9uIEZyaSwgMjAyMC0wOS0wNCBhdCAxNDo1MyArMDMwMCwgVmlsbGUgU3lyamFs
YSB3cm90ZToKPiA+ID4gRnJvbTogVmlsbGUgU3lyasODxpLDgsKkbMODxpLDgsKkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gCj4gPiA+IEFkZCBoZWxwZXJzIHRvIGdldCB0
aGUgVE1EUyBjbG9jayBsaW1pdHMgZm9yIEhETUkvRFZJIGRvd25zdHJlYW0KPiA+ID4gZmFjaW5n
IHBvcnRzLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasODxpLDgsKkbMOD
xpLDgsKkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMTE2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgIHwgICA2
ICsrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiA+ID4gaW5kZXggODIyYTMwZTYwOWVmLi5m
NTY3NDI4ZjJhZWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ID4gPiBA
QCAtNjQzLDYgKzY0MywxMTQgQEAgaW50IGRybV9kcF9kb3duc3RyZWFtX21heF9kb3RjbG9jayhj
b25zdCB1OAo+ID4gPiBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSwKPiA+ID4gIH0KPiA+ID4g
IEVYUE9SVF9TWU1CT0woZHJtX2RwX2Rvd25zdHJlYW1fbWF4X2RvdGNsb2NrKTsKPiA+ID4gIAo+
ID4gPiArLyoqCj4gPiA+ICsgKiBkcm1fZHBfZG93bnN0cmVhbV9tYXhfdG1kc19jbG9jaygpIC0g
ZXh0cmFjdCBkb3duc3RyZWFtIGZhY2luZyBwb3J0Cj4gPiA+IG1heAo+ID4gPiBUTURTIGNsb2Nr
Cj4gPiA+ICsgKiBAZHBjZDogRGlzcGxheVBvcnQgY29uZmlndXJhdGlvbiBkYXRhCj4gPiA+ICsg
KiBAcG9ydF9jYXA6IHBvcnQgY2FwYWJpbGl0aWVzCj4gPiA+ICsgKiBAZWRpZDogRURJRAo+ID4g
PiArICoKPiA+ID4gKyAqIFJldHVybnMgSERNSS9EVkkgZG93bnN0cmVhbSBmYWNpbmcgcG9ydCBt
YXggVE1EUyBjbG9jayBpbiBrSHogb24KPiA+ID4gc3VjY2VzcywKPiA+ID4gKyAqIG9yIDAgaWYg
bWF4IFRNRFMgY2xvY2sgbm90IGRlZmluZWQKPiA+ID4gKyAqLwo+ID4gPiAraW50IGRybV9kcF9k
b3duc3RyZWFtX21heF90bWRzX2Nsb2NrKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdLAo+ID4gPiArCQkJCSAgICAgY29uc3QgdTggcG9ydF9jYXBbNF0sCj4gPiA+ICsJCQkJICAg
ICBjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiA+ID4gK3sKPiA+ID4gKwlpZiAoIWRybV9kcF9p
c19icmFuY2goZHBjZCkpCj4gPiA+ICsJCXJldHVybiAwOwo+ID4gPiArCj4gPiA+ICsJaWYgKGRw
Y2RbRFBfRFBDRF9SRVZdIDwgMHgxMSkgewo+ID4gPiArCQlzd2l0Y2ggKGRwY2RbRFBfRE9XTlNU
UkVBTVBPUlRfUFJFU0VOVF0gJgo+ID4gPiBEUF9EV05fU1RSTV9QT1JUX1RZUEVfTUFTSykgewo+
ID4gPiArCQljYXNlIERQX0RXTl9TVFJNX1BPUlRfVFlQRV9UTURTOgo+ID4gPiArCQkJcmV0dXJu
IDE2NTAwMDsKPiA+ID4gKwkJZGVmYXVsdDoKPiA+ID4gKwkJCXJldHVybiAwOwo+ID4gPiArCQl9
Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJc3dpdGNoIChwb3J0X2NhcFswXSAmIERQX0RTX1BP
UlRfVFlQRV9NQVNLKSB7Cj4gPiA+ICsJY2FzZSBEUF9EU19QT1JUX1RZUEVfRFBfRFVBTE1PREU6
Cj4gPiA+ICsJCWlmIChpc19lZGlkX2RpZ2l0YWxfaW5wdXRfZHAoZWRpZCkpCj4gPiA+ICsJCQly
ZXR1cm4gMDsKPiA+ID4gKwkJLyoKPiA+ID4gKwkJICogSXQncyBsZWZ0IHVwIHRvIHRoZSBkcml2
ZXIgdG8gY2hlY2sgdGhlCj4gPiA+ICsJCSAqIERQIGR1YWwgbW9kZSBhZGFwdGVyJ3MgbWF4IFRN
RFMgY2xvY2suCj4gPiA+ICsJCSAqCj4gPiA+ICsJCSAqIFVuZm9ydHVuYXRsZXkgaXQgbG9va3Mg
bGlrZSBicmFuY2ggZGV2aWNlcwo+ID4gPiArCQkgKiBtYXkgbm90IGZvcmR3YXJkIHRoYXQgdGhl
IERQIGR1YWwgbW9kZSBpMmMKPiA+ID4gKwkJICogYWNjZXNzIHNvIHdlIGp1c3QgdXN1YWxseSBn
ZXQgaTJjIG5hayA6KAo+ID4gPiArCQkgKi8KPiA+ID4gKwkJZmFsbHRocm91Z2g7Cj4gPiA+ICsJ
Y2FzZSBEUF9EU19QT1JUX1RZUEVfSERNSToKPiA+ID4gKwkJIC8qCj4gPiA+ICsJCSAgKiBXZSBz
aG91bGQgcGVyaGFwcyBhc3N1bWUgMTY1IE1IeiB3aGVuIGRldGFpbGVkIGNhcAo+ID4gPiArCQkg
ICogaW5mbyBpcyBub3QgYXZhaWxhYmxlLiBCdXQgbG9va3MgbGlrZSBtYW55IHR5cGljYWwKPiA+
ID4gKwkJICAqIGJyYW5jaCBkZXZpY2VzIGZhbGwgaW50byB0aGF0IGNhdGVnb3J5IGFuZCBzbyB3
ZSdkCj4gPiA+ICsJCSAgKiBwcm9iYWJseSBlbmQgdXAgd2l0aCB1c2VycyBjb21wbGFpbmluZyB0
aGF0IHRoZXkgY2FuJ3QKPiA+ID4gKwkJICAqIGdldCBoaWdoIHJlc29sdXRpb24gbW9kZXMgd2l0
aCB0aGVpciBmYXZvcml0ZSBkb25nbGUuCj4gPiA+ICsJCSAgKgo+ID4gPiArCQkgICogU28gbGV0
J3MgbGltaXQgdG8gMzAwIE1IeiBpbnN0ZWFkIHNpbmNlIERQQ0QgMS40Cj4gPiA+ICsJCSAgKiBI
RE1JIDIuMCBERlBzIGFyZSByZXF1aXJlZCB0byBoYXZlIHRoZSBkZXRhaWxlZCBjYXAKPiA+ID4g
KwkJICAqIGluZm8uIFNvIGl0J3MgbW9yZSBsaWtlbHkgd2UncmUgZGVhbGluZyB3aXRoIGEgSERN
SSAxLjQKPiA+ID4gKwkJICAqIGNvbXBhdGlibGUqIGRldmljZSBoZXJlLgo+ID4gCj4gPiBGb3Jn
b3QgdG8gbWVudGlvbiAtIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHRoaXMgc2VyaWVzLCB0aGVy
ZSdzIHNvbWUgaGlkZGVuCj4gPiBpMmMgYml0cyB0aGF0IEkgdGhpbmsgY2FuIGFsc28gYmUgcHJv
YmVkIGZvciB0aGlzIHNvcnQgb2YgaW5mb3JtYXRpb24gb24KPiA+IHBhc3NpdmUgYWRhcHRlcnMs
IEkga25vdyBhbWRncHUgYWN0dWFsbHkgc3VwcG9ydHMgdGhpcy4gSSB3b25kZXIgaG93IG1hbnkg
b2YKPiA+IHRoZW0gYWxzbyBhcHBseSB0byBvbGRlciBhY3RpdmUgYWRhcHRlcnMuLi4KPiAKPiBT
b21ldGhpbmcgb3RoZXIgdGhhbiB0aGUgbm9ybWFsIERQIGR1YWwgbW9kZSBzdHVmZj8KQWN0dWFs
bHkgdGhhdCAtbWF5LSBoYXZlIGJlZW4gd2hhdCBJIHdhcyB0aGlua2luZyBvZiBidXQgSSdtIG5v
dCBzdXJlLCBJJ2QKcHJvYmFibHkgbmVlZCB0byBsb29rIHRocm91Z2ggREFMIHRvIGZpbmQgb3V0
Cj4gCi0tIApTaW5jZXJlbHksCiAgICAgIEx5dWRlIFBhdWwgKHNoZS9oZXIpCiAgICAgIFNvZnR3
YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
