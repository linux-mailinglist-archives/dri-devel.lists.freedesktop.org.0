Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520310303F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619B6EA32;
	Tue, 19 Nov 2019 23:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56616E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 09:42:59 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAvw43tJe0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAJ9guWgh
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Tue, 19 Nov 2019 10:42:56 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
Date: Tue, 19 Nov 2019 10:42:55 +0100
Message-Id: <469800BA-25F8-4E0A-8194-50C197BC4BF5@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-33-sebastian.reichel@collabora.com>
 <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
 <20191118144558.abix5y555jk63szb@earth.universe>
 <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574156577; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=E9S56X5IWwYtL9QKYPNY8mvQJ4aCOIKX44C5DnIVBtc=;
 b=bVDZQmvnpXFdbUYLQftSFr1LrJ7Nlw+vgdy20TBKhiyhJDiC4LVGmoIwSp5BaHp2N6
 eV0N0MRjIw8IQC2R4hL+fEvXvjciJI7ZGAAbS1j6rCtYXeODtYLrOYX8aWyxT5BISj94
 d2RF/U8DrVCzBFAZaIxsT7gwufHNTUeI/kJcQ1PRxboIuKPOtYkbKGNab0JORSdkacXJ
 MYe24Cft7B6Dl2TOF8I5rWMGmZCx7ILp7iEHfujwn71wr+8O5MbZJx3rFuVrEmQNEzHu
 xRc9OdxnqSpoRrNoXcmvbd6CuuJ5kSU/wimBWpzesM5pYvhRIk/e3KWIamIr4ccpZ6Tw
 wAZg==
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKPiBBbSAxOC4xMS4yMDE5IHVtIDE1OjUxIHNjaHJpZWIgSC4gTmlrb2xh
dXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPjoKPiAKPj4gT2ssIEkgdHJpZWQgbm90IHRv
IGJyZWFrIHZpZGVvIG1vZGUgc3VwcG9ydCwgYnV0IEkgZG8gbm90IGhhdmUgYW55Cj4+IGhhcmR3
YXJlLiBNYWtlIHN1cmUgdG8gc2V0IHRoZSBNSVBJX0RTSV9NT0RFX1ZJREVPIGZsYWcgaW4gdGhl
IHBhbmVsCj4+IGRyaXZlci4KPiAKPiBJbmRlZWQsIHRoaXMgbWF5IGJlIG1pc3NpbmcgKGNhbid0
IGxvb2sgaW50byB0aGUgY29kZSBhdCB0aGUgbW9tZW50KS4uLgo+IE9yIEkgZGlkIHNvbWV0aGlu
ZyB3cm9uZyB3aGVuIHJlZmFjdG9yaW5nIHRoZSBkcml2ZXIuCj4gV2Ugd2lsbCBmaW5kIG91dC4K
ClllcywgTUlQSV9EU0lfTU9ERV9WSURFTyB3YXMgaW5kZWVkIG1pc3Npbmcvd3JvbmdseSBhcHBs
aWVkIGFuZCBzb21lCm1vcmUgYnVncy4gQnV0IEkgc3RpbGwgd2Fzbid0IGFibGUgdG8gbWFrZSBp
dCB3b3JrLgoKSSBhbHNvIHRyaWVkIHRvIGZha2UgdGhlIHBhbmVsLW9yaXNldGVjaC1vdG04MDA5
YS5jIERTSSBkcml2ZXIgaW50bwpteSBzZXR1cC4gSXQgc2hvdWxkIG5vdCBwcm9wZXJseSBwcm9n
cmFtIHRoZSBwYW5lbCBieSBEQ1MgY29tbWFuZApidXQgaXQgc2hvdWxkIHRyeSB0by4KClJlc3Vs
dCBpcyB0aGUgc2FtZTogSSBjYW4gc2VlIGl0IGJlaW5nIHByb2JlZCBhbmQgY2FsbGluZyBnZXRf
bW9kZXMKYnV0IHRoZW46CgpbZHJtXSBDYW5ub3QgZmluZCBhbnkgY3J0YyBvciBzaXplcwoKQW5k
IEkgZG9uJ3Qgc2VlIGNhbGxzIHRvIC5lbmFibGUgb3IgLnByZXBhcmUgd2hlcmUgRENTIGNvbW1h
bmRzIHdvdWxkCmJlIHNlbnQuCgpCUiBhbmQgdGhhbmtzLApOaWtvbGF1cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
