Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C84210F0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C96289139;
	Mon,  4 Oct 2021 14:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BD589139
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 14:07:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8813020202;
 Mon,  4 Oct 2021 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633356452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxoFYKg4pBugeIQCPYC0UfXGY5GWt6/h/sWP5EM0ZbM=;
 b=TkwK8dZ0sSYwGlxw7oVWNZ1Y6mCD3gSdyQnJzRZq10C+Epv2FyoI7lSUUKsl+w/P8rbmp1
 6X3jzV9KDg9xd3VOnNAf+qnfAc7OZrEkWysJzC+Ra4i1MxZTMG7A7Q5aFI7KPmMOs0Gb6T
 RrGSGUGLoPmN98UoiediR6LPwgO+I0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633356452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxoFYKg4pBugeIQCPYC0UfXGY5GWt6/h/sWP5EM0ZbM=;
 b=U1UJUWQNNxNY2wqld5o2VWSlztIlcI/Qwd6tvMNAy5GCSs5S6Sny9V30NlMMguRVQO6WCs
 RMwf5OaZJJ5btkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AE3B13342;
 Mon,  4 Oct 2021 14:07:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tRcmGaQKW2EoaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Oct 2021 14:07:32 +0000
Message-ID: <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
Date: Mon, 4 Oct 2021 16:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: 572994bf18ff prevents system boot
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EVltyQ0NNwBPZFJKb9DFcyPs"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EVltyQ0NNwBPZFJKb9DFcyPs
Content-Type: multipart/mixed; boundary="------------tqQWabLqUjakyTOXJPKnedK0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
Message-ID: <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
Subject: Re: 572994bf18ff prevents system boot
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
In-Reply-To: <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>

--------------tqQWabLqUjakyTOXJPKnedK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMTAuMjEgdW0gMTU6MzQgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+
IA0KPj4gT24gT2N0IDQsIDIwMjEsIGF0IDM6MDcgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiAoY2M6IGFpbnV4LndhbmdAZ21h
aWwuY29tKQ0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMDMuMTAuMjEgdW0gMjA6MDkgc2Nocmll
YiBDaHVjayBMZXZlciBJSUk6DQo+Pj4gSGktDQo+Pj4gQWZ0ZXIgdXBkYXRpbmcgb25lIG9m
IG15IHRlc3Qgc3lzdGVtcyB0byB2NS4xNS1yYywgSSBmb3VuZCB0aGF0IGl0DQo+Pj4gYmVj
b21lcyB1bnJlc3BvbnNpdmUgZHVyaW5nIHRoZSBsYXRlciBwYXJ0IG9mIHRoZSBib290IHBy
b2Nlc3MuIEENCj4+PiBwb3dlci1vbiByZXNldCBpcyBuZWNlc3NhcnkgdG8gcmVjb3Zlci4N
Cj4+PiBJIGJpc2VjdGVkIHRvIHRoaXMgY29tbWl0Og0KPj4+IDU3Mjk5NGJmMThmZiAoImRy
bS9hc3Q6IFplcm8gaXMgbWlzc2luZyBpbiBkZXRlY3QgZnVuY3Rpb24iKQ0KPj4NCj4+IFlv
dSBkb24ndCBoYXZlIGEgbW9uaXRvciBjb25uZWN0ZWQsIEkgZ3Vlc3M/DQo+IA0KPiBDb3Jy
ZWN0LCBteSBsYWIgc3lzdGVtcyB1c2UgSVBNSSBhbmQgYSBicm93c2VyLWF0dGFjaGVkIGNv
bnNvbGUuDQo+IA0KPiANCj4+IEluIHRoYXQgY2FzZSwgd2Ugbm93IHRyaWdnZXIgdGhlIGhl
bHBlcnMgdGhhdCBwb2xsIGZvciBjb25uZWN0ZWQgbW9uaXRvcnMuIEhvd2V2ZXIsIHRoZSBv
dmVyaGVhZCBzZWVtcyByYXRoZXIgZXh0cmVtZS4NCj4+DQo+PiBJJ2xsIGhhdmUgdG8gdHJ5
IHRvIHJlcHJvZHVjZSB0aGlzLCBvciBvdGhlcndpc2Ugd2UgY2FuIHJldmVydCB0aGUgY29t
bWl0Lg0KPiANCj4gSXQncyBzdHJhbmdlLCBvbmx5IHRoYXQgc3lzdGVtIGluIG15IGxhYiBz
ZWVtcyB0byBoYXZlIGEgcHJvYmxlbS4NCj4gVGhlIG90aGVycyB3b3JrIGZpbmUuDQo+IA0K
PiBUaGFua3MgZm9yIGhhdmluZyBhIGxvb2shDQoNCklzIGl0IGEgSFcgb3IgRlcgcHJvYmxl
bT8gTWF5YmUgYSBkaWZmZXJlbnQgcmV2aXNpb24/DQoNCkknbSBhc2tpbmcgYmVjYXVzZSB0
aGUgcHJvYmxlbWF0aWMgY29tbWl0IGRvZXMgdGhlIGNvcnJlY3QgdGhpbmcuIElmIA0KdGhl
cmUgaXMgbm8gVkdBIGNhYmxlIGNvbm5lY3RlZCwgdGhlIGRyaXZlciBzaG91bGQgcG9sbCB1
bnRpbCBpdCBkZXRlY3RzIA0Kb25lLiBUaGUgb3ZlcmhlYWQgc2hvdWxkIGJlIG1pbmltYWwu
DQoNCkJ1dCBJJ2xsIHRyeSB0byByZXByb2R1Y2UgYW55d2F5Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4+
IENoZWNraW5nIG91dCB2NS4xNS1yYzMgYW5kIHJldmVydGluZyB0aGlzIGNvbW1pdCBlbmFi
bGVzIHRoZSBzeXN0ZW0NCj4+PiB0byBib290IGFnYWluLg0KPj4+IDBiOjAwLjAgVkdBIGNv
bXBhdGlibGUgY29udHJvbGxlcjogQVNQRUVEIFRlY2hub2xvZ3ksIEluYy4gQVNQRUVEIEdy
YXBoaWNzIEZhbWlseSAocmV2IDMwKSAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0K
Pj4+ICAgICAgICAgIERldmljZU5hbWU6ICBBU1BFRUQgVmlkZW8gQVNUMjQwMA0KPj4+ICAg
ICAgICAgIFN1YnN5c3RlbTogU3VwZXIgTWljcm8gQ29tcHV0ZXIgSW5jIFgxMFNSTC1GDQo+
Pj4gICAgICAgICAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBN
ZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlz
SU5UeC0NCj4+PiAgICAgICAgICBTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0g
UGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJS
LSA8UEVSUi0gSU5UeC0NCj4+PiAgICAgICAgICBJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0
byBJUlEgMTgNCj4+PiAgICAgICAgICBSZWdpb24gMDogTWVtb3J5IGF0IGZhMDAwMDAwICgz
Mi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTE2TV0NCj4+PiAgICAgICAgICBSZWdp
b24gMTogTWVtb3J5IGF0IGZiMDAwMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtz
aXplPTEyOEtdDQo+Pj4gICAgICAgICAgUmVnaW9uIDI6IEkvTyBwb3J0cyBhdCBjMDAwIFtz
aXplPTEyOF0NCj4+PiAgICAgICAgICBFeHBhbnNpb24gUk9NIGF0IDAwMGMwMDAwIFt2aXJ0
dWFsXSBbZGlzYWJsZWRdIFtzaXplPTEyOEtdDQo+Pj4gICAgICAgICAgQ2FwYWJpbGl0aWVz
OiBbNDBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAzDQo+Pj4gICAgICAgICAgICAgICAg
ICBGbGFnczogUE1FQ2xrLSBEU0ktIEQxKyBEMisgQXV4Q3VycmVudD0zNzVtQSBQTUUoRDAr
LEQxKyxEMissRDNob3QrLEQzY29sZCspDQo+Pj4gICAgICAgICAgICAgICAgICBTdGF0dXM6
IEQwIE5vU29mdFJzdC0gUE1FLUVuYWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0NCj4+PiAg
ICAgICAgICBDYXBhYmlsaXRpZXM6IFs1MF0gTVNJOiBFbmFibGUtIENvdW50PTEvNCBNYXNr
YWJsZS0gNjRiaXQrDQo+Pj4gICAgICAgICAgICAgICAgICBBZGRyZXNzOiAwMDAwMDAwMDAw
MDAwMDAwICBEYXRhOiAwMDAwDQo+Pj4gICAgICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6
IGFzdA0KPj4+ICAgICAgICAgIEtlcm5lbCBtb2R1bGVzOiBhc3QNCj4+PiAtLQ0KPj4+IENo
dWNrIExldmVyDQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+
IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXINCj4gDQo+IC0tDQo+IENodWNrIExldmVyDQo+IA0KPiANCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------tqQWabLqUjakyTOXJPKnedK0--

