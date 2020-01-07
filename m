Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD30131CDD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 01:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80F489762;
	Tue,  7 Jan 2020 00:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DB189762
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 00:55:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 16:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; d="scan'208";a="210958509"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by orsmga007.jf.intel.com with ESMTP; 06 Jan 2020 16:55:25 -0800
Subject: Re: [kbuild-all] Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid
 invalid rates
To: Doug Anderson <dianders@chromium.org>, kbuild test robot <lkp@intel.com>
References: <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <201912212109.ehZOyrlG%lkp@intel.com>
 <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <997d40ad-2a86-7a21-b16c-f33f4e2ebca8@intel.com>
Date: Tue, 7 Jan 2020 08:55:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, kbuild-all@lists.01.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxLzcvMjAgNjo0MyBBTSwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiBEZWFyIFJvYm90LAo+
Cj4gT24gU2F0LCBEZWMgMjEsIDIwMTkgYXQgNTo1NyBBTSBrYnVpbGQgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4+IEhpIERvdWdsYXMsCj4+Cj4+IEkgbG92ZSB5b3VyIHBhdGNo
ISBQZXJoYXBzIHNvbWV0aGluZyB0byBpbXByb3ZlOgo+Pgo+PiBbYXV0byBidWlsZCB0ZXN0IFdB
Uk5JTkcgb24gbGludXMvbWFzdGVyXQo+PiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gdjUu
NS1yYzIgbmV4dC0yMDE5MTIyMF0KPj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUg
d3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCj4+IGltcHJvdmUg
dGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIG9wdGlvbiB0
byBzcGVjaWZ5IHRoZQo+PiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNl
ZSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4+Cj4+IHVybDogICAgaHR0
cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9Eb3VnbGFzLUFuZGVyc29uL2Ry
bS1icmlkZ2UtdGktc242NWRzaTg2LUltcHJvdmUtc3VwcG9ydC1mb3ItQVVPLUIxMTZYQUswMS1v
dGhlci1EUC8yMDE5MTIyMS0wODM0NDgKPj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgN2UwMTY1YjJmMWE5
MTJhMDZlMzgxZTkxZjBmNGU0OTVmNGFjMzczNgo+PiBjb25maWc6IHNoLWFsbG1vZGNvbmZpZyAo
YXR0YWNoZWQgYXMgLmNvbmZpZykKPj4gY29tcGlsZXI6IHNoNC1saW51eC1nY2MgKEdDQykgNy41
LjAKPj4gcmVwcm9kdWNlOgo+PiAgICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJj
b250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jp
bi9tYWtlLmNyb3NzCj4+ICAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MKPj4gICAg
ICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWUKPj4g
ICAgICAgICAgR0NDX1ZFUlNJT049Ny41LjAgbWFrZS5jcm9zcyBBUkNIPXNoCj4+Cj4+IElmIHlv
dSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKPj4gUmVwb3J0ZWQtYnk6
IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Pgo+PiBOb3RlOiBpdCBtYXkgd2Vs
bCBiZSBhIEZBTFNFIHdhcm5pbmcuIEZXSVcgeW91IGFyZSBhdCBsZWFzdCBhd2FyZSBvZiBpdCBu
b3cuCj4+IGh0dHA6Ly9nY2MuZ251Lm9yZy93aWtpL0JldHRlcl9VbmluaXRpYWxpemVkX1dhcm5p
bmdzCj4+Cj4+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+Pgo+PiAg
ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYzogSW4gZnVuY3Rpb24gJ3Rp
X3NuX2JyaWRnZV9lbmFibGUnOgo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmM6NTQzOjE4OiB3YXJuaW5nOiAncmF0ZV92YWxpZCcgbWF5IGJlIHVzZWQgdW5pbml0aWFs
aXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCj4+ICAgICAgICAg
aWYgKHJhdGVfdmFsaWRbaV0pCj4+ICAgICAgICAgICAgIH5+fn5+fn5+fn5efn4KPiBJIGxvdmUg
eW91ciByZXBvcnQhICBJbnRlcmVzdGluZ2x5IEkgaGFkIGFscmVhZHkgbm90aWNlZCB0aGlzIHBy
b2JsZW0KPiBteXNlbGYgYW5kIHYzIG9mIHRoZSBwYXRjaCBmaXhlcyB0aGUgaXNzdWUuICBTZWU6
Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkxMjE4MTQzNDE2LnYzLjkuSWI1OTIw
N2I2NmRiMzc3MzgwZDEzNzQ4NzUyZDZmY2U1NTk2NDYyYzVAY2hhbmdlaWQKPgo+Cj4gSWYgdGhl
IG1haW50YWluZXIgb2YgdGhlIHJvYm90IGlzIHJlYWRpbmcgdGhpcywgc29tZXRoaW5nIHRvIGlt
cHJvdmUKPiBhYm91dCB5b3VyIHJvYm90IGlzIHRoYXQgaXQgY291bGQgaGF2ZSBub3RpY2VkIHYz
IG9mIHRoZSBwYXRjaCAod2hpY2gKPiB3YXMgcG9zdGVkIHNldmVyYWwgZGF5cyBiZWZvcmUgeW91
ciByZXBvcnQpIGFuZCBza2lwcGVkIGFuYWx5emluZyB2Mgo+IG9mIHRoZSBwYXRjaC4gIEknbSBj
dXJyZW50bHkgdXNpbmcgQ2hhbmdlLUlkcyBlbWJlZGRlZCBpbiBteQo+IE1lc3NhZ2UtSWQgdG8g
aGVscCBhdXRvbWF0aW9uIHJlbGF0ZSBvbmUgdmVyc2lvbiBvZiBteSBwYXRjaGVzIHRvIHRoZQo+
IG5leHQuICBTcGVjaWZpY2FsbHkgeW91IGNvbXBhcmUgdGhlIE1lc3NhZ2UtSWQgb2YgdjIgYW5k
IHYzIG9mIHRoaXMKPiBwYXRjaDoKPgo+IDIwMTkxMjE3MTY0NzAyLnYyLjkuSWI1OTIwN2I2NmRi
Mzc3MzgwZDEzNzQ4NzUyZDZmY2U1NTk2NDYyYzVAY2hhbmdlaWQKPiAyMDE5MTIxODE0MzQxNi52
My45LkliNTkyMDdiNjZkYjM3NzM4MGQxMzc0ODc1MmQ2ZmNlNTU5NjQ2MmM1QGNoYW5nZWlkCj4K
PiBTaW5jZSB0aGUgbGFzdCBzZWN0aW9uIGJlZm9yZSB0aGUgIkBjaGFuZ2VpZCIgcmVtYWluZWQg
Y29uc3RhbnQgaXQKPiBjb3VsZCBiZSBhc3N1bWVkIHRoYXQgdGhpcyBwYXRjaCByZXBsYWNlZCB0
aGUgdjIuICBJIGtub3cgdGhlcmUncyBub3QKPiB0b28gbXVjaCB1c2FnZSBvZiB0aGlzIHRlY2hu
aXF1ZSB5ZXQsIGJ1dCBpZiBvbmx5IG1vcmUgdG9vbHMgc3VwcG9ydGVkCj4gaXQgdGhlbiBtYXli
ZSBtb3JlIHBlb3BsZSB3b3VsZCB1c2UgaXQuCgpIaSBEb3VnLAoKVGhhbmtzIGZvciB5b3VyIHN1
Z2dlc3Rpb24sIHRoZSByb290IGNhdXNlIGlzIHRoYXQgdGhlIHYzIHdhc24ndCBoYW5kbGVkIApi
ZWZvcmUgdGhpcyByZXBvcnQuCldlJ2xsIGRlZmluaXRlbHkgZ2l2ZSBzZXJpb3VzIHRob3VnaHQg
dG8geW91ciBzdWdnZXN0aW9uLgoKIMKgIHYyOiAKRG91Z2xhcy1BbmRlcnNvbi9kcm0tYnJpZGdl
LXRpLXNuNjVkc2k4Ni1JbXByb3ZlLXN1cHBvcnQtZm9yLUFVTy1CMTE2WEFLMDEtb3RoZXItRFAv
MjAxOTEyMjEtMDgzNDQ4CiDCoCB2MzogCkRvdWdsYXMtQW5kZXJzb24vZHJtLWJyaWRnZS10aS1z
bjY1ZHNpODYtSW1wcm92ZS1zdXBwb3J0LWZvci1BVU8tQjExNlhBSzAxLW90aGVyLURQLzIwMTkx
MjIyLTA2MjY0NgoKQmVzdCBSZWdhcmRzLApSb25nIENoZW4KCj4KPgo+IC1Eb3VnCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBrYnVpbGQtYWxsIG1h
aWxpbmcgbGlzdCAtLSBrYnVpbGQtYWxsQGxpc3RzLjAxLm9yZwo+IFRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8ga2J1aWxkLWFsbC1sZWF2ZUBsaXN0cy4wMS5vcmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
