Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5310794A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 21:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A476F562;
	Fri, 22 Nov 2019 20:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDED6F55C;
 Fri, 22 Nov 2019 20:12:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 12:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,231,1571727600"; d="scan'208";a="201638517"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga008.jf.intel.com with ESMTP; 22 Nov 2019 12:12:42 -0800
Date: Fri, 22 Nov 2019 12:01:17 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191122200116.GA14488@nvishwa1-DESK.sc.intel.com>
References: <20191122195452.14346-1-niranjana.vishwanathapura@intel.com>
 <20191122195452.14346-7-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122195452.14346-7-niranjana.vishwanathapura@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: sanjay.k.kumar@intel.com, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, dave.hansen@intel.com, jglisse@redhat.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, jgg@mellanox.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6NTQ6NDVBTSAtMDgwMCwgTmlyYW5qYW5hIFZpc2h3
YW5hdGhhcHVyYSB3cm90ZToKPlVzZSBITU0gcGFnZSB0YWJsZSBtaXJyb3Jpbmcgc3VwcG9ydCB0
byBidWlsZCBkZXZpY2UgcGFnZSB0YWJsZS4KPkltcGxlbWVudCB0aGUgYmluZCBpb2N0bCBhbmQg
YmluZCB0aGUgcHJvY2VzcyBhZGRyZXNzIHJhbmdlIGluIHRoZQo+c3BlY2lmaWVkIGNvbnRleHQn
cyBwcGd0dC4KPkhhbmRsZSBpbnZhbGlkYXRpb24gbm90aWZpY2F0aW9ucyBieSB1bmJpbmRpbmcg
dGhlIGFkZHJlc3MgcmFuZ2UuCj4KPkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5l
bkBsaW51eC5pbnRlbC5jb20+Cj5DYzogSm9uIEJsb29tZmllbGQgPGpvbi5ibG9vbWZpZWxkQGlu
dGVsLmNvbT4KPkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPkNj
OiBTdWRlZXAgRHV0dCA8c3VkZWVwLmR1dHRAaW50ZWwuY29tPgo+U2lnbmVkLW9mZi1ieTogTmly
YW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5j
b20+Cj4tLS0KPitpbnQgaTkxNV9zdm1fYmluZF9tbShzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNl
ICp2bSkKPit7Cj4rCXN0cnVjdCBpOTE1X3N2bSAqc3ZtOwo+KwlzdHJ1Y3QgbW1fc3RydWN0ICpt
bTsKPisJaW50IHJldCA9IDA7Cj4rCj4rCW1tID0gZ2V0X3Rhc2tfbW0oY3VycmVudCk7Cj4rCWRv
d25fd3JpdGUoJm1tLT5tbWFwX3NlbSk7Cj4rCW11dGV4X2xvY2soJnZtLT5zdm1fbXV0ZXgpOwo+
KwlpZiAodm0tPnN2bSkKPisJCWdvdG8gYmluZF9vdXQ7Cj4rCj4rCXN2bSA9IGt6YWxsb2Moc2l6
ZW9mKCpzdm0pLCBHRlBfS0VSTkVMKTsKPisJaWYgKCFzdm0pIHsKPisJCXJldCA9IC1FTk9NRU07
Cj4rCQlnb3RvIGJpbmRfb3V0Owo+Kwl9Cj4rCXN2bS0+bWlycm9yLm9wcyA9ICZpOTE1X21pcnJv
cl9vcHM7Cj4rCW11dGV4X2luaXQoJnN2bS0+bXV0ZXgpOwo+KwlrcmVmX2luaXQoJnN2bS0+cmVm
KTsKPisJc3ZtLT5tbSA9IG1tOwo+Kwlzdm0tPnZtID0gdm07Cj4rCj4rCXJldCA9IGhtbV9taXJy
b3JfcmVnaXN0ZXIoJnN2bS0+bWlycm9yLCBtbSk7CgpJIHNhdyB0aGF0IHRoZXNlIEFQSXMgaGF2
ZSBiZWVuIHJlbW92ZWQuCkkgd2lsbCB1cGRhdGUgb25jZSBpdCBnZXRzIGluY2x1ZGVkIGluIGtl
cm5lbCByZWxlYXNlLgoKTmlyYW5qYW5hIAoKPisJaWYgKHJldCkKPisJCWdvdG8gYmluZF9vdXQ7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
