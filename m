Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100CF03D1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 18:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D587A6EB0B;
	Tue,  5 Nov 2019 17:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4C6EB0B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 17:07:58 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4C2021D81
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 17:07:58 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id u22so30299818qtq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 09:07:58 -0800 (PST)
X-Gm-Message-State: APjAAAWiGIErzY3WDW68BxlVwCNVt/hXr4yLJfcA9llluaO2IMoKNSra
 VNTUVd1z/amjwS5b9u0Fh5O4kErP3dGYtQ2h8Q==
X-Google-Smtp-Source: APXvYqz9/z2im9e76vhu3PDX2geLlkCL/9xOMZgc1KJo/mqie7zy7vcexLdTcRMCQUecwC+40LweB/fouXV5OHZ5gYU=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr19273736qtn.300.1572973677688; 
 Tue, 05 Nov 2019 09:07:57 -0800 (PST)
MIME-Version: 1.0
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
 <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 5 Nov 2019 11:07:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
Message-ID: <CAL_JsqL6Nzr2oBh51PZnQfBUK1ggDcZUrLaSP2GvEycwFAwJZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose
 lvds-encoder
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572973678;
 bh=982pnP21u6SLHEwMF1WidZv9LQW97H7o7tJaYDJdzz8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0DSgrhZ2NAQhUICtqBtKwZHph/j5WuH2vsCL7/O/tCwFJfttlXO//skvCyIcr6fdd
 Q8tAcB47lt7ul0ex99vhOzzEr+FfuPk5P3fG+KSCRRyuYA7q31PBff6umt9ZGQnPMm
 P3/5t/FhJMZP3RezivC4wWbs0XUqdezmJOg8OjR8=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAzOjMzIEFNIEZhYnJpemlvIENhc3Rybwo8ZmFicml6aW8u
