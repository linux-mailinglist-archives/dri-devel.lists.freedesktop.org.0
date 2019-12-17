Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FAE123A89
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 00:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1F6E1BD;
	Tue, 17 Dec 2019 23:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8356E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 23:09:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF9249BF;
 Wed, 18 Dec 2019 00:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576624147;
 bh=aROGuM/kUggA/FWpJUywkaxAs+n5HHISQN39ygHEdPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKqu4kY5Vt+pYye0eoiVFFfEN4l0Obt2Fr2rE+ROzwighCuJ8MeENMf+G7FjbLtl5
 sTyUB5kDir5Zu8lj5JpjiXq0nxi2R+n7SjQgCkurqEOHtml2cMQv3P2uTvjWXTF/Tu
 PHcrAlPyIjocMoz0Y8M+zua1mslTyl0t/OTH6xLc=
Date: Wed, 18 Dec 2019 01:08:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191217230856.GE4874@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
 <20191217135414.GA4741@pendragon.ideasonboard.com>
 <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTA6MDY6MTRQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOgo+IE9uIDE3IERlY2VtYmVyIDIwMTkgMTM6NTQsIExhdXJlbnQgUGluY2hhcnQgd3Jv
dGU6Cj4gPiBPbiBUdWUsIERlYyAxNywgMjAxOSBhdCAwMTozODo1MVBNICswMTAwLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTozMSBQTSBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPj4+IE9uIDE3IERlY2VtYmVyIDIwMTkgMTI6MjEsIEdl
ZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+Pj4+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDEy
OjAzIFBNIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+Pj4+PiBPbiAxMyBEZWNlbWJlciAyMDE5
IDE3OjExLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+Pj4+PiBPbiBXZWQsIE5vdiAxMywg
MjAxOSBhdCAwMzo1MToyNVBNICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPj4+Pj4+
PiBBZGQgc3VwcG9ydCBmb3IgdHJhbnNwYXJlbnQgTFZEUyBkZWNvZGVycyBieSBhZGRpbmcgYSBu
ZXcKPiA+Pj4+Pj4+IGNvbXBhdGlibGUgc3RyaW5nICgibHZkcy1kZWNvZGVyIikgdG8gdGhlIGRy
aXZlci4KPiA+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIG1lbWJlciBjb25uZWN0b3JfdHlw
ZSB0byBzdHJ1Y3QgbHZkc19jb2RlYywKPiA+Pj4+Pj4+IGFuZCB0aGF0J3MgYmVjYXVzZSBMVkRT
IGRlY29kZXJzIGhhdmUgYSBkaWZmZXJlbnQgY29ubmVjdG9yIHR5cGUKPiA+Pj4+Pj4+IGZyb20g
TFZEUyBlbmNvZGVycy4gV2UgZmlsbCB0aGlzIG5ldyBtZW1iZXIgdXAgd2l0aCB0aGUgZGF0YQo+
ID4+Pj4+Pj4gbWF0Y2hpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nLgo+ID4+Pj4+Pj4KPiA+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJl
bmVzYXMuY29tPgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jCj4gPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2
ZHMtY29kZWMuYwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEBAIC02NSw2ICs2Nyw3IEBAIHN0YXRpYyBp
bnQgbHZkc19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+Pj4+
Pj4gICAgIGlmICghbHZkc19jb2RlYykKPiA+Pj4+Pj4+ICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+ICsgICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9
ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ID4+Pj4+Pgo+ID4+
Pj4+PiBJJ20gbm93IGdldHRpbmcgYSBjb21waWxhdGlvbiBmYWlsdXJlIGhlcmU6Cj4gPj4+Pj4+
Cj4gPj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jOiBJbiBmdW5jdGlv
biDigJhsdmRzX2NvZGVjX3Byb2Jl4oCZOgo+ID4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2x2ZHMtY29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIg
b2YgZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtY2FzdF0KPiA+Pj4+Pj4g
ICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwo+ID4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xgo+ID4+Pj4+Pgo+ID4+Pj4+PiBUaGUgZml4IHNob3VsZCBiZSBzaW1wbGU6Cj4gPj4+Pj4+Cj4g
Pj4+Pj4+ICAgICAgIGx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJfdClvZl9k
ZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSdtIGJvdGhlcmVk
IGJ5IHRoZSBmYWN0IHRoYXQgSSd2ZSBjb21waWxlZCB0aGlzIGJlZm9yZSB3aXRob3V0IGFueQo+
ID4+Pj4+PiBpc3N1ZSwgc28gdGhpcyByZWFsbHkgcHV6emxlcyBtZS4gRG8geW91IGdldCB0aGUg
c2FtZSB3YXJuaW5nID8KPiA+Pj4+Pgo+ID4+Pj4+IFRoZSB3YXJuaW5nIGFwcGVhcnMgd2hlbiBj
b21waWxpbmcgZm9yIGFybTY0LCB1bmRlcnN0YW5kYWJseSBzby4KPiA+Pj4+PiBXZSBtdXN0IGhh
dmUgY29tcGlsZWQgdGhpcyBmb3IgYXJtIG9ubHkgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLgo+ID4+
Pj4+Cj4gPj4+Pj4gSSB0aGluayB0aGUgcmlnaHQgd2F5IHRvIHNvbHZlIHRoaXMgaXMgdG8gZWl0
aGVyIGNhc3QgdG8gKHUzMikodWludHB0cl90KSBvciAodTMyKSh1bnNpZ25lZCBsb25nKS4KPiA+
Pj4+Cj4gPj4+PiBKdXN0IGNhc3RpbmcgdG8gdWludHB0cl90IHNob3VsZCBiZSBzdWZmaWNpZW50
Lgo+ID4+Pgo+ID4+PiBJdCBzaG91bGQgYmUgc3VmZmljaWVudCBmb3IgdGhlIGNvbXBpbGVyLCBi
dXQgSSBoYXZlIHNlZW4gZXhhbXBsZXMgd2hlcmUgcGVvcGxlCj4gPj4+IHByZWZlcnJlZCB0byBi
ZSBleHBsaWNpdCwgbGlrZSBpbjoKPiA+Pj4gZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxi
b3guYwo+ID4+PiBkcml2ZXJzL2xlZHMvbGVkcy1wbTgwNTguYwo+ID4+Pgo+ID4+PiBTaW5jZSB0
aGUga2VybmVsIGlzIGluY3JlYXNpbmcgaXRzIHRpZ2h0bmVzcyB3aXRoIHJlc3BlY3QgdG8gd2Fy
bmluZ3MsIEkgcGVyc29uYWxseSBwcmVmZXIKPiA+Pj4gKHUzMikodWludHB0cl90KSwgZXZlbiB0
aG91Z2ggbm90IHN0cmljdGx5IG5lY2Vzc2FyeSwgYnV0IEkgYW0gZmluZSB3aXRoICh1aW50cHRy
X3QpIGlmIHlvdQo+ID4+PiBkb24ndCBsaWtlICh1MzIpKHVpbnRwdHJfdCkuCj4gPj4KPiA+PiBJ
dCBkZXBlbmRzLiBJIHRyeSB0byBoYXZlIGFzIGZldyBjYXN0cyBhcyBwb3NzaWJsZSAoImNhc3Rz
IGFyZSBldmlsIikuCj4gPj4KPiA+PiBXaGlsZSBhZGRpbmcgdGhlIGV4dHJhICh1MzIpIGNhc3Qg
bWFrZXMgaXQgY2xlYXJlciB0aGF0IHRoZSBpbnRlbmRlZAo+ID4+IHJlc3VsdCBpcyBhIHUzMiAo
Zm9yIG5vdyksIGl0IHdpbGwgY2F1c2Ugc2lsZW50IHRydW5jYXRpb24gb24gNjQtYml0IGlmCj4g
Pj4gY29ubmVjdG9yX3R5cGUgaXMgZXZlciBlbmxhcmdlZCB0byB1bnNpZ25lZCBsb25nLCBhbmQg
bGFyZ2VyIHZhbHVlcyBhcmUKPiA+PiB1c2VkLgo+ID4+Cj4gPj4gSW4gdGhpcyBwYXJ0aWN1bGFy
IGNhc2UgdGhpcyBpcyB1bmxpa2VseSwgdGhvdWdoLCBhcyB1bnNpZ25lZCBsb25nIHdvdWxkCj4g
Pj4gc3RpbGwgYmUgMzItYml0IG9uIDMyLWJpdCBwbGF0Zm9ybXMsIHNvIHRoZSBsYXJnZXIgdmFs
dWVzIGNhbm5vdCBiZQo+ID4+IHVzZWQuCj4gPiAKPiA+IEkgYWxzbyB0cnkgdG8gYWRkIGFzIGZl
dyBjYXN0cyBhcyBwb3NzaWJsZSwgc28gKHVpbnRwdHJfdCkgd291bGQgYmUgbXkKPiA+IHByZWZl
cmVuY2UuCj4gPiAKPiA+IEZhYnJpemlvLCBjb3VsZCB5b3Ugc3VibWl0IGEgbmV3IHZlcnNpb24g
b2YgdGhpcyBwYXRjaCB3aXRoIHRoZSBwcm9ibGVtCj4gPiBmaXhlZCAoYW5kIHdpdGggdGhlIGNh
c3RzIHlvdSBkZWNpZGUgdG8gdXNlLCBidXQgdXNpbmcgdWludHB0cl90IGluc3RlYWQKPiA+IG9m
IHVuc2lnbmVkIGxvbmcgaW4gYW55IGNhc2UpID8KPiAKPiBXaWxsIHNlbmQgYSBuZXcgdmVyc2lv
biB0b21vcnJvdyB3aXRoICh1aW50cHRyX3QpCgpEb25lIGFzIHY0LjEgOi0pCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
