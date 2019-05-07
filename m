Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFA166C9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 17:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590686E7E9;
	Tue,  7 May 2019 15:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3E16E7E9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:33:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y19so4624584lfy.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 08:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WQisPNfHOfBJIalj0+j26baB7DA29UKmypJYO0pbRkw=;
 b=PVDZSkIZlC00B+aD0KMtvnE/Fwz482LEn6/snakI4lEw+wPb4DFT605ri9E87sMJO+
 vyMk88jlS3cChZMuNOKk33NwfJ3zz19kN9GHWIMB9IV8/TN3dFz8ZafZL7KbDJtE20Cq
 0RtZBZ2JYTbMweGzYXEOnoXbQFUf8ReKQQVjGUfN/fCtzlnL7tWjY2+hSMI1ubprgWiD
 6CdKP3Ji51Lm11gZUGL83iHie6Ib5TnCD0ggXZz031hcb9eCVtYuixFSa9UXySIY77GB
 DBpkuCKcXTZ4kDbJfvUsGt48D18ciO+QEguzl6jBNQhacmd8b1gg98re0JmtJTnHtmdJ
 W8Jw==
X-Gm-Message-State: APjAAAUhJ9zCPqmHrC6DnyAhX5BdY9pyojyU5okoMHFxnM4Te7v7HBv7
 +xs83SDwX/agwz9yCmY45p2iT4HY8Rde89eJrxY=
X-Google-Smtp-Source: APXvYqyy1KmutZbnqJrWqU9nAQFKvt+pfus9NE6eVAUy299obZzU9NfS85opZFbrS+ROq8Sw9zfcEjMSxrm8MGvA9oM=
X-Received: by 2002:ac2:54a1:: with SMTP id w1mr18136772lfk.46.1557243214820; 
 Tue, 07 May 2019 08:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 May 2019 12:33:39 -0300
