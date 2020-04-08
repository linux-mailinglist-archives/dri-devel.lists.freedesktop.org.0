Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB91A239B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 15:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97096EA66;
	Wed,  8 Apr 2020 13:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9E6EA66
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 13:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 909933F2F4;
 Wed,  8 Apr 2020 15:49:58 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Ys5N1rTp";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbFYH2wiCcB4; Wed,  8 Apr 2020 15:49:57 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3AAA83F234;
 Wed,  8 Apr 2020 15:49:55 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5EB8A360153;
 Wed,  8 Apr 2020 15:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586353795; bh=uKP1bbt2lQ/6DJwo/xx+8WkBUyNuuTZmAZi4smVVL4k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Ys5N1rTp9cN8d4To8nqSZro7FdC26M95VGzDpib/VMWVJAUHdGbuffnnuYEOsUy9c
 BNeZc32y3LuOTrDwxupDvhSgMnaq0VnBGSS6i/ySm9uSxm3suGtIfYKMhKWu/IQ/bW
 2LaCqg9VKx3YwBCyigM/ljdQqsrbvl3Nq/3k2CCw=
Subject: Re: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20200408115331.5529-1-thomas_os@shipmail.org>
 <f7408653-39a1-e234-c45d-7a786e043b8f@shipmail.org>
 <67f24846-0063-d435-1423-3cab8744854d@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <9832f388-2227-8eb6-5a31-5cf38012eeff@shipmail.org>
Date: Wed, 8 Apr 2020 15:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <67f24846-0063-d435-1423-3cab8744854d@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC84LzIwIDI6MTkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMDguMDQuMjAg
dW0gMTQ6MDEgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToKPj4gSGksIENocmlz
dGlhbiwKPj4KPj4gT24gNC84LzIwIDE6NTMgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IHdyb3RlOgo+Pj4gRnJvbTogIlRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkiIDx0aG9tYXNfb3NA
c2hpcG1haWwub3JnPgo+Pj4KPj4+IFdpdGggYW1kZ3B1IGFuZCBDT05GSUdfVFJBTlNQQVJFTlRf
SFVHRVBBR0VfQUxXQVlTPXksIHRoZXJlIGFyZQo+Pj4gZXJyb3JzIGxpa2U6Cj4+PiBCVUc6IG5v
bi16ZXJvIHBndGFibGVzX2J5dGVzIG9uIGZyZWVpbmcgbW0KPj4+IGFuZDoKPj4+IEJVRzogQmFk
IHJzcy1jb3VudGVyIHN0YXRlCj4+PiB3aXRoIFRUTSB0cmFuc3BhcmVudCBodWdlLXBhZ2VzLgo+
Pj4gVW50aWwgd2UndmUgZmlndXJlZCBvdXQgd2hhdCBvdGhlciBUVE0gZHJpdmVycyBkbyBkaWZm
ZXJlbnRseSAKPj4+IGNvbXBhcmVkIHRvCj4+PiB2bXdnZngsIGRpc2FibGUgdGhlIGh1Z2VfZmF1
bHQoKSBjYWxsYmFjaywgZWxpbWluYXRpbmcgdHJhbnNodWdlCj4+PiBwYWdlLXRhYmxlIGVudHJp
ZXMuCj4+Pgo+Pj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkgPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+Cj4+PiBSZXBvcnRlZC1ieTogQWxleCBYdSAoSGVsbG83MSkgPGFsZXhf
eV94dUB5YWhvby5jYT4KPj4+IFRlc3RlZC1ieTogQWxleCBYdSAoSGVsbG83MSkgPGFsZXhfeV94
dUB5YWhvby5jYT4KPgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4KPj4+IC0tLQo+Pgo+PiBXaXRob3V0IGJlaW5nIGFibGUgdG8gdGVzdCBh
bmQgdHJhY2sgdGhpcyBkb3duIG9uIGFtZGdwdSB0aGVyZSdzIAo+PiBsaXR0bGUgbW9yZSB0aGFu
IHRoaXMgSSBjYW4gZG8gYXQgdGhlIG1vbWVudC4gSG9wZWZ1bGx5IEknbGwgYmUgYWJsZSAKPj4g
dG8gdGVzdCBvbiBub3V2ZWF1L3R0bSBhZnRlciBnZXR0aW5nIGJhY2sgZnJvbSB2YWNhdGlvbiB0
byBzZWUgaWYgSSAKPj4gY2FuIHJlcHJvZHVjZS4KPj4KPj4gSXQgbG9va3MgbGlrZSBzb21lIHBh
cnQgb2YgdGhlIGtlcm5lbCBtaXN0YWtlcyBhIGh1Z2UgcGFnZS10YWJsZSAKPj4gZW50cnkgZm9y
IGEgcGFnZSBkaXJlY3RvcnksIGFuZCB0aGF0IHdvdWxkIGJlIGEgcGF0aCB0aGF0IGlzIG5vdCBo
aXQgCj4+IHdpdGggdm13Z2Z4Lgo+Cj4gV2VsbCB0aGF0IGxvb2tzIGxpa2UgYW4gdWdseSBvbmUg
YW5kIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIAo+IHBhZ2UgdGFibGUgaGFuZGxpbmcg
dG8gaHVudCB0aGlzIGRvd24gZWl0aGVyLgo+Cj4gQlRXOiBIYXZlIHlvdSBzZWVuIHRoZSBjb3Zl
cml0eSB3YXJuaW5nIGFib3V0wqAgIldBUk5fT05fT05DRShyZXQgPSAKPiBWTV9GQVVMVF9GQUxM
QkFDSyk7Ij8KClllcywgdGhhdCdzIGEgZmFsc2Ugd2FybmluZyBidXQgaXQgbWlnaHQgYmUgdGhh
dCBpdCBzaG91bGQgYmUgcmV3cml0dGVuIApmb3IgY2xhcml0eSBsaWtlIHNvOgoKcmV0ID0gVk1f
RkFVTFRfRkFMTEJBQ0s7CldBUk5fT05fT05DRSh0cnVlKTsKCi9UaG9tYXMKCgoKPgo+IFJlZ2Fy
ZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IC9UaG9tYXMKPj4KPj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
