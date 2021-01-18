Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC32FB435
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F586E842;
	Tue, 19 Jan 2021 08:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C46E573
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=zEJ22T1F3C1ubeY5/smo9KBx7Q8j3vhMGHt2WDHCSaU=; b=cUK7zXfaMBn25pUSZdxNvgLj0O
 uBg6xKKhdWyrtkQsCeMm3Kn2EP3pjEcLEaJlRAIQGlRZqIMSlXBjMmiDq24QOgwRdcAixbOQIeRtB
 JtLV8PvHMSm/mPAOJXRVgeZX6U0Q6qbvFkONMl5WP2fuSOx/lWFaATpxT0mg0x72l5aED38rusqNm
 PC/v95/FvgmYcdZcV9FeBgB9fGW8ClMfBV3xeztFJtFb3VIaZhB78qb/W5j+cev6r61SnFFs2L8EU
 NYb/JsL9GsKhYVBmOpAziNtG+Gzi+wus9dZqfq3pWQ5I/RztgB1hrXnEqf13vDoRTdC6gkeIhTt4q
 Enu8wHBA==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1aPk-0007XE-C8; Mon, 18 Jan 2021 19:42:12 +0000
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210118180334.43714-1-christian.koenig@amd.com>
 <20210118180334.43714-2-christian.koenig@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3ebc7345-1b3f-8e7f-dc12-eacfd3a993d9@infradead.org>
Date: Mon, 18 Jan 2021 11:42:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118180334.43714-2-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpKdXN0IGEgY29tbWVudCBhYm91dCB0aGUgY29tbWVudHM6CgpPbiAxLzE4LzIxIDEwOjAz
IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJ
VF9GT1JfU1VCTUlUIGNhbid0IGJlIHVzZWQgd2hlbiB3ZSBob2xkIGxvY2tzCj4gc2luY2Ugd2Ug
YXJlIGJhc2ljYWxseSB3YWl0aW5nIGZvciB1c2Vyc3BhY2UgdG8gZG8gc29tZXRoaW5nLgo+IAo+
IEhvbGRpbmcgYSBsb2NrIHdoaWxlIGRvaW5nIHNvIGNhbiB0cml2aWFsIGRlYWRsb2NrIHdpdGgg
cGFnZSBmYXVsdHMKPiBldGMuLi4KPiAKPiBTbyBtYWtlIGxvY2tkZXAgY29tcGxhaW4gd2hlbiBh
IGRyaXZlciB0cmllcyB0byBkbyB0aGlzLgo+IAo+IHYyOiBBZGQgbG9ja2RlcF9hc3NlcnRfbm9u
ZV9oZWxkKCkgbWFjcm8uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYyB8IDcgKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L2xvY2tkZXAuaCAgICAgICB8IDUgKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMKPiBpbmRleCA2ZTc0ZTY3NDVlY2EuLmY1MTQ1ODYxNTE1OCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jCj4gQEAgLTM4Nyw2ICszODcsMTMgQEAgaW50IGRybV9zeW5jb2JqX2ZpbmRfZmVu
Y2Uoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXZhdGUsCj4gIAlpZiAoIXN5bmNvYmopCj4gIAkJ
cmV0dXJuIC1FTk9FTlQ7Cj4gIAo+ICsJLyogV2FpdGluZyBmb3IgdXNlcnNwYWNlIHdpdGggbG9j
a3MgaGVscCBpcyBpbGxlZ2FsIGNhdXNlIHRoYXQgY2FuCgoJICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaGVsZCAgICAgICAgICAgIGJlY2F1c2UKCj4gKwkgKiB0cml2aWFsIGRl
YWRsb2NrIHdpdGggcGFnZSBmYXVsdHMgZm9yIGV4YW1wbGUuIE1ha2UgbG9ja2RlcCBjb21wbGFp
bgoKCSAgIHRyaXZpYWxseQoKPiArCSAqIGFib3V0IGl0IGVhcmx5IG9uLgo+ICsJICovCj4gKwlp
ZiAoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NVQk1JVCkKPiArCQls
b2NrZGVwX2Fzc2VydF9ub25lX2hlbGRfb25jZSgpOwo+ICsKPiAgCSpmZW5jZSA9IGRybV9zeW5j
b2JqX2ZlbmNlX2dldChzeW5jb2JqKTsKPiAgCWRybV9zeW5jb2JqX3B1dChzeW5jb2JqKTsKPiAg
CgoKdGhhbmtzLgotLSAKflJhbmR5CllvdSBjYW4ndCBkbyBhbnl0aGluZyB3aXRob3V0IGhhdmlu
ZyB0byBkbyBzb21ldGhpbmcgZWxzZSBmaXJzdC4KLS0gQmVsZWZhbnQncyBMYXcKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
