Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ACA23FBF9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 02:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415386E2C7;
	Sun,  9 Aug 2020 00:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF66E2C7
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:37:05 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 171F1206C0
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 00:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596933425;
 bh=OwZbj9j2fVznBXJWG+kGBBS6B2y4BHwVj3nvv2bUc+o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TlFTbbMV/k+o66PWyKj3MJLo37tNkgYDcrrUiK+N73KaD55/NMcj9yl4sXEqJV+Ve
 8sU2kjCPKUYEX7g0XgGoRl8cq5fnESFhrnVv4Z+af7+hm6EgI9NLQlKLqlzc+cFXLT
 /NFLdgtWCZuXa/8F1GZhNh0CeqKGSZRSA133jfII=
Received: by mail-ej1-f53.google.com with SMTP id kq25so5876065ejb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 17:37:05 -0700 (PDT)
X-Gm-Message-State: AOAM533RYaVbr4w7LAkjhbiC1ZKENnIEJVertFARAgcqCxWR0+b8mJCz
 noA9yH71ZROw2K68FGTFS+FI2mh7+/8qVS3byQ==
X-Google-Smtp-Source: ABdhPJyRhNiwUtOdFe5BV5TXi2CdPsenCRK7yZwtV8dYfmYgEntYLcapnDUx1Pn9vQyDNpXrZ1cECP5wWDwV76cWsVI=
X-Received: by 2002:a17:906:12d8:: with SMTP id
 l24mr4040593ejb.260.1596933423727; 
 Sat, 08 Aug 2020 17:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:36:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8nE4mHq0O2hnqr7+ooKSPS-O2CB6MprODF95gEJB_naQ@mail.gmail.com>
Message-ID: <CAAOTY_8nE4mHq0O2hnqr7+ooKSPS-O2CB6MprODF95gEJB_naQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 0/7] add drm support for MT8183
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

SGksIFlvbmdxaWFuZzoKClRoaXMgc2VyaWVzIGlzICd2OCcsIG5vdCAnUkVTRU5EIHY3JwoKWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOaciDjm
l6Ug6YCx5YWtIOS4iuWNiDEwOjU25a+r6YGT77yaCj4KPiBUaGlzIHNlcmllcyBhcmUgYmFzZWQg
b24gNS44LXJjMSBhbmQgcHJvdmlkZSA3IHBhdGNoCj4gdG8gc3VwcG9ydCBtZWRpYXRlayBTT0Mg
TVQ4MTgzCj4KPiBDaGFuZ2Ugc2luY2UgdjYKPiAtIG1vdmUgZGRwIGNvbXBvbmVudCBkZWZpbmUg
aW50byBtdGtfbW1zeXMuaAo+IC0gYWRkIG1tc3lzIHByaXZhdGUgZGF0YSB0byBzdXBwb3J0IGRp
ZmZlcmVudCBpYyBwYXRoIGNvbm5lY3Rpb24KPiAtIGFkZCBtdDgxODMtbW1zeXMuYyB0byBzdXBw
b3J0IDgxODMgcGF0aCBjb25uZWN0aW9uCj4gLSBmaXggcmV2aWV3ZWQgaXNzdWUgaW4gdjYKPgo+
IENoYW5nZSBzaW5jZSB2NQo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHY1Cj4gYmFzZSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2Vy
aWVzPTIxMzIxOQo+Cj4gQ2hhbmdlIHNpbmNlIHY0Cj4gLSBmaXggcmV2aWV3ZWQgaXNzdWUgaW4g
djQKPgo+IENoYW5nZSBzaW5jZSB2Mwo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHYzCj4gLSBm
aXggdHlwZSBlcnJvciBpbiB2Mwo+IC0gZml4IGNvbmZsaWN0IHdpdGggaW9tbXUgcGF0Y2gKPgo+
IENoYW5nZSBzaW5jZSB2Mgo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHYyCj4gLSBhZGQgbXV0
ZXggbm9kZSBpbnRvIGR0cyBmaWxlCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gZml4IHJldmll
d2VkIGlzc3VlIGluIHYxCj4gLSBhZGQgZHRzIGZvciBtdDgxODMgZGlzcGxheSBub2Rlcwo+IC0g
YWRqdXN0IGRpc3BsYXkgY2xvY2sgY29udHJvbCBmbG93IGluIHBhdGNoIDIyCj4gLSBhZGQgdm1h
cCBzdXBwb3J0IGZvciBtZWRpYXRlayBkcm0gaW4gcGF0Y2ggMjMKPiAtIGZpeCBwYWdlIG9mZnNl
dCBpc3N1ZSBmb3IgbW1hcCBmdW5jdGlvbiBpbiBwYXRjaCAyNAo+IC0gZW5hYmxlIGFsbG93X2Zi
X21vZGlmaWVycyBmb3IgbWVkaWF0ZWsgZHJtIGluIHBhdGNoIDI1Cj4KPiBZb25ncWlhbmcgTml1
ICg3KToKPiAgIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIHJkbWFfZmlmb19zaXplIGRlc2Ny
aXB0aW9uIGZvciBtdDgxODMKPiAgICAgZGlzcGxheQo+ICAgZHJtL21lZGlhdGVrOiBtb3ZlIGRk
cCBjb21wb25lbnQgZGVmaW5lIGludG8gbXRrX21tc3lzLmgKPiAgIG10ay1tbXN5czogYWRkIG1t
c3lzIHByaXZhdGUgZGF0YQo+ICAgbXRrLW1tc3lzOiBhZGQgbXQ4MTgzIG1tc3lzIHN1cHBvcnQK
PiAgIGRybS9tZWRpYXRlazogYWRkIGZpZm9fc2l6ZSBpbnRvIHJkbWEgcHJpdmF0ZSBkYXRhCj4g
ICBkcm0vbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBtZWRpYXRlayBTT0MgTVQ4MTgzCj4gICBh
cm02NDogZHRzOiBhZGQgZGlzcGxheSBub2RlcyBmb3IgbXQ4MTgzCj4KPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAgMTQgKysKPiAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSAgICAgICAgICAgfCAgOTggKysrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jICAgICAgICAgICAg
fCAgMTggKysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAg
ICAgICAgfCAgMjUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMg
ICAgICAgICAgICAgfCAgNDcgKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5oICAgICAgICB8ICAzNCArLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgICAgICAgICAgICAgfCAgNDMgKysrKwo+ICBkcml2ZXJzL3NvYy9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29j
L21lZGlhdGVrL21tc3lzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAzICsKPiAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1tc3lzLmMgICAgICAgICAgfCAyNTAgKysrKysr
KysrKysrKysrKysrKwo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdDgxODMtbW1zeXMu
YyAgICAgICAgICB8IDE1NCArKysrKysrKysrKysKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmMgICAgICAgICAgICAgICAgICAgfCAyNzYgKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4g
IGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgICAgICAgIHwgIDQ4
ICsrKysKPiAgMTMgZmlsZXMgY2hhbmdlZCwgNzQ5IGluc2VydGlvbnMoKyksIDI2MiBkZWxldGlv
bnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL01h
a2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9t
dDI3MDEtbW1zeXMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bW1zeXMvbXQ4MTgzLW1tc3lzLmMKPgo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
