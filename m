Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D8BFA6E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 22:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D036EDFD;
	Thu, 26 Sep 2019 20:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BA6EDFD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5175C3F486;
 Thu, 26 Sep 2019 22:09:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHKroFvcWLXm; Thu, 26 Sep 2019 22:09:20 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 460793F31C;
 Thu, 26 Sep 2019 22:09:14 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7413A3601AA;
 Thu, 26 Sep 2019 22:09:14 +0200 (CEST)
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
Date: Thu, 26 Sep 2019 22:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569528554; bh=3l8scdJAPzeKA98DGCU5rWJe1BLj1pdf1s3/XvaFYIM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gcmPxCth95u3iGJfWJgByzgw5oVdwb+RepRSGLIODhe5//VGMSDj32YlGikCTRRhj
 lVpHXYknWBI43AymxkHDLUi1mox2Nt6EnuRk9fUVfg55a8znxCBTiiMHdAkL9XbI6z
 ftWhUKod23N7nvDRnZ/2dpoh8BqzWhIE2uw3siGA=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="gcmPxCth";
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

SGksCgpPbiA5LzI2LzE5IDk6MTkgUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+IE9uIFRodSwg
U2VwIDI2LCAyMDE5IGF0IDU6MDMgQU0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkKPiA8dGhv
bWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+IEkgd29uZGVyIGlmIEkgY2FuIGdldCBhbiBh
Y2sgZnJvbSBhbiBtbSBtYWludGFpbmVyIHRvIG1lcmdlIHRoaXMgdGhyb3VnaAo+PiBEUk0gYWxv
bmcgd2l0aCB0aGUgdm13Z2Z4IHBhdGNoZXM/IEFuZHJldz8gTWF0dGhldz8KPiBJdCB3b3VsZCBo
YXZlIGhlbHBlZCB0byBhY3R1YWxseSBwb2ludCB0byB0aGUgcGF0Y2ggaXRzZWxmLCBpbnN0ZWFk
IG9mCj4ganVzdCBxdW90aW5nIHRoZSBjb21taXQgbWVzc2FnZS4KPgo+IExvb2tzIGxpa2UgdGhp
czoKPgo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MjYxMTU1NDgu
NDQwMDAtMi10aG9tYXNfb3NAc2hpcG1haWwub3JnLwo+Cj4gYnV0IHdoeSBpcyB0aGUgY29kZSBp
biBxdWVzdGlvbiBub3QganVzdCB1c2luZyB0aGUgcmVndWxhciBwYWdlCj4gd2Fsa2Vycy4gVGhl
IGNvbW1pdCBsb2cgc2hvd3Mgbm8gZXhwbGFuYXRpb24gb2Ygd2hhdCdzIHNvIHNwZWNpYWwKPiBh
Ym91dCB0aGlzPwo+Cj4gSXMgdGhlIG9ubHkgcmVhc29uIHRoZSBsb2NraW5nIG1hZ2ljPyBCZWNh
dXNlIGlmIHRoYXQncyB0aGUgcmVhc29uLAo+IHRoZW4gYWZhaWsgd2UgYWxyZWFkeSBoYXZlIGEg
ZnVuY3Rpb24gZm9yIHRoYXQ6IGl0J3MKPiBfX3dhbGtfcGFnZV9yYW5nZSgpLgo+Cj4gWWVzLCBp
dCdzIHN0YXRpYyByaWdodCBub3csIGJ1dCB0aGF0J3MgaW1obyBub3QgYSByZWFzb24gdG8gZHVw
bGljYXRlCj4gYWxsIHRoZSB3YWxraW5nIChiYWRseSkuCj4KPiBJcyB0aGVyZSBzb21lIG90aGVy
IG1hZ2ljIHJlYXNvbiB0aGF0IGlzbid0IGRvY3VtZW50ZWQ/Cj4KPiAgICAgICAgICAgICAgICBM
aW51cwoKVGhlcmUgaXMgYSBkaXNjdXNzaW9uIGFyb3VuZCB0aGlzIHN1YmplY3QgaW4KCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MjYxMTU1NDguNDQwMDAtMS10aG9tYXNfb3NA
c2hpcG1haWwub3JnLwoKVGhlIG1haW4gcG9pbnQgaXMgdGhhdCB0aGVyZSBpcyBhbiBhc3NlcnQg
aW4gcHVkX3RyYW5zX2h1Z2VfbG9jaygpIHRoYXQgCnRoZSBtbWFwX3NlbSBpcyBoZWxkLCBhbmQg
d2UgZG9uJ3QgaGF2ZSBpdC4gUHJlc3VtYWJseSB3ZSBzaG91bGQgYmUgYWJsZSAKdG8gZ2V0IGF3
YXkgd2l0aCB0aGUgaV9tbWFwX2xvY2ssIGJ1dCBpbiBhZGRpdGlvbiBJIHdvdWxkIGhhdmUgaGFk
IHRvIAppbmNsdWRlIHRoZSB3YWxrX2FzX3B0ZV9yYW5nZSgpIGFzIHRoZSB3YWxrOjpwbWRfZW50
cnkgYW55d2F5LCBzbyB0aGUgCmFtb3VudCBvZiBkdXBsaWNhdGVkIHBhZ2Ugd2FsayBjb2RlIGlz
bid0IHRoYXQgYmlnLgoKVGhhdCBzYWlkLCBpZiBwZW9wbGUgYXJlIE9LIHdpdGggbWUgbW9kaWZ5
aW5nIHRoZSBhc3NlcnQgaW4gCnB1ZF90cmFuc19odWdlX2xvY2soKSBhbmQgbWFrZSBfX3dhbGtf
cGFnZV9yYW5nZSBub24tc3RhdGljLCBpdCBzaG91bGQgCnByb2JhYmx5IGJlIHBvc3NpYmxlIHRv
IG1ha2UgaXQgd29yaywgeWVzLgoKVGhhbmtzLApUaG9tYXMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
