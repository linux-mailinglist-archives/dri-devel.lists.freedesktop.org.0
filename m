Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7811E73F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 15:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAF76E8D3;
	Mon, 28 Oct 2019 14:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A432C6E8D3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 14:48:04 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F12C460E0D; Mon, 28 Oct 2019 14:48:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA26760E06;
 Mon, 28 Oct 2019 14:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA26760E06
Date: Mon, 28 Oct 2019 08:47:58 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs nodes
Message-ID: <20191028144758.GB7966@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Yiwei Zhang <zzyiwei@google.com>,
 dri-devel@lists.freedesktop.org, Alistair Delva <adelva@google.com>,
 Chris Forbes <chrisforbes@google.com>,
 Prahlad Kilambi <prahladk@google.com>, seanpaul@chromium.org,
 kraxel@redhat.com
References: <CAKT=dD=vYi_41WBAZfcb7cU5SZUkj88OmhCSyfnNdT45qzhPwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKT=dD=vYi_41WBAZfcb7cU5SZUkj88OmhCSyfnNdT45qzhPwg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572274084;
 bh=g8D6vVTPO/OUX5uZ8fw3J86SfaG2MFkYKMtnK7m3xUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZUwO/JlvhPjrgu+ONg26vkVTSGTob9jCc72CVlyAd6R8XX2B1GJthDy63raYH3FQX
 TeJKLHHnBJzbZH8u4hraQBqCA2E/Pmn/OmP3EeOaTDEc5bxD6hM1YqfhJcsQ0fQ8bE
 2/iD5Ee/6wS+zexxN2YkcTdZN4PuDhx88OLvp2bw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572274081;
 bh=g8D6vVTPO/OUX5uZ8fw3J86SfaG2MFkYKMtnK7m3xUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m9RwOu3l8RoGovIKhl9A5Jqgk2sVDeRvze1uL9t9aWdk+JjIIqg6xy7PvAH0nF5fj
 Lv23TmFVBWq7nFAPcW1GrCja2AgROM2BwnGMIaJqL+SszmMhfclkg6zCIUuZ5QpyxL
 nWU1dt6cKcIQVMnSCQyZwAjDj2Q5ZyBemXVlO+4I=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Alistair Delva <adelva@google.com>, dri-devel@lists.freedesktop.org,
 Prahlad Kilambi <prahladk@google.com>, seanpaul@chromium.org,
 kraxel@redhat.com, Chris Forbes <chrisforbes@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6MDA6NThBTSAtMDcwMCwgWWl3ZWkgWmhhbmcgd3Jv
