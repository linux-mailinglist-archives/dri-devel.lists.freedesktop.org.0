Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923918C880
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747356EAD0;
	Fri, 20 Mar 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5A6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:52:07 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id a59de4b0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 19 Mar 2020 07:52:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 15C8C4C7F0;
 Thu, 19 Mar 2020 14:51:49 +0000 (UTC)
Message-ID: <d32e59aeb8395af1ae7ac2daa1ce985c56c14acc.camel@aosc.io>
Subject: Re: [linux-sunxi] [PATCH v2 5/5] arm64: allwinner: dts: a64: add
 LCD-related device nodes for PinePhone
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>,  Rob Herring <robh+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,  Ondrej Jirman
 <megous@megous.com>
Date: Thu, 19 Mar 2020 22:51:36 +0800
In-Reply-To: <20200316133503.144650-6-icenowy@aosc.io>
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-6-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584629521;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=p5Ck7dUiaERSo0QVXTsJS7JDgXxthBKb9LsSdQI8mXo=;
 b=o7VpwL9TrDlUsvQeexpwLURHqEq8rejngmj+gnMy03J0jB/SMkZO1e6NwjBPfVaszHVf1e
 SlvcX4TTjNKpkULnFXRvaxuIelgtPfyfZAd8bYOGtiRdwbs8acvJJU3uviggbQlY9O9Mv+
 QoltOKGJe07JmvTwJPNdAQJ2EcrtG20=
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMjAtMDMtMTbmmJ/mnJ/kuIDnmoQgMjE6MzUgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gUGluZVBob25lIHVzZXMgUFdNIGJhY2tsaWdodCBhbmQgYSBYQkQ1OTkgTENEIHBh
bmVsIG92ZXIgRFNJIGZvcgo+IGRpc3BsYXkuCj4gCj4gQWRkIGl0cyBkZXZpY2Ugbm9kZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgo+IC0tLQo+
IE5vIGNoYW5nZXMgaW4gdjIuCj4gCj4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtcGlu
ZXBob25lLmR0c2kgICB8IDM3Cj4gKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMzcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9uZS5kdHNpCj4gYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9uZS5kdHNpCj4gaW5kZXggY2VmZGExNDVj
M2M5Li45NmQ5MTUwNDIzZTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWE2NC1waW5lcGhvbmUuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtcGluZXBob25lLmR0c2kKPiBAQCAtMTYsNiArMTYsMTUg
QEAgYWxpYXNlcyB7Cj4gIAkJc2VyaWFsMCA9ICZ1YXJ0MDsKPiAgCX07Cj4gIAo+ICsJYmFja2xp
Z2h0OiBiYWNrbGlnaHQgewo+ICsJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7Cj4gKwkJ
cHdtcyA9IDwmcl9wd20gMCA1MDAwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ICsJCWJyaWdo
dG5lc3MtbGV2ZWxzID0gPDAgMTYgMTggMjAgMjIgMjQgMjYgMjkgMzIgMzUgMzggNDIKPiA0NiA1
MSA1NiA2MiA2OCA3NSA4MyA5MSAxMDA+OwoKU2hvdWxkIEkgZHJvcCB0aGUgMCBoZXJlIGFuZCBy
ZXBsYWNlIGl0IHdpdGggMTQ/CgpJIGhhdmUgaGVhcmQgY29tbXVuaXR5IGNvbXBsYWluaW5nIGFi
b3V0IHNldHRpbmcgMCB0byBicmlnaHRuZXNzIG1ha2UKdGhlIHNjcmVlbiBibGFjay4KCihJIHRo
aW5rIGluIHRoaXMgc2l0dWF0aW9uIGJsX3Bvd2VyIG9yIGJsYW5rIHRoZSBEU0kgcGFuZWwgY2Fu
IHN0aWxsCnRvdGFsbHkgc2h1dCBkb3duIHRoZSBiYWNrbGlnaHQpLgoKPiArCQlkZWZhdWx0LWJy
aWdodG5lc3MtbGV2ZWwgPSA8MTU+Owo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDcgMTAgR1BJ
T19BQ1RJVkVfSElHSD47IC8qIFBIMTAgKi8KPiArCQlwb3dlci1zdXBwbHkgPSA8JnJlZ19sZG9f
aW8wPjsKPiArCX07Cj4gKwo+ICAJY2hvc2VuIHsKPiAgCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWww
OjExNTIwMG44IjsKPiAgCX07Cj4gQEAgLTg0LDYgKzkzLDMwIEBAICZkYWkgewo+ICAJc3RhdHVz
ID0gIm9rYXkiOwo+ICB9Owo+ICAKPiArJmRlIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsK
PiArCj4gKyZkcGh5IHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gKyZkc2kgewo+
ICsJdmNjLWRzaS1zdXBwbHkgPSA8JnJlZ19kbGRvMT47Cj4gKwkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPiArCSNzaXplLWNlbGxzID0gPDA+Owo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsKPiArCXBh
bmVsQDAgewo+ICsJCWNvbXBhdGlibGUgPSAieGluZ2JhbmdkYSx4YmQ1OTkiOwo+ICsJCXJlZyA9
IDwwPjsKPiArCQlyZXNldC1ncGlvcyA9IDwmcGlvIDMgMjMgR1BJT19BQ1RJVkVfTE9XPjsgLyog
UEQyMyAqLwo+ICsJCWlvdmNjLXN1cHBseSA9IDwmcmVnX2RsZG8yPjsKPiArCQl2Y2Mtc3VwcGx5
ID0gPCZyZWdfbGRvX2lvMD47Cj4gKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+Owo+ICsJfTsK
PiArfTsKPiArCj4gICZlaGNpMCB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4gQEAgLTE4
OCw2ICsyMjEsMTAgQEAgJnJfcGlvIHsKPiAgCSAqLwo+ICB9Owo+ICAKPiArJnJfcHdtIHsKPiAr
CXN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gICZyX3JzYiB7Cj4gIAlzdGF0dXMgPSAib2th
eSI7Cj4gIAo+IC0tIAo+IDIuMjQuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
