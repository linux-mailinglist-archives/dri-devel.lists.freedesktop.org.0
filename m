Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EB3132FD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 14:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C88989A;
	Mon,  8 Feb 2021 13:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 127B189175;
 Mon,  8 Feb 2021 13:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3112A2A6046;
 Mon,  8 Feb 2021 14:11:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id gl-1-ceqpwv5; Mon,  8 Feb 2021 14:11:48 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 963742A6042;
 Mon,  8 Feb 2021 14:11:48 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1l96KR-001pkU-U7; Mon, 08 Feb 2021 14:11:47 +0100
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <202102051030.1AF01772D@keescook>
 <CAKMK7uHnOA9CuRxcKkcqG8duOw_3dZobkThcV7Q_swMXVoLCkQ@mail.gmail.com>
 <5a940e13-8996-e9e5-251e-a9af294a39ff@daenzer.net>
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
Message-ID: <9e5de17c-9912-18b3-1e2e-8d6672818504@daenzer.net>
Date: Mon, 8 Feb 2021 14:11:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5a940e13-8996-e9e5-251e-a9af294a39ff@daenzer.net>
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

T24gMjAyMS0wMi0wOCAxMjo0OSBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDIx
LTAyLTA1IDk6NTMgcC5tLiwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gRnJpLCBGZWIgNSwg
MjAyMSBhdCA3OjM3IFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90ZToK
Pj4+Cj4+PiBPbiBGcmksIEZlYiAwNSwgMjAyMSBhdCAwNDozNzo1MlBNICswMDAwLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4+Pj4gVXNlcnNwYWNlIGhhcyBkaXNjb3ZlcmVkIHRoZSBmdW5jdGlvbmFs
aXR5IG9mZmVyZWQgYnkgU1lTX2tjbXAgYW5kIGhhcwo+Pj4+IHN0YXJ0ZWQgdG8gZGVwZW5kIHVw
b24gaXQuIEluIHBhcnRpY3VsYXIsIE1lc2EgdXNlcyBTWVNfa2NtcCBmb3IKPj4+PiBvc19zYW1l
X2ZpbGVfZGVzY3JpcHRpb24oKSBpbiBvcmRlciB0byBpZGVudGlmeSB3aGVuIHR3byBmZCAoZS5n
LiAKPj4+PiBkZXZpY2UKPj4+PiBvciBkbWFidWYpIHBvaW50IHRvIHRoZSBzYW1lIHN0cnVjdCBm
aWxlLiBTaW5jZSB0aGV5IGRlcGVuZCBvbiBpdCBmb3IKPj4+PiBjb3JlIGZ1bmN0aW9uYWxpdHks
IGxpZnQgU1lTX2tjbXAgb3V0IG9mIHRoZSBub24tZGVmYXVsdAo+Pj4+IENPTkZJR19DSEVDS1BP
SU5UX1JFU1RPUkUgaW50byB0aGUgc2VsZWN0YWJsZSBzeXNjYWxsIGNhdGVnb3J5Lgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4+Pj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+Pj4+IENjOiBBbmR5
IEx1dG9taXJza2kgPGx1dG9AYW1hY2FwaXRhbC5uZXQ+Cj4+Pj4gQ2M6IFdpbGwgRHJld3J5IDx3
YWRAY2hyb21pdW0ub3JnPgo+Pj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgo+Pj4+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4+Pj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+PiBDYzogTHVjYXMgU3RhY2gg
PGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4+Pj4gLS0tCj4+Pj4gwqAgaW5pdC9LY29uZmlnwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTEgKysrKysrKysrKysKPj4+PiDCoCBrZXJuZWwvTWFrZWZpbGXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0KPj4+PiDCoCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zZWNjb21wL3NlY2NvbXBfYnBmLmMg
fMKgIDIgKy0KPj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29u
ZmlnCj4+Pj4gaW5kZXggYjc3YzYwZjhiOTYzLi5mNjJmY2ExM2FjNWIgMTAwNjQ0Cj4+Pj4gLS0t
IGEvaW5pdC9LY29uZmlnCj4+Pj4gKysrIGIvaW5pdC9LY29uZmlnCj4+Pj4gQEAgLTExOTQsNiAr
MTE5NCw3IEBAIGVuZGlmICMgTkFNRVNQQUNFUwo+Pj4+IMKgIGNvbmZpZyBDSEVDS1BPSU5UX1JF
U1RPUkUKPj4+PiDCoMKgwqDCoMKgwqAgYm9vbCAiQ2hlY2twb2ludC9yZXN0b3JlIHN1cHBvcnQi
Cj4+Pj4gwqDCoMKgwqDCoMKgIHNlbGVjdCBQUk9DX0NISUxEUkVOCj4+Pj4gK8KgwqDCoMKgIHNl
bGVjdCBLQ01QCj4+Pj4gwqDCoMKgwqDCoMKgIGRlZmF1bHQgbgo+Pj4+IMKgwqDCoMKgwqDCoCBo
ZWxwCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBFbmFibGVzIGFkZGl0aW9uYWwga2VybmVsIGZlYXR1
cmVzIGluIGEgc2FrZSBvZiAKPj4+PiBjaGVja3BvaW50L3Jlc3RvcmUuCj4+Pj4gQEAgLTE3Mzcs
NiArMTczOCwxNiBAQCBjb25maWcgQVJDSF9IQVNfTUVNQkFSUklFUl9DQUxMQkFDS1MKPj4+PiDC
oCBjb25maWcgQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NPUkUKPj4+PiDCoMKgwqDCoMKgwqAg
Ym9vbAo+Pj4+Cj4+Pj4gK2NvbmZpZyBLQ01QCj4+Pj4gK8KgwqDCoMKgIGJvb2wgIkVuYWJsZSBr
Y21wKCkgc3lzdGVtIGNhbGwiIGlmIEVYUEVSVAo+Pj4+ICvCoMKgwqDCoCBkZWZhdWx0IHkKPj4+
Cj4+PiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIG5vdCBkZWZhdWx0LXksIGVzcGVjaWFsbHkg
aWYKPj4+IENIRUNLUE9JTlRfUkVTVE9SRSBkb2VzIGEgInNlbGVjdCIgb24gaXQuCj4+Pgo+Pj4g
VGhpcyBpcyBhIHJlYWxseSBwb3dlcmZ1bCBzeXNjYWxsLCBidXQgaXQgaXMgYm91bmRlZCBieSBw
dHJhY2UgYWNjZXNzCj4+PiBjb250cm9scywgYW5kIHVzZXMgcG9pbnRlciBhZGRyZXNzIG9iZnVz
Y2F0aW9uLCBzbyBpdCBtYXkgYmUgb2theSB0bwo+Pj4gZXhwb3NlIHRoaXMuIEFzIGl0IGlzLCBh
dCBsZWFzdCBVYnVudHUgYWxyZWFkeSBoYXMKPj4+IENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkUs
IHNvIHJlYWxseSwgdGhlcmUncyBwcm9iYWJseSBub3QgbXVjaAo+Pj4gZGlmZmVyZW5jZSBvbiBl
eHBvc3VyZS4KPj4+Cj4+PiBTbywgaWYgeW91IGRyb3AgdGhlICJkZWZhdWx0IHkiLCBJJ20gZmlu
ZSB3aXRoIHRoaXMuCj4+Cj4+IEl0IHdhcyBtYXliZSBzdHVwaWQsIGJ1dCBvdXIgdXNlcnNwYWNl
IHN0YXJ0ZWQgcmVseWluZyBvbiBmZAo+PiBjb21hcHJpc29uIHRocm91Z2ggc3lzX2tjb21wLiBT
byBmb3IgYmV0dGVyIG9yIHdvcnNlLCBpZiB5b3Ugd2FudCB0bwo+PiBydW4gdGhlIG1lc2EzZCBn
bC92ayBzdGFja3MsIHlvdSBuZWVkIHRoaXMuCj4gCj4gVGhhdCdzIG92ZXJzdGF0aW5nIHRoaW5n
cyBzb21ld2hhdC4gVGhlIHZhc3QgbWFqb3JpdHkgb2YgYXBwbGljYXRpb25zIAo+IHdpbGwgd29y
ayBmaW5lIHJlZ2FyZGxlc3MgKGFzIHRoZXkgZGlkIGJlZm9yZSBNZXNhIHN0YXJ0ZWQgdXNpbmcg
dGhpcyAKPiBmdW5jdGlvbmFsaXR5KS4gT25seSBzb21lIHNwZWNpYWwgb25lcyB3aWxsIHJ1biBp
bnRvIGlzc3VlcywgYmVjYXVzZSB0aGUgCj4gdXNlci1zcGFjZSBkcml2ZXJzIGluY29ycmVjdGx5
IGFzc3VtZSB0d28gZmlsZSBkZXNjcmlwdG9ycyByZWZlcmVuY2UgCj4gZGlmZmVyZW50IGRlc2Ny
aXB0aW9ucy4KPiAKPiAKPj4gV2FzIG1heWJlIG5vdCB0aGUgYnJpZ2hlc3QgaWRlYXMsIGJ1dCBz
aW5jZSBlbm91Z2ggZGlzdHJvcyBoYWQgdGhpcwo+PiBlbmFibGVkIGJ5IGRlZmF1bHRzLAo+IAo+
IFJpZ2h0LCB0aGF0IChhbmQgdGhlIGFib3ZlKSBpcyB3aHkgSSBjb25zaWRlcmVkIGl0IGZhaXIg
Z2FtZSB0byB1c2UuIAo+IFdoYXQgc2hvdWxkIEkgaGF2ZSBkb25lIGluc3RlYWQ/IChUQkggSSB3
YXMgc3VycHJpc2VkIHRoYXQgdGhpcyAKPiBmdW5jdGlvbmFsaXR5IGlzbid0IGdlbmVyYWxseSBh
dmFpbGFibGUpCgpJbiB0aGF0IHNwaXJpdCwgYW4gYWx0ZXJuYXRpdmUgbWlnaHQgYmUgdG8gbWFr
ZSBLQ01QX0ZJTEUgYXZhaWxhYmxlIAp1bmNvbmRpdGlvbmFsbHksIGFuZCB0aGUgcmVzdCBvZiBT
WVNfa2NtcCBvbmx5IHdpdGggQ0hFQ0tQT0lOVF9SRVNUT1JFIAphcyBiZWZvcmUuIChPciBtYXli
ZSBvdGhlciBwYXJ0cyBvZiBTWVNfa2NtcCBhcmUgZ2VuZXJhbGx5IHVzZWZ1bCBhcyB3ZWxsPykK
CgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
