Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82492407B
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 20:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A741189174;
	Mon, 20 May 2019 18:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC58826D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 18:35:57 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id k1so4129012vkb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 11:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rJByBVnGlp63e7yCKsZ7SDuzR3kRoRVQ2u81Jed5J5c=;
 b=KrWaGNQb9vOd3fpP4oCUn7sMOyw0+MdzVG/lq0QX9VB/A/lXYO98uc75Y1N+nqADcQ
 ZJXh5C/k9q590gfuOOG3eQE2p2hrJQuvADXulpVKpuFTyB76u6Kc00LXmjpoFTTKxBLw
 6tP//UTMabcR6+/g0P3a4loRjCFTUI7XiHz4E7ym18DqDLTYCB7xHgnZuRD5hGgS7Mw1
 /kR3RDav7JrxA0B4PBgtAh1sxRmvrGF3Hr4X/lVWnnjjUtn5HIfmowR6IxqfecjKqIJb
 Dk/30GnJggCIHuCq6hH1WfuDkhv6ZG5BdGbJ5xuLO1KoAW4ZVy19hpbH430xyTjWK2uA
 rF1A==
X-Gm-Message-State: APjAAAVzh5ZTXyl+pGzm4LR6YcvOEIE9jJRAd6cDcK6sL9wUHc/dJ1Xc
 BF6iJx4PzhVc534Zr9Hdnypvo6GMYe4=
X-Google-Smtp-Source: APXvYqzsevAkHm0vEjjWFMVKQej8hzbr++O048p72sif69VmGXPMZTqj341mM65Qx7LARrO2cSfSOw==
X-Received: by 2002:a1f:a746:: with SMTP id q67mr8912147vke.4.1558377356287;
 Mon, 20 May 2019 11:35:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id u37sm280984uau.9.2019.05.20.11.35.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 11:35:55 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id l20so9548798vsp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 11:35:55 -0700 (PDT)
X-Received: by 2002:a67:dd8e:: with SMTP id i14mr31065192vsk.149.1558377354571; 
 Mon, 20 May 2019 11:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org> <20190408103240.GF6644@ulmo>
 <CAD=FV=UJXLeEDPRAHY5-f2D4qJ4rq0LmKUDf4MANrb5KOm_x=g@mail.gmail.com>
In-Reply-To: <CAD=FV=UJXLeEDPRAHY5-f2D4qJ4rq0LmKUDf4MANrb5KOm_x=g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2019 11:35:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKkfhS8q2Wnx6PfHyq8m6oGhu=RideOykdTQ4dJrwfUg@mail.gmail.com>
Message-ID: <CAD=FV=WKkfhS8q2Wnx6PfHyq8m6oGhu=RideOykdTQ4dJrwfUg@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to
 simple-panel
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rJByBVnGlp63e7yCKsZ7SDuzR3kRoRVQ2u81Jed5J5c=;
 b=SXkXCP1GPoj17g4AfmKPdPV0NMDi4QcPSc930K1MaUzykox1V/AWM7p2qi1vBMUV6A
 59guNLCDAi9jEpOeuMIHyL4RMfZYpZB5w864pCNBczZY7zbrSjAe4aT6y3rUL1H7rohE
 f828A3dpBu61qyr0ohzqi8XBPtXz4sf44/Wug=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpZXJyeSwKCk9uIE1vbiwgQXByIDgsIDIwMTkgYXQgNzozOSBBTSBEb3VnIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gVGhpZXJyeSwKPgo+IE9uIE1vbiwgQXBy
