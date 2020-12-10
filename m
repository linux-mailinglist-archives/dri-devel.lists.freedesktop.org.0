Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5382D5FD5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED106E3BB;
	Thu, 10 Dec 2020 15:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64E6E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:36:42 +0000 (UTC)
X-Gm-Message-State: AOAM531VYMVMFSLBFgGbwkUBpebCQuwz6uaaDNyhOHsZyjPmHXYhmcZp
 OrtQxdQpvLe1TAH9aZyBqeQgriO64LoK7zLpXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607614602;
 bh=gfjKDkgsUzlSXkLKgAEbUS/Mv1PVZmFwSXCS39LAV6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RPP7Y3MYJM2iQesQl1tK8TgtLyQQ6J9Ev+RMitEYdSKe8iLqjuQnttGueriC7nRs1
 yuACw7ty0/BdVxriEJmAeQZxm712jHoB5tYWv/KSHXEv4rcE49/Ht5N3Kt5rg9yVz7
 Nxn8EgiIObUWH6Dyk5R1pJ7yMf2qsJaPF5h6B9dVEKMCMzMNoAO8DBVxlKy0g7YzWT
 KIozGCXi7YygbAmetK3gVGRuJo30f8EGOVUKqY4HcNLb2pKVBDYTiw3AuhW3hT9egn
 7l620dqQkOgWD1ZQmafHhDQCJzMM9KW/3/7kX4xnuBV9Oq99W71s5inSsJy3mfEWAb
 mB7F5FWrPmGaQ==
X-Google-Smtp-Source: ABdhPJxSRwBGAkP+9mfLM02WdsbbFX5lBks02URQV937lg/PC5OBCOeM7kRWkYp0bnV7bJe0ZjiglASvX2KGwpziqho=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr7382571edf.166.1607614600133; 
 Thu, 10 Dec 2020 07:36:40 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:36:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90gcnGFiV2uZ-y2TrQYSowhvoM5k36+0zG6+tG9bj3Mw@mail.gmail.com>
Message-ID: <CAAOTY_90gcnGFiV2uZ-y2TrQYSowhvoM5k36+0zG6+tG9bj3Mw@mail.gmail.com>
Subject: Re: [PATCH v8,
 2/6] dt-bindings: mediatek: add description for mt8183 display
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
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MjLlr6vpgZPvvJoKPgo+IGFk
ZCBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiBpbmRleCA2NGM2NGVl
Li41Y2E2OTNhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBAQCAtNDMsNyArNDMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxv
Y2tzKToKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZHBpIiAgICAgICAgICAgICAgICAgICAt
IERQSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dAo+ICAgICAgICAgIm1lZGlhdGVr
LDxjaGlwPi1kaXNwLW11dGV4IiAgICAgICAgICAgIC0gZGlzcGxheSBtdXRleAo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAgICAgICAgICAgIC0gb3ZlcmRyaXZlCj4gLSAg
dGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiBhbmQgbXQ4MTcz
Lgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10
ODE3MyBhbmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5n
dGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCj4gIC0gaW50ZXJydXB0czog
VGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24gYmxvY2sgKHJlcXVpcmVkLCBl
eGNlcHQgZm9yCj4gICAgbWVyZ2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2NrcykuCj4gLS0KPiAx
LjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
