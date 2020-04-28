Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DEF1BC47D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 18:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147D96E842;
	Tue, 28 Apr 2020 16:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0746E842
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:05:48 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1837721927
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588089948;
 bh=ha74p5osPq/Fc3CF17rmXyTy7T6X5ysJvW80Tys9jaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0dbcMJdky6/KE5oqf7xFxKV0nvxCb348kb1V53yMGUJLFKWOd99FZ18n6s9Cczajr
 wdThMp0nDIOERbNXcnSnT6pkavy7nlA3ZNrb6GMRPc/rjX+ChkfWr9ZpJG5/MkQA9t
 W6nkvGowbT6pbDsVK2HQ+a48pjG1aiPKGAaH52XY=
Received: by mail-ed1-f51.google.com with SMTP id f12so16791696edn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:05:48 -0700 (PDT)
X-Gm-Message-State: AGi0PuaAwhyoOCBL/YSRsn32MQhfU0Il+PMGsVZzWZQGCwjLEg0MAqbn
 E00OutWk1Th6wL/NdKFzmv9n0PCh3g7LhaGriw==
X-Google-Smtp-Source: APiQypKHSVjOdbrgmCD0Ai4eyQOpggee1czWxlBZjdwbOJTigW/nq8+SgqWYpQTsun99LAQNf5hO0fvn3WJwMJdxsNA=
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr22982067edv.148.1588089946412; 
 Tue, 28 Apr 2020 09:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
 <20200428145507.GQ3456981@phenom.ffwll.local>
In-Reply-To: <20200428145507.GQ3456981@phenom.ffwll.local>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 00:05:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-tNGOaKT9tqT7YSf1hWjShCSMaDxmU2vAqNAGMqPTPBQ@mail.gmail.com>
Message-ID: <CAAOTY_-tNGOaKT9tqT7YSf1hWjShCSMaDxmU2vAqNAGMqPTPBQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix Kconfig warning
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiDmlrwgMjAyMOW5tDTmnIgyOOaXpSDpgLHk
uowg5LiL5Y2IMTA6NTXlr6vpgZPvvJoKPgo+IE9uIFN1biwgQXByIDI2LCAyMDIwIGF0IDA0OjIw
OjM5UE0gKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBIaSwgWXVlSGFpYmluZzoKPiA+
Cj4gPiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0NOaciDIw
5pelIOmAseS4gCDkuIvljYgxMDowNOWvq+mBk++8mgo+ID4gPgo+ID4gPiBXQVJOSU5HOiB1bm1l
dCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBNVEtfTU1TWVMKPiA+ID4gICBEZXBl
bmRzIG9uIFtuXTogKEFSQ0hfTUVESUFURUsgWz15XSB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYg
Q09NTU9OX0NMS19NVDgxNzNfTU1TWVMgWz1uXQo+ID4gPiAgIFNlbGVjdGVkIGJ5IFt5XToKPiA+
ID4gICAtIERSTV9NRURJQVRFSyBbPXldICYmIEhBU19JT01FTSBbPXldICYmIERSTSBbPXldICYm
IChBUkNIX01FRElBVEVLIFs9eV0gfHwgQVJNICYmIENPTVBJTEVfVEVTVCBbPW5dKSAmJiBDT01N
T05fQ0xLIFs9eV0gJiYgSEFWRV9BUk1fU01DQ0MgWz15XSAmJiBPRiBbPXldCj4gPiA+Cj4gPiA+
IEFkZCBtaXNzaW5nIGRlcGVuZGN5IENPTU1PTl9DTEtfTVQ4MTczX01NU1lTIHRvIGZpeCB0aGlz
Lgo+ID4KPiA+IEZyb20gdGhlIGNvZGUgcmVsYXRpb25zaGlwLCBtZWRpYXRlayBkcm0gaGFzIHJl
bGF0aW9uIHdpdGggbWVkaWF0ZWsKPiA+IG1tc3lzLCBhbmQgbWVkaWF0ZWsgbW1zeXMgaGFzIHJl
bGF0aW9uIHdpdGggbWVkYWl0ZWsgY2xvY2suCj4gPiBTbyBJIHRoaW5rIGl0J3MgYmV0dGVyIHRo
YXQgQ09ORklHX01US19NTVNZUyBzZWxlY3QKPiA+IENPTkZJR19DT01NT05fQ0xLX01UODE3M19N
TVNZUy4KPgo+IHNlbGVjdCBpcyB2ZXJ5IHN0cm9uZ2x5IGRpc2NvdXJhZ2VkIGFuZCBzaG91bGQg
b25seSBiZSB1c2VkIGZvciBLY29uZmlnCj4gc3ltYm9scyBub3QgdmlzaWJsZSB0byB1c2Vycy4K
Ck9rYXksIG1heWJlIHRoZSBiZXR0ZXIgc29sdXRpb24gaXMgdGhhdCBEUk1fTUVESUFURUsgZGVw
ZW5kIG9uIE1US19NTVNZUy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IC1EYW5pZWwKPgo+ID4K
PiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+ID4KPiA+ID4KPiA+ID4gRml4ZXM6IDJjNzU4
ZTMwMWVkOSAoInNvYyAvIGRybTogbWVkaWF0ZWs6IE1vdmUgcm91dGluZyBjb250cm9sIHRvIG1t
c3lzIGRldmljZSIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdA
aHVhd2VpLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2Nv
bmZpZyB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiA+IGluZGV4IGM0MjBmNWEzZDMzYi4uNGQ5
YjU1NDBkZTY4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2Nv
bmZpZwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZwo+ID4gPiBA
QCAtNiw2ICs2LDcgQEAgY29uZmlnIERSTV9NRURJQVRFSwo+ID4gPiAgICAgICAgIGRlcGVuZHMg
b24gQ09NTU9OX0NMSwo+ID4gPiAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9BUk1fU01DQ0MKPiA+
ID4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4gPiA+ICsgICAgICAgZGVwZW5kcyBvbiBDT01NT05f
Q0xLX01UODE3M19NTVNZUwo+ID4gPiAgICAgICAgIHNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVIK
PiA+ID4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiA+ID4gICAgICAgICBzZWxlY3Qg
RFJNX01JUElfRFNJCj4gPiA+IC0tCj4gPiA+IDIuMTcuMQo+ID4gPgo+ID4gPgo+Cj4gLS0KPiBE
YW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
