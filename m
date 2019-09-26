Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9CBF265
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 14:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC676ECEC;
	Thu, 26 Sep 2019 12:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60A6ECEC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7CA553F5D5;
 Thu, 26 Sep 2019 14:03:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki1CKtPzyZxv; Thu, 26 Sep 2019 14:03:20 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 06B6E3F234;
 Thu, 26 Sep 2019 14:03:19 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BD293360311;
 Thu, 26 Sep 2019 14:03:19 +0200 (CEST)
Subject: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
Date: Thu, 26 Sep 2019 14:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190926115548.44000-2-thomas_os@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569499399; bh=DBvNfkxnIXmlXQ6kopNE8+KbXVhg4FkNygEe8p6ktTI=;
 h=Subject:From:To:References:Cc:Date:In-Reply-To:From;
 b=FPTUu1ygkAdtznT+rTStt02Vx5rZ4tXicv+4o1vN/kqhsRcZFdwmjZKWWCOG/7dBP
 VmbWEkLDh6EA8v6nrUzR7e7sXiUcgYjowzQXLT0wJUe9g0uI2v4Ie682IF1HDvGu1N
 3I3x4TVh79sEl0EOse91dMG5/aZkvEqj9hjq04+M=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=FPTUu1yg; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yNi8xOSAxOjU1IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBG
cm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4KPiBBZGQgdHdv
IHV0aWxpdGllcyB0byBhKSB3cml0ZS1wcm90ZWN0IGFuZCBiKSBjbGVhbiBhbGwgcHRlcyBwb2lu
dGluZyBpbnRvCj4gYSByYW5nZSBvZiBhbiBhZGRyZXNzIHNwYWNlLgo+IFRoZSB1dGlsaXRpZXMg
YXJlIGludGVuZGVkIHRvIGFpZCBpbiB0cmFja2luZyBkaXJ0eSBwYWdlcyAoZWl0aGVyCj4gZHJp
dmVyLWFsbG9jYXRlZCBzeXN0ZW0gbWVtb3J5IG9yIHBjaSBkZXZpY2UgbWVtb3J5KS4KPiBUaGUg
d3JpdGUtcHJvdGVjdCB1dGlsaXR5IHNob3VsZCBiZSB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGgK
PiBwYWdlX21rd3JpdGUoKSBhbmQgcGZuX21rd3JpdGUoKSB0byB0cmlnZ2VyIHdyaXRlIHBhZ2Ut
ZmF1bHRzIG9uIHBhZ2UKPiBhY2Nlc3Nlcy4gVHlwaWNhbGx5IG9uZSB3b3VsZCB3YW50IHRvIHVz
ZSB0aGlzIG9uIHNwYXJzZSBhY2Nlc3NlcyBpbnRvCj4gbGFyZ2UgbWVtb3J5IHJlZ2lvbnMuIFRo
ZSBjbGVhbiB1dGlsaXR5IHNob3VsZCBiZSB1c2VkIHRvIHV0aWxpemUKPiBoYXJkd2FyZSBkaXJ0
eWluZyBmdW5jdGlvbmFsaXR5IGFuZCBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YgcGFnZS1mYXVsdHMs
Cj4gdHlwaWNhbGx5IG9uIGxhcmdlIGFjY2Vzc2VzIGludG8gc21hbGwgbWVtb3J5IHJlZ2lvbnMu
Cj4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzog
TWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gQ2M6IFdpbGwgRGVhY29uIDx3
aWxsLmRlYWNvbkBhcm0uY29tPgo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVh
ZC5vcmc+Cj4gQ2M6IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KPiBDYzogTWluY2hh
biBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+Cj4gQ2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgo+IENjOiBTb3Vw
dGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiBDYzogIkrDqXLDtG1lIEdsaXNz
ZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJl
bGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IC0tLQoKSGkhCgpJIHdvbmRlciBpZiBJIGNhbiBn
ZXQgYW4gYWNrIGZyb20gYW4gbW0gbWFpbnRhaW5lciB0byBtZXJnZSB0aGlzIHRocm91Z2ggCkRS
TSBhbG9uZyB3aXRoIHRoZSB2bXdnZnggcGF0Y2hlcz8gQW5kcmV3PyBNYXR0aGV3PwoKVGhhbmtz
LApUaG9tYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
