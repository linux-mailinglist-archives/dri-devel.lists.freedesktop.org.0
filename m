Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1309E2CE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7C89428;
	Tue, 27 Aug 2019 08:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEE489428
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:36:49 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e12so17898877otp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gy8QSlZb4lT6kTyFQW393XSRIZRR//dSxSXR0M5umDw=;
 b=fWSTCdYNL3FEf5ef/xtdIspkKHF111L1rMfS7KLRyfeOVMSAW1rtBB/OeaFjXooCjb
 B/Ep8soIeJy/jt2Sg+HZ+s6JJrAjZEyZ6kx3Pa7S1/gHKoa3GwFPV4AEBOExhCy9NIMV
 WEK5gASz1vUC49XQQwtJLcWIoF9vMc+/BoRlPebTYoNeY8J0m6XvJYddjSacBqNFOaSR
 4ZymIJYcshnuC6rGOFcePW6BFOzhBG7bk7ipt0sLV9qwN3mnutqDwK6S7K+6zGbiLxZw
 qfrkdEYjhMaq9EpLkf6gEfFEd+uUeNKmK0YdaaRHGVVgdWjHOI9RyZmGixXor+YNPXjq
 nFvA==
X-Gm-Message-State: APjAAAUE5/rPwapUxSnMoSvSW0LuPE6V0AwoRxQEI50xJmTdZ97QQ6T1
 EVNIq4eZxD8e44P5fQdWMwpmnqu6zC0Dzie0mlQ=
X-Google-Smtp-Source: APXvYqwqr+4C8z0AckmhxVmMT1WH0NiPgJPn7BzlKjPtLP4Os4b98pJGuuNkYsXNVKyLkpOOnfzy1tcfnDVwRgf1Xao=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr15907270otl.145.1566895009070; 
 Tue, 27 Aug 2019 01:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190826195740.29415-1-peda@axentia.se>
 <20190826195740.29415-3-peda@axentia.se>
In-Reply-To: <20190826195740.29415-3-peda@axentia.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 10:36:38 +0200
Message-ID: <CAMuHMdVx77aOyUVhZ2_N76VAP+AJ3X8w-gdHLjnjUEeRKcZmOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] fbdev: fbmem: allow overriding the number of
 bootup logos
To: Peter Rosin <peda@axentia.se>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsCgpPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAxMDo0NiBQTSBQZXRlciBSb3NpbiA8
cGVkYUBheGVudGlhLnNlPiB3cm90ZToKPiBQcm9iYWJseSBtb3N0IHVzZWZ1bCBpZiB5b3Ugb25s
eSB3YW50IG9uZSBsb2dvIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkKPiBDUFUgY29yZXMgeW91IGhh
dmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgoKVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0Cj4gQEAgLTE3NCw2ICsxNzQsMTEgQEAg
Qy4gQm9vdCBvcHRpb25zCj4gICAgICAgICBkaXNwbGF5ZWQgZHVlIHRvIG11bHRpcGxlIENQVXMs
IHRoZSBjb2xsZWN0ZWQgbGluZSBvZiBsb2dvcyBpcyBtb3ZlZAo+ICAgICAgICAgYXMgYSB3aG9s
ZS4KPgo+ICs5LiBmYmNvbj1sb2dvLWNvdW50OjxuPgo+ICsKPiArICAgICAgIFRoZSB2YWx1ZSAn
bicgb3ZlcnJpZGVzIHRoZSBudW1iZXIgb2YgYm9vdHVwIGxvZ29zLiBaZXJvIGdpdmVzIHRoZQo+
ICsgICAgICAgZGVmYXVsdCwgd2hpY2ggaXMgdGhlIG51bWJlciBvZiBvbmxpbmUgY3B1cy4KCklz
bid0IHRoYXQgYSBiaXQgdW5leHBlY3RlZCBmb3IgdGhlIHVzZXI/CldoYXQgYWJvdXQgbWFraW5n
IC0xIHRoZSBkZWZhdWx0IChhdXRvKSwgYW5kIHplcm8gbWVhbmluZyBubyBsb2dvcz8KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
