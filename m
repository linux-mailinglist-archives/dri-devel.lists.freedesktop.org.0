Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22508207C4A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 21:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3936E4AD;
	Wed, 24 Jun 2020 19:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FA66E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 19:40:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624194001euoutp02f29988da6f42a9b7d1e1ddb9f15c42e3~bkinIPk3l0537805378euoutp02g
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 19:40:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624194001euoutp02f29988da6f42a9b7d1e1ddb9f15c42e3~bkinIPk3l0537805378euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593027601;
 bh=/PKPR21D3yzmO8zgUQVUMWEJLHNB4e4J1RxOI6CYodQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=t5TKyt04mrUUTWkoslfsWlnTaikKJCOqh4ouA6AHkmpi3ueSW6cvv9Lovz/U1PSI8
 h4dpMpjDyUmcK1qNjxMdJVvyH9G9UNLGJ91yEPo2N1PvLY19CBNU8f9TCrM/GQ1P76
 vXunOYdyByzvWbKnkP2Jcv4qGjDEbEAId96nYhic=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200624193959eucas1p2f75833f9cd8a06228784ed4d5ebd8026~bkil1R8ZS1377313773eucas1p2A;
 Wed, 24 Jun 2020 19:39:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7F.AE.05997.F0CA3FE5; Wed, 24
 Jun 2020 20:39:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200624193958eucas1p2f640d2c5ae0f1ec6ada4376a76e8bc04~bkikqwIB62368623686eucas1p22;
 Wed, 24 Jun 2020 19:39:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200624193958eusmtrp16be7ca4ff5fc9317e6fc39e7f98f4866~bkikpCiOB3265032650eusmtrp10;
 Wed, 24 Jun 2020 19:39:58 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-70-5ef3ac0fb559
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B4.71.06314.E0CA3FE5; Wed, 24
 Jun 2020 20:39:58 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624193957eusmtip2f7eb568029a754d272079ac78319c72d~bkijvKvFk3269732697eusmtip25;
 Wed, 24 Jun 2020 19:39:57 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <70b61b75-c68b-ad89-5f6a-f1d681b9f5d0@samsung.com>
