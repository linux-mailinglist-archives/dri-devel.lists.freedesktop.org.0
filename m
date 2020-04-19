Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA71AF61F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Apr 2020 03:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7FC6E39C;
	Sun, 19 Apr 2020 01:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781DA6E39C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 01:33:11 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC8F8221E9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587259990;
 bh=/UcjrPZXCXuph9J2Yc5mQBEB5sWwMAN0uuROLhyfxok=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmTgeneEXBXbi3HUis7BKU6v4ye9Tk4FdREG8sJL0+EHg9HvNZ2I/IfV8plCZJ2Y4
 m6hsI/jx17Vf1JvLM8P6kOrmdDLJ4hZG3CmHNjtnHi8zi8S4Qrp3nff0jXiVcmd0KE
 nSrAvZxKb/vUpyZikkXL4HYV0lnipdTd2sQjn8ZM=
Received: by mail-ej1-f41.google.com with SMTP id pg17so4813962ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 18:33:09 -0700 (PDT)
X-Gm-Message-State: AGi0PubSH2vuVxSiYyRq5FK6+dS0+fDsPwFOPzdtKcvIrHCeYeKP2ItV
 3WHtSAUiDZb0UCkNvoG9by6mzT3B7WHQYMJTOA==
X-Google-Smtp-Source: APiQypI3giH/gDy/cHj5eO3uMu9u4Kz+9zinLfCvMPB/K9QM30cqtMHT04YZTWUcv0gCaVxOevmWmBWBze6mbHrY5R4=
X-Received: by 2002:a17:906:4bc3:: with SMTP id
 x3mr10131749ejv.38.1587259988344; 
 Sat, 18 Apr 2020 18:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
 <20200411074408.38090-2-jitao.shi@mediatek.com>
In-Reply-To: <20200411074408.38090-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 19 Apr 2020 09:32:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9YThRHNqv-D7o-XrgqQ6CnH0tvmPCHppDpzmiiT0KEGg@mail.gmail.com>
Message-ID: <CAAOTY_9YThRHNqv-D7o-XrgqQ6CnH0tvmPCHppDpzmiiT0KEGg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
To: Jitao Shi <jitao.shi@mediatek.com>, Rob Herring <robh+dt@kernel.org>
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJvYjoKCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8gVGhpcyBwYXRjaCBs
b29rcyBnb29kIHRvIG1lLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCkppdGFvIFNoaSA8aml0YW8u
c2hpQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ05pyIMTHml6Ug6YCx5YWtIOS4i+WNiDM6NDTl
r6vpgZPvvJoKPgo+IEFkZCBhIHByb3BlcnR5IHRvIGNvbnRyb2wgbWlwaSB0eCBkcml2ZSBjdXJy
ZW50Ogo+ICJkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCIKPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBT
aGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICB8IDUgKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0Cj4gaW5kZXggYTE5YTZjYzM3NWVkLi5kNzhiNmQ2ZDhmYWIgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZHNpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBAQCAtMzMsNiArMzMsMTAgQEAg
UmVxdWlyZWQgcHJvcGVydGllczoKPiAgLSAjY2xvY2stY2VsbHM6IG11c3QgYmUgPDA+Owo+ICAt
ICNwaHktY2VsbHM6IG11c3QgYmUgPDA+Lgo+Cj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0g
ZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6IGFkanVzdCBkcml2aW5nIGN1cnJlbnQsIHNob3VsZCBi
ZSAzMDAwIH4gNjAwMC4gQW5kCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGhlIHN0ZXAgaXMgMjAwLgo+ICsKPiAgRXhhbXBsZToKPgo+ICBtaXBp
X3R4MDogbWlwaS1kcGh5QDEwMjE1MDAwIHsKPiBAQCAtNDIsNiArNDYsNyBAQCBtaXBpX3R4MDog
bWlwaS1kcGh5QDEwMjE1MDAwIHsKPiAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJtaXBp
X3R4MF9wbGwiOwo+ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAgICAgICAgI3BoeS1j
ZWxscyA9IDwwPjsKPiArICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wID0gPDQ2MDA+Owo+
ICB9Owo+Cj4gIGRzaTA6IGRzaUAxNDAxYjAwMCB7Cj4gLS0KPiAyLjIxLjAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
