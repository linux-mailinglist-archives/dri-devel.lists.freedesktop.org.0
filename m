Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FB6D9971
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6610EBD0;
	Thu,  6 Apr 2023 14:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CCF10EBD0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:18:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2EC5322762;
 Thu,  6 Apr 2023 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680790697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iXOxnGQM9svvqDs+d1b0fL5ljrHVpVYRU/KmXBD5Kwg=;
 b=UaThhEYKs+ebvZx+FYgSAzlHaqdqmKB86W5dKRXkwUxQSMbFd0Fzd4PM+WEkGlU1hXUB6I
 +AzsYaxWjLLUTnWQ+7fkt/q+4Tl8F1vnfFlSizmiwnMepumy5bgKt+wWx3OrAL6IrGHidP
 b/QOsSz9MorobJ8b0emmRGGPMhkosq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680790697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iXOxnGQM9svvqDs+d1b0fL5ljrHVpVYRU/KmXBD5Kwg=;
 b=+/JKfMp7XnSv82bGdC5jIICSLnpnObmuEhHK1J0ZPieCPsfJanIi6Bk1JyNJ4gmBFxldud
 fv+ObMiPGWU9hkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05F101351F;
 Thu,  6 Apr 2023 14:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xzRFAKnULmSiJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:18:17 +0000
Message-ID: <19eb4f95-1c96-1287-972e-a916964556f7@suse.de>
Date: Thu, 6 Apr 2023 16:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
Content-Language: en-US
To: Marius Vlad <marius.vlad@collabora.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
 <c3a03808-db42-5dca-54d0-2a227d765bf1@collabora.com>
 <ea757d75-869a-3e32-26b8-301514a72a5a@suse.de>
 <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YHwm63ZiBOtD3ES0MAcjGSpw"
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
Cc: melissa.srw@gmail.com, mwen@igalia.com, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YHwm63ZiBOtD3ES0MAcjGSpw
Content-Type: multipart/mixed; boundary="------------qlC5y0s3hbcTYQ6ikkf4J6xC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marius Vlad <marius.vlad@collabora.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
Cc: melissa.srw@gmail.com, mwen@igalia.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, igormtorrente@gmail.com
Message-ID: <19eb4f95-1c96-1287-972e-a916964556f7@suse.de>
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
 <c3a03808-db42-5dca-54d0-2a227d765bf1@collabora.com>
 <ea757d75-869a-3e32-26b8-301514a72a5a@suse.de>
 <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
In-Reply-To: <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>

