Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1218DEE3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 09:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A2D89BB3;
	Sat, 21 Mar 2020 08:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C3989320
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 08:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id AB8AC3F876;
 Sat, 21 Mar 2020 09:56:09 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="dmOV0Q0+";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWI2t_zCC7aW; Sat, 21 Mar 2020 09:56:08 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8E4133F83A;
 Sat, 21 Mar 2020 09:56:07 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DEFCA36012D;
 Sat, 21 Mar 2020 09:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1584780966; bh=ba82nHUgVcKSOUYDGiN0w6zNQq8wc6KZeSKJ5lJgr4Q=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=dmOV0Q0+RpgTpXZINqnKfyfI2psXuBq2lEVGYrViB+mW4P7L/Et0bU7VTIFgCV4Ay
 Uh1GJ6v2jn0v6VGX8+aSxybEJS9ubFmLuSZNkOkcO+p6MXjtMPDRBfZUSgduOwOk8f
 6fJs8cCZI9UUULGgSybisrXTPMzNOZpnpul4duLs=
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: Simon Ser <contact@emersion.fr>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
 <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
 <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
 <da1Sy2AQg2pW3xtrqoF7yjUF5NpTkwSyooPGrnbBX8P5AEM283ODYI-kLYU1R76B27Zx7WT3uTg3s2B9ko1-KVTYRM7S0dpkjSPJM-Ehm8w=@emersion.fr>
 <3f0b858c-aa1b-2391-a936-6d1c8e36c0df@shipmail.org>
 <20200320111304.67c4dd01@eldfell.localdomain>
 <d2e0a79d-9db0-2894-3c31-5b850c68bafc@shipmail.org>
 <QJKg4Tu7o1hP2k8PY3zCKUHffwCqn9QKJ6aEnIW4-TWWxppzrznUC9LFYvtEBPoAEFWTJMVhToG9s4O57ahfjvq64jrstOZ3GcR0JI-9KGU=@emersion.fr>
 <4acc7fd2-df61-33f6-9fd7-2c4921e6ff88@shipmail.org>
