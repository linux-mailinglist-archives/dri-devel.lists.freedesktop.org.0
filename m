Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BAE741F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 15:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAC96E8D5;
	Mon, 28 Oct 2019 14:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2656C6E8D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 14:56:22 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F416D6049C; Mon, 28 Oct 2019 14:56:21 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 74524602DA;
 Mon, 28 Oct 2019 14:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74524602DA
Date: Mon, 28 Oct 2019 08:56:17 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Yiwei Zhang <zzyiwei@google.com>, dri-devel@lists.freedesktop.org,
 Alistair Delva <adelva@google.com>, Chris Forbes <chrisforbes@google.com>,
 Prahlad Kilambi <prahladk@google.com>, seanpaul@chromium.org,
 kraxel@redhat.com
Subject: Re: Proposal to report GPU private memory allocations with sysfs nodes
Message-ID: <20191028145616.GC7966@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Yiwei Zhang <zzyiwei@google.com>,
 dri-devel@lists.freedesktop.org, Alistair Delva <adelva@google.com>,
 Chris Forbes <chrisforbes@google.com>,
 Prahlad Kilambi <prahladk@google.com>, seanpaul@chromium.org,
 kraxel@redhat.com
References: <CAKT=dD=vYi_41WBAZfcb7cU5SZUkj88OmhCSyfnNdT45qzhPwg@mail.gmail.com>
 <20191028144758.GB7966@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028144758.GB7966@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572274582;
 bh=6PGencwUf97E9dMGKP8ygAYEhAxAEuJxD3xbaC2Tm74=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=PlPGqYogH6/Vc81Ukm3yvUaN5Hzg/oDCkTBzaXu0PKndnPp+YclkfRJdGs7+Co/Uo
 YaqMgmvo/PV4lHg+CEeB5Dw6/zHpVnTUcgWJz4tqTIqTSEwMJurfCK+j4tWxW6tVET
 Ni3Rc6vZUvllLvgYKtl/o11VyLhsi1xDHS4/EF84=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572274581;
 bh=6PGencwUf97E9dMGKP8ygAYEhAxAEuJxD3xbaC2Tm74=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Gsifw19JNUpSs76rpJJR702vB6a2XIPdt8gC4uXCdJV83RBp0+sDcD0ZBVv23mWLr
 eRGnQEu+mtzQyvCV9p9VcZrwzpGXTzhm+UXzC+VI9qZNqYxB6NWh63TIAOE0Ofm1Wt
 2MgHbBwCcP8Y+1kOtRziZuLNJ2Qbxv94XgKdXFJk=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDg6NDc6NThBTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMTowMDo1OEFNIC0wNzAwLCBZaXdlaSBa
