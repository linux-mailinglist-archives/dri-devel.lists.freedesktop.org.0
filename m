Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0711E7505
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AB6E91C;
	Mon, 28 Oct 2019 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AFA6E91C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:26:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-lNn25HosPZ6Kiit3F71mFA-1; Mon, 28 Oct 2019 11:26:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E04B85B6EE;
 Mon, 28 Oct 2019 15:26:07 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0094600F6;
 Mon, 28 Oct 2019 15:26:03 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:26:02 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Message-ID: <20191028152602.GA5057@redhat.com>
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: lNn25HosPZ6Kiit3F71mFA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572276372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5z6ketRxdH7x8/MPNCyY9K0RISFxVyAQKvqmAbn3WXI=;
 b=jLNrqd5saATR7OCankiFYF7z2KEr+GGWgxIPNECcpXo/I85VRYouOdmrgAAamsntveflXw
 GCsMz/0VOxR88ZrzkK6wha/328wdCsha3LuHOdDQak5yqppCkxSkFjVOruGBEvCeYLRoTA
 CEXz86aPUEcL7KzOnYQx+5g6gh47Lkk=
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
Cc: Alistair Delva <adelva@google.com>, dri-devel@lists.freedesktop.org,
 Prahlad Kilambi <prahladk@google.com>, Sean Paul <seanpaul@chromium.org>,
 kraxel@redhat.com, Chris Forbes <chrisforbes@google.com>,
 kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6MzU6MzJBTSAtMDcwMCwgWWl3ZWkgWmhhbmcgd3Jv