Y2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPgo+IEhlbGxvIFJvYiwKPgo+IFRoYW5rIHlv
dSBmb3IgeW91ciBmZWVkYmFjayEKPgo+ID4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz4KPiA+IFNlbnQ6IDA0IE5vdmVtYmVyIDIwMTkgMjE6MjMKPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMi80XSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBSZXB1cnBvc2Ug
bHZkcy1lbmNvZGVyCj4gPgo+ID4gT24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxMDo1OCBBTSBGYWJy
aXppbyBDYXN0cm8KPiA+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBJbiBhbiBlZmZvcnQgdG8gcmVwdXJwb3NlIGx2ZHMtZW5jb2Rlci5jIHRvIGFs
c28gc2VydmUgdGhlCj4gPiA+IGZ1bmN0aW9uIG9mIExWRFMgZGVjb2RlcnMsIHdlIGVuZGVkIHVw
IGRlZmluaW5nIGEgbmV3ICJnZW5lcmljIgo+ID4gPiBjb21wYXRpYmxlIHN0cmluZywgdGhlcmVm
b3JlIGFkYXB0IHRoZSBkdC1iaW5kaW5ncyB0byBmaXQgdGhlCj4gPiA+IG5ldyBwdXJwb3NlLiBB
bHNvLCBjb252ZXJ0IHRoZSBkdC1iaW5kaW5ncyBmcm9tIC50eHQgdG8gLnlhbWwKPiA+ID4gd2hp
bGUgYXQgaXQuCj4gPgo+ID4gIkFsc28sIC4uLiB3aGlsZSBhdCBpdC4iIGlzIGEgc2lnbiBmb3Ig
c3BsaXQgaW50byAyIHBhdGNoZXMuCj4KPiBXaWxsIHNwbGl0IGludG8gMiBwYXRjaGVzCj4KPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4gdjEtPnYyOgo+ID4gPiAqIENvbnZl
cnRlZCB0byBkdC1zY2hlbWEgYXMgcGVyIE5laWwncyBjb21tZW50Cj4gPiA+IC0tLQo+ID4gPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbCAgICAgICAgfCAxMTcg
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bHZkcy10cmFuc21pdHRlci50eHQgICB8ICA2NiAtLS0tLS0tLS0tLS0KPiA+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQo+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9sdmRzLWNvZGVjLnlhbWwKPiA+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50
eHQKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAo+ID4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwLi5mZjc5YmMyCj4gPiA+IC0t
LSAvZGV2L251bGwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAo+ID4gPiBAQCAtMCwwICsxLDExNyBAQAo+
ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiArJVlBTUwgMS4y
Cj4gPiA+ICstLS0KPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlz
cGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sIwo+ID4gPiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsKPiA+ID4gK3RpdGxlOiBU
cmFzbnBhcmVudCBMVkRTIGVuY29kZXJzIGFuZCBMVkRTIGRlY29kZXJzCj4gPgo+ID4gVHlwbwo+
Cj4gV2lsbCBmaXgKPgo+ID4KPiA+ID4gKwo+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ICsgIC0g
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+Cj4gPiA+ICsKPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgIFRoaXMgYmluZGluZyBz
dXBwb3J0cyB0cmFuc3BhcmVudCBMVkRTIGVuY29kZXJzIGFuZCBMVkRTIGRlY29kZXJzIHRoYXQg
ZG9uJ3QKPiA+ID4gKyAgcmVxdWlyZSBhbnkgY29uZmlndXJhdGlvbi4KPiA+ID4gKwo+ID4gPiAr
ICBMVkRTIGlzIGEgcGh5c2ljYWwgbGF5ZXIgc3BlY2lmaWNhdGlvbiBkZWZpbmVkIGluIEFOU0kv
VElBL0VJQS02NDQtQS4gTXVsdGlwbGUKPiA+ID4gKyAgaW5jb21wYXRpYmxlIGRhdGEgbGluayBs
YXllcnMgaGF2ZSBiZWVuIHVzZWQgb3ZlciB0aW1lIHRvIHRyYW5zbWl0IGltYWdlIGRhdGEKPiA+
ID4gKyAgdG8gTFZEUyBwYW5lbHMuIFRoaXMgYmluZGluZyB0YXJnZXRzIGRldmljZXMgY29tcGF0
aWJsZSB3aXRoIHRoZSBmb2xsb3dpbmcKPiA+ID4gKyAgc3BlY2lmaWNhdGlvbnMgb25seS4KPiA+
ID4gKwo+ID4gPiArICBbSkVJREFdICJEaWdpdGFsIEludGVyZmFjZSBTdGFuZGFyZHMgZm9yIE1v
bml0b3IiLCBKRUlEQS01OS0xOTk5LCBGZWJydWFyeQo+ID4gPiArICAxOTk5IChWZXJzaW9uIDEu
MCksIEphcGFuIEVsZWN0cm9uaWMgSW5kdXN0cnkgRGV2ZWxvcG1lbnQgQXNzb2NpYXRpb24gKEpF
SURBKQo+ID4gPiArICBbTERJXSAiT3BlbiBMVkRTIERpc3BsYXkgSW50ZXJmYWNlIiwgTWF5IDE5
OTkgKFZlcnNpb24gMC45NSksIE5hdGlvbmFsCj4gPiA+ICsgIFNlbWljb25kdWN0b3IKPiA+ID4g
KyAgW1ZFU0FdICJWRVNBIE5vdGVib29rIFBhbmVsIFN0YW5kYXJkIiwgT2N0b2JlciAyMDA3IChW
ZXJzaW9uIDEuMCksIFZpZGVvCj4gPiA+ICsgIEVsZWN0cm9uaWNzIFN0YW5kYXJkcyBBc3NvY2lh
dGlvbiAoVkVTQSkKPiA+ID4gKwo+ID4gPiArICBUaG9zZSBkZXZpY2VzIGhhdmUgYmVlbiBtYXJr
ZXRlZCB1bmRlciB0aGUgRlBELUxpbmsgYW5kIEZsYXRMaW5rIGJyYW5kIG5hbWVzCj4gPiA+ICsg
IGFtb25nIG90aGVycy4KPiA+ID4gKwo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gKyAgY29tcGF0
aWJsZToKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgQW55IGVuY29kZXIg
b3IgZGVjb2RlciBjb21wYXRpYmxlIHdpdGggdGhpcyBnZW5lcmljIGJpbmRpbmcsIGJ1dCB3aXRo
Cj4gPiA+ICsgICAgICBhZGRpdGlvbmFsIHByb3BlcnRpZXMgbm90IGxpc3RlZCBoZXJlLCBtdXN0
IGRlZmluZSBpdHMgb3duIGJpbmRpbmcgYW5kCj4gPiA+ICsgICAgICBsaXN0IGEgZGV2aWNlIHNw
ZWNpZmljIGNvbXBhdGlibGUgZmlyc3QgZm9sbG93ZWQgYnkgdGhlIGdlbmVyaWMgY29tcGF0aWJs
ZQo+ID4gPiArICAgIGl0ZW1zOgo+ID4gPiArICAgICAgLSBlbnVtOgo+ID4KPiA+IFlvdSBjYW4g
ZHJvcCAnaXRlbXMnIHdoZW4gdGhlcmUncyBvbmx5IDEuCj4KPiBXaWxsIGRyb3AKPgo+ID4KPiA+
ID4gKyAgICAgICAgLSBsdmRzLWVuY29kZXIgIyBmb3IgTFZEUyBlbmNvZGVycwo+ID4gPiArICAg
ICAgICAtIGx2ZHMtZGVjb2RlciAjIGZvciBMVkRTIGRlY29kZXJzCj4gPiA+ICsKPiA+ID4gKyAg
cG9ydHM6Cj4gPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiA+ICsgICAgZGVzY3JpcHRpb246IHwK
PiA+ID4gKyAgICAgIFRoaXMgZGV2aWNlIGhhcyB0d28gdmlkZW8gcG9ydHMuIFRoZWlyIGNvbm5l
Y3Rpb25zIGFyZSBtb2RlbGVkIHVzaW5nIHRoZQo+ID4gPiArICAgICAgT0YgZ3JhcGggYmluZGlu
Z3Mgc3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50
eHQKPiA+ID4gKyAgICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgICAgcG9ydEAwOgo+ID4gPiArICAg
ICAgICB0eXBlOiBvYmplY3QKPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ID4gKyAg
ICAgICAgICBXaXRoIExWRFMgZW5jb2RlcnMgcG9ydCAwIGlzIGZvciBwYXJhbGxlbCBpbnB1dAo+
ID4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBwb3J0IDAgaXMgZm9yIExWRFMgaW5w
dXQKPiA+ID4gKwo+ID4gPiArICAgICAgcG9ydEAxOgo+ID4gPiArICAgICAgICB0eXBlOiBvYmpl
Y3QKPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ID4gKyAgICAgICAgICBXaXRoIExW
RFMgZW5jb2RlcnMgcG9ydCAxIGlzIGZvciBMVkRTIG91dHB1dAo+ID4gPiArICAgICAgICAgIFdp
dGggTFZEUyBkZWNvZGVycyBwb3J0IDEgaXMgZm9yIHBhcmFsbGVsIG91dHB1dAo+ID4KPiA+IHBv
cnRAKiBhcmUgcmVxdWlyZWQsIHJpZ2h0Pwo+Cj4gWWVzLCBwb3J0QDAgYW5kIHBvcnRAMSBhcmUg
Ym90aCByZXF1aXJlZCwgc2ltaWxhcmx5IHRvOgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1sCj4gdGhlcmVmb3JlIEkgaGF2ZSBwdXQg
InBvcnRzIiB1bmRlciAicmVxdWlyZWQiLCBpbiBhIHNpbWlsYXIgZmFzaGlvbi4KPiBXaGF0J3Mg
dGhlIHJpZ2h0IHdheSBvZiBzcGVjaWZ5aW5nIHRoaXM/CgpTYW1lIGFzIGFueSBvdGhlciBwcm9w
ZXJ0eToKCnJlcXVpcmVkOgogIC0gcG9ydEAwCiAgLSBwb3J0QDEKCkF0IHRoZSBjb3JyZWN0IGxl
dmVsIG9mIGNvdXJzZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
