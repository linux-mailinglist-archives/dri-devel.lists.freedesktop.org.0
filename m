Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05682CA0C2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E876E578;
	Tue,  1 Dec 2020 11:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FC106E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7225D2A6045;
 Tue,  1 Dec 2020 12:03:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id bqE4FN7cQUHm; Tue,  1 Dec 2020 12:03:26 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3A8C32A6016;
 Tue,  1 Dec 2020 12:03:26 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kk3RN-001qYk-DO; Tue, 01 Dec 2020 12:03:25 +0100
To: Alexander Monakov <amonakov@ispras.ru>, dri-devel@lists.freedesktop.org
References: <alpine.LNX.2.20.13.2011301603550.26319@monopod.intra.ispras.ru>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: GPU-side memory protection landscape
Message-ID: <b4107a13-7f4f-ac03-fb15-952dd6039cb9@daenzer.net>
Date: Tue, 1 Dec 2020 12:03:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.20.13.2011301603550.26319@monopod.intra.ispras.ru>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMS0zMCAzOjA3IHAubS4sIEFsZXhhbmRlciBNb25ha292IHdyb3RlOgo+IAo+IE15
IG90aGVyIGNvbmNlcm4gaXMgaG93IGVhc3kgaXQgaXMgdG8gY2F1c2Ugc3lzdGVtIGluc3RhYmls
aXR5IG9yIGhhbmdzCj4gYnkgb3V0LW9mLWJvdW5kcyB3cml0ZXMgZnJvbSB0aGUgR1BVICh2aWEg
Y29tcHV0ZSBzaGFkZXJzIG9yIGNvcHkKPiBjb21tYW5kcykuIEluIG15IGV4cGVyaWVuY2Ugb2Yg
c2V2ZXJhbCB5ZWFycyBkb2luZyBHUFUgY29tcHV0aW5nIHdpdGgKPiBOVklESUEgdGVjaCwgSSBk
b24ndCByZWNhbGwgbmVlZGluZyB0byBsb3NlIHRpbWUgcmVib290aW5nIG15IFBDIGFmdGVyCj4g
cnVubmluZyBhIGJ1Z2d5IENVREEgImtlcm5lbCIuIEhlY2ssIEkgY291bGQgcnVuIHRoZSBHQ0Mg
QyB0ZXN0c3VpdGUgb24KPiB0aGUgR1BVIHdpdGhvdXQgd29ycnlpbmcgYWJvdXQgbG9ja2luZyBt
eXNlbGYgYW5kIG90aGVycyBmcm9tIHRoZQo+IHNlcnZlci4gQnV0IG5vdyB3aGVuIEkgZGV2ZWxv
cCBvbiBhIGxhcHRvcCB3aXRoIEFNRCdzIGxhdGVzdCBtb2JpbGUgU29DLAo+IGV2ZXJ5IHRpbWUg
SSBtYWtlIGEgbWlzdGFrZSBpbiBteSBHTFNMIGNvZGUgaXQgbW9yZSBvZnRlbiB0aGFuIG5vdCBm
b3JjZXMKPiBhIHJlYm9vdC4gSSBob3BlIHlvdSB1bmRlcnN0YW5kIHdoYXQgYSBodWdlIHBhaW4g
aXQgaXMuCj4gCj4gV2hhdCBhcmUgdGhlIGV4aXN0aW5nIEdQVSBoYXJkd2FyZSBjYXBhYmlsaXRp
ZXMgZm9yIG1lbW9yeSBwcm90ZWN0aW9uCj4gKGJvdGggaW4gdGVybXMgb2YgcHJldmVudGluZyBy
YW5kb20gYWNjZXNzZXMgdG8gc3lzdGVtIG1lbW9yeSBsaWtlIHdpdGgKPiBhbiBJT01NVSwgYW5k
IGluIHRlcm1zIG9mIGlzb2xhdGluZyBkaWZmZXJlbnQgcHJvY2VzcyBjb250ZXh0cyBmcm9tIGVh
Y2gKPiBvdGhlciksIGFuZCB0byB3aGF0IGV4dGVuZCBMaW51eCBEUk0gZHJpdmVycyBhcmUgdGFr
aW5nIGFkdmFudGFnZSBvZgo+IHRoZW0/CgpNb2Rlcm4gKG9yIG1vcmUgbGlrZSBub24tYW5jaWVu
dCBhdCB0aGlzIHBvaW50LCBiYXNpY2FsbHkgYW55dGhpbmcgd2hpY2ggCmNhbWUgb3V0IHdpdGhp
biB0aGUgbGFzdCBkZWNhZGUpIEFNRCBHUFVzIGhhdmUgbW9zdGx5IHBlcmZlY3QgcHJvdGVjdGlv
biAKYmV0d2VlbiBkaWZmZXJlbnQgZXhlY3V0aW9uIGNvbnRleHRzIChpLmUuIGRpZmZlcmVudCBw
cm9jZXNzZXMgbm9ybWFsbHksIAp0aG91Z2ggaXQncyBub3QgYWx3YXlzIGEgMToxIG1hcHBpbmcp
LiBFYWNoIGNvbnRleHQgaGFzIGl0cyBvd24gdmlydHVhbCAKR1BVIGFkZHJlc3Mgc3BhY2UgYW5k
IGNhbm5vdCBhY2Nlc3MgYW55IG1lbW9yeSB3aGljaCBpc24ndCBtYXBwZWQgaW50byAKdGhhdCAo
d2hpY2ggdGhlIGtlcm5lbCBkcml2ZXIgb25seSBkb2VzIGZvciBtZW1vcnkgYmVsb25naW5nIHRv
IGEgYnVmZmVyIApvYmplY3Qgd2hpY2ggdGhlIGNvbnRleHQgaGFzIHBlcm1pc3Npb24gdG8gYWNj
ZXNzIGFuZCBoYXMgZXhwbGljaXRseSAKYXNrZWQgdG8gYmUgbWFwcGVkIGludG8gaXRzIGFkZHJl
c3Mgc3BhY2UpLgoKClRoZSBpbnN0YWJpbGl0eSB5b3UncmUgc2VlaW5nIGxpa2VseSBpc24ndCBk
dWUgdG8gbGFjayBvZiBtZW1vcnkgCnByb3RlY3Rpb24gYnV0IGR1ZSB0byBhbnkgb2YgYSBsYXJn
ZSBudW1iZXIgb2Ygb3RoZXIgd2F5cyBhIEdQVSBjYW4gZW5kIAp1cCBpbiBhIGhhbmdpbmcgc3Rh
dGUsIGFuZCB0aGUgZHJpdmVycyBhbmQgd2lkZXIgZWNvc3lzdGVtIG5vdCBiZWluZyAKdmVyeSBn
b29kIGF0IHJlY292ZXJpbmcgZnJvbSB0aGF0IHlldC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBE
w6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpM
aWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBh
bmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
