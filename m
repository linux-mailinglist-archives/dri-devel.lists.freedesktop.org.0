Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ED2F1DCF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 19:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47189DA9;
	Mon, 11 Jan 2021 18:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAC189DA9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 18:18:25 +0000 (UTC)
Date: Mon, 11 Jan 2021 18:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1610389102;
 bh=1Ho/2THUoZgVetup5vR7UNEBKjRym/Cb6UIwtgZrjng=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=ZML5cQvS43XQrEVa799v+hM5X6M9Zkf5imA0tk+vMv14wm0ZOzPEPinB/bzNEQovs
 tOG0gfG4qLix6jVl4HZq/smPcuhIaZhdKOIWjqAsyxxazKFs7hmRgmqEAnA8uAUltc
 444TJegRC3AVBSlyf41oLm/FXKLBC56mFIZssNnqFxiX+bQIJB3o9h5r70jC3ZoxBG
 ++N8wH4ei21AqWsaiHbDwoEUBCcFcQrVCkxG1JqCLBwzgTXaUdTt1H5peBuL+9ZNy1
 TXnMK/Zi3jS4p2au6IDcrZo4OVBdN9EBZiEIZO8iBblTW6shT207dxoVXdrZJulvDt
 ZaHbohKzun8yw==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.104
Message-ID: <ujcL5wh5uX2AA-w-lc6jY2Upcmrti3EczbkIsvULmHsulL1QsHxzilVvLyzRPScNcFC0sgYdO4CczQShNkTLKNB8ieYrOwXqmf8Ifiv707k=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZWxlYXNlIGJyaW5ncyB1cGRhdGVkIGtlcm5lbCBoZWFkZXJzIGFuZCBjb252ZXJ0cyBt
YW4gcGFnZXMgdG8KcmVTdHJ1Y3R1cmVkVGV4dC4KCkFudG9uaW4gRMOpY2ltbyAoMSk6CiAgICAg
IGhlYWRlcnM6IGRybTogU3luYyB3aXRoIGRybS1uZXh0CgpFbW1hbnVlbCBWYWRvdCAoMSk6CiAg
ICAgIHRlc3RzL2FtZGdwdTogRml4IG9uIEZyZWVCU0QKCkx1YmVuIFR1aWtvdiAoMSk6CiAgICAg
IHRlc3RzL2FtZGdwdTogRml4IGEgdHlwbwoKTHVib21pciBSaW50ZWwgKDMpOgogICAgICB0ZXN0
cy9ldG5hdml2XzJkX3Rlc3Q6IGV4cGxhaW4gdGhlIGVycm9ycwogICAgICB0ZXN0cy9ldG5hdml2
XzJkX3Rlc3Q6IHBpY2sgdGhlIDJEIGNvcmUKICAgICAgdGVzdHMvZXRuYXZpdl8yZF90ZXN0OiBj
aGVjayB3aGV0aGVyIHRoZSByZW5kZXJpbmcgaXMgY29ycmVjdAoKTmljb2xhcyBDYXJhbWVsbGkg
KDEpOgogICAgICB0ZXN0cy9tb2RldGVzdDogcmVtb3ZlIGJyYWNrZXQgaW4gZHVtcF9jb25uZWN0
b3JzKCkKClNpbW9uIFNlciAoNik6CiAgICAgIG1hbjogY29udmVydCB0byByZVN0cnVjdHVyZWRU
ZXh0CiAgICAgIERvY3VtZW50IGRybU1vZGVDb25uZWN0aW9uCiAgICAgIHhmODZkcm1Nb2RlLmg6
IHVzZSBBTlNJIEM5OSBhcnJheXMKICAgICAgUmVtb3ZlIGRlZmluaXRpb25zIGR1cGxpY2F0ZWQg
ZnJvbSBkcm1fbW9kZS5oCiAgICAgIFJlbW92ZSBvdXRkYXRlZCBjb21tZW50cyBhYm91dCBzdGRp
bnQuaAogICAgICBCdW1wIHZlcnNpb24gdG8gMi40LjEwNAoKVGhvbmcgVGhhaSAoMSk6CiAgICAg
IHRlc3RzL2FtZGdwdS92Y246IHVwZGF0ZSB0byBub3QgdXNlIGFzaWNfaWQgZm9yIFJlbm9pcgoK
Z2l0IHRhZzogbGliZHJtLTIuNC4xMDQKCmh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9saWJk
cm0vbGliZHJtLTIuNC4xMDQudGFyLnh6ClNIQTI1NjogZDY2YWQ4YjVjMjQ0MTAxNWFjMTMzM2U0
MDEzN2JiODAzYzNiZGUzNjEyZmYwNDAyODZmY2MxMjE1OGVhMWJjYiAgbGliZHJtLTIuNC4xMDQu
dGFyLnh6ClNIQTUxMjogMGZkYmVmNTNlMGU3YzQ0MWM4MDVjOTVhYzU1Y2EyYzk0ZjExZThmYTE4
ZTM2YjRkYzc1MzRjMjJlMmI1YmM4ZWNhNzI4M2ZkZjQxNzg1ZGE3NTNmOThkMGI1ODkwMjMxMTFh
YmRiYTcwZGI3ZTc5ODM3NzI5YjE1NDAyNTNkNmUgIGxpYmRybS0yLjQuMTA0LnRhci54egpQR1A6
ICBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvbGliZHJtL2xpYmRybS0yLjQuMTA0LnRhci54
ei5zaWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
