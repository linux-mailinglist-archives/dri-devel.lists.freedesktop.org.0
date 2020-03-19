Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797F18B861
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 14:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9C6E2C0;
	Thu, 19 Mar 2020 13:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6E656E2C0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4CA882A6042;
 Thu, 19 Mar 2020 14:51:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id td4NSTDA6PwR; Thu, 19 Mar 2020 14:51:42 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 082FD2A6016;
 Thu, 19 Mar 2020 14:51:42 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jEvaH-00158S-8K; Thu, 19 Mar 2020 14:51:41 +0100
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>, Hans de Goede <hdegoede@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
 <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
 <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
 <20200319145440.51773af8@eldfell.localdomain>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <c7a98456-d4fc-e4d2-640f-d70a35619445@daenzer.net>
Date: Thu, 19 Mar 2020 14:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319145440.51773af8@eldfell.localdomain>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEExCgpPbiAyMDIwLTAz
LTE5IDE6NTQgcC5tLiwgUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4gT24gVGh1LCAxOSBNYXIgMjAy
MCAxMjo1MjoxNCArMDEwMCBIYW5zIGRlIEdvZWRlCj4gPGhkZWdvZWRlQHJlZGhhdC5jb20+IHdy
b3RlOgo+PiBPbiAzLzE5LzIwIDEyOjM1IFBNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IE9u
IDIwMjAtMDMtMTggNDoyMiBwLm0uLCBTaW1vbiBTZXIgd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIDMv
MTgvMjAgMzozOCBQTSwgU2ltb24gU2VyIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+PiAxKSBMZXR0aW5n
IHRoZSBWTS12aWV3ZXIgd2luZG93LXN5c3RlbSBkcmF3IHRoZSBjdXJzb3IKPj4+Pj4+PiBhcyBp
dCBub3JtYWxseSB3b3VsZCBkcmF3IGl0Lgo+Pj4+Pj4KPj4+Pj4+IFdoeSBpcyB0aGlzIGltcG9y
dGFudD8gQ2FuJ3QgdGhlIFZNIHZpZXdlciBoaWRlIHRoZQo+Pj4+Pj4gY3Vyc29yIGFuZCB1c2Ug
YSBzdWItc3VyZmFjZSB0byBtYW51YWxseSBkcmF3IHRoZSBjdXJzb3IKPj4+Pj4+IHBsYW5lIGNv
bmZpZ3VyZWQgYnkgdGhlIGd1ZXN0Pwo+Pj4+Pgo+Pj4+PiBCZWNhdXNlIHRoZW4gbW92aW5nIHRo
ZSBjdXJzb3IgYXMgc2VlbiBieSB0aGUgdXNlciByZXF1aXJlcwo+Pj4+PiBhIHJvdW5kIHRyaXAg
dGhyb3VnaCB0aGUgVk0gYW5kIHRoYXQgYWRkcyBsYXRlbmN5LCBlc3AuCj4+Pj4+IHdoZW4gdGhl
IFZNIHZpZXdlciBpcyB2aWV3aW5nIGEgVk0gd2hpY2ggaXMgcnVubmluZwo+Pj4+PiBzb21ld2hl
cmUgZWxzZSBvdmVyIHRoZSBuZXR3b3JrLgo+Pj4+Cj4+Pj4gVGhlIHZpZGVvIG91dHB1dCBoYXMg
bGF0ZW5jeSBhbnl3YXkuCj4+Pgo+Pj4gU291bmRzIGxpa2UgeW91J3ZlIG5ldmVyIHRyaWVkIHRo
ZSB0d28gZGlmZmVyZW50IG1vZGVzCj4+PiB5b3Vyc2VsZj8gOikgSU1FIGl0IG1ha2VzIGEgYmln
IGRpZmZlcmVuY2UgZXZlbiB3aXRoIGEgbG9jYWwKPj4+IFZNLiBFdmVuIHZlcnkgbGl0dGxlIGxh
dGVuY3kgY2FuIG1ha2UgdGhlIGN1cnNvciBmZWVsIGF3a3dhcmQsCj4+PiBsaWtlIGl0J3MgYmVp
bmcgaGVsZCBiYWNrIGJ5IGEgcnViYmVyIGJhbmQgb3Igc29tZXRoaW5nLgo+Pgo+PiBSaWdodCBu
b3QgdG8gbWVudGlvbiB0aGF0IHRoZSBsYXRlbmN5IG1heSBiZSB2YXJpYWJsZSwgc28gdGhlCj4+
IGN1cnNvciBtb3ZlcyBpbiBhIGppdHRlcnkgZmFzaGlvbiBpbnN0ZWFkIG9mIGhhdmluZyBpdCBt
b3ZlCj4+IHNtb290aGx5IG1hdGNoaW5nIHRoZSBzbW9vdGggd2F5IGEgdXNlciBub3JtYWxseSBt
b3ZlcyB0aGUKPj4gbW91c2UuCj4+Cj4+IFRoaXMgdG90YWxseSB3cmVja3MgaGFuZC1leWUgY29v
cmRpbmF0aW9uIGFuZCBpcyBqdXN0IHBsYWluCj4+IGF3ZWZ1bGwuCj4KPiBJIGhhdmUgZXhwZXJp
ZW5jZWQgaXQsIGFuZCB3aGlsZSBpdCBpcyBwYWluZnVsLCBJIHByZWZlciB0aGF0IHBhaW4KPiBv
dmVyIHRoZSBwYWluIG9mIGFjY2lkZW50YWxseSBjbGlja2luZyBzb21ldGhpbmcgdGhhdCB3YXMg
bm90Cj4gdHJhbnNtaXR0ZWQgdG8gdGhlIHJlbW90ZSBkaXNwbGF5IHlldC4KClVubGVzcyB5b3Ug
bWVhbiBjbGlja2luZyBzb21ldGhpbmcgd2hpbGUgdGhlIGN1cnNvciBpcyBtb3ZpbmcsIG5vdApz
dXJlIGhvdyBzZWFtbGVzcyB2cyBub3QgYWZmZWN0cyB0aGlzLCBzaW5jZSB0aGUgZGVsYXkgb2Yg
c29tZXRoaW5nCmFwcGVhcmluZyBvbiB0aGUgcmVtb3RlIGRpc3BsYXkgc2hvdWxkIGJlIHRoZSBz
YW1lIGluIGJvdGggY2FzZXM/CgoKPiBUaGVyZWZvcmUgSSB0aGluayB0aGUgYmVzdCB1c2VyIGV4
cGVyaWVuY2UgaXMgdG8gdXNlIGJvdGggdHlwZXMgb2YKPiBjdXJzb3IgYXQgdGhlIHNhbWUgdGlt
ZTogdGhlIHJlbW90ZSBkZXNrdG9wIG9yIFZNIHZpZXdlciBwYWludHMKPiB0aGUgbG9jYWwgY3Vy
c29yIGFzIGFuIGFpZCwgbGlrZSBhIHBoYW50b20sIGFuZCB0aGUgY3Vyc29yIGZyb20KPiBpbnNp
ZGUgdGhlIFZNIGlzIGFsc28gdmlzaWJsZSB3aXRoIHRoZSBsYXRlbmN5IGl0IG5hdHVyYWxseSBo
YXMuCj4gVGhhdCBtZWFucyBJIGNvdWxkIGFjdHVhbGx5IHNlZSB0aGF0IHRoZSBzY3JlZW4gaGFz
IGNhdWdodCB1cCB3aXRoCj4gbXkgbW90aW9ucyBiZWZvcmUgSSBjbGljayBzb21ldGhpbmcuCgpJ
J2QgZXhwZWN0IHRoYXQgdG8gcmVzdWx0IGluICJkdXBsaWNhdGUgY3Vyc29yIiBidWcgcmVwb3J0
cyDigJQgSSdkCmNlcnRhaW5seSBjb25zaWRlciBpdCBhIGJ1ZyB3aXRoIG15IHVzZXIgaGF0IG9u
LgoKCi0gLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAg
ICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCi0tLS0tQkVHSU4gUEdQ
IFNJR05BVFVSRS0tLS0tCgppRjBFQVJFQ0FCMFdJUVN3bjY4MXZwRkZJWmdKVVJSYWdhK09hdHV5
QUFVQ1huTjQ1Z0FLQ1JCYWdhK09hdHV5CkFFTU9BSnNFdE92QkpJQTZDR0hPbXdycDdTRmQ5TTNv
MndDZmNDczdsQ3JDTnNIeEFlbHMvNFlVWG01Rkphcz0KPUZmSVEKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
