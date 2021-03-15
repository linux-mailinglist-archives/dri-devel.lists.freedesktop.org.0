Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145233C974
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 23:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709B789D53;
	Mon, 15 Mar 2021 22:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566889D53
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 22:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2602140E40;
 Mon, 15 Mar 2021 23:35:29 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=o9gIWlou; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SqxrgCw9DFi; Mon, 15 Mar 2021 23:35:28 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C56B340E39;
 Mon, 15 Mar 2021 23:35:27 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 13371360311;
 Mon, 15 Mar 2021 23:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615847727; bh=AFKzk+sNaqR4nWFPLse7qzl+/Yu36yPE6yglmJuAPPE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o9gIWlour/6/5d9qsITtSMyDz1oImtftLY3bi75auZaHFgw1lzHbOLy0xxoM5C2/r
 Fk0mgdNJnhDqROWvLAVO9RLijldGeNCV9DVHkBfnBk3YymyZMNMZ+3uEv+2s8SnHK5
 H3k/F7eSBs4k2jWY36Jf4W3IuGm0ZO2IgsvDvvzY=
Subject: Re: vmwgfx leaking bo pins?
To: Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
 <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
 <3bb8b7f4-953a-b455-e148-009c2ff9f7b2@vmware.com>
 <CAKMK7uGY1-G_+CcaSfDqPhMpwbExugJj53A7xEn+LS5d398_3w@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <c8d7e6e6-0f0b-8200-066c-c53cc70ecbc1@shipmail.org>
