Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFCBA72C8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 20:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF80897E0;
	Tue,  3 Sep 2019 18:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3969C897E0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 18:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7867B40D0C;
 Tue,  3 Sep 2019 20:50:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRcii8GsqU50; Tue,  3 Sep 2019 20:50:24 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A531140D00;
 Tue,  3 Sep 2019 20:50:21 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F006B360160;
 Tue,  3 Sep 2019 20:50:20 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: Dave Hansen <dave.hansen@intel.com>, dri-devel@lists.freedesktop.org,
 pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <10077630-7081-1e57-adc1-222a8d8044a9@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <1bec048b-8633-4f65-0657-41f65271bcce@shipmail.org>
Date: Tue, 3 Sep 2019 20:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <10077630-7081-1e57-adc1-222a8d8044a9@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567536621; bh=COg09Ux0mAj//sB2QvfCBwzBAr1fbPeuGcgSSK2ZdU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wr03xhIOR9RY1X7HM9n6S4aNVT4eh1EuOiQlamFgfHQhTzA7Jlg54IpQfOHl4oh9X
 FxVqArRVh/nJ7docmuE1Hd4XzXWNT0mBIIpx8epKwTdRRFagABN3dv9ifbfiCatN05
 r44eXTidjSL7x/AtoKO24fXm5sjHe4AU9QPZyZNs=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Wr03xhIO; 
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8zLzE5IDU6MTQgUE0sIERhdmUgSGFuc2VuIHdyb3RlOgo+IE9uIDkvMy8xOSA2OjE1IEFN
LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gVGhlIGZvcmNlX2RtYV91bmVu
Y3J5cHRlZCBzeW1ib2wgaXMgbmVlZGVkIGJ5IFRUTSB0byBzZXQgdXAgdGhlIGNvcnJlY3QKPj4g
cGFnZSBwcm90ZWN0aW9uIHdoZW4gbWVtb3J5IGVuY3J5cHRpb24gaXMgYWN0aXZlLiBFeHBvcnQg
aXQuCj4gSXQgd291bGQgYmUgZ3JlYXQgaWYgdGhpcyBoYWQgZW5vdWdoIGJhY2tncm91bmQgdGhh
dCBJIGRpZG4ndCBoYXZlIHRvCj4gbG9vayBhdCBwYXRjaCA0IHRvIGZpZ3VyZSBvdXQgd2hhdCBU
VE0gbWlnaHQgYmUuCj4KPiBXaHkgaXMgVFRNIHNwZWNpYWw/ICBIb3cgbWFueSBvdGhlciBkcml2
ZXJzIHdvdWxkIGhhdmUgdG8gYmUgbW9kaWZpZWQgaW4KPiBhIG9uZS1vZmYgZmFzaGlvbiBpZiB3
ZSBnbyB0aGlzIHdheT8gIFdoYXQncyB0aGUgbG9naWMgYmVoaW5kIHRoaXMgYmVpbmcKPiBhIG5v
bi1HUEwgZXhwb3J0PwoKVFRNIHRyaWVzIHRvIGFic3RyYWN0IG1hcHBpbmcgb2YgZ3JhcGhpY3Mg
YnVmZmVyIG9iamVjdHMgcmVnYXJkbGVzcyAKd2hlcmUgdGhleSBsaXZlLiBCZSBpdCBpbiBwY2kg
bWVtb3J5IG9yIHN5c3RlbSBtZW1vcnkuIEFzIHN1Y2ggaXQgbmVlZHMgCnRvIGZpZ3VyZSBvdXQg
dGhlIHByb3BlciBwYWdlIHByb3RlY3Rpb24uIEZvciBleGFtcGxlIGlmIGEgYnVmZmVyIG9iamVj
dCAKaXMgbW92ZWQgZnJvbSBwY2kgbWVtb3J5IHRvIHN5c3RlbSBtZW1vcnkgdHJhbnNwYXJlbnRs
eSB0byBhIHVzZXItc3BhY2UgCmFwcGxpY2F0aW9uLCBhbGwgdXNlci1zcGFjZSBtYXBwaW5ncyBu
ZWVkIHRvIGJlIGtpbGxlZCBhbmQgdGhlbiAKcmVpbnN0YXRlZCBwb2ludGluZyB0byB0aGUgbmV3
IGxvY2F0aW9uLCBzb21ldGltZXMgd2l0aCBhIG5ldyBwYWdlIApwcm90ZWN0aW9uLgoKSSB0cnkg
dG8ga2VlcCBhd2F5IGFzIG11Y2ggYXMgcG9zc2libGUgZnJvbSB0aGUgbm9uLUdQTCB2cyBHUEwg
ZXhwb3J0IApkaXNjdXNzaW9ucy4gSSBoYXZlIG5vIHN0cm9uZyBvcGluaW9uIG9uIHRoZSBzdWJq
ZWN0LiBBbHRob3VnaCBzaW5jZSAKc2V2X2FjdGl2ZSgpIGlzIGEgbm9uLUdQTCBleHBvcnQsIEkg
ZGVjaWRlZCB0byBtaW1pYyB0aGF0LgoKVGhhbmtzClRob21hcwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
