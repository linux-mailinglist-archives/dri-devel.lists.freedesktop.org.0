Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF71327484
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 22:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062656E3AC;
	Sun, 28 Feb 2021 21:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316C56E3AC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0MXwH6FHHu6zd6OcezB6lg1gPu4rqv9Y1Ez4KIqcvM=; b=lWtyJwv06uXOWNBKwdnnrr35lT
 CtGGQA4Z/WoCalxGRwoouw9lHBH5U3xa5lzeX5M2vBCgWJPsWV5WLL29a1rByMTZlEKBtBPdAKxKn
 0nhowNW3jQWYiLHxSqVTUwbZ2XawtDQxZAeVnJ0dIgUMWY7bNI+p//ZYtUbVSF01nl0iKnXHhOZoe
 1R928Mgyea+YsrYxnjyBF2Nkq4qP9Wk66Wp13LyG/7cu7gbpUw9qLMqm6t7CTClEtoIAoQLdzIM7T
 g8Hyzvd8DWLjybPfbMbpg+WHGN7q683uP+ud1e/0OjMB70FbI/hUpYd7FLHALn94L2VvvoEYkDACL
 LeYkEaDw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56877
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lGTF6-000554-Hl; Sun, 28 Feb 2021 22:04:44 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210219214243.11330.qmail@stuge.se>
 <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
 <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
 <20210228015209.3252.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <230829ee-4bf1-7211-d0a3-2ec07fdcd1c1@tronnes.org>
