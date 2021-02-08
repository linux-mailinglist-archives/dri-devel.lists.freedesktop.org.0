Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD7313155
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405A6E8B3;
	Mon,  8 Feb 2021 11:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 801B26E8B2;
 Mon,  8 Feb 2021 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1EB102A6046;
 Mon,  8 Feb 2021 12:49:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OJzn5Nd4XMaf; Mon,  8 Feb 2021 12:49:30 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 641222A6042;
 Mon,  8 Feb 2021 12:49:30 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1l952n-001pI0-CW; Mon, 08 Feb 2021 12:49:29 +0100
To: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <202102051030.1AF01772D@keescook>
 <CAKMK7uHnOA9CuRxcKkcqG8duOw_3dZobkThcV7Q_swMXVoLCkQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
Message-ID: <5a940e13-8996-e9e5-251e-a9af294a39ff@daenzer.net>
Date: Mon, 8 Feb 2021 12:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHnOA9CuRxcKkcqG8duOw_3dZobkThcV7Q_swMXVoLCkQ@mail.gmail.com>
Content-Language: en-CA
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
Cc: Will Drewry <wad@chromium.org>, Jann Horn <jannh@google.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0wNSA5OjUzIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBG
ZWIgNSwgMjAyMSBhdCA3OjM3IFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3
cm90ZToKPj4KPj4gT24gRnJpLCBGZWIgMDUsIDIwMjEgYXQgMDQ6Mzc6NTJQTSArMDAwMCwgQ2hy
aXMgV2lsc29uIHdyb3RlOgo+Pj4gVXNlcnNwYWNlIGhhcyBkaXNjb3ZlcmVkIHRoZSBmdW5jdGlv
bmFsaXR5IG9mZmVyZWQgYnkgU1lTX2tjbXAgYW5kIGhhcwo+Pj4gc3RhcnRlZCB0byBkZXBlbmQg
dXBvbiBpdC4gSW4gcGFydGljdWxhciwgTWVzYSB1c2VzIFNZU19rY21wIGZvcgo+Pj4gb3Nfc2Ft
ZV9maWxlX2Rlc2NyaXB0aW9uKCkgaW4gb3JkZXIgdG8gaWRlbnRpZnkgd2hlbiB0d28gZmQgKGUu
Zy4gZGV2aWNlCj4+PiBvciBkbWFidWYpIHBvaW50IHRvIHRoZSBzYW1lIHN0cnVjdCBmaWxlLiBT
aW5jZSB0aGV5IGRlcGVuZCBvbiBpdCBmb3IKPj4+IGNvcmUgZnVuY3Rpb25hbGl0eSwgbGlmdCBT
WVNfa2NtcCBvdXQgb2YgdGhlIG5vbi1kZWZhdWx0Cj4+PiBDT05GSUdfQ0hFQ0tQT0lOVF9SRVNU
T1JFIGludG8gdGhlIHNlbGVjdGFibGUgc3lzY2FsbCBjYXRlZ29yeS4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4+IENjOiBL
ZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPj4+IENjOiBBbmR5IEx1dG9taXJza2kg
PGx1dG9AYW1hY2FwaXRhbC5uZXQ+Cj4+PiBDYzogV2lsbCBEcmV3cnkgPHdhZEBjaHJvbWl1bS5v
cmc+Cj4+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPj4+
IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4+PiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+Pj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJv
bml4LmRlPgo+Pj4gLS0tCj4+PiAgIGluaXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4+PiAgIGtlcm5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4+PiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3NlY2NvbXAvc2VjY29tcF9icGYuYyB8ICAyICstCj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5p
dC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCj4+PiBpbmRleCBiNzdjNjBmOGI5NjMuLmY2MmZjYTEz
YWM1YiAxMDA2NDQKPj4+IC0tLSBhL2luaXQvS2NvbmZpZwo+Pj4gKysrIGIvaW5pdC9LY29uZmln
Cj4+PiBAQCAtMTE5NCw2ICsxMTk0LDcgQEAgZW5kaWYgIyBOQU1FU1BBQ0VTCj4+PiAgIGNvbmZp
ZyBDSEVDS1BPSU5UX1JFU1RPUkUKPj4+ICAgICAgICBib29sICJDaGVja3BvaW50L3Jlc3RvcmUg
c3VwcG9ydCIKPj4+ICAgICAgICBzZWxlY3QgUFJPQ19DSElMRFJFTgo+Pj4gKyAgICAgc2VsZWN0
IEtDTVAKPj4+ICAgICAgICBkZWZhdWx0IG4KPj4+ICAgICAgICBoZWxwCj4+PiAgICAgICAgICBF
bmFibGVzIGFkZGl0aW9uYWwga2VybmVsIGZlYXR1cmVzIGluIGEgc2FrZSBvZiBjaGVja3BvaW50
L3Jlc3RvcmUuCj4+PiBAQCAtMTczNyw2ICsxNzM4LDE2IEBAIGNvbmZpZyBBUkNIX0hBU19NRU1C
QVJSSUVSX0NBTExCQUNLUwo+Pj4gICBjb25maWcgQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NP
UkUKPj4+ICAgICAgICBib29sCj4+Pgo+Pj4gK2NvbmZpZyBLQ01QCj4+PiArICAgICBib29sICJF
bmFibGUga2NtcCgpIHN5c3RlbSBjYWxsIiBpZiBFWFBFUlQKPj4+ICsgICAgIGRlZmF1bHQgeQo+
Pgo+PiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIG5vdCBkZWZhdWx0LXksIGVzcGVjaWFsbHkg
aWYKPj4gQ0hFQ0tQT0lOVF9SRVNUT1JFIGRvZXMgYSAic2VsZWN0IiBvbiBpdC4KPj4KPj4gVGhp
cyBpcyBhIHJlYWxseSBwb3dlcmZ1bCBzeXNjYWxsLCBidXQgaXQgaXMgYm91bmRlZCBieSBwdHJh
Y2UgYWNjZXNzCj4+IGNvbnRyb2xzLCBhbmQgdXNlcyBwb2ludGVyIGFkZHJlc3Mgb2JmdXNjYXRp
b24sIHNvIGl0IG1heSBiZSBva2F5IHRvCj4+IGV4cG9zZSB0aGlzLiBBcyBpdCBpcywgYXQgbGVh
c3QgVWJ1bnR1IGFscmVhZHkgaGFzCj4+IENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkUsIHNvIHJl
YWxseSwgdGhlcmUncyBwcm9iYWJseSBub3QgbXVjaAo+PiBkaWZmZXJlbmNlIG9uIGV4cG9zdXJl
Lgo+Pgo+PiBTbywgaWYgeW91IGRyb3AgdGhlICJkZWZhdWx0IHkiLCBJJ20gZmluZSB3aXRoIHRo
aXMuCj4gCj4gSXQgd2FzIG1heWJlIHN0dXBpZCwgYnV0IG91ciB1c2Vyc3BhY2Ugc3RhcnRlZCBy
ZWx5aW5nIG9uIGZkCj4gY29tYXByaXNvbiB0aHJvdWdoIHN5c19rY29tcC4gU28gZm9yIGJldHRl
ciBvciB3b3JzZSwgaWYgeW91IHdhbnQgdG8KPiBydW4gdGhlIG1lc2EzZCBnbC92ayBzdGFja3Ms
IHlvdSBuZWVkIHRoaXMuCgpUaGF0J3Mgb3ZlcnN0YXRpbmcgdGhpbmdzIHNvbWV3aGF0LiBUaGUg
dmFzdCBtYWpvcml0eSBvZiBhcHBsaWNhdGlvbnMgCndpbGwgd29yayBmaW5lIHJlZ2FyZGxlc3Mg
KGFzIHRoZXkgZGlkIGJlZm9yZSBNZXNhIHN0YXJ0ZWQgdXNpbmcgdGhpcyAKZnVuY3Rpb25hbGl0
eSkuIE9ubHkgc29tZSBzcGVjaWFsIG9uZXMgd2lsbCBydW4gaW50byBpc3N1ZXMsIGJlY2F1c2Ug
dGhlIAp1c2VyLXNwYWNlIGRyaXZlcnMgaW5jb3JyZWN0bHkgYXNzdW1lIHR3byBmaWxlIGRlc2Ny
aXB0b3JzIHJlZmVyZW5jZSAKZGlmZmVyZW50IGRlc2NyaXB0aW9ucy4KCgo+IFdhcyBtYXliZSBu
b3QgdGhlIGJyaWdoZXN0IGlkZWFzLCBidXQgc2luY2UgZW5vdWdoIGRpc3Ryb3MgaGFkIHRoaXMK
PiBlbmFibGVkIGJ5IGRlZmF1bHRzLAoKUmlnaHQsIHRoYXQgKGFuZCB0aGUgYWJvdmUpIGlzIHdo
eSBJIGNvbnNpZGVyZWQgaXQgZmFpciBnYW1lIHRvIHVzZS4gCldoYXQgc2hvdWxkIEkgaGF2ZSBk
b25lIGluc3RlYWQ/IChUQkggSSB3YXMgc3VycHJpc2VkIHRoYXQgdGhpcyAKZnVuY3Rpb25hbGl0
eSBpc24ndCBnZW5lcmFsbHkgYXZhaWxhYmxlKQoKPiBpdCB3YXNuJ3QgcmVhbGx5IGRpc2NvdmVy
ZWQsIGFuZCBub3cgd2UncmUKPiBzaGlwcGluZyB0aGlzIGV2ZXJ5d2hlcmUuCgpZb3UncmUgbWFr
aW5nIGl0IHNvdW5kIGxpa2UgdGhpcyBzbnVjayBpbiBzZWNyZXRseSBzb21laG93LCB3aGljaCBp
cyBub3QgCnRydWUgb2YgY291cnNlLgoKCj4gT2ZjIHdlIGNhbiBsZWF2ZSB0aGUgZGVmYXVsdCBu
LCBidXQgdGhlIHNlbGVjdCBpZiBDT05GSUdfRFJNIGlzCj4gdW5mb3J0dW5hdGVseSBuZWVkZWQg
SSB0aGluay4KClBlciBhYm92ZSwgbm90IHN1cmUgdGhpcyBpcyByZWFsbHkgdHJ1ZS4KCgotLSAK
RWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0
dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
