Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9D25026
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 15:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7EC8933E;
	Tue, 21 May 2019 13:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7608933E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 13:27:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 06:27:26 -0700
X-ExtLoop1: 1
Received: from delly.ld.intel.com (HELO [10.103.238.204]) ([10.103.238.204])
 by orsmga003.jf.intel.com with ESMTP; 21 May 2019 06:27:25 -0700
Subject: Re: drm-sync timeline signaling
To: zhoucm1 <zhoucm1@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <882a793c-cf49-8522-b1f3-cdb8dc685ea0@intel.com>
 <2e74c0a7-3b4e-c1ff-9b6c-33ebd7008b6b@intel.com>
 <cb50e114-f2e2-e8c7-e852-30bfb2fe9312@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <9c61a8ac-9b3b-f143-4ecd-dd90b6957418@intel.com>
Date: Tue, 21 May 2019 14:27:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cb50e114-f2e2-e8c7-e852-30bfb2fe9312@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIERhdmlkLAoKSW5pdGlhbGx5IEkgdGhvdWdodCB3ZSBjb3VsZCBydW4gaW50byB3YWl0
IGlzc3VlcyB3aXRoIGEgZG1hX2ZlbmNlX2NoYWluIAp3aXRoIGEgdmFsdWUgPSAwLCBidXQgeW91
J3JlIHJpZ2h0LCBpdCB3b3JrcyBmaW5lLgoKV2UgY291bGQganVzdCBhdm9pZCB0byBjcmVhdGUg
YSBkbWFfZmVuY2VfY2hhaW4gb2JqZWN0LCBidXQgbWF5YmUgd2UgCmRvbid0IGNhcmUuCgotTGlv
bmVsCgpPbiAyMS8wNS8yMDE5IDA5OjUxLCB6aG91Y20xIHdyb3RlOgo+IFNvcnJ5IGZvciBsYXRl
IHJlc3BvbnNlLgo+Cj4gQWx0aG91Z2ggd2UgZG9uJ3QgZXhwZWN0IHRoYXQsIGRybV9zeW5jb2Jq
X3RpbWVsaW5lX3NpZ25hbF9pb2N0bCAKPiBhbHJlYWR5IGhhbmRsZSB0aGlzIGNhc2UgSSB0aGlu
ay4gV2hpY2ggY2FuIGhhbmRsZSBib3RoIChwb2ludCB2YWx1ZSA+IAo+IDApIGFuZCAocG9pbnQg
dmFsdWUgPSAwKS4KPgo+Cj4gLURhdmlkCj4KPgo+IE9uIDIwMTnlubQwNeaciDIx5pelIDE2OjQ0
LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToKPj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+
Pgo+PiBQaW5nPwo+Pgo+PiBPbiAxNi8wNS8yMDE5IDE1OjQ5LCBMaW9uZWwgTGFuZHdlcmxpbiB3
cm90ZToKPj4+IEhpIGFsbCwKPj4+Cj4+PiBXaGlsZSBwaWNraW5nIHVwIHRoZSBJR1QgdGVzdHMg
Zm9yIHRpbWVsaW5lIHN5bmNvYmosCj4+PiBJIG5vdGljZWQgdGhhdCBhbHRob3VnaCB3ZSBkZWFs
IHdpdGggbXVsdGkgd2FpdCBhY3Jvc3MgYm90aCB0aW1lbGluZQo+Pj4gKHdpdGggcG9pbnQgdmFs
dWUgPiAwKSBhbmQgYmluYXJ5IChwb2ludCB2YWx1ZSA9IDApIHN5bmNvYmpzLAo+Pj4gd2UgZG9u
J3Qgc2VlbSB0byBoYXZlIGEgc2ltaWxhciBiZWhhdmlvciB3aXRoIHNpZ25hbGluZy4KPj4+Cj4+
PiBEbyB5b3UgaGF2ZSBhbnkgdGhvdWdodCBvbiB0aGlzPwo+Pj4gSSdtIGNvbnNpZGVyaW5nIHdy
aXRpbmcgc29tZSBkb2NzIGJ1dCBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0aGlzCj4+PiBk
aWZmZXJlbmNlIGJldHdlZW4gc2lnbmFsaW5nL3dhaXRpbmcgd2FzIGludGVudGlvbmFsIG9yIGp1
c3QgCj4+PiBvdmVybG9va2VkLgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiAtTGlvbmVsCj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
Pj4KPj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
