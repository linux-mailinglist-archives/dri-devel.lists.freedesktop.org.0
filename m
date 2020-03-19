Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192518B122
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275916E9E0;
	Thu, 19 Mar 2020 10:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6014B6E9E0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 271AB3F3BA;
 Thu, 19 Mar 2020 11:21:00 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YIlRraCY; 
 dkim-atps=neutral
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
 with ESMTP id 85z82hMh4gjk; Thu, 19 Mar 2020 11:20:59 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 6CE8C3F4F6;
 Thu, 19 Mar 2020 11:20:45 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 768023600BE;
 Thu, 19 Mar 2020 11:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1584613245; bh=V8lBBeyRDZgxGjvBgP3FyGRuA/pE02GkqJZ35o9y2dQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YIlRraCYki7VHR34mew970Lxo2NLkIGwy7IuqNkOsIvvNBDQjSyCc7KiXuL05mY8Q
 39Oazf0Pl2vXiL6ZgJquzyoxrCWEy8PfMxPefNiYV8PtCZE7Fz8i3MFTr1s2CTV0Hl
 Hmp8dbYShbrpUn5FTIcJx0y9D5GuWaYFNuneBK9s=
Subject: Re: Ack to merge through DRM? WAS [PATCH v6 0/9] Huge page-table
 entries for TTM
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200304102840.2801-1-thomas_os@shipmail.org>
 <9eb1acd3-cded-65f0-ed75-10173dc3a41c@shipmail.org>
 <20200318162721.9b8a4d0ef7036ad93261f859@linux-foundation.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <5054bb71-b5b4-11a9-1c4e-487a7adf3177@shipmail.org>
Date: Thu, 19 Mar 2020 11:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200318162721.9b8a4d0ef7036ad93261f859@linux-foundation.org>
Content-Language: en-US
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8xOS8yMCAxMjoyNyBBTSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBNb24sIDE2IE1h
ciAyMDIwIDEzOjMyOjA4ICswMTAwIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4+IEFuZHJldywgd291bGQgaXQgYmUgcG9z
c2libGUgdG8gaGF2ZSBhbiBhY2sgZm9yIG1lcmdlIHVzaW5nIGEgRFJNIHRyZWUKPj4gZm9yIHRo
ZSAtbW0gcGF0Y2hlcz8KPiBZZXMsIHBsZWFzZSBkby4gIEl0J3MgYWxsIHByZXR0eSBzdHJhaWdo
dGZvcndhcmQgYWRkaXRpb24gb2YgbmV3Cj4gZnVuY3Rpb25hbGl0eSB3aGljaCB3b24ndCBhZmZl
Y3QgZXhpc3RpbmcgY29kZS4KClRoYW5rcyBBbmRyZXcuIENhbiBJIGFkZCB5b3VyIEFja2VkLWJ5
OiBUbyB0aGUgbW0gcGF0Y2hlcyBmb3IgTGludXMnIApyZWZlcmVuY2U/CgpUaGFua3MsCgpUaG9t
YXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
