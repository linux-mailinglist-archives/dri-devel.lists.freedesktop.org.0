Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7499361CBF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA866EB4A;
	Fri, 16 Apr 2021 09:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B966EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:14:27 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id w10so18811289pgh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8lDqc+TYkF9pP4uENPMPvtRZ1G1LiLYNI2+86HjZ3j4=;
 b=U+Nll+6qi9gighJPhyw/5xmLkh+myCNJH8LtUaH/kjyn353iLZcEsskXL8ml4YkRCj
 w2wFm+i7gUrXuZmdZzZC2sqDLSpE77zRvujOHMSkdw2nShClvTHA5armSVUD562+D9Ii
 l4JA3AFw9hBT/VExwC/ZpUrAFOE879pIA1spaev+ejW78F1zmBCEeQy/PMbCiyJmb4Gr
 i6zy9UktR8oOzfzDR8lQzHeHGmOYPSvaou142xr3LNWoc0n3toZ/atbibpnkc1Jn5l/V
 gTMGR100per33u3NDA4xgQAwqcjH7a2DoNp6GJ6y5jprwfswVP4TXWRoJ25rXHaqe8qd
 YkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lDqc+TYkF9pP4uENPMPvtRZ1G1LiLYNI2+86HjZ3j4=;
 b=TjB1JZzrD8UT35B7/9SA+7OnRzpwv2btHX3fGBAywh8Q7Dtm2j46GFDoNtM2lUdMVw
 E/6PKFFfB9ime8fP79ONGyawfoud23gLqmVkw0HZDi8vGtwhSeim7x8GMgpTOYTKbDCQ
 U0h6B0pq2Ylh+eJLgz14Ham9i1XG1kV5TKJV0zPyFO4oQcVPzi7leUpBbo9Klzq2zBgg
 WN0bqsyGPtM7TVbvD73lbIginv/mXPwAMnRj43ICiz/q3L+txko8Pv3gWLWODxkY7iFw
 fvn2O5bXIUQPrWKdcDf/rIc6PYa7Fri9UhC4dWTQuRMt19n+t9F4+/RMK/wUAQ8lDTeQ
 lEwg==
X-Gm-Message-State: AOAM533c+9cft14WjjqqrCMxwRMRhWl4FZgr66pH006AiepohIu3LNlM
 MTSxM1w2svTrRXHztKhilsN86TF8prRqWvoyjg5Z8w==
X-Google-Smtp-Source: ABdhPJxSkqkrwhYv5hXxKmkv9csB4kg1BQcPtIeGKgQQAuzgS5nXWtbBRz4tpaSCZ+S/3OLaNgRMLjfA4wRpQnPUF7M=
X-Received: by 2002:aa7:9d8e:0:b029:258:aaea:7000 with SMTP id
 f14-20020aa79d8e0000b0290258aaea7000mr4986162pfq.39.1618564466665; Fri, 16
 Apr 2021 02:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210415183639.1487-1-rdunlap@infradead.org>
 <CABkfQAGfaxQJ4xdMpJk3CO-VZueM11BBUR-YpAQ8v0-wvwAheg@mail.gmail.com>
