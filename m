Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357C7FBF0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706C6ED38;
	Fri,  2 Aug 2019 14:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7216ED38
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 14:19:44 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57771
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1htYPF-0002P3-Su; Fri, 02 Aug 2019 16:19:41 +0200
Subject: Re: [PATCH 2/4] drm/tiny/ili9341: Move driver to drm/panel
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-3-noralf@tronnes.org>
 <5df3aeec-3793-33e1-df4f-73c470c28db3@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8a6e9d75-c16a-ffb1-7ac9-b3c9562af2f6@tronnes.org>
Date: Fri, 2 Aug 2019 16:19:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5df3aeec-3793-33e1-df4f-73c470c28db3@lechnology.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=oJM5Ou+Td4VYKfJhe/VIpg5Z0UGLjcVo7Df9je5ldyQ=; 
 b=Lfg3eB7Q41p705Vmxq++hItVM++7wUtA3FFaEWCv3CKvqBHkHQSild/SPaGd/6NlSg0iVtdYMcWYXoSDg1pLaWVzas6tAFqbI7EatsS2WTYqIBRNrvCQv4eaaXzPSMaI37IU8fMOejl9nsRiYvmQRjJRR1NL7zlWqUbnAyCJkCgyIHqNBifzQZiMnwE2daZBTBgm71dNozttObz0pABpSvdl28Bsgcxo4jh8iIY9wnCIPalHKACkke6HSgce+19aV5ymzvJ6QyITKjpPoqOZEHgPiVZ2LlNrFSGDMpsHCi7+1u7SErvILsj7wrT6a2a5gJQppX5G+XmPiOO0LCF7gA==;
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDEuMDguMjAxOSAyMS40Mywgc2tyZXYgRGF2aWQgTGVjaG5lcjoKPiBPbiA4LzEvMTkg
ODo1MiBBTSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+PiBNb3ZlIHRoZSBkcml2ZXIgdG8gZHJt
L3BhbmVsIGFuZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUgbmV3IHBhbmVsIHN1cHBvcnQKPj4gaW4g
ZHJtX21pcGlfZGJpLiBDaGFuZ2UgdGhlIGZpbGUgbmFtZSB0byBtYXRjaCB0aGUgbmFtaW5nIHN0
YW5kYXJkIGluCj4+IGRybS9wYW5lbC4gVGhlIERSTSBkcml2ZXIgbmFtZSBpcyBrZXB0IHNpbmNl
IGl0IGlzIEFCSS4KPj4KPj4gQWRkIG1pc3NpbmcgTUFJTlRBSU5FUlMgZW50cnkuCj4+Cj4+IENj
OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4+IC0tLQo+IAo+IFJldmlld2Vk
LWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPiAKPiBBbHRob3VnaCwg
SSB3aWxsIHNheSB0aGF0IHRoZSB3YXkgdGhlIGRpZmYgY2FtZSBvdXQsIGl0IG1ha2VzIGl0IGEg
Yml0Cj4gaGFyZCB0byBmb2xsb3cgdGhlIHBhdGNoLCBzbyBtb3JlIG1vcmUgZGV0YWlscyBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UgYWJvdXQKPiB0aGUgc3BlY2lmaWMgY2hhbmdlcyBjb3VsZCBiZSBo
ZWxwZnVsLgoKT2gsIEkgYWN0dWFsbHkgbGlrZWQgaG93IHRoZSBkaWZmIGNhbWUgb3V0LCBzaW5j
ZSBJIGZvdW5kIGl0IGVhc3kgdG8gc2VlCmhvdyB0aGUgZHJpdmVycyBkaWZmZXJlZC4gQnV0IHRo
ZW4gYWdhaW4sIEkgaGF2ZSBoYXZlIHRoZSBjb2RlIGZyZXNoIGluCm15IGJyYWluIGNhY2hlIHNv
IHRoYXQgbWlnaHQgbWFrZSBhIGRpZmZlcmVuY2UgaW4gaG93IGl0IGxvb2tzLgoKSSBjYW4gZXhw
YW5kIHRoZSBjb21taXQgbWVzc2FnZS4KCkkgYWxzbyBzZWUgdGhhdCBJIGhhdmUgbW92ZWQgdGhl
IGRldmljZSB0YWJsZXMsIG1heWJlIEkgc2hvdWxkIG1vdmUgdGhlbQpiYWNrIHdoZXJlIHRoZXkg
d2hlcmUgb3JpZ2luYWxseSBzbyB0aGV5IGFyZSBjbG9zZXIgdG8gdGhlIGNvbmZpZ3MgdGhleQpy
ZWZlciB0by4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
