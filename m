Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BAF74A5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 14:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3206E90F;
	Mon, 11 Nov 2019 13:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64BA6E90F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 13:19:52 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k13so6113354ioa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 05:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRKDx6Fejpor5pYdLn7G3kgNJ1vgpNwffUtYoE2a0oQ=;
 b=LOM66i5JwzGo+zn685kmjhKJV8DJLx5GeU7Dhhvv5TDdQRCjFQUBOdJSB5GY9yFMxF
 CPmgt9tLwHTl6ywZobPthh/fZxatUGxvHp1akkDPjcL3DGGXkgxZVXv60w+lRO2M+J5T
 cmztlY4YjMzeUff7YtAWfcjbsfgGWMZOcXdOXurvdONaYdNJclX+e+izZ0vASzG25VW9
 PuLqkxZ0MoecjvGp3fH5FJ10cM2JsO8a0I/178k3dHgEzC4TztcYVNBhb0dC7uIoiglz
 8ut7yjRAJsFiFHv07+gtMtWtdz/jkhE/0CtblvMs13+/QhZESiLNMhKv3Hhg5SQoCTQV
 aUWQ==
X-Gm-Message-State: APjAAAWsMevyevOG9ARTVSTcCU7MbfiuUMD/LxoerDkB6sj+EI4I+cOW
 vUA9a+5qHjrCVdf7qakRuwO+kArbzLyMO3DfbZQ=
X-Google-Smtp-Source: APXvYqyGIUTyr+1o8xjw2JPHnMGy0W5HE7ZnIXmNr6qQj4tdycsdQYWpeb8DZtkEpJZuvKILmsvQOeGz0wT4GkeS+qw=
X-Received: by 2002:a5e:8c0a:: with SMTP id n10mr25782091ioj.78.1573478391683; 
 Mon, 11 Nov 2019 05:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
 <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
 <20191101075726.GB6209@pendragon.ideasonboard.com>
In-Reply-To: <20191101075726.GB6209@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 11 Nov 2019 07:19:40 -0600
Message-ID: <CAHCN7x+cCyQ=kp30Z9Vu6-feU2Yp6b=kui-h6G8t67abhYXpCw@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iRKDx6Fejpor5pYdLn7G3kgNJ1vgpNwffUtYoE2a0oQ=;
 b=Gdaw3O8jb/PC9I3quBaFNFdXhsLl5xBsKkgou1e+Bqj87wCCdnWo6RL621XW4/F6xm
 o39SfkWAw0j4yM91e9xwJ8shnusIHbUbtSPUY+HxVINCpHWYVBdlED7E+iD2OX7e6GyO
 pHaZ5LO1wYf77A+/Mg3jkjtHAESyJYWiIjL7owvM1VZ7poSVvGtKrVdPK+MwOIt05pmO
 lETO3t6URRBV7XosrTBH9BMkauNKjpE9MVUp0Is/Q8PpnVlqEtlkqlx3fDRnk3ZK1NQg
 em5v59MvK4BAT7na6dNq6gdGc7ZZGIPcLpJX6wQksVmfZruLZEyWSVrY9erTAEBr2EvI
 4ipQ==
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

