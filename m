Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BB2DAF5B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965336E3D2;
	Tue, 15 Dec 2020 14:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F2F6E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:49:29 +0000 (UTC)
X-Gm-Message-State: AOAM533NIJ99zFKObyRjuNn0jpReeSrVkHmRat0RI824oiCEzxqrSuhf
 OT1yS9AeaQWam6/EIzgxgX0MN4sprTLE26DdIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608043769;
 bh=pcW98idFE8j4CPrJmo7rwXxa0kGRpcZ4oIUzDbC2c/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HPoLcBk9VIqe4+/U+MkqxElc8KoM3OHM8y3hCkubQRLWCE0WGc3ZqIfxv7wJxu41l
 uJ1RSIbwfWFbMv22NqGaJ6yRSetwY33+YD2trssPf3h2l0ezrngjHJCI5SeBt+5o1X
 p7O3WNyttX1eLLzEvZ5OgSDzqazuvVTz9q6ZCZQgeMyj6xKmKfXf9Wi0CvzRsLwB0b
 vMs7rvUc6LIkif5P1VePoQQoiu2WNdQLRSLuuwrZV519O3Vs2lJ0jPJCcN3JlpbtZP
 nW1SesrHlIMF2k90mtr6IhadmEuHVVhkk+4XNEVvzehXeFTVYyezJ+l50dmthTHzJn
 H1G0cvQ1F9obA==
X-Google-Smtp-Source: ABdhPJzVIhS7/7kGUOi+nJf5HUvRGw0qwmZ5xmolBwFv7MPtxTCbsdxcHfV1ADt98+QRviRZJRXHnIf61pDNrmVvoE4=
X-Received: by 2002:adf:e60f:: with SMTP id p15mr3067578wrm.60.1608043767643; 
 Tue, 15 Dec 2020 06:49:27 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Dec 2020 22:49:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
Message-ID: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
Subject: Re: [PATCH v2,
 01/17] dt-bindings: mediatek: add description for postmask
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgZGVzY3JpcHRpb24gZm9yIHBvc3RtYXNrCgpXaGF0IGlzIHBvc3RtYXNrPyBJIGdvb2dsZSBp
dCBhbmQgZmluZCBhIHBvc3RtYXNrIEVDTy4gU28gaXQgaXMgcG9zdG1hc2sgRUNPPwoKUmVnYXJk
cywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dAo+IGluZGV4IDVjYTY5M2EuLjE5NzJmYTcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBAIC0zNyw2ICszNyw3IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlw
Pi1kaXNwLWFhbCIgICAgICAgICAgICAgIC0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250cm9s
bGVyCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiICAgICAgICAgICAgLSBn
YW1tYSBjb3JyZWN0aW9uCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtbWVyZ2UiICAg
ICAgICAgICAgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291cmNlcwo+ICsgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3RtYXNrIiAgICAgICAgIC0gcG9zdCBtYXNrCj4gICAg
ICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAgICAgICAgICAgLSBzcGxpdCBzdHJl
YW0gdG8gdHdvIGVuY29kZXJzCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIg
ICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVuZ2luZQo+ICAgICAgICAgIm1lZGlhdGVr
LDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRp
YXRlayxkc2kudHh0Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
