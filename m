Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A132DBB1
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57054890E5;
	Wed, 29 May 2019 11:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617056E218
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 07:06:54 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so1295819qtk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 00:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA9B1CIdYn7uFQh9agY6VqwI4z4QDnUm8YBBmahDu4U=;
 b=E9HcmwtsaLY0wdZ3p3PgkPb+U9eOs+eFH7EfMR0058xDP+SwsgzibnkXQzwGKWElYM
 ny9YXXfy/hefHzKjbMDmnJfMuZPUZX2KVnShiyQ0Ou2R/YtwnU/Q2ihct3djexYF5iFi
 NFSjMD5wKiiEWX1gYgpmPYIgI1oIRAyYqo51N1Q+4soG1CNW0DcnKhoHLkeh7r1M2l6N
 e/zVM7rEw99O2cBS85P1tnMoFhHSGWCuH1P70r7y98Qnv4ko4XRZVVuL3pasXLuJE2si
 a53K1dP+Gr1Pn/toznRn6yQD+0H3h/iNbUOyEYL7D0k+Yp2sUjeCyC0h0gM3Zlu6tNGX
 tDYQ==
X-Gm-Message-State: APjAAAU2x/7IrHJMFyIOSyEN58dhzwJuDOm9OmzwUYRL83q/P9qwL5n7
 QYrrKyuF/radqQuT6Y3ExU8Sm/jotUnqtReN5Kn1lA==
X-Google-Smtp-Source: APXvYqwaIhOfv/yjZJUEyrJh1Af7NiK3bC572neTGlR+hYHK4lhLZttmwCQu3ZrIVWJojbIsz1dCv5ftzO/ZJKndKPs=
X-Received: by 2002:a0c:b66f:: with SMTP id q47mr24087512qvf.102.1559113613462; 
 Wed, 29 May 2019 00:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-2-hsinyi@chromium.org>
 <1559093711.11380.6.camel@mtksdaap41>
In-Reply-To: <1559093711.11380.6.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 15:06:27 +0800
Message-ID: <CAJMQK-jDhDNViUA3dpixG=_Pe7x0qH4utBWy3k+D_+oKwEOPig@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qA9B1CIdYn7uFQh9agY6VqwI4z4QDnUm8YBBmahDu4U=;
 b=RSu6+dlro0iGo/wUkUotKEAtoX5JlmpVTXx83cweGW1rp3wkzwJvCnwrRTU9LabdhH
 WJzxoaT/USBOZMKWfosrpwqhOlCtxQhy0+dWLhm1GUa4vdZxi4ALhT4Gsa6dE7h4rntu
 4rNayUppH/l8daDhNYVSVWru1i7bkr9B8Pxdk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgOTozNSBBTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKCj4KPiBJIHRoaW5rIG10a19kc2lfZGVzdHJveV9jb25uX2VuYygpIGhhcyBtdWNo
IHRoaW5nIHRvIGRvIGFuZCBJIHdvdWxkIGxpa2UKPiB5b3UgdG8gZG8gbW9yZS4gWW91IGNvdWxk
IHJlZmVyIHRvIFsyXSBmb3IgY29tcGxldGUgaW1wbGVtZW50YXRpb24uCj4KPiBbMl0KPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmM/aD12NS4y
LXJjMiNuMTU3NQo+CkhpIENLLAoKU2luY2UgZHJtX2VuY29kZXJfY2xlYW51cCgpIHdvdWxkIGFs
cmVhZHkgY2FsbCBkcm1fYnJpZGdlX2RldGFjaCgpIHRvCmRldGFjaCBicmlkZ2UsIEkgdGhpbmsg
d2Ugb25seSBuZWVkIHRvIGhhbmRsZSBwYW5lbCBjYXNlIGhlcmUuCldlIGRvbid0IG5lZWQgdG8g
Y2FsbCBtdGtfZHNpX2VuY29kZXJfZGlzYWJsZSgpIHNpbmNlCm10a19vdXRwdXRfZHNpX2Rpc2Fi
bGUoKSBpcyBjYWxsZWQgaW4gbXRrX2RzaV9yZW1vdmUoKSBhbmQKZHNpLT5lbmFibGVkIHdpbGwg
YmUgc2V0IHRvIGZhbHNlLiBDYWxsaW5nIHNlY29uZCB0aW1lIHdpbGwganVzdApyZXR1cm5zIGlt
bWVkaWF0ZWx5LgpTbywgYmVzaWRlcyBzZXR0aW5nCgpkc2ktPnBhbmVsID0gTlVMTDsKZHNpLT5j
b25uLnN0YXR1cyA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOwoKYXJlIHRoZXJlIG90
aGVyIHRoaW5ncyB3ZSBuZWVkIHRvIGRvIGhlcmU/CgpPcmlnaW5hbCBjb2RlIGRvZXNuJ3QgaGF2
ZSBkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50KCksIGFuZCBJJ20gbm90CnN1cmUgaWYgbXRr
IGRzaSB3b3VsZCBuZWVkIHRoaXMuCkFsc28sIG10a19kc2lfc3RvcCgpIHdvdWxkIGFsc28gc3Rv
cCBpcnEuCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