T24gRnJpLCBOb3YgMSwgMjAxOSBhdCAyOjU3IEFNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAzMCwgMjAx
OSBhdCAwOTo0NDoyMEFNIC0wNTAwLCBBZGFtIEZvcmQgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAx
NiwgMjAxOSBhdCA4OjUyIEFNIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gUHJldmlvdXNseSwgdGhlcmUgd2FzIGFuIG9tYXAgcGFuZWwtZHBpIGRyaXZl
ciB0aGF0IHdvdWxkCj4gPiA+IHJlYWQgZ2VuZXJpYyB0aW1pbmdzIGZyb20gdGhlIGRldmljZSB0
cmVlIGFuZCBzZXQgdGhlIGRpc3BsYXkKPiA+ID4gdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBk
cml2ZXIgd2FzIHJlbW92ZWQgc28gdGhlIHNjcmVlbgo+ID4gPiBubyBsb25nZXIgZnVuY3Rpb25z
LiAgVGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgcGFuZWwtc2ltcGxlCj4gPiA+IGZpbGUgdG8gc2V0
dXAgdGhlIHRpbWluZ3MgdG8gdGhlIHNhbWUgdmFsdWVzIHByZXZpb3VzbHkgdXNlZC4KPiA+ID4K
PiA+ID4gRml4ZXM6IDhiZjRiMTYyMTE3OCAoImRybS9vbWFwOiBSZW1vdmUgcGFuZWwtZHBpIGRy
aXZlciIpCj4gPgo+ID4gV2lsbCB0aGlzIGJlIGFibGUgdG8gbWFrZSBpdCBpbnRvIGxpbnV4LW5l
eHQgZm9yIHRoZSA1LjUgbWVyZ2Ugd2luZG93Pwo+ID4gSSBiZWxpZXZlIFRvbnkgaGFzIHBpY2tl
ZCB1cCB0aGUgZGV2aWNlIHRyZWUgcG9ydGlvbiBpbiBoaXMgb21hcAo+ID4gdHJlZSwgYnV0IEkg
aGF2ZW4ndCBzZWVuIGFueSBub3RpZmljYXRpb25zIG9uIHRoaXMgc2VyaWVzIG9uIHdoZXRoZXIK
PiA+IG9yIG5vdCBpdCdzIGJlaW5nIGFwcGxpZWQuICBJIGFsc28gZG9uJ3Qga25vdyB3aGljaCB0
cmVlIEkgbmVlZCB0bwo+ID4gbG9vayBpZiBpdCdzIGFscmVhZHkgYmVlbiBhcHBsaWVkLgo+ID4K
PiA+IFRoaXMgZml4ZXMgYSByZWdyZXNzaW9uIGludHJvZHVjZWQgYSB3aGlsZSBhZ28gd2hlcmUg
dGhlIGRyaXZlciBJIHdhcwo+ID4gdXNpbmcgZm9yIHRoZSBkaXNwbGF5IHdhcyByZW1vdmVkLgo+
Cj4gU2FtLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBwaWNrIHRoaXMgdXAgPwoKR2VudGxlIG51ZGdl
IHdpdGggdGhlIG1lcmdlIHdpbmRvdyBhcHByb2FjaGluZy4KClRoYW5rIHlvdSwKCmFkYW0KCj4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gPiA+
IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+IC0tLQo+
ID4gPiBWNTogIE5vIENoYW5nZQo+ID4gPiBWNDogIE5vIENoYW5nZQo+ID4gPiBWMzogIE5vIENo
YW5nZQo+ID4gPiBWMjogIE5vIENoYW5nZQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCj4gPiA+IGluZGV4IDVkNDg3Njg2ZDI1Yy4uNzJmNjk3MDlmMzQ5IDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+IEBAIC0yMDYx
LDYgKzIwNjEsNDAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1pdHN1
YmlzaGlfYWEwNzBtYzAxX21vZGUgPSB7Cj4gPiA+ICAgICAgICAgLmZsYWdzID0gRFJNX01PREVf
RkxBR19OSFNZTkMgfCBEUk1fTU9ERV9GTEFHX05WU1lOQywKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbG9naWNwZF90eXBlXzI4X21v
ZGUgPSB7Cj4gPiA+ICsgICAgICAgLmNsb2NrID0gOTAwMCwKPiA+ID4gKyAgICAgICAuaGRpc3Bs
YXkgPSA0ODAsCj4gPiA+ICsgICAgICAgLmhzeW5jX3N0YXJ0ID0gNDgwICsgMywKPiA+ID4gKyAg
ICAgICAuaHN5bmNfZW5kID0gNDgwICsgMyArIDQyLAo+ID4gPiArICAgICAgIC5odG90YWwgPSA0
ODAgKyAzICsgNDIgKyAyLAo+ID4gPiArCj4gPiA+ICsgICAgICAgLnZkaXNwbGF5ID0gMjcyLAo+
ID4gPiArICAgICAgIC52c3luY19zdGFydCA9IDI3MiArIDIsCj4gPiA+ICsgICAgICAgLnZzeW5j
X2VuZCA9IDI3MiArIDIgKyAxMSwKPiA+ID4gKyAgICAgICAudnRvdGFsID0gMjcyICsgMiArIDEx
ICsgMywKPiA+ID4gKyAgICAgICAudnJlZnJlc2ggPSA2MCwKPiA+ID4gKyAgICAgICAuZmxhZ3Mg
PSBEUk1fTU9ERV9GTEFHX1BIU1lOQyB8IERSTV9NT0RFX0ZMQUdfUFZTWU5DLAo+ID4gPiArfTsK
PiA+ID4gKwo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGxvZ2ljcGRfdHlw
ZV8yOCA9IHsKPiA+ID4gKyAgICAgICAubW9kZXMgPSAmbG9naWNwZF90eXBlXzI4X21vZGUsCj4g
PiA+ICsgICAgICAgLm51bV9tb2RlcyA9IDEsCj4gPiA+ICsgICAgICAgLmJwYyA9IDgsCj4gPiA+
ICsgICAgICAgLnNpemUgPSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAud2lkdGggPSAxMDUsCj4g
PiA+ICsgICAgICAgICAgICAgICAuaGVpZ2h0ID0gNjcsCj4gPiA+ICsgICAgICAgfSwKPiA+ID4g
KyAgICAgICAuZGVsYXkgPSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAucHJlcGFyZSA9IDIwMCwK
PiA+ID4gKyAgICAgICAgICAgICAgIC5lbmFibGUgPSAyMDAsCj4gPiA+ICsgICAgICAgICAgICAg
ICAudW5wcmVwYXJlID0gMjAwLAo+ID4gPiArICAgICAgICAgICAgICAgLmRpc2FibGUgPSAyMDAs
Cj4gPiA+ICsgICAgICAgfSwKPiA+ID4gKyAgICAgICAuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19G
TVRfUkdCODg4XzFYMjQsCj4gPiA+ICsgICAgICAgLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19E
RV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSB8Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgIERSTV9CVVNfRkxBR19TWU5DX0RSSVZFX05FR0VER0UsCj4gPiA+ICt9
Owo+ID4gPiArCj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbWl0c3ViaXNo
aV9hYTA3MG1jMDEgPSB7Cj4gPiA+ICAgICAgICAgLm1vZGVzID0gJm1pdHN1YmlzaGlfYWEwNzBt
YzAxX21vZGUsCj4gPiA+ICAgICAgICAgLm51bV9tb2RlcyA9IDEsCj4gPiA+IEBAIC0zMjg3LDYg
KzMzMjEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9t
YXRjaFtdID0gewo+ID4gPiAgICAgICAgIH0sIHsKPiA+ID4gICAgICAgICAgICAgICAgIC5jb21w
YXRpYmxlID0gImxnLGxwMTI5cWUiLAo+ID4gPiAgICAgICAgICAgICAgICAgLmRhdGEgPSAmbGdf
bHAxMjlxZSwKPiA+ID4gKyAgICAgICB9LCB7Cj4gPiA+ICsgICAgICAgICAgICAgICAuY29tcGF0
aWJsZSA9ICJsb2dpY3BkLHR5cGUyOCIsCj4gPiA+ICsgICAgICAgICAgICAgICAuZGF0YSA9ICZs
b2dpY3BkX3R5cGVfMjgsCj4gPiA+ICAgICAgICAgfSwgewo+ID4gPiAgICAgICAgICAgICAgICAg
LmNvbXBhdGlibGUgPSAibWl0c3ViaXNoaSxhYTA3MG1jMDEtY2ExIiwKPiA+ID4gICAgICAgICAg
ICAgICAgIC5kYXRhID0gJm1pdHN1YmlzaGlfYWEwNzBtYzAxLAo+Cj4gLS0KPiBSZWdhcmRzLAo+
Cj4gTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
