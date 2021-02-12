Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01931A034
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 15:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE976E5BB;
	Fri, 12 Feb 2021 14:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 776D86E10B;
 Fri, 12 Feb 2021 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4FFAD2A6045;
 Fri, 12 Feb 2021 15:01:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vkV0bfZJWGJB; Fri, 12 Feb 2021 15:01:23 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 622122A6042;
 Fri, 12 Feb 2021 15:01:21 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lAZ0b-000BpT-Bs; Fri, 12 Feb 2021 15:01:21 +0100
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
 <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v3] kcmp: Support selection of SYS_kcmp without
 CHECKPOINT_RESTORE
Message-ID: <3a2316b6-27a9-d56a-b488-ac15a402a0d2@daenzer.net>
Date: Fri, 12 Feb 2021 15:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 "# 3.13+" <stable@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0xMiAxOjU3IHAubS4sIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiBGcmksIDUg
RmViIDIwMjEgYXQgMjI6MDEsIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PiB3cm90ZToKPj4KPj4gVXNlcnNwYWNlIGhhcyBkaXNjb3ZlcmVkIHRoZSBmdW5jdGlvbmFsaXR5
IG9mZmVyZWQgYnkgU1lTX2tjbXAgYW5kIGhhcwo+PiBzdGFydGVkIHRvIGRlcGVuZCB1cG9uIGl0
LiBJbiBwYXJ0aWN1bGFyLCBNZXNhIHVzZXMgU1lTX2tjbXAgZm9yCj4+IG9zX3NhbWVfZmlsZV9k
ZXNjcmlwdGlvbigpIGluIG9yZGVyIHRvIGlkZW50aWZ5IHdoZW4gdHdvIGZkIChlLmcuIGRldmlj
ZQo+PiBvciBkbWFidWYpCj4gCj4gQXMgeW91IHJpZ2h0ZnVsbHkgcG9pbnQgb3V0LCBTWVNfa2Nt
cCBpcyBhIGJpdCBvZiBhIHR3byBlZGdlZCBzd29yZC4KPiBXaGlsZSB5b3UgbWVudGlvbiB0aGUg
Q09ORklHIGlzc3VlLCB0aGVyZSBpcyBhbHNvIGEgcG9ydGFiaWxpdHkgYXNwZWN0Cj4gKG1lc2Eg
cnVucyBvbiBtb3JlIHRoYW4ganVzdCBsaW51eCkgYW5kIGFzIHdlbGwgYXMgc2FuZGJveCBmaWx0
ZXJpbmcKPiBvZiB0aGUgZXh0cmEgc3lzY2FsbC4KPiAKPiBMYXN0IHRpbWUgSSBsb29rZWQsIHRo
ZSBsYXR0ZXIgd2FzIHN0aWxsIGFuIGlzc3VlIGFuZCBtZXNhIHdhcyB1c2luZwo+IFNZU19rY21w
IHRvIGNvbXBhcmUgZGV2aWNlIG5vZGUgZmRzLgo+IEEgZmFyIHNob3J0ZXIgYW5kIG1vcmUgcG9y
dGFibGUgc29sdXRpb24gaXMgcG9zc2libGUsIHNvIGxldCBtZQo+IHByZXBhcmUgYSBNZXNhIHBh
dGNoLgoKTWFrZSBzdXJlIHRvIHJlYWQgbXkgY29tbWVudHMgb24gCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy82ODgxIGZpcnN0LiA6KQoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
