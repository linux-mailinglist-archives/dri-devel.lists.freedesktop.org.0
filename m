Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16D19E57F
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 16:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5246E226;
	Sat,  4 Apr 2020 14:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA6B6E226
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:19:48 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BFE82070E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586009988;
 bh=1Sf4GRcpkzurYk5nWdRpUBTbjpEdNqlUaBNpb/X5+dQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O8huTio9z+O50iibPA2HHY/QtrPqbwyWz1RKwJtA5+S2VErMFssNXpKRJJrdADcRm
 5+JvXRVC3t+WJybfvGrQgbbxeU2nflDlQvLq1tSR5YRFjjRTrEThBNrw9Btl8FNtVn
 tenQzu87ozx1AV6wDwtA8GZrfHCHMpzQkS2m2zjw=
Received: by mail-ed1-f54.google.com with SMTP id w26so12890975edu.7
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Apr 2020 07:19:48 -0700 (PDT)
X-Gm-Message-State: AGi0PuYUhyCdSgB3g8M6wM83YaFAyDBS+wLYGtfaFzyGh8NhQIEu1wVM
 r0SP545cN/mWaYtIBarLCUg16hxDr3VF5y0TrA==
X-Google-Smtp-Source: APiQypJUjRQr94z4xLuZ/juKRJi8yfwdfJgOA8X/UsmoNla4rM3c6EhUj/R+uzBope3z7L6dpYbRs0E13kmcBGuQwrQ=
X-Received: by 2002:a05:6402:335:: with SMTP id
 q21mr2832765edw.47.1586009986874; 
 Sat, 04 Apr 2020 07:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
 <20200331082725.81048-3-jitao.shi@mediatek.com>
In-Reply-To: <20200331082725.81048-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 22:19:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7xKF2tVioSU+qDU0qFs3CbUJFypB7RLakXR=PdvubFg@mail.gmail.com>
Message-ID: <CAAOTY_-7xKF2tVioSU+qDU0qFs3CbUJFypB7RLakXR=PdvubFg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: display: mediatek: get mipitx
 calibration data from nvmem
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
tDPmnIgzMeaXpSDpgLHkuowg5LiL5Y2INDoyOOWvq+mBk++8mgo+Cj4gQWRkIHByb3BlcnRpZXMg
dG8gZ2V0IGdldCBtaXBpdHggY2FsaWJyYXRpb24gZGF0YS4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFv
LnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2ku
dHh0Cj4gaW5kZXggZDc4YjZkNmQ4ZmFiLi44ZTQ3MjlkZThjODUgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBAQCAtMzYsNiArMzYsOSBAQCBSZXF1aXJlZCBw
cm9wZXJ0aWVzOgo+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAtIGRyaXZlLXN0cmVuZ3RoLW1p
Y3JvYW1wOiBhZGp1c3QgZHJpdmluZyBjdXJyZW50LCBzaG91bGQgYmUgMzAwMCB+IDYwMDAuIEFu
ZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRo
ZSBzdGVwIGlzIDIwMC4KPiArLSBudm1lbS1jZWxsczogQSBwaGFuZGxlIHRvIHRoZSBjYWxpYnJh
dGlvbiBkYXRhIHByb3ZpZGVkIGJ5IGEgbnZtZW0gZGV2aWNlLiBJZgo+ICsgICAgICAgICAgICAg
ICB1bnNwZWNpZmllZCBkZWZhdWx0IHZhbHVlcyBzaGFsbCBiZSB1c2VkLgo+ICstIG52bWVtLWNl
bGwtbmFtZXM6IFNob3VsZCBiZSAiY2FsaWJyYXRpb24tZGF0YSIKPgo+ICBFeGFtcGxlOgo+Cj4g
QEAgLTQ3LDYgKzUwLDggQEAgbWlwaV90eDA6IG1pcGktZHBoeUAxMDIxNTAwMCB7Cj4gICAgICAg
ICAjY2xvY2stY2VsbHMgPSA8MD47Cj4gICAgICAgICAjcGh5LWNlbGxzID0gPDA+Owo+ICAgICAg
ICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NDYwMD47Cj4gKyAgICAgICBudm1lbS1jZWxs
cz0gPCZtaXBpX3R4X2NhbGlicmF0aW9uPjsKPiArICAgICAgIG52bWVtLWNlbGwtbmFtZXMgPSAi
Y2FsaWJyYXRpb24tZGF0YSI7Cj4gIH07Cj4KPiAgZHNpMDogZHNpQDE0MDFiMDAwIHsKPiAtLQo+
IDIuMjEuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
