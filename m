Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A341108AEF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DDC89DB2;
	Mon, 25 Nov 2019 09:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12889DB2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:32:32 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iZAj7-0003nZ-CD; Mon, 25 Nov 2019 10:32:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] drm/bridge/synopsys: dsi: driver-specific
 configuration of phy timings
Date: Mon, 25 Nov 2019 10:32:12 +0100
Message-ID: <3580716.ThYBqbcnhK@diego>
In-Reply-To: <b8c43767-d065-d6da-a588-9a05e8aa4f1e@baylibre.com>
References: <20191123103904.22843-1-heiko@sntech.de> <5060226.21S8zkcLb9@phil>
 <b8c43767-d065-d6da-a588-9a05e8aa4f1e@baylibre.com>
MIME-Version: 1.0
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 briannorris@chromium.org, dianders@chromium.org,
 DRI Development <dri-devel@lists.freedesktop.org>, philippe.cornu@st.com,
 yannick.fertre@st.com, nickey.yang@rock-chips.com, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCAyNS4gTm92ZW1iZXIgMjAxOSwgMTA6Mjg6MTIgQ0VUIHNjaHJpZWIgTmVpbCBB
cm1zdHJvbmc6Cj4gSGksCj4gCj4gT24gMjMvMTEvMjAxOSAyMTo1MSwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gPiBIaSBOZWlsLAo+ID4gCj4gPiBBbSBTYW1zdGFnLCAyMy4gTm92ZW1iZXIgMjAx
OSwgMTM6Mzg6NDEgQ0VUIHNjaHJpZWIgTmVpbCBBcm1zdHJvbmc6Cj4gPj4gTGUgMjMvMTEvMjAx
OSDDoCAxMTozOSwgSGVpa28gU3R1ZWJuZXIgYSDDqWNyaXQgOgo+ID4+PiBGcm9tOiBIZWlrbyBT
dHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+ID4+Pgo+ID4+
PiBUaGUgdGltaW5nIHZhbHVlcyBmb3IgZHctZHNpIGFyZSBvZnRlbiBkZXBlbmRlbnQgb24gdGhl
IHVzZWQgZGlzcGxheSBhbmQKPiA+Pj4gYWNjb3JkaW5nIHRvIFBoaWxpcHBlIENvcm51IHdpbGwg
bW9zdCBsaWtlbHkgYWxzbyBkZXBlbmQgb24gdGhlIHVzZWQgcGh5Cj4gPj4+IHRlY2hub2xvZ3kg
aW4gdGhlIHNvYy1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbi4KPiA+Pj4KPiA+Pj4gVG8gc29sdmUg
dGhpcyBhbmQgYWxsb3cgc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zIHRvIGRlZmluZSB0aGVtIGFz
IG5lZWRlZAo+ID4+PiBhZGQgYSBuZXcgZ2V0X3RpbWluZyBjYWxsYmFjayB0byBwaHlfb3BzIGFu
ZCBjYWxsIHRoaXMgZnJvbSB0aGUgZHBoeV90aW1pbmcKPiA+Pj4gZnVuY3Rpb24gdG8gcmV0cmll
dmUgdGhlIG5lY2Vzc2FyeSB2YWx1ZXMgZm9yIHRoZSBzcGVjaWZpYyBtb2RlLgo+ID4+Pgo+ID4+
PiBSaWdodCBub3cgdGhpcyBoYW5kbGVzIHRoZSBoczJscCArIGxwMmhzIHdoZXJlIFJvY2tjaGlw
IFNvQ3MgbmVlZCBoYW5kbGluZwo+ID4+PiBhY2NvcmRpbmcgdG8gdGhlIHBoeSBzcGVlZCwgd2hp
bGUgU1RNIHNlZW1zIHRvIGJlIG9rIHdpdGggc3RhdGljIHZhbHVlcy4KPiA+Pj4KPiA+Pj4gY2hh
bmdlcyBpbiB2MzoKPiA+Pj4gLSBjaGVjayBleGlzdGVuY2Ugb2YgcGh5X29wcy0+Z2V0X3RpbWlu
ZyBpbiBfX2R3X21pcGlfZHNpX3Byb2JlKCkKPiA+Pj4gLSBlbWl0IGFjdHVhbCBlcnJvciB3aGVu
IGdldF90aW1pbmcoKSBjYWxsIGZhaWxzCj4gPj4+IC0gYWRkIHRhZ3MgZnJvbSBQaGlsaXBwZSBh
bmQgWWFubmljawo+ID4+Pgo+ID4+PiBjaGFuZ2VzIGluIHYyOgo+ID4+PiAtIGFkZCBkcml2ZXIt
c3BlY2lmaWMgaGFuZGxpbmcsIGRvbid0IGZvcmNlIGFsbCBicmlkZ2UgdXNlcnMgdG8gdXNlCj4g
Pj4+ICAgdGhlIHNhbWUgdGltaW5ncywgYXMgc3VnZ2VzdGVkIGJ5IFBoaWxpcHBlCj4gPj4+Cj4g
Pj4+IFN1Z2dlc3RlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9i
cm9tYS1zeXN0ZW1zLmNvbT4KPiA+Pj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGls
aXBwZS5jb3JudUBzdC5jb20+Cj4gPj4+IFRlc3RlZC1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5p
Y2suZmVydHJlQHN0LmNvbT4KPiAKPiAKPiBZb3UgZm9yZ290IHRvIENjIGRyaS1kZXZlbCwgc28g
SSBjYW4ndCBhcHBseSBpdC4KCm9oIGRhbmcgLi4uIHJlc2VuZCBjb21pbmcgc2hvcnRseQoKSGVp
a28KCj4gCj4gQ291bGQgeW91IHJlc2VudCBpdCA/Cj4gCj4gTmVpbAo+IAo+ID4+PiAtLS0KPiA+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDI3ICsr
KysrLS0KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAg
ICB8ICAxICsKPiA+Pj4gIC4uLi9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlw
LmMgICB8IDc4ICsrKysrKysrKysrKysrKysrKysKPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0v
ZHdfbWlwaV9kc2ktc3RtLmMgICAgICAgICB8IDEzICsrKysKPiA+Pj4gIGluY2x1ZGUvZHJtL2Jy
aWRnZS9kd19taXBpX2RzaS5oICAgICAgICAgICAgICB8ICA5ICsrKwo+ID4+PiAgNSBmaWxlcyBj
aGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+PiBbLi4u
XQo+ID4+Cj4gPj4KPiA+PiBMb29rcyBnb29kLAo+ID4+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPj4KPiA+PiBJIGNhbiBhcHBseSBpdCBv
biBtb25kYXkgaWYgeW91IHdhbnQuCj4gPiAKPiA+IHRoYXQgd291bGQgYmUgdmVyeSBjb29sLiBM
b29raW5nIGZvcndhcmQgdG8gbW9uZGF5IHRoZW4KPiA+IAo+ID4gVGhhbmtzCj4gPiBIZWlrbwo+
ID4gCj4gPiAKPiA+IAo+IAo+IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
