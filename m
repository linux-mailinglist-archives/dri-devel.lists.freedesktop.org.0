Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD528633
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 20:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8996E05D;
	Thu, 23 May 2019 18:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D5E6E05D;
 Thu, 23 May 2019 18:58:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50273
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hTsvU-0005o9-CY; Thu, 23 May 2019 20:58:52 +0200
Subject: Re: [PATCH v6 2/8] drm/fb-helper: Remove drm_fb_helper_crtc
To: dri-devel@lists.freedesktop.org
References: <20190523134413.4210-1-noralf@tronnes.org>
 <20190523134413.4210-3-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <38f0eaaf-a482-0f08-0806-3925db5a7eeb@tronnes.org>
Date: Thu, 23 May 2019 20:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190523134413.4210-3-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=coQvPc6xrf0de0iHcTlAVPLKxuIAiH81/rwyh4J1r/w=; 
 b=inl6dXCO3cD8I7XL5Il2zNTP3ol8WPZBZZwH9/AO+SLgPHiHVYD8l75VJXphP4sMBD5w83aUodf/hRsF5Xki/iY+DYkYIjf4NGw1bXBpNk0vWbrE+gxd/vveA/Y7DQ79Bwmt2/cJbPlpWIwikVG96whNDm1Mr3TjNLFuU8RhA7KQbxBUIA2RK4nr9feSle7RphisOR2xsh0YTeCPChSLBC8JH0bKbPO3TfFFF4t7IL7LOzOnruwaDTMJF90UhM9Gl+Npua9sXBMXts4ABfScyCksk7loR2t7kJ3255V7t7SqScWz+cy6+dNYjxQR1gWTrjzDhZT0nGhCm+8K/g2uIw==;
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

CgpEZW4gMjMuMDUuMjAxOSAxNS40NCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IHN0cnVjdCBk
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQo+IGluZGV4IDRj
M2RjNDI2OGI2NS4uOWVhZDY0MzZmYjg3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9N
YWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQo+IEBAIC0xNyw3ICsxNyw3
IEBAIGRybS15ICAgICAgIDo9CWRybV9hdXRoLm8gZHJtX2NhY2hlLm8gXAo+ICAJCWRybV9wbGFu
ZS5vIGRybV9jb2xvcl9tZ210Lm8gZHJtX3ByaW50Lm8gXAo+ICAJCWRybV9kdW1iX2J1ZmZlcnMu
byBkcm1fbW9kZV9jb25maWcubyBkcm1fdmJsYW5rLm8gXAo+ICAJCWRybV9zeW5jb2JqLm8gZHJt
X2xlYXNlLm8gZHJtX3dyaXRlYmFjay5vIGRybV9jbGllbnQubyBcCj4gLQkJZHJtX2F0b21pY191
YXBpLm8KPiArCQlkcm1fY2xpZW50X21vZGVzZXQubyBkcm1fYXRvbWljX3VhcGkubwoKVGhlIElu
dGVsIENJIGluZm9ybWVkIG1lIHRoYXQgdGhpcyBkaWRuJ3QgYXBwbHkgb24gZHJtLXRpcC4KVGhl
cmUncyBjb21taXQgNjQ5OGJmNTgwMGEzICgiZHJtOiByZXZvY2F0aW9uIGNoZWNrIGF0IGRybSBz
dWJzeXN0ZW0iKQpjb21pbmcgaW4gZnJvbSBkcm0taW50ZWwtbmV4dCB0aGF0IGNvbmZsaWN0cy4g
SXQncyBub3QgaW4gZHJtLW5leHQgeWV0LgpJIHdvbid0IGJlIGFibGUgdG8gcmVzcGluIHRoaXMg
Zm9yIGEgd2VlayBvciBzbywgc28gbWF5YmUgYnkgdGhhdCB0aW1lCml0IGhhcyBldmVuIGJlZW4g
YmFja21lcmdlZCBpbnRvIGRybS1taXNjLW5leHQuCgpOb3JhbGYuCgo+ICAKPiAgZHJtLSQoQ09O
RklHX0RSTV9MRUdBQ1kpICs9IGRybV9sZWdhY3lfbWlzYy5vIGRybV9idWZzLm8gZHJtX2NvbnRl
eHQubyBkcm1fZG1hLm8gZHJtX3NjYXR0ZXIubyBkcm1fbG9jay5vCj4gIGRybS0kKENPTkZJR19E
Uk1fTElCX1JBTkRPTSkgKz0gbGliL2RybV9yYW5kb20ubwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
