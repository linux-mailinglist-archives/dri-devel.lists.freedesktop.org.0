Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DDC238A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DED06E457;
	Mon, 30 Sep 2019 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn
 [202.108.3.21])
 by gabe.freedesktop.org (Postfix) with SMTP id 39EBC89C56
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:03:49 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D91B2300000D17E; Mon, 30 Sep 2019 15:43:47 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 561201628871
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
Date: Mon, 30 Sep 2019 15:43:35 +0800
Message-Id: <20190930074335.6636-1-hdanton@sina.com>
In-Reply-To: <20190906184712.91980-1-john.stultz@linaro.org>
References: 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgIDYgU2VwIDIwMTkgMTg6NDc6MDkgKzAwMDAgSm9obiBTdHVsdHogd3JvdGU6Cj4g
Cj4gK3N0YXRpYyBpbnQgc3lzdGVtX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFw
LAo+ICsJCQkJdW5zaWduZWQgbG9uZyBsZW4sCj4gKwkJCQl1bnNpZ25lZCBsb25nIGZkX2ZsYWdz
LAo+ICsJCQkJdW5zaWduZWQgbG9uZyBoZWFwX2ZsYWdzKQo+ICt7Cj4gKwlzdHJ1Y3QgaGVhcF9o
ZWxwZXJfYnVmZmVyICpoZWxwZXJfYnVmZmVyOwo+ICsJc3RydWN0IGRtYV9idWYgKmRtYWJ1ZjsK
PiArCWludCByZXQgPSAtRU5PTUVNOwo+ICsJcGdvZmZfdCBwZzsKPiArCj4gKwloZWxwZXJfYnVm
ZmVyID0ga3phbGxvYyhzaXplb2YoKmhlbHBlcl9idWZmZXIpLCBHRlBfS0VSTkVMKTsKPiArCWlm
ICghaGVscGVyX2J1ZmZlcikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlpbml0X2hlYXBf
aGVscGVyX2J1ZmZlcihoZWxwZXJfYnVmZmVyLCBzeXN0ZW1faGVhcF9mcmVlKTsKPiArCWhlbHBl
cl9idWZmZXItPmZsYWdzID0gaGVhcF9mbGFnczsKPiArCWhlbHBlcl9idWZmZXItPmhlYXAgPSBo
ZWFwOwo+ICsJaGVscGVyX2J1ZmZlci0+c2l6ZSA9IGxlbjsKPiArCkEgY291cGxlIG9mIGxpbmVz
IGxvb2tzIG5lZWRlZCB0byBoYW5kbGUgbGVuIGlmIGl0IGlzIG5vdApQQUdFX1NJWkUgYWxpZ25l
ZC4KCj4gKwloZWxwZXJfYnVmZmVyLT5wYWdlY291bnQgPSBsZW4gLyBQQUdFX1NJWkU7Cj4gKwlo
ZWxwZXJfYnVmZmVyLT5wYWdlcyA9IGttYWxsb2NfYXJyYXkoaGVscGVyX2J1ZmZlci0+cGFnZWNv
dW50LAo+ICsJCQkJCSAgICAgc2l6ZW9mKCpoZWxwZXJfYnVmZmVyLT5wYWdlcyksCj4gKwkJCQkJ
ICAgICBHRlBfS0VSTkVMKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