Date: Mon, 15 Mar 2021 23:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGY1-G_+CcaSfDqPhMpwbExugJj53A7xEn+LS5d398_3w@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMTUvMjEgOTozOCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE1hciAx
NSwgMjAyMSBhdCA2OjU3IFBNIFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+IHdyb3RlOgo+
PiBPbiAzLzEyLzIxIDU6MDYgQU0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+
PiBPbiAzLzEyLzIxIDEyOjAyIEFNLCBaYWNrIFJ1c2luIHdyb3RlOgo+Pj4+PiBPbiBNYXIgMTEs
IDIwMjEsIGF0IDE3OjM1LCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4+Pj4+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4+Pj4KPj4+Pj4gSGksIFphY2sKPj4+Pj4KPj4+Pj4g
T24gMy8xMS8yMSAxMDowNyBQTSwgWmFjayBSdXNpbiB3cm90ZToKPj4+Pj4+PiBPbiBNYXIgMTEs
IDIwMjEsIGF0IDA1OjQ2LCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4+Pj4+Pj4gPHRob21h
c19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gSGksCj4+Pj4+Pj4KPj4+
Pj4+PiBJIHRyaWVkIGxhdGVzdCBkcm0tZml4ZXMgdG9kYXkgYW5kIHNhdyBhIGxvdCBvZiB0aGVz
ZTogRmFsbG91dCBmcm9tCj4+Pj4+Pj4gdHRtIHJld29yaz8KPj4+Pj4+IFllcywgSSBmaXhlZCB0
aGlzIGluIGQxYTczYzY0MWFmZDI2MTdiZDgwYmNlOGI3MWEwOTZmYzViNzRiN2UgaXQgd2FzCj4+
Pj4+PiBpbiBkcm0tbWlzYy1uZXh0IGluIHRoZSBkcm0tbWlzYyB0cmVlIGZvciBhIHdoaWxlIGJ1
dCBoYXNu4oCZdCBiZWVuCj4+Pj4+PiBtZXJnZWQgZm9yIDUuMTIuCj4+Pj4+Pgo+Pj4+Pj4gego+
Pj4+Pj4KPj4+Pj4gSG1tLCB5ZXMgYnV0IGRvZXNuJ3QgdGhhdCBmaXggdHJpcCB0aGUgdHRtX2Jv
X3VucGluKCkKPj4+Pj4gZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik/Cj4+Pj4g
Tm8sIGRvZXNu4oCZdCBzZWVtIHRvLiBUQkggSeKAmW0gbm90IHN1cmUgd2h5IG15c2VsZiwgYnV0
IGl0IHNlZW1zIHRvIGJlCj4+Pj4gd29ya2luZyBmaW5lLgo+Pj4+Cj4+Pj4KPj4+IFdpdGggQ09O
RklHX1BST1ZFX0xPQ0tJTkc9eSBJIHNlZSB0aGlzOgo+Pj4KPj4+IFsgICAgNy4xMTcxNDVdIFtk
cm1dIEZJRk8gYXQgMHgwMDAwMDAwMGZlMDAwMDAwIHNpemUgaXMgODE5MiBraUIKPj4+IFsgICAg
Ny4xMTcyODRdIFtkcm1dIFZSQU0gYXQgMHgwMDAwMDAwMGU4MDAwMDAwIHNpemUgaXMgMTMxMDcy
IGtpQgo+Pj4gWyAgICA3LjExNzI5MV0gSU5GTzogdHJ5aW5nIHRvIHJlZ2lzdGVyIG5vbi1zdGF0
aWMga2V5Lgo+Pj4gWyAgICA3LjExNzI5NV0gdGhlIGNvZGUgaXMgZmluZSBidXQgbmVlZHMgbG9j
a2RlcCBhbm5vdGF0aW9uLgo+Pj4gWyAgICA3LjExNzI5OF0gdHVybmluZyBvZmYgdGhlIGxvY2tp
bmcgY29ycmVjdG5lc3MgdmFsaWRhdG9yCj4+Pgo+Pj4gV2hpY2ggd2lsbCBwcm9iYWJseSBtYXNr
IHRoYXQgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdikKPj4+Cj4+IEFoLCB5ZXMs
IHlvdSdyZSByaWdodC4gQWZ0ZXIgZml4aW5nIHRoYXQgSSBkbyBzZWUgdGhlCj4+IGRtYV9yZXN2
X2Fzc2VydF9oZWxkIHRyaWdnZXJlZC4gVGVjaG5pY2FsbHkgdHJpdmlhbGx5IGZpeGFibGUgd2l0
aAo+PiB0dG1fYm9fcmVzZXJ2ZS90dG1fYm9fdW5yZXNlcnZlIGFyb3VuZCB0dG1fYm9fdW5waW4g
YnV0IGl0J3MgYSBsaXR0bGUKPj4gdWdseSB0aGF0IHNvbWUgcGxhY2VzIGUuZy4gdm13X2JvX3Vu
cmVmZXJlbmNlIHdpbGwgcmVxdWlyZQo+PiB0dG1fYm9fcmVzZXJ2ZS90dG1fYm9fdW5yZXNlcnZl
IGFyb3VuZCB0dG1fYm9fdW5waW4gYnV0IHNvbWUgd29uJ3QgZS5nLgo+PiB2bXdfbW9iX2Rlc3Ry
b3kgd29uJ3QgYmVjYXVzZSBpdHMgbG9jayBpcyBoZWxkIGJ5IHR0bV9ib19kZWxheWVkX2RlbGV0
ZQo+PiB3aXRob3V0IGEgdmVyeSBjbGVhciBpbmRpY2F0aW9uIHdpdGhpbiB0aGUgZnVuY3Rpb24g
d2hpY2ggaXMgd2hpY2guCgpJdCBsb29rcyBsaWtlLCBsaWtlIERhbmllbCBoaW50cyBiZWxvdywg
Zm9yIHRoZSBtb2IgcGFnZXRhYmxlIGJvcyBzaW5jZSAKdGhleSBhcmUgcGlubmVkIGFuZCBoZW5j
ZSBub3Qgb24gYSBMUlUgbGlzdCwgdGhlIHBhcmVudCBibyBpcyBob2xkaW5nIAp0aGUgb25seSBy
ZWZlcmVuY2UsIHdoaWNoIGlzIHV0aWxpemVkIGluIHZtd19tb2JfdW5iaW5kKCkgdG8gbWFrZSBz
dXJlIAp0aGUgdHJ5cmVzZXJ2ZSBhbHdheXMgc3VjY2VlZHMuICh1bnBpbiBjb3VsZCBiZSBjYWxs
ZWQgaW4gdm13X21vYl91bmJpbmQgCmZvciB0aGUgcGFnZXRhYmxlIGJvIGp1c3QgYWZ0ZXIgZmVu
Y2luZyBpZiBuZWNlc3NhcnkpLCBhbmQgc2ltaWxhcmx5IGZvciAKdGhlIG90aGVyIHZtd2dmeF9t
b2IgZXJyb3IgcGF0aHMsIGJ1dCBpbiB0aGF0IGNhc2Ugb25lIHNob3VsZCBwcm9iYWJseSAKa2Vl
cCB0aGUgYm8gcG9pbnRlcnMgaW4gc3RhY2sgdmFyaWFibGVzIHVudGlsIHlvdSBrbm93IHlvdSBk
b24ndCBoYXZlIHRvIAp1bnBpbi4gVGhlbiBpdCBzaG91bGQgYmUgb2sgdG8gdHJ5cmVzZXJ2ZSBh
cm91bmQgdW5waW5uaW5nIGluIHRoZSBlcnJvciAKcGF0aHMuCgpCdXQgaXQncyBjb25zdHJ1Y3Rz
IGxpa2UgdGhhdCwgdGhhdCByZWFsbHkgbWFrZXMgbWUgdGhpbmsgd2Ugc2hvdWxkbid0IApuZWVk
IHRvIHJlc2VydmUgdG8gdW5waW4uCgo+IE5vdCBzdXJlIGl0IGFwcGxpZXMgaGVyZSwgYnV0IGlm
IHRoZSByZWZjb3VudCBpcyBkb3duIHRvIDAgd2Uga25vdwo+IHdlJ3JlIGluIGRlc3RydWN0aW9u
IGNvZGUgYW5kIGNhbid0IHJhY2Ugd2l0aCBhbnl0aGluZyBhbnltb3JlLCBzbwo+IG1heWJlIHdl
IGNhbiBsaWZ0IHRoZSBkZWJ1ZyBjaGVjay4KPgo+IE90b2ggSSB0aGluayBhdCB0aGF0IHBvaW50
IHdlIG1pZ2h0IHN0aWxsIGJlIG9uIGxydSBsaXN0cywgc28gdGhlCj4gcnVsZXMgYmVjb21lIHJh
dGhlciB0cmlja3kgd2hldGhlciBpdCdzIHJlYWxseSBhbHdheXMgbGVnYWwgdG8gc2tpcAo+IHRo
ZSBkbWFfcmVzdl9sb2NrLiBCdXQgd2UgY291bGQgcGVyaGFwcyBmaWd1cmUgb3V0IHNvbWV0aGlu
ZyBpZiBpdCdzCj4gdG9vIGFubm95aW5nIHRvIGhhdmUgYSBjb25zaXN0ZW50IGNhbGxpbmcgY29u
dGV4dCBpbiBkcml2ZXJzLgo+Cj4gSSdtIG5vdCBhIGh1Z2UgZmFuIG9mIGRyb3BwaW5nIHRoZSBy
ZXF1aXJlbWVudCBmcm9tIHVucGluIGFuZAo+IHN3aXRjaGluZyB0byBhdG9taWNfdCBmb3IgdGhl
IHBpbiBjb3VudCwgc2luY2UgcGluL3VucGluIGlzIGFuCj4gZXh0cmVtZWx5IHNsb3cgcGF0aCwg
YWRkaW5nIGNvbXBsZXhpdHkgaW4gaG93IHdlIHByb3RlY3Qgc3R1ZmYgZm9yIGEKPiBmdW5jdGlv
biB0aGF0J3MgbWF5YmUgY2FsbGVkIDYwL3MgKGZvciBwYWdlIGZsaXBwaW5nIHdlIHBpbi91bnBp
bikKPiBkb2Vzbid0IHN0cmlrZSBtZSBhcyB0aGUgcmlnaHQgYmFsYW5jZS4KCipJZiogd2UgY2Fu
IHByb3RlY3QgdGhlIGJvIExSVSBzdGF0ZSB3aXRoIHRoZSBscnUgbG9jayBpbnN0ZWFkIG9mIHdp
dGggCnJlc2VydmF0aW9uIGl0IHNodWxkIHByb2JhYmx5IG9ubHkgYmUgYSBtYXR0ZXIgb2YgZXh0
ZW5kaW5nIHRoZSBscnUgbG9jayAKY3JpdGljYWwgc2VjdGlvbiBvdmVyIGEgY291cGxlIG9mIGFz
c2lnbm1lbnRzLiBJZiB3ZSBjaGFuZ2UgdGhlIGJvIGxydSAKc3RhdGUgd2UnZCBuZWVkIHRvIGdy
YWIgdGhlIGxydSBsb2NrIHNvb25lciBvciBsYXRlciBhbnl3YXksIHNvIEkgdGhpbmsgCnRoZSBh
ZGRlZCBjb21wbGV4aXR5IHNob3VsZCBiZSBtaW5pbWFsLgoKL1Rob21hcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