dGU6Cj4gSGkgZm9sa3MsCj4gCj4gVGhpcyBpcyB0aGUgcGxhaW4gdGV4dCB2ZXJzaW9uIG9mIHRo
ZSBwcmV2aW91cyBlbWFpbCBpbiBjYXNlIHRoYXQgd2FzCj4gY29uc2lkZXJlZCBhcyBzcGFtLgo+
IAo+IC0tLSBCYWNrZ3JvdW5kIC0tLQo+IE9uIHRoZSBkb3duc3RyZWFtIEFuZHJvaWQsIHZlbmRv
cnMgdXNlZCB0byByZXBvcnQgR1BVIHByaXZhdGUgbWVtb3J5Cj4gYWxsb2NhdGlvbnMgd2l0aCBk
ZWJ1Z2ZzIG5vZGVzIGluIHRoZWlyIG93biBmb3JtYXRzLiBIb3dldmVyLCBkZWJ1Z2ZzIG5vZGVz
Cj4gYXJlIGdldHRpbmcgZGVwcmVjYXRlZCBpbiB0aGUgbmV4dCBBbmRyb2lkIHJlbGVhc2UuCgpN
YXliZSBleHBsYWluIHdoeSBpdCBpcyB1c2VmdWwgZmlyc3QgPwoKPiAKPiAtLS0gUHJvcG9zYWwg
LS0tCj4gV2UgYXJlIHRha2luZyB0aGUgY2hhbmNlIHRvIHVuaWZ5IGFsbCB0aGUgdmVuZG9ycyB0
byBtaWdyYXRlIHRoZWlyIGV4aXN0aW5nCj4gZGVidWdmcyBub2RlcyBpbnRvIGEgc3RhbmRhcmRp
emVkIHN5c2ZzIG5vZGUgc3RydWN0dXJlLiBUaGVuIHRoZSBwbGF0Zm9ybQo+IGlzIGFibGUgdG8g
ZG8gYSBidW5jaCBvZiB1c2VmdWwgdGhpbmdzOiBtZW1vcnkgcHJvZmlsaW5nLCBzeXN0ZW0gaGVh
bHRoCj4gY292ZXJhZ2UsIGZpZWxkIG1ldHJpY3MsIGxvY2FsIHNoZWxsIGR1bXAsIGluLWFwcCBh
cGksIGV0Yy4gVGhpcyBwcm9wb3NhbAo+IGlzIGJldHRlciBzZXJ2ZWQgdXBzdHJlYW0gYXMgYWxs
IEdQVSB2ZW5kb3JzIGNhbiBzdGFuZGFyZGl6ZSBhIGdwdSBtZW1vcnkKPiBzdHJ1Y3R1cmUgYW5k
IHJlZHVjZSBmcmFnbWVudGF0aW9uIGFjcm9zcyBBbmRyb2lkIGFuZCBMaW51eCB0aGF0IGNsaWVu
dHMKPiBjYW4gcmVseSBvbi4KPiAKPiAtLS0gRGV0YWlsZWQgZGVzaWduIC0tLQo+IFRoZSBzeXNm
cyBub2RlIHN0cnVjdHVyZSBsb29rcyBsaWtlIGJlbG93Ogo+IC9zeXMvZGV2aWNlcy88cm8uZ2Z4
LnN5c2ZzLjA+LzxwaWQ+Lzx0eXBlX25hbWU+Cj4gZS5nLiAiL3N5cy9kZXZpY2VzL21hbGkwL2dw
dV9tZW0vNjA2L2dsX2J1ZmZlciIgYW5kIHRoZSBnbF9idWZmZXIgaXMgYSBub2RlCj4gaGF2aW5n
IHRoZSBjb21tYSBzZXBhcmF0ZWQgc2l6ZSB2YWx1ZXM6ICI0MDk2LDgxOTIwLC4uLiw0MDk2Ii4K
CkhvdyBkb2VzIGtlcm5lbCBrbm93cyB3aGF0IEFQSSB0aGUgYWxsb2NhdGlvbiBpcyB1c2UgZm9y
ID8gV2l0aCB0aGUKb3BlbiBzb3VyY2UgZHJpdmVyIHlvdSBuZXZlciBzcGVjaWZ5IHdoYXQgQVBJ
IGlzIGNyZWF0aW5nIGEgZ2VtIG9iamVjdAoob3BlbmdsLCB2dWxrYW4sIC4uLikgbm9yIHdoYXQg
cHVycG9zZSAodHJhbnNpZW50LCBzaGFkZXIsIC4uLikuCgoKPiBGb3IgdGhlIHRvcCBsZXZlbCBy
b290LCB2ZW5kb3JzIGNhbiBjaG9vc2UgdGhlaXIgb3duIG5hbWVzIGJhc2VkIG9uIHRoZQo+IHZh
bHVlIG9mIHJvLmdmeC5zeXNmcy4wIHRoZSB2ZW5kb3JzIHNldC4gKDEpIEZvciB0aGUgbXVsdGlw
bGUgZ3B1IGRyaXZlcgo+IGNhc2VzLCB3ZSBjYW4gdXNlIHJvLmdmeC5zeXNmcy4xLCByby5nZngu
c3lzZnMuMiBmb3IgdGhlIDJuZCBhbmQgM3JkIEtNRHMuCj4gKDIpIEl0J3MgYWxzbyBhbGxvd2Vk
IHRvIHB1dCBzb21lIHN1Yi1kaXIgZm9yIGV4YW1wbGUgImtnc2wvZ3B1X21lbSIgb3IKPiAibWFs
aTAvZ3B1X21lbSIgaW4gdGhlIHJvLmdmeC5zeXNmcy48Y2hhbm5lbD4gcHJvcGVydHkgaWYgdGhl
IHJvb3QgbmFtZQo+IHVuZGVyIC9zeXMvZGV2aWNlcy8gaXMgYWxyZWFkeSBjcmVhdGVkIGFuZCB1
c2VkIGZvciBvdGhlciBwdXJwb3Nlcy4KCk9uIG9uZSBzaWRlIHlvdSB3YW50IHRvIHN0YW5kYXJk
aXplIG9uIHRoZSBvdGhlciB5b3Ugd2FudCB0byBnaXZlCmNvbXBsZXRlIGZyZWVkb20gb24gdGhl
IHRvcCBsZXZlbCBuYW1pbmcgc2NoZW1lLiBJIHdvdWxkIHJhdGhlciBzZWUgYQpjb25zaXN0ZW50
IG5hbWluZyBzY2hlbWUgKGllIHNvbWV0aGluZyBtb3JlIHJlc3RyYWludCBhbmQgd2l0aCBsaXR0
bGUKcGxhY2UgZm9yIGludGVycHJhdGlvbiBieSBpbmRpdmlkdWFsIGRyaXZlcikKLgoKPiBGb3Ig
dGhlIDJuZCBsZXZlbCAicGlkIiwgdGhlcmUgYXJlIHVzdWFsbHkganVzdCBhIGNvdXBsZSBvZiB0
aGVtIHBlcgo+IHNuYXBzaG90LCBzaW5jZSB3ZSBvbmx5IHRha2VzIHNuYXBzaG90IGZvciB0aGUg
YWN0aXZlIG9uZXMuCgo/IERvIG5vdCB1bmRlcnN0YW5kIGhlcmUsIHlvdSBjYW4gaGF2ZSBhbnkg
bnVtYmVyIG9mIGFwcGxpY2F0aW9ucyB3aXRoCkdQVSBvYmplY3RzID8gQW5kIHRodXMgdGhlcmUg
aXMgbm8gYm91bmQgb24gdGhlIG51bWJlciBvZiBQSUQuIFBsZWFzZQpjb25zaWRlciBkZXNrdG9w
IHRvbywgaSBkbyBub3Qga25vdyB3aGF0IGtpbmQgb2YgbGltaXRhdGlvbiBhbmRyb2lkCmltcG9z
ZS4KCj4gRm9yIHRoZSAzcmQgbGV2ZWwgInR5cGVfbmFtZSIsIHRoZSB0eXBlIG5hbWUgd2lsbCBi
ZSBvbmUgb2YgdGhlIEdQVSBtZW1vcnkKPiBvYmplY3QgdHlwZXMgaW4gbG93ZXIgY2FzZSwgYW5k
IHRoZSB2YWx1ZSB3aWxsIGJlIGEgY29tbWEgc2VwYXJhdGVkCj4gc2VxdWVuY2Ugb2Ygc2l6ZSB2
YWx1ZXMgZm9yIGFsbCB0aGUgYWxsb2NhdGlvbnMgdW5kZXIgdGhhdCBzcGVjaWZpYyB0eXBlLgo+
IAo+IFdlIGVzcGVjaWFsbHkgd291bGQgbGlrZSBzb21lIGNvbW1lbnRzIG9uIHRoaXMgcGFydC4g
Rm9yIHRoZSBHUFUgbWVtb3J5Cj4gb2JqZWN0IHR5cGVzLCB3ZSBkZWZpbmVkIDkgZGlmZmVyZW50
IHR5cGVzIGZvciBBbmRyb2lkOgo+ICgxKSBVTktOT1dOIC8vIG5vdCBhY2NvdW50ZWQgZm9yIGlu
IGFueSBvdGhlciBjYXRlZ29yeQo+ICgyKSBTSEFERVIgLy8gc2hhZGVyIGJpbmFyaWVzCj4gKDMp
IENPTU1BTkQgLy8gYWxsb2NhdGlvbnMgd2hpY2ggaGF2ZSBhIGxpZmV0aW1lIHNpbWlsYXIgdG8g
YQo+IFZrQ29tbWFuZEJ1ZmZlcgo+ICg0KSBWVUxLQU4gLy8gYmFja2luZyBmb3IgVmtEZXZpY2VN
ZW1vcnkKPiAoNSkgR0xfVEVYVFVSRSAvLyBHTCBUZXh0dXJlIGFuZCBSZW5kZXJCdWZmZXIKPiAo
NikgR0xfQlVGRkVSIC8vIEdMIEJ1ZmZlcgo+ICg3KSBRVUVSWSAvLyBiYWNraW5nIGZvciBxdWVy
eQo+ICg4KSBERVNDUklQVE9SIC8vIGFsbG9jYXRpb25zIHdoaWNoIGhhdmUgYSBsaWZldGltZSBz
aW1pbGFyIHRvIGEKPiBWa0Rlc2NyaXB0b3JTZXQKPiAoOSkgVFJBTlNJRU5UIC8vIHJhbmRvbSB0
cmFuc2llbnQgdGhpbmdzIHRoYXQgdGhlIGRyaXZlciBuZWVkcwo+Cj4gV2UgYXJlIHdvbmRlcmlu
ZyBpZiB0aG9zZSB0eXBlIGVudW1lcmF0aW9ucyBtYWtlIHNlbnNlIHRvIHRoZSB1cHN0cmVhbSBz
aWRlCj4gYXMgd2VsbCwgb3IgbWF5YmUgd2UganVzdCBkZWFsIHdpdGggb3VyIG93biBkaWZmZXJl
bnQgdHlwZSBzZXRzLiBDdXogb24gdGhlCj4gQW5kcm9pZCBzaWRlLCB3ZSdsbCBqdXN0IHJlYWQg
dGhvc2Ugbm9kZXMgbmFtZWQgYWZ0ZXIgdGhlIHR5cGVzIHdlIGRlZmluZWQKPiBpbiB0aGUgc3lz
ZnMgbm9kZSBzdHJ1Y3R1cmUuCgpTZWUgbXkgYWJvdmUgcG9pbnQgb2Ygb3BlbiBzb3VyY2UgZHJp
dmVyIGFuZCBrZXJuZWwgYmVpbmcgdW5hd2FyZQpvZiB0aGUgYWxsb2NhdGlvbiBwdXJwb3NlIGFu
ZCB1c2UuCgpDaGVlcnMsCkrDqXLDtG1lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
