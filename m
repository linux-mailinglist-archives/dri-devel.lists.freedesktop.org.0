Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA6333BA4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 12:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FF76E1D6;
	Wed, 10 Mar 2021 11:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4466E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfJDUOuq/G8lxislJkZy1H7BcYxByC3tcxXQy85SnCQ=; b=u7CH8ZdFu2RTVQtiS8divD21SU
 Vc4ld70dFLaILkHo5wVa/yi4mXf1DH9VnuIG+tEufN/AjNK59XfatUebVOBKr3KR1PdS/w32alo9V
 5DZOAl4XQg1V4wl/Poawdb4jvgPN11H0EobTSTMU5MpMjNu5hWhowfQLpfxjNPLGbFi5YLKNTMrep
 IrLbspO/8WusGvlXWuFmgIpzc3GxGh38X13541vDZXaaQfEwoWlwx/nwej1VEhIFkbwY1yJZLCiqR
 w4i5sTFwhmojMg99QotLvllEy7deolQJcSLhMm+mty8FzujkQ/WyvLXg7NgSsICp71AH0zxFpLrBp
 c6c6BJqQ==;
Received: from [2a01:799:95f:4600:2010:7a82:9a7a:175c] (port=64334)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lJxFS-00027Y-O6; Wed, 10 Mar 2021 12:43:30 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20210310045544.28961.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
Date: Wed, 10 Mar 2021 12:43:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210310045544.28961.qmail@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTAuMDMuMjAyMSAwNS41NSwgc2tyZXYgUGV0ZXIgU3R1Z2U6Cj4gTm9yYWxmIFRyw7hu
bmVzIHdyb3RlOgo+Pj4gRGVwZW5kaW5nIG9uIGhvdyBsb25nIGl0IHRha2VzIGZvciB0aGUgRE1B
IG1hc2sgZGVwZW5kZW5jeSBwYXRjaCB0byBzaG93Cj4+PiB1cCBpbiBkcm0tbWlzYy1uZXh0LCBJ
IHdpbGwgZWl0aGVyIHB1Ymxpc2ggYSBuZXcgdmVyc2lvbiBvciBhcHBseSB0aGUKPj4+IGN1cnJl
bnQgYW5kIHByb3ZpZGUgcGF0Y2hlcyB3aXRoIHRoZSBuZWNlc3NhcnkgZml4ZXMuIAo+Pgo+PiBJ
biBjYXNlIEkgYXBwbHkgdGhpcyB2ZXJzaW9uLCBhcmUgeW91IGhhcHB5IGVub3VnaCB3aXRoIGl0
IHRoYXQgeW91IHdhbnQKPj4gdG8gZ2l2ZSBhbiBhY2sgb3Igci1iPwo+IAo+IEkndmUgbm93IHRl
c3RlZCBSMSBhbmQgUkdCMTExIGFuZCBJIHRoaW5rIEkndmUgZm91bmQgdHdvIG1vcmUgdGhpbmdz
Ogo+IAo+IEkgZGlkbid0IHJlY2VpdmUgdGhlIGV4cGVjdGVkIGJpdHMvYnl0ZXMgZm9yIFJHQjEx
MSBvbiB0aGUgYnVsayBlbmRwb2ludCwKPiBJIHRoaW5rIGJlY2F1c2Ugb2YgaG93IGNvbXBvbmVu
dHMgd2VyZSBleHRyYWN0ZWQgaW4gZ3VkX3hyZ2I4ODg4X3RvX2NvbG9yKCkuCj4gCj4gQ2hhbmdp
bmcgdG8gdGhlIGZvbGxvd2luZyBnZXRzIG1lIHRoZSBleHBlY3RlZCAoWCBSMSBHMSBCMSBYIFIy
IEcyIEIyKSBieXRlczoKPiAKPiAJCQlyID0gKCpwaXgzMiA+PiA4KSAmIDB4ZmY7Cj4gCQkJZyA9
ICgqcGl4MzIgPj4gMTYpICYgMHhmZjsKPiAJCQliID0gKCpwaXgzMisrID4+IDI0KSAmIDB4ZmY7
Cj4gCgpXZSdyZSBhY2Nlc3NpbmcgdGhlIHdob2xlIHdvcmQgaGVyZSB0aHJvdWdoIHBpeDMyLCBu
byBieXRlIGFjY2Vzcywgc28KZW5kaWFuZXNzIGRvZXNuJ3QgY29tZSBpbnRvIHBsYXkuIFRoaXMg
Y2hhbmdlIHdpbGwgZmxpcCByIGFuZCBiLCB3aGljaApnaXZlczogWFJHQjg4ODggLT4gWEJHUjEx
MTEKCkJHUiBpcyBhIGNvbW1vbiB0aGluZyBvbiBjb250cm9sbGVycywgYXJlIHlvdSBzdXJlIHlv
dXJzIGFyZSBzZXQgdG8gUkdCCmFuZCBub3QgQkdSPwoKQW5kIHRoZSAweGZmIG1hc2tpbmcgaXNu
J3QgbmVjZXNzYXJ5IHNpbmNlIHdlJ3JlIGFzc2lnbmluZyB0byBhIGJ5dGUsIHJpZ2h0PwoKSSBo
YXZlbid0IGdvdCBhIG5hdGl2ZSBSMUcxQjEgZGlzcGxheSBzbyBJIGhhdmUgZW11bGF0ZWQgYW5k
IEkgZG8gZ2V0CnRoZSBleHBlY3RlZCBjb2xvcnMuIFRoaXMgaXMgdGhlIGNvbnZlcnNpb24gZnVu
Y3Rpb24gSSB1c2Ugb24gdGhlIGRldmljZQp3aGljaCBJIHRoaW5rIGlzIGNvcnJlY3Q6CgpzdGF0
aWMgc2l6ZV90IHJnYjExMV90b19yZ2I1NjUodWludDE2X3QgKmRzdCwgdWludDhfdCAqc3JjLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qgc3JjX3dpZHRoLCB1aW50MTZf
dCBzcmNfaGVpZ2h0KQp7CiAgICB1aW50OF90IHJnYjExMSwgdmFsID0gMDsKICAgIHNpemVfdCBs
ZW4gPSAwOwoKICAgIGZvciAodWludDE2X3QgeSA9IDA7IHkgPCBzcmNfaGVpZ2h0OyB5KyspIHsK
ICAgICAgICBmb3IgKHVpbnQxNl90IHggPSAwOyB4IDwgc3JjX3dpZHRoOyB4KyspIHsKICAgICAg
ICAgICAgaWYgKCEoeCAlIDIpKQogICAgICAgICAgICAgICAgdmFsID0gKnNyYysrOwogICAgICAg
ICAgICByZ2IxMTEgPSB2YWwgPj4gNDsKICAgICAgICAgICAgKmRzdCsrID0gKChyZ2IxMTEgJiAw
eDA0KSA8PCAxMykgfCAoKHJnYjExMSAmIDB4MDIpIDw8IDkpIHwKICAgICAgICAgICAgICAgICAg
ICAgKChyZ2IxMTEgJiAweDAxKSA8PCA0KTsKICAgICAgICAgICAgbGVuICs9IHNpemVvZigqZHN0
KTsKICAgICAgICAgICAgdmFsIDw8PSA0OwogICAgICAgIH0KICAgIH0KCiAgIHJldHVybiBsZW47
Cn0KCj4gCj4gVGhlbiwgZ3VkX3hyZ2I4ODg4X3RvX2NvbG9yKCkgYW5kIG1heWJlIGV2ZW4gZ3Vk
X3hyZ2I4ODg4X3RvX3IxMjQoKSBzZWVtCj4gdG8gYmUgaG9zdCBlbmRpYW4gZGVwZW5kZW50LCBh
dCBsZWFzdCBiZWNhdXNlIG9mIHRoYXQgcGl4MzIsIGJ1dCBtYXliZSBtb3JlPwo+IEkgZG9uJ3Qg
a25vdyB3aGV0aGVyIGRybSBndWFyYW50ZWVzICJuYXRpdmUiIFhSR0IgYnl0ZSBzZXF1ZW5jZSBp
biBtZW1vcnksCj4gdGhlbiBJIGd1ZXNzIHRoZSBwaXgzMiBpcyBva2F5PyBQbGVhc2UgdGFrZSBh
IGxvb2s/Cj4gCj4gCj4gRmluYWxseSBteSB2ZXJ5IGxhc3QgYXNrOiBQbGVhc2UgY29uc2lkZXIg
cmVuYW1pbmcgR1VEX1BJWEVMX0ZPUk1BVF9SR0IxMTEKPiB0byBHVURfUElYRUxfRk9STUFUX1hS
R0IxMTExPwo+IAoKSXQgaGFzIGNyb3NzZWQgbXkgbWluZCwgSSdsbCBjaGFuZ2UgaXQuCgpOb3Jh
bGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
