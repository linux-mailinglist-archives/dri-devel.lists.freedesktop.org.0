Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E99FC5F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6656A89B67;
	Wed, 28 Aug 2019 07:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BBD89915;
 Wed, 28 Aug 2019 07:58:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 00:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="188145406"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2019 00:58:10 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 00:58:10 -0700
Received: from hasmsx113.ger.corp.intel.com (10.184.198.64) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 00:58:09 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 HASMSX113.ger.corp.intel.com ([169.254.13.63]) with mapi id 14.03.0439.000;
 Wed, 28 Aug 2019 10:58:07 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder info
Thread-Topic: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder
 info
Thread-Index: AQHVXXJWh+Xm2TWwf0O+zdcnfB1leacQMY6g
Date: Wed, 28 Aug 2019 07:58:06 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EAE@hasmsx108.ger.corp.intel.com>
References: <20190828072823.4832-1-ramalingam.c@intel.com>
 <20190828072823.4832-4-ramalingam.c@intel.com>
In-Reply-To: <20190828072823.4832-4-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmQzN2RhNGQtYzUzMS00ZTE5LWI0N2UtZjBmY2NjNmY4MmViIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibE1GcUh4VmI5bDV2WVRiblwvNkE0OUVTMGhINTB5MkdnVExCZmhsdWlpMUNxZW5Ta21FYks1MHp4RGlmd1pPUysifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.184.70.11]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJOTE1IG5lZWRzIHRvIHNlbmQgdGhlIGluZGV4IG9mIHRoZSB0cmFuc2NvZGVyIGFzIHBlciBN
RSBGVy4KPiAKPiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190YyBhbmQgYWRk
IGFzIGEgbWVtYmVyIGludG8gdGhlIHN0cnVjdAo+IGhkY3BfcG9ydF9kYXRhLgo+IAo+IHYyOgo+
ICAgVHlwbyBpbiBjb21taXQgbXNnIGlzIGZpeGVkIFtTaGFzaGFua10KPiB2MzoKPiAgIGtkb2Mg
aXMgYWRkZWQgZm9yIG1laV9md190YyBbVG9tYXNdCj4gICBzL01FSV9UQ194L01FSV9UUkFOU0NP
REVSX3gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRl
bC5jb20+Cj4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpM
R1RNLCBqdXN0IG5lZWQgdG8gdXBkYXRlZCB0aGUgY29weXJpZ2h0IHllYXIuCgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oIHwgMjQgKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiBiL2luY2x1ZGUv
ZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiBpbmRleCAwODY3MGFhNjUwZDQuLjRkNDhk
ZTg4OTBjYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFj
ZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+IEBAIC01
NCw5ICs1NCwzMiBAQCBlbnVtIG1laV9md19kZGkgewo+ICAJTUVJX0RESV9SQU5HRV9FTkQgPSBN
RUlfRERJX0EsCj4gIH07Cj4gCj4gKy8qKgo+ICsgKiBlbnVtIG1laV9md190YyAtIE1FIEZpcm13
YXJlIGRlZmluZWQgaW5kZXggZm9yIHRyYW5zY29kZXJzCj4gKyAqIEBNRUlfSU5WQUxJRF9UUkFO
U0NPREVSOiBJbmRleCBmb3IgSW52YWxpZCB0cmFuc2NvZGVyCj4gKyAqIEBNRUlfVFJBTlNDT0RF
Ul9FRFA6IEluZGV4IGZvciBFRFAgVHJhbnNjb2Rlcgo+ICsgKiBATUVJX1RSQU5TQ09ERVJfRFNJ
MDogSW5kZXggZm9yIERTSTAgVHJhbnNjb2Rlcgo+ICsgKiBATUVJX1RSQU5TQ09ERVJfRFNJMTog
SW5kZXggZm9yIERTSTEgVHJhbnNjb2Rlcgo+ICsgKiBATUVJX1RSQU5TQ09ERVJfQTogSW5kZXgg
Zm9yIFRyYW5zY29kZXIgQQo+ICsgKiBATUVJX1RSQU5TQ09ERVJfQjogSW5kZXggZm9yIFRyYW5z
Y29kZXIgQgo+ICsgKiBATUVJX1RSQU5TQ09ERVJfQzogSW5kZXggZm9yIFRyYW5zY29kZXIgQwo+
ICsgKiBATUVJX1RSQU5TQ09ERVJfRDogSW5kZXggZm9yIFRyYW5zY29kZXIgRCAgKi8gZW51bSBt
ZWlfZndfdGMgewo+ICsJTUVJX0lOVkFMSURfVFJBTlNDT0RFUiA9IDB4MDAsCj4gKwlNRUlfVFJB
TlNDT0RFUl9FRFAsCj4gKwlNRUlfVFJBTlNDT0RFUl9EU0kwLAo+ICsJTUVJX1RSQU5TQ09ERVJf
RFNJMSwKPiArCU1FSV9UUkFOU0NPREVSX0EgPSAweDEwLAo+ICsJTUVJX1RSQU5TQ09ERVJfQiwK
PiArCU1FSV9UUkFOU0NPREVSX0MsCj4gKwlNRUlfVFJBTlNDT0RFUl9ECj4gK307Cj4gKwo+ICAv
KioKPiAgICogc3RydWN0IGhkY3BfcG9ydF9kYXRhIC0gaW50ZWwgc3BlY2lmaWMgSERDUCBwb3J0
IGRhdGEKPiAgICogQGZ3X2RkaTogZGRpIGluZGV4IGFzIHBlciBNRSBGVwo+ICsgKiBAZndfdGM6
IHRyYW5zY29kZXIgaW5kZXggYXMgcGVyIE1FIEZXCj4gICAqIEBwb3J0X3R5cGU6IEhEQ1AgcG9y
dCB0eXBlIGFzIHBlciBNRSBGVyBjbGFzc2lmaWNhdGlvbgo+ICAgKiBAcHJvdG9jb2w6IEhEQ1Ag
YWRhcHRhdGlvbiBhcyBwZXIgTUUgRlcKPiAgICogQGs6IE5vIG9mIHN0cmVhbXMgdHJhbnNtaXR0
ZWQgb24gYSBwb3J0LiBPbmx5IG9uIERQIE1TVCB0aGlzIGlzICE9IDEgQEAgLQo+IDY5LDYgKzky
LDcgQEAgZW51bSBtZWlfZndfZGRpIHsKPiAgICovCj4gIHN0cnVjdCBoZGNwX3BvcnRfZGF0YSB7
Cj4gIAllbnVtIG1laV9md19kZGkgZndfZGRpOwo+ICsJZW51bSBtZWlfZndfdGMgZndfdGM7Cj4g
IAl1OCBwb3J0X3R5cGU7Cj4gIAl1OCBwcm90b2NvbDsKPiAgCXUxNiBrOwo+IC0tCj4gMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
