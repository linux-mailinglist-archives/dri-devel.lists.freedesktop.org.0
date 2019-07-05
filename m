Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025760264
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0157D6E432;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870156E3EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 01:19:50 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hjCt7-0006mu-N1; Fri, 05 Jul 2019 01:19:45 +0000
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <63db23ac-c642-3e0c-58a4-81df991ad637@infradead.org>
Date: Thu, 4 Jul 2019 18:19:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sMXRgiUX1St8pf2vFdCJ5XAY8S//wPffXNJgq0u7mgI=; b=sSzW9TRDObDlpQ3hPHMqVMDV+2
 /BK4mqdFc1ao6uAafeVWe9hOq2z91t1CiGapZyghouo+T/GqDrY+pCPChC83Gfjpxp61ZjZmNjf+i
 DcjwpwIVaEu9Kr2bYm1nlj8YW51ATZBnmaxDDz0uvSUkK0Cp7Tm3rxMGBCdB9EiFS6e8AhQrnKO8C
 TdfYJmp9l8zSJsH8ySZAfI/6apbt9hE5Po/dbtwniqRUPLvcl8RW/P3ULS3Aq4kCUEALcBKK9tOdC
 7m5eX4fuYHpLujfae/IYtEljs06/Vsz+S3erD3FPy1sO6fTv9r1SdSSEGmn36NzoLr9So15wVxnUu
 keG/DMsw==;
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

T24gNy80LzE5IDY6MDkgUE0sIFJhbmR5IER1bmxhcCB3cm90ZToKPiBPbiA3LzQvMTkgMzowMSBQ
TSwgYWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZyB3cm90ZToKPj4gVGhlIG1tLW9mLXRoZS1tb21l
bnQgc25hcHNob3QgMjAxOS0wNy0wNC0xNS0wMSBoYXMgYmVlbiB1cGxvYWRlZCB0bwo+Pgo+PiAg
ICBodHRwOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4+Cj4+IG1tb3RtLXJlYWRtZS50
eHQgc2F5cwo+Pgo+PiBSRUFETUUgZm9yIG1tLW9mLXRoZS1tb21lbnQ6Cj4+Cj4+IGh0dHA6Ly93
d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPiAKPiBJIGdldCBhIGxvdCBvZiB0aGVzZSBidXQg
ZG9uJ3Qgc2VlL2tub3cgd2hhdCBjYXVzZXMgdGhlbToKPiAKPiAuLi9zY3JpcHRzL01ha2VmaWxl
LmJ1aWxkOjQyOiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZTogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQo+IG1ha2VbNl06ICoqKiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0ICcu
Li9kcml2ZXJzL2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZScuICBTdG9wLgo+IC4uL3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQ6NDk4OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5
MTUvb2EnIGZhaWxlZAo+IG1ha2VbNV06ICoqKiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvb2FdIEVy
cm9yIDIKPiAuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ5ODogcmVjaXBlIGZvciB0YXJnZXQg
J2RyaXZlcnMvZ3B1L2RybS9pOTE1JyBmYWlsZWQKPiAKClsrIGxpbnV4LWtidWlsZF0KCkl0IHNl
ZW1zIHRvIGhhdmUgc29tZXRoaW5nIHRvIGRvIHdpdGggIm1vZHVsZXMub3JkZXIiLgoKQnV0ISEh
CiMgQ09ORklHX0RSTV9JOTE1IGl0IG5vdCBzZXQKCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