IDgsIDIwMTkgYXQgMzozMiBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEFwciAwMSwgMjAxOSBhdCAxMDoxNzoxOEFNIC0w
NzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5w
YXVsQGNocm9taXVtLm9yZz4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHN1Ym5v
ZGUgdG8gc2ltcGxlLXBhbmVsIGFsbG93aW5nIHVzIHRvIG92ZXJyaWRlCj4gPiA+IHRoZSB0eXBp
Y2FsIHRpbWluZyBleHByZXNzZWQgaW4gdGhlIHBhbmVsJ3MgZGlzcGxheV90aW1pbmcuCj4gPiA+
Cj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ICAtIFNwbGl0IG91dCB0aGUgYmluZGluZyBpbnRv
IGEgbmV3IHBhdGNoIChSb2IpCj4gPiA+ICAtIGRpc3BsYXktdGltaW5ncyBpcyBhIG5ldyBzZWN0
aW9uIChSb2IpCj4gPiA+ICAtIFVzZSB0aGUgZnVsbCBkaXNwbGF5LXRpbWluZ3Mgc3Vibm9kZSBp
bnN0ZWFkIG9mIHBpY2tpbmcgdGhlIHRpbWluZwo+ID4gPiAgICBvdXQgKFJvYi9UaGllcnJ5KQo+
ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAgLSBHbyBiYWNrIHRvIHVzaW5nIHRoZSB0aW1pbmcg
c3Vibm9kZSBkaXJlY3RseSwgYnV0IHJlbmFtZSB0bwo+ID4gPiAgICBwYW5lbC10aW1pbmcgKFJv
YikKPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gIC0gU2ltcGxpZnkgZGVzYy4gZm9yIHdoZW4g
b3ZlcnJpZGUgc2hvdWxkIGJlIHVzZWQgKFRoaWVycnkvTGF1cmVudCkKPiA+ID4gIC0gUmVtb3Zl
ZCBSb2IgSCByZXZpZXcgc2luY2UgaXQncyBiZWVuIGEgeWVhciBhbmQgd29yZGluZyBjaGFuZ2Vk
Cj4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+ICAtIFJlbW92ZWQgYml0IGFib3V0IE9TIG1heSBp
Z25vcmUgKFJvYi9FemVxdWllbCkKPiA+ID4KPiA+ID4gQ2M6IERvdWcgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4KPiA+ID4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+
Cj4gPiA+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gPiBDYzogSmVm
ZnkgQ2hlbiA8amVmZnkuY2hlbkByb2NrLWNoaXBzLmNvbT4KPiA+ID4gQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gPiA+IENjOiBTdMOpcGhhbmUgTWFyY2hlc2luIDxtYXJj
aGV1QGNocm9taXVtLm9yZz4KPiA+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGlu
Z0BnbWFpbC5jb20+Cj4gPiA+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+ID4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBDYzogbGludXgtcm9ja2No
aXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3NpbXBsZS1wYW5lbC50eHQgICB8IDIyICsrKysrKysrKysrKysr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9zaW1wbGUtcGFuZWwudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dAo+ID4gPiBpbmRleCBiMmI4NzJjNzEwZjIu
LjkzODgyMjY4YzBiOSAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dAo+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaW1wbGUtcGFuZWwu
dHh0Cj4gPiA+IEBAIC0xNSw2ICsxNSwxNiBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ID4gPiAg
ICAoaG90IHBsdWcgZGV0ZWN0KSBzaWduYWwsIGJ1dCB0aGUgc2lnbmFsIGlzbid0IGhvb2tlZCB1
cCBzbyB3ZSBzaG91bGQKPiA+ID4gICAgaGFyZGNvZGUgdGhlIG1heCBkZWxheSBmcm9tIHRoZSBw
YW5lbCBzcGVjIHdoZW4gcG93ZXJpbmcgdXAgdGhlIHBhbmVsLgo+ID4gPgo+ID4gPiArcGFuZWwt
dGltaW5nIHN1Ym5vZGUKPiA+Cj4gPiBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB3ZSBuZWVkIHRo
ZSBwYW5lbC0gcHJlZml4PyBUaGlzIGlzIGFscmVhZHkgcGFydAo+ID4gb2YgYSBwYW5lbCBkZWZp
bml0aW9uLCBzbyBpdCdzIGNvbXBsZXRlbHkgcmVkdW5kYW50LiBXaHkgbm90IGp1c3QgbmFtZQo+
ID4gdGhlIHN1Ym5vZGUgInRpbWluZyI/Cj4KPiBJdCB3YXMgYSByZWFsbHkgbG9uZyB0aW1lIGFn
byBzaW5jZSB0aGlzIHBhdGNoIHNlcmllcyB3YXMgaWRsZSBmb3IgYQo+IHdoaWxlLCBidXQgeW91
IHByZXZpb3VzIGhhZCBzaW1pbGFyIGZlZWRiYWNrIGluIHYzIGJ1dCBlbmRlZCB1cCBPSwo+IHdp
dGggaXQuICBTZWU6Cj4KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMjA3
NTgzLwo+Cj4gSSBiZWxpZXZlIHRoZSBvcmlnaW5hbCBub2RlIG5hbWUgY2FtZSBvdXQgb2Ygc29t
ZSBiYWNrIGFuZCBmb3J0aAo+IGJldHdlZW4gUm9iIGFuZCBTZWFuLiAgQXMgZmFyIGFzIEkgY2Fu
IHRlbGwsIHRoZSBjb250ZXh0IGlzIGJhY2sgaW4KPiA8aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDIwMzQ4My8+LiAgSSB0aGluayBSb2Igd2FudGVkIGl0Cj4gdG8gZm9sbG93
IG90aGVyIHNpbWlsYXIgbm9kZSBuYW1lcy4KPgo+Cj4gVGhhdCBhbGwgYmVpbmcgc2FpZCwgaWYg
eW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgYmVpbmcgY2FsbGVkCj4gInRpbWluZyIgYW5kIFJv
YidzIE9LIHcvIHRoYXQgdG9vIHRoZW4gSSdsbCByZS1zcGluIHRoZSBzZXJpZXMuCgpXaXRoIDUu
Mi1yYzEgb3V0LCBtYXliZSB0aGlzIHNlcmllcyBpcyByZWFkeSB0byBsYW5kPyAgSWYgeW91J2Qg
bGlrZQptZSB0byBjaGFuZ2UgdGhpbmdzIGFzIHBlciBhYm92ZSBJIGNhbi4gIC4uLmJ1dCBpdCBm
ZWVscyBsaWtlIGtlZXBpbmcKdGhlIGFscmVhZHktYWdyZWVkLXVwb24gbmFtZSBtaWdodCBiZSBl
YXNpZXN0IC8gYmVzdD8gIFByZXN1bWFibHkKeW91J2QgbGFuZCBwYXRjaGVzIDEsIDIsIDQsIGFu
ZCA1IGFuZCB0aGVuIEhlaWtvIGNvdWxkIGxhbmQgdGhlIGR0cwpwYXRjaGVzPwoKVGhhbmtzIQoK
LURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
