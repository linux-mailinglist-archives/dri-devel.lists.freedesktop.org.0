Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32DC108316
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 12:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475146E0E9;
	Sun, 24 Nov 2019 11:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96E06E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:18:01 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id u17so11529489ilq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 03:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrNkG5BlcOhjrLe97GUeq39ypxkKbi212efaOAD4P2s=;
 b=cFrKMTZ3elPytoonffll676xvaEzlLHZEDwdr37e7BkBA9PqbQe3qRigfXPjKEsZHB
 oBmVzz3h8Qr7XtJ8TWvbZE9B8/AToXLPQY8TyQu2qp0YXZ9bNsRssngaQ3sx2vtqwyWp
 BUjgzLZrN7pD8258YxeZmn+Ze5oR4UrSXSAI5/UnwXVff4iZryg6wa4lvRAweQ5BROIr
 h8TwC2Y5lcOlZk61Th+iPLtD4hycMWH4RH0uLg4iwJrQLYfrH50WuZMUVA5q1TavKcx2
 pD7c3Q+RjzTgI03JGReCjMrAsqyDjyoCGPSCMB0cdjTG5vNFqUdZ7CItjRCqlmGfcmLA
 bjXw==
X-Gm-Message-State: APjAAAVBMjcoFS3fta65RhLKf6mLejQV+5zRenwbW0xOBR4us14sQlFH
 xjUEIB1+hA+HETV/Z0xun+ZGCEDq4pKuL1sxWYdBiedG
X-Google-Smtp-Source: APXvYqyU6nAtmiR0JZrfSjQwWEHpTNwTOG7h4Efvp2GafGmDmtAQ2LNU6yK6AFqN6zLH8r/olIsnVPjP4i9DBn/9NJE=
X-Received: by 2002:a92:7e18:: with SMTP id z24mr26707570ilc.276.1574594280835; 
 Sun, 24 Nov 2019 03:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
 <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
 <20191101075726.GB6209@pendragon.ideasonboard.com>
 <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
