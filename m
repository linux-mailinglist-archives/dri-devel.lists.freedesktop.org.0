Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8206C2389
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317BE6E051;
	Mon, 30 Sep 2019 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Mon, 30 Sep 2019 13:44:56 UTC
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8AB89D7D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 13:44:56 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA0Ji18="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id v00409v8UDcpSJN
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 30 Sep 2019 15:38:51 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
Date: Mon, 30 Sep 2019 15:38:51 +0200
Message-Id: <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
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
To: Tero Kristo <t-kristo@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1569851095; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/cU1GThaHWVMVBPXz7oa2Qdh8Oy/K7aL/RC4Cd4MOGc=;
 b=MqwiejrWIDxOK/5FpRzcV9GV+FrsPSRnvXUQ9VW23wpk38BU1c+NxO899GgpP6toB9
 YL+pTP63tA5wIuLNzo7HgFF+nbJS5jwY9u0hlLhNQIDyo0y/QgLzjJbjtJH4xHW+HSpl
 7PmHRpeiK18UCvpfd7UDQTvSBaR2/STpD2tySsc0MyefQkZgNm6XQQ6KUpy7ngtIoIBd
 /aFxHb0E/324PbbmNAycTuSlm292mSv+C5HBmUu3NmTZXvHY+U7cl/krZy0AfLSc6kBy
 FRxjZ0iumXU/CmYxVh0ecUIVBjKcldC38cOmsvZigMpmHxzAG0tpZ+iUOaKVAv5yZb6x
 8a7g==
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
 Adam Ford <aford173@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMzAuMDkuMjAxOSB1bSAxMDo1MyBzY2hyaWViIFRlcm8gS3Jpc3RvIDx0LWtyaXN0b0B0
aS5jb20+Ogo+IAo+IFRoZSBiZXN0IGFjdGlvbiBoZXJlIGlzIHByb2JhYmx5IHRvIGRyb3AgdGhl
IG1heC1kaXYgdmFsdWUgZm9yIHRoaXMgY2xvY2sgdG8gMTYuIENhbiBzb21lb25lIGNoZWNrIHRo
aXMgd2l0aCB0aGVpciBkaXNwbGF5IHNldHVwIGFuZCBzZWUgd2hhdCBoYXBwZW5zPyBBdHRhY2hl
ZCBwYXRjaCBzaG91bGQgZG8gdGhlIHRyaWNrLgoKSSBoYXZlIGNoZWNrZWQgb24gR1RBMDQgYW5k
IE9wZW5QYW5kb3JhIChETTM3MzAgcmVzcC4gT01BUDM0MzApIGFuZCBkaWQgbm90IG5vdGljZSBh
IG5lZ2F0aXZlIGVmZmVjdC4KCihXZWxsLCB3ZSBuZXZlciBzZWUgdGhlIHByb2JsZW0gdGhhdCBp
cyBkaXNjdXNzZWQgaGVyZSBhbmQgaGF2ZSBidWlsdCB3aXRoIENPTkZJR19PTUFQMl9EU1NfTUlO
X0ZDS19QRVJfUENLPTApLgoKQlIsCk5pa29sYXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