--------------qlC5y0s3hbcTYQ6ikkf4J6xC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDQuMjMgdW0gMTY6MDQgc2NocmllYiBNYXJpdXMgVmxhZDoNClsuLi5d
DQo+IA0KPj4NCj4+IEZvciBtdWx0aXBsZSBvdXRwdXRzLCB5b3UgY2FuIGF0dGFjaCBtdWx0
aXBsZSBlbmNvZGVycy9jb25uZWN0b3JzIHRvIA0KPj4gdGhlIHNhbWUgQ1JUQy4gVGhleSB3
aWxsIHRoZW4gYWxsIGRpc3BsYXkgdGhlIHNhbWUgc2NyZWVuIGF0IHRoZSBzYW1lIA0KPj4g
ZGlzcGxheSByZXNvbHV0aW9uDQo+IFllYWgsIHRoaXMga2luZCBvZiBzb3VuZHMgbGlrZSBj
bG9uaW5nIHRvIG1lLCBhbmQgd291bGQgbGlrZSB0byBkaXNwbGF5IA0KPiBkaWZmZXJlbnQg
dGhpbmdzIGF0IHRoZSBzYW1lIHRpbWUsIG9uIGRpZmZlcmVudCBvdXRwdXRzLCB0byBtZSBp
dCBzb3VuZHMgDQo+IEkgbmVlZCBwcmltYXJ5IHBsYW5lIGFuZCBhIENSVEMgZm9yIGVhY2gg
Y29ubmVjdG9yLiBSaWdodD8NCg0KRXhhY3RseS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4+DQo+Pj4gLSBDYW4gdGhlIG92ZXJsYXkgcGxhbmVzIGJlIHNoYXJlZCBvciBJ
IG5lZWQgdG8NCj4+PiDCoMKgIGRpc2NhcmQgdGhlIG9uZXMgdGhhdCBhcmUgYWxyZWFkeSBp
bi11c2UgYnkgb3RoZXIgb3V0cHV0cz8NCj4+DQo+PiBFdmVuIGlmIHlvdXIgaGFyZHdhcmUg
cGxhbmVzIHN1cHBvcnQgaXQsIHlvdSBjYW5ub3Qgc2hhcmUgcGxhbmVzIGFtb25nIA0KPj4g
Q1JUQ3Mgd2l0aCBEUk0uIEF0IGxlYXN0IEknbSBub3QgYXdhcmUgaG93IHRvLiBFYWNoIHBs
YW5lIHN0cnVjdCBoYXMgYSANCj4+IGRlc2lnbmF0ZWQgQ1JUQyBzdHJ1Y3QuIEZvciBtb3N0
IGZsZXhpYmlsaXR5IEknZCBoYXZlIHRvIG1hdGNoIEhXIA0KPj4gcGxhbmVzIGFuZCBEUk0g
cGxhbmVzIGR5bmFtaWNhbGx5LiBGb3IgZXhhbXBsZSBpZiB5b3UgaGF2ZSAyIENSVENzIA0K
Pj4gdGhhdCBjYW4gc2hhcmUgMTAgSFcgcGxhbmVzLCB5b3UgY2FuIGFsbG9jYXRlIDEwIERS
TSBwbGFuZXMgZm9yIGVhY2ggDQo+PiBDUlRDLiBUaGUgYXRvbWljX2NoZWNrIGZ1bmN0aW9u
cyBoYXZlIHRvIGltcGxlbWVudCB0aGUgbWFwcGluZyBmcm9tIA0KPj4gaGFyZHdhcmUgdG8g
c29mdHdhcmUgcGxhbmUgYW5kIGZhaWwgaWYgbm8gbW9yZSBoYXJkd2FyZSBwbGFuZXMgYXJl
IA0KPj4gYXZhaWxhYmxlLg0KPj4NCj4+IElmIHlvdSB3YW50IHRvIGRpc3BsYXkgdGhlIHNh
bWUgc2NyZWVuIG9uIG11bHRpcGxlIENSVENzLCBpdCdzIA0KPj4gcG9zc2libGUgdG8gc2hh
cmUgdGhlIERSTSBmcmFtZWJ1ZmZlcnMgYW1vbmcgc2ltaWxhciB0aGUgcGxhbmVzLg0KPiAN
Cj4gQWhhbSwgdW5kZXJzdG9vZCwgdGhhbmtzIGFnYWluIQ0KPiANCj4+DQo+PiBCZXN0IHJl
Z2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IEknbGwgaGF2ZSBhIGxvb2sgYXQgdGhh
dCB3cml0ZWJhY2sgdGVzdCBhcyB3ZWxsIHNlZSB3aGF0J3MgY2F1c2luZyB0aGF0DQo+Pj4g
TlVMTCBwb2ludGVyIGRlcmVmLg0KPj4+DQo+Pj4NCj4+PiBPbiA0LzUvMjMgMTY6NTEsIE1h
w61yYSBDYW5hbCB3cm90ZToNCj4+Pj4gSGkgTWFyaXVzLA0KPj4+Pg0KPj4+Pj4gVGhpcyBw
YXRjaCBhZGRzIHN1cHBvcnQgZm9yIGNyZWF0aW5nIG11bHRpcGxlIHZpcnR1YWwgY29ubmVj
dG9ycywgaW4NCj4+Pj4+IGNhc2Ugb25lIHdvdWxkIG5lZWQgaXQuIFVzZSBtb2R1bGUgcGFy
YW1ldGVycyB0byBzcGVjaWZ5IGhvdyBtYW55LA0KPj4+Pj4gZGVmYXVsdGluZyB0byBqdXN0
IG9uZSwgYWxsb2NhdGluZyBmcm9tIHRoZSBzdGFydCwgYSBtYXhpbXVtIG9mIDQNCj4+Pj4+
IHBvc3NpYmxlIG91dHB1dHMuDQo+Pj4+DQo+Pj4+IEkgZ290IGEgYml0IGNvbmZ1c2VkIGJ5
IHRoaXMgZGVzY3JpcHRpb24uIFRoZSBjb21taXQgbWVzc2FnZSBzYXlzIA0KPj4+PiB0aGF0
IHlvdQ0KPj4+PiBhcmUgY3JlYXRpbmcgbXVsdGlwbGUgY29ubmVjdG9ycywgYnV0IGl0IHNl
ZW1zIGxpa2UgeW91IGFyZSBjcmVhdGluZyANCj4+Pj4gbXVsdGlwbGUNCj4+Pj4gcGlwZXMu
IEZyb20gd2hhdCBJIGNvdWxkIHNlZSwgZm9yIGVhY2ggbmV3IGNvbm5lY3RvciBjcmVhdGVk
LCB5b3UgDQo+Pj4+IGFyZSBhbHNvDQo+Pj4+IGNyZWF0aW5nIGEgbmV3IENSVEMgYW5kIG5l
dyBwbGFuZXMuDQo+Pj4+DQo+Pj4+IE1vcmVvdmVyLCBpZiB5b3VyIHJlYWwgaW50ZW50aW9u
IGlzIHRvIGNyZWF0ZSBtdWx0aXBsZSBwaXBlcywgSSANCj4+Pj4gYmVsaWV2ZSB0aGF0DQo+
Pj4+IHlvdSBkb24ndCByZWFsbHkgbmVlZCB0byBkdXBsaWNhdGUgdGhlIHBsYW5lcyBhcyB3
ZWxsLg0KPj4+Pg0KPj4+PiBJIHJhbiB0aGUgVktNUyBDSSBbMV0gd2l0aCB5b3VyIHBhdGNo
ZXMgYXBwbGllZCBhbmQsIGFsdGhvdWdoIG1vc3QgDQo+Pj4+IG9mIHRoZQ0KPj4+PiB0ZXN0
cyBhcmUgbm93IHBhc3Npbmcgd2l0aCBtdWx0aXBsZSBwaXBlcywgd2hpY2ggaXMgcmVhbGx5
IG5pY2UsIHRoZSANCj4+Pj4gdGVzdA0KPj4+PiBrbXNfd3JpdGViYWNrIGNyYXNoZXMgd2l0
aCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPj4+Pg0KPj4+PiBbIDE5OTcuMjQ0MzQ3XSBbSUdU
XSBrbXNfd3JpdGViYWNrOiBzdGFydGluZyBzdWJ0ZXN0IA0KPj4+PiB3cml0ZWJhY2stY2hl
Y2stb3V0cHV0DQo+Pj4+IFsgMTk5Ny4yNTA2NzNdIEJVRzoga2VybmVsIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSwgYWRkcmVzczogDQo+Pj4+IDAwMDAwMDAwMDAwMDAxNmMNCj4+Pj4g
WyAxOTk3LjI1MDY5MV0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBt
b2RlDQo+Pj4+IFsgMTk5Ny4yNTA2OTNdICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90
LXByZXNlbnQgcGFnZQ0KPj4+PiBbIDE5OTcuMjUwNjk0XSBQR0QgODAwMDAwMDAxYTg3NzA2
NyBQNEQgODAwMDAwMDAxYTg3NzA2NyBQVUQgDQo+Pj4+IDFhODcyMDY3IFBNRCAwDQo+Pj4+
IFsgMTk5Ny4yNTA2OTddIE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkNCj4+Pj4g
WyAxOTk3LjI1MDY5OV0gQ1BVOiAyIFBJRDogMzIyMyBDb21tOiBrbXNfd3JpdGViYWNrIE5v
dCB0YWludGVkIA0KPj4+PiA2LjMuMC1yYzQtZzhjMmMyOWJhMTI5Zi1kaXJ0eSAjMjU3DQo+
Pj4+IFsgMTk5Ny4yNTA3MDFdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0
NDBGWCArIFBJSVgsIA0KPj4+PiAxOTk2KSwgQklPUyAxLjE2LjItMS5mYzM3IDA0LzAxLzIw
MTQNCj4+Pj4gWyAxOTk3LjI1MDcwM10gUklQOiAwMDEwOmRybV92YmxhbmtfZ2V0KzB4YS8w
eGUwDQo+Pj4+IFsgMTk5Ny4yNTA3MTBdIENvZGU6IGE5IDY2IDY2IDY2IDY2IDY2IDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIA0KPj4+PiA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5
MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA1NSA0MSA1NyA0MSA1NiA0MSA1NSANCj4+Pj4g
NDEgNTQgNTMgPDhiPiA4NyA2YyAwMSAwMCAwMCA0MSBiYyBlYSBmZiBmZiBmZiA4NSBjMCA3
NCA3NCA4OSBmNSA0OCANCj4+Pj4gODkgZmIgMzkNCj4+Pj4gWyAxOTk3LjI1MDcxMl0gUlNQ
OiAwMDE4OmZmZmZiODRkNDA3YTNiMDggRUZMQUdTOiAwMDAxMDIwMg0KPj4+PiBbIDE5OTcu
MjUwNzE0XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmYTJlYjAyYmY4YjcwIFJD
WDogDQo+Pj4+IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4gWyAxOTk3LjI1MDcxOF0gUkRYOiBm
ZmZmYTJlYjE4MGQyNDIwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IA0KPj4+PiAwMDAw
MDAwMDAwMDAwMDAwDQo+Pj4+IFsgMTk5Ny4yNTA3MTldIFJCUDogZmZmZmEyZWIwMmJmOTll
OCBSMDg6IDAwMDAwMDAwMDAwMDAwMzYgUjA5OiANCj4+Pj4gZmZmZmEyZWIwMWQ2MjBjMA0K
Pj4+PiBbIDE5OTcuMjUwNzIwXSBSMTA6IGZmZmZlODJiODQwMjdlNDAgUjExOiBmZmZmZmZm
ZmMwMDQyNTIwIFIxMjogDQo+Pj4+IGZmZmZhMmViMDFjMDE5MDANCj4+Pj4gWyAxOTk3LjI1
MDcyMV0gUjEzOiBmZmZmYTJlYjAyYmY5YjYwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6
IA0KPj4+PiBmZmZmYTJlYTFlY2Q2YjgwDQo+Pj4+IFsgMTk5Ny4yNTA3MjJdIEZTOsKgIDAw
MDA3ZjdkNDRlODlhODAoMDAwMCkgR1M6ZmZmZmEyZWIzYmQwMDAwMCgwMDAwKSANCj4+Pj4g
a25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4+PiBbIDE5OTcuMjUwNzIzXSBDUzrCoCAwMDEw
IERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPj4+PiBbIDE5OTcu
MjUwNzI1XSBDUjI6IDAwMDAwMDAwMDAwMDAxNmMgQ1IzOiAwMDAwMDAwMDFlYzAyMDAwIENS
NDogDQo+Pj4+IDAwMDAwMDAwMDAwMDA2ZTANCj4+Pj4gWyAxOTk3LjI1MDcyOF0gQ2FsbCBU
cmFjZToNCj4+Pj4gWyAxOTk3LjI1MDczNV3CoCA8VEFTSz4NCj4+Pj4gWyAxOTk3LjI1MDcz
Nl3CoCB2a21zX3NldF9jb21wb3NlcisweDE4LzB4NjAgW3ZrbXNdDQo+Pj4+IFsgMTk5Ny4y
NTA3NDVdwqAgdmttc193Yl9hdG9taWNfY29tbWl0KzB4OTMvMHgxNTAgW3ZrbXNdDQo+Pj4+
IFsgMTk5Ny4yNTA3NDldwqAgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZW5h
YmxlcysweDFkOS8weDI1MA0KPj4+PiBbIDE5OTcuMjUwNzU0XcKgIHZrbXNfYXRvbWljX2Nv
bW1pdF90YWlsKzB4MzMvMHhiMCBbdmttc10NCj4+Pj4gWyAxOTk3LjI1MDc1OF3CoCBjb21t
aXRfdGFpbCsweDhkLzB4MTcwDQo+Pj4+IFsgMTk5Ny4yNTA3NjFdwqAgZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0KzB4MjZiLzB4MjgwDQo+Pj4+IFsgMTk5Ny4yNTA3NjNdwqAgZHJtX2F0
b21pY19jb21taXQrMHg5Zi8weGMwDQo+Pj4+IFsgMTk5Ny4yNTA3NjZdwqAgPyBfX3BmeF9f
X2RybV9wcmludGZuX2luZm8rMHgxMC8weDEwDQo+Pj4+IFsgMTk5Ny4yNTA3NjldwqAgZHJt
X21vZGVfYXRvbWljX2lvY3RsKzB4MzRjLzB4NDgwDQo+Pj4+IFsgMTk5Ny4yNTA3NzFdwqAg
PyBfX3BmeF9kcm1fbW9kZV9hdG9taWNfaW9jdGwrMHgxMC8weDEwDQo+Pj4+IFsgMTk5Ny4y
NTA3NzNdwqAgZHJtX2lvY3RsX2tlcm5lbCsweGQ3LzB4MTUwDQo+Pj4+IFsgMTk5Ny4yNTA3
ODBdwqAgZHJtX2lvY3RsKzB4MzFmLzB4NDkwDQo+Pj4+IFsgMTk5Ny4yNTA3ODFdwqAgPyBf
X3BmeF9kcm1fbW9kZV9hdG9taWNfaW9jdGwrMHgxMC8weDEwDQo+Pj4+IFsgMTk5Ny4yNTA3
ODNdwqAgX19zZV9zeXNfaW9jdGwrMHg2ZC8weGIwDQo+Pj4+IFsgMTk5Ny4yNTA3ODldwqAg
ZG9fc3lzY2FsbF82NCsweDQzLzB4OTANCj4+Pj4gWyAxOTk3LjI1MDc5NV3CoCBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Mi8weGRjDQo+Pj4+DQo+Pj4+IFsxXSANCj4+
Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy0v
dHJlZS9tYXN0ZXIvdGVzdHMvdmttc19jaQ0KPj4+Pg0KPj4+PiBCZXN0IFJlZ2FyZHMsDQo+
Pj4+IC0gTWHDrXJhIENhbmFsDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhpcyBpcyBvZiBwYXJ0
aWN1bGFyIGltcG9ydGFuY2Ugd2hlbiB0ZXN0aW5nIG91dCB0aGUgRFJNIGJhY2tlbmQgaW4N
Cj4+Pj4+IGNvbXBvc2l0b3JzLCBidXQgYWxzbyB0byBiZSBhYmxlIHRvIGluZGVwZW5kZW50
bHkgaGFuZGxlIG11bHRpcGxlDQo+Pj4+PiBvdXRwdXRzL2Nvbm5lY3RvcnMsIGxpa2Ugc2V0
dGluZyBvbmUgdG8gb2ZmL3NsZWVwIG9uIHdoaWxlIHRoZSBvdGhlcnMNCj4+Pj4+IGFyZSBv
biwgYW5kIGNvbWJpbmF0aW9ucyB0aGF0IGFyaXNlIGZyb20gdGhhdC4NCj4+Pj4+DQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWRAY29sbGFib3JhLmNv
bT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRj
LmPCoMKgwqDCoMKgIHzCoCAzICstLQ0KPj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19kcnYuY8KgwqDCoMKgwqDCoCB8IDI2IA0KPj4+Pj4gKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmjCoMKg
wqDCoMKgwqAgfMKgIDggKysrKystLS0NCj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfb3V0cHV0LmPCoMKgwqAgfMKgIDUgKystLS0NCj4+Pj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0NCj4+
Pj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pDQo+Pj4+Pg0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------qlC5y0s3hbcTYQ6ikkf4J6xC--