Date: Wed, 24 Jun 2020 21:39:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <381de683-df5e-4112-5690-13dd9272ae22@arm.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XYuO4rTs2n4Ylk06E5aKXlCuxccgiCCCgytqQedqcmmZnez
 lLlyqWHl1BKbpqIsrzlLymmZSKM0RWUqmv4xu0zbKgovtR0j//t93/s87/s+8FKY5CfhQ8kT
 kjhFgixOSrriTa9/mTZ7VNvCtwzOBzKWnHbE1N7XE0z+2ATJfPhuJZnrj/Qk0/fTgjFdn/tw
 JitXJ2TqPvYTTG9LEckY81sRU9MxLGSMmpNMsT0fY9qmJ4g9Hmz1g2rE9va/x1jrQIaQNWiH
 hWyhqoBg66qySPZNTo+AfVFcLWRHb3YK2HrdVVbTUIXYl9l3cNZWt/KIKNQ1JIqLk6dwCv9d
 p11jFqwPicRp91TTqxoyDd11UyMXCuhAMBd/wtTIlZLQFQh05SqCf9gRmL+9JxwqCW1DYCsN
 /Of40a4medFjBLczni46rAielNgFakRRnnQkGLK3OQxeNAu1RV+dGozOJeC5VoM7CiS9Aebq
 B0kHi+hd0PKh1jkNp9dAZuszzMHL6DDQlJUsasTQVTDh9LrQwXBtrMfJGL0KrjcWYjx7Q7q9
 0jkM6DIK+gtHcH7tA9A1NSzg2ROmOhuEPK+A7ju3FjVXYbTiBsabVQganxgwvhAMZtNv0pEM
 +7u1vsXfgUDvBUPbIR7dYeCLmF/BHfKa7mH8twhUmRK+x2oYfdu42M8byt59J3OQVLskmHZJ
 GO2SMNr/Y0sQXoW8uWRlfDSn3JbAnfNTyuKVyQnRfpFn4+vQ33Psnu+0N6OW2QgjoikkdROt
 T7GFSwhZivJ8vBEBhUm9RPvedodLRFGy8xc4xdlTiuQ4TmlEyylc6i0KKLWESehoWRJ3huMS
 OcW/qoBy8UlDvtMQm6jpH5/drfIYEo4H+OVFBImP7R+LOnPodLk8NGLtFLo0eP/Cwuz2Jkml
 eWVs5I0ZgXhkUmxhog3h64Iu/pjZkaLYog6dLvG5HOJyENJ9rbqCzKa5GJP8aPNl0I3ofM0C
 tyvGncWb9GlD0oFJYWFG6uFSk/6E3DY+drxDiitjZFs3Ygql7A8gj4V4igMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42I5/e/4PV2+NZ/jDJofqVm8nHCY0WLjjPWs
 FlMfPmGzuPL1PZtF8+L1bBZXv79ktjj55iqLRefEJewWmx5fY7W4vGsOm8WhqXsZLdYeuctu
 cagv2mLul6nMFgc/PGF14PdYM28No8flaxeZPd7faGX32DnrLrvH7I6ZrB6bVnWyeZyYcInJ
 Y//cNewe97uPM3lsXlLv0bdlFaPHgd7JLB6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa
 6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZfx/P5+14ANfxbmja9kaGKfxdDFyckgImEh8
 O9zFBmILCSxllPjzzBMiLi6xe/5bZghbWOLPNZAaLqCat4wSs5sOMnUxcnAICyRL7Ow1AqkR
 EfCQ2DjnHStIDbPAVFaJq8smsUI07GaW+PX+JdgGNgFNib+bb4LZvAJ2EruubGQFsVkEVCXa
 9u4G2yYqECvx7d4WqBpBiZMzn7CA2JwC1hKNDy+B2cwCZhLzNj9khrDlJZq3zoayxSWavqxk
 ncAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYELYduzn5h2M
 lzYGH2IU4GBU4uHVKPscJ8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZA
 z01klhJNzgcmq7ySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYx1
 s7akXd3iwTzNp9TAvj2GI2G3O8O0tN4ni1TV/YNqth7WmSnPzrmy+LDYuphp0Wu/sx5XVJpb
 oTzpyP3T2Yc7Vux8fmODi1vgiYjnvu7qt23eHX28KVrvkqXxa21J8w+LuJl6Jv99tYxRymfJ
 T83fTx9xv925lEF11qOfz19bcIuqTjRt8slSYinOSDTUYi4qTgQAQALfcR4DAAA=
X-CMS-MailID: 20200624193958eucas1p2f640d2c5ae0f1ec6ada4376a76e8bc04
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
 <CAHp75VfpP1cGK3FvTL0hBudRY2N_7GpXYRuUHUCipz7X2sMLmQ@mail.gmail.com>
 <be755825-b413-e5c1-7ea4-06506b20d1f0@arm.com>
 <20200624150434.GH5472@sirena.org.uk>
 <381de683-df5e-4112-5690-13dd9272ae22@arm.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI0LjA2LjIwMjAgMTc6MTYsIFJvYmluIE11cnBoeSB3cm90ZToKPiBPbiAyMDIwLTA2LTI0
