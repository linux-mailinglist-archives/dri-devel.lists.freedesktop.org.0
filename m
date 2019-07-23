Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A071EBE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295089F07;
	Tue, 23 Jul 2019 18:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6688689F07
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:10:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 85BCA805CF;
 Tue, 23 Jul 2019 20:10:01 +0200 (CEST)
Date: Tue, 23 Jul 2019 20:10:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] RFT: PL111 DRM conversion of nspire
Message-ID: <20190723181000.GA24663@ravnborg.org>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723133755.22677-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=MYpsXI3zmkKylij2SYoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMuCgpPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwMzozNzo1MlBNICswMjAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IFNvIHRoaXMgaXMgYSBjb2xkLWNvZGVkIGF0dGVtcHQgdG8gbW92
ZSB0aGUgVEkgbnNwaXJlIG92ZXIgdG8KPiB1c2luZyBEUk0uIEl0IGlzIG1vcmUgb3IgbGVzcyB0
aGUgbGFzdCB1c2VyIG9mIHRoZSBvbGQgZmJkZXYKPiBkcml2ZXIgc28gaXQgaXMgYSBub2JsZSBj
YXVzZSBhbmQgaW50ZXJlc3RpbmcgdXNlY2FzZS4KCkRvIHdlIG5lZWQgdG8gc3VwcG9ydCBhcm0s
cGwxMXgsdGZ0LXIwZzBiMC1wYWRzIGJlZm9yZQp3ZSBjYW4gb2Jzb2xldGUgZmJkZXYgc3R1ZmY/
Ckp1c3QgY2hlY2tlZCBhbmQgY2Fubm90IHNlZSBpdCBpbiB1c2UgdG9kYXkuCgpMb29rZWQgdGhy
b3VnaCB0aGUgcGF0Y2hlcy4KMSBhbmQgMyBhcmU6CkFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CgpBcyBpbiAtIHRoZSBwYXRjaGVzIGxvb2tlZCBmaW5lIHRvIG1lIC0g
YnV0IEkgZG8gbm90IGtub3cgdGhlIGNvZGUgaW4gZGV0YWlsLgpCdXQgb2J2aW91c2x5IG5lZWQg
c29tZSB0ZXN0aW5nIGZlZWRiYWNrIGJlZm9yZSB0aGV5IGFyZSBhcHBsaWVkLgoKUG9zdGVkIHNv
bWUgY29tbWVudHMgb24gcGF0Y2ggMi4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
