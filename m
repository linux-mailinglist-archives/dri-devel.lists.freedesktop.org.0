Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB972AA8FE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 04:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F776E150;
	Sun,  8 Nov 2020 03:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96F66E150
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 03:28:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A8A8221FE
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 03:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604806121;
 bh=15PLnXybh2lEXrB1xUvGTz2108s9b14lvl6FVOOsnkM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sMoQBj41ddbPFQTcan6DzPGdl1NoHy+EQV286lImAxg0Id1qJpr6o2rqD1S5896F2
 Qy5jqS6bzaaVGf2oANmLFLAci4OFrnv04egdIUEALM93RUdywpy4c6UQXeRL4o9lOE
 fqKyCmm6FX7g/hDnhbcqixNuQoDd6nQW/0Hh2gHM=
Received: by mail-ej1-f44.google.com with SMTP id s25so7439263ejy.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 19:28:41 -0800 (PST)
X-Gm-Message-State: AOAM532tcRv3c5WcqBIi5+/KK8rLvGBG10O+1D10kmky9+lZg3oYDiat
 AY8RR1x+O5/gaM+kfTbfTBSfT0SsaXu6exs0sw==
X-Google-Smtp-Source: ABdhPJyBseDAhXQ/6C9jcMSsrTp+8xbOBCsG2KacXh8VPxOMNSA/zdsBnuqjc6Ef7wdx0UtfJ8yVeN4wasCoPh0S1AU=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr9065798ejq.303.1604806120037; 
 Sat, 07 Nov 2020 19:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20200917073305.25738-1-jitao.shi@mediatek.com>
 <20200923201517.GA1226945@bogus>
In-Reply-To: <20200923201517.GA1226945@bogus>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 11:28:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8EbbWRzvn3i_a5TjYKuUX7g=EmVNnAVY80OYePr_ndDQ@mail.gmail.com>
Message-ID: <CAAOTY_8EbbWRzvn3i_a5TjYKuUX7g=EmVNnAVY80OYePr_ndDQ@mail.gmail.com>
Subject: Re: [v2 PATCH] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
To: Rob Herring <robh@kernel.org>
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
 Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ55pyI
MjTml6Ug6YCx5ZubIOS4iuWNiDQ6MTXlr6vpgZPvvJoKPgo+IE9uIFRodSwgMTcgU2VwIDIwMjAg
MTU6MzM6MDUgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiA+IENvbnZlcnQgZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkcGkudHh0IHRvIGRpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlh
bWwKPiA+IGFuZCByZW1vdmUgdGhlIG9sZCB0ZXh0IGJpbmRpbmdzLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQgICAgIHwgNDIgLS0t
LS0tLS0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55
YW1sICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
OTcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRwaS50eHQKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwKPiA+Cj4KPiBS
ZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBfXwoKQXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
