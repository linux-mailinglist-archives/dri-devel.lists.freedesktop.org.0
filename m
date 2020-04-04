Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636219E62E
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 17:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73066E25C;
	Sat,  4 Apr 2020 15:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE056E25C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 15:45:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2B672071C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586015158;
 bh=GMu0zk+p8QMuMWjCbtVqePXwGuMgSxIWxR0r1z6lvyU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=In63Izep8i8dqQyydQQmo8v++EZOqlLlmMuKdMxXFfzEBMh1HfJabL2vVFHShgGIj
 /Wo4gzAUVDMtw1/UNGmQf1lYig+Kg4Wp8LDhqUX2GeATB1X7WwqAm1JcIUyZqtQ+Zk
 TfnheDJbmR4Co6Zm3mHw7Ky+Ki1/d+WJm7frwn84=
Received: by mail-ed1-f42.google.com with SMTP id de14so13108498edb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Apr 2020 08:45:58 -0700 (PDT)
X-Gm-Message-State: AGi0PubOVIJrszTBK4itYSlEL1+t64CxaoOZnbttOn0N9n5yUC+49u75
 6nnb6zA5yADx6ONQGZ+LmdL0hS6RoscjiU2bNA==
X-Google-Smtp-Source: APiQypKX48tTaJ6RxCfGLNPptu/cJWdbVnwRtToRHot3QHJ2YgdHABiYCkH652IzhRi38qOA2XH03CE7gPBlBXCImT4=
X-Received: by 2002:a50:af85:: with SMTP id h5mr12733695edd.300.1586015157107; 
 Sat, 04 Apr 2020 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
 <20200331082725.81048-2-jitao.shi@mediatek.com>
In-Reply-To: <20200331082725.81048-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 23:45:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-77zLp1W=29oxdFbPWzdiUbk-dJfEmUU16CJoLxC8FMg@mail.gmail.com>
Message-ID: <CAAOTY_-77zLp1W=29oxdFbPWzdiUbk-dJfEmUU16CJoLxC8FMg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDPmnIgzMeaXpSDpgLHkuowg5LiL5Y2INDoyOOWvq+mBk++8mgo+Cj4gQWRkIGEgcHJvcGVydHkg
dG8gY29udHJvbCBtaXBpIHR4IGRyaXZlIGN1cnJlbnQ6Cj4gImRyaXZlLXN0cmVuZ3RoLW1pY3Jv
YW1wIgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PgoKPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkc2kudHh0ICAgIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBpbmRleCBhMTlhNmNj
Mzc1ZWQuLmQ3OGI2ZDZkOGZhYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dAo+IEBAIC0zMyw2ICszMywxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtICNj
bG9jay1jZWxsczogbXVzdCBiZSA8MD47Cj4gIC0gI3BoeS1jZWxsczogbXVzdCBiZSA8MD4uCj4K
PiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArLSBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDogYWRq
dXN0IGRyaXZpbmcgY3VycmVudCwgc2hvdWxkIGJlIDMwMDAgfiA2MDAwLiBBbmQKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGUgc3RlcCBpcyAy
MDAuCj4gKwo+ICBFeGFtcGxlOgo+Cj4gIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+
IEBAIC00Miw2ICs0Niw3IEBAIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+ICAgICAg
ICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7Cj4gICAgICAgICAjY2xvY2st
Y2VsbHMgPSA8MD47Cj4gICAgICAgICAjcGh5LWNlbGxzID0gPDA+Owo+ICsgICAgICAgZHJpdmUt
c3RyZW5ndGgtbWljcm9hbXAgPSA8NDYwMD47Cj4gIH07Cj4KPiAgZHNpMDogZHNpQDE0MDFiMDAw
IHsKPiAtLQo+IDIuMjEuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
