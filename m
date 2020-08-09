Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235F23FC14
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 03:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D626E2D1;
	Sun,  9 Aug 2020 01:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5536E2D1
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 01:08:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BB9820748
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 01:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596935337;
 bh=eqq7sVY8BRS8obJcxE/XbjiiZrd9saTF1MqNPfw36BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j3ycVpAK+U2RAxmk8LW1Cm4sWW/Dd9s3TyWPyq4VS0zdIUaZ+FtAwQ/ut5Dbvd46Z
 4SicMmRxX+ahR9u5GQPPSWj1yVQ8LO8U/aVZjPpSb7EEViz9zYf1wHawG+9T0TFvEm
 eBZgQjGig5PXmey8AKQwA+Etvnivf2RmrKLM3hBA=
Received: by mail-ej1-f53.google.com with SMTP id f24so5904917ejx.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 18:08:57 -0700 (PDT)
X-Gm-Message-State: AOAM533idQldtExu43Mi5+B92UGP8KSrX9z/2wouBR6fj7VAJD+ztz23
 kYQ8GufT9Q5622K4DgRn/KfCWY+oQecKd1FIQQ==
X-Google-Smtp-Source: ABdhPJyt5U/LEKGnmkq7BQqREwAcqBg7M1Dqq6mXYt8dTYgXNNhPV/x47So5Wr70sZ5dRyMB8d2S5BnxaVfn+mAciEA=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr15505191ejl.375.1596935335797; 
 Sat, 08 Aug 2020 18:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
In-Reply-To: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 09:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__b8h9FaqaeBb0Ewf9m0t8qVBzwgrF3n1RynR7+BAFGwg@mail.gmail.com>
Message-ID: <CAAOTY__b8h9FaqaeBb0Ewf9m0t8qVBzwgrF3n1RynR7+BAFGwg@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDm
lrwgMjAyMOW5tDjmnIg55pelIOmAseaXpSDkuIrljYg4OjU25a+r6YGT77yaCj4KPiBIaSwgWW9u
Z3FpYW5nOgo+Cj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0OOaciDjml6Ug6YCx5YWtIOS4iuWNiDExOjA05a+r6YGT77yaCj4gPgo+ID4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
ID4gcHJvcGVydHkgdG8gdGhlIGNvcnJlc3BvbmRpbmcgcmRtYQo+ID4KPiA+IENoYW5nZS1JZDog
STY3NjM1ZWM3ZjNmNTljZjRjYmM3NzM3Mjg1ZTVlMjhmZjBhYjcxYzkKPgo+IFJlbW92ZSBjaGFu
Z2UtaWQuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gaW5kZXggYjkxZTcwOS4uZTZiYmUzMiAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpc3AudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gQEAgLTY2LDYgKzY2
LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOgo+ID4gICAg
YXJndW1lbnQsIHNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVk
aWF0ZWssaW9tbXUudHh0Cj4gPiAgICBmb3IgZGV0YWlscy4KPiA+Cj4gPiArT3B0aW9uYWwgcHJv
cGVydGllcyAoUkRNQSBmdW5jdGlvbiBibG9ja3MpOgo+ID4gKy0gbWVkaWF0ZWsscmRtYV9maWZv
X3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywg
YWRkIHRoaXMKPiA+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPiA+ICsg
IHRoZSB2YWx1ZSBpcyB0aGUgTWF4IHZhbHVlIHdoaWNoIGRlZmluZWQgaW4gaGFyZHdhcmUgZGF0
YSBzaGVldC4KPiA+ICsKPiA+ICBFeGFtcGxlczoKPiA+Cj4gPiAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgewo+ID4gQEAgLTIwNywzICsyMTIsMTIgQEAgb2RAMTQwMjMwMDAgewo+
ID4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTczX1BPV0VSX0RPTUFJTl9N
TT47Cj4gPiAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Owo+ID4gIH07
Cj4gPiArCj4gPiArcmRtYTE6IHJkbWFAMTQwMGMwMDAgewo+ID4gKyAgICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLXJkbWEiOwo+ID4gKyAgICAgICByZWcgPSA8MCAweDE0
MDBjMDAwIDAgMHgxMDAwPjsKPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOSBJ
UlFfVFlQRV9MRVZFTF9MT1c+Owo+ID4gKyAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMg
TVQ4MTgzX1BPV0VSX0RPTUFJTl9ESVNQPjsKPiA+ICsgICAgICAgY2xvY2tzID0gPCZtbXN5cyBD
TEtfTU1fRElTUF9SRE1BMT47Cj4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFfZmlmb19zaXplID0g
PDIwNDg+Owo+ID4gK307Cj4KPiBJIHdvdWxkIGxpa2UgeW91IHRvIHNob3cgcmRtYTAgYXMgd2Vs
bCBzbyB0aGF0IGNvdWxkIHByb3ZlIHR3byByZG1hCj4gaGF2ZSBkaWZmZXJlbnQgZmlmbyBzaXpl
IGluIHRoZSBzYW1lIFNvQy4KClNvcnJ5LCByZG1hMCBpcyBhbHJlYWR5IGRlZmluZSBpbiB0aGlz
IGZpbGUuIEp1c3QgaWdub3JlIHRoaXMgY29tbWVudC4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4gPiAtLQo+ID4gMS44LjEuMS5kaXJ0eQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
