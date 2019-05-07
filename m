Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60816BB2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724E589E98;
	Tue,  7 May 2019 19:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B589DDF;
 Tue,  7 May 2019 19:50:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 12:50:51 -0700
X-ExtLoop1: 1
Received: from brianwel-mobl1.amr.corp.intel.com (HELO [10.144.155.123])
 ([10.144.155.123])
 by orsmga004.jf.intel.com with ESMTP; 07 May 2019 12:50:50 -0700
Subject: Re: [RFC PATCH 0/5] cgroup support for GPU devices
To: Tejun Heo <tj@kernel.org>
References: <20190501140438.9506-1-brian.welty@intel.com>
 <20190506152643.GL374014@devbig004.ftw2.facebook.com>
From: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <cf58b047-d678-ad89-c9b6-96fc6b01c1d7@intel.com>
Date: Tue, 7 May 2019 12:50:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190506152643.GL374014@devbig004.ftw2.facebook.com>
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
 kenny.ho@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Li Zefan <lizefan@huawei.com>, Vladimir Davydov <vdavydov.dev@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 RDMA mailing list <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvNi8yMDE5IDg6MjYgQU0sIFRlanVuIEhlbyB3cm90ZToKPiBIZWxsbywKPiAKPiBPbiBX
ZWQsIE1heSAwMSwgMjAxOSBhdCAxMDowNDozM0FNIC0wNDAwLCBCcmlhbiBXZWx0eSB3cm90ZToK
Pj4gVGhlIHBhdGNoIHNlcmllcyBlbmFibGVzIGRldmljZSBkcml2ZXJzIHRvIHVzZSBjZ3JvdXBz
IHRvIGNvbnRyb2wgdGhlCj4+IGZvbGxvd2luZyByZXNvdXJjZXMgd2l0aGluIGEgR1BVIChvciBv
dGhlciBhY2NlbGVyYXRvciBkZXZpY2UpOgo+PiAqICBjb250cm9sIGFsbG9jYXRpb24gb2YgZGV2
aWNlIG1lbW9yeSAocmV1c2Ugb2YgbWVtY2cpCj4+IGFuZCB3aXRoIGZ1dHVyZSB3b3JrLCB3ZSBj
b3VsZCBleHRlbmQgdG86Cj4+ICogIHRyYWNrIGFuZCBjb250cm9sIHNoYXJlIG9mIEdQVSB0aW1l
IChyZXVzZSBvZiBjcHUvY3B1YWNjdCkKPj4gKiAgYXBwbHkgbWFzayBvZiBhbGxvd2VkIGV4ZWN1
dGlvbiBlbmdpbmVzIChyZXVzZSBvZiBjcHVzZXRzKQo+Pgo+PiBJbnN0ZWFkIG9mIGludHJvZHVj
aW5nIGEgbmV3IGNncm91cCBzdWJzeXN0ZW0gZm9yIEdQVSBkZXZpY2VzLCBhIG5ldwo+PiBmcmFt
ZXdvcmsgaXMgcHJvcG9zZWQgdG8gYWxsb3cgZGV2aWNlcyB0byByZWdpc3RlciB3aXRoIGV4aXN0
aW5nIGNncm91cAo+PiBjb250cm9sbGVycywgd2hpY2ggY3JlYXRlcyBwZXItZGV2aWNlIGNncm91
cF9zdWJzeXNfc3RhdGUgd2l0aGluIHRoZQo+PiBjZ3JvdXAuICBUaGlzIGdpdmVzIGRldmljZSBk
cml2ZXJzIHRoZWlyIG93biBwcml2YXRlIGNncm91cCBjb250cm9scwo+PiAoc3VjaCBhcyBtZW1v
cnkgbGltaXRzIG9yIG90aGVyIHBhcmFtZXRlcnMpIHRvIGJlIGFwcGxpZWQgdG8gZGV2aWNlCj4+
IHJlc291cmNlcyBpbnN0ZWFkIG9mIGhvc3Qgc3lzdGVtIHJlc291cmNlcy4KPj4gRGV2aWNlIGRy
aXZlcnMgKEdQVSBvciBvdGhlcikgYXJlIHRoZW4gYWJsZSB0byByZXVzZSB0aGUgZXhpc3Rpbmcg
Y2dyb3VwCj4+IGNvbnRyb2xzLCBpbnN0ZWFkIG9mIGludmVudGluZyBzaW1pbGFyIG9uZXMuCj4g
Cj4gSSdtIHJlYWxseSBza2VwdGljYWwgYWJvdXQgdGhpcyBhcHByb2FjaC4gIFdoZW4gY3JlYXRp
bmcgcmVzb3VyY2UKPiBjb250cm9sbGVycywgSSB0aGluayB3aGF0J3MgdGhlIG1vc3QgaW1wb3J0
YW50IGFuZCBjaGFsbGVuZ2luZyBpcwo+IGVzdGFibGlzaGluZyByZXNvdXJjZSBtb2RlbCAtIHdo
YXQgcmVzb3VyY2VzIGFyZSBhbmQgaG93IHRoZXkgY2FuIGJlCj4gZGlzdHJpYnV0ZWQuICBUaGlz
IHBhdGNoc2V0IGlzIGdvaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kIC0gYnVpbGRpbmcKPiBvdXQg
Y29yZSBpbmZyYXN0cnVjdHVyZSBmb3IgYm9saWVycGxhdGVzIGF0IGEgc2lnbmlmaWNhbnQgcmlz
ayBvZgo+IG1peGluZyB1cCByZXNvdXJjZSBtb2RlbHMgYWNyb3NzIGRpZmZlcmVudCB0eXBlcyBv
ZiByZXNvdXJjZXMuCj4gCj4gSU8gY29udHJvbGxlcnMgYWxyZWFkeSBpbXBsZW1lbnQgcGVyLWRl
dmljZSBjb250cm9scy4gIEknZCBzdWdnZXN0Cj4gZm9sbG93aW5nIHRoZSBzYW1lIGludGVyZmFj
ZSBjb252ZW50aW9ucyBhbmQgaW1wbGVtZW50aW5nIGEgZGVkaWNhdGVkCj4gY29udHJvbGxlciBm
b3IgdGhlIHN1YnN5c3RlbS4KPgpPa2F5LCB0aGFua3MgZm9yIGZlZWRiYWNrLiAgUHJlZmVyZW5j
ZSBpcyBjbGVhciB0byBzZWUgdGhpcyBkb25lIGFzCmRlZGljYXRlZCBjZ3JvdXAgY29udHJvbGxl
ci4KClBhcnQgb2YgbXkgcHJvcG9zYWwgd2FzIGFuIGF0dGVtcHQgZm9yIGRldmljZXMgd2l0aCAi
bWVtIGxpa2UiIGFuZCAiY3B1IApsaWtlIiBhdHRyaWJ1dGVzIHRvIGJlIG1hbmFnZWQgYnkgY29t
bW9uIGNvbnRyb2xsZXIuICAgV2UgY2FuIGlnbm9yZSB0aGlzCmlkZWEgZm9yIGNwdSBhdHRyaWJ1
dGVzLCBhcyB0aG9zZSBjYW4ganVzdCBnbyBpbiBhIEdQVSBjb250cm9sbGVyLgoKVGhlcmUgbWln
aHQgc3RpbGwgYmUgbWVyaXQgaW4gaGF2aW5nIGEgJ2RldmljZSBtZW0nIGNncm91cCBjb250cm9s
bGVyLgpUaGUgcmVzb3VyY2UgbW9kZWwgYXQgbGVhc3QgaXMgdGhlbiBubyBsb25nZXIgbWl4ZWQg
dXAgd2l0aCBob3N0IG1lbW9yeS4KUkRNQSBjb21tdW5pdHkgc2VlbWVkIHRvIGhhdmUgc29tZSBp
bnRlcmVzdCBpbiBhIGNvbW1vbiBjb250cm9sbGVyIGF0CmxlYXN0IGZvciBkZXZpY2UgbWVtb3J5
IGFzcGVjdHMuClRob3VnaHRzIG9uIHRoaXM/ICAgSSBiZWxpZXZlIGNvdWxkIHN0aWxsIHJldXNl
IHRoZSAnc3RydWN0IG1lbV9jZ3JvdXAnIGRhdGEKc3RydWN0dXJlLiAgVGhlcmUgc2hvdWxkIGJl
IHNvbWUgb3Bwb3J0dW5pdHkgdG8gcmV1c2UgY2hhcmdpbmcgQVBJcyBhbmQKaGF2ZSBzb21lIG5p
Y2UgaW50ZWdyYXRpb24gd2l0aCBITU0gZm9yIGNoYXJnaW5nIHRvIGRldmljZSBtZW1vcnksIGRl
cGVuZGluZwpvbiBiYWNraW5nIHN0b3JlLgoKLUJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
