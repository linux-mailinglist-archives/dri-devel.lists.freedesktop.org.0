Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A714C60268
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103A26E43C;
	Fri,  5 Jul 2019 08:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9136E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 03:23:12 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hjEoW-0007BD-CQ; Fri, 05 Jul 2019 03:23:09 +0000
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5e5353e2-bfab-5360-26b2-bf8c72ac7e70@infradead.org>
Date: Thu, 4 Jul 2019 20:23:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47wq6zSwqlBqXAKDNtdVAABXSaO0oASysFivQ8oCp8o=; b=BvDOOgZZqM9q76ywqtMSOtZ5rx
 4Yd/UFEsS1GbqcB1rh/9KgGpfLcWP0U1xWMX2d6RQm6pH2Y3b4L6yCf5UREw5z4M2lek5I5v5tqQG
 zeuxzyBWysZzObFCZgufRB/0uPOuIGeMiuKVjtQaNpEeW+5m4hIe2wMkPQUgcEr749i0GTBTNnL/s
 OVbyuzmWvBKTW+zo+rotD9KtchIGCSHtkp5IvEJ5H1vylQAew65hVblOCVzVQi+8phNLDiV5kRC0j
 D52fKegavaYmacCiyuD8u1pXFBflKpuU/8uUkhvg2vdl+n8bdtXiSn/QEGDUqB4ROMIo5pidwjHqM
 54BfyB3Q==;
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy80LzE5IDg6MDkgUE0sIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiBPbiBGcmksIEp1bCA1
LCAyMDE5IGF0IDEyOjA1IFBNIE1hc2FoaXJvIFlhbWFkYQo+IDx5YW1hZGEubWFzYWhpcm9Ac29j
aW9uZXh0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgSnVsIDUsIDIwMTkgYXQgMTA6MDkgQU0g
UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIDcv
NC8xOSAzOjAxIFBNLCBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnIHdyb3RlOgo+Pj4+IFRoZSBt
bS1vZi10aGUtbW9tZW50IHNuYXBzaG90IDIwMTktMDctMDQtMTUtMDEgaGFzIGJlZW4gdXBsb2Fk
ZWQgdG8KPj4+Pgo+Pj4+ICAgIGh0dHA6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS8KPj4+
Pgo+Pj4+IG1tb3RtLXJlYWRtZS50eHQgc2F5cwo+Pj4+Cj4+Pj4gUkVBRE1FIGZvciBtbS1vZi10
aGUtbW9tZW50Ogo+Pj4+Cj4+Pj4gaHR0cDovL3d3dy5vemxhYnMub3JnL35ha3BtL21tb3RtLwo+
Pj4KPj4+IEkgZ2V0IGEgbG90IG9mIHRoZXNlIGJ1dCBkb24ndCBzZWUva25vdyB3aGF0IGNhdXNl
cyB0aGVtOgo+Pj4KPj4+IC4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDI6IC4uL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L29hL01ha2VmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+PiBt
YWtlWzZdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnLi4vZHJpdmVycy9ncHUvZHJtL2k5
MTUvb2EvTWFrZWZpbGUnLiAgU3RvcC4KPj4+IC4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk4
OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2k5MTUvb2EnIGZhaWxlZAo+Pj4g
bWFrZVs1XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9vYV0gRXJyb3IgMgo+Pj4gLi4vc2Ny
aXB0cy9NYWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dwdS9k
cm0vaTkxNScgZmFpbGVkCj4+Pgo+Pgo+PiBJIGNoZWNrZWQgbmV4dC0yMDE5MDcwNCB0YWcuCj4+
Cj4+IEkgc2VlIHRoZSBlbXB0eSBmaWxlCj4+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L29hL01ha2Vm
aWxlCj4+Cj4+IERpZCBzb21lb25lIGRlbGV0ZSBpdD8KPj4KPiAKPiAKPiBJIHRoaW5rICJvYmot
eSArPSBvYS8iCj4gaW4gZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUKPiBpcyByZWR1bmRh
bnQuCgpUaGFua3MuICBJdCBzZWVtcyB0byBiZSB3b3JraW5nIGFmdGVyIGRlbGV0aW5nIHRoYXQg
bGluZS4KCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
