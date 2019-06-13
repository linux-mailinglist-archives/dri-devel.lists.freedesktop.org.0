Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08EE44AA0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF289711;
	Thu, 13 Jun 2019 18:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B38895A8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:27:52 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v186so76771oie.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MQQWIXbMnO77ZtHyX2kfFVvlpzWpGkMLz/R1+ir3QOA=;
 b=oU3/ENw8LIldvPhYDfMfgODBLL3lo6ho1Jca6PYN6f6kTlYIFJp6wyaPPOaWZh03SJ
 rKxwTcQVVmuFjMX95I6kZRlD2/ZqwE4u+CSBc+iTvjTy5MSBCeJaE6Nt16atnJdDduC+
 i9ZGD5a1FwNTHycS1dyS64F90ngAiRmUKnGbjIQIx6MkJOUenrwf93GYjhDQ7rCSVzsL
 I2weI9N4kPGwEvfbuvyBlF+D4co8m8/3Qnl6DNpVDKE/FpeDrHbC1bmpqNipCrNySmun
 Ks1E0zausKSFku8SBX2vDDX0UAO9Ym5Ie78zRbuMFQ8ksq+uOCnpXo3299YKzXXn1ooo
 Vgjg==
X-Gm-Message-State: APjAAAX6Gxhulw7ZnoPN+Y2TTekhEEy8/lXSE+93dIqkAdeglPJxyYJV
 pwjSyw5NqIpS8v4aWQuYbkdkUw2qOzArGnpjWpbA6A==
X-Google-Smtp-Source: APXvYqwS3UGoJsEHP8JK1xPznND3LFKZmK0TBwbTuAL+csM43V1iR6xbM76Rxv8Te4jLIHldpTP2/DzDl/DDdZFYcCo=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr4031867oii.0.1560450471426;
 Thu, 13 Jun 2019 11:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
In-Reply-To: <20190613094326.24093-1-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 11:27:39 -0700
Message-ID: <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
Subject: Re: dev_pagemap related cleanups
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MQQWIXbMnO77ZtHyX2kfFVvlpzWpGkMLz/R1+ir3QOA=;
 b=crvCEGgkqd+iu3jPAVCgc0rO9kwagRqhiuh9lqc2Ju8CbgOGid+cpJ19wpMCBIaSji
 U8Mz0dX1Um88VCqaKkUNTGuID9Bzc63KYSiIdoNpp/7dpBf8k6fFGIdSQ7ELDhxa2lhq
 O+Cm1rdZssbK5qGXuJrRKvIFe20o9RjF63pnvwmTOEXNE3m0kL4mYXXHPHnWB7iNGKvf
 IRmvCqhPr54CoqyHGAWbyFjtaCU9quXmW4KMHVoz5mhnnS/xbbV6lznIglpAz1QTbisQ
 VH8TIrLDYodoKV2w14PaLsUgipHZwL/KVe25acJc00UDmNqVKP+RWr4Mjo9Lxw4wybxj
 3jlw==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMjo0MyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBIaSBEYW4sIErDqXLDtG1lIGFuZCBKYXNvbiwKPgo+IGJlbG93IGlz
