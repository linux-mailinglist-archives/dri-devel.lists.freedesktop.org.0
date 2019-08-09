Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3B87A88
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973926E20F;
	Fri,  9 Aug 2019 12:53:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254D6E20F
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 12:53:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 05:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="186658460"
Received: from bvonhage-mobl2.ger.corp.intel.com (HELO [10.252.35.153])
 ([10.252.35.153])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2019 05:53:04 -0700
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "dri-devel@freedesktop.org" <dri-devel@freedesktop.org>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
 <156535104115.29541.10253048719287893942@skylake-alporthouse-com>
 <ee964f2a-088d-cce7-4040-0eff143d9b8b@intel.com>
 <cfdbfad3-f8b1-84a2-a9f5-a555e1505bc2@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <ecb26ec7-6b4d-e638-0084-9ab633aed020@intel.com>
Date: Fri, 9 Aug 2019 15:53:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cfdbfad3-f8b1-84a2-a9f5-a555e1505bc2@amd.com>
Content-Language: en-US
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDgvMjAxOSAxNToyNywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMDkuMDgu
MTkgdW0gMTQ6MjYgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPj4gT24gMDkvMDgvMjAxOSAx
NDo0NCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAo
MjAxOS0wOC0wOSAxMjozMDozMCkKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKPj4+PiBpbmRleCA4YTViMmY4ZjhlYjkuLjFj
ZTgzODUzZjk5NyAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oCj4+Pj4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaAo+Pj4+IEBAIC03ODUsNiArNzg1LDIyIEBAIHN0
cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAg
X191MzIgcGFkOwo+Pj4+ICDCoCB9Owo+Pj4+ICDCoCArc3RydWN0IGRybV9zeW5jb2JqX2JpbmFy
eV9hcnJheSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoCAvKiBBIHBvaW50ZXIgdG8gYW4gYXJyYXkgb2Yg
dTMyIHN5bmNvYmogaGFuZGxlcy4gKi8KPj4+PiArwqDCoMKgwqDCoMKgIF9fdTY0IGhhbmRsZXM7
Cj4+Pj4gK8KgwqDCoMKgwqDCoCAvKiBBIHBvaW50ZXIgdG8gYW4gYXJyYXkgb2YgdTMyIGFjY2Vz
cyBmbGFncyBmb3IgZWFjaAo+Pj4+IGhhbmRsZS4gKi8KPj4+PiArwqDCoMKgwqDCoMKgIF9fdTY0
IGFjY2Vzc19mbGFnczsKPj4+PiArwqDCoMKgwqDCoMKgIC8qIFRoZSBiaW5hcnkgdmFsdWUgb2Yg
YSBzeW5jb2JqIGlzIHJlYWQgYmVmb3JlIGl0IGlzCj4+Pj4gaW5jcmVtZW50ZWQuICovCj4+Pj4g
KyNkZWZpbmUgSTkxNV9EUk1fU1lOQ09CSl9CSU5BUllfSVRFTV9WQUxVRV9SRUFEICgxdSA8PCAw
KQo+Pj4+ICsjZGVmaW5lIEk5MTVfRFJNX1NZTkNPQkpfQklOQVJZX0lURU1fVkFMVUVfSU5DwqAg
KDF1IDw8IDEpCj4+PiBZb3UncmUgbm90IGluIEthbnNhcyBhbnltb3JlIDspCj4+PiAtQ2hyaXMK
Pj4+Cj4+IFdoaWNoIG1lYW5zPyA6KQo+IFlvdSBhcmUgaW4gY29tbW9uIERSTSBjb2RlLCBidXQg
dGhlIG5ldyBkZWZpbmVzIHN0YXJ0IHdpdGggSTkxNV8uLi4uCj4KPiBDaGVlcnMsCj4gQ2hyaXN0
aWFuLgoKCk9oIGRlYXIuLi4KCgotTGlvbmVsCgoKPgo+Pgo+PiAtTGlvbmVsCj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
