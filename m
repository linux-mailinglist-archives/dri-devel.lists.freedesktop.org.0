Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC7C1BD4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB66E391;
	Mon, 30 Sep 2019 06:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2400 seconds by postgrey-1.36 at gabe;
 Mon, 30 Sep 2019 04:27:06 UTC
Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn
 [202.108.3.18])
 by gabe.freedesktop.org (Postfix) with SMTP id 5E1666E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:27:06 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D91760500035418; Mon, 30 Sep 2019 11:27:04 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 32062515076443
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 1/5] dma-buf: Add dma-buf heaps framework
Date: Mon, 30 Sep 2019 11:26:51 +0800
Message-Id: <20190930032651.8264-1-hdanton@sina.com>
In-Reply-To: <20190906184712.91980-1-john.stultz@linaro.org>
References: 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Sep 2019 06:57:28 +0000
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
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgIDYgU2VwIDIwMTkgMTg6NDc6MDggKzAwMDAgSm9obiBTdHVsdHogd3JvdGU6Cj4g
Ky8qKgo+ICsgKiBkbWFfaGVhcF9nZXRfZGF0YSgpIC0gZ2V0IHBlci1oZWFwIGRyaXZlciBkYXRh
Cj4gKyAqIEBoZWFwOiBETUEtSGVhcCB0byByZXRyaWV2ZSBwcml2YXRlIGRhdGEgZm9yCj4gKyAq
Cj4gKyAqIFJldHVybnM6Cj4gKyAqIFRoZSBwZXItaGVhcCBkYXRhIGZvciB0aGUgaGVhcC4KPiAr
ICovCj4gK3ZvaWQgKmRtYV9oZWFwX2dldF9kYXRhKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCk7Cj4g
KwoKSXQgd2lsbCBoZWxwIHJlYWRlcnMgbW9yZSB0aGFuIHRob3VnaHQgdW5kZXJzdGFuZCB0aGlz
IGZyYW1ld29yawppZiBzL2dldF9kYXRhL2dldF9kcnZkYXRhLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
