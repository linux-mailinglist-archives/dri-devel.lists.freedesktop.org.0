Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D7211CC3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4334A6EA62;
	Thu,  2 Jul 2020 07:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Wed, 01 Jul 2020 17:25:10 UTC
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344B6E976
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:25:10 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 46F9C2014E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:17:54 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 038943ECDF;
 Wed,  1 Jul 2020 19:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 458742A0C5;
 Wed,  1 Jul 2020 13:15:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1593623712;
 bh=INLbBUm6KCC6ep5sjzH746qIHvSD5JWXu0vO2Bff8Es=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=gv9GKS/KmS0OkVtcq87f4h9GLagzFs2ykidQfYPihtuFoQgOOg9lPbbv3frwbuBcj
 g/709lyPaUOMRl/fkWRp03cR8Yj72BqIk/ByqqR9VqR5A9oOGHP+Q/j1Cn+gSZ+VBq
 m+vcsUVTt9XPLmGWQi+/93PdyiEVZi5SYoxXqqwI=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6eFw3O9W443; Wed,  1 Jul 2020 13:15:06 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Wed,  1 Jul 2020 13:15:06 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 45B6040842;
 Wed,  1 Jul 2020 17:15:04 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="pa/FN35O"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [172.19.0.1] (unknown [64.225.114.122])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6E11140842;
 Wed,  1 Jul 2020 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1593623681; bh=INLbBUm6KCC6ep5sjzH746qIHvSD5JWXu0vO2Bff8Es=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=pa/FN35Om/1LGd9F8uy1es7wSm/UHgN2AvfkQBAn9u6MJBHr5prBeY3A7+Yv5in9C
 R1XARGiF76TKknam84nUcCoLja/BgALU6z3VaVRQo4U+WFI30Wq0PW0rfNyn487tG7
 e5M0AJu4kZWb44Zb2slBWqzN6/D64FIqZEtcyYvQ=
Date: Wed, 01 Jul 2020 20:01:14 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200701103126.1512615-14-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-14-megous@megous.com>
MIME-Version: 1.0
Subject: Re: [PATCH v6 13/13] arm64: dts: sun50i-a64-pinephone: Add
 touchscreen support
To: Ondrej Jirman <megous@megous.com>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?ISO-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <78C72279-99DB-4FDE-81B3-1CF6BEF80BBF@aosc.io>
X-Rspamd-Queue-Id: 45B6040842
X-Spamd-Result: default: False [1.40 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[dt];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[aosc.io:+]; RCPT_COUNT_TWELVE(0.00)[20];
 RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
 FREEMAIL_TO(0.00)[megous.com,googlegroups.com,gmail.com,ravnborg.org,linux.ie,ffwll.ch,sigxcpu.org,puri.sm,kernel.org,csie.org,linaro.org];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Bhushan Shah <bshah@kde.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca@z3ntu.xyz>,
 Martijn Braam <martijn@brixit.nl>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDfmnIgx5pelIEdNVCswODowMCDkuIvljYg2OjMxOjI2LCBPbmRyZWogSmly
bWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4g5YaZ5YiwOgo+UGluZXBob25lIGhhcyBhIEdvb2RpeCBH
VDkxN1MgY2FwYWNpdGl2ZSB0b3VjaHNjcmVlbiBjb250cm9sbGVyIG9uCj5JMkMwIGJ1cy4gQWRk
IHN1cHBvcnQgZm9yIGl0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNA
bWVnb3VzLmNvbT4KPkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+Cj4tLS0KPiAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9uZS5kdHNp
ICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKykKPgo+ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtcGluZXBob25lLmR0c2kKPmIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWE2NC1waW5lcGhvbmUuZHRzaQo+aW5kZXggODVhN2FhNWVmZDMyLi4yZDU2OTQ0NDZkMTcg
MTAwNjQ0Cj4tLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBp
bmVwaG9uZS5kdHNpCj4rKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
YTY0LXBpbmVwaG9uZS5kdHNpCj5AQCAtMTIzLDYgKzEyMywyNSBAQCAmZWhjaTEgewo+IAlzdGF0
dXMgPSAib2theSI7Cj4gfTsKPiAKPismaTJjMCB7Cj4rCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7Cj4rCXBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsKPisJc3RhdHVzID0gIm9rYXkiOwo+Kwo+
Kwl0b3VjaHNjcmVlbkA1ZCB7Cj4rCQljb21wYXRpYmxlID0gImdvb2RpeCxndDkxN3MiLCAiZ29v
ZGl4LGd0OTExIjsKClBsZWFzZSBkcm9wIGd0OTExIGhlcmUuIEdUOTE3UyBiZWxvbmcgdG8gdGhl
IEdUMXggcHJvZHVjdCBsaW5lLCBub3QgdGhlIHNhbWUgbGluZSB3aXRoIEdUOTExLgoKWW91IHdp
bGwgc2VlIHRoaXMgaW4gdGhlIGRyaXZlci4KCj4rCQlyZWcgPSA8MHg1ZD47Cj4rCQlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZwaW8+Owo+KwkJaW50ZXJydXB0cyA9IDw3IDQgSVJRX1RZUEVfTEVWRUxf
SElHSD47IC8qIFBINCAqLwo+KwkJaXJxLWdwaW9zID0gPCZwaW8gNyA0IEdQSU9fQUNUSVZFX0hJ
R0g+OyAvKiBQSDQgKi8KPisJCXJlc2V0LWdwaW9zID0gPCZwaW8gNyAxMSBHUElPX0FDVElWRV9I
SUdIPjsgLyogUEgxMSAqLwo+KwkJQVZERDI4LXN1cHBseSA9IDwmcmVnX2xkb19pbzA+Owo+KwkJ
VkRESU8tc3VwcGx5ID0gPCZyZWdfbGRvX2lvMD47Cj4rCQl0b3VjaHNjcmVlbi1zaXplLXggPSA8
NzIwPjsKPisJCXRvdWNoc2NyZWVuLXNpemUteSA9IDwxNDQwPjsKPisJfTsKPit9Owo+Kwo+ICZp
MmMxIHsKPiAJc3RhdHVzID0gIm9rYXkiOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
