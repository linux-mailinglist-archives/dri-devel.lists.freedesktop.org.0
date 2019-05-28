Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23162C5A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A16F6E215;
	Tue, 28 May 2019 11:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867276E20B;
 Tue, 28 May 2019 11:43:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 04:43:20 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 28 May 2019 04:43:19 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 28 May 2019 04:43:19 -0700
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 28 May 2019 04:43:19 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.93]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 17:13:15 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [v11 00/12] Add HDR Metadata Parsing and handling in DRM layer
Thread-Topic: [v11 00/12] Add HDR Metadata Parsing and handling in DRM layer
Thread-Index: AQHVC+1Op5bE7U7iO02sLWexQqzXBaZ3Sn4AgAjUbYCAAF1OoA==
Date: Tue, 28 May 2019 11:43:15 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82032488@BGSMSX104.gar.corp.intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
 <20190522204522.GC6464@intel.com>
 <c83b4fc7-ea7e-66e6-9d7e-379eeec6d199@linux.intel.com>
In-Reply-To: <c83b4fc7-ea7e-66e6-9d7e-379eeec6d199@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODIyZWEzOWQtMDU4OC00ZDI2LTlkMzYtNjcxMTE0YmEzMWFlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR002RU9kaEs1emtjc2x2YnM5UkQyYXJPeGxoalwvNFhCUTVyMUxNeTByTmd0RWt1YkQwcFdzTHphVWRFY1BodmUifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE1hYXJ0ZW4gTGFua2hvcnN0
IFttYWlsdG86bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tXQ0KPlNlbnQ6IFR1ZXNk
YXksIE1heSAyOCwgMjAxOSA1OjA2IFBNDQo+VG86IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+OyBTaGFua2FyLCBVbWENCj48dW1hLnNoYW5rYXJAaW50ZWwu
Y29tPg0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFybWEsDQo+U2hhc2hhbmsgPHNoYXNoYW5rLnNoYXJtYUBp
bnRlbC5jb20+OyBlbWlsLmwudmVsaWtvdkBnbWFpbC5jb207DQo+YnJpYW4uc3RhcmtleUBhcm0u
Y29tOyBkY2FzdGFnbmFAY2hyb21pdW0ub3JnOyBzZWFucGF1bEBjaHJvbWl1bS5vcmc7DQo+Um9w
ZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IGpvbmFzQGt3aWJvby5z
ZQ0KPlN1YmplY3Q6IFJlOiBbdjExIDAwLzEyXSBBZGQgSERSIE1ldGFkYXRhIFBhcnNpbmcgYW5k
IGhhbmRsaW5nIGluIERSTSBsYXllcg0KPg0KPk9wIDIyLTA1LTIwMTkgb20gMjI6NDUgc2NocmVl
ZiBWaWxsZSBTeXJqw6Rsw6Q6DQo+PiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAwNzo0MDowNVBN
ICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToNCj4+PiBUaGlzIHBhdGNoIHNlcmllcyBlbmFibGVz
IEhEUiBzdXBwb3J0IGluIGRybS4gSXQgYmFzaWNhbGx5IGRlZmluZXMNCj4+PiBIRFIgbWV0YWRh
dGEgc3RydWN0dXJlcywgcHJvcGVydHkgdG8gcGFzcyBjb250ZW50IChhZnRlciBibGVuZGluZykN
Cj4+PiBtZXRhZGF0YSBmcm9tIHVzZXIgc3BhY2UgY29tcG9zaXRvcnMgdG8gZHJpdmVyLg0KPj4+
DQo+Pj4gRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIGluZm9mcmFtZSBjcmVhdGlvbiBhbmQg
c2VuZGluZy4NCj4+Pg0KPj4+IFRvRG86DQo+Pj4gMS4gV2UgbmVlZCB0byBnZXQgdGhlIGNvbG9y
IGZyYW1ld29yayBpbiBwbGFjZSBmb3IgYWxsIHBsYW5lcw0KPj4+ICAgIHdoaWNoIHN1cHBvcnQg
SERSIGNvbnRlbnQgaW4gaGFyZHdhcmUuIFRoaXMgaXMgYWxyZWFkeSBpbiBwcm9ncmVzDQo+Pj4g
ICAgYW5kIHBhdGNoZXMgYXJlIG91dCBmb3IgcmV2aWV3IGluIG1haWxpbmcgbGlzdC4NCj4+PiAy
LiBVc2VyU3BhY2UvQ29tcG9zaXRvcnM6IEJsZW5kaW5nIHBvbGljaWVzIGFuZCBtZXRhZGF0YSBi
bG9iDQo+Pj4gICAgY3JlYXRpb24gYW5kIHBhc3NpbmcgdG8gZHJpdmVyLiBXb3JrIGlzIGFscmVh
ZHkgaW4gcHJvZ3Jlc3MNCj4+PiAgICBieSBJbnRlbCdzIG1pZGRsZXdhcmUgdGVhbXMgb24gd2F5
bGFuZCBhbmQgdGhlIHBhdGNoZXMgZm9yDQo+Pj4gICAgdGhlIHNhbWUgYXJlIGluIHJldmlldy4N
Cj4+Pg0KPj4+IEEgUE9DIGhhcyBhbHJlYWR5IGJlZW4gZGV2ZWxvcGVkIGJ5IFZpbGxlIGJhc2Vk
IG9uIHdheWxhbmQuIFBsZWFzZQ0KPj4+IHJlZmVyIGJlbG93IGxpbmsgdG8gc2VlIHRoZSBjb21w
b25lbnQgaW50ZXJhY3Rpb25zIGFuZCB1c2FnZToNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy93YXlsYW5kLWRldmVsLzIwMTctRGVjZW1iZXIvMDMNCj4+PiA2NDAz
Lmh0bWwNCj4+Pg0KPj4+IHYyOiBVcGRhdGVkIFZpbGxlJ3MgUE9DIGNoYW5nZXMgdG8gdGhlIHBh
dGNoIHNlcmllcy5JbmNvcnBvcmF0ZWQNCj4+PiBjbGVhbnVwcyBhbmQgZml4ZXMgZnJvbSBWaWxs
ZS4gUmViYXNlIG9uIGxhdGVzdCBkcm0tdGlwLg0KPj4+DQo+Pj4gdjM6IEZpeGVkIGEgd2Fybmlu
ZyBjYXVzaW5nIGJ1aWxkcyB0byBicmVhayBvbiBDSS4gTm8gbWFqb3IgY2hhbmdlLg0KPj4+DQo+
Pj4gdjQ6IEFkZHJlc3NlZCBTaGFzaGFuaydzIHJldmlldyBjb21tZW50cy4NCj4+Pg0KPj4+IHY1
OiBSZWJhc2Ugb24gdG9wIG9mIFZpbGxlJ3MgaW5mb2ZyYW1lIHJlZmFjdG9yaW5nIGNoYW5nZXMu
IEZpeGVkIG5vbg0KPj4+IG1vZGVzZXQgY2FzZSBmb3IgSERSIG1ldGFkYXRhIHVwZGF0ZS4gRHJv
cHBlZCBhIHJlZHVuZGFudCBwYXRjaC4NCj4+Pg0KPj4+IHY2OiBBZGRyZXNzZWQgU2hhc2hhbmsn
cyByZXZpZXcgY29tbWVudHMgYW5kIGFkZGVkIFJCJ3MgcmVjZWl2ZWQuDQo+Pj4NCj4+PiB2Nzog
U3F1YXNoZWQgMiBwYXRjaGVzLCBkcm9wcGVkIDEgY2hhbmdlIGFuZCBhZGRyZXNzZWQgQnJpYW4N
Cj4+PiBTdGFya2V5J3MgYW5kIFNoYXNoYW5rJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPj4+DQo+Pj4g
djg6IEFkZHJlc3NlZCBKb25hcyBLYXJsbWFuIHJldmlldyBjb21tZW50cy4gQWRkZWQgU2hhc2hh
bmsncyBSQiB0bw0KPj4+IHRoZSBzZXJpZXMsIGZpeGVkIGEgV0FSTl9PTiBvbiBCWVQvQ0hULg0K
Pj4+DQo+Pj4gdjk6IEFkZHJlc3NlZCBWaWxsZSBhbmQgSm9uYXMgS2FybG1hbidzIHJldmlldyBj
b21tZW50cy4gQWRkZWQgdGhlDQo+Pj4gaW5mb2ZyYW1lIHN0YXRlIHJlYWRvdXQgYW5kIG1ldGFk
YXRhIHJlZmVyZW5jZSBjb3VudC4NCj4+Pg0KPj4+IHYxMDogQWRkcmVzc2VkIHJldmlldyBjb21t
ZW50cyBmcm9tIEpvbmFzIGFuZCBWaWxsZS4gRHJvcHBlZCBvbmUNCj4+PiBwYXRjaCByZWxhdGVk
IHRvIGk5MTUgZmFzdHNldCBoYW5kbGluZyBhcyBwZXIgVmlsbGUncyBmZWVkYmFjay4NCj4+Pg0K
Pj4+IHYxMTogQWRkcmVzc2VkIFZpbGxlJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPj4+DQo+Pj4gTm90
ZTogdjkgdmVyc2lvbiBpcyBhbHJlYWR5IHRlc3RlZCB3aXRoIEtvZGkgYW5kIGEgY29uZmlybWF0
aW9uIGZyb20NCj4+PiB0ZWFtIGtvZGkgaGFzIGJlZW4gcmVjZWl2ZWQuIEJyYW5jaCBkZXRhaWxz
IGZvciB0aGUgc2FtZSBhcyBiZWxvdzoNCj4+PiBodHRwczovL2dpdGh1Yi5jb20veGJtYy94Ym1j
L3RyZWUvZmVhdHVyZV9kcm1wcmltZS12YWFwaQ0KPj4+DQo+Pj4gdjkgb2YgdGhpcyBzZXJpZXMg
aXM6DQo+Pj4gVGVzdGVkLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+DQo+Pj4N
Cj4+PiBKb25hcyBLYXJsbWFuICgxKToNCj4+PiAgIGRybTogQWRkIHJlZmVyZW5jZSBjb3VudGlu
ZyBvbiBIRFIgbWV0YWRhdGEgYmxvYg0KPj4+DQo+Pj4gVW1hIFNoYW5rYXIgKDkpOg0KPj4+ICAg
ZHJtOiBBZGQgSERSIHNvdXJjZSBtZXRhZGF0YSBwcm9wZXJ0eQ0KPj4+ICAgZHJtOiBQYXJzZSBI
RFIgbWV0YWRhdGEgaW5mbyBmcm9tIEVESUQNCj4+PiAgIGRybTogRW5hYmxlIEhEUiBpbmZvZnJh
bWUgc3VwcG9ydA0KPj4+ICAgZHJtL2k5MTU6IEF0dGFjaCBIRFIgbWV0YWRhdGEgcHJvcGVydHkg
dG8gY29ubmVjdG9yDQo+Pj4gICBkcm0vaTkxNTogV3JpdGUgSERSIGluZm9mcmFtZSBhbmQgc2Vu
ZCB0byBwYW5lbA0KPj4+ICAgZHJtL2k5MTU6RW5hYmxlZCBNb2Rlc2V0IHdoZW4gSERSIEluZm9m
cmFtZSBjaGFuZ2VzDQo+Pj4gICBkcm0vaTkxNTogQWRkZWQgRFJNIEluZm9mcmFtZSBoYW5kbGlu
ZyBmb3IgQllUL0NIVA0KPj4+ICAgdmlkZW8vaGRtaTogQWRkIFVucGFjayBmdW5jdGlvbiBmb3Ig
RFJNIGluZm9mcmFtZQ0KPj4+ICAgZHJtL2k5MTU6IEFkZCBzdGF0ZSByZWFkb3V0IGZvciBEUk0g
aW5mb2ZyYW1lDQo+Pj4NCj4+PiBWaWxsZSBTeXJqw6Rsw6QgKDIpOg0KPj4+ICAgZHJtOiBBZGQg
SExHIEVPVEYNCj4+PiAgIGRybS9pOTE1OiBFbmFibGUgaW5mb2ZyYW1lcyBvbiBHTEsrIGZvciBI
RFINCj4+IFB1c2hlZCB0aGUgY29yZS9ldGMuIGJpdHMgdG8gZHJtLW1pc2MtbmV4dCBzbyB0aGF0
IG90aGVyIGRyaXZlcnMgY2FuDQo+PiBiYXNlIHRoZWlyIHdvcmsgb24gdGhhdC4gV2UnbGwgbmVl
ZCBhIGJhY2ttZXJnZSB0byBnZXQgdGhlDQo+PiBpOTE1IHN0dWZmIGluIHZpYSBkaW5xLg0KPj4N
Cj5SZXN0IHB1c2hlZCBhcyB3ZWxsLiBJIHJlb3JkZXJlZCB0aGUgc2VyaWVzIHRvIGJlIHNsaWdo
dGx5IG1vcmUgbG9naWNhbCwgZnJvbSBodw0KPmVuYWJsaW5nIGJpdHMgdG8gc3cgZW5hYmxpbmcg
Yml0cy4gOikNCg0KVGhhbmtzIE1hYXJ0ZW4gYW5kIFZpbGxlIGZvciBoZWxwaW5nIHdpdGggdGhl
IG1lcmdlIG9mIHRoaXMgc2VyaWVzLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