In-Reply-To: <CABkfQAGfaxQJ4xdMpJk3CO-VZueM11BBUR-YpAQ8v0-wvwAheg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Apr 2021 11:14:15 +0200
Message-ID: <CAG3jFyuty4pVzd+6+tFgKtmAE06dOtz1AwnZRefQD9F7bvbKGQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix LONTIUM use of mipi_dsi_()
 functions
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, stable@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWVyZ2VkIGZvciA1LjEzIGluIGRybS1taXNjLW5leHQtZml4ZXMKCk9uIFRodSwgMTUgQXByIDIw
MjEgYXQgMjE6MzYsIEFkcmllbiBHcmFzc2VpbiA8YWRyaWVuLmdyYXNzZWluQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiBSZXZpZXdlZC1ieTogQWRyZW4gR3Jhc3NlaW4gPGFkcmllbi5ncmFzc2VpbkBn
bWFpbC5jb20+Cj4KPiBMZSBqZXUuIDE1IGF2ci4gMjAyMSDDoCAyMDozNiwgUmFuZHkgRHVubGFw
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IGEgw6ljcml0IDoKPiA+Cj4gPiBUaGUgTG9udGl1bSBE
Uk0gYnJpZGdlIGRyaXZlcnMgdXNlIG1pcGlfZHNpXygpIGZ1bmN0aW9uIGludGVyZmFjZXMgc28K
PiA+IHRoZXkgbmVlZCB0byBzZWxlY3QgRFJNX01JUElfRFNJIHRvIHByZXZlbnQgYnVpbGQgZXJy
b3JzLgo+ID4KPiA+IEVSUk9SOiBtb2Rwb3N0OiAibWlwaV9kc2lfYXR0YWNoIiBbZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMXV4Yy5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6
IG1vZHBvc3Q6ICJtaXBpX2RzaV9kZXZpY2VfcmVnaXN0ZXJfZnVsbCIgW2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvbG9udGl1bS1sdDk2MTF1eGMua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rw
b3N0OiAib2ZfZmluZF9taXBpX2RzaV9ob3N0X2J5X25vZGUiIFtkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2xvbnRpdW0tbHQ5NjExdXhjLmtvXSB1bmRlZmluZWQhCj4gPiBFUlJPUjogbW9kcG9zdDog
Im1pcGlfZHNpX2RldmljZV91bnJlZ2lzdGVyIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250
aXVtLWx0OTYxMXV4Yy5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJtaXBpX2Rz
aV9kZXRhY2giIFtkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExdXhjLmtvXSB1
bmRlZmluZWQhCj4gPiBFUlJPUjogbW9kcG9zdDogIm1pcGlfZHNpX2F0dGFjaCIgW2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2MTEua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBt
b2Rwb3N0OiAibWlwaV9kc2lfZGV2aWNlX3JlZ2lzdGVyX2Z1bGwiIFtkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2xvbnRpdW0tbHQ5NjExLmtvXSB1bmRlZmluZWQhCj4gPiBFUlJPUjogbW9kcG9zdDog
Im9mX2ZpbmRfbWlwaV9kc2lfaG9zdF9ieV9ub2RlIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9s
b250aXVtLWx0OTYxMS5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJtaXBpX2Rz
aV9kZXZpY2VfdW5yZWdpc3RlciIgW2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2
MTEua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAibWlwaV9kc2lfZGV0YWNoIiBb
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMS5rb10gdW5kZWZpbmVkIQo+ID4g
V0FSTklORzogbW9kcG9zdDogc3VwcHJlc3NlZCA1IHVucmVzb2x2ZWQgc3ltYm9sIHdhcm5pbmdz
IGJlY2F1c2UgdGhlcmUgd2VyZSB0b28gbWFueSkKPiA+Cj4gPiBGaXhlczogMjMyNzhiZjU0YWZl
ICgiZHJtL2JyaWRnZTogSW50cm9kdWNlIExUOTYxMSBEU0kgdG8gSERNSSBicmlkZ2UiKQo+ID4g
Rml4ZXM6IDBjYmJkNWIxYTAxMiAoImRybTogYnJpZGdlOiBhZGQgc3VwcG9ydCBmb3IgbG9udGl1
bSBMVDk2MTFVWEMgYnJpZGdlIikKPiA+IEZpeGVzOiAzMGUyYWU5NDNjMjYgKCJkcm0vYnJpZGdl
OiBJbnRyb2R1Y2UgTFQ4OTEyQiBEU0kgdG8gSERNSSBicmlkZ2UiKQo+ID4gU2lnbmVkLW9mZi1i
eTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gPiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBDYzogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgo+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPiA+IENjOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPgo+ID4g
Q2M6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4gPiBDYzog
U3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+ID4g
Q2M6IEFkcmllbiBHcmFzc2VpbiA8YWRyaWVuLmdyYXNzZWluQGdtYWlsLmNvbT4KPiA+IENjOiBB
bmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+ID4gQ2M6IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+IENjOiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZv
c3NAbGluYXJvLm9yZz4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnIHwgICAgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gPgo+ID4gLS0tIGxpbnV4LW5leHQtMjAyMTA0MTQub3JpZy9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcKPiA+ICsrKyBsaW51eC1uZXh0LTIwMjEwNDE0L2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvS2NvbmZpZwo+ID4gQEAgLTY2LDYgKzY2LDcgQEAgY29uZmlnIERSTV9MT05U
SVVNX0xUODkxMkIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBPRgo+ID4gICAgICAgICBzZWxlY3Qg
RFJNX1BBTkVMX0JSSURHRQo+ID4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiA+ICsg
ICAgICAgc2VsZWN0IERSTV9NSVBJX0RTSQo+ID4gICAgICAgICBzZWxlY3QgUkVHTUFQX0kyQwo+
ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgRHJpdmVyIGZvciBMb250aXVtIExUODkxMkIg
RFNJIHRvIEhETUkgYnJpZGdlCj4gPiBAQCAtODEsNiArODIsNyBAQCBjb25maWcgRFJNX0xPTlRJ
VU1fTFQ5NjExCj4gPiAgICAgICAgIGRlcGVuZHMgb24gT0YKPiA+ICAgICAgICAgc2VsZWN0IERS
TV9QQU5FTF9CUklER0UKPiA+ICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gPiArICAg
ICAgIHNlbGVjdCBEUk1fTUlQSV9EU0kKPiA+ICAgICAgICAgc2VsZWN0IFJFR01BUF9JMkMKPiA+
ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIERyaXZlciBmb3IgTG9udGl1bSBMVDk2MTEgRFNJ
IHRvIEhETUkgYnJpZGdlCj4gPiBAQCAtOTQsNiArOTYsNyBAQCBjb25maWcgRFJNX0xPTlRJVU1f
TFQ5NjExVVhDCj4gPiAgICAgICAgIGRlcGVuZHMgb24gT0YKPiA+ICAgICAgICAgc2VsZWN0IERS
TV9QQU5FTF9CUklER0UKPiA+ICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gPiArICAg
ICAgIHNlbGVjdCBEUk1fTUlQSV9EU0kKPiA+ICAgICAgICAgc2VsZWN0IFJFR01BUF9JMkMKPiA+
ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIERyaXZlciBmb3IgTG9udGl1bSBMVDk2MTFVWEMg
RFNJIHRvIEhETUkgYnJpZGdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
