Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D374823FC0C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 02:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F886E2CF;
	Sun,  9 Aug 2020 00:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536B6E2CF
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:56:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06113206E9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596934574;
 bh=oGs0rKWqxtfTQ9FJ6Jjr2KhUw8xQSwkZHO6TmqRx174=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vzzts3B/x6KCHIQ+Hn1p1HruXW6cecQdzbZNcgEyVsoRaT4HftVQs0kdiUlaEguXF
 fWk0YlcPKuD8iQVaZS7IFIaswzl+kHknNNwU+F4nH42NdpuO6kX7LV17NQ/mHBkQgw
 NjB0xGxWQZpxhDtwLY6w3jb8OvrHfledr0VsJyWc=
Received: by mail-ej1-f41.google.com with SMTP id g19so5865294ejc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 17:56:13 -0700 (PDT)
X-Gm-Message-State: AOAM532mN1CqXBNIFLc6gaeoC2DedyRnajYMzMWBpXWypU69XohxXuAm
 rikDGu2GgNiGTgrogELJRhBLkvi/gxXqX8oCVA==
X-Google-Smtp-Source: ABdhPJyh5IoUDVzcfP7Egn+Xg1eTx8HohyZaiVtN7kN7dlLqqJN22jwVw+zE/NmDFnoeAUDSceqqG3XpXI4D9fjYoSo=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr15641505ejk.94.1596934572615; 
 Sat, 08 Aug 2020 17:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:56:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
Message-ID: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMTowNOWvq+mBk++8mgo+Cj4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPgo+IENoYW5nZS1JZDogSTY3NjM1
ZWM3ZjNmNTljZjRjYmM3NzM3Mjg1ZTVlMjhmZjBhYjcxYzkKClJlbW92ZSBjaGFuZ2UtaWQuCgo+
IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0IHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4g
aW5kZXggYjkxZTcwOS4uZTZiYmUzMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0Cj4gQEAgLTY2LDYgKzY2LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERN
QSBmdW5jdGlvbiBibG9ja3MpOgo+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dAo+ICAgIGZvciBkZXRhaWxz
Lgo+Cj4gK09wdGlvbmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToKPiArLSBt
ZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBl
dmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25k
aW5nIHJkbWEKPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGlu
IGhhcmR3YXJlIGRhdGEgc2hlZXQuCj4gKwo+ICBFeGFtcGxlczoKPgo+ICBtbXN5czogY2xvY2st
Y29udHJvbGxlckAxNDAwMDAwMCB7Cj4gQEAgLTIwNywzICsyMTIsMTIgQEAgb2RAMTQwMjMwMDAg
ewo+ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5f
TU0+Owo+ICAgICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9PRD47Cj4gIH07Cj4g
Kwo+ICtyZG1hMTogcmRtYUAxNDAwYzAwMCB7Cj4gKyAgICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kaXNwLXJkbWEiOwo+ICsgICAgICAgcmVnID0gPDAgMHgxNDAwYzAwMCAwIDB4
MTAwMD47Cj4gKyAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjI5IElSUV9UWVBFX0xFVkVM
X0xPVz47Cj4gKyAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BPV0VSX0RP
TUFJTl9ESVNQPjsKPiArICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfUkRNQTE+
Owo+ICsgICAgICAgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUgPSA8MjA0OD47Cj4gK307CgpJIHdv
dWxkIGxpa2UgeW91IHRvIHNob3cgcmRtYTAgYXMgd2VsbCBzbyB0aGF0IGNvdWxkIHByb3ZlIHR3
byByZG1hCmhhdmUgZGlmZmVyZW50IGZpZm8gc2l6ZSBpbiB0aGUgc2FtZSBTb0MuCgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
