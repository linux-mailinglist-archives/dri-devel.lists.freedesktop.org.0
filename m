Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF7DC51C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 14:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962D86E0F8;
	Fri, 18 Oct 2019 12:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B65D89BD2;
 Fri, 18 Oct 2019 12:37:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 05:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; d="scan'208";a="200698768"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2019 05:37:43 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 18 Oct 2019 05:37:43 -0700
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 18 Oct 2019 05:37:42 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.228]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.14]) with mapi id 14.03.0439.000;
 Fri, 18 Oct 2019 18:07:40 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/edid: Make drm_get_cea_aspect_ratio() static
Thread-Topic: [PATCH 1/4] drm/edid: Make drm_get_cea_aspect_ratio() static
Thread-Index: AQHVer690j4mhoLGdkK31Ixw9PbSx6dga5/g
Date: Fri, 18 Oct 2019 12:37:39 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82276014@BGSMSX104.gar.corp.intel.com>
References: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjUyNGY3ZjgtZmJjMi00MmU1LWJmMzAtMTE2ZmNmYWYwOWZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUWhZK01RUlhHZkdRYzRYUm5xd1dGMkpyakFNbWQxeWx4UU16T0tCU2cxTUc4bmZDT2d3SUF5NEJkMjdVMTM3ZSJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUgU3ly
amFsYQ0KPlNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDE5IDc6NDkgUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBXYXluZSBMaW4gPHdheW5lbGluQGFtZC5jb20+DQo+U3ViamVjdDogW1BBVENIIDEv
NF0gZHJtL2VkaWQ6IE1ha2UgZHJtX2dldF9jZWFfYXNwZWN0X3JhdGlvKCkgc3RhdGljDQo+DQo+
RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4N
Cj5kcm1fZ2V0X2NlYV9hc3BlY3RfcmF0aW8oKSBpcyBub3QgdXNlZCBvdXRzaWRlIGRybV9lZGlk
LmMuDQo+TWFrZSBpdCBzdGF0aWMuDQoNCkNoYW5nZSBsb29rcyBnb29kIHRvIG1lLg0KUmV2aWV3
ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj5DYzogV2F5bmUg
TGluIDx3YXluZWxpbkBhbWQuY29tPg0KPlNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jIHwgMTAgKy0tLS0tLS0tLQ0KPiBpbmNsdWRlL2RybS9kcm1fZWRpZC5oICAgICB8
ICAxIC0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0p
DQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgaW5kZXgNCj4wNTUyMTc1MzEzY2IuLjNkZjgyNjdhZGFiOSAxMDA2
NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jDQo+QEAgLTMyMDUsMTggKzMyMDUsMTAgQEAgc3RhdGljIGJvb2wgZHJt
X3ZhbGlkX2NlYV92aWModTggdmljKQ0KPiAJcmV0dXJuIHZpYyA+IDAgJiYgdmljIDwgQVJSQVlf
U0laRShlZGlkX2NlYV9tb2Rlcyk7ICB9DQo+DQo+LS8qKg0KPi0gKiBkcm1fZ2V0X2NlYV9hc3Bl
Y3RfcmF0aW8gLSBnZXQgdGhlIHBpY3R1cmUgYXNwZWN0IHJhdGlvIGNvcnJlc3BvbmRpbmcgdG8N
Cj4tICogdGhlIGlucHV0IFZJQyBmcm9tIHRoZSBDRUEgbW9kZSBsaXN0DQo+LSAqIEB2aWRlb19j
b2RlOiBJRCBnaXZlbiB0byBlYWNoIG9mIHRoZSBDRUEgbW9kZXMNCj4tICoNCj4tICogUmV0dXJu
cyBwaWN0dXJlIGFzcGVjdCByYXRpbw0KPi0gKi8NCj4tZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0
IGRybV9nZXRfY2VhX2FzcGVjdF9yYXRpbyhjb25zdCB1OCB2aWRlb19jb2RlKQ0KPitzdGF0aWMg
ZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IGRybV9nZXRfY2VhX2FzcGVjdF9yYXRpbyhjb25zdCB1
OA0KPit2aWRlb19jb2RlKQ0KPiB7DQo+IAlyZXR1cm4gZWRpZF9jZWFfbW9kZXNbdmlkZW9fY29k
ZV0ucGljdHVyZV9hc3BlY3RfcmF0aW87DQo+IH0NCj4tRVhQT1JUX1NZTUJPTChkcm1fZ2V0X2Nl
YV9hc3BlY3RfcmF0aW8pOw0KPg0KPiAvKg0KPiAgKiBDYWxjdWxhdGUgdGhlIGFsdGVybmF0ZSBj
bG9jayBmb3IgSERNSSBtb2RlcyAodGhvc2UgZnJvbSB0aGUgSERNSSB2ZW5kb3IgZGlmZiAtLQ0K
PmdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGlu
ZGV4DQo+Yjk3MTk0MThjM2QyLi5lZmNlNjc1YWJmMDcgMTAwNjQ0DQo+LS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2VkaWQuaA0KPisrKyBiL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgNCj5AQCAtNDgxLDcg
KzQ4MSw2IEBAIGludCBkcm1fYWRkX2VkaWRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciwNCj5zdHJ1Y3QgZWRpZCAqZWRpZCk7ICBpbnQgZHJtX2FkZF9vdmVycmlkZV9lZGlk
X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yDQo+KmNvbm5lY3Rvcik7DQo+DQo+IHU4IGRybV9t
YXRjaF9jZWFfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqdG9fbWF0Y2gpOyAt
ZW51bQ0KPmhkbWlfcGljdHVyZV9hc3BlY3QgZHJtX2dldF9jZWFfYXNwZWN0X3JhdGlvKGNvbnN0
IHU4IHZpZGVvX2NvZGUpOyAgYm9vbA0KPmRybV9kZXRlY3RfaGRtaV9tb25pdG9yKHN0cnVjdCBl
ZGlkICplZGlkKTsgIGJvb2wNCj5kcm1fZGV0ZWN0X21vbml0b3JfYXVkaW8oc3RydWN0IGVkaWQg
KmVkaWQpOyAgZW51bSBoZG1pX3F1YW50aXphdGlvbl9yYW5nZQ0KPi0tDQo+Mi4yMS4wDQo+DQo+
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5kcmktZGV2
ZWwgbWFpbGluZyBsaXN0DQo+ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
