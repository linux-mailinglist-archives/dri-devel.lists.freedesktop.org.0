Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C31B8DDD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 10:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292389C18;
	Sun, 26 Apr 2020 08:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BD989C18
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 08:20:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECDA02070A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587889253;
 bh=32JPrJrGuDRD2wkuFtj2MYt27oiR4LTyT2PFdhPaclQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0tLZar1QUA+vvcNySsyW0rfaxWr2woQV7fXM/l6uVDEwEdBMdtgw//+P20sNglhU3
 iyD7SKLm3Iz9jffpJMcaScYEERBIum/EprF3MM1+3GfpD5aXy7yoPfl3eygBsfKVpA
 XSP2CPssF5zHqiaYcKY2fqCuFWxFRkkcTZMUh+mk=
Received: by mail-ej1-f44.google.com with SMTP id e2so11344563eje.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 01:20:52 -0700 (PDT)
X-Gm-Message-State: AGi0PubSQbsECogAC6zbuBMQgmlI8QEiV3Empd2vCXzWTK+nAGMSiOS+
 9UXIsOStPAoeCS7TPww/HVaro7OGEuxGiyYaaA==
X-Google-Smtp-Source: APiQypIeMlhVPVvjZ/EzBhYNkJSsKB75b0ue/XkSPqE14oZvx51BpCqy/qg7FEkcuFRxAPFavqIR3TDtbcx1mHFl0LQ=
X-Received: by 2002:a17:906:eb90:: with SMTP id
 mh16mr14806818ejb.201.1587889251405; 
 Sun, 26 Apr 2020 01:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
In-Reply-To: <20200420135045.27984-1-yuehaibing@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 26 Apr 2020 16:20:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
Message-ID: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix Kconfig warning
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1ZUhhaWJpbmc6CgpZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IOaWvCAy
MDIw5bm0NOaciDIw5pelIOmAseS4gCDkuIvljYgxMDowNOWvq+mBk++8mgo+Cj4gV0FSTklORzog
dW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgTVRLX01NU1lTCj4gICBEZXBl
bmRzIG9uIFtuXTogKEFSQ0hfTUVESUFURUsgWz15XSB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYg
Q09NTU9OX0NMS19NVDgxNzNfTU1TWVMgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAgLSBE
Uk1fTUVESUFURUsgWz15XSAmJiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAmJiAoQVJDSF9N
RURJQVRFSyBbPXldIHx8IEFSTSAmJiBDT01QSUxFX1RFU1QgWz1uXSkgJiYgQ09NTU9OX0NMSyBb
PXldICYmIEhBVkVfQVJNX1NNQ0NDIFs9eV0gJiYgT0YgWz15XQo+Cj4gQWRkIG1pc3NpbmcgZGVw
ZW5kY3kgQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMgdG8gZml4IHRoaXMuCgpGcm9tIHRoZSBjb2Rl
IHJlbGF0aW9uc2hpcCwgbWVkaWF0ZWsgZHJtIGhhcyByZWxhdGlvbiB3aXRoIG1lZGlhdGVrCm1t
c3lzLCBhbmQgbWVkaWF0ZWsgbW1zeXMgaGFzIHJlbGF0aW9uIHdpdGggbWVkYWl0ZWsgY2xvY2su
ClNvIEkgdGhpbmsgaXQncyBiZXR0ZXIgdGhhdCBDT05GSUdfTVRLX01NU1lTIHNlbGVjdApDT05G
SUdfQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IEZp
eGVzOiAyYzc1OGUzMDFlZDkgKCJzb2MgLyBkcm06IG1lZGlhdGVrOiBNb3ZlIHJvdXRpbmcgY29u
dHJvbCB0byBtbXN5cyBkZXZpY2UiKQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25m
aWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZwo+IGluZGV4IGM0MjBmNWEzZDMzYi4uNGQ5YjU1NDBkZTY4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiBAQCAtNiw2ICs2LDcgQEAgY29uZmlnIERSTV9NRURJ
QVRFSwo+ICAgICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4gICAgICAgICBkZXBlbmRzIG9u
IEhBVkVfQVJNX1NNQ0NDCj4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4gKyAgICAgICBkZXBlbmRz
IG9uIENPTU1PTl9DTEtfTVQ4MTczX01NU1lTCj4gICAgICAgICBzZWxlY3QgRFJNX0dFTV9DTUFf
SEVMUEVSCj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgICAgICAgIHNlbGVjdCBE
Uk1fTUlQSV9EU0kKPiAtLQo+IDIuMTcuMQo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
