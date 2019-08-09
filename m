Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76588BA0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959DF6E3FB;
	Sat, 10 Aug 2019 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78F6E290
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 09:04:46 +0000 (UTC)
Date: Fri, 9 Aug 2019 11:04:43 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Code Kipper <codekipper@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v8 4/4] arm64: dts: allwinner: orange-pi-3:
 Enable HDMI output
Message-ID: <20190809090443.kq5bnsrkgr746l2i@core.my.home>
Mail-Followup-To: Code Kipper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 dri-devel@lists.freedesktop.org,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20190806155744.10263-1-megous@megous.com>
 <20190806155744.10263-5-megous@megous.com>
 <CAEKpxBn1nF0t-M34iRSy1yYEuUxgNMUXFBhtjXBY8Qk+43zbDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEKpxBn1nF0t-M34iRSy1yYEuUxgNMUXFBhtjXBY8Qk+43zbDQ@mail.gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1565341484; bh=UgOyVx0PYKqYlPjCl68ial+Co8w66XtUj8b9RpCwBdc=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=EvnTqzJmVGd2jc4hzg6tPa+EoPcdRkTMwd/n/6vScf5kCdRQxLeCr6TioaSQKxl6w
 xK+69M6s2JeCqtvs57+gJtHaqY9I8QlTANjXAQourGbdt2S0TkIPPm0n7ExEyvB3Ii
 w2+gxFPlaVbU2FroS+8V6NzfRXQNlL98MzCi94a0=
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
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6MjU6MzJBTSArMDIwMCwgQ29kZSBLaXBwZXIgd3Jv
dGU6Cj4gT24gVHVlLCA2IEF1ZyAyMDE5IGF0IDE3OjU3LCA8bWVnb3VzQG1lZ291cy5jb20+IHdy
b3RlOgo+ID4KPiA+IEZyb206IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+ID4K
PiA+IE9yYW5nZSBQaSAzIGhhcyBhIEREQ19DRUNfRU4gc2lnbmFsIGNvbm5lY3RlZCB0byBQSDIs
IHRoYXQgZW5hYmxlcyB0aGUgRERDCj4gPiBJMkMgYnVzIHZvbHRhZ2Ugc2hpZnRlci4gQmVmb3Jl
IEVESUQgY2FuIGJlIHJlYWQsIHdlIG5lZWQgdG8gcHVsbCBQSDIgaGlnaC4KPiA+IFRoaXMgaXMg
cmVhbGl6ZWQgYnkgdGhlIGRkYy1lbi1ncGlvcyBwcm9wZXJ0eS4KPiBHcmVhdCB3b3JrLiBJcyB0
aGVyZSBhbnkgY2hhbmNlIHlvdSBjYW4gbW92ZSB0aGlzIHRvIHRoZQo+IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS5kdHNpPywgYXMgYWxsIHRoZSBINgo+
IGJhc2VkIG9yYW5nZS1waSdzIGhhdmUgdGhpcyBmZWF0dXJlLgoKSSBwbGFuIHRvIGRvIHRoYXQg
YXMgYSBmb2xsb3d1cCBwYXRjaCwgb25jZSB0aGlzIGlzIG1lcmdlZC4KCnJlZ2FyZHMsCglvLgoK
PiBCUiwKPiBDSwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0Bt
ZWdvdXMuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5n
ZXBpLTMuZHRzICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cwo+ID4gaW5kZXggMmM2ODA3Yjc0
ZmY2Li4wMWJiMWJhZmUyODQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Fs
bHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cwo+ID4gQEAgLTIyLDYgKzIy
LDE4IEBACj4gPiAgICAgICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBu
OCI7Cj4gPiAgICAgICAgIH07Cj4gPgo+ID4gKyAgICAgICBjb25uZWN0b3Igewo+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiaGRtaS1jb25uZWN0b3IiOwo+ID4gKyAgICAgICAgICAg
ICAgIGRkYy1lbi1ncGlvcyA9IDwmcGlvIDcgMiBHUElPX0FDVElWRV9ISUdIPjsgLyogUEgyICov
Cj4gPiArICAgICAgICAgICAgICAgdHlwZSA9ICJhIjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
ICBwb3J0IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhkbWlfY29uX2luOiBlbmRwb2lu
dCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmaGRtaV9vdXRfY29uPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiArICAg
ICAgICAgICAgICAgfTsKPiA+ICsgICAgICAgfTsKPiA+ICsKPiA+ICAgICAgICAgbGVkcyB7Cj4g
PiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiOwo+ID4KPiA+IEBAIC03
Miw2ICs4NCwxMCBAQAo+ID4gICAgICAgICBjcHUtc3VwcGx5ID0gPCZyZWdfZGNkY2E+Owo+ID4g
IH07Cj4gPgo+ID4gKyZkZSB7Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+
ID4gKwo+ID4gICZlaGNpMCB7Cj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+
ID4gQEAgLTkxLDYgKzEwNywxNiBAQAo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAg
fTsKPiA+Cj4gPiArJmhkbWkgewo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsK
PiA+ICsKPiA+ICsmaGRtaV9vdXQgewo+ID4gKyAgICAgICBoZG1pX291dF9jb246IGVuZHBvaW50
IHsKPiA+ICsgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfY29uX2luPjsK
PiA+ICsgICAgICAgfTsKPiA+ICt9Owo+ID4gKwo+ID4gICZtZGlvIHsKPiA+ICAgICAgICAgZXh0
X3JnbWlpX3BoeTogZXRoZXJuZXQtcGh5QDEgewo+ID4gICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+ID4gLS0KPiA+IDIuMjIuMAo+ID4K
PiA+IC0tCj4gPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJz
Y3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJsaW51eC1zdW54aSIgZ3JvdXAuCj4gPiBUbyB1
bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9t
IGl0LCBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LXN1bnhpK3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20uCj4gPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViLCB2aXNpdCBodHRw
czovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvbGludXgtc3VueGkvMjAxOTA4MDYxNTU3NDQu
MTAyNjMtNS1tZWdvdXMlNDBtZWdvdXMuY29tLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
