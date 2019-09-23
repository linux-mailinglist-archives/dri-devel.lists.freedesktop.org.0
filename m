Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16792BC242
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BF36E9F2;
	Tue, 24 Sep 2019 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15606E95C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:48:34 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCQZ9-00063q-MO; Mon, 23 Sep 2019 15:47:55 +0000
Subject: Re: [PATCH v18 15/19] Documentation: kunit: add documentation for
 KUnit
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-16-brendanhiggins@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
Date: Mon, 23 Sep 2019 08:47:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923090249.127984-16-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6naaO3eN2JtKgsodjGmbFEb7omduasR6eHtDOBj/YU=; b=WDxDdSVtxB4MQheuYDglZVo77
 ITnMkIz7R+0s/TcK9u0iB564ZvSW2OG/lJv1lRwdjnxBatB+wSX35svuC1yd5Ea1AxQ52gRn6cmF2
 /83K/HFVn4+skc/Wt6uGE+DwUbc77iTcslmEjK/CRAvgV+6YQUkzJbtlBrr5Q+8JJKlmrTyBq44/u
 TJiHeSIwQ3VM6J44S1d1yNryMKLsQ8iZf1OrD6FnYs6OHkND8aMMMkrLPNGm6nhYxiQsA6gnvmund
 vT7S7hcNSvEXvCDhPF31ee1v2WxWOnkGIihjEU+7pqNLhV5/Kty9KSYUOFACXDa3f7vCTTX3UOnh6
 bZwx9NxQw==;
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 kunit-dev@googlegroups.com, richard@nod.at, torvalds@linux-foundation.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMy8xOSAyOjAyIEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gQWRkIGRvY3VtZW50
YXRpb24gZm9yIEtVbml0LCB0aGUgTGludXgga2VybmVsIHVuaXQgdGVzdGluZyBmcmFtZXdvcmsu
Cj4gLSBBZGQgaW50cm8gYW5kIHVzYWdlIGd1aWRlIGZvciBLVW5pdAo+IC0gQWRkIEFQSSByZWZl
cmVuY2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdW8gPGZlbGl4Z3VveGl1cGluZ0BnbWFp
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bn
b29nbGUuY29tPgo+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+IFJldmll
d2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+
IFJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4gUmV2
aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1l
bnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0ICAgICAgICAgICB8ICAgMSArCj4gIERvY3VtZW50
YXRpb24vZGV2LXRvb2xzL2t1bml0L2FwaS9pbmRleC5yc3QgfCAgMTYgKwo+ICBEb2N1bWVudGF0
aW9uL2Rldi10b29scy9rdW5pdC9hcGkvdGVzdC5yc3QgIHwgIDExICsKPiAgRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMva3VuaXQvZmFxLnJzdCAgICAgICB8ICA2MiArKysKPiAgRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMva3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysKPiAgRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMva3VuaXQvc3RhcnQucnN0ICAgICB8IDE4MCArKysrKysKPiAgRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0ICAgICB8IDU3NiArKysrKysrKysrKysrKysr
KysrKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDkyNSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9hcGkvaW5kZXgucnN0Cj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9hcGkvdGVzdC5y
c3QKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L2Zh
cS5yc3QKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0
L2luZGV4LnJzdAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
a3VuaXQvc3RhcnQucnN0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldi10
b29scy9rdW5pdC91c2FnZS5yc3QKCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10
b29scy9rdW5pdC9zdGFydC5yc3QgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9zdGFy
dC5yc3QKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmRjMjI5
ZTQ2YmIzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1
bml0L3N0YXJ0LnJzdAo+IEBAIC0wLDAgKzEsMTgwIEBACj4gKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4gKwo+ICs9PT09PT09PT09PT09PT0KPiArR2V0dGluZyBTdGFydGVk
Cj4gKz09PT09PT09PT09PT09PQo+ICsKPiArSW5zdGFsbGluZyBkZXBlbmRlbmNpZXMKPiArPT09
PT09PT09PT09PT09PT09PT09PT0KPiArS1VuaXQgaGFzIHRoZSBzYW1lIGRlcGVuZGVuY2llcyBh
cyB0aGUgTGludXgga2VybmVsLiBBcyBsb25nIGFzIHlvdSBjYW4gYnVpbGQKPiArdGhlIGtlcm5l
bCwgeW91IGNhbiBydW4gS1VuaXQuCj4gKwo+ICtLVW5pdCBXcmFwcGVyCj4gKz09PT09PT09PT09
PT0KPiArSW5jbHVkZWQgd2l0aCBLVW5pdCBpcyBhIHNpbXBsZSBQeXRob24gd3JhcHBlciB0aGF0
IGhlbHBzIGZvcm1hdCB0aGUgb3V0cHV0IHRvCj4gK2Vhc2lseSB1c2UgYW5kIHJlYWQgS1VuaXQg
b3V0cHV0LiBJdCBoYW5kbGVzIGJ1aWxkaW5nIGFuZCBydW5uaW5nIHRoZSBrZXJuZWwsIGFzCj4g
K3dlbGwgYXMgZm9ybWF0dGluZyB0aGUgb3V0cHV0Lgo+ICsKPiArVGhlIHdyYXBwZXIgY2FuIGJl
IHJ1biB3aXRoOgo+ICsKPiArLi4gY29kZS1ibG9jazo6IGJhc2gKPiArCj4gKyAgIC4vdG9vbHMv
dGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4KPiArCj4gK0NyZWF0aW5nIGEga3VuaXRjb25maWcK
PiArPT09PT09PT09PT09PT09PT09PT09PQo+ICtUaGUgUHl0aG9uIHNjcmlwdCBpcyBhIHRoaW4g
d3JhcHBlciBhcm91bmQgS2J1aWxkIGFzIHN1Y2gsIGl0IG5lZWRzIHRvIGJlCgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcm91bmQgS2J1aWxkLiBBcyBzdWNoLAoKPiAr
Y29uZmlndXJlZCB3aXRoIGEgYGBrdW5pdGNvbmZpZ2BgIGZpbGUuIFRoaXMgZmlsZSBlc3NlbnRp
YWxseSBjb250YWlucyB0aGUKPiArcmVndWxhciBLZXJuZWwgY29uZmlnLCB3aXRoIHRoZSBzcGVj
aWZpYyB0ZXN0IHRhcmdldHMgYXMgd2VsbC4KPiArCj4gKy4uIGNvZGUtYmxvY2s6OiBiYXNoCj4g
Kwo+ICsJZ2l0IGNsb25lIC1iIG1hc3RlciBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5jb20v
a3VuaXRjb25maWcgJFBBVEhfVE9fS1VOSVRDT05GSUdfUkVQTwo+ICsJY2QgJFBBVEhfVE9fTElO
VVhfUkVQTwo+ICsJbG4gLXMgJFBBVEhfVE9fS1VOSVRfQ09ORklHX1JFUE8va3VuaXRjb25maWcg
a3VuaXRjb25maWcKPiArCj4gK1lvdSBtYXkgd2FudCB0byBhZGQga3VuaXRjb25maWcgdG8geW91
ciBsb2NhbCBnaXRpZ25vcmUuCj4gKwo+ICtWZXJpZnlpbmcgS1VuaXQgV29ya3MKPiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtUbyBtYWtlIHN1cmUgdGhhdCBldmVyeXRoaW5nIGlzIHNl
dCB1cCBjb3JyZWN0bHksIHNpbXBseSBpbnZva2UgdGhlIFB5dGhvbgo+ICt3cmFwcGVyIGZyb20g
eW91ciBrZXJuZWwgcmVwbzoKPiArCj4gKy4uIGNvZGUtYmxvY2s6OiBiYXNoCj4gKwo+ICsJLi90
b29scy90ZXN0aW5nL2t1bml0L2t1bml0LnB5Cj4gKwo+ICsuLiBub3RlOjoKPiArICAgWW91IG1h
eSB3YW50IHRvIHJ1biBgYG1ha2UgbXJwcm9wZXJgYCBmaXJzdC4KCkkgbm9ybWFsbHkgdXNlIE89
YnVpbGRkaXIgd2hlbiBidWlsZGluZyBrZXJuZWxzLgpEb2VzIHRoaXMgc3VwcG9ydCB1c2luZyBP
PWJ1aWxkZGlyID8KCj4gKwo+ICtJZiBldmVyeXRoaW5nIHdvcmtlZCBjb3JyZWN0bHksIHlvdSBz
aG91bGQgc2VlIHRoZSBmb2xsb3dpbmc6Cj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogYmFzaAo+ICsK
PiArCUdlbmVyYXRpbmcgLmNvbmZpZyAuLi4KPiArCUJ1aWxkaW5nIEtVbml0IEtlcm5lbCAuLi4K
PiArCVN0YXJ0aW5nIEtVbml0IEtlcm5lbCAuLi4KPiArCj4gK2ZvbGxvd2VkIGJ5IGEgbGlzdCBv
ZiB0ZXN0cyB0aGF0IGFyZSBydW4uIEFsbCBvZiB0aGVtIHNob3VsZCBiZSBwYXNzaW5nLgo+ICsK
PiArLi4gbm90ZTo6Cj4gKyAgIEJlY2F1c2UgaXQgaXMgYnVpbGRpbmcgYSBsb3Qgb2Ygc291cmNl
cyBmb3IgdGhlIGZpcnN0IHRpbWUsIHRoZSBgYEJ1aWxkaW5nCj4gKyAgIGt1bml0IGtlcm5lbGBg
IHN0ZXAgbWF5IHRha2UgYSB3aGlsZS4KPiArCj4gK1dyaXRpbmcgeW91ciBmaXJzdCB0ZXN0Cj4g
Kz09PT09PT09PT09PT09PT09PT09PT09Cgpbc25pcF0KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2LXRvb2xzL2t1bml0L3VzYWdlLnJzdCBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xz
L2t1bml0L3VzYWdlLnJzdAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5jNmU2OTYzNGUyNzQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0CgpUQkQuLi4KCgotLSAKflJhbmR5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
