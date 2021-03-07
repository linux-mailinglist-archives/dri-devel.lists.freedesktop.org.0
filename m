Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0032FE31
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 01:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BDE6E0A0;
	Sun,  7 Mar 2021 00:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E346E0A0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:29:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05307650BA
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615076952;
 bh=Qm+1G7d1VFcN2FM2tw3fh8YNKthWT/QzzdjeOnpB8Gg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fYMeKBDefy8adzWFmPEVaCn9JjNP53bOH8lHJtoCNmiKoEiooKcRTceDmFXuwjs1H
 f1YukAC8x1Rt14Om2H8zVYovJtx0BCrz6K6phb2GVda1KqSLxforFLIKHW+yvK/DOZ
 4G9rrhLHxzxMUgHaVURus2sn8WS4GdLN9eQaM5L+iXdIMUElIJlKbLCWlNkOTPXDvo
 5s6gdqfNmTg4KSMs9G/MmI1Z3pvAiFSqnp1QmcVz+pDrLwq3qYCvo6u3v9Q34UHoqN
 t63GfZXovqK7rhmkuLCuxJFHg1YbO6AwHdauu+eRCuILFKW2giOIzdf8WV4C9bOrQ1
 HhOzh8lUyb+bA==
Received: by mail-ej1-f50.google.com with SMTP id lr13so12380448ejb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 16:29:11 -0800 (PST)
X-Gm-Message-State: AOAM531Z37B+vvQLwUZ3sjzUbQ0cgF13gGhb+TdGT8o4RThHmHY107G5
 yr6ZdwgXpdDVe7Oy/uUfMWJ7/8ZnMZZrtTkeLA==
X-Google-Smtp-Source: ABdhPJx86dxHMYU804TmHhrl6hB/nQz8DTF31DqqLkgoli8x+pMuP9LbNuzOW5+hFr6RSCcgkkx4FdK+v0a/8wRS+bw=
X-Received: by 2002:a17:906:b102:: with SMTP id
 u2mr8671789ejy.303.1615076950598; 
 Sat, 06 Mar 2021 16:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20210201033603.12616-1-jitao.shi@mediatek.com>
 <20210201033603.12616-2-jitao.shi@mediatek.com>
In-Reply-To: <20210201033603.12616-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:28:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99y=wqdspKbcx_kyRRQhzDtPvjrAdn4jzeyhADjnhZgw@mail.gmail.com>
Message-ID: <CAAOTY_99y=wqdspKbcx_kyRRQhzDtPvjrAdn4jzeyhADjnhZgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mediatek: dsi: Fix EoTp flag
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTozNuWvq+mBk++8mgo+Cj4gU29DIHdpbGwgdHJhbnNt
aXQgdGhlIEVvVHAgKEVuZCBvZiBUcmFuc21pc3Npb24gcGFja2V0KSB3aGVuCj4gTUlQSV9EU0lf
TU9ERV9FT1RfUEFDS0VUIGZsYWcgaXMgc2V0LgoKSSd2ZSBtb2RpZmllZCB0aGUgdGl0bGUgYW5k
IG1lc3NhZ2UgYXM6Cgpkcm0vbWVkaWF0ZWs6IGRzaTogVXNlIHN5bWJvbGl6ZWQgcmVnaXN0ZXIg
ZGVmaW5pdGlvbgoKRm9yIEhTVFhfQ0tMUF9FTiBhbmQgRElTX0VPVCwgdXNlIHN5bWJvbGl6ZWQg
cmVnaXN0ZXIKZGVmaW5pdGlvbiBpbnN0ZWFkIG9mIG1hZ2ljIG51bWJlci4KCgpBbmQgYXBwbGll
ZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9o
PW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA3ICsrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwo+IGluZGV4IDY1ZmQ5OWM1MjhhZi4uMmJjNDZmMjM1MGYxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTQwMSw4ICs0MDEsMTEgQEAgc3RhdGljIHZvaWQg
bXRrX2RzaV9yeHR4X2NvbnRyb2woc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHRtcF9yZWcgfD0gKGRzaS0+bW9kZV9m
bGFncyAmIE1JUElfRFNJX0NMT0NLX05PTl9DT05USU5VT1VTKSA8PCA2Owo+IC0gICAgICAgdG1w
X3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUKSA+PiAz
Owo+ICsgICAgICAgaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX0NMT0NLX05PTl9DT05U
SU5VT1VTKQo+ICsgICAgICAgICAgICAgICB0bXBfcmVnIHw9IEhTVFhfQ0tMUF9FTjsKPiArCj4g
KyAgICAgICBpZiAoIShkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX0VPVF9QQUNLRVQp
KQo+ICsgICAgICAgICAgICAgICB0bXBfcmVnIHw9IERJU19FT1Q7Cj4KPiAgICAgICAgIHdyaXRl
bCh0bXBfcmVnLCBkc2ktPnJlZ3MgKyBEU0lfVFhSWF9DVFJMKTsKPiAgfQo+IC0tCj4gMi4xMi41
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