Message-ID: <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WQisPNfHOfBJIalj0+j26baB7DA29UKmypJYO0pbRkw=;
 b=p/Ae+FE2KJJFwABwsALHLaFGmLRrrZwfw6c20iqhoqGxxvYFHcl4Mbl0rgeHBsHgPd
 OWKfLJJPdkXbaBXWmTfG2b+0VB+VBwspEXLsxCtj7qabY+QR3AuBBRrFxF4qAWHRzYvs
 zYS5wXWXvLvn+A3xfxJzBuUlOnPihB7fWAzS1N/DW/RHkNGXlNuoaXHhBErG5LjCU/59
 2JX3nb3qPqK1wEs4pVqoZhR/R+PhflOPKM25QrzQs3w8tRqi4ZRRttnaw5JIbVdOwDzG
 8IfTMUwpsgVHh+VXKBiQwX9yY3LofCi+aLAV1TjzFzet2eZgw12JYXQ9t0IZA51CzxJg
 7IvQ==
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FkZGluZyBTYW0sIHdobyBpcyBoZWxwaW5nIHRvIHJldmlldy9jb2xsZWN0IHBhbmVsLXNpbXBs
ZSBwYXRjaGVzXQoKT24gVHVlLCBNYXkgNywgMjAxOSBhdCAxMjoyNyBQTSBTw6liYXN0aWVuIFN6
eW1hbnNraQo8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgo+Cj4gVGhp
cyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBTVDA3MDAgQWRhcHQuIEl0IGNv
bWVzIHdpdGggYQo+IFNhbnRlayBTVDA3MDBJNVktUkJTTFcgNy4wIiBXVkdBICg4MDB4NDgwKSBU
RlQgYW5kIGFuIGFkYXB0ZXIgYm9hcmQgc28KPiB0aGF0IGl0IGNhbiBiZSBjb25uZWN0ZWQgb24g
dGhlIFRGVCBoZWFkZXIgb2YgQXJtYWRldXMgRGV2IGJvYXJkcy4KPgo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnICMgdjQuMTkKPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVu
LnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL2FybWFk
ZXVzLHN0MDcwMC1hZGFwdC50eHQgICB8ICA5ICsrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3Qw
NzAwLWFkYXB0LnR4dAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1hZGFwdC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAt
YWRhcHQudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmEz
MGQ2M2RiM2M4Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQudHh0Cj4gQEAg
LTAsMCArMSw5IEBACj4gK0FybWFkZXVzIFNUMDcwMCBBZGFwdC4gQSBTYW50ZWsgU1QwNzAwSTVZ
LVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkgVEZUIHdpdGgKPiArYW4gYWRhcHRlciBib2FyZC4K
PiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogImFybWFkZXVzLHN0
MDcwMC1hZGFwdCIKPiArLSBwb3dlci1zdXBwbHk6IHNlZSBwYW5lbC1jb21tb24udHh0Cj4gKwo+
ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIGJhY2tsaWdodDogc2VlIHBhbmVsLWNvbW1vbi50
eHQKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gaW5kZXggOWU4MjE4ZjZhM2Yy
Li40NWNhOGQxMGI2NmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4g
QEAgLTQ0Niw2ICs0NDYsMzIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGFtcGly
ZV9hbTgwMDQ4MHIzdG1xd2ExaCA9IHsKPiAgICAgICAgIC5idXNfZm9ybWF0ID0gTUVESUFfQlVT
X0ZNVF9SR0I2NjZfMVgxOCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlf
dGltaW5nIHNhbnRla19zdDA3MDBpNXlfcmJzbHdfZl90aW1pbmcgPSB7Cj4gKyAgICAgICAucGl4
ZWxjbG9jayA9IHsgMjY0MDAwMDAsIDMzMzAwMDAwLCA0NjgwMDAwMCB9LAo+ICsgICAgICAgLmhh
Y3RpdmUgPSB7IDgwMCwgODAwLCA4MDAgfSwKPiArICAgICAgIC5oZnJvbnRfcG9yY2ggPSB7IDE2
LCAyMTAsIDM1NCB9LAo+ICsgICAgICAgLmhiYWNrX3BvcmNoID0geyA0NSwgMzYsIDYgfSwKPiAr
ICAgICAgIC5oc3luY19sZW4gPSB7IDEsIDEwLCA0MCB9LAo+ICsgICAgICAgLnZhY3RpdmUgPSB7
IDQ4MCwgNDgwLCA0ODAgfSwKPiArICAgICAgIC52ZnJvbnRfcG9yY2ggPSB7IDcsIDIyLCAxNDcg
fSwKPiArICAgICAgIC52YmFja19wb3JjaCA9IHsgMjIsIDEzLCAzIH0sCj4gKyAgICAgICAudnN5
bmNfbGVuID0geyAxLCAxMCwgMjAgfSwKPiArICAgICAgIC5mbGFncyA9IERJU1BMQVlfRkxBR1Nf
SFNZTkNfTE9XIHwgRElTUExBWV9GTEFHU19WU1lOQ19MT1cgfAo+ICsgICAgICAgICAgICAgICBE
SVNQTEFZX0ZMQUdTX0RFX0hJR0ggfCBESVNQTEFZX0ZMQUdTX1BJWERBVEFfUE9TRURHRQo+ICt9
Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGFybWFkZXVzX3N0MDcwMF9h
ZGFwdCA9IHsKPiArICAgICAgIC50aW1pbmdzID0gJnNhbnRla19zdDA3MDBpNXlfcmJzbHdfZl90
aW1pbmcsCj4gKyAgICAgICAubnVtX3RpbWluZ3MgPSAxLAo+ICsgICAgICAgLmJwYyA9IDYsCj4g
KyAgICAgICAuc2l6ZSA9IHsKPiArICAgICAgICAgICAgICAgLndpZHRoID0gMTU0LAo+ICsgICAg
ICAgICAgICAgICAuaGVpZ2h0ID0gODYsCj4gKyAgICAgICB9LAo+ICsgICAgICAgLmJ1c19mb3Jt
YXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4LAo+ICsgICAgICAgLmJ1c19mbGFncyA9IERS
TV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSwKPiArfTsK
PiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fYjEwMWF3MDNf
bW9kZSA9IHsKPiAgICAgICAgIC5jbG9jayA9IDUxNDUwLAo+ICAgICAgICAgLmhkaXNwbGF5ID0g
MTAyNCwKPiBAQCAtMjU0NCw2ICsyNTcwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKPiAgICAgICAgIH0sIHsKPiAgICAgICAgICAg
ICAgICAgLmNvbXBhdGlibGUgPSAiYXJtLHJ0c20tZGlzcGxheSIsCj4gICAgICAgICAgICAgICAg
IC5kYXRhID0gJmFybV9ydHNtLAo+ICsgICAgICAgfSwgewo+ICsgICAgICAgICAgICAgICAuY29t
cGF0aWJsZSA9ICJhcm1hZGV1cyxzdDA3MDAtYWRhcHQiLAo+ICsgICAgICAgICAgICAgICAuZGF0
YSA9ICZhcm1hZGV1c19zdDA3MDBfYWRhcHQsCj4gICAgICAgICB9LCB7Cj4gICAgICAgICAgICAg
ICAgIC5jb21wYXRpYmxlID0gImF1byxiMTAxYXcwMyIsCj4gICAgICAgICAgICAgICAgIC5kYXRh
ID0gJmF1b19iMTAxYXcwMywKPiAtLQo+IDIuMTkuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
