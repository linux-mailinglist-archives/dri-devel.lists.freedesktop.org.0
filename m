Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7734452
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 12:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB9789199;
	Tue,  4 Jun 2019 10:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABB589196;
 Tue,  4 Jun 2019 10:23:41 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57898
 helo=[192.168.10.179])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hY6bT-0002BD-Ak; Tue, 04 Jun 2019 12:23:39 +0200
Subject: Re: [PATCH v7 2/8] drm/fb-helper: Remove drm_fb_helper_crtc
To: dri-devel@lists.freedesktop.org
References: <20190531140117.37751-1-noralf@tronnes.org>
 <20190531140117.37751-3-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7ee335e9-3c30-0ad9-bdb4-e02ac10597a0@tronnes.org>
Date: Tue, 4 Jun 2019 12:23:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531140117.37751-3-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=6GpbNwQH3kLecSlZdCfaz44DHFMB856mHmCFRdBQlQ0=; 
 b=OehkbLL+oToR767nxhGGlo8E/2SicHn8LVzJ/DLJ/ai0GgdzUybQgvaBITBZAd7Ks/M37y4UitzQmDqT7PFNxir4rYYarwkrMgyTltBqQWrcbD6yUJPzhAgUfgobLDCqqQIk9L5xwjHfEGp4ietRr0M9TrZn8doAUuiVGHS+DK+CTdFJOPh/JPeRgrm34L1sL0QwtZoBiWRxkqsShzUxikGUGM7+XkyeCywbM9K6IWLLZkfyyfhsTfqbsHrteI0cMPLImp8OKwTqJ2rZVUGAC0aivepr3vQzdaaFt1Zsymyh9ZnYRPekA5pkcoFLSbcpDDkC7tS7tBbigvZVhzrMWQ==;
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
Cc: intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzEuMDUuMjAxOSAxNi4wMSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IHN0cnVjdCBk
cm1fZmJfaGVscGVyX2NydGMgaXMgbm93IGp1c3QgYSB3cmFwcGVyIGFyb3VuZCBkcm1fbW9kZV9z
ZXQgc28KPiB1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFkIGFuZCBhdHRhY2ggaXQgYXMgYSBtb2Rl
c2V0IGFycmF5IG9udG8KPiBkcm1fY2xpZW50X2Rldi4gZHJtX2ZiX2hlbHBlciB3aWxsIHVzZSB0
aGlzIGFycmF5IHRvIHN0b3JlIGl0cyBtb2Rlc2V0cwo+IHdoaWNoIG1lYW5zIGl0IHdpbGwgYWx3
YXlzIGluaXRpYWxpemUgYSBkcm1fY2xpZW50LCBidXQgaXQgd2lsbCBub3QKPiByZWdpc3RlciB0
aGUgY2xpZW50IChjYWxsYmFja3MpIHVubGVzcyBpdCdzIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxh
dGlvbi4KPiAKPiBDb2RlIHdpbGwgbGF0ZXIgYmUgbW92ZWQgdG8gZHJtX2NsaWVudCwgc28gYWRk
IGNvZGUgdGhlcmUgaW4gYSBuZXcgZmlsZQo+IGRybV9jbGllbnRfbW9kZXNldC5jIHdpdGggTUlU
IGxpY2Vuc2UgdG8gbWF0Y2ggZHJtX2ZiX2hlbHBlci5jLgo+IAo+IFRoZSBtb2Rlc2V0IGNvbm5l
Y3RvciBhcnJheSBzaXplIGlzIGhhcmRjb2RlZCBmb3IgdGhlIGNsb25lZCBjYXNlIHRvIGF2b2lk
Cj4gaGF2aW5nIHRvIHBhc3MgaW4gYSB2YWx1ZSBmcm9tIHRoZSBkcml2ZXIuIEEgdmFsdWUgb2Yg
OCBpcyBjaG9zZW4gdG8gZXJyCj4gb24gdGhlIHNhZmUgc2lkZS4gVGhpcyBtZWFucyB0aGF0IHRo
ZSBtYXggY29ubmVjdG9yIGFyZ3VtZW50IGZvcgo+IGRybV9mYl9oZWxwZXJfaW5pdCgpIGFuZCBk
cm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCkgaXNuJ3QgdXNlZCBhbnltb3JlLAo+IGEgdG9kbyBl
bnRyeSBmb3IgdGhpcyBpcyBhZGRlZC4KPiAKPiBJbiBwYW5fZGlzcGxheV9hdG9taWMoKSByZXN0
b3JlX2ZiZGV2X21vZGVfZm9yY2UoKSBpcyB1c2VkIGluc3RlYWQgb2YKPiByZXN0b3JlX2ZiZGV2
X21vZGVfYXRvbWljKCkgYmVjYXVzZSB0aGF0IG9uZSB3aWxsIGxhdGVyIGJlY29tZSBpbnRlcm5h
bAo+IHRvIGRybV9jbGllbnRfbW9kZXNldC4KPiAKPiBMb2NraW5nIG9yZGVyOgo+IDEuIGRybV9m
Yl9oZWxwZXItPmxvY2sKPiAyLiBkcm1fbWFzdGVyX2ludGVybmFsX2FjcXVpcmUKPiAzLiBkcm1f
Y2xpZW50X2Rldi0+bW9kZXNldF9tdXRleAo+IAo+IHY2OiBJbXByb3ZlIGNvbW1pdCBtZXNzYWdl
IChTYW0gUmF2bmJvcmcpCj4gCj4gdjM6Cj4gLSBVc2UgZnVsbCBkcm1fY2xpZW50X2luaXQvcmVs
ZWFzZSBmb3IgdGhlIG1vZGVzZXRzIChEYW5pZWwgVmV0dGVyKQo+IC0gZHJtX2NsaWVudF9mb3Jf
ZWFjaF9tb2Rlc2V0OiB1c2UgbG9ja2RlcF9hc3NlcnRfaGVsZCAoRGFuaWVsIFZldHRlcikKPiAt
IEhvb2sgdXAgdG8gRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWNsaWVudC5yc3QgKERhbmllbCBWZXR0
ZXIpCj4gCj4gdjI6Cj4gLSBBZGQgbW9kZXNldHMgYXJyYXkgdG8gZHJtX2NsaWVudCAoRGFuaWVs
IFZldHRlcikKPiAtIFVzZSBhIG5ldyBmaWxlIGZvciB0aGUgbW9kZXNldCBjb2RlIChEYW5pZWwg
VmV0dGVyKQo+IC0gRmlsZSBoYXMgdG8gYmUgTUlUIGxpY2Vuc2VkIChFbW1hbnVlbCBWYWRvdCkK
PiAtIEFkZCBjb3B5cmlnaHRzIGZyb20gZHJtX2ZiX2hlbHBlci5jCj4gCj4gU2lnbmVkLW9mZi1i
eTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KCkFwcGxpZWQgdG8gZHJtLW1pc2Mt
bmV4dC4KClRoZSBJbnRlbCBDSSBkaWRuJ3QgbGlrZSB0aGlzIHNlcmllcywgYnV0IHRoZSB0cnli
b3QgZ2F2ZSBtZSBhIHRodW1icyB1cApvbiB0aGlzIHBhdGNoIGFsb25lLiBOZWVkIHRvIGxvb2sg
aW50byB3aHkgaXQgZmFpbHMgc2luY2UgYWZhaWNyIHRoZXJlCmhhc24ndCBiZWVuIGFueSBjaGFu
Z2VzIHRvIHRoZXNlIHBhdGNoZXMgc2luY2UgdmVyc2lvbiA1IHdoZXJlIHRoZSBDSQpyZXBvcnRl
ZCBubyBmYWlsdXJlcy4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
