Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC08D44D4F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5457F8929C;
	Thu, 13 Jun 2019 20:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21808926A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:21:38 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id i8so419638oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8C1DPfN32M3hy89DclQbm10r/6nHw68ntXJVKpP7b9Y=;
 b=BMKJdL/cOmDs4SveHnCsGhFb1pHOxH84TXU6HyahFs/eo0aoSOlbq8ZhiMPLC309bs
 rmWm0y3rL7QGv6+ufDePRCT1DE2PdruYIcnQW0kVMffOlTgzAVanh0pi4nwAHOtELKTR
 vMvFpDSVPXtkZqfaJlOXZeOJZLBnYy6u65HT5cZ0pbNz/idmV53RmyZat0sS2Z2WXZW/
 kr7uwB08ZqSUkPcoSJbmp6xmTSo5NqA74/kXkejupp5mAb5+EoUljufhB/Rue/lpo06l
 IbDI+zLMl+spvBog136WjTEJtmk1pbCBbBtyrn9BLhZqII+TMP0ACeiOjtpl2JP8ynKp
 KtTw==
X-Gm-Message-State: APjAAAXgFQfUeKrA/wqmsVHZvmN8+FGBWP9FYFS4kuEcOzPy4vmFuMGu
 odjOhzdv7cyRwH2tCEgWbq30VgyoGemnYpNwOJumew==
X-Google-Smtp-Source: APXvYqyjtP3QbVJvzI3dCCMhA8qeDJqydQ8D7TK+PF2b5eiWZzF3IhMkwvK4lONxsyfmaoM/M+8Dcj6PJdtpVy6CFmg=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr1406727otk.363.1560457298006; 
 Thu, 13 Jun 2019 13:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
In-Reply-To: <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 13:21:27 -0700
Message-ID: <CAPcyv4hx=ng3SxzAWd8s_8VtAfoiiWhiA5kodi9KPc=jGmnejg@mail.gmail.com>
Subject: Re: dev_pagemap related cleanups
To: Logan Gunthorpe <logang@deltatee.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8C1DPfN32M3hy89DclQbm10r/6nHw68ntXJVKpP7b9Y=;
 b=f8QwnyQT51rXgqH07uWM2kqXhbWRJNnV74LW/yRvR2x776SPj5Pfk2O+kG2AmGkO8T
 trYSPptgpa5/GXF/WDtITF1+EbHojK5NlrUWtkmk/zSrRfZi5l9VktyZN13ffa5Hc6Ev
 0msFAvfYWphm24CFoDY7wyxaucG4FVHRbGTisLD6oBUXsztdH3fUW9TN5VMHOpT3cvr0
 sCPmY0lNjqi+LcWw5XMhpewNnmhVYTSePA2WSDRkeUne9k6nQVV9YwwkLBcNkm4aAYQp
 hwiX33VeD0WOTvpFOoQcm71sdbaOX7SnxHZ9aM2nx+Itu4NnNsqFxSwSt5OwJVwaJq25
 COoQ==
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
 linux-pci@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMToxOCBQTSBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0Bk
