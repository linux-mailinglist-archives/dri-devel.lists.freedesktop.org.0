Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B3A9DEC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69DF89F61;
	Thu,  5 Sep 2019 09:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D26089F24
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:12:01 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF56A7BDA7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:12:00 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id t8so2382991iom.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YgkTckHnd+oBCtkJ3PeDRAfoIVwhj7X9BQME1lU8Rk=;
 b=PBP5D7tQRvEgvtuX5yVkBdPGwpSD4TBQ2ADWPTJCDFc42cIkKjRolrwwEzREV28g/W
 gPkLTPmSnSFaMocaq4W/6pDBib2SAMdTGAn1cY5Ayrp7JNsfR/g1a/jbq6Cnki+3vJLw
 p5oDTjTP0WcggsQDjY5j438xwBgtVjgWTTSwkwoEWisk8/3bKkRoBkOWvwXhuQ+C2HTw
 9AXWf0CKnkpr1kbZpEXlur8QlovrkeKCM4aDOJ4Kd7u+jPa1Dx4WiRNtNE1s+PzLQZqq
 9Ts4mYVigsxvFEFC8D2k4rI6Fxo2ipmFUYNssCz27J/pLSG/Me+LkWJruXYxXkV0cKNT
 Zv6Q==
X-Gm-Message-State: APjAAAXw9Qqxc3yVPYwKbUAKNUrMd3vC5lxGWnitJv110+VUWGgKkjx4
 Rz3wEDF2eyUt9ThtOTMtvYn8YTujr0FzJVaVGJYP6BQ7VC7JAk4YThrmrL7HeuDiuD9syc+PbBf
 1ZQLvpM+TMJNlUB6A1qyT7ayvMjCHKK7Bjyddi/RZjO0F
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974899ioj.100.1567674720364; 
 Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrAdsLGhijKZkQDVkShWA1yVxV6uG4TFkYu7Bb2m8Nd+GkGxi48OkzyFxBIWpeZjPbwU+pUog6KRuQLHZzDhI=
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974868ioj.100.1567674720115; 
 Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141857.196103-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141857.196103-1-weiyongjun1@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 5 Sep 2019 11:11:49 +0200
Message-ID: <CACO55tsJt2Z-EQBpPw1=yq_jya2kJ5u5xs_xg=nhB8ZHwhjCoA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: add missing single_release()
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gVGh1LCBT
ZXAgNSwgMjAxOSBhdCA5OjE0IEFNIFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29t
PiB3cm90ZToKPgo+IFdoZW4gdXNpbmcgc2luZ2xlX29wZW4oKSBmb3Igb3BlbmluZywgc2luZ2xl
X3JlbGVhc2UoKSBzaG91bGQgYmUKPiB1c2VkLCBvdGhlcndpc2UgdGhlcmUgaXMgYSBtZW1vcnkg
bGVhay4KPgo+IFRoaXMgaXMgZGV0ZWN0ZWQgYnkgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaC4K
Pgo+IEZpeGVzOiA2ZTlmYzE3NzM5OWYgKCJkcm0vbm91dmVhdS9kZWJ1Z2ZzOiBhZGQgY29weSBv
ZiBzeXNmcyBwc3RhdGUgaW50ZXJmYWNlIHBvcnRlZCB0byBkZWJ1Z2ZzIikKPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rl
YnVnZnMuYwo+IGluZGV4IDdkZmJiYmMxYmVlYS4uMzU2OTVmNDkzMjcxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKPiBAQCAtMjAyLDYgKzIwMiw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG5vdXZlYXVfcHN0YXRlX2ZvcHMg
PSB7Cj4gICAgICAgICAub3BlbiA9IG5vdXZlYXVfZGVidWdmc19wc3RhdGVfb3BlbiwKPiAgICAg
ICAgIC5yZWFkID0gc2VxX3JlYWQsCj4gICAgICAgICAud3JpdGUgPSBub3V2ZWF1X2RlYnVnZnNf
cHN0YXRlX3NldCwKPiArICAgICAgIC5yZWxlYXNlID0gc2luZ2xlX3JlbGVhc2UsCj4gIH07Cj4K
PiAgc3RhdGljIHN0cnVjdCBkcm1faW5mb19saXN0IG5vdXZlYXVfZGVidWdmc19saXN0W10gPSB7
Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