In-Reply-To: <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 24 Nov 2019 05:17:49 -0600
Message-ID: <CAHCN7xK7vLufvEs1pgQoaJXO2yL4_9t12M2L67WJgTn9CWsBNQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CrNkG5BlcOhjrLe97GUeq39ypxkKbi212efaOAD4P2s=;
 b=HhwE+UJHsvX//yMR2M2WT3iVd6mbLRewPdBO4vT6Zo2hlD3s/TnCCBtk0dWcuTax4/
 2bNHqPVpMmUunoW44l8CMnj96Y9BAV/9kVePFUDmU6megNrbdzeKhKXq27wEP71z/X2H
 UwA1FCYh3VXyOiQpt7M9tPXF/YYkLNuD8W+RxrLIn2ql2c2xs2VKg9oKXqXLNbsfYVo8
 pTqGJE4g3nImEzKHLBK1WwqCBKha/0x8EFWMdi2wAqNuwFGgR6TwMgNXc3duLOnhXYnF
 0y62BvycRtAgmMezN3BP7OyFVwZE+W5pLbUBEW+Rf+711y8KKxConBU7iXO6W+SEYSwJ
 hWaw==
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgNzoxOSBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE5vdiAxLCAyMDE5IGF0IDI6NTcgQU0gTGF1cmVudCBQ
aW5jaGFydAo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDA5OjQ0OjIwQU0gLTA1MDAsIEFkYW0gRm9yZCB3
cm90ZToKPiA+ID4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgODo1MiBBTSBBZGFtIEZvcmQgPGFm
b3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBQcmV2aW91c2x5LCB0aGVy
ZSB3YXMgYW4gb21hcCBwYW5lbC1kcGkgZHJpdmVyIHRoYXQgd291bGQKPiA+ID4gPiByZWFkIGdl
bmVyaWMgdGltaW5ncyBmcm9tIHRoZSBkZXZpY2UgdHJlZSBhbmQgc2V0IHRoZSBkaXNwbGF5Cj4g
PiA+ID4gdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2ZXIgd2FzIHJlbW92ZWQgc28gdGhl
IHNjcmVlbgo+ID4gPiA+IG5vIGxvbmdlciBmdW5jdGlvbnMuICBUaGlzIHBhdGNoIG1vZGlmaWVz
IHRoZSBwYW5lbC1zaW1wbGUKPiA+ID4gPiBmaWxlIHRvIHNldHVwIHRoZSB0aW1pbmdzIHRvIHRo
ZSBzYW1lIHZhbHVlcyBwcmV2aW91c2x5IHVzZWQuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogOGJm
NGIxNjIxMTc4ICgiZHJtL29tYXA6IFJlbW92ZSBwYW5lbC1kcGkgZHJpdmVyIikKPiA+ID4KPiA+
ID4gV2lsbCB0aGlzIGJlIGFibGUgdG8gbWFrZSBpdCBpbnRvIGxpbnV4LW5leHQgZm9yIHRoZSA1
LjUgbWVyZ2Ugd2luZG93Pwo+ID4gPiBJIGJlbGlldmUgVG9ueSBoYXMgcGlja2VkIHVwIHRoZSBk
ZXZpY2UgdHJlZSBwb3J0aW9uIGluIGhpcyBvbWFwCj4gPiA+IHRyZWUsIGJ1dCBJIGhhdmVuJ3Qg
c2VlbiBhbnkgbm90aWZpY2F0aW9ucyBvbiB0aGlzIHNlcmllcyBvbiB3aGV0aGVyCj4gPiA+IG9y
IG5vdCBpdCdzIGJlaW5nIGFwcGxpZWQuICBJIGFsc28gZG9uJ3Qga25vdyB3aGljaCB0cmVlIEkg
bmVlZCB0bwo+ID4gPiBsb29rIGlmIGl0J3MgYWxyZWFkeSBiZWVuIGFwcGxpZWQuCj4gPiA+Cj4g
PiA+IFRoaXMgZml4ZXMgYSByZWdyZXNzaW9uIGludHJvZHVjZWQgYSB3aGlsZSBhZ28gd2hlcmUg
dGhlIGRyaXZlciBJIHdhcwo+ID4gPiB1c2luZyBmb3IgdGhlIGRpc3BsYXkgd2FzIHJlbW92ZWQu
Cj4gPgo+ID4gU2FtLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBwaWNrIHRoaXMgdXAgPwo+ClNhbSwK
Cj4gR2VudGxlIG51ZGdlIHdpdGggdGhlIG1lcmdlIHdpbmRvdyBhcHByb2FjaGluZy4KCklzIGl0
IHRvbyBsYXRlIGZvciA1LjU/ICA6LSgKCmFkYW0KPgo+IFRoYW5rIHlvdSwKPgo+IGFkYW0KPgo+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4K
PiA+ID4gPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+ID4g
PiA+IC0tLQo+ID4gPiA+IFY1OiAgTm8gQ2hhbmdlCj4gPiA+ID4gVjQ6ICBObyBDaGFuZ2UKPiA+
ID4gPiBWMzogIE5vIENoYW5nZQo+ID4gPiA+IFYyOiAgTm8gQ2hhbmdlCj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+ID4gaW5kZXggNWQ0ODc2ODZk
MjVjLi43MmY2OTcwOWYzNDkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCj4gPiA+ID4gQEAgLTIwNjEsNiArMjA2MSw0MCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgbWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9kZSA9IHsKPiA+
ID4gPiAgICAgICAgIC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTkhTWU5DIHwgRFJNX01PREVfRkxB
R19OVlNZTkMsCj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlIGxvZ2ljcGRfdHlwZV8yOF9tb2RlID0gewo+ID4gPiA+ICsgICAg
ICAgLmNsb2NrID0gOTAwMCwKPiA+ID4gPiArICAgICAgIC5oZGlzcGxheSA9IDQ4MCwKPiA+ID4g
PiArICAgICAgIC5oc3luY19zdGFydCA9IDQ4MCArIDMsCj4gPiA+ID4gKyAgICAgICAuaHN5bmNf
ZW5kID0gNDgwICsgMyArIDQyLAo+ID4gPiA+ICsgICAgICAgLmh0b3RhbCA9IDQ4MCArIDMgKyA0
MiArIDIsCj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgLnZkaXNwbGF5ID0gMjcyLAo+ID4gPiA+
ICsgICAgICAgLnZzeW5jX3N0YXJ0ID0gMjcyICsgMiwKPiA+ID4gPiArICAgICAgIC52c3luY19l
bmQgPSAyNzIgKyAyICsgMTEsCj4gPiA+ID4gKyAgICAgICAudnRvdGFsID0gMjcyICsgMiArIDEx
ICsgMywKPiA+ID4gPiArICAgICAgIC52cmVmcmVzaCA9IDYwLAo+ID4gPiA+ICsgICAgICAgLmZs
YWdzID0gRFJNX01PREVfRkxBR19QSFNZTkMgfCBEUk1fTU9ERV9GTEFHX1BWU1lOQywKPiA+ID4g
PiArfTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBs
b2dpY3BkX3R5cGVfMjggPSB7Cj4gPiA+ID4gKyAgICAgICAubW9kZXMgPSAmbG9naWNwZF90eXBl
XzI4X21vZGUsCj4gPiA+ID4gKyAgICAgICAubnVtX21vZGVzID0gMSwKPiA+ID4gPiArICAgICAg
IC5icGMgPSA4LAo+ID4gPiA+ICsgICAgICAgLnNpemUgPSB7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIC53aWR0aCA9IDEwNSwKPiA+ID4gPiArICAgICAgICAgICAgICAgLmhlaWdodCA9IDY3LAo+
ID4gPiA+ICsgICAgICAgfSwKPiA+ID4gPiArICAgICAgIC5kZWxheSA9IHsKPiA+ID4gPiArICAg
ICAgICAgICAgICAgLnByZXBhcmUgPSAyMDAsCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5lbmFi
bGUgPSAyMDAsCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC51bnByZXBhcmUgPSAyMDAsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgIC5kaXNhYmxlID0gMjAwLAo+ID4gPiA+ICsgICAgICAgfSwKPiA+
ID4gPiArICAgICAgIC5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKPiA+
ID4gPiArICAgICAgIC5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNf
RkxBR19QSVhEQVRBX0RSSVZFX1BPU0VER0UgfAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
IERSTV9CVVNfRkxBR19TWU5DX0RSSVZFX05FR0VER0UsCj4gPiA+ID4gK307Cj4gPiA+ID4gKwo+
ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbWl0c3ViaXNoaV9hYTA3MG1j
MDEgPSB7Cj4gPiA+ID4gICAgICAgICAubW9kZXMgPSAmbWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9k
ZSwKPiA+ID4gPiAgICAgICAgIC5udW1fbW9kZXMgPSAxLAo+ID4gPiA+IEBAIC0zMjg3LDYgKzMz
MjEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRj
aFtdID0gewo+ID4gPiA+ICAgICAgICAgfSwgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAuY29t
cGF0aWJsZSA9ICJsZyxscDEyOXFlIiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgLmRhdGEgPSAm
bGdfbHAxMjlxZSwKPiA+ID4gPiArICAgICAgIH0sIHsKPiA+ID4gPiArICAgICAgICAgICAgICAg
LmNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAu
ZGF0YSA9ICZsb2dpY3BkX3R5cGVfMjgsCj4gPiA+ID4gICAgICAgICB9LCB7Cj4gPiA+ID4gICAg
ICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gIm1pdHN1YmlzaGksYWEwNzBtYzAxLWNhMSIsCj4g
PiA+ID4gICAgICAgICAgICAgICAgIC5kYXRhID0gJm1pdHN1YmlzaGlfYWEwNzBtYzAxLAo+ID4K
PiA+IC0tCj4gPiBSZWdhcmRzLAo+ID4KPiA+IExhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
