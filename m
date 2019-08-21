Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B297E99
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED1C6E435;
	Wed, 21 Aug 2019 15:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2856E435
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18216017-1500050 for multiple; Wed, 21 Aug 2019 16:24:25 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-9-christian.koenig@amd.com>
Message-ID: <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
Date: Wed, 21 Aug 2019 16:24:22 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjQ1KQo+IEBAIC0xMTcs
MTcgKzEyMCwxMCBAQCBpOTE1X2dlbV9idXN5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsCj4gICAgICAgICAgICAgICAgIGJ1c3lfY2hlY2tfd3JpdGVyKHJjdV9kZXJl
ZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2VfZXhjbCkpOwo+ICAKPiAgICAgICAgIC8qIFRy
YW5zbGF0ZSBzaGFyZWQgZmVuY2VzIHRvIFJFQUQgc2V0IG9mIGVuZ2luZXMgKi8KPiAtICAgICAg
IGxpc3QgPSByY3VfZGVyZWZlcmVuY2Uob2JqLT5iYXNlLnJlc3YtPmZlbmNlKTsKPiAtICAgICAg
IGlmIChsaXN0KSB7Cj4gLSAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaGFyZWRfY291bnQg
PSBsaXN0LT5zaGFyZWRfY291bnQsIGk7Cj4gLQo+IC0gICAgICAgICAgICAgICBmb3IgKGkgPSAw
OyBpIDwgc2hhcmVkX2NvdW50OyArK2kpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
Y3VfZGVyZWZlcmVuY2UobGlzdC0+c2hhcmVkW2ldKTsKPiAtCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgYXJncy0+YnVzeSB8PSBidXN5X2NoZWNrX3JlYWRlcihmZW5jZSk7Cj4gLSAgICAgICAg
ICAgICAgIH0KPiAtICAgICAgIH0KPiArICAgICAgIHJlYWRlcnMgPSBkbWFfcmVzdl9mZW5jZXNf
Z2V0X3JjdSgmb2JqLT5iYXNlLnJlc3YtPnJlYWRlcnMpOwo+ICsgICAgICAgZG1hX2ZlbmNlX2Fy
cmF5X2Zvcl9lYWNoKGZlbmNlLCBjdXJzb3IsIHJlYWRlcnMpCj4gKyAgICAgICAgICAgICAgIGFy
Z3MtPmJ1c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVuY2UpOwo+ICsgICAgICAgZG1hX2ZlbmNl
X3B1dChyZWFkZXJzKTsKClRoYXQncyB1bmRlcndoZWxtaW5nLCB0aGUgZnVsbC1tYiBzaG93cyB1
cCBpbiBzY2FsaW5nIHRlc3RzIChJJ2xsIHRlc3QKdGhlIGltcGFjdCBvZiB0aGlzIHNlcmllcyBs
YXRlcikuIFNvbWV0aGluZyBsaWtlLAoKZG8gewoJcmVhZCA9IDA7CglmZW5jZXMgPSBkbWFfcmVz
dl9mZW5jZXNfZ2V0X2RlcmVmKCZvYmotPmJhc2UucmVzdi0+cmVhZGVycyk7CglkbWFfZmVuY2Vf
YXJyYXlfZm9yX2VhY2goZmVuY2UsIGN1cnNvciwgZmVuY2VzKQoJCXJlYWQgfD0gYnVzeV9jaGVj
a19yZWFkZXIoZmVuY2UpOwoJc21wX3JtYigpOwp9IHdoaWxlIChkbWFfcmVzdl9mZW5jZXNfZ2V0
X2RlcmVmKG9iai0+cmVhZGVycykgIT0gZmVuY2VzKQoKZG8gewoJZmVuY2VzID0gZG1hX3Jlc3Zf
ZmVuY2VzX2dldF9kZXJlZigmb2JqLT5iYXNlLnJlc3YtPmZlbmNlcyk7Cgl3cml0ZSA9IGJ1c3lf
Y2hlY2tfd3JpdGVyKGZlbmNlcyk7CglzbXBfcm1iKCk7Cn0gd2hpbGUgKGRtYV9yZXN2X2ZlbmNl
c19nZXRfZGVyZWYob2JqLT53cml0ZXMpICE9IGZlbmNlcykKCmFyZ3MtPmJ1c3kgPSB3cml0ZSB8
IHJlYWQ7CgpQZXJoYXBzPwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
