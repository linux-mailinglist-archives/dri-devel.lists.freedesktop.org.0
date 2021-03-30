Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABA34E828
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237506E8D1;
	Tue, 30 Mar 2021 13:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275E36E8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 13:00:18 +0000 (UTC)
Date: Tue, 30 Mar 2021 12:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617109216;
 bh=nQumvZO7k2adxWbuuWRUUjrAO0hDimI1WyGmzZ72k6Y=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MXEFZuKv9U1YOGPmBHoOT1TB7fu7j1AXDA20G3PQzfLp1iei5Diip2TDX2yZDLwtg
 tXfYzD/Rsk0PXApszamq4O4HVVjHSeRbSbZb6v4/Z9A9/33mIflziROwyxbT0LPDcE
 YoLZvbgqDlS8jINRANGrVJnEOa46QKDPNZOJyEUk4H8Mwg2UmIWOZZJLJ7iN2LDsbt
 BWJOuH8q4lj0Pjj7f7j3BNcFX38hU12lEXdIjcY/Jd+Zv0XTR5QlAv4CiMYbpCSsc7
 Dnfv7n4LFoe3xLAN/0JgBH2S7H95LAG42GL6pduD0lUEcmlEs8s5Lyrn7qYwYFEH+G
 R47kopOnny1nQ==
To: Paul Cercueil <paul@crapouillou.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
Message-ID: <X2G0dUjYzRbISgSRQgMfjkybzYl-AXZR8nUGHdzBk6Wi_aQFCiir_c9fmBM2fV9N9FIxYl5emBtyGrDk0AfpFx4RRNys4Grco3CKsNZsxPU=@emersion.fr>
In-Reply-To: <GC6SQQ.1R937FBY9A9A1@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net>
 <20210329175046.214629-2-paul@crapouillou.net>
 <BH3N8QICMyp64pmUQyXLwYMnCNBvXxThwvKJIOmyMU0XIgTtorcGd7s7AjnIFXQrLGEoJMuvPcWTiv38syiYOTCDv-bSxswFBX6y3UYqTwE=@emersion.fr>
 <GC6SQQ.1R937FBY9A9A1@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgTWFyY2ggMzB0aCwgMjAyMSBhdCAxOjUzIFBNLCBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+ID4gSSBkb24ndCBrbm93IGFib3V0IHRoaXMg
ZHJpdmVyIGJ1dOKApiBpcyB0aGlzIHJlYWxseSB0aGUgc2FtZSBhcyB0aGUKPiA+IHByZXZpb3Vz
Cj4gPiBjb25kaXRpb24/IFRoZSBwcmV2aW91cyBjb25kaXRpb24gd291bGQgbWF0Y2ggdHdvIHBs
YW5lcywgdGhpcyBvbmUKPiA+IHNlZW1zIHRvCj4gPiBtYXRjaCBvbmx5IGEgc2luZ2xlIHBsYW5l
LiBXaGF0IGFtIEkgbWlzc2luZz8KPgo+IFRoZXJlIGFyZSB0aHJlZSBwbGFuZXMsIHdoaWNoIHdl
IHdpbGwgY2FsbCBoZXJlIGYwLCBmMSwgYW5kIGlwdS4KPiBQcmV2aW91c2x5LCB0aGUgInBsYW5l
LT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkiIG1hdGNoZWQgZjEgYW5kCj4gaXB1LiBT
aW5jZSBpcHUgaXMgbm93IE9WRVJMQVkgd2UgaGF2ZSB0byBjaGFuZ2UgdGhlIGNvbmRpdGlvbiBv
ciB0aGUKPiBiZWhhdmlvdXIgd2lsbCBiZSBkaWZmZXJlbnQsIGFzIG90aGVyd2lzZSBpdCB3b3Vs
ZCBvbmx5IG1hdGNoIHRoZSBmMQo+IHBsYW5lLgoKT2ggb2theSwgSSB0aG91Z2h0IGYwIHdhcyBv
bmUgb2YgdGhlIHByaW1hcnkgcGxhbmVzLCBidXQgaXQncyBub3QuClRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLgoKRm9yIHRoZSB1c2VyLXNwYWNlIHZpc2libGUgY2hhbmdlOgoKQWNrZWQtYnk6
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
