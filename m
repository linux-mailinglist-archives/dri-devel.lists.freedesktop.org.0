Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495FA86FA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 19:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670398951E;
	Wed,  4 Sep 2019 17:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92289C84
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 17:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AFEFB40CFE;
 Wed,  4 Sep 2019 19:28:29 +0200 (CEST)
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
 with ESMTP id rBGq5zMsLeAq; Wed,  4 Sep 2019 19:28:28 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3031640CF9;
 Wed,  4 Sep 2019 19:28:16 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7ADB6360160;
 Wed,  4 Sep 2019 19:28:16 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: Christoph Hellwig <hch@infradead.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <20190903134627.GA2951@infradead.org>
 <f85e7fa6-54e1-7ac5-ce6c-96349c7af322@shipmail.org>
 <20190903162204.GB23281@infradead.org>
 <558f1224-d157-5848-1752-1430a5b3947e@shipmail.org>
 <20190904065823.GA31794@infradead.org>
 <8698dc21-8679-b4a7-3179-71589fa33ab7@shipmail.org>
 <20190904122204.GA16937@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <4cb5a2b4-cbd0-a86d-7881-f3d750df7d0e@shipmail.org>
Date: Wed, 4 Sep 2019 19:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190904122204.GA16937@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567618096; bh=g/YBsHGIYYFph7qo+7u1a+3fuQm1INNdutAJRrM12b0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iERqBUulThtpa34mSoRstP7r957CqdVD6ctHb8Ma8Wk2aPgzDiav67Q0WmgAvmG5b
 wXyLpgdeIgGXnAakCc+wuacTDhEZm8LymtGPX3t0ofQHAdrGGhux8O+sQGbp3hjbe8
 +f/GcL1KwCTpOmhi0+GC0ha3hNVowvOcwcVaXZsU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iERqBUul; 
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
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDI6MjIgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFdlZCwgU2Vw
IDA0LCAyMDE5IGF0IDA5OjMyOjMwQU0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IHdyb3RlOgo+PiBUaGF0IHNvdW5kcyBncmVhdC4gSXMgdGhlcmUgYW55dGhpbmcgSSBjYW4gZG8g
dG8gaGVscCBvdXQ/IEkgdGhvdWdodCB0aGlzCj4+IHdhcyBtb3JlIG9yIGxlc3MgYSBkZWFkIGVu
ZCBzaW5jZSB0aGUgY3VycmVudCBkbWFfbW1hcF8gQVBJIHJlcXVpcmVzIHRoZQo+PiBtbWFwX3Nl
bSB0byBiZSBoZWxkIGluIHdyaXRlIG1vZGUgKG1vZGlmeWluZyB0aGUgdm1hLT52bV9mbGFncykg
d2hlcmVhcwo+PiBmYXVsdCgpIG9ubHkgb2ZmZXJzIHJlYWQgbW9kZS4gQnV0IHRoYXQgd291bGQg
ZGVmaW5pdGVseSB3b3JrLgo+IFdlJ2xsIGp1c3QgbmVlZCB0byBzcGxpdCBpbnRvIGEgc2V0dXAg
YW5kIGZhdWwgcGhhc2UuICBJIGhhdmUgc29tZQo+IHNrZXRjaGVzIGZyb20gYSB3aGlsZSBhZ28s
IGxldCBtZSBkdXN0IHRoZW0gb2ZmIHNvIHRoYXQgeW91IGNhbgo+IHRyeSB0aGVtLgoKSSdkIGJl
IGhhcHB5IHRvLgoKVGhhbmtzLAoKVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
