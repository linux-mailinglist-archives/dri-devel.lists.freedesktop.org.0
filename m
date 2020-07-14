Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD921F62D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 17:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2589C37;
	Tue, 14 Jul 2020 15:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BC189C37
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWiq4sOIah4oZGqClqrpKj4xCE7yUvTVXmJd2jdm7lc=; b=QrLc1yd5Nw9lvitvjtN++bQ0n0
 mG/Ts37lYSUnonDEI5K7qXU3/p9UgAVHHD39g1+V6IcWLJVbeehl9rF0aRPtAg3zciuNSMizQwVhJ
 MdQ9Oz/3oTAA7Wuxbqsb1GhEeUzdmKjckBYgQ/zTXmqFDPvYyTgFudLxiZ2JvVc5FRUEXh3giBcAa
 d0wew92tSjMbapMPhi9P4z3r1JqbTvYfef5Vj/wfMdxPsGWOKa7QH5W9F4B0u52Jpj/32QqEfj33G
 SQLdGdyUnTu96ooZnVJavGTDqjNSYKLEifUYDA0/AjtcwZKoMqYPEWyEEu4dq4bVeFC1JVz1tPMzu
 koVeeUjw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59021
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jvMtR-0000NQ-Pj; Tue, 14 Jul 2020 17:30:53 +0200
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Alan Stern <stern@rowland.harvard.edu>, Peter Stuge <peter@stuge.se>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
 <a0f8030c-a609-ce03-ff92-027de37eb834@tronnes.org>