--------------YHwm63ZiBOtD3ES0MAcjGSpw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQu1KgFAwAAAAAACgkQlh/E3EQov+B3
cA//fNu29tS/uKdNGDHc1tSwhAIA80Gxq2jBQpU2yXf2eDRpgrnZPPQ6qc2jai6W/undq9qNTGHr
99hZWnt85WvBFwD+GHlL9wJqzluku6tjCg+PdeGgtRYfo41NApwOX/MnudZVdU/JMZv3pPTKgVJB
FN2tLx/jLabich9A84isvJoX1ztaWtXtc2Jme44TDI2t77wUI2OCR/hmmpejDqsbUS1zdtzqSSCL
TCKc5rvGLLSjSEqbM7Y6pAV6mgDNBpYrORmn/0GREfoZ6SBBNaOpYwZyepU1kaWIk0Xa2T/a3IEX
ZO5VDwwLAXOOBMNRXgl45gBy3qntggWA5CKIbPe39I0s0KDeYGOD324coiWSOT1tbrwsgfkzGXnz
p9pi3a6KWiK+1eNtLQ+csy7Q7Ucg6/+yejvjYiqIAkhelK7AWg98GvhkRCzx/rehtXQzqeQtDcCU
BGXipuH9EToV3DHjDljB5O/15W1EtgSdGX+2BL2WEu15T8YA+UBStO/ikCZEEzswntTMn0ChsyZg
z5epCowIu0USqhEFftWhR6Ycm9vBK4gcI7GqPDxeKYhC7BwH0vq0y7hEsq3AK4DiHyBh03fBV9/w
jQ/N/iW8BNmWmvHCulymsnYlt9NOFBvHHZjTiir/ieZlEOR/whmOiNVMkRJxgWFHF3Oc7ONbkFnB
Hb8=
=1PmK
-----END PGP SIGNATURE-----

--------------YHwm63ZiBOtD3ES0MAcjGSpw--
