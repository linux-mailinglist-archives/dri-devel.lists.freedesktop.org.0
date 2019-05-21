Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6541925446
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311C289363;
	Tue, 21 May 2019 15:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0DE89363;
 Tue, 21 May 2019 15:44:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53D0AC05E760;
 Tue, 21 May 2019 15:44:15 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA9D17F34;
 Tue, 21 May 2019 15:44:13 +0000 (UTC)
Date: Tue, 21 May 2019 11:44:11 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190521154411.GD3836@redhat.com>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 21 May 2019 15:44:20 +0000 (UTC)
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, David Rientjes <rientjes@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBKdXN0IGEgYml0IG9mIHBhcmFub2lhLCBzaW5jZSBpZiB3ZSBzdGFydCBwdXNoaW5n
IHRoaXMgZGVlcCBpbnRvCj4gY2FsbGNoYWlucyBpdCdzIGhhcmQgdG8gc3BvdCBhbGwgcGxhY2Vz
IHdoZXJlIGFuIG1tdSBub3RpZmllcgo+IGltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBp
dCdzIG5vdCBhbGxvd2VkIHRvLgo+IAo+IEluc3BpcmVkIGJ5IHNvbWUgY29uZnVzaW9uIHdlIGhh
ZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQKPiB3aGV0aGVyIHdlIGNvdWxkIHVz
ZSB0aGUgbmV3bHktaW50cm9kdWNlZCByZXR1cm4gdmFsdWUgdG8gaGFuZGxlIHNvbWUKPiBjb3Ju
ZXIgY2FzZXMuIFVudGlsIHdlIHJlYWxpemVkIHRoYXQgdGhlc2UgYXJlIG9ubHkgZm9yIHdoZW4g
YSB0YXNrCj4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVyLgo+IAo+IEFuIGFsdGVy
bmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHNwbGl0IHRoZSBjYWxsYmFjayBpbnRvIHR3bwo+
IHZlcnNpb25zLCBvbmUgd2l0aCB0aGUgaW50IHJldHVybiB2YWx1ZSwgYW5kIHRoZSBvdGhlciB3
aXRoIHZvaWQKPiByZXR1cm4gdmFsdWUgbGlrZSBpbiBvbGRlciBrZXJuZWxzLiBCdXQgdGhhdCdz
IGEgbG90IG1vcmUgY2h1cm4gZm9yCj4gZmFpcmx5IGxpdHRsZSBnYWluIEkgdGhpbmsuCj4gCj4g
U3VtbWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcg
YXQgd2FybmluZwo+IGxldmVsOiBUaGlzIGFsbG93cyBhdXRvbWF0ZWQgdG9vbGluZyBpbiBDSSB0
byBjYXRjaCBidWdzIHdpdGhvdXQKPiBodW1hbnMgaGF2aW5nIHRvIGxvb2sgYXQgZXZlcnl0aGlu
Zy4gSWYgd2UganVzdCB1cGdyYWRlIHRoZSBleGlzdGluZwo+IHByX2luZm8gdG8gYSBwcl93YXJu
LCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBBbmQgYXMtaXMsIG5vCj4gb25lIHdp
bGwgZXZlciBzcG90IHRoZSBwcm9ibGVtIHNpbmNlIGl0J3MgbG9zdCBpbiB0aGUgbWFzc2l2ZSBh
bW91bnRzCj4gb2Ygb3ZlcmFsbCBkbWVzZyBub2lzZS4KPiAKPiB2MjogRHJvcCB0aGUgZnVsbCBX
QVJOX09OIGJhY2t0cmFjZSBpbiBmYXZvdXIgb2YganVzdCBhIHByX3dhcm4gZm9yCj4gdGhlIHBy
b2JsZW1hdGljIGNhc2UgKE1pY2hhbCBIb2NrbykuCj4gCj4gdjM6IFJlYmFzZSBvbiB0b3Agb2Yg
R2xpc3NlJ3MgYXJnIHJld29yay4KPiAKPiB2NDogTW9yZSByZWJhc2Ugb24gdG9wIG9mIEdsaXNz
ZSByZXdvcmtpbmcgZXZlcnl0aGluZy4KPiAKPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4g
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBE
YXZpZCBSaWVudGplcyA8cmllbnRqZXNAZ29vZ2xlLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VA
cmVkaGF0LmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpn
bGlzc2VAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIG1tL21tdV9ub3RpZmllci5jIHwgMyArKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9tbXVf
bm90aWZpZXIuYyBiL21tL21tdV9ub3RpZmllci5jCj4gaW5kZXggZWUzNjA2ODA3N2I2Li5jMDVl
NDA2YTdjZDcgMTAwNjQ0Cj4gLS0tIGEvbW0vbW11X25vdGlmaWVyLmMKPiArKysgYi9tbS9tbXVf
bm90aWZpZXIuYwo+IEBAIC0xODEsNiArMTgxLDkgQEAgaW50IF9fbW11X25vdGlmaWVyX2ludmFs
aWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gIAkJ
CQlwcl9pbmZvKCIlcFMgY2FsbGJhY2sgZmFpbGVkIHdpdGggJWQgaW4gJXNibG9ja2FibGUgY29u
dGV4dC5cbiIsCj4gIAkJCQkJbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCwgX3JldCwK
PiAgCQkJCQkhbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkgPyAibm9uLSIgOiAi
Iik7Cj4gKwkJCQlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQo+ICsJ
CQkJCXByX3dhcm4oIiVwUyBjYWxsYmFjayBmYWlsdXJlIG5vdCBhbGxvd2VkXG4iLAo+ICsJCQkJ
CQltbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KTsKPiAgCQkJCXJldCA9IF9yZXQ7Cj4g
IAkJCX0KPiAgCQl9Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