Message-ID: <8c4f3cdf-ea51-40b9-aed9-70fa9fbe0622@tronnes.org>
Date: Tue, 14 Jul 2020 17:30:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0f8030c-a609-ce03-ff92-027de37eb834@tronnes.org>
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDIuMDYuMjAyMCAxMy40Niwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAwMi4wNi4yMDIwIDA0LjMyLCBza3JldiBBbGFuIFN0ZXJuOgo+PiBPbiBUdWUsIEp1biAwMiwg
MjAyMCBhdCAxMjoxMjowN0FNICswMDAwLCBQZXRlciBTdHVnZSB3cm90ZToKPj4KPj4gLi4uCj4+
Cj4+PiBUaGUgd2F5IEkgcmVhZCBjb21wb3NpdGVfc2V0dXAoKSBhZnRlciB0cnlfZnVuX3NldHVw
OiBpdCBjYWxscyBmLT5zZXR1cCgpCj4+PiB3aGVuIGF2YWlsYWJsZSwgYW5kIHRoYXQgY2FuIHJl
dHVybiA8IDAgdG8gc3RhbGwuCj4+Pgo+Pj4gSSBleHBlY3QgdGhhdCBjb21wb3NpdGVfc2V0dXAo
KSBhbmQgdGh1cyBmLT5zZXR1cCgpIHJ1biB3aGVuIHRoZQo+Pj4gU0VUVVAgcGFja2V0IGhhcyBh
cnJpdmVkLCB0aHVzIGJlZm9yZSB0aGUgZGF0YSBwYWNrZXQgYXJyaXZlcywgYW5kIGlmCj4+PiBj
b21wb3NpdGVfc2V0dXAoKSBzdGFsbHMgdGhlbiB0aGUgZGV2aWNlL2Z1bmN0aW9uIHNob3VsZCBu
ZXZlciBzZWUgdGhlCj4+PiBkYXRhIHBhY2tldC4KPj4+Cj4+PiBGb3IgYW4gT1VUIHRyYW5zYWN0
aW9uIEkgdGhpbmsgdGhlIGhvc3QgY29udHJvbGxlciBtaWdodCBzdGlsbCBzZW5kCj4+PiB0aGUg
REFUQSBwYWNrZXQsIGJ1dCB0aGUgZGV2aWNlIGNvbnRyb2xsZXJzIHRoYXQgSSBrbm93IGRvbid0
IG1ha2UgaXQKPj4+IHZpc2libGUgdG8gdGhlIGFwcGxpY2F0aW9uIGluIHRoYXQgY2FzZS4KPj4K
Pj4gLi4uCj4+Cj4+IEFyZSB5b3UgZ3V5cyBpbnRlcmVzdGVkIGluIGNvbW1lbnRzIGZyb20gb3Ro
ZXIgcGVvcGxlIHdobyBrbm93IG1vcmUKPj4gYWJvdXQgdGhlIGtlcm5lbCBhbmQgaG93IGl0IHdv
cmtzIHdpdGggVVNCPwo+IAo+IEFic29sdXRlbHksIEkgd2FudCBzb21ldGhpbmcgdGhhdHMgd29y
a3Mgd2VsbCBpbiB0aGUga2VybmVsIGFuZCBkb2Vzbid0Cj4gbG9vayBvZGQgdG8ga2VybmVsIFVT
QiBwZW9wbGUuCj4gCj4+IFlvdXIgbWVzc2FnZXMgaGF2ZSBiZWVuCj4+IGZhciB0b28gbG9uZyB0
byBnbyBpbnRvIGluIGFueSBkZXRhaWwsIGJ1dCBJIHdpbGwgYWRkcmVzcyB0aGlzIG9uZSBpc3N1
ZS4KPj4KPj4gVGhlIFVTQiBwcm90b2NvbCBmb3JiaWRzIGEgZGV2aWNlIGZyb20gc2VuZGluZyBh
IFNUQUxMIHJlc3BvbnNlIHRvIGEKPj4gU0VUVVAgcGFja2V0LiAgVGhlIG9ubHkgdmFsaWQgcmVz
cG9uc2UgaXMgQUNLLiAgVGh1cywgdGhlcmUgaXMgbm8gd2F5Cj4+IHRvIHByZXZlbnQgdGhlIGhv
c3QgZnJvbSBzZW5kaW5nIGl0cyBEQVRBIHBhY2tldCBmb3IgYSBjb250cm9sLU9VVAo+PiB0cmFu
c2Zlci4KPj4KPj4gQSBnYWRnZXQgZHJpdmVyIGNhbiBTVEFMTCBpbiByZXNwb25zZSB0byBhIGNv
bnRyb2wtT1VUIGRhdGEgcGFja2V0LAo+PiBidXQgb25seSBiZWZvcmUgaXQgaGFzIHNlZW4gdGhl
IHBhY2tldC4gIE9uY2UgdGhlIGRyaXZlciBrbm93cyB3aGF0Cj4+IHRoZSBkYXRhIHBhY2tldCBj
b250YWlucywgdGhlIGdhZGdldCBBUEkgZG9lc24ndCBwcm92aWRlIGFueSB3YXkgdG8KPj4gU1RB
TEwgdGhlIHN0YXR1cyBzdGFnZS4gIFRoZXJlIGhhcyBiZWVuIGEgcHJvcG9zYWwgdG8gY2hhbmdl
IHRoZSBBUEkKPj4gdG8gbWFrZSB0aGlzIHBvc3NpYmxlLCBidXQgc28gZmFyIGl0IGhhc24ndCBn
b25lIGZvcndhcmQuCj4+Cj4gCj4gVGhpcyBjb25maXJtcyB3aGF0IEkgaGF2ZSBzZWVuIGluIHRo
ZSBrZXJuZWwgYW5kIHRoZSByZWFzb24gSSBhZGRlZCBhCj4gc3RhdHVzIHJlcXVlc3Qgc28gSSBj
YW4ga25vdyB0aGUgcmVzdWx0IG9mIHRoZSBvcGVyYXRpb24gdGhlIGRldmljZSBoYXMKPiBwZXJm
b3JtZWQuCj4gCj4gSSBoYXZlIGEgcHJvYmxlbSB0aGF0IEkndmUgZW5jb3VudGVyZWQgd2l0aCB0
aGlzIHN0YXR1cyByZXF1ZXN0Lgo+IEluIG15IGZpcnN0IHZlcnNpb24gdGhlIGdhZGdldCB3b3Vs
ZCB1c2JfZXBfcXVldWUoKSB0aGUgc3RhdHVzIHZhbHVlCj4gd2hlbiB0aGUgb3BlcmF0aW9uIHdh
cyBkb25lIGFuZCBhcyBsb25nIGFzIHRoaXMgaGFwcGVuZGVkIHdpdGhpbiB0aGUKPiBob3N0IHRp
bWVvdXQgKDVzKSBldmVyeXRoaW5nIHdvcmtlZCBmaW5lLgo+IAo+IFRoZW4gSSBoaXQgYSAxMHMg
dGltZW91dCBpbiB0aGUgZ2FkZ2V0IHdoZW4gcGVyZm9ybWluZyBhIGRpc3BsYXkgbW9kZXNldAo+
IG9wZXJhdGlvbiAod2FpdCBvbiBtaXNzaW5nIHZibGFuaykuIFRoZSByZXN1bHQgb2YgdGhpcyB3
YXMgdGhhdCB0aGUgaG9zdAo+IHRpbWVkIG91dCBhbmQgbW92ZWQgb24uIFRoZSBnYWRnZXQgaG93
ZXZlciBkaWRuJ3Qga25vdyB0aGF0IHRoZSBob3N0Cj4gZ2F2ZSB1cCwgc28gaXQgcXVldWVkIHVw
IHRoZSBzdGF0dXMgdmFsdWUuIFRoZSByZXN1bHQgb2YgdGhpcyB3YXMgdGhhdAo+IGFsbCBmdXJ0
aGVyIHJlcXVlc3RzIGZyb20gdGhlIGhvc3Qgd291bGQgdGltZSBvdXQuCj4gRG8geW91IGtub3cg
YSBzb2x1dGlvbiB0byB0aGlzPwo+IE15IHdvcmsgYXJvdW5kIGlzIHRvIGp1c3QgcG9sbCBvbiB0
aGUgc3RhdHVzIHJlcXVlc3QsIHdoaWNoIHJldHVybnMgYQo+IHZhbHVlIGltbWVkaWF0ZWx5LCB1
bnRpbCB0aGVyZSdzIGEgcmVzdWx0LiBUaGUgdWRjIGRyaXZlciBJIHVzZSBpcyBkd2MyLgo+IAoK
SSBoYXZlIG5vdyB0cmllZCB0aGlzIG9uIGEgQmVhZ2xlYm9uZSBCbGFjayAobXVzYiB1ZGMgZHJp
dmVyKSBhbmQgaXQKd29ya3MganVzdCBmaW5lIHRoZXJlIChpdCBkaXNwbGF5cyBhbiBlcnJvciBt
ZXNzYWdlIG9uIHRoZSBuZXh0CnJlcXVlc3QpLiBTbyBpdCBoYXMgdG8gYmUgYSBkd2MyIGRyaXZl
ciBwcm9ibGVtLiBJIHdpbGwgdHJ5IGFuZCBjaGFzZQpkb3duIHRoaXMgcHJvYmxlbSB3aGVuIEkg
Z2V0IHRoZSB0aW1lLgoKVGhpcyBtZWFucyBJIGRvbid0IG5lZWQgdGhpcyBzdGF0dXMgcmVxdWVz
dCBwb2xsaW5nIGluIG15IGhvc3QgZHJpdmVyLgoKTm9yYWxmLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