IDE2OjA0LCBNYXJrIEJyb3duIHdyb3RlOgo+PiBPbiBXZWQsIEp1biAyNCwgMjAyMCBhdCAwMzoy
NTozM1BNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Cj4+PiBBbmQgeWVhaCwgYW55b25l
IHdobyBwaXBlcyB1cCBzdWdnZXN0aW5nIHRoYXQgcGxhY2VzIHdoZXJlIGFuIAo+Pj4gRVJSX1BU
UiB2YWx1ZQo+Pj4gY291bGQgYmUgcGFzc2VkIHRvIHByb2JlX2VycigpIGNvdWxkIHNpbXBseSBy
ZWZhY3RvciBJU19FUlIoKSBjaGVja3MgCj4+PiB3aXRoCj4+PiBtb3JlIHVzZXMgb2YgdGhlIGdv
ZC1hd2Z1bCBQVFJfRVJSX09SX1pFUk8oKSBvYmZ1c2NhdG9yIGdldHMgYSBsb25nIAo+Pj4gc3Rh
cmUgb2YKPj4+IGRpc2FwcHJvdmFsLi4uCj4+Cj4+IFdlIGNvdWxkIGFsc28gaGF2ZSBhIHByb2Jl
X2Vycl9wdHIoKSBvciBzb21ldGhpbmcgdGhhdCB0b29rIGFuIEVSUl9QVFIoKQo+PiBpbnN0ZWFk
IGlmIHRoZXJlIHJlYWxseSB3ZXJlIGFuIGlzc3VlIHdpdGggZXhwbGljaXRseSBkb2luZyB0aGlz
Lgo+Cj4gWWVhaCwgZm9yIGFsbCBteSBseXJpY2FsIG9iamVjdGlvbiwgYSBzdGF0aWMgaW5saW5l
IDxibGFoPl9wdHJfZXJyKCkgCj4gaGVscGVyIHRvIHdyYXAgPGJsYWg+X2VycigpIHdpdGggc2Vu
c2libGUgdHlwZSBjaGVja2luZyBtaWdodCBhY3R1YWxseSAKPiBiZSBhbiBPSyBjb21wcm9taXNl
IGlmIHBlb3BsZSByZWFsbHkgZmVlbCBzdHJvbmdseSBmb3IgaGF2aW5nIHRoYXQgCj4gdXRpbGl0
eS4KCgpJIGhhdmUgcHJvcG9zZWQgc3VjaCB0aGluZyBpbiBteSBwcmV2aW91cyBpdGVyYXRpb25b
MV0sIGV4Y2VwdCBpdCB3YXMgCm1hY3JvIGJlY2F1c2Ugb2YgdmFyaWFkaWMgYXJndW1lbnRzLgoK
V2l0aCBjdXJyZW50IHZlcnNpb24gd2Ugc2F2ZSA4IGNoYXJzIGFuZCBoYWNreSBtYWNybywgd2l0
aCB0aGUgb2xkIAp2ZXJzaW9uIHdlIHNhdmUgb25seSA0IGNoYXJzIGFuZCBtb3JlIGNsZWFyIGNv
bnN0cnVjdCAtIGxlc3MgdGVtcHRpbmcgCnNvbHV0aW9uIGZvciBtZS4KClBlcnNvbmFsbHkgSSBw
cmVmZXIgdGhlIGN1cnJlbnQgdmVyc2lvbiAtIGl0IGRvZXMgbm90IHNlZW1zIHRvIG1lIG1vcmUg
CmRhbmdlcm91cyB0aGFuIGFsbCB0aGVzZSBQVFJfRVJSLCBJU19FUlIsRVJSX1BUUiBoZWxwZXJz
LCBidXQgY2FuIApwcmV2ZW50IGV4cHJlc3Npb24gc3BsaXQgYWNyb3NzwqAgbXVsdGlwbGUgbGlu
ZXMgZHVlIHRvIDgwY2hhciBsaW1pdC4KClByb2JhYmx5IHRoZSBzaW1wbGVzdCBzb2x1dGlvbiBp
cyB0byBkcm9wIHRoaXMgcGF0Y2gsIEkgd2lsbCBkbyBpdCB0aGVuLgoKWzFdOiAKaHR0cHM6Ly9s
d24ubmV0L21sL2xpbnV4LWtlcm5lbC8yMDE4MTIyMDEwMjI0Ny40OTExLTQtYS5oYWpkYUBzYW1z
dW5nLmNvbS8KCgpSZWdhcmRzCgpBbmRyemVqCgoKPgo+IChhbmQgdGhlbiB3ZSBjYW4gZGViYXRl
IHdoZXRoZXIgaXQgc2hvdWxkIGFsc28gY29udmVydCBOVUxMIHRvIC1FTk9NRU0gCj4gYW5kICFJ
U19FUlIgdG8gMC4uLiA6RCkKPgo+IFJvYmluLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3Vy
bD9rPTA3NDQyMGMwLTVhZGE4ZTVhLTA3NDVhYjhmLTBjYzQ3YTMzNmZhZS1iYmE4YmI0Y2FmOTZl
MTRkJnE9MSZ1PWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUy
Rmxpc3RpbmZvJTJGZHJpLWRldmVsIAo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
