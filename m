Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A436F9C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD100893B9;
	Thu,  6 Jun 2019 09:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6F2893B9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:13:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 02:13:54 -0700
X-ExtLoop1: 1
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2019 02:13:53 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.45]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 10:13:52 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "Nicholas.Kazlauskas@amd.com"
 <Nicholas.Kazlauskas@amd.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "Harry.Wentland@amd.com"
 <Harry.Wentland@amd.com>
Subject: Re: Linking ALSA playback devices and DRM connectors
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVGub3qPpDIp0ZmkGUsrmQWEy2vqaLifwAgAK/x4A=
Date: Thu, 6 Jun 2019 09:13:51 +0000
Message-ID: <ccd5d702b4c15cb14e3ec44758cce8880e28b74c.camel@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
In-Reply-To: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <16891106A53CAF4DA96BEA4EBDA5A24C@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDE3OjE1ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAwNC4wNi4xOSB1bSAxNzowNSBzY2hyaWViIFNlciwgU2ltb246DQo+ID4gSGksDQo+
ID4gDQo+ID4gSSdtIHRyeWluZyB0byBsaW5rIEFMU0EgcGxheWJhY2sgZGV2aWNlcyBhbmQgRFJN
IGNvbm5lY3RvcnMuIEluIG90aGVyDQo+ID4gd29yZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8g
a25vdyB3aGljaCBBTFNBIGRldmljZSBJIHNob3VsZCBvcGVuIHRvDQo+ID4gcGxheSBhdWRpbyBv
biBhIGdpdmVuIGNvbm5lY3Rvci4NCj4gPiANCj4gPiBVbmZvcnR1bmF0ZWx5LCBJIGhhdmVuJ3Qg
Zm91bmQgYSB3YXkgdG8gZXh0cmFjdCB0aGlzIGluZm9ybWF0aW9uLiBJDQo+ID4ga25vdyAvcHJv
Yy9hc291bmQvY2FyZE4vZWxkKiBleHBvc2UgdGhlIEVESUQtbGlrZSBkYXRhLiBIb3dldmVyIGJ5
DQo+ID4gbG9va2luZyBhdCB0aGUgQUxTQSBBUEkgKGFsc286IGFwbGF5IC1sIGFuZCAtTCkgSSBj
YW4ndCBmaW5kIGEgd2F5IHRvDQo+ID4gZmlndXJlIG91dCB3aGljaCBQQ00gZGV2aWNlIG1hcHMg
dG8gdGhlIEVMRC4NCj4gPiANCj4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiANCj4gSXMg
dGhhdCBhY3R1YWxseSBmaXhlZCBvbiBhbGwgaGFyZHdhcmU/IE9yIGRvIHdlIG1heWJlIGhhdmUg
c29tZSANCj4gaGFyZHdhcmUgd2l0aCBvbmx5IG9uZSBhdWRpbyBjb2RlYyBhbmQgbXVsdGlwbGUg
Y29ubmVjdG9ycz8NCj4gDQo+ID4gSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0
byBleHBvc2UgdGhpcz8NCj4gPiANCj4gPiAtIEEgc3ltbGluayB0byB0aGUgQUxTQSBhdWRpbyBQ
Q00gZGV2aWNlIGluDQo+ID4gICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVDVE9SPw0KPiA+
IC0gQSBzeW1saW5rIHRvIHRoZSBEUk0gY29ubmVjdG9yIGluIC9zeXMvY2xhc3Mvc291bmQvcGNt
Kj8NCj4gDQo+IElmIGl0J3MgZml4ZWQgdGhhbiB0aG9zZSB0d28gb3B0aW9ucyBzb3VuZCBzYW5l
IHRvIG1lLg0KPiANCj4gPiAtIEEgRFJNIGNvbm5lY3RvciBwcm9wZXJ0eT8NCj4gDQo+IElmIGl0
J3MgY29uZmlndXJhYmxlIHRoYW4gdGhhdCBzb3VuZHMgbGlrZSBhIGdvb2Qgb3B0aW9uIHRvIG1l
Lg0KDQpJJ20gc3RpbGwgbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIGZpeGVkIG9uIGFsbCBoYXJk
d2FyZSBvciBub3QuDQoNClZpbGxlLCBvbiB0aGlzIG9sZCBJbnRlbCBodywgaXMgdGhlIHNpbmds
ZSBjb25uZWN0b3IgdGhhdCBnZXRzIHRoZQ0KYXVkaW8gY29uZmlndXJhYmxlPw0KDQpBZGRpdGlv
bmFsIHRob3VnaHQ6IHNpbmNlIEkgbmVlZCB0aGlzIGZvciB0aGUgSUdUIHRlc3Qgc3VpdGUgSSBk
b24ndA0KcmVhbGx5IGNhcmUgaG93IHRoaXMgaW5mbyBpcyBleHBvc2VkIGFzIGxvbmcgYXMgaXQn
cyBleHBvc2VkLCBidXQgb3RoZXINCnVzZXJzcGFjZSBwcm9ncmFtcyAoREVzKSBhcmUgcHJvYmFi
bHkgaW50ZXJlc3RlZCBpbiB0aGlzIGluZm9ybWF0aW9uDQp0b28uIFRoaXMgd291bGQgYWxsb3cg
dXNlcnMgdG8gYWN0dWFsbHkgaGF2ZSB0aGUgbmFtZSBvZiB0aGUgbW9uaXRvciBpbg0KdGhlIGF1
ZGlvIG91dHB1dCBzZWxlY3Rpb24gVUkuIEhhdmluZyBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IGRl
cGVuZCBvbg0Kc3lzZnMgd291bGQgYmUgYmV0dGVyIGZvciB0aGlzLg0KDQpXb3VsZCB0aGVyZSBi
ZSBhIHdheSB0byBleHBvc2Ugc29tZSBpbmZvIGFib3V0IHRoZSBtb25pdG9yIGluIHRoZSBBTFNB
DQpBUEk/DQoNCj4gQW55d2F5IGFkZGVkIG91ciBEQyB0ZWFtLCBzdHVmZiBsaWtlIHRoYXQgaXMg
dGhlaXIgY29uc3RydWN0aW9uIHNpdGUuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+
IA0KPiA+IC0gU29tZWhvdyBleHBvc2UgdGhlIGNvbm5lY3RvciBuYW1lIHZpYSB0aGUgQUxTQSBB
UEk/DQo+ID4gLSBFeHBvc2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPw0KPiA+IC0gT3Ro
ZXIgaWRlYXM/DQo+ID4gDQo+ID4gVGhhbmtzIQ0KPiA+IA0KPiA+IFNpbW9uIFNlcg0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
