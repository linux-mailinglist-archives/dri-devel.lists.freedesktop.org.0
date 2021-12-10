Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710FD46FCB5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CB810E3F3;
	Fri, 10 Dec 2021 08:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1788F10E3E6;
 Fri, 10 Dec 2021 08:24:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 933501F3A7;
 Fri, 10 Dec 2021 08:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639124661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lxt8usXzhfSTMIerYCgaXVZhL3OS40ZuTOH9WL+4LA=;
 b=vN9sqQyTp1lh9JSRPcnhrD3wwtw5IIiv6DYaaqID5j73kDlCTJ64NtDpVUL1qGgH6/bwyt
 NTt609gsYcPOxliGxAecB9g6j66BtaV4k//qgQqPXEYD3Fa8IOvL7jMQ3bHTa5OSVgtmjA
 1uP1f8LFCsTmmcBwp2emFvIUqRR57GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639124661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lxt8usXzhfSTMIerYCgaXVZhL3OS40ZuTOH9WL+4LA=;
 b=AVo6PKIh1Jc2ZWSRIOTorcQcJQa86tTeWuVytMJ5XoWd43gTmd1TEt8leH3xMH6Bx/bX9Z
 AcP+qtw9+4lFFvDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B67713BA4;
 Fri, 10 Dec 2021 08:24:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UpHxDLUOs2G1FQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Dec 2021 08:24:21 +0000
Message-ID: <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
Date: Fri, 10 Dec 2021 09:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KvoFjzqY9p5CbDDYH5tTFH0S"
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KvoFjzqY9p5CbDDYH5tTFH0S
Content-Type: multipart/mixed; boundary="------------80WEhdOKoaLAAtRPUYO6iPCM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 kexec@lists.infradead.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 kernel@gpiccoli.net, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>, Christian Koenig <christian.koenig@amd.com>,
 Vivek Goyal <vgoyal@redhat.com>
Message-ID: <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
In-Reply-To: <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>

