Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67519177410
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1B6EA29;
	Tue,  3 Mar 2020 10:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6196EA29
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E5F203F80D;
 Tue,  3 Mar 2020 11:23:54 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=h3NN+FFK; 
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
 with ESMTP id sPW0qWza6X9Z; Tue,  3 Mar 2020 11:23:54 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 16E073F524;
 Tue,  3 Mar 2020 11:23:54 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D0D41360106;
 Tue,  3 Mar 2020 11:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583231033; bh=RVfyASf7XP1Z1TIdelkLDDDCUoluWWyyQf/Mz9CblFU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h3NN+FFKgh26TwA0W2Nj/kfUBdOlOyuAjB6PzNdD12sCjH0ZvmvrGjbVqy3cDjF0D
 C169qGfKK3a/jIs8N5QghDRkGfgk0T33yUbv4UShzFYYpafZJXTW8Y47BKkMeekbxD
 W9LELOU4YwHeFBlR8mXQRvfvfJe8xVcliTRk9nhg=
Subject: Re: [PATCH v4 0/9] Huge page-table entries for TTM
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
 <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
 <20200229200432.55b5b64f46dc2f2f80fa7461@linux-foundation.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <f6ebe219-3496-6dd3-b1da-2effc707548a@shipmail.org>
Date: Tue, 3 Mar 2020 11:23:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200229200432.55b5b64f46dc2f2f80fa7461@linux-foundation.org>
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

T24gMy8xLzIwIDU6MDQgQU0sIEFuZHJldyBNb3J0b24gd3JvdGU6Cj4gT24gRnJpLCAyOCBGZWIg
MjAyMCAxNDowODowNCArMDEwMCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPj4gSSdtIHdvbmRlcmluZyB3aGF0J3MgdGhlIGJlc3Qg
d2F5IGhlcmUgdG8gZ2V0IHRoZSBwYXRjaGVzIHRvdWNoaW5nIG1tCj4+IHJldmlld2VkIGFuZCBh
Y2NlcHRlZD8KPj4gV2hpbGUgZHJtIHBlb3BsZSBhbmQgVk13YXJlIGludGVybmFsIHBlb3BsZSBo
YXZlIGxvb2tlZCBhdCB0aGVtLCBJIHRoaW5rCj4+IHRoZSBodWdlX2ZhdWx0KCkgZmFsbGJhY2sg
c3BsaXR0aW5nIGFuZCB0aGUgaW50cm9kdWN0aW9uIG9mCj4+IHZtYV9pc19zcGVjaWFsX2h1Z2Uo
KSBuZWVkcyBsb29raW5nIGF0IG1vcmUgdGhvcm91Z2hseS4KPj4KPj4gQXBhcnQgZnJvbSB0aGF0
LCBpZiBwb3NzaWJsZSwgSSB0aGluayB0aGUgYmVzdCB3YXkgdG8gbWVyZ2UgdGhpcyBzZXJpZXMK
Pj4gaXMgYWxzbyB0aHJvdWdoIGEgRFJNIHRyZWUuCj4gUGF0Y2hlcyAxLTMgbG9vayBPSyB0byBt
ZS4gIEkganVzdCBoYWQgYSBmZXcgY29tbWVudGluZy9jaGFuZ2Vsb2dnaW5nCj4gbmlnZ2xlcy4K
ClRoYW5rcyBmb3IgcmV2aWV3aW5nLCBBbmRyZXcuCgpJIGp1c3QgdXBkYXRlZCB0aGUgc2VyaWVz
IGZvbGxvd2luZyB5b3VyIGNvbW1lbnRzLgoKVGhhbmtzLAoKVGhvbWFzCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