Organization: VMware Inc.
Message-ID: <7c3cb54c-2cab-a774-059a-4bd9861c3790@shipmail.org>
Date: Sat, 21 Mar 2020 09:56:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4acc7fd2-df61-33f6-9fd7-2c4921e6ff88@shipmail.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8yMC8yMCAxMjo0NyBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4g
T24gMy8yMC8yMCAxMjoyNyBQTSwgU2ltb24gU2VyIHdyb3RlOgo+PiBPbiBGcmlkYXksIE1hcmNo
IDIwLCAyMDIwIDExOjU5IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAKPj4gPHRob21hc19vc0BzaGlw
bWFpbC5vcmc+IHdyb3RlOgo+Pgo+Pj4gT24gMy8yMC8yMCAxMDoxMyBBTSwgUGVra2EgUGFhbGFu
ZW4gd3JvdGU6Cj4+Pgo+Pj4+PiBJdCBzZWVtcyBwZW9wbGUgYXJlIGFsc28gZm9yZ2V0dGluZyB0
aGUgcHJvYmxlbSBvZiBhc3NvY2lhdGluZyB0aGUKPj4+Pj4gY3Vyc29yIHBsYW5lIHdpdGggYW4g
aW5wdXQgZGV2aWNlLCBzbyB0aGF0IHdoYXRldmVyIGlzIGxvb2tpbmcgdG8KPj4+Pj4gbWFuZ2xl
IHRoZSBjdXJzb3IgcGxhbmUgYmVoaW5kIHRoZSBLTVMgYXBwJ3MgYmFjayB3b3VsZCBrbm93IGhv
dyAKPj4+Pj4gdG8gZG8KPj4+Pj4gaXQgcmlnaHQuCj4+Pj4+IE15IGZpcnN0IHRob3VnaHQgZm9y
IHRoYXQgaXMgYSBuZXcgY3Vyc29yIHBsYW5lIHByb3BlcnR5IHdpdGggdGhlIAo+Pj4+PiB2YWx1
ZQo+Pj4+PiBvZiBtYWpvciwgbWlub3Igb2YgdGhlIGtlcm5lbCBpbnB1dCBkZXZpY2UgdGhhdCB1
c2Vyc3BhY2UgaXMgdXNpbmcgdG8KPj4+Pj4gY29udHJvbCB0aGUgY3Vyc29yIHBsYW5lLiBUaGlz
IHByb3BlcnR5IHNob3VsZCBiZSBzZXQgYnkgdXNlcnNwYWNlIAo+Pj4+PiBvbmx5Cj4+Pj4+IHdo
ZW4gdGhlcmUgaXMgZXhhY3RseSBvbmUga2VybmVsIGlucHV0IGRldmljZSBpdCB1c2VzIGZvciBj
b250cm9sbGluZwo+Pj4+PiB0aGUgY3Vyc29yIHBsYW5lLiBTZXR0aW5nIHRoaXMgcHJvcGVydHkg
dG8gbm9uZS9kaXNhYmxlZCB3b3VsZCBiZSBhCj4+Pj4+IGNsZWFyIGluZGljYXRpb24gdGhhdCAi
c2VhbWxlc3MgbW9kZSIgd291bGQgYmUgdW53YW50ZWQuIFRoZSBEUk0KPj4+Pj4gZHJpdmVyIG9y
IHdoYXRldmVyIGl0IHRhbGtzIHRvIGNvdWxkIHRoZW4gY2hlY2sgaWYgdGhlIGN1cnNvciAKPj4+
Pj4gcGxhbmUgaXMKPj4+Pj4gaW5kZWVkIGNvbnRyb2xsZWQgYnkgdGhlIGlucHV0IGl0IHNvIGZh
ciBoYXMgb25seSBhc3N1bWVkIGFuZAo+Pj4+PiBhdXRvbWF0aWNhbGx5IGNob29zZSBjb3JyZWN0
bHkgYmV0d2VlbiBzZWFtbGVzcyBtb2RlIG9yIG5vdC4KPj4+PiBBcmUgeW91IHN1cmUgdGhpcyBp
IHJlYWxseSBuZWVkZWQ/IFZNd2FyZSdzIFNWR0EgZGV2aWNlIGNoZWNrcyB3aGV0aGVyCj4+Pj4g
dGhlIGd1ZXN0IGN1cnNvciBwb3NpdGlvbiBhbmQgaG9zdCBjdXJzb3IgcG9zaXRpb24gYXJlIHJl
YXNvbmFibHkKPj4+PiBhbGlnbmVkLCBhbmQgaWYgbm90LCBjb21wb3NpdGVzIHRoZSBndWVzdCBj
dXJzb3Igb3ZlciB0aGUgZGlzcGxheSAKPj4+PiBwbGFuZS4KPj4+PiBTbyBpZiB5b3UsIGZvciBl
eGFtcGxlLMKgIGF0dGFjaCBhIHBhc3N0aHJvdWdoIFVTQiBtb3VzZSB0byB0aGUgVk0gCj4+Pj4g
d2hpbGUKPj4+PiBydW5uaW5nIGluIHNlYW1sZXNzIG1vZGUsIHRoaW5ncyAianVzdCB3b3JrIi4g
U2ltaWxhcmx5IGlmIHlvdSB3ZXJlIHRvCj4+Pj4gYXR0YWNoIGEga21zLWJhc2VkIHZuYyBzb2x1
dGlvbiB0aGF0IGJlaGF2ZWQgaW4gdGhlIHNhbWUgd2F5IGFuZCB0aGF0Cj4+Pj4gY3JlYXRlZCBh
IG5ldyBpbnB1dCBkZXZpY2UsIHRoaW5ncyB3b3VsZCBhbHNvIGxvb2sgZmluZSwgZXhjZXB0IGZv
cgo+Pj4+IHRlbXBvcmFyeSBjdXJzb3IganVtcHMgd2hlbiB5b3Ugc3dpdGNoIGlucHV0IGRldmlj
ZS4KPj4+IFNlZW1zIG1vcmUgbGlrZSBhIHdvcmthcm91bmQgdGhhbiBhIHJlYWwgc29sdXRpb24u
Cj4KPiBUaGF0IG1heSBiZSB0aGUgY2FzZSwgYnV0IHN0aWxsIGl0IHdvcmtzIGFuZCBpZiB5b3Ug
aGF2ZSBtdWx0aXBsZSAKPiBjbGllbnRzIGl0IGFsd2F5cyBhbGxvd3MgdGhlIGFjdGl2ZSBjbGll
bnQgcnVuIGluIHNlYW1sZXNzIG1vZGUuIAo+IEJlc2lkZXMsIGlmIHBlb3BsZSB0aGluayBzdXBw
b3J0aW5nIEtNUyBob3RzcG90cyBpcyBhbHJlYWR5IGhhcmQgCj4gZW5vdWdoLCB0aGUgY2hhbmNl
IG9mIGhhdmluZyB0aGVtIHN1cHBseWluZyB0aGUgY29ycmVjdCBpbnB1dCBkZXZpY2UgCj4gaXMg
c21hbGwuCj4KPiAvVGhvbWFzCgpUbyBiZSBjbGVhciBhYm91dCB0aGlzLCBJJ20gbm90ICphZ2Fp
bnN0KiBhIHByb3BlcnR5IGFzc29jaWF0aW5nIGEgCmRldmljZSB3aXRoIGEgY3Vyc29yIHBsYW5l
IGFzIGxvbmcgYXMgaXQncyBqdXN0IGEgaGludC4gSG93ZXZlciBpbiB0aGUgClZNd2FyZSBjYXNl
LCBpdCdzIHVubGlrZWx5IHRoYXQgd2Ugd2lsbCB0cnkgdG8gaW1wbGVtZW50IGFueSBrZXJuZWwg
CmRyaXZlciBzdXBwb3J0IGZvciBpdCBzaW5jZSB3ZSBoYXZlIGEgd29ya2luZyBzb2x1dGlvbiBh
bmQgaXQgYWxzbyBtYXkgCm5vdCBiZSBwb3NzaWJsZS4gKFNvbWUgcmVtb3Rpbmcgc29sdXRpb25z
IG9ubHkgd29yayB3aGVuIHNlYW1sZXNzIG1vZGUgCmlzIGVuYWJsZWQpLgoKL1Rob21hcwoKCj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