--------------80WEhdOKoaLAAtRPUYO6iPCM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTIuMjEgdW0gMTk6MTcgc2NocmllYiBHdWlsaGVybWUgRy4gUGljY29s
aToNCj4gVGhhbmtzIGFnYWluIEFsZXghIFNvbWUgY29tbWVudHMgaW5saW5lZCBiZWxvdzoN
Cj4gDQo+IE9uIDA5LzEyLzIwMjEgMTU6MDYsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+IE5v
dCByZWFsbHkgaW4gYSBnZW5lcmljIHdheS4gIEl0J3MgYXNpYyBhbmQgcGxhdGZvcm0gc3Bl
Y2lmaWMuICBJbg0KPj4gYWRkaXRpb24gbW9zdCBtb2Rlcm4gZGlzcGxheXMgcmVxdWlyZSBs
aW5rIHRyYWluaW5nIHRvIGJyaW5nIHVwIHRoZQ0KPj4gZGlzcGxheSwgc28geW91IGNhbid0
IGp1c3Qgc2F2ZSBhbmQgcmVzdG9yZSByZWdpc3RlcnMuDQo+IA0KPiBPaCBzdXJlLCBJIHVu
ZGVyc3RhbmQgdGhhdC4gTXkgcXVlc3Rpb24gaXMgbW9yZSBsaWtlOiBpcyB0aGVyZSBhIHdh
eSwNCj4gaW5zaWRlIGFtZGdwdSBkcml2ZXIsIHRvIHNhdmUgdGhpcyBzdGF0ZSBiZWZvcmUg
dGFraW5nDQo+IG92ZXIvb3ZlcndyaXRpbmcvcmVwcm9ncmFtbWluZyB0aGUgZGV2aWNlPyBT
byB3ZSBjb3VsZCAoYWdhaW4sIGZyb20NCj4gaW5zaWRlIHRoZSBhbWRncHUgZHJpdmVyKSBk
dW1wIHRoaXMgcHJlLXNhdmVkIHN0YXRlIGluIHRoZSBzaHV0ZG93bg0KPiBoYW5kbGVyLCBm
b3IgZXhhbXBsZSwgaGF2aW5nIHRoZSBkZXZpY2UgaW4gYSAicHJlLU9TIiBzdGF0ZSB3aGVu
IHRoZSBuZXcNCj4ga2V4ZWMnZWQga2VybmVsIHN0YXJ0cy4NCg0KV2UgaGF2ZSBoYXZlIGJl
ZW4gdGFsa2luZyBhYm91dCByZWFkaW5nIG91dCBhbmQgc3RvcmluZyBzdGF0ZSBvZiBhY3Rp
dmUgDQpkZXZpY2VzIHdpdGhpbiBEUk0uIFNvIGZhciBub3RoaW5nIHVzYWJsZSBoYXMgZW1l
cmdlZC4gSW4gYSBkaXN0YW50IA0KZnV0dXJlLCBrZXhlYyBtaWdodCBiZSBhYmxlIHRvIHN0
b3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBhY3RpdmUgDQpmcmFtZWJ1ZmZlciBhbmQgdGhl
IG5ldyBrZXJuZWwncyBzaW1wbGVkcm0gKG9yIHNvbWUgb3RoZXIgZHJpdmVyKSBjb3VsZCAN
CnVzZSBpdCBhcyBvdXRwdXQuDQoNCkJ1dCBkb24ndCBob2xkIHlvdXIgYnJlYXRoIGZvciBp
dC4gSXQgd29uJ3QgaGFwcGVuIGFueXRpbWUgc29vbi4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4+DQo+PiBUaGUgZHJpdmVycyBhcmUgYXNpYyBhbmQgcGxhdGZvcm0gc3Bl
Y2lmaWMuICBFLmcuLCB0aGUgZHJpdmVyIGZvcg0KPj4gdmFuZ29naCBpcyBkaWZmZXJlbnQg
ZnJvbSByZW5vaXIgaXMgZGlmZmVyZW50IGZyb20gc2t5bGFrZSwgZXRjLiAgVGhlDQo+PiBk
aXNwbGF5IHByb2dyYW1taW5nIGludGVyZmFjZXMgYXJlIGFzaWMgc3BlY2lmaWMuDQo+IA0K
PiBDb29sLCB0aGF0IG1ha2VzIHNlbnNlISBCdXQgaWYgeW91IChvciBhbnlib2R5IGhlcmUp
IGtub3cgc29tZSBvZiB0aGVzZQ0KPiBHT1AgZHJpdmVycywgZS5nLiBmb3IgdGhlIHFlbXUv
cXhsIGRldmljZSwgSSdtIGp1c3QgY3VyaW91cyB0bw0KPiBzZWUvdW5kZXJzdGFuZCBob3cg
Y29tcGxleCBpcyB0aGUgRlcgZHJpdmVyIHRvIGp1c3QgcHV0IHRoZQ0KPiBkZXZpY2Uvc2Ny
ZWVuIGluIGEgdXNhYmxlIHN0YXRlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gDQo+IEd1aWxo
ZXJtZQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------80WEhdOKoaLAAtRPUYO6iPCM--

--------------KvoFjzqY9p5CbDDYH5tTFH0S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGzDrQFAwAAAAAACgkQlh/E3EQov+D1
VA//TolDEsSYZwbPj3dNNMdIhs0PchvGgm6Zjy/NRhlXGo88GEiuDqxJcb51HQZemAHruSwLAu1j
rDENbU9RdR3kurNVhcnCvFLMWFNAHxR2zzmZVeEvaaCOkyEcFeLCCBY6jKP3l09n+nMxUtZ9lVsD
7HKgncawMr5JZc8zAhAB5tx0xoudyzWB+GkRiR+xrcD4oDCHG2vrx8HxXkd6AnDlXw92H4AxwYZ9
p/fgKTV7IVEy0dKc4xbcmNDW5SuookiQCinID2jNOND2+pqnO5yteCQ+m26LAUouL+0twSmwerHJ
VpoJ7tZKi6gky8S5DvewhXPuuKb/IEZnhl983q5bupJdOw2va9v6jRaXJtJtOw7y0Q4VUA3C9Zop
t7JX+GFTmMyc2CapAB8VT1C3yj3sAN5iL8U7o6esLF7OUyob06ElvlqJrClIhDlOTlg2UKdQdphc
RHxwKbkGzLnV3qEu218q37qJrLNfbB0kbOGQCAMAUnIeWN7yRS2K5Yvq81tPJ9LHV1Y1uh5GGXGa
aWnu1OqHGXu+WFxWw19x27PQi8O1n/A8bLwOfjGUT986k9jJgYt9SmFtRkcdLidNWhl/858606gx
mW2qMawQUOQ8Hu8CMJm/ackkuFAG6Pa+iQy+itFXewWwYI4vOy3qP/28eg4o1myCduvhOdLj3SYX
7PQ=
=WnRY
-----END PGP SIGNATURE-----

--------------KvoFjzqY9p5CbDDYH5tTFH0S--
