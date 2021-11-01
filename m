Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88C441743
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 10:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DE989856;
	Mon,  1 Nov 2021 09:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13F089852
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 09:33:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FE592192D;
 Mon,  1 Nov 2021 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635759194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9OFcVxogKJLBgkZwFiYVQOM3mC4SMasLfoZRXvDpYYM=;
 b=gghbkPPjtqVkO3J4kBGxRlDYnihKx+D0LpCAc2W7mh1ElxsTV00w/L8Mu8sroMgPOLLuWS
 Mjj/iT4UJpnzdgjzLG+3ikdMtcWLClN/S/4wCj3ZXpi0c69ploR0HuN5jq3jCid335AFA7
 CEIq6cGXUcR5Eypp6rBQZsboEwFxdI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635759194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9OFcVxogKJLBgkZwFiYVQOM3mC4SMasLfoZRXvDpYYM=;
 b=19kzubA65PXqcp4IYvMuKTIzJGxyeYLGtmDVEpcEyrhjGKmOnnnF4Nkf2Hbz4SQwWmd76Y
 meN8awQIlT/1wyAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D90E13AB7;
 Mon,  1 Nov 2021 09:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SVDZCVq0f2EpOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 09:33:14 +0000
Message-ID: <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
Date: Mon, 1 Nov 2021 10:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
Content-Language: en-US
To: Sven Schnelle <svens@stackframe.org>
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87r1c0s1bt.fsf@x1.stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VDI6vAhjyhFxGj6kurmJYqiL"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VDI6vAhjyhFxGj6kurmJYqiL
Content-Type: multipart/mixed; boundary="------------5IwxK6LZfw08OHypdse56VHl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Helge Deller <deller@gmx.de>
Message-ID: <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
In-Reply-To: <87r1c0s1bt.fsf@x1.stackframe.org>

--------------5IwxK6LZfw08OHypdse56VHl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMTEuMjEgdW0gMDk6NTQgc2NocmllYiBTdmVuIFNjaG5lbGxlOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IEFtIDMxLjEwLjIxIHVtIDIwOjUzIHNjaHJpZWIgU3ZlbiBT
Y2huZWxsZToNCj4+PiBIaSBMaXN0KHMpLA0KPj4+IGkgd3JvdGUgYSBmYmRldiBkcml2ZXIg
Zm9yIHRoZSBIUCBWaXN1YWxpemUgRlggY2FyZHMgdXNlZCBzb21lIG9mDQo+Pj4gdGhlDQo+
Pj4gUEEtUklTQyB3b3Jrc3RhdGlvbnMuIEl0IHV0aWxpemVzIHNvbWUgb2YgdGhlIDJEIGFj
Y2VsZXJhdGlvbiBmZWF0dXJlcw0KPj4+IHByZXNlbnQgaW4gdGhlIGNhcmQuDQo+Pj4gWy4u
XQ0KPj4NCj4+IFRoYW5rcyBmb3IgYWxsIHRoZSB3b3JrIHlvdSBwdXQgaW50byB0aGlzLiBX
ZSB3ZWxjb21lIGRyaXZlcnMgZXZlbiBmb3INCj4+IG9sZGVyIGhhcmR3YXJlLCBidXQgbm90
IGZvciBmYmRldi4gRFJNIGlzIGFsbCB0aGUgcmFnZSBub3cgYW5kIGhhcw0KPj4gYmVlbiBm
b3IgYSB3aGlsZS4gSSdkIGxpa2UgdG8gYXNrIHlvdSB0byBjb252ZXJ0IHRoZSBkcml2ZXIg
dG8gRFJNIGFuZA0KPj4gcmVzdWJtaXQgdG8gPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+Lg0KPj4NCj4+IEkgd2hpbGUgYWdvLCBJIG1hZGUgY29udmVyc2lvbiBoZWxwZXJz
IGZvciB0aGlzLiBZb3UgY2FuIGxvb2sgYXQgWzFdDQo+PiBmb3IgYSB0cml2aWFsIERSTSBk
cml2ZXJzIHRoYXQgd3JhcHMgZXhpc3RpbmcgZmJkZXYgZHJpdmVycyBmb3IgdXNlDQo+PiB3
aXRoIERSTS4gT25jZSB5b3UgaGF2ZSB0aGF0LCBpdCB0dXJucyBpbnRvIGEgcmVmYWN0b3Jp
bmcgam9iLg0KPiANCj4gVGhhbmtzLCBpIHdhc24ndCBhd2FyZSBhcyBpIG5vcm1hbGx5IGRv
bid0IGRvIGFueSBncmFwaGljcyByZWxhdGVkDQo+IGRldmVsb3BtZW50LiBJIHRha2UgYSBs
b29rIGF0IGRyaSBhbmQgcG9ydCB0aGUgZHJpdmVyLCB3aGljaCBpcw0KPiBob3BlZnVsbHkg
bm90IHRvbyBoYXJkLg0KDQpTb3VuZHMgZ29vZC4NCg0KVGhlIG9uZSBiaWcgZGlmZmVyZW5j
ZSB3aGVuIGNvbnZlcnRpbmcgaXMgdGhhdCBEUk0gcmVhbGx5IHdhbnRzIGRyaXZlcnMgDQp0
byBzdXBwb3J0IDMyLWJpdCBYUkdCIGNvbG9ycy4gSXQncyBub3QgYSBEUk0gbGltaXRhdGlv
biBwZXIgc2UsIGJ1dCBhIA0KcmVxdWlyZW1lbnQgb2YgdG9kYXkncyB1c2Vyc3BhY2UgcHJv
Z3JhbXMuIEFGQUlDUyB5b3VyIGZiZGV2IGRyaXZlciB1c2VzIA0KYSAyNTYtY29sb3IgcGFs
ZXR0ZSBmb3JtYXQuIFNvIHRoZSBEUk0gZHJpdmVyIHdvdWxkIGhhdmUgdG8gY29udmVydA0K
WFJHQjg4ODggdG8gOC1iaXQgUkdCMzMyIGFuZCBpbnN0YWxsIGEgY29ycmVzcG9uZGluZyBw
YWxldHRlLiBEb24ndCANCndvcnJ5LCBpdCdzIGVhc3kuIFRha2UgYSBsb29rIGF0IHRoZSBj
aXJydXMgZHJpdmVyIGZvciBhIHNpbXBsZSBEUk0gDQpkcml2ZXIuIFsxXQ0KDQpJZiB5b3Ug
bmVlZCBoZWxwLCB0aGVyZSdzIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPi4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMu
Yw0KDQo+IA0KPiBTdmVuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------5IwxK6LZfw08OHypdse56VHl--