Date: Sun, 28 Feb 2021 22:04:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228015209.3252.qmail@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjguMDIuMjAyMSAwMi41Miwgc2tyZXYgUGV0ZXIgU3R1Z2U6Cj4gTm9yYWxmIFRyw7hu
bmVzIHdyb3RlOgo+PiBQZXRlciwgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgZGlmZiBhbmQg
c2VlIGlmIEknbSBvbiB0aGUgcmlnaHQgdHJhY2sKPj4gaGVyZTogaHR0cHM6Ly9naXN0LmdpdGh1
Yi5jb20vbm90cm8vYTQzYTkzYTNhYTBjYzc1ZDkzMDg5MGI3YjI1NGZjMGEKPiAKPiBZZXMgdGhh
dCdzIGV4YWN0bHkgd2hhdCBJIG1lYW50OyB0aGlzIHdheSB0aGUgcG9zc2liaWxpdHkgZm9yIGNv
bnRyYWRpY3RpbmcKPiBzaXplcyBpcyBlbGltaW5hdGVkIGJ5IHByb3RvY29sIGFuZCBub3QganVz
dCBieSBpbXBsZW1lbnRhdGlvbiAtIHZlcnkgbmljZSEKPiAKPiBTb21lIG1vcmUgY29tbWVudHMs
IHNvcnJ5IGlmIHRoaXMgaXMganVzdCBiZWNhdXNlIG9mIG9uZ29pbmcgd29yazoKPiAKPiBQZXJo
YXBzIHRoZSBmdW5jdGlvbnMgdGFraW5nIHVzYl9kZXZpY2UgKyBpZm51bSBjb3VsZCB0YWtlIHVz
Yl9pbnRlcmZhY2UKPiBpbnN0ZWFkIC0gYnV0IEkgZG9uJ3Qga25vdyBpZiB0aGF0IHdvdWxkIHNp
bXBsaWZ5IG9yIGNvbXBsaWNhdGUgdGhpbmdzLgo+IEFsYW4gbWVudGlvbmVkIHRoaXMgaWRlYSBp
biBzaW1pbGFyIGNpcmN1bXN0YW5jZXMgaW4gYW5vdGhlciB0aHJlYWQuCj4gSSBkb24ndCBmZWVs
IHN0cm9uZ2x5LCBidXQgcGVyaGFwcyBpdCdzIGNsZWFuZXIuCj4gCgpJIGFncmVlIGl0J3MgY2xl
YW5lciwgdGhpcyB3YXkgSSBkb24ndCBoYXZlIHRvIHN0b3JlIHRoZSBpbnRlcmZhY2UKbnVtYmVy
IGluIGdkcm0uCgo+IGd1ZF91c2JfY29udHJvbF9tc2coKSBub3cgc2VlbXMgYWxtb3N0IHJlZHVu
ZGFudCwgbWF5YmUgaXQgY291bGQgYmUgcmVtb3ZlZC4KPiAKClRoZXJlIGFyZSA0IGNhbGxlcnMg
c28gSSB0aGluayBpdCBtYWtlcyBzZW5zZSBzdGlsbC4KCj4gSW4gZ3VkX3VzYl9zZXQoKSBpZiBO
VUxMID09IGJ1ZiB0aGVuIHRoYXQncyBwYXNzZWQgdG8gdXNiX2NvbnRyb2xfbXNnKCkKPiBhbG9u
ZyB3aXRoIGxlbiwgd2hpY2ggbGlrZWx5IGNyYXNoZXMgaWYgbGVuID4gMCwgc28gaXQgbWF5IGJl
IGdvb2QgdG8KPiBjaGVjayBvciBlbmZvcmNlIHRoYXQsIG1heWJlIHdpdGggZWxzZSBsZW49MDsg
YmVmb3JlIHRoZSBndWRfdXNiX3RyYW5zZmVyKCkKPiBjYWxsLgo+IAoKT2suCgo+IEZpbmFsbHkg
YSBzbWFsbCBzdHlsZSBub3RlIHRoYXQgSSdkIHBlcnNvbmFsbHkgY2hhbmdlIGEgZmV3IGlmIChy
ZXQgPiAwKSB7Cj4gYmxvY2tzIHRvIGhhdmUgb25lIGluZGVudCBsZXZlbCBsZXNzIGFuZCBkbyBl
YWNoIGNoZWNrIHJpZ2h0IGF3YXksIGUuZy4gaW4KPiBndWRfY29ubmVjdG9yX2dldF9tb2Rlcygp
Ogo+IAo+IHJldCA9IGd1ZF91c2JfZ2V0KCkKPiBpZiAocmV0ICUgRURJRF9MRU5HVEgpIHsKPiAJ
ZHJtX2VycigpOwo+IH0gZWxzZSBpZiAocmV0ID4gMCkgewo+IAllZGlkX2N0eC5sZW4gPSByZXQ7
Cj4gCWVkaWQgPSBkcm1fZG9fZ2V0X2VkaWQoKTsKPiB9Cj4gCj4gYW5kIGxhdGVyIG9uIGluIHRo
ZSBmdW5jdGlvbiBieSB0aGUgZGlzcGxheSBtb2RlcyBvbmUgaW5kZW50IGxldmVsCj4gY291bGQg
YmUgc2F2ZWQgd2l0aCBhIGdvdG86Cj4gCj4gaWYgKHJldCA8PSAwKQo+IAlnb3RvIG91dDsKPiAK
PiBidXQgb2J2aW91c2x5IG5vIGh1Z2UgZGVhbC4KPiAKCkl0IG1ha2VzIGZvciBhIGJldHRlciBy
ZWFkIHNvIEknbGwgZG8gdGhhdC4KCj4gCj4gSW4gZ2VuZXJhbCBpdCdzIHJlYWxseSBoZWxwZnVs
IGZvciBkZXZpY2UgZGV2ZWxvcG1lbnQgdG8gc2VlIGVycm9yIG1lc3NhZ2VzCj4gd2hlbiB0aGUg
ZGV2aWNlIGJlaGF2ZXMgaW5jb3JyZWN0bHksIHRoZSAiSW52YWxpZCAuLiBzaXplIiBlcnJvcnMg
YXJlIGdyZWF0Cj4gZXhhbXBsZXMgb2YgdGhpcywgYnV0IGUuZy4gZ3VkX2dldF9kaXNwbGF5X2Rl
c2NyaXB0b3IoKSByZXR1cm5zIC1FSU8gd2l0aG91dAo+IGEgbWVzc2FnZS4gTWF5YmUgdGhlcmUg
YXJlIG9wcG9ydHVuaXRpZXMgZm9yIGZ1cnRoZXIgaGVscGZ1bCBlcnJvciBtZXNzYWdlcz8KPiAK
ClRoZSBtZXNzYWdlIGlzIHByaW50ZWQgYnkgdGhlIGNhbGxlcjoKCglyZXQgPSBndWRfZ2V0X2Rp
c3BsYXlfZGVzY3JpcHRvcihpbnRmLCAmZGVzYyk7CglpZiAocmV0KSB7CgkJRFJNX0RFVl9ERUJV
R19EUklWRVIoZGV2LCAiTm90IGEgZGlzcGxheSBpbnRlcmZhY2U6IHJldD0lZFxuIiwgcmV0KTsK
CQlyZXR1cm4gLUVOT0RFVjsKCX0KCkl0J3MgYSBkZWJ1ZyBtZXNzYWdlIGVuYWJsZWQgYnkgd3Jp
dGluZyB0byAvc3lzL21vZHVsZS9kcm0vcGFyYW1ldGVycy9kZWJ1Zy4KVGhlIHJlYXNvbiBmb3Ig
bm90IG1ha2luZyBpdCBhbiBlcnJvciBtZXNzYWdlLCBpcyB0aGF0IEkgd2FudCB0aGUgZHJpdmVy
CnRvIGp1c3QgaWdub3JlIG5vbi1kaXNwbGF5IHZlbmRvciBjbGFzcyBpbnRlcmZhY2VzIHNvIHRo
ZXkgY2FuIGNvLWV4aXN0Cm9uIHRoZSBkZXZpY2UuIFNvbWVvbmUgbWlnaHQgbWFrZSBhbiBvcGVu
IHByb3RvY29sIGdwaW8gKHZlbmRvciBjbGFzcykKaW50ZXJmYWNlIGRyaXZlciBzb21lIGRheSwg
b3IgYWRjLCBpMmMsIHNwaSwgcnRjLCBvci4uLgoKVGhhbmtzLApOb3JhbGYuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
