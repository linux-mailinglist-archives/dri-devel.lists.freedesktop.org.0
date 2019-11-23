Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1994107C0A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 01:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AC06E042;
	Sat, 23 Nov 2019 00:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85FC6E042
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2019 00:34:35 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m15so7769143otq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 16:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=phRtDY+6nhN89i9bxspsg5KDJ+w/2SxWdZGysdx9BMs=;
 b=UUB12yLq14d/eaz+oauR181DENTbvdWrnkbOhKvhKQa5H1Tgva/VMqdeq6TX281qqQ
 DMe4Jr50DDneeFfNDl0OppZICAbRHdrfSw8f33lc1AFstb5uqOWK8gd+MNHPIRa000GK
 ZtEcpmikJoo1RwG+Dp0ESBJi5EbG9fq2rdXu2W2rI0CHnpYMeJHP7hGD15o1gM72EHfL
 AsnCtYzSwmghqHY38v8ItYrcpewXUrtE8A9JhXEWalq3ye6A53uiUzH7lyxt63bfseTt
 NSkeDsPC1CZsqF8qosjNod39hgfoKZk6lgKkg68zWouseYhqzFr3+lL4d01bbWKjh1QT
 4e4Q==
X-Gm-Message-State: APjAAAXodQRxNt+M2v6/y3nkvJpDA+RtIoaf3pQPSwFxUZ0zlW+6diZj
 O6GVum1lzLHwynz2L7edVg==
X-Google-Smtp-Source: APXvYqwxsOHf0eCMmkU5FDfUzE8g5eAjnd7zYHNf1mNs7HEBS8YeT4sL4wp4ZPy2y5mZa+0w7UHfDA==
X-Received: by 2002:a9d:6e12:: with SMTP id e18mr12968418otr.63.1574469274945; 
 Fri, 22 Nov 2019 16:34:34 -0800 (PST)
Received: from localhost (ip-70-5-93-147.ftwttx.spcsdns.net. [70.5.93.147])
 by smtp.gmail.com with ESMTPSA id a23sm2575394oia.41.2019.11.22.16.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 16:34:34 -0800 (PST)
Date: Fri, 22 Nov 2019 18:34:32 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: display: add IMX MIPI DSI host
 controller doc
Message-ID: <20191123003432.GA334@bogus>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-5-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118152518.3374263-5-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDU6MjU6MThQTSArMDIwMCwgQWRyaWFuIFJhdGl1IHdy
b3RlOgo+IFNpZ25lZC1vZmYtYnk6IFNqb2VyZCBTaW1vbnMgPHNqb2VyZC5zaW1vbnNAY29sbGFi
b3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0eW4gV2VsY2ggPG1hcnR5bi53ZWxjaEBjb2xs
YWJvcmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBSYXRpdSA8YWRyaWFuLnJhdGl1QGNv
bGxhYm9yYS5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50
eHQgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDU2
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQKPiAKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRz
aS50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2YwNWMz
MmVmOTYzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQKPiBAQCAtMCwwICsxLDU2IEBACj4gK0Zy
ZWVzY2FsZSBpLk1YNiBEVyBNSVBJIERTSSBIb3N0IENvbnRyb2xsZXIKPiArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArVGhlIERTSSBob3N0IGNvbnRy
b2xsZXIgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIHYxLjAxIElQCj4gK3dpdGgg
YSBjb21wYW5pb24gUEhZIElQLgo+ICsKPiArVGhlc2UgRFQgYmluZGluZ3MgZm9sbG93IHRoZSBT
eW5vcHN5cyBEVyBNSVBJIERTSSBiaW5kaW5ncyBkZWZpbmVkIGluCj4gK0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9kd19taXBpX2RzaS50eHQgd2l0aAo+
ICt0aGUgZm9sbG93aW5nIGRldmljZS1zcGVjaWZpYyBwcm9wZXJ0aWVzLgo+ICsKPiArUmVxdWly
ZWQgcHJvcGVydGllczoKPiArCj4gKy0gI2FkZHJlc3MtY2VsbHM6IFNob3VsZCBiZSA8MT4uCj4g
Ky0gI3NpemUtY2VsbHM6IFNob3VsZCBiZSA8MD4uCj4gKy0gY29tcGF0aWJsZTogImZzbCxpbXg2
cS1taXBpLWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIi4KPiArLSByZWc6IFNlZSBkd19taXBpX2Rz
aS50eHQuCj4gKy0gaW50ZXJydXB0czogVGhlIGNvbnRyb2xsZXIncyBDUFUgaW50ZXJydXB0Lgo+
ICstIGNsb2NrcywgY2xvY2stbmFtZXM6IFBoYW5kbGVzIHRvIHRoZSBjb250cm9sbGVyJ3MgcGxs
IHJlZmVyZW5jZQo+ICsgIGNsb2NrKHJlZikgYW5kIEFQQiBjbG9jayhwY2xrKSwgYXMgZGVzY3Jp
YmVkIGluIFsxXS4KPiArLSBwb3J0czogYSBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0
aW9ucyBhcyBkZWZpbmVkIGluIFsyXS4KPiArLSBncHI6IFNob3VsZCBiZSA8Jmdwcj4uCgpmc2ws
Z3ByCgo+ICsgICAgICAgUGhhbmRsZSB0byB0aGUgaW9tdXhjLWdwciByZWdpb24gY29udGFpbmlu
ZyB0aGUgbXVsdGlwbGV4ZXIKPiArICAgICAgIGNvbnRyb2wgcmVnaXN0ZXIuCj4gKwo+ICtbMV0g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4
dAo+ICtbMl0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWlu
dGVyZmFjZXMudHh0Cj4gKwo+ICtFeGFtcGxlOgo+ICsKPiArCW1pcGlfZHNpOiBtaXBpQDIxZTAw
MDAgewoKZHNpQC4uLgoKPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKPiArCQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1taXBpLWRzaSIsICJzbnBzLGR3
LW1pcGktZHNpIjsKPiArCQlyZWcgPSA8MHgwMjFlMDAwMCAweDQwMDA+Owo+ICsJCWludGVycnVw
dHMgPSA8MCAxMDIgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJZ3ByID0gPCZncHI+Owo+ICsJ
CWNsb2NrcyA9IDwmY2xrcyBJTVg2UURMX0NMS19NSVBJX0NPUkVfQ0ZHPiwKPiArCQkJIDwmY2xr
cyBJTVg2UURMX0NMS19NSVBJX0lQRz47Cj4gKwkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsi
Owo+ICsJCXN0YXR1cyA9ICJva2F5IjsKCkRvbid0IHNob3cgc3RhdHVzIGluIGV4YW1wbGVzLgoK
PiArCj4gKwkJcG9ydHMgewo+ICsJCQlwb3J0QDAgewo+ICsJCQkJcmVnID0gPDA+Owo+ICsJCQkJ
bWlwaV9tdXhfMDogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaXB1MV9k
aTBfbWlwaT47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICsJCQlwb3J0QDEgewo+ICsJCQkJcmVnID0g
PDE+Owo+ICsJCQkJbWlwaV9tdXhfMTogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmaXB1MV9kaTFfbWlwaT47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICsJCX07Cj4gKyAgICAg
ICAgfTsKPiAtLSAKPiAyLjI0LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
