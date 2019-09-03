Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75583A6B93
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 16:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADCF89453;
	Tue,  3 Sep 2019 14:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948B89453
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 44BA53F4A9;
 Tue,  3 Sep 2019 16:32:48 +0200 (CEST)
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
 with ESMTP id oW0OkYyiGZjb; Tue,  3 Sep 2019 16:32:47 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 3C3E93F2FD;
 Tue,  3 Sep 2019 16:32:46 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A7BDE360160;
 Tue,  3 Sep 2019 16:32:45 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: Christoph Hellwig <hch@infradead.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <20190903134627.GA2951@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <f85e7fa6-54e1-7ac5-ce6c-96349c7af322@shipmail.org>
Date: Tue, 3 Sep 2019 16:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903134627.GA2951@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567521165; bh=/805ZXlNYXSisVqi0x/md+Q3IesljeoqWyVEVyrXk8Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bDjRxB8OMjXkoKyTdgxOneprJuQBuRVgZLRziMd2Pmu8V/sbBYIUQNwDgPg06gMCb
 Fvfyr2FYvcLgGITa8JY0QnqXW79ZGQwKBmiWZ2uRpxcBEaKpIClkhDlaf63H/w5kU4
 GNUAJGnGglDhyly3tg6UiNiVv4lg4rQzf+7MCi6M=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=bDjRxB8O; 
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

SGksIENocmlzdG9waCwKCk9uIDkvMy8xOSAzOjQ2IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwMzoxNTowMVBNICswMjAwLCBUaG9tYXMgSGVs
bHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxz
dHJvbUB2bXdhcmUuY29tPgo+Pgo+PiBUaGUgZm9yY2VfZG1hX3VuZW5jcnlwdGVkIHN5bWJvbCBp
cyBuZWVkZWQgYnkgVFRNIHRvIHNldCB1cCB0aGUgY29ycmVjdAo+PiBwYWdlIHByb3RlY3Rpb24g
d2hlbiBtZW1vcnkgZW5jcnlwdGlvbiBpcyBhY3RpdmUuIEV4cG9ydCBpdC4KPiBOQUsuICBUaGlz
IGlzIGEgaGVscGVyIGZvciB0aGUgY29yZSBETUEgY29kZSBhbmQgZHJpdmVycyBoYXZlIG5vCj4g
YnVzaW5lc3MgbG9va2luZyBhdCBpdC4KCklzIHRoaXMgYSBsYXllciB2aW9sYXRpb24gY29uY2Vy
biwgdGhhdCBpcywgd291bGQgeW91IGJlIG9rIHdpdGggYSAKc2ltaWxhciBoZWxwZXIgZm9yIFRU
TSwgb3IgaXMgaXQgdGhhdCB5b3Ugd2FudCB0byBmb3JjZSB0aGUgZ3JhcGhpY3MgCmRyaXZlcnMg
aW50byBhZGhlcmluZyBzdHJpY3RseSB0byB0aGUgRE1BIGFwaSwgZXZlbiB3aGVuIGl0IGZyb20g
YW4gCmVuZ2luZWVyaW5nIHBlcnNwZWN0aXZlIG1ha2VzIG5vIHNlbnNlPwoKSWYgaXQncyB0aGUg
bGF0dGVyLCB0aGVuIEkgd291bGQgbGlrZSB0byByZWl0ZXJhdGUgdGhhdCBpdCB3b3VsZCBiZSAK
YmV0dGVyIHRoYXQgd2Ugd29yayB0byBjb21lIHVwIHdpdGggYSBsb25nIHRlcm0gcGxhbiB0byBh
ZGQgd2hhdCdzIAptaXNzaW5nIHRvIHRoZSBETUEgYXBpIHRvIGhlbHAgZ3JhcGhpY3MgZHJpdmVy
cyB1c2UgY29oZXJlbnQgbWVtb3J5PwoKVGhhbmtzLAoKVGhvbWFzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