--------------EVltyQ0NNwBPZFJKb9DFcyPs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFbCqMFAwAAAAAACgkQlh/E3EQov+AP
RxAAtchIerxnxnXgwejPAzsCFVHPRB4pPCOIPQu8/xzOifgDdjNZoXmB4r37LZ0E8RwVmF1N3g0k
pMna0B5dDb/ayy+Fsx4sJRHei7x6UNdTVMU9vxgywBjOBMqzi5IB9NhZpCBv6rtN/7pHnr+yzhRo
g+VGiMPtShu9FjvH4mN8e2wLreBEKxYjKjcYIi4U5ijGKUdn1kzw7qVhAXkDffHPD/Vr3xGsbwjj
OGKAv2LeyAtZ0wlyWfps0u6NxsJJzi+VKR3GSqeRYbeJ58NKbl4vOK9hukCmf/80EAV5yLHYa87d
2m8etFXItCbunGv7RTNVipy/EZCeyrfP8yR4a5vf2E9xB4Y9h6ZJ/z0k2/lIzEPOpGQpOTIa4MQs
ufqdsOvFiWp8OSDkETOCimDgC82aLrnAn2ZskVutU+M+bua2UfmL5rIlFBKz5MNARY/dMw7w1SUj
lq+33x+kICEZv88XnRB219KDPwo1Wp7PO06PvBWwhtMzqUeKKJ1idZcMpEcow2Joq5BcatP9Daxa
yxOZCZdAXMVNMZDjWxC9uLeYKekrBibQOe+P7wSJ/S8wgQXWqa5xb/qSZxQeWEhqeXDRm+tutnT0
YX6Q6kJpAKJ1xhFhUvkL9g9tTC2DSGvFeyFDjut3bhtrWFiJfZSFhDnhHBQttJoRta+Hx3CA5Auk
qbU=
=aeNj
-----END PGP SIGNATURE-----

--------------EVltyQ0NNwBPZFJKb9DFcyPs--