--------------VDI6vAhjyhFxGj6kurmJYqiL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF/tFkFAwAAAAAACgkQlh/E3EQov+CZ
wBAAufeTzCECm7XqUxHhxlLDxHi1Gu8y5fR0N05E+KnXkqeW7yvG6VVqsNcB6CEqQB4NmPdVqMx4
nTmldiE3QUNWjSHqHRsA7PkB6lAtiEcFmfqb2OwoswCxaFpuX+slbAp8VyU6treq/hOgJxi70kLa
7pihVJ+9r/K6EmyP2GtNhCdVSiVIA5M917cDnotcqx6zhQJiSjOV+7CagFi96mjGaTA4keqkK/0e
+z2d4CiXJPbljvnMwTwm1sd6rFPfMfibwxHwhRoaKSY8JHmg9ZgkixATzUZurFVzw+kRQDM8R5SD
0TathAfY1ME5m1AkrTm0Kxx91mlQzwQ2NDGojBGPDN0kQleuVDwx3SVPAGjeJBtlkNusRS67roCL
qxGrp670K8dcTnuDHVCGtA64lF66G+Dqbcfm+6XwU6Etn6KtwL1fm1CrGR7lLXAFXoQ8bDwWltxN
4M979Tc5VKli8O9XQQzaNnFvy6syTMXimeq95+0oyqVj7IxE/T3gpLRDwTNrgPv2F1hQnGqdbReD
vF35fmvMtY9efxUfpkrzgY9tftLdTiRmiuALw/kIpppH6SOABoYpPJJMCZBRiw6Z3n1ysNRhLbVE
Y2eBEr0UuMajrMY0oxxPaC5DwZPAUuuasdz9yrk5/+UkNx09sBwYRvBUdVaIDTI15r27qtijNQgm
gng=
=ZqXA
-----END PGP SIGNATURE-----

--------------VDI6vAhjyhFxGj6kurmJYqiL--
