Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF34C2DD2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3A6E503;
	Tue,  1 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3596E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:56:43 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA0Ji18="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id v00409v8UEueSkh
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 30 Sep 2019 16:56:40 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
Date: Mon, 30 Sep 2019 16:56:39 +0200
Message-Id: <BCB0237F-1AF7-4603-A778-8944C3618BC7@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
 <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1569855401; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=fWF7W1fXCBUVnV4e5QpVkAAjp4iG3lMu6dcgraOrTws=;
 b=RxAf/UYWNXojBpNalU8EaOE2xl0xydrZuPX2l6q9Xfy8WbtnYj5JWvoY5f7prMxeON
 yNsqtutAszgJ5ymWvqmkO/GGMa2/uYCD2+qnvH9TzDJpupnP6cG4Ms6wztXeEDMs9jEq
 UCebJLg1h1GcNUy2YQTxtmLA8u+XXoMsBRtcW65CSnVJU83hitHPcj/cLTsKNR7gN9Bx
 ourI832dR1pTGDf0Ij30SuEBwaUjHnLTNB4wNYheEOMlepqWF+odZEMQBAHhcqRdiVLq
 A9JVAon1QkytuHz4n8w0dFq93mkRdaxRRGvjfMy4TpOeyeXB+/vAuc/3qOqMIuTQNVj+
 DqFA==
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Adam Ford <adam.ford@logicpd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMzAuMDkuMjAxOSB1bSAxNjoyNyBzY2hyaWViIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Ogo+IAo+IE9uIDMwLzA5LzIwMTkgMTc6MjAsIFRvbWkgVmFsa2VpbmVu
IHdyb3RlOgo+IAo+PiBMZXQncyBzZWUgd2hhdCBUZXJvIHNheXMsIGJ1dCB5ZWFoLCBzb21ldGhp
bmcgaXMgb2RkIGhlcmUuIEkgZXhwZWN0ZWQgdGhlIG1heCBkaXZpZGVyIHRvIGJlIDE2IHdpdGgg
VGVybydzIHBhdGNoLCBidXQgSSBkb24ndCBzZWUgaXQgaGF2aW5nIHRoYXQgZWZmZWN0LiBJIGNh
biBnZXQgdGhlIGRpdiB0byAzMS4KPj4gWW91IGNhbiBzZWUgdGhpcyBmcm9tIHRoZSBjbG9jayBy
ZWdpc3RlciAweDQ4MDA0ZTQwIChDTV9DTEtTRUxfRFNTKS4gVGhlIGxvd2VzdCBiaXRzIGFyZSB0
aGUgZGl2aWRlciwgNSB0byAwLiBUaGUgVFJNIHNheXMgbWF4IGRpdiBpcyAzMi4KPj4gVGVybyBz
YWlkIGZvciBoaW0gdGhlIGRpdmlkZXJzID4gMTYgZGlkbid0ICJzdGljayIgdG8gdGhlIHJlZ2lz
dGVyLiBJJ20gbm93IHdvbmRlcmluZyBpZiBoZSBoYXMgYW4gb2xkIGJlYWdsZWJvYXJkIHdpdGgg
T01BUDM0eHgsIHdoaWNoIGhhcyBtYXggZGl2IDE2Lgo+IAo+IFNvIHRlc3RpbmcgYSBiaXQgbW9y
ZSBoZXJlLCBJIGNhbiBzZWUgdGhlIERTUyB3b3JraW5nIGZpbmUgYW5kIGZwcyBhcyBleHBlY3Rl
ZCB3aGVuIEkgd3JpdGUgdmFsdWVzIGRpcmVjdGx5IHRvIENNX0NMS1NFTF9EU1M6NTowLCB3aXRo
IGRpdmlkZXJzIHVwIHRvIDMxLiBXaXRoIDMyLCBEU1MgYnJlYWtzLiBUaGUgVFJNIChBTS9ETTM3
eCkgc2F5cyB2YWx1ZSAzMiBpcyB2YWxpZC4KCkp1c3QgYSBibGluZCBndWVzczogaXMgdGhlcmUg
c29tZXRoaW5nIGluIHRoZSBlcnJhdGEgdG8gdGFrZSBjYXJlIG9mPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
