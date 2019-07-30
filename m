Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465877AA8A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06A6E536;
	Tue, 30 Jul 2019 14:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B8B6E536
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:08:24 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61402
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsSnd-0002Dj-TY; Tue, 30 Jul 2019 16:08:21 +0200
Subject: Re: [RFC 0/4] drm/mipi-dbi: Support panel drivers
To: =?UTF-8?Q?Josef_Lu=c5=a1tick=c3=bd?= <josef@lusticky.cz>
References: <20190729195526.13337-1-noralf@tronnes.org>
 <CAMqqaJF8wsekJgriFBxoj5t7FoKTYpqOm_9-NTmf-p5cq3P35Q@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <45577a65-300e-24ed-8f79-3aa222da40a3@tronnes.org>
Date: Tue, 30 Jul 2019 16:08:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMqqaJF8wsekJgriFBxoj5t7FoKTYpqOm_9-NTmf-p5cq3P35Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=cvfYwTsmI3ok/7d4VWyiqXYSFuq2wIx/8+JxsvMhjPI=; 
 b=TmSf5LpuxRB47SLvGFtRMu9WzQVDTsePV+Aq/igMeY26yQdl76FJzwDAbuD+ablh92wRPCFDmZnJncDXzsqHsf28twGer78gIhD4yld6pENOKCjyoSviY34ltx6LvACMsACGaY34RT5CETBJsYbp9MFlrN4OnKAENSSewduWL4YTtw4iRQYXFr6nxCaE7OMg7npyFXUvozi3aQ54yaZ8bXShEN8qUSyoF3cegBNed/g2h2M4HvSKbHCCH8ZzNe71PEsVCJOvF/CGITEUYHPPdRUQro+cOINvw/df+ZXyiBqRv9e/8Yg/M9wDz2PScWw9AwtqWbpnEu6zrabxUi79PQ==;
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
Cc: daniel.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDcuMjAxOSAwOC40MCwgc2tyZXYgSm9zZWYgTHXFoXRpY2vDvToKPiBIaSBOb3Jh
bGYsCj4gdGhlIHBhdGNoIHNlcmllcyBsb29rcyBnb29kLCBzZWUgY29tbWVudHMgaW4gdGhlIHBh
dGNoIGVtYWlscy4KPiAKPiBPbmUgcXVlc3Rpb246IGlzIHRoZXJlIGEgZ2VuZXJhbCBtZWNoYW5p
c20gdG8gdGVsbCBhIGRyaXZlciBub3QgdG8gdXNlCj4gcGFyYWxsZWwgUkdCIGV2ZW4gdGhvdWdo
Cj4gdGhlIGRpc3BsYXkgc3VwcG9ydHMgaXQgYW5kICJwb3J0IiBpcyBzcGVjaWZpZWQgaW4gdGhl
IGRldmljZS10cmVlPwo+IAoKTm90IHRoYXQgSSBrbm93IG9mLiBJdCB3YXMganVzdCBvbmUgZGlm
ZmVyZW5jZSB0aGF0IHN0b29kIG91dCB3aGljaAp3b3VsZCBtYWtlIGl0IGVhc3kgdG8gaGF2ZSB0
aGUgc2FtZSBwYW5lbCBkcml2ZXIgc3VwcG9ydCBib3RoIERQSSBhbmQKREJJIHBpeGVsIG1vZGUu
CgpTaW5jZSB5b3VyIHBhbmVsIGhhcyBhIGlsaTkzNDEgSSBhc3NtdWUgaXQgaGFzIG9uYm9hcmQg
UkFNPyBTbyB5b3UKc2hvdWxkIGJlIGFibGUgdG8gZHJpdmUgeW91ciBkaXNwbGF5IGluIGJvdGgg
bW9kZXMgSSBndWVzcy4KCk5vcmFsZi4KCj4gSm9zZWYKPiAKPiBwbyAyOS4gNy4gMjAxOSB2IDIx
OjU1IG9kZXPDrWxhdGVsIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiBuYXBz
YWw6Cj4+Cj4+IEluc3BpcmVkIGJ5IHRoZSB0aHJlYWRbMV0gZm9sbG93aW5nIHRoZSBzdWJtaXNz
aW9uIG9mIGEgbmV3IGlsaTkzNDEKPj4gcGFuZWwgZHJpdmVyWzJdLCBJIHNldCBvdXQgdG8gc2Vl
IGlmIEkgY291bGQgc3VwcG9ydCBwYW5lbCBkcml2ZXJzIGluCj4+IGRybV9taXBpX2RiaS4KPj4K
Pj4gSSBoYXZlIGluY2x1ZGVkIHRoZSBvcmlnaW5hbCBkcml2ZXIsIGRvbmUgc29tZSBwcmVwIHdv
cmsgb24gaXQsIGFkZGVkCj4+IHBhbmVsIHN1cHBvcnQgdG8gZHJtX21pcGlfZGJpIGFuZCBjb252
ZXJ0ZWQgbWkwMjgzcXQgdG8gdGhpcyBuZXcgcGFuZWwKPj4gZHJpdmVyLgo+Pgo+PiBUaGUgYmln
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgb3Igbm90IHBhbmVsIGRyaXZlcnMgc2hvdWxkIGJlIGFsbG93
ZWQgdG8KPj4gdHVybiB0aGVtc2VsdmVzIGludG8gZnVsbCBmbGVkZ2VkIERSTSBkcml2ZXJzLgo+
Pgo+PiBOb3JhbGYuCj4+Cj4+IFsxXQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdWx5LzIyODE5My5odG1sCj4+IFsyXSBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzE2NTI4Lwo+Pgo+PiBKb3NlZiBMdXN0aWNr
eSAoMSk6Cj4+ICAgZHJtL3BhbmVsOiBBZGQgSWxpdGVrIElMSTkzNDEgcGFyYWxsZWwgUkdCIHBh
bmVsIGRyaXZlcgo+Pgo+PiBOb3JhbGYgVHLDuG5uZXMgKDMpOgo+PiAgIGRybS9wYW5lbC9pbGk5
MzQxOiBSZWJhc2UgYW5kIHNvbWUgbW9yZQo+PiAgIGRybS9taXBpLWRiaTogU3VwcG9ydCBjb21t
YW5kIG1vZGUgcGFuZWwgZHJpdmVycwo+PiAgIGRybS9wYW5lbC9pbGk5MzQxOiBTdXBwb3J0IG1p
MDI4M3F0Cj4+Cj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNiArCj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICAgICAgICAg
ICB8IDExMCArKysrKwo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAgICAg
ICAgICAgfCAgIDkgKwo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAg
ICAgICAgfCAgIDEgKwo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5
MzQxLmMgfCA0NTIgKysrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVkZS9kcm0vZHJtX21pcGlf
ZGJpLmggICAgICAgICAgICAgICAgICAgfCAgIDggKwo+PiAgNiBmaWxlcyBjaGFuZ2VkLCA1ODYg
aW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1pbGl0ZWstaWxpOTM0MS5jCj4+Cj4+IC0tCj4+IDIuMjAuMQo+Pgo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
