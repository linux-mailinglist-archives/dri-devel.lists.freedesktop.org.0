Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D783AC2CE5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 07:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B482A6E037;
	Tue,  1 Oct 2019 05:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036156E037
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 05:28:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 22:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="190478749"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2019 22:28:10 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Sep 2019 22:28:10 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Sep 2019 22:28:09 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.166]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.119]) with mapi id 14.03.0439.000;
 Tue, 1 Oct 2019 13:28:08 +0800
From: "Zhang, Jun" <jun.zhang@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] ion_system_heap: support X86 archtecture
Thread-Topic: [PATCH] ion_system_heap: support X86 archtecture
Thread-Index: AQHVdppyYu/UDgwp3kCa1tCveaZ4I6dB6ZkAgANY4IA=
Date: Tue, 1 Oct 2019 05:28:07 +0000
Message-ID: <88DC34334CA3444C85D647DBFA962C2735B662D8@SHSMSX104.ccr.corp.intel.com>
References: <20190929072841.14848-1-jun.zhang@intel.com>
 <20190929101254.GA1907778@kroah.com>
In-Reply-To: <20190929101254.GA1907778@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjViOGZjNzEtZDcxOS00YTFjLTk4NGUtYTUzYzBjOGNmMjUwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic25ZeGlQekh3WlRQa1RtNTVxa0VvSEpzV2RmaU5SdG41eWxkbm4reU1Ta3c0aTJpQVEwTUdPODZqUCtsdTNiRiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "tkjos@android.com" <tkjos@android.com>, "Bai@osuosl.org" <Bai@osuosl.org>,
 "Bai, Jie A" <jie.a.bai@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "he@osuosl.org" <he@osuosl.org>, "arve@android.com" <arve@android.com>, "He,
 Bo" <bo.he@intel.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "maco@android.com" <maco@android.com>,
 "christian@brauner.io" <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIEdyZWcKClNvcnJ5LCBJIGFtIG5ld2NvbWVyLCBhbmQgSSBkb24ndCBrbm93IHdoeSBj