ZWx0YXRlZS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMTktMDYtMTMgMTI6MjcgcC5tLiwgRGFu
IFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMjo0MyBBTSBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBEYW4sIErDqXLD
tG1lIGFuZCBKYXNvbiwKPiA+Pgo+ID4+IGJlbG93IGlzIGEgc2VyaWVzIHRoYXQgY2xlYW5zIHVw
IHRoZSBkZXZfcGFnZW1hcCBpbnRlcmZhY2Ugc28gdGhhdAo+ID4+IGl0IGlzIG1vcmUgZWFzaWx5
IHVzYWJsZSwgd2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3cmFwIGl0IGluIGhtbQo+ID4+IGFu
ZCB0aHVzIGFsbG93aW5nIHRvIGtpbGwgYSBsb3Qgb2YgY29kZQo+ID4+Cj4gPj4gRGlmZnN0YXQ6
Cj4gPj4KPiA+PiAgMjIgZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKyksIDgwMiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBIb29yYXkhCj4gPgo+ID4+IEdpdCB0cmVlOgo+ID4+Cj4gPj4gICAg
IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBobW0tZGV2bWVtLWNs
ZWFudXAKPiA+Cj4gPiBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBjb2xsaWRlcyB3aXRoIHRoZSBkZXZf
cGFnZW1hcCByZWxlYXNlIHJld29yayBpbgo+ID4gQW5kcmV3J3MgdHJlZSAoY29tbWl0IGlkcyBi
ZWxvdyBhcmUgZnJvbSBuZXh0LmdpdCBhbmQgYXJlIG5vdCBzdGFibGUpCj4gPgo+ID4gNDQyMmVl
ODQ3NmYwIG1tL2Rldm1fbWVtcmVtYXBfcGFnZXM6IGZpeCBmaW5hbCBwYWdlIHB1dCByYWNlCj4g
PiA3NzFmMDcxNGQwZGMgUENJL1AyUERNQTogdHJhY2sgcGdtYXAgcmVmZXJlbmNlcyBwZXIgcmVz
b3VyY2UsIG5vdCBnbG9iYWxseQo+ID4gYWYzNzA4NWRlOTA2IGxpYi9nZW5hbGxvYzogaW50cm9k
dWNlIGNodW5rIG93bmVycwo+ID4gZTAwNDdmZjhhYTc3IFBDSS9QMlBETUE6IGZpeCB0aGUgZ2Vu
X3Bvb2xfYWRkX3ZpcnQoKSBmYWlsdXJlIHBhdGgKPiA+IDAzMTVkNDdkNmFlOSBtbS9kZXZtX21l
bXJlbWFwX3BhZ2VzOiBpbnRyb2R1Y2UgZGV2bV9tZW11bm1hcF9wYWdlcwo+ID4gMjE2NDc1Yzdl
YWE4IGRyaXZlcnMvYmFzZS9kZXZyZXM6IGludHJvZHVjZSBkZXZtX3JlbGVhc2VfYWN0aW9uKCkK
PiA+Cj4gPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIHRvb2xzL3Rlc3Rp
bmcvbnZkaW1tL3Rlc3QvaW9tYXAuYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25m
bGljdCBpbiBtbS9obW0uYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBp
biBrZXJuZWwvbWVtcmVtYXAuYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGlj
dCBpbiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKPiA+IENPTkZMSUNUIChjb250ZW50KTogTWVy
Z2UgY29uZmxpY3QgaW4gZHJpdmVycy9wY2kvcDJwZG1hLmMKPiA+IENPTkZMSUNUIChjb250ZW50
KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9udmRpbW0vcG1lbS5jCj4gPiBDT05GTElDVCAo
Y29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvZGF4L2RldmljZS5jCj4gPiBDT05G
TElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvZGF4L2RheC1wcml2YXRl
LmgKPiA+Cj4gPiBQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRob3NlIG91dCBhbmQgcmVzZW5kIHRo
ZW0gdGhyb3VnaCBobW0uZ2l0Pwo+Cj4gSG1tLCBJJ3ZlIGJlZW4gd2FpdGluZyBmb3IgdGhvc2Ug
cGF0Y2hlcyB0byBnZXQgaW4gZm9yIGEgbGl0dGxlIHdoaWxlIG5vdyA7KAoKVW5sZXNzIEFuZHJl
dyB3YXMgZ29pbmcgdG8gc3VibWl0IGFzIHY1LjItcmMgZml4ZXMgSSB0aGluayBJIHNob3VsZApy
ZWJhc2UgLyBzdWJtaXQgdGhlbSBvbiBjdXJyZW50IGhtbS5naXQgYW5kIHRoZW4gdGhyb3cgdGhl
c2UgY2xlYW51cHMKZnJvbSBDaHJpc3RvcGggb24gdG9wPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
