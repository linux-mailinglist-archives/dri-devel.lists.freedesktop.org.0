Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AFD7198B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E889F6E27A;
	Tue, 23 Jul 2019 13:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AD66E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:41:18 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61115
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpv2a-00049f-Aj; Tue, 23 Jul 2019 15:41:16 +0200
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
To: Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>
References: <20190720134709.15186-1-noralf@tronnes.org>
 <877e8aeyg8.fsf@anholt.net> <20190723071037.GS15868@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7de2c39b-20b6-b735-405c-bf89f58c2736@tronnes.org>
Date: Tue, 23 Jul 2019 15:41:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723071037.GS15868@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=ZrvqDx+4YMcQO/dhB00znSIol7VjxsCpJ+BhQ+AawQQ=; 
 b=cI/pxN0hdG4N9D5EM5I7VaKeXbEY2miNMq6B0RM2E/Xfsf4C2z+vlZPy5O2FfQYvQGynammx4IlWxBjlMtkrYctRROYtv8DFdSeyWRZPH1Pg6GK0ZlVEcbv/a0hFx+P8+mOAC698sBNfgw3xiUfHqG7ZbY/fm6d4qj4H5E3T+buOg9bOZVjIdkqaq9J5OuFkdws85M1dQYEi7aTVXbq50KY1jvb+thSDCjvN2CL8nlAcPYJYemouEzSURvdh5AGjkl27bRg7O/8V4jaPslJZ3rX5NZPwR8+FB3h2L4rprtG1CpZQhFnJclQwoXsyYLgHCKWIf4/0O2olwg0FvZ4Saw==;
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjMuMDcuMjAxOSAwOS4xMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBNb24sIEp1
bCAyMiwgMjAxOSBhdCAxMTowNjoxNUFNIC0wNzAwLCBFcmljIEFuaG9sdCB3cm90ZToKPj4gTm9y
YWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyaXRlczoKPj4KPj4+IFRoaXMgc2Vy
aWVzIHRpY2tzIG9mZiB0aGUgbGFzdCB0aW55ZHJtIHRvZG8gZW50cnkgYW5kIG1vdmVzIG91dCBt
aXBpX2RiaQo+Pj4gdG8gYmUgYSBjb3JlIGhlbHBlci4KPj4+Cj4+PiBJdCBzcGxpdHMgc3RydWN0
IG1pcGlfZGJpIGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlzcGxheSBwaXBlbGluZQo+
Pj4gcGFydCAodXBsb2FkIGZyYW1lYnVmZmVyIG92ZXIgU1BJKS4gSSBhbHNvIHRvb2sgdGhlIG9w
cG9ydHVuaXR5IHRvCj4+PiByZW5hbWUgdGhlIGFtYmlndW91cyAnbWlwaScgdmFyaWFibGUgbmFt
ZSB0byAnZGJpJy4gVGhpcyBsaW5lcyB1cCB3aXRoCj4+PiB0aGUgdXNlIG9mIHRoZSAnZHNpJyB2
YXJpYWJsZSBuYW1lIGluIHRoZSBNSVBJIERTSSBoZWxwZXIuCj4+Pgo+Pj4gTm90ZToKPj4+IFRo
aXMgZGVwZW5kcyBvbiBzZXJpZXM6IGRybS90aW55ZHJtOiBSZW1vdmUgdGlueWRybS5rbwo+Pj4K
Pj4+IFNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L25vdHJvL2xpbnV4L3RyZWUvbW92ZV9taXBpX2RiaQo+Pgo+PiBDb25ncmF0dWxhdGlvbnMgb24g
bWFraW5nIGl0IHRvIHRoaXMgc3RhZ2UuICBUaGlzIGxvb2tzIGxpa2UgYSBmaW5lCj4+IGNvbmNs
dXNpb24gdG8gdGlueWRybS4KPj4KPj4gQWNrZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9s
dC5uZXQ+Cj4gCj4gWWVhaCBsZXQgbWUgaGVhcCBvbiB0aGUgY29uZ3JhdHMgdG9vLCB0aGlzIGhh
cyBiZW4gYSBsb25nIGJ1dCByZWFsbHkKPiBpbXByZXNzaXZlIGpvdXJuZXkgdG8gd2F0Y2ghCgpM
b29raW5nIGJhY2sgaXQncyBzdXByaXNpbmcgdG8gbWUgdGhhdCBJIGNvbnRpbnVlZCB0byB3b3Jr
IG9uIHRoaXMuCkFmdGVyIExpbnVzIHRvb2sgYSBkdW1wIG9uIHRpbnlkcm0gSSB3YXNuJ3QgbXVj
aCBpbnRlcmVzdGVkIGluIGRvaW5nIGFueQpmdXJ0aGVyIHdvcmsgb24gTGludXgsIHRoZXJlIGFy
ZSBsb3RzIG9mIG90aGVyIGludGVyZXN0aW5nIHByb2plY3RzIHRvCndvcmsgb24uIFRoZW4geW91
IGNjJ2VkIG1lIG9uIGEgcGF0Y2ggdGVsbGluZyBtZSB0aGF0IHNvbWVvbmUgd2FzIHVzaW5nCnRo
ZSBzaW1wbGUgZGlzcGxheSBoZWxwZXIgSSBtYWRlLCBhbmQgYmVmb3JlIEkga25ldyBpdCBJIHdh
cyBrbmVlIGRlZXAKaW4gcmVmYWN0b3Jpbmcgd29yay4KCk9uZSBiaWcgdGFrZSBhd2F5IGZvciBt
ZSBoYXMgYmVlbiBob3cgbXVjaCBiZXR0ZXIgbXkgY29kZSBiZWNvbWVzIGFmdGVyCmdvaW5nIHRo
cm91Z2ggYSByZXZpZXcgcHJvY2Vzcy4gU29tZSB0aW1lcywgbG9va2luZyBiYWNrLCBJIHdvbmRl
ciAtIGRpZApJIGFjdHVhbGx5IHdyaXRlIHRoYXQgbmljZSBwaWVjZSBvZiBjb2RlPyBBbmQgdGhl
IHJlYWwgYW5zd2VyIEkgZ3Vlc3MgaXMKdGhhdCBJIGRpZCB0aGUgdHlwaW5nIGFuZCBvZnRlbiBo
YWQgdGhlIGlkZWEsIGJ1dCBtYW55IHRpbWVzIHRoZSBmbGVzaGVkCm91dCBzb2x1dGlvbiB3YXMg
bm90IHNvbWV0aGluZyB0aGF0IEkgY2FtZSB1cCB3aXRoLgoKTm9yYWxmLgoKPiAtRGFuaWVsCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
