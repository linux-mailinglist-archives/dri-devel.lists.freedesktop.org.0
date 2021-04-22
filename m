Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E654368D1F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 08:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618426EB40;
	Fri, 23 Apr 2021 06:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1120 seconds by postgrey-1.36 at gabe;
 Thu, 22 Apr 2021 12:46:37 UTC
Received: from hurricane.elijah.cs.cmu.edu (hurricane.elijah.cs.cmu.edu
 [128.2.209.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A3A6EA7C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 12:46:37 +0000 (UTC)
Received: from [72.95.139.242] (helo=[192.168.2.97])
 by hurricane.elijah.cs.cmu.edu with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <jaharkes@cs.cmu.edu>)
 id 1lZYR1-0000yX-4S; Thu, 22 Apr 2021 08:27:55 -0400
Date: Thu, 22 Apr 2021 08:27:53 -0400
In-Reply-To: <20210421132012.82354-1-christian.koenig@amd.com>
References: <20210421132012.82354-1-christian.koenig@amd.com>
MIME-Version: 1.0
Autocrypt: addr=jaharkes@cs.cmu.edu; keydata=
 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
Subject: Re: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error
 path
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 dri-devel@lists.freedesktop.org
From: Jan Harkes <jaharkes@cs.cmu.edu>
Message-ID: <91292A4A-5F97-4FF8-ABAD-42392A0756B5@cs.cmu.edu>
X-Mailman-Approved-At: Fri, 23 Apr 2021 06:24:49 +0000
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
Cc: jgg@ziepe.ca, coda@cs.cmu.edu, akpm@linux-foundation.org, miklos@szeredi.hu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4KCkknbSBhbHNvIG1haW50YWluaW5nIGFuIG91dCBvZiB0cmVlIGNv
ZGEgbW9kdWxlIGJ1aWxkIHRoYXQgcGVvcGxlIHNvbWV0aW1lcyB1c2UsIHdoaWNoIGhhcyB3b3Jr
YXJvdW5kcyBmb3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgdmFyaW91cyBrZXJuZWwgdmVyc2lv
bnMuCgpEbyB5b3UgaGF2ZSBhIHJlZmVyZW5jZSB0byB0aGUgY29ycmVzcG9uZGluZyBtbWFwX3Jl
Z2lvbiBjaGFuZ2U/IElmIGl0IGlzIG1lcmdlZCBhbHJlYWR5IEknbGwgcHJvYmFibHkgYmUgYWJs
ZSB0byBmaW5kIGl0LiBJcyB0aGlzIG1tYXBfcmVnaW9uIGNoYW5nZSBleHBlY3RlZCB0byBiZSBi
YWNrcG9ydGVkIHRvIGFueSBsdHMga2VybmVscz8KCkphbgoKT24gQXByaWwgMjEsIDIwMjEgOToy
MDoxMSBBTSBFRFQsICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBn
bWFpbC5jb20+IHdyb3RlOgo+bW1hcF9yZWdpb24oKSBub3cgY2FsbHMgZnB1dCgpIG9uIHRoZSB2
bWEtPnZtX2ZpbGUuCj4KPlNvIHdlIG5lZWQgdG8gZHJvcCB0aGUgZXh0cmEgcmVmZXJlbmNlIG9u
IHRoZSBjb2RhIGZpbGUgaW5zdGVhZCBvZiB0aGUKPmhvc3QgZmlsZS4KPgo+U2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Rml4ZXM6IDE1
MjdmOTI2ZmQwNCAoIm1tOiBtbWFwOiBmaXggZnB1dCBpbiBlcnJvciBwYXRoIHYyIikKPkNDOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnICMgNS4xMSsKPi0tLQo+IGZzL2NvZGEvZmlsZS5jIHwgNiAr
KystLS0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Cj5kaWZmIC0tZ2l0IGEvZnMvY29kYS9maWxlLmMgYi9mcy9jb2RhL2ZpbGUuYwo+aW5kZXggMTI4
ZDYzZGY1YmZiLi5lZjVjYTIyYmZiM2UgMTAwNjQ0Cj4tLS0gYS9mcy9jb2RhL2ZpbGUuYwo+Kysr
IGIvZnMvY29kYS9maWxlLmMKPkBAIC0xNzUsMTAgKzE3NSwxMCBAQCBjb2RhX2ZpbGVfbW1hcChz
dHJ1Y3QgZmlsZSAqY29kYV9maWxlLCBzdHJ1Y3QKPnZtX2FyZWFfc3RydWN0ICp2bWEpCj4gCXJl
dCA9IGNhbGxfbW1hcCh2bWEtPnZtX2ZpbGUsIHZtYSk7Cj4gCj4gCWlmIChyZXQpIHsKPi0JCS8q
IGlmIGNhbGxfbW1hcCBmYWlscywgb3VyIGNhbGxlciB3aWxsIHB1dCBjb2RhX2ZpbGUgc28gd2UK
Pi0JCSAqIHNob3VsZCBkcm9wIHRoZSByZWZlcmVuY2UgdG8gdGhlIGhvc3RfZmlsZSB0aGF0IHdl
IGdvdC4KPisJCS8qIGlmIGNhbGxfbW1hcCBmYWlscywgb3VyIGNhbGxlciB3aWxsIHB1dCBob3N0
X2ZpbGUgc28gd2UKPisJCSAqIHNob3VsZCBkcm9wIHRoZSByZWZlcmVuY2UgdG8gdGhlIGNvZGFf
ZmlsZSB0aGF0IHdlIGdvdC4KPiAJCSAqLwo+LQkJZnB1dChob3N0X2ZpbGUpOwo+KwkJZnB1dChj
b2RhX2ZpbGUpOwo+IAkJa2ZyZWUoY3ZtX29wcyk7Cj4gCX0gZWxzZSB7Cj4gCQkvKiBoZXJlIHdl
IGFkZCByZWRpcmVjdHMgZm9yIHRoZSBvcGVuL2Nsb3NlIHZtX29wZXJhdGlvbnMgKi8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
