Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA499F332
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 21:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F88A89BFD;
	Tue, 27 Aug 2019 19:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0F389BFD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 19:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 732364059E;
 Tue, 27 Aug 2019 21:19:07 +0200 (CEST)
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
 with ESMTP id zu0RvCVW-pqz; Tue, 27 Aug 2019 21:19:06 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 388B1405F0;
 Tue, 27 Aug 2019 21:19:04 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B95A436014E;
 Tue, 27 Aug 2019 21:19:04 +0200 (CEST)
Subject: Re: [PATCH v2 2/4] x86/vmware: Add a header file for hypercall
 definitions
To: Borislav Petkov <bp@alien8.de>
References: <20190823081316.28478-1-thomas_os@shipmail.org>
 <20190823081316.28478-3-thomas_os@shipmail.org>
 <20190827154422.GG29752@zn.tnic>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <b82e190e-6887-b95a-a99a-176f22c57b7b@shipmail.org>
Date: Tue, 27 Aug 2019 21:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190827154422.GG29752@zn.tnic>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566933544; bh=U6aBWjUWM6fEeaY29MHDvEVPT7WoNvsf/aWbWHi01ms=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EPvQRxv7iMa6p0KoJfJihtF4Sht/v2H+qZfzTy34GNGVopgtL3/IFt8HblxG3zp1q
 Fnan90CcmCkhp7sdmfZ0zhAF4WE7nFt08wClQSv6GF4wlza3yzpqEvK1nQSjL4cOS/
 mv2HG2mM6pTGgKhLtkmm81FVvWLc9mkyirVb/PAE=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EPvQRxv7; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Covelli <dcovelli@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yNy8xOSA1OjQ0IFBNLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MjMsIDIwMTkgYXQgMTA6MTM6MTRBTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkg
d3JvdGU6Cj4+ICsvKgo+PiArICogVGhlIGhpZ2ggYmFuZHdpZHRoIG91dCBjYWxsLiBUaGUgbG93
IHdvcmQgb2YgZWR4IGlzIHByZXN1bWVkIHRvIGhhdmUgdGhlCj4+ICsgKiBIQiBhbmQgT1VUIGJp
dHMgc2V0Lgo+PiArICovCj4+ICsjZGVmaW5lIFZNV0FSRV9IWVBFUkNBTExfSEJfT1VUCQkJCQkJ
XAo+PiArCUFMVEVSTkFUSVZFXzIoIm1vdncgJCIgVk1XQVJFX0hZUEVSVklTT1JfUE9SVF9IQiAi
LCAlJWR4OyByZXAgb3V0c2IiLCBcCj4gSG1tLCB0aGF0IGxvb2tzIGZpc2h5Ogo+Cj4gVGhpcyBj
YWxsIGluIHZtd19wb3J0X2hiX291dCgpLCBmb3IgZXhhbXBsZSwgZ2V0cyBjb252ZXJ0ZWQgdG8g
dGhlIGFzbQo+IGJlbG93IChJJ3ZlIGxlZnQgaW4gdGhlIGFzbSB0b3VjaGluZyBvbmx5IHJEWCku
Cj4KPiAjIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jOjE2MDogICAgICAgICAg
ICAgIFZNV19QT1JUX0hCX09VVCgKPiAjTk9fQVBQCj4gICAgICAgICAgbW92endsICAwKCVyYnAp
LCAlZWR4ICAgIyBjaGFubmVsXzIwKEQpLT5jaGFubmVsX2lkLCBjaGFubmVsXzIwKEQpLT5jaGFu
bmVsX2lkCj4KPiAJLi4uCj4KPiAgICAgICAgICBzYWxsICAgICQxNiwgJWVkeCAgICAgICAjLCB0
bXAxNzIKPiAgICAgICAgICBvcmwgICAgICQzLCAlZWR4ICAgICAgICAjLCB0bXAxNzMKPgo+IHRo
aXMgaXMgYWRkaW5nIGNoYW5uZWxfaWQgYW5kIGZsYWdzOgo+Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIFZNV0FSRV9IWVBFUlZJU09SX0hCIHwgKGNoYW5uZWwtPmNoYW5uZWxfaWQgPDwgMTYp
IHwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgVk1XQVJFX0hZUEVSVklTT1JfT1VULAo+Cj4g
dGhlICQzIGJlaW5nIChWTVdBUkVfSFlQRVJWSVNPUl9IQiB8IFZNV0FSRV9IWVBFUlZJU09SX09V
VCkuCj4KPiAgICAgICAgICBtb3ZzbHEgICVlZHgsICVyZHggICAgICAjIHRtcDE3MywgdG1wMTc0
Cj4KPiBIZXJlIGl0IGlzIHNpZ24tZXh0ZW5kaW5nIGl0Lgo+Cj4gI0FQUAo+ICMgMTYwICJkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cuYyIgMQo+ICAgICAgICAgIHB1c2ggJXJicDtt
b3YgJXI4LCAlcmJwOyMgQUxUOiBvbGRpbnN0cjIgICAgICAgICMgYnAKPiA2NjE6Cj4gICAgICAg
ICAgbW92dyAkMHg1NjU5LCAlZHg7IHJlcCBvdXRzYgo+Cj4gQW5kIG5vdyBoZXJlIHlvdSdyZSBv
dmVyd3JpdGluZyB0aGUgbG93IHdvcmQgb2YgJWVkeC4gQW5kIG5vdyBpdAo+IGNvbnRhaW5zOgo+
Cj4gMHhbY2hhbm5lbF9pZF01NjU5Cj4KPiBhbmQgdGhlIGxvdyB3b3JkIGRvZXNuJ3QgY29udGFp
biB0aGUgMywgaS5lLiwgKFZNV0FSRV9IWVBFUlZJU09SX0hCIHwKPiBWTVdBUkVfSFlQRVJWSVNP
Ul9PVVQpIGFueW1vcmUuIEFuZCB0aGF0J3MgYmVmb3JlIHlvdSBkbyB0aGUgaHlwZXJjYWxsCj4g
c28gSSdtIGd1ZXNzaW5nIHRoYXQgY2Fubm90IGJlIHJpZ2h0Lgo+Cj4gT3I/Cj4KSXQgc2hvdWxk
IGJlIGNvcnJlY3QuIFRoZSBmbGFncyBWTVdBUkVfSFlQRVJWSVNPUl9IQiBhbmQgClZNV0FSRV9I
WVBFUlZJU09SX09VVCBhcmUgb25seSB2YWxpZCBmb3IgdGhlIHZtY2FsbCAvIHZtbWNhbGwgdmVy
c2lvbnMuCgpGb3IgdGhlIGxlZ2FjeSB2ZXJzaW9uLCB0aGUgZGlyZWN0aW9uIGlzIHRvZ2dsZWQg
YnkgdGhlIGluc3RydWN0aW9uIChpbiAKdnMgb3V0KSBhbmQgTEIgdnMgSEIgaXMgdG9nZ2xlZCBi
eSB0aGUgcG9ydCBudW1iZXIgKDB4NTY1OCB2cyAweDU2NTkpCgpTbyBpbiBlc3NlbmNlIHRoZSBs
b3cgd29yZCBkZWZpbml0aW9uIG9mICVlZHggaXMgZGlmZmVyZW50IGluIHRoZSB0d28gCnZlcnNp
b25zLiBJJ3ZlIGNob3NlbiB0byB1c2UgdGhlIG5ldyB2bWNhbGwvdm1tY2FsbCBkZWZpbml0aW9u
IGluIHRoZSAKZHJpdmVyIGNvZGUuCgovVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
