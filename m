Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971E2CD11A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA986E096;
	Thu,  3 Dec 2020 08:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E2806E096
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 08:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7929A2A604A;
 Thu,  3 Dec 2020 09:18:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 41Up1d6dwEBX; Thu,  3 Dec 2020 09:18:53 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 422482A6016;
 Thu,  3 Dec 2020 09:18:53 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kkjpE-0025dI-RE; Thu, 03 Dec 2020 09:18:52 +0100
To: James Park <james.park@lagfreegames.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
Date: Thu, 3 Dec 2020 09:18:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
Content-Language: en-CA
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0wMiA4OjQ3IHAubS4sIEphbWVzIFBhcmsgd3JvdGU6Cj4gCj4gSWYgd2UncmUg
dHJ5aW5nIHRvIGN1dCB0aWVzIHdpdGggdGhlIGRybS11YXBpIGZvbGRlciBlbnRpcmVseSwgdGhl
IHN0dWZmIAo+IGFjX3N1cmZhY2UuYyBuZWVkIGluY2x1ZGVzIHRoZSBBTURfRk1UX01PRCBzdHVm
ZiBpbiBkcm1fZm91cmNjLmgsIAo+IGFuZMKgQU1ER1BVX1RJTElOR18qIHVuZGVyIGFtZGdwdV9k
cm0uaC4gSXMgdGhlcmUgYSBiZXR0ZXIgc3BvdCBmb3IgdGhlc2UgCj4gZGVmaW5pdGlvbnM/CgpU
aGUgTWVzYSBzcmMvYW1kLyBjb2RlIHNob3VsZCB1c2UgcGxhdGZvcm0tbmV1dHJhbCBhYnN0cmFj
dGlvbnMgZm9yIAp0aGVzZS4gVGhpcyB3YXNuJ3QgZGVlbWVkIG5lY2Vzc2FyeSBiZWZvcmUsIGJl
Y2F1c2Ugbm9ib2R5IHdhcyB0cnlpbmcgdG8gCmJ1aWxkIHRoZXNlIGRyaXZlcnMgZm9yIG5vbi1V
TklYIE9TZXMuIEJ1dCBub3cgeW91IGFyZS4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVy
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBz
b2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBk
ZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
