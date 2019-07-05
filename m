Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14A60267
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CD26E43A;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92176E3EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 01:09:09 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hjCil-0006l7-NC; Fri, 05 Jul 2019 01:09:03 +0000
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
Date: Thu, 4 Jul 2019 18:09:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eyz59IIlxroI/5AObcZylVy5ugEcgCvG6BZl1gh14To=; b=Rx8pCaA3ngvEF9QS1FSM86H3RU
 4/yULantxK7XgIacTgEf53fzj0aTXuJDONEnFMURxAcrkhN3SropTweasB2VvUUJeKGcAFLKOxuqB
 y0qgFj+iJnidkMBG3sNXbsaa+/3082Vi8LPGSzuDPbxHL/IY9vkxho9QaJ10IrKlGX9ze8IfHH+mo
 sK7hSaZ6uIYC2GI4Pz6/EVWH1C5iaiS6FnATYM37jdeLl1hJuqJEsMMTBnOJ/PHidNQ3qVAvL0iVh
 j79D1HGhy65YkfhRaungaMcTavle3CIcb0j5eMYeAf7n0YG+SX/Zt31rNxVATFT3H/GcRvV2SNRhF
 Luy3S9jw==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy80LzE5IDM6MDEgUE0sIGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmcgd3JvdGU6Cj4gVGhl
IG1tLW9mLXRoZS1tb21lbnQgc25hcHNob3QgMjAxOS0wNy0wNC0xNS0wMSBoYXMgYmVlbiB1cGxv
YWRlZCB0bwo+IAo+ICAgIGh0dHA6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPiAKPiBt
bW90bS1yZWFkbWUudHh0IHNheXMKPiAKPiBSRUFETUUgZm9yIG1tLW9mLXRoZS1tb21lbnQ6Cj4g
Cj4gaHR0cDovL3d3dy5vemxhYnMub3JnL35ha3BtL21tb3RtLwoKSSBnZXQgYSBsb3Qgb2YgdGhl
c2UgYnV0IGRvbid0IHNlZS9rbm93IHdoYXQgY2F1c2VzIHRoZW06CgouLi9zY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkOjQyOiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZTogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQptYWtlWzZdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAn
Li4vZHJpdmVycy9ncHUvZHJtL2k5MTUvb2EvTWFrZWZpbGUnLiAgU3RvcC4KLi4vc2NyaXB0cy9N
YWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dwdS9kcm0vaTkx
NS9vYScgZmFpbGVkCm1ha2VbNV06ICoqKiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvb2FdIEVycm9y
IDIKLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2
ZXJzL2dwdS9kcm0vaTkxNScgZmFpbGVkCgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
