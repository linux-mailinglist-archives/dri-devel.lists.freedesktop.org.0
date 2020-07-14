Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A593421FB9E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 21:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06366E7D4;
	Tue, 14 Jul 2020 19:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47386E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jYOAxBElB2/VtC11UlU4NG+pCqdfn6MRvdxsT+SXLg=; b=k06IJ9MrtUQG9uhCssW2lWio6s
 bMdQeeMGD58IY3i2kuSOpdO0hhB7C3injmzNN4Xv122eRi0u26iM80ISj+IadXqzZgoMd99gZ8/zC
 7axRAXKow5BeMrmfdkKuGFX8OgTWG0OSrd/5BNPzF8cpYm7cesrASTPnJeFnmwASn2+mqGsvUAs+b
 KRgvDuXADEb6xg1U3F41wGY5+fNTW6Ps+HM0Fk99N6/8e7b1ZJ8dR9hAUiksGAxTFKAoJQA8xvW38
 11yw2r7NH6byRp+CpOvbedZq4AWr6EBT/sK4exY0Ggavu+klY5esLTkO+Pg/RzBj3OtwCh1zf/toK
 wcCJ/ZCg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59395
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jvQCz-00025u-LN; Tue, 14 Jul 2020 21:03:17 +0200
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
Date: Tue, 14 Jul 2020 21:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714174008.16272.qmail@stuge.se>
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, balbi@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDcuMjAyMCAxOS40MCwgc2tyZXYgUGV0ZXIgU3R1Z2U6Cj4gSGkgTm9yYWxmLAo+
IAo+IE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIFNF
VF9CVUZGRVIgcmVxdWVzdCBzaW5jZSBpdCB3aWxsIHNlcnZlIGFzIGEKPj4gc3luY2luZyBwb2lu
dCBiZXR3ZWVuIHRoZSBob3N0IGFuZCB0aGUgZGV2aWNlLiBJJ20gbm8gVVNCIGV4cGVydCBidXQg
SQo+PiBhc3N1bWUgdGhhdCBhIGJ1bGsgdHJhbnNmZXIgY2FuIGZhaWwgaGFsZndheSB0aHJvdWdo
IGFuZCByZXN1bHQgaW4gdGhlCj4+IG5leHQgdXBkYXRlIHN0YXJ0aW5nIHdoZXJlIHRoZSBwcmV2
aW91cyBvbmUgZmFpbGVkIGFuZCB0aHVzIHdyaXRpbmcKPj4gYmV5b25kIHRoZSBlbmQgb2YgdGhl
IGRpc3BsYXkgYnVmZmVyLgo+IAo+IFRyYW5zZmVycyBlaXRoZXIgc3VjY2VlZCBjb21wbGV0ZWx5
IChwb3NzaWJseSBhZnRlciBtYW55IHJldHJpZXMpLAo+IHRpbWUgb3V0IChhZnRlciB6ZXJvIG9y
IG1vcmUgdHJhbnNmZXJlZCBieXRlcykgb3IgZmFpbCBjYXRhc3Ryb3BoaWNhbGx5Cj4gKGUuZy4g
ZnJvbSBkZXZpY2UgZGlzY29ubmVjdCkuCj4gCj4gSW4gYWxsIGNhc2VzLCB0aGUgZHJpdmVyIG9u
IHRoZSBob3N0IGtub3dzL2hhcyBhdmFpbGFibGUgaG93IG1hbnkgYnl0ZXMKPiB3ZXJlIHN1Y2Nl
c3NmdWxseSB0cmFuc2ZlcmVkLgo+IAoKSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhlIGRldmljZSwg
dGhhdCBpdCBjb3VsZCBnZXQgb3V0IG9mIHN5bmMuIExldCdzCnNheSB0aGUgaG9zdCBzZW5kcyBh
IDFrIGZyYW1lYnVmZmVyIGFuZCBoYWxmIG9mIGl0IGdldHMgdHJhbnNmZXJyZWQgYW5kCnRoZSBy
ZXN0IGZhaWxzIGZvciBzb21lIHJlYXNvbi4gTHVib21pcidzIE1DVSBpbXBsZW1lbnRhdGlvbiBo
YXMgYW4KZW5kcG9pbnQgbWF4IHNpemUgb2YgNjQgYnl0ZXMgYW5kIGEgY2FsbGJhY2sgaXMgY2Fs
bGVkIGZvciBlYWNoIHBhY2tldC4KSWYgdGhlIDFrIHRyYW5zZmVyIGZhaWxzIGF0IHNvbWUgcG9p
bnQsIHdpbGwgdGhlIGRldmljZSBiZSBhYmxlIHRvCmRldGVjdCB0aGlzIGFuZCBrbm93IHRoYXQg
dGhlIG5leHQgdGltZSB0aGUgcnggY2FsbGJhY2sgaXMgY2FsbGVkIHRoYXQKdGhpcyBpcyB0aGUg
c3RhcnQgb2YgYSBuZXcgZnJhbWVidWZmZXIgdXBkYXRlPwoKTm9yYWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
