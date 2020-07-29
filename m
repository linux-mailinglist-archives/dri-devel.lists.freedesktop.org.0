Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E8231A61
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 09:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A356E46B;
	Wed, 29 Jul 2020 07:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 615AA6E45E;
 Wed, 29 Jul 2020 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 500DD2A6045;
 Wed, 29 Jul 2020 09:33:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id UI13IxaspXEP; Wed, 29 Jul 2020 09:33:51 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7EE0F2A6042;
 Wed, 29 Jul 2020 09:33:51 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k0gb9-000wCs-CS; Wed, 29 Jul 2020 09:33:50 +0200
Subject: Re: [PATCH v5 0/5] Asynchronous flip implementation for i915
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <9e43a819525424c36438329222fa1a3946c57c89.camel@intel.com>
 <57510F3E2013164E925CD03ED7512A3B86351230@BGSMSX102.gar.corp.intel.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f439795a-6a95-2e96-b511-42b4f5725e04@daenzer.net>
Date: Wed, 29 Jul 2020 09:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57510F3E2013164E925CD03ED7512A3B86351230@BGSMSX102.gar.corp.intel.com>
Content-Language: en-CA
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yOSA5OjIzIGEubS4sIEt1bGthcm5pLCBWYW5kaXRhIHdyb3RlOgo+IAo+IE9u
IGFzeW5jIGZsaXBzLCB0aGVyZSBuZWVkcyB0byBiZSBzb21lIGNsYXJpdHkvZ3VpZGVsaW5lIG9u
IHRoZSBiZWhhdmlvdXIgYW5kIGV2ZW50IGV4cGVjdGF0aW9uIGZyb20gdGhlCj4gZHJpdmVyIGJ5
IHVzZXIgc3BhY2UuCj4gSGVyZSBhcmUgZmV3IGFzc3VtcHRpb25zIHRoYXQgd2UgaGF2ZSwKPiAx
LiBPdXIgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSB1c2VyIHNwYWNlIGRvZXNu4oCZdCBleHBl
Y3QgdGhlIHRpbWVzdGFtcCBmb3IgYXN5bmMgZmxpcHMgKGJ1dCBzdGlsbCBleHBlY3RzIHZibGFu
ayB0aW1lc3RhbXApICwgb3IKPiBkb2VzbuKAmXQgZG8gYW55dGhpbmcgd2l0aCB0aGF0LCBzYW1l
IGlzIHRoZSBhc3N1bXB0aW9uIHdydCB0aGUgZmxpcCBzZXF1ZW5jZSwgcGxlYXNlIGNvcnJlY3Qg
dXMgaWYgd2UgYXJlIHdyb25nLgo+IDIuIEluIHRoZSBzZXF1ZW5jZSB0aGUgdXNlciBzcGFjZSBz
dGlsbCBleHBlY3RzIHRoZSBjb3VudGVyIHRoYXQgbWFya3MgdmJsYW5rcy4KPiAzLiBUaGUgdXNl
ciBzcGFjZSBjYW4gdXNlIGRpZmZlcmVudCBldmVudCB0eXBlcyBsaWtlIERSTV9FVkVOVF9WQkxB
Tksgb3IgRFJNX0VWRU5UX0ZMSVBfQ09NUExFVEUKPiBmb3IgZ2V0dGluZyB0aGUgY29ycmVzcG9u
ZGluZyBldmVudC4gQW5kIHRoZWlyIGRlc2lnbnMgYXJlIHN0aWxsIGFsaWduZWQgdG8gdGhpcyBl
dmVuIGluIGNhc2Ugb2YgYXN5bmMuCj4gCj4gSWYgdGhlcmUgYXJlIGFueSBtb3JlIGV4cGVjdGF0
aW9ucyBmcm9tIHRoZSB1c2VyIHNwYWNlIHdydCB0byB0aGUgZXZlbnQgdGhhdCBpcyBiZWluZyBz
ZW50IGZyb20gdGhlCj4gZHJpdmVyIGluIGNhc2Ugb2YgYXN5bmMgZmxpcCwgcGxlYXNlIGxldCB1
cyBrbm93Lgo+IAo+IElmIHRoZSB1c2VyIHNwYWNlIGRvZXNu4oCZdCBjYXJlIG11Y2ggYWJvdXQg
dGhlIGZsaXAgc2VxdWVuY2UgdGhlbiwgd2UgY2FuIGp1c3Qgbm90IGRvIGFueXRoaW5nIGxpa2Ug
cmV0dXJuaW5nCj4gdGhlIGZsaXAgY291bnRlciBsaWtlIHRoaXMgdmVyc2lvbiBpcyBkb2luZyBh
bmQganVzdCBzdGljayB0byByZXR1cm5pbmcgb2YgdGhlIGZyYW1lIGNvdW50ZXIgdmFsdWUod2hp
Y2ggbWFya3MgdmJsYW5rcykuCgpUaGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMgYSAiZmxpcCBzZXF1
ZW5jZSIgaW4gdGhlIEtNUyBBUEkuIFRoZXJlJ3Mgb25seQp0aGUgcGVyLUNSVEMgdmJsYW5rIGNv
dW50ZXIuIEVhY2ggZmxpcCBjb21wbGV0aW9uIGV2ZW50IG5lZWRzIHRvIGNvbnRhaW4KdGhlIHZh
bHVlIG9mIHRoYXQgY291bnRlciB3aGVuIHRoZSBoYXJkd2FyZSBjb21wbGV0ZWQgdGhlIGZsaXAs
CnJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBpdCB3YXMgYW4gYXN5bmMgZmxpcCBvciBub3QuCgpBcyBm
b3IgdGhlIHRpbWVzdGFtcCBpbiB0aGUgZXZlbnQsIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBleHBl
Y3RhdGlvbnMKYXJlIGZvciBhc3luYyBmbGlwcywgYnV0IEkgc3VzcGVjdCBpdCBtYXkgbm90IHJl
YWxseSBtYXR0ZXIuIEUuZy4gdGhlCnRpbWVzdGFtcCBjYWxjdWxhdGVkIHRvIGNvcnJlc3BvbmQg
dG8gdGhlIGVuZCBvZiB0aGUgcHJldmlvdXMgdmVydGljYWwKYmxhbmsgcGVyaW9kIG1pZ2h0IGJl
IGZpbmUuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
