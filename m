Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB8C25CD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1E36E4AE;
	Mon, 30 Sep 2019 17:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09276E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E7E6E3F549;
 Mon, 30 Sep 2019 19:38:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnuYuafil-f7; Mon, 30 Sep 2019 19:38:34 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id B96B63F4B6;
 Mon, 30 Sep 2019 19:38:31 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 789ED36016A;
 Mon, 30 Sep 2019 19:38:31 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <20190927121754.kn46qh2crvsnw5z2@box>
 <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
 <20190930130357.ye3zlkbka2jtd56a@box>
 <CAHk-=wigUfYXiizFH6tBCH0Na=L+c=k7CgXGoZjwKg4K1rNJ2Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <2788e6e6-6916-5f95-51f5-336b8edaee2f@shipmail.org>
Date: Mon, 30 Sep 2019 19:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wigUfYXiizFH6tBCH0Na=L+c=k7CgXGoZjwKg4K1rNJ2Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569865111; bh=Mbv8I+Cf9qo+4r4AR1GScXQE/ojfy18469i5KoNwfsg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GpvpfTgbFXewp0ygt6YF4cirkWGlnK74clrVKSVTm7q9qX01w4J2Ic0CkUN2QlXEh
 +TpoCVtuKvm2+5ivSMPVfSI3bB7XtpBXGdQ3y5+le76vg9tOoWSTvPeiNJaMXZZUcT
 GQoa1J9ueiuw5NeMW0Doyyjpevc85q+KbNJq298s=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=GpvpfTgb; 
 dkim-atps=neutral
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8zMC8xOSA3OjEyIFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPiBPbiBNb24sIFNlcCAz
MCwgMjAxOSBhdCA2OjA0IEFNIEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsQHNodXRlbW92Lm5h
bWU+IHdyb3RlOgo+PiBIYXZlIHlvdSBzZWVuIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCk/IEkgbWFk
ZSBpdCBzcGVjaWZpY2FsbHkgZm9yIHJtYXAgY29kZQo+PiB0byBjb3ZlciBjYXNlcyB3aGVuIGEg
VEhQIGlzIG1hcHBlZCB3aXRoIFBURXMuIFRvIG1lIGl0J3Mgbm90IGEgYmlnCj4+IHN0cmV0Y2gg
dG8gbWFrZSBpdCBjb3ZlciBtdWx0aXBsZSBwYWdlcyB0b28uCj4gSSBhZ3JlZSB0aGF0IGlzIGNs
b3NlciwgYnV0IGl0IGRvZXMgbWFrZSBmb3IgY2FsbGluZyB0aGF0IGJpZyBjb21wbGV4Cj4gZnVu
Y3Rpb24gZm9yIGV2ZXJ5IGl0ZXJhdGlvbiBzdGVwLgo+Cj4gT2YgY291cnNlLCB5b3UgYXJlIHJp
Z2h0IHRoYXQgdGhlIGNhbGxiYWNrIGFwcHJvYWNoIGlzIHByb2JsZW1hdGljCj4gdG9vLCBub3cg
dGhhdCB3ZSBoYXZlIHJldHBvbGluZSBpc3N1ZXMsIG1ha2luZyB0aG9zZSB2ZXJ5IGV4cGVuc2l2
ZS4KPiBCdXQgYXQgbGVhc3QgdGhhdCBob3BlZnVsbHkgZ2V0cyBmaXhlZCBzb21lIGRheSBhbmQg
Z2V0cyB0byBiZSBhIHJhcmUKPiBwcm9ibGVtLgo+Cj4gTWF0dGVyIG90IHRhc3RlLCBJIGd1ZXNz
Lgo+Cj4gICAgICAgICAgICAgICAgTGludXMKCk1hdHRoZXcgV2lsY294IHN1Z2dlc3RlZCBzb21l
dGhpbmcgc2ltaWxhciBiZWZvcmUgdGhlIHBhZ2V3YWxrLmMgcmV3cml0ZToKCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA4MDYxOTA5MzcuR0QzMDE3OUBib21iYWRpbC5pbmZyYWRl
YWQub3JnLwoKU3RpbGwsIEluIHRoaXMgY2FzZSBJJ2Qgb3B0IGZvciB1c2luZyB0aGUgcGFnZXdh
bGsgY29kZTogSW4gdGhlIGRpcnR5IApoZWxwZXJzIHdlIGRvbid0IGV2ZXIgdXNlIGEgc3RydWN0
IHBhZ2UsIGJ1dCBvbmx5IGRlYWwgd2l0aCBQVEUgZW50cmllcywgCnNhbWUgYXMgdGhlIHBhZ2V3
YWxrIGNvZGUgZG9lcywgYnV0IG5vdCBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLiBUaGUgCnVuZGVy
bHlpbmcgbWVtb3J5IG1heSB3ZWxsIGJlIElPIG1lbW9yeS4KCi9UaG9tYXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
