Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939623CB43
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 15:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EE189B7D;
	Wed,  5 Aug 2020 13:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC836E7D4;
 Wed,  5 Aug 2020 13:46:35 +0000 (UTC)
IronPort-SDR: YBCRsUymQ2pHlqwMPZbKZzmw7Q0xFvUZuPeBMs3L6PgUL/BmsGy2c56cEgsBUq/WHuyGyj3NBz
 d7lO3fSi7snw==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="132094575"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="132094575"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:46:34 -0700
IronPort-SDR: AqcGUjyp/OOTbzwAuo8AnSXS3eOQIu+5t11SaMggX3Yj8eDYRA+hZmXSfvnXXefRg9oYH9vSkD
 Ax0XVAngnGjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="467470607"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.203.73])
 ([10.215.203.73])
 by orsmga005.jf.intel.com with ESMTP; 05 Aug 2020 06:46:31 -0700
Subject: Re: [PATCH v5 1/5] drm/i915: Add enable/disable flip done and flip
 done handler
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <20200720113117.16131-2-karthik.b.s@intel.com>
 <d67715965a3de220137db377953da700944e89e6.camel@intel.com>
 <f00f637e-639e-5d12-83bd-274ad0a23abe@daenzer.net>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <377c8569-cc3b-e1a8-3d1c-5a6cc9bfd99b@intel.com>
Date: Wed, 5 Aug 2020 19:16:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f00f637e-639e-5d12-83bd-274ad0a23abe@daenzer.net>
Content-Language: en-US
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 nicholas.kazlauskas@amd.com, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA3LzI3LzIwMjAgNTo1NyBQTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gT24gMjAyMC0w
Ny0yNSAxOjI2IGEubS4sIFBhdWxvIFphbm9uaSB3cm90ZToKPj4gRW0gc2VnLCAyMDIwLTA3LTIw
IMOgcyAxNzowMSArMDUzMCwgS2FydGhpayBCIFMgZXNjcmV2ZXU6Cj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jCj4+PiBpbmRleCAxZmE2NzcwMGQ4ZjQuLjk1OTUzYjM5Mzk0MSAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPj4+IEBAIC02OTcsMTQgKzY5NywyNCBAQCB1MzIg
aTkxNV9nZXRfdmJsYW5rX2NvdW50ZXIoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+Pj4gICAJcmV0
dXJuICgoKGhpZ2gxIDw8IDgpIHwgbG93KSArIChwaXhlbCA+PSB2Ymxfc3RhcnQpKSAmIDB4ZmZm
ZmZmOwo+Pj4gICB9Cj4+PiAgIAo+Pj4gK3N0YXRpYyB1MzIgZzR4X2dldF9mbGlwX2NvdW50ZXIo
c3RydWN0IGRybV9jcnRjICpjcnRjKQo+Pj4gK3sKPj4+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmRldl9wcml2ID0gdG9faTkxNShjcnRjLT5kZXYpOwo+Pj4gKwllbnVtIHBpcGUgcGlwZSA9
IHRvX2ludGVsX2NydGMoY3J0YyktPnBpcGU7Cj4+PiArCj4+PiArCXJldHVybiBJOTE1X1JFQUQo
UElQRV9GTElQQ09VTlRfRzRYKHBpcGUpKTsKPj4+ICt9Cj4+PiArCj4+PiAgIHUzMiBnNHhfZ2V0
X3ZibGFua19jb3VudGVyKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPj4+ICAgewo+Pj4gICAJc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShjcnRjLT5kZXYpOwo+Pj4g
ICAJZW51bSBwaXBlIHBpcGUgPSB0b19pbnRlbF9jcnRjKGNydGMpLT5waXBlOwo+Pj4gICAKPj4+
ICsJaWYgKGNydGMtPnN0YXRlLT5hc3luY19mbGlwKQo+Pj4gKwkJcmV0dXJuIGc0eF9nZXRfZmxp
cF9jb3VudGVyKGNydGMpOwo+Pj4gKwo+Pj4gICAJcmV0dXJuIEk5MTVfUkVBRChQSVBFX0ZSTUNP
VU5UX0c0WChwaXBlKSk7Cj4+Cj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgaW50ZW50aW9uIGJl
aGluZCB0aGlzLCBjYW4geW91IHBsZWFzZSBjbGFyaWZ5Pwo+PiBUaGlzIGdvZXMgYmFjayB0byBt
eSByZXBseSBvZiB0aGUgY292ZXIgbGV0dGVyLiBJdCBzZWVtcyB0aGF0IGhlcmUKPj4gd2UncmUg
Z29pbmcgdG8gYWx0ZXJuYXRlIGJldHdlZW4gdHdvIGRpZmZlcmVudCBjb3VudGVycyBpbiBvdXIg
dmJsYW5rCj4+IGNvdW50LiBTbyBpZiB1c2VyIHNwYWNlIGFsdGVybmF0ZXMgYmV0d2VlbiBzb21l
dGltZXMgdXNpbmcgYXN5bmMgZmxpcHMKPj4gYW5kIHNvbWV0aW1lcyB1c2luZyBub3JtYWwgZmxp
cCBpdCdzIGdvaW5nIHRvIGdldCBzb21lIHZlcnkgd2VpcmQKPj4gZGVsdGFzLCBpc24ndCBpdD8g
QXQgbGVhc3QgdGhpcyBpcyB3aGF0IEkgcmVtZW1iZXIgZnJvbSB3aGVuIEkgcGxheWVkCj4+IHdp
dGggdGhlc2UgcmVnaXN0ZXJzOiBGTElQQ09VTlQgZHJpZnRzIGF3YXkgZnJvbSBGUk1DT1VOVCB3
aGVuIHdlIHN0YXJ0Cj4+IHVzaW5nIGFzeW5jIGZsaXBzLgo+IAo+IFRoaXMgZGVmaW5pdGVseSBs
b29rcyB3cm9uZy4gVGhlIGNvdW50ZXIgdmFsdWUgcmV0dXJuZWQgYnkgdGhlCj4gZ2V0X3ZibGFu
a19jb3VudGVyIGhvb2sgaXMgc3VwcG9zZWQgdG8gaW5jcmVtZW50IHdoZW4gYSB2ZXJ0aWNhbCBi
bGFuawo+IHBlcmlvZCBvY2N1cnM7IHBhZ2UgZmxpcHMgYXJlIG5vdCBzdXBwb3NlZCB0byBhZmZl
Y3QgdGhpcyBpbiBhbnkgd2F5Lgo+IAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgpBcyBwZXIgdGhl
IGZlZWRiYWNrIHJlY2VpdmVkLCBJIHdpbGwgYmUgcmVtb3ZpbmcgdGhpcyBhbmQgd2lsbCByZXZl
cnQgCmJhY2sgdG8gdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIGluIHRoZSBuZXh0IHJldmlz
aW9uLgoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