aGFuZyB3cm90ZToKPiA+IEhpIGZvbGtzLAo+ID4gCj4gPiBUaGlzIGlzIFlpd2VpIGZyb20gdGhl
IEFuZHJvaWQgUGxhdGZvcm0gR3JhcGhpY3MgdGVhbS4gT24gdGhlIGRvd25zdHJlYW0KPiA+IEFu
ZHJvaWQsIHZlbmRvcnMgdXNlZCB0byByZXBvcnQgR1BVIHByaXZhdGUgbWVtb3J5IGFsbG9jYXRp
b25zIHdpdGggZGVidWdmcwo+ID4gbm9kZXMgaW4gdGhlaXIgb3duIGZvcm1hdHMuIEhvd2V2ZXIs
IGRlYnVnZnMgbm9kZXMgYXJlIGdldHRpbmcgZGVwcmVjYXRlZAo+ID4gaW4gdGhlIG5leHQgQW5k
cm9pZCByZWxlYXNlLCBzbyB3ZSBhcmUgdGFraW5nIHRoZSBjaGFuY2UgdG8gdW5pZnkgYWxsIHRo
ZQo+ID4gdmVuZG9ycyB0byBtaWdyYXRlIHRoZWlyIGV4aXN0aW5nIGRlYnVnZnMgbm9kZXMgaW50
byBhIHN0YW5kYXJkaXplZCBzeXNmcwo+ID4gbm9kZSBzdHJ1Y3R1cmUuIFRoZW4gdGhlIHBsYXRm
b3JtIGlzIGFibGUgdG8gZG8gYSBidW5jaCBvZiB1c2VmdWwKPiA+IHRoaW5nczogbWVtb3J5IHBy
b2ZpbGluZywgc3lzdGVtIGhlYWx0aCBjb3ZlcmFnZSwgZmllbGQgbWV0cmljcywgbG9jYWwKPiA+
IHNoZWxsIGR1bXAsIGluLWFwcCBhcGksIGV0Yy4KPiA+IAo+ID4gU29tZSB2ZW5kb3JzIHRlbmQg
dG8gZG8gYSBsb3Qgb2YgdXBzdHJlYW1zLCBzbyB3ZSBhcmUgYWxzbyBzZWVraW5nIHRoZQo+ID4g
dXBzdHJlYW0gcG9zc2liaWxpdGllcyBoZXJlIGluc3RlYWQgb2YgbWFraW5nIGl0IGFuIEFuZHJv
aWQgb25seSB0aGluZy4KPiA+IAo+ID4gQXR0YWNoZWQgYXJlIHNjcmVlbnNob3RzIGZvciB0aGUg
bm9kZSBzdHJ1Y3R1cmUgd2UgZHJhZnRlZCBhbmQgYW4gZXhhbXBsZQo+ID4gZm9yIHRoYXQuCj4g
PiAKPiA+IEZvciB0aGUgdG9wIGxldmVsIHJvb3QsIHZlbmRvcnMgY2FuIGNob29zZSB0aGVpciBv
d24gbmFtZXMgYmFzZWQgb24gdGhlCj4gPiB2YWx1ZSBvZiByby5nZnguc3lzZnMuMCB0aGUgdmVu
ZG9ycyBzZXQuCj4gPiAKPiA+ICAgIC0gRm9yIHRoZSBtdWx0aXBsZSBncHUgZHJpdmVyIGNhc2Vz
LCB3ZSBjYW4gdXNlIHJvLmdmeC5zeXNmcy4xLAo+ID4gICAgcm8uZ2Z4LnN5c2ZzLjIgZm9yIHRo
ZSAybmQgYW5kIDNyZCBLTURzLgo+ID4gICAgLSBJdCdzIGFsc28gYWxsb3dlZCB0byBwdXQgc29t
ZSBzdWItZGlyIGZvciBleGFtcGxlICJrZ3NsL2dwdV9tZW0iIG9yCj4gPiAgICAibWFsaTAvZ3B1
X21lbSIgaW4gdGhlIHJvLmdmeC5zeXNmcy48Y2hhbm5lbD4gcHJvcGVydHkgaWYgdGhlIHJvb3Qg
bmFtZQo+ID4gICAgdW5kZXIgL3N5cy9kZXZpY2VzLyBpcyBhbHJlYWR5IGNyZWF0ZWQgYW5kIHVz
ZWQgZm9yIG90aGVyIHB1cnBvc2VzLgo+ID4gCj4gPiAKPiA+IEZvciB0aGUgMm5kIGxldmVsIHBp
ZHMsIHRoZXJlIGFyZSB1c3VhbGx5IGp1c3QgYSBjb3VwbGUgb2YgdGhlbSBwZXIKPiA+IHNuYXBz
aG90LCBzaW5jZSB3ZSBvbmx5IHRha2VzIHNuYXBzaG90IGZvciB0aGUgYWN0aXZlIG9uZXMuCj4g
PiAKPiA+IEZvciB0aGUgM3JkIGxldmVsIHR5cGVzLCB0aGUgdHlwZSBuYW1lIHdpbGwgYmUgb25l
IG9mIHRoZSBHUFUgbWVtb3J5IG9iamVjdAo+ID4gdHlwZXMgaW4gbG93ZXIgY2FzZSwgYW5kIHRo
ZSB2YWx1ZSB3aWxsIGJlIGEgY29tbWEgc2VwYXJhdGVkIHNlcXVlbmNlIG9mCj4gPiBzaXplIHZh
bHVlcyBmb3IgYWxsIHRoZSBhbGxvY2F0aW9ucyB1bmRlciB0aGF0IHNwZWNpZmljIHR5cGUuCj4g
PiAKPiA+ICAgIC0gRm9yIHRoZSBHUFUgbWVtb3J5IG9iamVjdCB0eXBlcywgd2UgZGVmaW5lZCA5
IGRpZmZlcmVudCB0eXBlcyBmb3IKPiA+ICAgIEFuZHJvaWQ6Cj4gPiAgICAgICAtICAgICAvLyBu
b3QgYWNjb3VudGVkIGZvciBpbiBhbnkgb3RoZXIgY2F0ZWdvcnkKPiA+ICAgICAgICAgICBVTktO
T1dOID0gMDsKPiA+ICAgICAgICAgICAvLyBzaGFkZXIgYmluYXJpZXMKPiA+ICAgICAgICAgICBT
SEFERVIgPSAxOwo+ID4gICAgICAgICAgIC8vIGFsbG9jYXRpb25zIHdoaWNoIGhhdmUgYSBsaWZl
dGltZSBzaW1pbGFyIHRvIGEgVmtDb21tYW5kQnVmZmVyCj4gPiAgICAgICAgICAgQ09NTUFORCA9
IDI7Cj4gPiAgICAgICAgICAgLy8gYmFja2luZyBmb3IgVmtEZXZpY2VNZW1vcnkKPiA+ICAgICAg
ICAgICBWVUxLQU4gPSAzOwo+ID4gICAgICAgICAgIC8vIEdMIFRleHR1cmUgYW5kIFJlbmRlckJ1
ZmZlcgo+ID4gICAgICAgICAgIEdMX1RFWFRVUkUgPSA0Owo+ID4gICAgICAgICAgIC8vIEdMIEJ1
ZmZlcgo+ID4gICAgICAgICAgIEdMX0JVRkZFUiA9IDU7Cj4gPiAgICAgICAgICAgLy8gYmFja2lu
ZyBmb3IgcXVlcnkKPiA+ICAgICAgICAgICBRVUVSWSA9IDY7Cj4gPiAgICAgICAgICAgLy8gYWxs
b2NhdGlvbnMgd2hpY2ggaGF2ZSBhIGxpZmV0aW1lIHNpbWlsYXIgdG8gYSBWa0Rlc2NyaXB0b3JT
ZXQKPiA+ICAgICAgICAgICBERVNDUklQVE9SID0gNzsKPiA+ICAgICAgICAgICAvLyByYW5kb20g
dHJhbnNpZW50IHRoaW5ncyB0aGF0IHRoZSBkcml2ZXIgbmVlZHMKPiA+ICAgICAgICAgICBUUkFO
U0lFTlQgPSA4Owo+ID4gICAgICAgLSBXZSBhcmUgd29uZGVyaW5nIGlmIHRob3NlIHR5cGUgZW51
bWVyYXRpb25zIG1ha2Ugc2Vuc2UgdG8gdGhlCj4gPiAgICAgICB1cHN0cmVhbSBzaWRlIGFzIHdl
bGwsIG9yIG1heWJlIHdlIGp1c3QgZGVhbCB3aXRoIG91ciBvd24gZGlmZmVyZW50IHR5cGUKPiA+
ICAgICAgIHNldHMuIEN1eiBvbiB0aGUgQW5kcm9pZCBzaWRlLCB3ZSdsbCBqdXN0IHJlYWQgdGhv
c2Ugbm9kZXMgbmFtZWQKPiA+IGFmdGVyIHRoZQo+ID4gICAgICAgdHlwZXMgd2UgZGVmaW5lZCBp
biB0aGUgc3lzZnMgbm9kZSBzdHJ1Y3R1cmUuCj4gPiAgICAtIFRoZSBub2RlIHZhbHVlIGNhbiBi
ZTogNDA5Niw4MTkyMCwuLi4sNDA5Ngo+ID4gCj4gPiAKPiA+IExvb2tpbmcgZm9yd2FyZCB0byBh
bnkgY29uY2VybnMvY29tbWVudHMvc3VnZ2VzdGlvbnMhCj4gCj4gSGkgWWl3ZWkuCj4gCj4gVGhp
cyBpcyBhbiBpbXBvcnRhbnQgZGlzY3Vzc2lvbiB0aGF0IEkgdGhpbmsgd2UgbmVlZCB0byBoYXZl
IGJ1dCBtYW55IG9mIHVzIHVzZQo+IHRleHQgYmFzZWQgZW1haWwgY2xpZW50cyBhbmQgUE5HIGF0
dGFjaG1lbnRzIGFyZSBjbHVtc3kuIEl0IG1pZ2h0IGhlbHAgbW92ZSB0aGUKPiBkaXNjdXNzaW9u
IGFsb25nIGlmIHlvdSBkZXNjcmliZWQgdGhlIHN1Z2dlc3RlZCBpbnRlcmZhY2VzIGluIHRleHQg
KGJvbnVzOiB0aGlzCj4gY291bGQgYmUgdGhlIHN0YXJ0IG9mIHRoZSAucnN0IGRvY3VtZW50YXRp
b24pIG9yIHByb3ZpZGVkIGEgbGluayB0byBhIGNsb3VkCj4gZG9jdW1lbnQgdGhhdCB3ZSBjb3Vs
ZCBwZXJ1c2UuCgpXaGljaCB5b3UgaGF2ZSBhbHJlYWR5IGRvbmUuICBTb3JyeSBhYm91dCB0aGF0
LCBtYXliZSBJIHNob3VsZCBnbyB0aHJvdWdoIGFsbCBteQppbmJveCBiZWZvcmUgb3BlbmluZyBt
eSBtb3V0aC4gOikKCkpvcmRhbgoKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwg
SW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9u
IENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
