Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3B24E6CD
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF64B6E453;
	Sat, 22 Aug 2020 09:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 403D46E44A;
 Sat, 22 Aug 2020 09:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A21602A6042;
 Sat, 22 Aug 2020 11:59:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LofK0gntuQk3; Sat, 22 Aug 2020 11:59:27 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 299122A6016;
 Sat, 22 Aug 2020 11:59:27 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k9QJ4-000AKQ-Nb; Sat, 22 Aug 2020 11:59:26 +0200
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Leo Li <sunpeng.li@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
Date: Sat, 22 Aug 2020 11:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0yMSA4OjA3IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9u
IDIwMjAtMDgtMjEgMTI6NTcgcC5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IEZyb206IE1p
Y2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+Pgo+PiBEb24ndCBjaGVjayBkcm1f
Y3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwgcGVyIGl0cwo+PiBkb2N1bWVudGF0
aW9uIGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6Cj4+Cj4+IMKgICogSGVuY2UgZHJpdmVycyBt
dXN0IG5vdCBjb25zdWx0IEBhY3RpdmUgaW4gdGhlaXIgdmFyaW91cwo+PiDCoCAqICZkcm1fbW9k
ZV9jb25maWdfZnVuY3MuYXRvbWljX2NoZWNrIGNhbGxiYWNrIHRvIHJlamVjdCBhbiBhdG9taWMK
Pj4gwqAgKiBjb21taXQuCj4+Cj4+IFRoZSBhdG9taWMgaGVscGVycyBkaXNhYmxlIHRoZSBDUlRD
IGFzIG5lZWRlZCBmb3IgZGlzYWJsaW5nIHRoZSBwcmltYXJ5Cj4+IHBsYW5lLgo+Pgo+PiBUaGlz
IHByZXZlbnRzIGF0IGxlYXN0IHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMgaWYgdGhlIHByaW1hcnkg
cGxhbmUgZ2V0cwo+PiBkaXNhYmxlZCAoZS5nLiBkdWUgdG8gZGVzdHJveWluZyB0aGUgRkIgYXNz
aWduZWQgdG8gdGhlIHByaW1hcnkgcGxhbmUsCj4+IGFzIGhhcHBlbnMgZS5nLiB3aXRoIG11dHRl
ciBpbiBXYXlsYW5kIG1vZGUpOgo+Pgo+PiAqIFRvZ2dsaW5nIENSVEMgYWN0aXZlIHRvIDEgZmFp
bGVkIGlmIHRoZSBjdXJzb3IgcGxhbmUgd2FzIGVuYWJsZWQKPj4gwqDCoCAoZS5nLiB2aWEgbGVn
YWN5IERQTVMgcHJvcGVydHkgJiBjdXJzb3IgaW9jdGwpLgo+PiAqIEVuYWJsaW5nIHRoZSBjdXJz
b3IgcGxhbmUgZmFpbGVkLCBlLmcuIHZpYSB0aGUgbGVnYWN5IGN1cnNvciBpb2N0bC4KPiAKPiBX
ZSBwcmV2aW91c2x5IGhhZCB0aGUgcmVxdWlyZW1lbnQgdGhhdCB0aGUgcHJpbWFyeSBwbGFuZSBt
dXN0IGJlIGVuYWJsZWQKPiBidXQgc29tZSB1c2Vyc3BhY2UgZXhwZWN0cyB0aGF0IHRoZXkgY2Fu
IGVuYWJsZSBqdXN0IHRoZSBvdmVybGF5IHBsYW5lCj4gd2l0aG91dCBhbnl0aGluZyBlbHNlLgo+
IAo+IEkgdGhpbmsgdGhlIGNocm9tdWl1bW9zIGF0b21pY3Rlc3QgdmFsaWRhdGVzIHRoYXQgdGhp
cyB3b3JrcyBhcyB3ZWxsOgo+IAo+IFNvIGlzIERSTSBnb2luZyBmb3J3YXJkIHRoZW4gd2l0aCB0
aGUgZXhwZWN0YXRpb24gdGhhdCB0aGlzIGlzIHdyb25nCj4gYmVoYXZpb3IgZnJvbSB1c2Vyc3Bh
Y2U/Cj4gCj4gV2UgcmVxdWlyZSBhdCBsZWFzdCBvbmUgcGxhbmUgdG8gYmUgZW5hYmxlZCB0byBk
aXNwbGF5IGEgY3Vyc29yLCBidXQgaXQKPiBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQgdG8gYmUg
dGhlIHByaW1hcnkuCgpJdCdzIGEgInBpY2sgeW91ciBwb2lzb24iIHNpdHVhdGlvbjoKCjEpIEN1
cnJlbnRseSB0aGUgY2hlY2tzIGFyZSBpbnZhbGlkIChhdG9taWNfY2hlY2sgbXVzdCBub3QgZGVj
aWRlIGJhc2VkCm9uIGRybV9jcnRjX3N0YXRlOjphY3RpdmUpLCBhbmQgaXQncyBlYXN5IGZvciBs
ZWdhY3kgS01TIHVzZXJzcGFjZSB0bwphY2NpZGVudGFsbHkgaGl0IGVycm9ycyB0cnlpbmcgdG8g
ZW5hYmxlL21vdmUgdGhlIGN1cnNvciBvciBzd2l0Y2ggRFBNUwpvZmYg4oaSIG9uLgoKMikgQWNj
dXJhdGVseSByZWplY3Rpbmcgb25seSBhdG9taWMgc3RhdGVzIHdoZXJlIHRoZSBjdXJzb3IgcGxh
bmUgaXMKZW5hYmxlZCBidXQgYWxsIG90aGVyIHBsYW5lcyBhcmUgb2ZmIHdvdWxkIGJyZWFrIHRo
ZSBLTVMgaGVscGVyIGNvZGUsCndoaWNoIGNhbiBvbmx5IGRlYWwgd2l0aCB0aGUgIkNSVEMgb24g
JiBwcmltYXJ5IHBsYW5lIG9mZiBpcyBub3QKYWxsb3dlZCIgY2FzZSBzcGVjaWZpY2FsbHkuCgoz
KSBUaGlzIHBhdGNoIGFkZHJlc3NlcyAxKSAmIDIpIGJ1dCBtYXkgYnJlYWsgZXhpc3RpbmcgYXRv
bWljIHVzZXJzcGFjZQp3aGljaCB3YW50cyB0byBlbmFibGUgYW4gb3ZlcmxheSBwbGFuZSB3aGls
ZSBkaXNhYmxpbmcgdGhlIHByaW1hcnkgcGxhbmUuCgoKSSBkbyB0aGluayBpbiBwcmluY2lwbGUg
YXRvbWljIHVzZXJzcGFjZSBpcyBleHBlY3RlZCB0byBoYW5kbGUgY2FzZSAzKQphbmQgbGVhdmUg
dGhlIHByaW1hcnkgcGxhbmUgZW5hYmxlZC4gSG93ZXZlciwgdGhpcyBpcyBub3QgaWRlYWwgZnJv
bSBhbgplbmVyZ3kgY29uc3VtcHRpb24gUG9WLiBUaGVyZWZvcmUsIGhlcmUncyBhbm90aGVyIGlk
ZWEgZm9yIGEgcG9zc2libGUKd2F5IG91dCBvZiB0aGlzIHF1YWdtaXJlOgoKYW1kZ3B1X2RtIGRv
ZXMgbm90IHJlamVjdCBhbnkgYXRvbWljIHN0YXRlcyBiYXNlZCBvbiB3aGljaCBwbGFuZXMgYXJl
CmVuYWJsZWQgaW4gaXQuIElmIHRoZSBjdXJzb3IgcGxhbmUgaXMgZW5hYmxlZCBidXQgYWxsIG90
aGVyIHBsYW5lcyBhcmUKb2ZmLCBhbWRncHVfZG0gaW50ZXJuYWxseSBlaXRoZXI6CgphKSBFbmFi
bGVzIGFuIG92ZXJsYXkgcGxhbmUgYW5kIG1ha2VzIGl0IGludmlzaWJsZSwgZS5nLiBieSBhc3Np
Z25pbmcgYQptaW5pbXVtIHNpemUgRkIgd2l0aCBhbHBoYSA9IDAuCgpiKSBFbmFibGVzIHRoZSBw
cmltYXJ5IHBsYW5lIGFuZCBhc3NpZ25zIGEgbWluaW11bSBzaXplIEZCIChzY2FsZWQgdXAgdG8K
dGhlIHJlcXVpcmVkIHNpemUpIGNvbnRhaW5pbmcgYWxsIGJsYWNrLCBwb3NzaWJseSB1c2luZyBj
b21wcmVzc2lvbi4KKFRyeWluZyB0byBtaW5pbWl6ZSB0aGUgbWVtb3J5IGJhbmR3aWR0aCkKCgpE
b2VzIGVpdGhlciBvZiB0aGVzZSBzZWVtIGZlYXNpYmxlPyBJZiBib3RoIGRvLCB3aGljaCBvbmUg
d291bGQgYmUKcHJlZmVyYWJsZT8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
