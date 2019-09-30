Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE72C238B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51EC6E45C;
	Mon, 30 Sep 2019 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2401 seconds by postgrey-1.36 at gabe;
 Mon, 30 Sep 2019 08:54:48 UTC
Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn
 [202.108.3.17])
 by gabe.freedesktop.org (Postfix) with SMTP id 2280F88161
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:54:47 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D91B97400005910; Mon, 30 Sep 2019 16:14:46 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 13482549284853
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 4/5] dma-buf: heaps: Add CMA heap to dmabuf
 heaps
Date: Mon, 30 Sep 2019 16:14:34 +0800
Message-Id: <20190930081434.248-1-hdanton@sina.com>
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
Cj4gKwljbWFfcGFnZXMgPSBjbWFfYWxsb2MoY21hX2hlYXAtPmNtYSwgbnJfcGFnZXMsIGFsaWdu
LCBmYWxzZSk7Cj4gKwlpZiAoIWNtYV9wYWdlcykKPiArCQlnb3RvIGZyZWVfYnVmOwo+ICsKPiAr
CWlmIChQYWdlSGlnaE1lbShjbWFfcGFnZXMpKSB7Cj4gKwkJdW5zaWduZWQgbG9uZyBucl9jbGVh
cl9wYWdlcyA9IG5yX3BhZ2VzOwo+ICsJCXN0cnVjdCBwYWdlICpwYWdlID0gY21hX3BhZ2VzOwo+
ICsKPiArCQl3aGlsZSAobnJfY2xlYXJfcGFnZXMgPiAwKSB7Cj4gKwkJCXZvaWQgKnZhZGRyID0g
a21hcF9hdG9taWMocGFnZSk7Cj4gKwo+ICsJCQltZW1zZXQodmFkZHIsIDAsIFBBR0VfU0laRSk7
Cj4gKwkJCWt1bm1hcF9hdG9taWModmFkZHIpOwo+ICsJCQlwYWdlKys7Cj4gKwkJCW5yX2NsZWFy
X3BhZ2VzLS07Cj4gKwkJfQo+ICsJfSBlbHNlIHsKPiArCQltZW1zZXQocGFnZV9hZGRyZXNzKGNt
YV9wYWdlcyksIDAsIHNpemUpOwo+ICsJfQoKVGFrZSBhIGJyZWF0aCBhZnRlciB6ZXJvaW5nIGEg
cGFnZSwgYW5kIGEgcGVlcCBhdCBwZW5kaW5nIHNpZ25hbC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