dGU6Cj4gSGkgZm9sa3MsCj4gCj4gVGhpcyBpcyBZaXdlaSBmcm9tIHRoZSBBbmRyb2lkIFBsYXRm
b3JtIEdyYXBoaWNzIHRlYW0uIE9uIHRoZSBkb3duc3RyZWFtCj4gQW5kcm9pZCwgdmVuZG9ycyB1
c2VkIHRvIHJlcG9ydCBHUFUgcHJpdmF0ZSBtZW1vcnkgYWxsb2NhdGlvbnMgd2l0aCBkZWJ1Z2Zz
Cj4gbm9kZXMgaW4gdGhlaXIgb3duIGZvcm1hdHMuIEhvd2V2ZXIsIGRlYnVnZnMgbm9kZXMgYXJl
IGdldHRpbmcgZGVwcmVjYXRlZAo+IGluIHRoZSBuZXh0IEFuZHJvaWQgcmVsZWFzZSwgc28gd2Ug
YXJlIHRha2luZyB0aGUgY2hhbmNlIHRvIHVuaWZ5IGFsbCB0aGUKPiB2ZW5kb3JzIHRvIG1pZ3Jh
dGUgdGhlaXIgZXhpc3RpbmcgZGVidWdmcyBub2RlcyBpbnRvIGEgc3RhbmRhcmRpemVkIHN5c2Zz
Cj4gbm9kZSBzdHJ1Y3R1cmUuIFRoZW4gdGhlIHBsYXRmb3JtIGlzIGFibGUgdG8gZG8gYSBidW5j
aCBvZiB1c2VmdWwKPiB0aGluZ3M6IG1lbW9yeSBwcm9maWxpbmcsIHN5c3RlbSBoZWFsdGggY292
ZXJhZ2UsIGZpZWxkIG1ldHJpY3MsIGxvY2FsCj4gc2hlbGwgZHVtcCwgaW4tYXBwIGFwaSwgZXRj
Lgo+IAo+IFNvbWUgdmVuZG9ycyB0ZW5kIHRvIGRvIGEgbG90IG9mIHVwc3RyZWFtcywgc28gd2Ug
YXJlIGFsc28gc2Vla2luZyB0aGUKPiB1cHN0cmVhbSBwb3NzaWJpbGl0aWVzIGhlcmUgaW5zdGVh
ZCBvZiBtYWtpbmcgaXQgYW4gQW5kcm9pZCBvbmx5IHRoaW5nLgo+IAo+IEF0dGFjaGVkIGFyZSBz
Y3JlZW5zaG90cyBmb3IgdGhlIG5vZGUgc3RydWN0dXJlIHdlIGRyYWZ0ZWQgYW5kIGFuIGV4YW1w
bGUKPiBmb3IgdGhhdC4KPiAKPiBGb3IgdGhlIHRvcCBsZXZlbCByb290LCB2ZW5kb3JzIGNhbiBj
aG9vc2UgdGhlaXIgb3duIG5hbWVzIGJhc2VkIG9uIHRoZQo+IHZhbHVlIG9mIHJvLmdmeC5zeXNm
cy4wIHRoZSB2ZW5kb3JzIHNldC4KPiAKPiAgICAtIEZvciB0aGUgbXVsdGlwbGUgZ3B1IGRyaXZl
ciBjYXNlcywgd2UgY2FuIHVzZSByby5nZnguc3lzZnMuMSwKPiAgICByby5nZnguc3lzZnMuMiBm
b3IgdGhlIDJuZCBhbmQgM3JkIEtNRHMuCj4gICAgLSBJdCdzIGFsc28gYWxsb3dlZCB0byBwdXQg
c29tZSBzdWItZGlyIGZvciBleGFtcGxlICJrZ3NsL2dwdV9tZW0iIG9yCj4gICAgIm1hbGkwL2dw
dV9tZW0iIGluIHRoZSByby5nZnguc3lzZnMuPGNoYW5uZWw+IHByb3BlcnR5IGlmIHRoZSByb290
IG5hbWUKPiAgICB1bmRlciAvc3lzL2RldmljZXMvIGlzIGFscmVhZHkgY3JlYXRlZCBhbmQgdXNl
ZCBmb3Igb3RoZXIgcHVycG9zZXMuCj4gCj4gCj4gRm9yIHRoZSAybmQgbGV2ZWwgcGlkcywgdGhl
cmUgYXJlIHVzdWFsbHkganVzdCBhIGNvdXBsZSBvZiB0aGVtIHBlcgo+IHNuYXBzaG90LCBzaW5j
ZSB3ZSBvbmx5IHRha2VzIHNuYXBzaG90IGZvciB0aGUgYWN0aXZlIG9uZXMuCj4gCj4gRm9yIHRo
ZSAzcmQgbGV2ZWwgdHlwZXMsIHRoZSB0eXBlIG5hbWUgd2lsbCBiZSBvbmUgb2YgdGhlIEdQVSBt
ZW1vcnkgb2JqZWN0Cj4gdHlwZXMgaW4gbG93ZXIgY2FzZSwgYW5kIHRoZSB2YWx1ZSB3aWxsIGJl
IGEgY29tbWEgc2VwYXJhdGVkIHNlcXVlbmNlIG9mCj4gc2l6ZSB2YWx1ZXMgZm9yIGFsbCB0aGUg
YWxsb2NhdGlvbnMgdW5kZXIgdGhhdCBzcGVjaWZpYyB0eXBlLgo+IAo+ICAgIC0gRm9yIHRoZSBH
UFUgbWVtb3J5IG9iamVjdCB0eXBlcywgd2UgZGVmaW5lZCA5IGRpZmZlcmVudCB0eXBlcyBmb3IK
PiAgICBBbmRyb2lkOgo+ICAgICAgIC0gICAgIC8vIG5vdCBhY2NvdW50ZWQgZm9yIGluIGFueSBv
dGhlciBjYXRlZ29yeQo+ICAgICAgICAgICBVTktOT1dOID0gMDsKPiAgICAgICAgICAgLy8gc2hh
ZGVyIGJpbmFyaWVzCj4gICAgICAgICAgIFNIQURFUiA9IDE7Cj4gICAgICAgICAgIC8vIGFsbG9j
YXRpb25zIHdoaWNoIGhhdmUgYSBsaWZldGltZSBzaW1pbGFyIHRvIGEgVmtDb21tYW5kQnVmZmVy
Cj4gICAgICAgICAgIENPTU1BTkQgPSAyOwo+ICAgICAgICAgICAvLyBiYWNraW5nIGZvciBWa0Rl
dmljZU1lbW9yeQo+ICAgICAgICAgICBWVUxLQU4gPSAzOwo+ICAgICAgICAgICAvLyBHTCBUZXh0
dXJlIGFuZCBSZW5kZXJCdWZmZXIKPiAgICAgICAgICAgR0xfVEVYVFVSRSA9IDQ7Cj4gICAgICAg
ICAgIC8vIEdMIEJ1ZmZlcgo+ICAgICAgICAgICBHTF9CVUZGRVIgPSA1Owo+ICAgICAgICAgICAv
LyBiYWNraW5nIGZvciBxdWVyeQo+ICAgICAgICAgICBRVUVSWSA9IDY7Cj4gICAgICAgICAgIC8v
IGFsbG9jYXRpb25zIHdoaWNoIGhhdmUgYSBsaWZldGltZSBzaW1pbGFyIHRvIGEgVmtEZXNjcmlw
dG9yU2V0Cj4gICAgICAgICAgIERFU0NSSVBUT1IgPSA3Owo+ICAgICAgICAgICAvLyByYW5kb20g
dHJhbnNpZW50IHRoaW5ncyB0aGF0IHRoZSBkcml2ZXIgbmVlZHMKPiAgICAgICAgICAgVFJBTlNJ
RU5UID0gODsKPiAgICAgICAtIFdlIGFyZSB3b25kZXJpbmcgaWYgdGhvc2UgdHlwZSBlbnVtZXJh
dGlvbnMgbWFrZSBzZW5zZSB0byB0aGUKPiAgICAgICB1cHN0cmVhbSBzaWRlIGFzIHdlbGwsIG9y
IG1heWJlIHdlIGp1c3QgZGVhbCB3aXRoIG91ciBvd24gZGlmZmVyZW50IHR5cGUKPiAgICAgICBz
ZXRzLiBDdXogb24gdGhlIEFuZHJvaWQgc2lkZSwgd2UnbGwganVzdCByZWFkIHRob3NlIG5vZGVz
IG5hbWVkCj4gYWZ0ZXIgdGhlCj4gICAgICAgdHlwZXMgd2UgZGVmaW5lZCBpbiB0aGUgc3lzZnMg
bm9kZSBzdHJ1Y3R1cmUuCj4gICAgLSBUaGUgbm9kZSB2YWx1ZSBjYW4gYmU6IDQwOTYsODE5MjAs
Li4uLDQwOTYKPiAKPiAKPiBMb29raW5nIGZvcndhcmQgdG8gYW55IGNvbmNlcm5zL2NvbW1lbnRz
L3N1Z2dlc3Rpb25zIQoKSGkgWWl3ZWkuCgpUaGlzIGlzIGFuIGltcG9ydGFudCBkaXNjdXNzaW9u
IHRoYXQgSSB0aGluayB3ZSBuZWVkIHRvIGhhdmUgYnV0IG1hbnkgb2YgdXMgdXNlCnRleHQgYmFz
ZWQgZW1haWwgY2xpZW50cyBhbmQgUE5HIGF0dGFjaG1lbnRzIGFyZSBjbHVtc3kuIEl0IG1pZ2h0
IGhlbHAgbW92ZSB0aGUKZGlzY3Vzc2lvbiBhbG9uZyBpZiB5b3UgZGVzY3JpYmVkIHRoZSBzdWdn
ZXN0ZWQgaW50ZXJmYWNlcyBpbiB0ZXh0IChib251czogdGhpcwpjb3VsZCBiZSB0aGUgc3RhcnQg
b2YgdGhlIC5yc3QgZG9jdW1lbnRhdGlvbikgb3IgcHJvdmlkZWQgYSBsaW5rIHRvIGEgY2xvdWQK
ZG9jdW1lbnQgdGhhdCB3ZSBjb3VsZCBwZXJ1c2UuCgpUaGFua3MsCgotLSAKVGhlIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVt
LAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
