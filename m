Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DC278352
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375796E092;
	Fri, 25 Sep 2020 08:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD96E092
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:54:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601024098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3sgv1pOZlB06dEQ0nLJCJG7WcKIpgapVe9e7yCMNbog=;
 b=dbhnJz/t2xPwMcwmUHQCgh+S8BXAN6x+r1TOeln/wTXXxmpYRxdN7+4pe6mHSnS4sF15/X
 sm530RVDBjSDBfTHpiphatYHWnl23TnKMqr6e0hsRbbEnBcX3Agcm4KKgYjMDzv/OtUk1q
 OVNhcfyGxc/GOxnAT/klF0znjO0K1xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-L5b0IUGPMD2PwNgdTNW4dA-1; Fri, 25 Sep 2020 04:54:53 -0400
X-MC-Unique: L5b0IUGPMD2PwNgdTNW4dA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA291800E23;
 Fri, 25 Sep 2020 08:54:51 +0000 (UTC)
Received: from [10.36.112.211] (ovpn-112-211.ams2.redhat.com [10.36.112.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7468578822;
 Fri, 25 Sep 2020 08:54:43 +0000 (UTC)
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: Dan Williams <dan.j.williams@intel.com>
References: <CAPcyv4iQ4VnXMU0+_7rfXwPowgcdoABSFUH4WO_3P9vHtWAzPg@mail.gmail.com>
 <79BEC711-C769-432B-9A50-63C6A3AEB0E3@redhat.com>
 <CAPcyv4jsUiXTqDtnh_fnm_p4NaX2=c3rrjFe6Efa-oWPkTe-fA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <d729e2e3-1f8e-31e6-7095-841b9e3ca47b@redhat.com>
Date: Fri, 25 Sep 2020 10:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jsUiXTqDtnh_fnm_p4NaX2=c3rrjFe6Efa-oWPkTe-fA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Joao Martins <joao.m.martins@oracle.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDkuMjAgMjM6NTAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNCwg
MjAyMCBhdCAyOjQyIFBNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90
ZToKPj4KPj4KPj4KPj4+IEFtIDI0LjA5LjIwMjAgdW0gMjM6MjYgc2NocmllYiBEYW4gV2lsbGlh
bXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT46Cj4+Pgo+Pj4g77u/Wy4uXQo+Pj4+PiBJJ20g
bm90IHN1Z2dlc3RpbmcgdG8gYnVzeSB0aGUgd2hvbGUgInZpcnRpbyIgcmFuZ2UsIGp1c3QgdGhl
IHBvcnRpb24KPj4+Pj4gdGhhdCdzIGFib3V0IHRvIGJlIHBhc3NlZCB0byBhZGRfbWVtb3J5X2Ry
aXZlcl9tYW5hZ2VkKCkuCj4+Pj4KPj4+PiBJJ20gYWZyYWlkIEkgZG9uJ3QgZ2V0IHlvdXIgcG9p
bnQuIEZvciB2aXJ0aW8tbWVtOgo+Pj4+Cj4+Pj4gQmVmb3JlOgo+Pj4+Cj4+Pj4gMS4gQ3JlYXRl
IHZpcnRpbzAgY29udGFpbmVyIHJlc291cmNlCj4+Pj4KPj4+PiAyLiAoc29tZXdoZW4gaW4gdGhl
IGZ1dHVyZSkgYWRkX21lbW9yeV9kcml2ZXJfbWFuYWdlZCgpCj4+Pj4gLSBDcmVhdGUgcmVzb3Vy
Y2UgKFN5c3RlbSBSQU0gKHZpcnRpb19tZW0pKSwgbWFya2luZyBpdCBidXN5L2RyaXZlcgo+Pj4+
ICAgbWFuYWdlZAo+Pj4+Cj4+Pj4gQWZ0ZXI6Cj4+Pj4KPj4+PiAxLiBDcmVhdGUgdmlydGlvMCBj
b250YWluZXIgcmVzb3VyY2UKPj4+Pgo+Pj4+IDIuIChzb21ld2hlbiBpbiB0aGUgZnV0dXJlKSBD
cmVhdGUgcmVzb3VyY2UgKFN5c3RlbSBSQU0gKHZpcnRpb19tZW0pKSwKPj4+PiAgIG1hcmtpbmcg
aXQgYnVzeS9kcml2ZXIgbWFuYWdlZAo+Pj4+IDMuIGFkZF9tZW1vcnlfZHJpdmVyX21hbmFnZWQo
KQo+Pj4+Cj4+Pj4gTm90IGhlbHBmdWwgb3Igc2ltcGxlciBJTUhPLgo+Pj4KPj4+IFRoZSBjb25j
ZXJuIEknbSB0cnlpbmcgdG8gYWRkcmVzcyBpcyB0aGUgdGhlb3JldGljYWwgcmFjZSB3aW5kb3cg
YW5kCj4+PiBsYXllcmluZyB2aW9sYXRpb24gaW4gdGhpcyBzZXF1ZW5jZSBpbiB0aGUga21lbSBk
cml2ZXI6Cj4+Pgo+Pj4gMS8gcmVzID0gcmVxdWVzdF9tZW1fcmVnaW9uKC4uLik7Cj4+PiAyLyBy
ZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU07Cj4+PiAzLyBhZGRfbWVtb3J5X2RyaXZlcl9tYW5h
Z2VkKCk7Cj4+Pgo+Pj4gQmV0d2VlbiAyLyBhbmQgMy8gc29tZXRoaW5nIGNhbiByYWNlIGFuZCB0
aGluayB0aGF0IGl0IG93bnMgdGhlCj4+PiByZWdpb24uIERvIEkgdGhpbmsgaXQgd2lsbCBoYXBw
ZW4gaW4gcHJhY3RpY2UsIG5vLCBidXQgaXQncyBzdGlsbCBhCj4+PiBwYXR0ZXJuIHRoYXQgZGVz
ZXJ2ZXMgY29tZSBjbGVhbnVwLgo+Pgo+PiBJIHRoaW5rIGluIHRoYXQgdW5saWtlbHkgZXZlbnQg
KHJhdGhlciBpbXBvc3NpYmxlKSwgYWRkX21lbW9yeV9kcml2ZXJfbWFuYWdlZCgpIHNob3VsZCBm
YWlsLCBkZXRlY3RpbmcgYSBjb25mbGljdGluZyAoYnVzeSkgcmVzb3VyY2UuIE5vdCBzdXJlIHdo
YXQgd2lsbCBoYXBwZW4gbmV4dCAoIGFuZCBkaWQgbm90IGRvdWJsZS1jaGVjaykuCj4gCj4gYWRk
X21lbW9yeV9kcml2ZXJfbWFuYWdlZCgpIHdpbGwgZmFpbCwgYnV0IHRoZSByZWxlYXNlX21lbV9y
ZWdpb24oKSBpbgo+IGttZW0gdG8gdW53aW5kIG9uIHRoZSBlcnJvciBwYXRoIHdpbGwgZG8gdGhl
IHdyb25nIHRoaW5nIGJlY2F1c2UgdGhhdAo+IG90aGVyIGRyaXZlciB0aGlua3MgaXQgZ290IG93
bmVyc2hpcCBvZiB0aGUgcmVnaW9uLgo+IAoKSSB0aGluayBpZiBzb21lYm9keSB3b3VsZCByYWNl
IGFuZCBjbGFpbSB0aGUgcmVnaW9uIGZvciBpdHNlbGYgKGFmdGVyIHdlCnVuY2hlY2tlZCB0aGUg
QlVTWSBmbGFnKSwgdGhlcmUgd291bGQgYmUgYW5vdGhlciBtZW1vcnkgcmVzb3VyY2UgYmVsb3cK
b3VyIHJlc291cmNlIGNvbnRhaW5lciAoZS5nLiwgdmlhIF9fcmVxdWVzdF9yZWdpb24oKSkuCgpT
bywgaW50ZXJlc3RpbmdseSwgdGhlIGN1cnJlbnQgY29kZSB3aWxsIGRvIGEKCnJlbGVhc2VfcmVz
b3VyY2UtPl9fcmVsZWFzZV9yZXNvdXJjZShvbGQsIHRydWUpOwoKd2hpY2ggd2lsbCByZW1vdmUg
d2hhdGV2ZXIgc29tZWJvZHkgYWRkZWQgYmVsb3cgdGhlIHJlc291cmNlLgoKSWYgd2Ugd2VyZSB0
byBkbyBhCgpyZW1vdmVfcmVzb3VyY2UtPl9fcmVsZWFzZV9yZXNvdXJjZShvbGQsIGZhbHNlKTsK
CndlIHdvdWxkIG9ubHkgcmVtb3ZlIHdoYXQgd2UgdGVtcG9yYXJpbHkgYWRkZWQsIHJlbG9jYXRp
bmcgYW55Y2hpbGRyZW4KKHNvbWVvbmUgbmFzdHkgYWRkZWQpLgoKQnV0IHllYWgsIEkgZG9uJ3Qg
dGhpbmsgd2UgaGF2ZSB0byB3b3JyeSBhYm91dCB0aGlzIGNhc2UuCgo+PiBCdXQgeWVhaCwgdGhl
IHdheSB0aGUgQlVTWSBiaXQgaXMgY2xlYXJlZCBoZXJlIGlzIHdyb25nIC0gc2ltcGx5IG92ZXJ3
cml0aW5nIG90aGVyIGJpdHMuIEFuZCBpdCB3b3VsZCBiZSBldmVuIGJldHRlciBpZiB3ZSBjb3Vs
ZCBhdm9pZCBtYW51YWxseSBtZXNzaW5nIHdpdGggZmxhZ3MgaGVyZS4KPiAKPiBJJ20gb2sgdG8g
bGVhdmUgaXQgYWxvbmUgZm9yIG5vdyAoaGFzbid0IGJlZW4gYW5kIGxpa2VseSBuZXZlciB3aWxs
IGJlCj4gYSBwcm9ibGVtIGluIHByYWN0aWNlKSwgYnV0IEkgdGhpbmsgaXQgd2FzIHN0aWxsIHdv
cnRoIGdydW1ibGluZwoKRGVmaW5pdGVseSwgaXQgZ2l2ZXMgdXMgYSBiZXR0ZXIgdW5kZXJzdGFu
ZGluZy4KCj4gYWJvdXQuIEknbGwgbGVhdmUgdGhhdCBwYXJ0IG9mIGttZW0gYWxvbmUgaW4gdGhl
IHVwY29taW5nIHNwbGl0IG9mCj4gZGF4X2ttZW1fcmVzIHJlbW92YWwuCgpZZWFoLCBzdHVmZiBp
cyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSB3b3VsZCB3aXNoZWQsIHNvIEkgZ3Vlc3MgaXQncwpi
ZXR0ZXIgdG8gbGVhdmUgaXQgYWxvbmUgZm9yIG5vdyB1bnRpbCB3ZSBhY3R1YWxseSBzZWUgaXNz
dWVzIHdpdGgKc29tZWJvZHkgZWxzZSByZWdhcmRpbmcgKm91ciogZGV2aWNlLW93bmVkIHJlZ2lv
biAob3Igd2UncmUgYWJsZSB0byBjb21lCnVwIHdpdGggYSBjbGVhbnVwIHRoYXQga2VlcHMgYWxs
IGNvcm5lciBjYXNlcyB3b3JraW5nIGZvciBrbWVtIGFuZAp2aXJ0aW8tbWVtKS4KCi0tIApUaGFu
a3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
