Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B835618936
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 13:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466C8975F;
	Thu,  9 May 2019 11:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B4C8975F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 11:46:22 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16501956-1500050 for multiple; Thu, 09 May 2019 12:46:08 +0100
MIME-Version: 1.0
To: Michael Yang <michael.yang@imgtec.com>, sumit.semwal@linaro.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
 <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
Message-ID: <155740236592.28545.17880521046408313036@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] sync_file: Return reasonable timestamp when merging
 signaled fences
Date: Thu, 09 May 2019 12:46:05 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, gregkh@linuxfoundation.org,
 michael.yang@imgtec.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNaWNoYWVsIFlhbmcgKDIwMTktMDUtMDkgMDU6MzQ6MTEpCj4gSWYgYWxsIHRoZSBz
eW5jIHBvaW50cyB3ZXJlIHNpZ25hbGVkIGluIGJvdGggZmVuY2VzIGEgYW5kIGIsCj4gdGhlcmUg
d2FzIG9ubHkgb25lIHN5bmMgcG9pbnQgaW4gbWVyZ2VkIGZlbmNlIHdoaWNoIGlzIGFfZmVuY2Vb
MF0uCj4gVGhlIEZlbmNlIHN0cnVjdHVyZSBpbiBhbmRyb2lkIGZyYW1ld29yayBtaWdodCBiZSBj
b25mdXNlZCBhYm91dAo+IHRpbWVzdGFtcCBpZiB0aGVyZSB3ZXJlIGFueSBzeW5jIHBvaW50cyB3
aGljaCB3ZXJlIHNpZ25hbGVkIGFmdGVyCj4gYV9mZW5jZVswXS4gSXQgbWlnaHQgYmUgbW9yZSBy
ZWFzb25hYmxlIHRvIHVzZSB0aW1lc3RhbXAgb2YgbGFzdCBzaWduYWxlZAo+IHN5bmMgcG9pbnQg
dG8gcmVwcmVzZW50IHRoZSBtZXJnZWQgZmVuY2UuCj4gVGhlIGlzc3VlIGNhbiBiZSBmb3VuZCBm
cm9tIEVHTCBleHRlbnNpb24gQU5EUk9JRF9nZXRfZnJhbWVfdGltZXN0YW1wcy4KPiBTb21ldGlt
ZXMgdGhlIHJldHVybiB2YWx1ZSBvZiBFR0xfUkVBRFNfRE9ORV9USU1FX0FORFJPSUQgaXMgaGVh
ZCBvZgo+IHRoZSByZXR1cm4gdmFsdWUgb2YgRUdMX1JFTkRFUklOR19DT01QTEVURV9USU1FX0FO
RFJPSUQuCj4gVGhhdCBtZWFucyBkaXNwbGF5L2NvbXBvc2l0aW9uIGhhZCBiZWVuIGNvbXBsZXRl
ZCBiZWZvcmUgcmVuZGVyaW5nCj4gd2FzIGNvbXBsZXRlZCB0aGF0IGlzIGluY29ycmVjdC4KPiAK
PiBTb21lIGRpc2N1c3Npb24gY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8vYW5kcm9pZC1yZXZp
ZXcuZ29vZ2xlc291cmNlLmNvbS9jL2tlcm5lbC9jb21tb24vKy85MDcwMDkKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIFlhbmcgPG1pY2hhZWwueWFuZ0BpbWd0ZWMuY29tPgo+IC0tLQo+IEhp
LAo+IEkgZGlkbid0IGdldCByZXNwb25zZSBzaW5jZSBJIHByZXZpb3VzbHkgc2VudCB0aGlzIGEg
bW9udGggYWdvLgo+IENvdWxkIHNvbWVvbmUgaGF2ZSBhIGNoYW5jZSB0byBsb29rIGF0IGl0IHBs
ZWFzZT8KPiBUaGFua3MuCj4gIGRyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYyB8IDI1ICsrKysr
KysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2Zp
bGUuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYwo+IGluZGV4IDRmNjMwNWMuLmQ0NmJm
ZTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCj4gKysrIGIvZHJp
dmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCj4gQEAgLTI3NCw4ICsyNzQsMjkgQEAgc3RhdGljIHN0
cnVjdCBzeW5jX2ZpbGUgKnN5bmNfZmlsZV9tZXJnZShjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3Qg
c3luY19maWxlICphLAo+ICAgICAgICAgZm9yICg7IGlfYiA8IGJfbnVtX2ZlbmNlczsgaV9iKysp
Cj4gICAgICAgICAgICAgICAgIGFkZF9mZW5jZShmZW5jZXMsICZpLCBiX2ZlbmNlc1tpX2JdKTsK
PiAgCj4gLSAgICAgICBpZiAoaSA9PSAwKQo+IC0gICAgICAgICAgICAgICBmZW5jZXNbaSsrXSA9
IGRtYV9mZW5jZV9nZXQoYV9mZW5jZXNbMF0pOwo+ICsgICAgICAgLyogSWYgYWxsIHRoZSBzeW5j
IHB0cyB3ZXJlIHNpZ25hbGVkLCB0aGVuIGFkZGluZyB0aGUgc3luY19wdCB3aG8KPiArICAgICAg
ICAqIHdhcyB0aGUgbGFzdCBzaWduYWxlZCB0byB0aGUgZmVuY2UuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGlmIChpID09IDApIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IGRtYV9mZW5jZSAq
bGFzdF9zaWduYWxlZF9zeW5jX3B0ID0gYV9mZW5jZXNbMF07Cj4gKyAgICAgICAgICAgICAgIGlu
dCBpdGVyOwo+ICsKPiArICAgICAgICAgICAgICAgZm9yIChpdGVyID0gMTsgaXRlciA8IGFfbnVt
X2ZlbmNlczsgaXRlcisrKSB7CgpJZiB0aGVyZSBpcyBtb3JlIHRoYW4gb25lIGZlbmNlLCBzeW5j
X2ZpbGUtPmZlbmNlIGlzIGEgZmVuY2VfYXJyYXkgYW5kCml0cyB0aW1lc3RhbXAgaXMgd2hhdCB5
b3Ugd2FudC4gSWYgdGhlcmUgaXMgb25lIGZlbmNlLCBzeW5jX2ZpbGUtPmZlbmNlCmlzIGEgcG9p
bnRlciB0byB0aGF0IGZlbmNlLCBhbmQgbmF0dXJhbGx5IGhhcyB0aGUgcmlnaHQgdGltZXN0YW1w
LgoKSW4gc2hvcnQsIHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQgYnkgZG1hX2ZlbmNlX2FycmF5X2Ny
ZWF0ZSgpIHdoZW4gZ2l2ZW4KYSBjb21wbGV0ZSBzZXQgb2Ygc2lnbmFsZWQgZmVuY2VzLCBpdCB0
b28gc2hvdWxkIGluaGVyaXQgdGhlIHNpZ25hbGVkCnN0YXR1cyB3aXRoIHRoZSB0aW1lc3RhbXAg
YmVpbmcgdGFrZW4gZnJvbSB0aGUgbGFzdCBmZW5jZS4gSXQgc2hvdWxkCmFsc28gYmUgY2FyZWZ1
bCB0byBpbmhlcml0IHRoZSBlcnJvciBzdGF0dXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
