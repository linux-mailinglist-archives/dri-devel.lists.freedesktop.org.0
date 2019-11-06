Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0052AF0AE2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 01:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08C6EB90;
	Wed,  6 Nov 2019 00:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03C6EB90
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 00:08:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 16:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="200947698"
Received: from brianwel-mobl1.amr.corp.intel.com (HELO [10.24.15.137])
 ([10.24.15.137])
 by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2019 16:08:22 -0800
Subject: Re: [RFC PATCH] cgroup: Document interface files and rationale for
 DRM controller
To: Tejun Heo <tj@kernel.org>
References: <20191104220847.23283-1-brian.welty@intel.com>
 <20191105001505.GR3622521@devbig004.ftw2.facebook.com>
From: Brian Welty <brian.welty@intel.com>
Message-ID: <d565fc2c-0bd0-a85a-c7ce-12ee5393154d@intel.com>
Date: Tue, 5 Nov 2019 16:08:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105001505.GR3622521@devbig004.ftw2.facebook.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Kenny Ho <Kenny.Ho@amd.com>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzQvMjAxOSA0OjE1IFBNLCBUZWp1biBIZW8gd3JvdGU6Cj4gT24gTW9uLCBOb3YgMDQs
IDIwMTkgYXQgMDU6MDg6NDdQTSAtMDUwMCwgQnJpYW4gV2VsdHkgd3JvdGU6Cj4+ICsgIGdwdXNl
dC51bml0cwo+PiArICBncHVzZXQudW5pdHMuZWZmZWN0aXZlCj4+ICsgIGdwdXNldC51bml0cy5w
YXJ0aXRpb24KPj4gKwo+PiArICBncHVzZXQubWVtcwo+PiArICBncHVzZXQubWVtcy5lZmZlY3Rp
dmUKPj4gKyAgZ3B1c2V0Lm1lbXMucGFydGl0aW9uCj4+ICsKPj4gKyAgc2NoZWQubWF4Cj4+ICsg
IHNjaGVkLnN0YXRzCj4+ICsgIHNjaGVkLndlaWdodAo+PiArICBzY2hlZC53ZWlnaHQubmljZQo+
PiArCj4+ICsgIG1lbW9yeS5jdXJyZW50Cj4+ICsgIG1lbW9yeS5ldmVudHMKPj4gKyAgbWVtb3J5
LmhpZ2gKPj4gKyAgbWVtb3J5Lmxvdwo+PiArICBtZW1vcnkubWF4Cj4+ICsgIG1lbW9yeS5taW4K
Pj4gKyAgbWVtb3J5LnN0YXQKPj4gKyAgbWVtb3J5LnN3YXAuY3VycmVudAo+PiArICBtZW1vcnku
c3dhcC5tYXgKPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IG5lZWRzIHRvIHJlcGxpY2F0
ZSBlc3NlbnRpYWxseSAqYWxsKiB0aGUKPiBpbnRlcmZhY2VzIHRoYXQgc3lzdGVtIHJlc291cmNl
cyBhcmUgaW1wbGVtZW50aW5nIGZyb20gdGhlIGdldC1nby4KPiBTb21lIG9mIHRoZSBhYm92ZSBo
YXZlIGludGVyc2VjdGluZyBmdW5jdGlvbmFsaXRpZXMgYW5kIGV4aXN0IG1vcmUgZm9yCj4gaGlz
dG9yaWNhbCByZWFzb25zIGFuZCBJIGZhaWwgdG8gc2VlIGhvdyBkaXN0aW5jdGlvbnMgbGlrZSBt
aW4gdnMuIGxvdwo+IGFuZCBoaWdoIHZzLiBtYXggd291bGQgbWFrZSBzZW5zZSBmb3IgZ3B1cy4g
IEFsc28sIHdoeSB3b3VsZCBpdCBoYXZlIGEKPiBzZXBhcmF0ZSBzd2FwIGxpbWl0IG9mIGl0cyBv
d24/Cj4gCj4gUGxlYXNlIHN0YXJ0IHdpdGggc29tZXRoaW5nIHNtYWxsIGFuZCBpbnR1aXRpdmUu
ICBJJ20gZ29ubmEgbmFjawo+IGFueXRoaW5nIHdoaWNoIHNwcmF3bHMgb3V0IGxpa2UgdGhpcy4g
IE1vc3QgbGlrZWx5LCB0aGVyZSdzIHN0aWxsIGEKPiB0b24geW91IGd1eXMgbmVlZCB0byB3b3Jr
IHRocm91Z2ggdG8gcmVhY2ggdGhlIHJlc291cmNlIG1vZGVsIHdoaWNoIGlzCj4gYWN0dWFsbHkg
dXNlZnVsIGFuZCB0cnlpbmcgdG8gZGVmaW5lIGEgY29tcHJlaGVuc2l2ZSBpbnRlcmZhY2UgdXBm
cm9udAo+IGxpa2UgdGhpcyBpcyBnb25uYSBsb29rIHJlYWxseSBzaWxseSBhbmQgd2lsbCBiZWNv
bWUgYW4gdWdseSBkcmFnIGJ5Cj4gdGhlIHRpbWUgdGhlIHByb2JsZW0gc3BhY2UgaXMgYWN0dWFs
bHkgdW5kZXJzdG9vZC4KPiAKPiBJdCBkb2Vzbid0IHNlZW0gbGlrZSB0aGlzIGlzIGNvbWluZyB0
aHJvdWdoIGJ1dCBjYW4geW91IHBsZWFzZSBzdGFydAo+IHdpdGggYSBzaW1wbGUgd2VpZ2h0IGtu
b2I/Cj4gCj4gVGhhbmtzLgo+IAoKVGhhbmtzIFRlanVuIGZvciB0aGUgZmVlZGJhY2suCkkgd2Fz
IG1vcmUgaW50ZXJlc3RlZCBpbiBoZWFyaW5nIHlvdXIgdGhvdWdodHMgb24gd2hldGhlciB5b3Ug
bGlrZQp0aGUgYXBwcm9hY2ggdG8gaGF2ZSBhIHNldCBvZiBjb250cm9scyB0aGF0IGFyZSBjb25z
aXN0ZW50IHdpdGggCnNvbWUgc3Vic2V0IG9mIHRoZSBleGlzdGluZyBDUFUvTUVNIG9uZXMuICBB
bnkgZmVlZGJhY2sgb24gdGhpcz8KRGlkbid0IHJlYWxseSBtZWFuIHRvIHN1Z2dlc3QgdGhhdCBh
bGwgb2YgdGhlc2Ugd291bGQgYmUgaW5jbHVkZWQKZnJvbSB0aGUgc3RhcnQuCgpXb3VsZCB5b3Ug
YWdyZWUgdGhhdCB0aGlzIHJlZHVjZWQgc2V0IGlzIGEgcmVhc29uYWJsZSBzdGFydGluZyBwb2lu
dD8KKyAgc2NoZWQud2VpZ2h0CisgIG1lbW9yeS5jdXJyZW50CisgIG1lbW9yeS5tYXgKClRob3Vn
aHRzIG9uIHdoZXRoZXIgdGhpcyBzaG91bGQgYmUgdmVyeSBHUFUtc3BlY2lmaWMgY2dyb3VwcyBj
b250cm9sbGVyCm9yIHNob3VsZCBiZSBtb3JlIGZvcndhcmQgdGhpbmtpbmcgdG8gYmUgdXNlZnVs
IGZvciBvdGhlciAnYWNjZWxlcmF0b3InCnR5cGUgZGV2aWNlcyBhcyB3ZWxsPwoKVGhhbmtzLAot
QnJpYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
