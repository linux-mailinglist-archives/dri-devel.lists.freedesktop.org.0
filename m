Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C32972D7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 17:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6644E89DBF;
	Fri, 23 Oct 2020 15:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C989A86
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 15:49:24 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A093C2463D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603468164;
 bh=8rC8JAv/ZvbLKMGSVzWGE/gWAOObW9y+163pOgJE734=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uv80JdRbcO6BWfb/Uir+14ivY7GW/RSQBvDHXWctAppIiOPWYgrMnBmrg4tcZ3rMq
 vpcawkS7bVVFO/N1SWaxnj2XG72ZqCFTCS/8VAxzFJNDtvpxIkoWllxDipJck9Dlyf
 f/ufDKVeSkFbFrfyfrom+kCeKCq2nHO46Q2gdz4o=
Received: by mail-ej1-f50.google.com with SMTP id a3so3008176ejy.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 08:49:23 -0700 (PDT)
X-Gm-Message-State: AOAM531XCVzaq3ZyprbkHmTit4iYIyBAovEFZkp1lrhvZMGimocNq9TD
 B7K/AQGw5BikmjG7aBF0hC8RByUh8zEjZTIUYw==
X-Google-Smtp-Source: ABdhPJw1PDvJSraa+neHMAgIfWWTxOH+reRWWuRSaRPlwJ3vt+DK5mhM/16fgvV4BGg8vj7cvWu44cDBA15ePkriZ84=
X-Received: by 2002:a17:906:9511:: with SMTP id
 u17mr2597628ejx.194.1603468161912; 
 Fri, 23 Oct 2020 08:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-3-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-3-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 23 Oct 2020 23:49:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY__5mWnrRJetok2VRhCN9ga9mez55jDVturLNWPYnQAVDg@mail.gmail.com>
Message-ID: <CAAOTY__5mWnrRJetok2VRhCN9ga9mez55jDVturLNWPYnQAVDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DLgoKUmV2aWV3ZWQtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKSW4gWzFdLCBNZWRpYXRlayBEUEkgYmlu
ZGluZyBkb2N1bWVudCBoYXMgYmVlbiBjaGFuZ2VkIHRvIHlhbWwgZm9ybWF0LAp3b3VsZCB5b3Ug
cGxlYXNlIGFsc28gY2hhbmdlIHRoaXMgZG9jdW1lbnQgdG8geWFtbD8gRGl0dG8gZm9yCm1lZGlh
dGVrLGRpc3AudHh0LgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDIwMDkxNzA3MzMwNS4yNTczOC0xLWppdGFvLnNoaUBtZWRp
YXRlay5jb20vCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPgo+IENoYW5nZWxvZzoKPgo+
IFYyOiByZW1vdmVkIHBhcnQgdGhhdCBhZGRlZCBhIG5ldyBjbG9jawo+Cj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICAgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IGluZGV4IGYwNmYyNGQ0MDVh
NS4uNmExMGRlODEyMTU4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2ku
dHh0Cj4gQEAgLTcsNyArNyw3IEBAIGNoYW5uZWwgb3V0cHV0Lgo+Cj4gIFJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kc2kiCj4gLS0gdGhlIHN1
cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICst
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDgxNjcsIG10ODE3MyBh
bmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
dGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0
IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jay4KPiAgLSBjbG9ja3M6IGRldmljZSBjbG9j
a3MKPiBAQCAtMjYsNyArMjYsNyBAQCBUaGUgTUlQSSBUWCBjb25maWd1cmF0aW9uIG1vZHVsZSBj
b250cm9scyB0aGUgTUlQSSBELVBIWS4KPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNv
bXBhdGlibGU6ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtLSB0aGUgc3VwcG9ydGVkIGNo
aXBzIGFyZSBtdDI3MDEsIDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICstIHRoZSBzdXBwb3J0
ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5kIG10ODE4My4KPiAg
LSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVy
J3MgcmVnaXN0ZXJzCj4gIC0gY2xvY2tzOiBQTEwgcmVmZXJlbmNlIGNsb2NrCj4gIC0gY2xvY2st
b3V0cHV0LW5hbWVzOiBuYW1lIG9mIHRoZSBvdXRwdXQgY2xvY2sgbGluZSB0byB0aGUgRFNJIGVu
Y29kZXIKPiAtLQo+IDIuMjguMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