IGEgc2VyaWVzIHRoYXQgY2xlYW5zIHVwIHRoZSBkZXZfcGFnZW1hcCBpbnRlcmZhY2Ugc28gdGhh
dAo+IGl0IGlzIG1vcmUgZWFzaWx5IHVzYWJsZSwgd2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3
cmFwIGl0IGluIGhtbQo+IGFuZCB0aHVzIGFsbG93aW5nIHRvIGtpbGwgYSBsb3Qgb2YgY29kZQo+
Cj4gRGlmZnN0YXQ6Cj4KPiAgMjIgZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKyksIDgw
MiBkZWxldGlvbnMoLSkKCkhvb3JheSEKCj4gR2l0IHRyZWU6Cj4KPiAgICAgZ2l0Oi8vZ2l0Lmlu
ZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGhtbS1kZXZtZW0tY2xlYW51cAoKSSBqdXN0
IHJlYWxpemVkIHRoaXMgY29sbGlkZXMgd2l0aCB0aGUgZGV2X3BhZ2VtYXAgcmVsZWFzZSByZXdv
cmsgaW4KQW5kcmV3J3MgdHJlZSAoY29tbWl0IGlkcyBiZWxvdyBhcmUgZnJvbSBuZXh0LmdpdCBh
bmQgYXJlIG5vdCBzdGFibGUpCgo0NDIyZWU4NDc2ZjAgbW0vZGV2bV9tZW1yZW1hcF9wYWdlczog
Zml4IGZpbmFsIHBhZ2UgcHV0IHJhY2UKNzcxZjA3MTRkMGRjIFBDSS9QMlBETUE6IHRyYWNrIHBn
bWFwIHJlZmVyZW5jZXMgcGVyIHJlc291cmNlLCBub3QgZ2xvYmFsbHkKYWYzNzA4NWRlOTA2IGxp
Yi9nZW5hbGxvYzogaW50cm9kdWNlIGNodW5rIG93bmVycwplMDA0N2ZmOGFhNzcgUENJL1AyUERN
QTogZml4IHRoZSBnZW5fcG9vbF9hZGRfdmlydCgpIGZhaWx1cmUgcGF0aAowMzE1ZDQ3ZDZhZTkg
bW0vZGV2bV9tZW1yZW1hcF9wYWdlczogaW50cm9kdWNlIGRldm1fbWVtdW5tYXBfcGFnZXMKMjE2
NDc1YzdlYWE4IGRyaXZlcnMvYmFzZS9kZXZyZXM6IGludHJvZHVjZSBkZXZtX3JlbGVhc2VfYWN0
aW9uKCkKCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gdG9vbHMvdGVzdGlu
Zy9udmRpbW0vdGVzdC9pb21hcC5jCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3Qg
aW4gbW0vaG1tLmMKQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBrZXJuZWwv
bWVtcmVtYXAuYwpDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGluY2x1ZGUv
bGludXgvbWVtcmVtYXAuaApDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRy
aXZlcnMvcGNpL3AycGRtYS5jCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4g
ZHJpdmVycy9udmRpbW0vcG1lbS5jCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3Qg
aW4gZHJpdmVycy9kYXgvZGV2aWNlLmMKQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGlj
dCBpbiBkcml2ZXJzL2RheC9kYXgtcHJpdmF0ZS5oCgpQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRo
b3NlIG91dCBhbmQgcmVzZW5kIHRoZW0gdGhyb3VnaCBobW0uZ2l0PwoKSXQgYWxzbyB0dXJucyBv
dXQgdGhlIG52ZGltbSB1bml0IHRlc3RzIGNyYXNoIHdpdGggdGhpcyBzaWduYXR1cmUgb24KdGhh
dCBicmFuY2ggd2hlcmUgYmFzZSB2NS4yLXJjMyBwYXNzZXM6CgogICAgQlVHOiBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDA4CiAgICBbLi5d
CiAgICBDUFU6IDE1IFBJRDogMTQxNCBDb21tOiBsdC1saWJuZGN0bCBUYWludGVkOiBHICAgICAg
ICAgICBPRQo1LjIuMC1yYzMrICMzMzk5CiAgICBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAwLjAuMCAwMi8wNi8yMDE1CiAgICBSSVA6
IDAwMTA6cGVyY3B1X3JlZl9raWxsX2FuZF9jb25maXJtKzB4MWUvMHgxODAKICAgIFsuLl0KICAg
IENhbGwgVHJhY2U6CiAgICAgcmVsZWFzZV9ub2RlcysweDIzNC8weDI4MAogICAgIGRldmljZV9y
ZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweGU4LzB4MWIwCiAgICAgYnVzX3JlbW92ZV9kZXZpY2Ur
MHhmMi8weDE2MAogICAgIGRldmljZV9kZWwrMHgxNjYvMHgzNzAKICAgICB1bnJlZ2lzdGVyX2Rl
dl9kYXgrMHgyMy8weDUwCiAgICAgcmVsZWFzZV9ub2RlcysweDIzNC8weDI4MAogICAgIGRldmlj
ZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweGU4LzB4MWIwCiAgICAgdW5iaW5kX3N0b3JlKzB4
OTQvMHgxMjAKICAgICBrZXJuZnNfZm9wX3dyaXRlKzB4ZjAvMHgxYTAKICAgICB2ZnNfd3JpdGUr
MHhiNy8weDFiMAogICAgIGtzeXNfd3JpdGUrMHg1Yy8weGQwCiAgICAgZG9fc3lzY2FsbF82NCsw
eDYwLzB4MjQwCgpUaGUgY3Jhc2ggYmlzZWN0cyB0bzoKCiAgICBkOGNjOGJiZTEwOGMgZGV2aWNl
LWRheDogdXNlIHRoZSBkZXZfcGFnZW1hcCBpbnRlcm5hbCByZWZjb3VudApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
