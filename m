Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D724C8A5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943B6EA75;
	Thu, 20 Aug 2020 23:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08D06EA75
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:36:52 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51ABA2087D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966612;
 bh=zu6dDzfaquWSp2uUIMe35Em3fehg9+BJA+WpR/RQhd4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VEp+3KyFjIwmu94z64ixA9Rrr71Jh6bFYApt+fq5Yn83IVa6pSFmfxSjLg27DtpYJ
 MtH+SJNf7631QI2iX7KMdCBfLWPWfyLokEuxCHD0w6eZ4iZ0Yl2x3yudQogSPs6cwO
 QV3wWok7jElKGlv57eg1w/yIaeNreCgJiIoli6cE=
Received: by mail-ed1-f42.google.com with SMTP id c10so7948edk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:36:52 -0700 (PDT)
X-Gm-Message-State: AOAM531v+qEpVEmIkDbpP3Di1Rlz7yTgcBdr18bsZ5jrhOSFxj+Id+nA
 z48V70MaGd6XiE6zkmYGHT0PBm57mgyjyY1aPg==
X-Google-Smtp-Source: ABdhPJyBSJx3TcHZvu2J+XPfgaFyiT8RjUUAgdQ/KuzhMeixYVHxkITA+AkOph4jNHOhS8/2MYeaprdPdiaDkfm4vDY=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr309611edb.48.1597966610947; 
 Thu, 20 Aug 2020 16:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:36:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8rqu4_yVPVCCpyQjognDP0jK=wTr2rFw0WjjY=dzkHHg@mail.gmail.com>
Message-ID: <CAAOTY_8rqu4_yVPVCCpyQjognDP0jK=wTr2rFw0WjjY=dzkHHg@mail.gmail.com>
Subject: Re: [PATCH v1 05/21] mtk-mmsys: add ovl mout on support
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
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxNuWvq+mBk++8mgo+Cj4gYWRk
IG92bCBtb3V0IG9uIHN1cHBvcnQKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
bXN5cy9tdDgxOTItbW1zeXMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZl
cnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICAgICAgICAgIHwgIDggKysrKysrKysKPiAgaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggICAgfCAgMyArKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbW1zeXMvbXQ4MTkyLW1tc3lzLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5
cy9tdDgxOTItbW1zeXMuYwo+IGluZGV4IDAwNmQ0MWQuLjA2MDgwYWQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQ4MTkyLW1tc3lzLmMKPiArKysgYi9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tbXN5cy9tdDgxOTItbW1zeXMuYwo+IEBAIC0xMzQsMTAgKzEzNCwzMyBA
QCBzdGF0aWMgdm9pZCBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsKHZvaWQgX19pb21lbSAqY29uZmln
X3JlZ3MsCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgaW50IG10a19tbXN5c19vdmxfbW91
dF9lbihlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmFkZHIpCj4gK3sKPiArICAgICAgIGludCB2YWx1
ZSA9IC0xOwo+ICsKPiArICAgICAgICphZGRyID0gTVQ4MTkyX01NU1lTX09WTF9NT1VUX0VOOwo+
ICsKPiArICAgICAgIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PVkwwICYmIG5leHQgPT0gRERQ
X0NPTVBPTkVOVF9PVkxfMkwwKQo+ICsgICAgICAgICAgICAgICB2YWx1ZSA9IERJU1BfT1ZMMF9H
T19CRzsKPiArICAgICAgIGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09WTF8yTDAgJiYg
bmV4dCA9PSBERFBfQ09NUE9ORU5UX09WTDApCj4gKyAgICAgICAgICAgICAgIHZhbHVlID0gRElT
UF9PVkwwXzJMX0dPX0JHOwo+ICsgICAgICAgZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
T1ZMMCkKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBESVNQX09WTDBfR09fQkxFTkQ7Cj4gKyAg
ICAgICBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PVkxfMkwwKQo+ICsgICAgICAgICAg
ICAgICB2YWx1ZSA9IERJU1BfT1ZMMF8yTF9HT19CTEVORDsKPiArICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgICAgdmFsdWUgPSAtMTsKPiArCj4gKyAgICAgICByZXR1cm4gdmFsdWU7Cj4gK30K
PiArCj4gIHN0YXRpYyBzdHJ1Y3QgbXRrX21tc3lzX2Nvbm5fZnVuY3MgbW1zeXNfZnVuY3MgPSB7
Cj4gICAgICAgICAubW91dF9lbiA9IG10a19tbXN5c19kZHBfbW91dF9lbiwKPiAgICAgICAgIC5z
ZWxfaW4gPSBtdGtfbW1zeXNfZGRwX3NlbF9pbiwKPiAgICAgICAgIC5zb3V0X3NlbCA9IG10a19t
bXN5c19kZHBfc291dF9zZWwsCj4gKyAgICAgICAub3ZsX21vdXRfZW4gPSBtdGtfbW1zeXNfb3Zs
X21vdXRfZW4sCj4gIH07Cj4KPiAgc3RhdGljIGludCBtbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gaW5kZXggODI4ZDU5
ZS4uMTM2MmQwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
Ywo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gQEAgLTc2LDYgKzc2
LDE0IEBAIHZvaWQgbXRrX21tc3lzX2RkcF9jb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
ICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwg
dmFsdWU7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3Mg
KyBhZGRyKTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAocHJpdl9mdW5jcy0+b3ZsX21v
dXRfZW4pIHsKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBwcml2X2Z1bmNzLT5vdmxfbW91dF9l
bihjdXIsIG5leHQsICZhZGRyKTsKPiArICAgICAgICAgICAgICAgaWYgKHZhbHVlID49IDApIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKGNvbmZpZ19yZWdz
ICsgYWRkcikgfCB2YWx1ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhl
ZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAg
IH0KCkkgd291bGQgbGlrZSB0byBkbyByb3V0aW5nIGNvbnRyb2wgbGlrZSBbMV0uCgpbMV0gaHR0
cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvdGhpcmRf
cGFydHkva2VybmVsLysvMjM0NTE4NgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9jb25uZWN0KTsKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29j
L21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXggOGVmM2VhYS4uZWVmYzdiMSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gQEAgLTU1LDYgKzU1LDkgQEAgc3Ry
dWN0IG10a19tbXN5c19jb25uX2Z1bmNzIHsKPiAgICAgICAgIHZvaWQgKCpzb3V0X3NlbCkodm9p
ZCBfX2lvbWVtICpjb25maWdfcmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19k
ZHBfY29tcF9pZCBuZXh0KTsKPiArICAgICAgIGludCAoKm92bF9tb3V0X2VuKShlbnVtIG10a19k
ZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBtdGtfZGRw
X2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
KmFkZHIpOwo+ICB9Owo+Cj4gIHZvaWQgbXRrX21tc3lzX3JlZ2lzdGVyX2Nvbm5fZnVuY3Moc3Ry
dWN0IGRldmljZSAqZGV2LAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