b3VsZG4ndCB1c2UgI2lmZGVmcz8gIEkgb25seSByZWZlciBzb21lIGtlcm5lbCBjb2RlKFY0LjE5
KSBpbiBkcml2ZXJzL2h3dHJhY2luZy9pbnRlbF90aC9tc3UuYy4KQ291bGQgeW91IHRlbGwgbWUg
d2h5PyBBbmQgSSB0ZWxsIG15IHdvcmttYXRlIHRvIGF2b2lkIHRoZSBzYW1lIGNhc2UuCgpJZiBJ
IGRlZmluZSBhIGNvbmZpZyBpbiBLY29uZmlnLCBhbmQgc3RhdGljIGlubGluZSBmdW5jdGlvbiBp
biAuaCBmaWxlLCB0aGVuIGNhbGwgaXQ/IENvdWxkIHlvdSBhY2NlcHQgaXQ/CgpJZiBub3QsIENv
dWxkIHlvdSBnaXZlIG1lIGEgc2FtcGxlPwoKVGhhbmtzLApKdW4KCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCkZyb206IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiAKU2Vu
dDogU3VuZGF5LCBTZXB0ZW1iZXIgMjksIDIwMTkgNjoxMyBQTQpUbzogWmhhbmcsIEp1biA8anVu
LnpoYW5nQGludGVsLmNvbT4KQ2M6IGxhYmJvdHRAcmVkaGF0LmNvbTsgc3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc7IGFydmVAYW5kcm9pZC5jb207IHRram9zQGFuZHJvaWQuY29tOyBtYWNvQGFuZHJv
aWQuY29tOyBqb2VsQGpvZWxmZXJuYW5kZXMub3JnOyBjaHJpc3RpYW5AYnJhdW5lci5pbzsgZGV2
ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmc7IEJhaSwgSmllIEEgPGppZS5hLmJhaUBpbnRlbC5jb20+
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7IGhlQG9zdW9zbC5vcmc7IEJh
aUBvc3Vvc2wub3JnOyBIZSwgQm8gPGJvLmhlQGludGVsLmNvbT4KU3ViamVjdDogUmU6IFtQQVRD
SF0gaW9uX3N5c3RlbV9oZWFwOiBzdXBwb3J0IFg4NiBhcmNodGVjdHVyZQoKT24gU3VuLCBTZXAg
MjksIDIwMTkgYXQgMDM6Mjg6NDFQTSArMDgwMCwganVuLnpoYW5nQGludGVsLmNvbSB3cm90ZToK
PiBGcm9tOiB6aGFuZyBqdW4gPGp1bi56aGFuZ0BpbnRlbC5jb20+Cj4gCj4gd2Ugc2VlIHRvbnMg
b2Ygd2FybmluZyBsaWtlOgo+IFsgICA0NS44NDY4NzJdIHg4Ni9QQVQ6IE5ESyBNZWRpYUNvZGVj
XzozNzUzIG1hcCBwZm4gUkFNIHJhbmdlIHJlcQo+IHdyaXRlLWNvbWJpbmluZyBmb3IgW21lbSAw
eDFlN2E4MDAwMC0weDFlN2E4N2ZmZl0sIGdvdCB3cml0ZS1iYWNrCj4gWyAgIDQ1Ljg0ODgyN10g
eDg2L1BBVDogLnZvcmJpcy5kZWNvZGVyOjQwODggbWFwIHBmbiBSQU0gcmFuZ2UgcmVxCj4gd3Jp
dGUtY29tYmluaW5nIGZvciBbbWVtIDB4MWU3YTU4MDAwLTB4MWU3YTU4ZmZmXSwgZ290IHdyaXRl
LWJhY2sKPiBbICAgNDUuODQ4ODc1XSB4ODYvUEFUOiBOREsgTWVkaWFDb2RlY186Mzc1MyBtYXAg
cGZuIFJBTSByYW5nZSByZXEKPiB3cml0ZS1jb21iaW5pbmcgZm9yIFttZW0gMHgxZTdhNDgwMDAt
MHgxZTdhNGZmZmZdLCBnb3Qgd3JpdGUtYmFjawo+IFsgICA0NS44NDk0MDNdIHg4Ni9QQVQ6IC52
b3JiaXMuZGVjb2Rlcjo0MDg4IG1hcCBwZm4gUkFNIHJhbmdlCj4gcmVxIHdyaXRlLWNvbWJpbmlu
ZyBmb3IgW21lbSAweDFlN2E3MDAwMC0weDFlN2E3MGZmZl0sIGdvdCB3cml0ZS1iYWNrCj4gCj4g
Y2hlY2sgdGhlIGtlcm5lbCBEb2N1bWVudGF0aW9uL3g4Ni9wYXQudHh0LCBpdCBzYXlzOgo+IEEu
IEV4cG9ydGluZyBwYWdlcyB0byB1c2VycyB3aXRoIHJlbWFwX3Bmbl9yYW5nZSwgaW9fcmVtYXBf
cGZuX3JhbmdlLCAKPiB2bV9pbnNlcnRfcGZuIERyaXZlcnMgd2FudGluZyB0byBleHBvcnQgc29t
ZSBwYWdlcyB0byB1c2Vyc3BhY2UgZG8gaXQgCj4gYnkgdXNpbmcgbW1hcCBpbnRlcmZhY2UgYW5k
IGEgY29tYmluYXRpb24gb2YKPiAxKSBwZ3Byb3Rfbm9uY2FjaGVkKCkKPiAyKSBpb19yZW1hcF9w
Zm5fcmFuZ2UoKSBvciByZW1hcF9wZm5fcmFuZ2UoKSBvciB2bV9pbnNlcnRfcGZuKCkgV2l0aCAK
PiBQQVQgc3VwcG9ydCwgYSBuZXcgQVBJIHBncHJvdF93cml0ZWNvbWJpbmUgaXMgYmVpbmcgYWRk
ZWQuCj4gU28sIGRyaXZlcnMgY2FuIGNvbnRpbnVlIHRvIHVzZSB0aGUgYWJvdmUgc2VxdWVuY2Us
IHdpdGggZWl0aGVyCj4gcGdwcm90X25vbmNhY2hlZCgpIG9yIHBncHJvdF93cml0ZWNvbWJpbmUo
KSBpbiBzdGVwIDEsIGZvbGxvd2VkIGJ5IHN0ZXAgMi4KPiAKPiBJbiBhZGRpdGlvbiwgc3RlcCAy
IGludGVybmFsbHkgdHJhY2tzIHRoZSByZWdpb24gYXMgVUMgb3IgV0MgaW4gCj4gbWVtdHlwZSBs
aXN0IGluIG9yZGVyIHRvIGVuc3VyZSBubyBjb25mbGljdGluZyBtYXBwaW5nLgo+IAo+IE5vdGUg
dGhhdCB0aGlzIHNldCBvZiBBUElzIG9ubHkgd29ya3Mgd2l0aCBJTyAobm9uIFJBTSkgcmVnaW9u
cy4KPiBJZiBkcml2ZXIgYW50cyB0byBleHBvcnQgYSBSQU0gcmVnaW9uLCBpdCBoYXMgdG8gZG8g
c2V0X21lbW9yeV91YygpIG9yCj4gc2V0X21lbW9yeV93YygpIGFzIHN0ZXAgMCBhYm92ZSBhbmQg
YWxzbyB0cmFjayB0aGUgdXNhZ2Ugb2YgdGhvc2UgCj4gcGFnZXMgYW5kIHVzZSBzZXRfbWVtb3J5
X3diKCkgYmVmb3JlIHRoZSBwYWdlIGlzIGZyZWVkIHRvIGZyZWUgcG9vbC4KPiAKPiB0aGUgZml4
IGZvbGxvdyB0aGUgcGF0IGRvY3VtZW50LCBkbyBzZXRfbWVtb3J5X3djKCkgYXMgc3RlcCAwIGFu
ZCB1c2UgCj4gdGhlIHNldF9tZW1vcnlfd2IoKSBiZWZvcmUgdGhlIHBhZ2UgaXMgZnJlZWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogaGUsIGJvIDxiby5oZUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogemhhbmcganVuIDxqdW4uemhhbmdAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJhaSwg
SmllIEEgPGppZS5hLmJhaUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9hbmRy
b2lkL2lvbi9pb25fc3lzdGVtX2hlYXAuYyB8IDI4IAo+ICsrKysrKysrKysrKysrKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9zeXN0ZW1faGVhcC5jIAo+
IGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9zeXN0ZW1faGVhcC5jCj4gaW5kZXgg
YjgzYTFkMTZiZDg5Li5kMjk4YjgxOTQ4MjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5n
L2FuZHJvaWQvaW9uL2lvbl9zeXN0ZW1faGVhcC5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2Fu
ZHJvaWQvaW9uL2lvbl9zeXN0ZW1faGVhcC5jCj4gQEAgLTEzLDYgKzEzLDcgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2V0X21lbW9yeS5oPgo+
ICAKPiAgI2luY2x1ZGUgImlvbi5oIgo+ICAKPiBAQCAtMTM0LDYgKzEzNSwxMyBAQCBzdGF0aWMg
aW50IGlvbl9zeXN0ZW1faGVhcF9hbGxvY2F0ZShzdHJ1Y3QgaW9uX2hlYXAgKmhlYXAsCj4gIAlz
ZyA9IHRhYmxlLT5zZ2w7Cj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocGFnZSwgdG1wX3Bh
Z2UsICZwYWdlcywgbHJ1KSB7Cj4gIAkJc2dfc2V0X3BhZ2Uoc2csIHBhZ2UsIHBhZ2Vfc2l6ZShw
YWdlKSwgMCk7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX1g4Ngo+ICsJaWYgKCEoYnVmZmVyLT5mbGFn
cyAmIElPTl9GTEFHX0NBQ0hFRCkpCj4gKwkJc2V0X21lbW9yeV93YygodW5zaWduZWQgbG9uZylw
YWdlX2FkZHJlc3Moc2dfcGFnZShzZykpLAo+ICsJCQkgICAgICBQQUdFX0FMSUdOKHNnLT5sZW5n
dGgpID4+IFBBR0VfU0hJRlQpOyAjZW5kaWYKClRoZXJlIGlzIG5vIHdheSB0byBkbyB0aGlzIHdp
dGhvdXQgdGhlc2UgI2lmZGVmcz8gIFRoYXQgZmVlbHMgb2RkLCB3aHkgY2FuJ3QgeW91IGp1c3Qg
YWx3YXlzIHRlc3QgZm9yIHRoaXM/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
