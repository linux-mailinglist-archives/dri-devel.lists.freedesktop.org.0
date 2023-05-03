Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E36F5DCB
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 20:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93B210E330;
	Wed,  3 May 2023 18:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF6810E330
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 18:21:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B354F22B82;
 Wed,  3 May 2023 18:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683138071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJkcdlJ8uYOoL34KmPnx41oYkLy6xV5MCThO6fxInHk=;
 b=bn9L2IUbTrp7RzYFsdchd5d3sPSaKXfygfQoqKIUxYsqdIugCvmb/jMmdwQd09hLsp29k5
 4yajZMpIBbUs7xx9HJ0CDM79/Dl9l07fMkYX1wpkHj/X2li6KUsRUfYHKQi1g0WDbPJHf7
 cJR3dABD80P/aoIX+RyEIptPLcbOlZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683138071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJkcdlJ8uYOoL34KmPnx41oYkLy6xV5MCThO6fxInHk=;
 b=NbCxZEr/SPYo4lTnX1E4gHsgslerXGkVgrU+AwsxWMxHRS/yRCBD3c6J/7FiYEOH7mmlOs
 Zl2Tg58SupW69cDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A55C13584;
 Wed,  3 May 2023 18:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WebOIBemUmQdPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 May 2023 18:21:11 +0000
Message-ID: <8e8bc38f-2481-777c-97f4-37bd226556b2@suse.de>
Date: Wed, 3 May 2023 20:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
 <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
 <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
 <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9mzxVxtDURkET6jTpp4WXiZ4"
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9mzxVxtDURkET6jTpp4WXiZ4
Content-Type: multipart/mixed; boundary="------------LtvMHykG0vTjj8cI1bsdZUpQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
Message-ID: <8e8bc38f-2481-777c-97f4-37bd226556b2@suse.de>
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
 <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
 <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
 <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>
In-Reply-To: <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>

--------------LtvMHykG0vTjj8cI1bsdZUpQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDUuMjMgdW0gMTc6MDIgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFdlZCwgTWF5IDMsIDIwMjMgYXQgNDozMOKAr1BN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFt
IDAzLjA1LjIzIHVtIDExOjUxIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0KPj4+IE9u
IEZyaSwgQXByIDI4LCAyMDIzIGF0IDI6MjbigK9QTSBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4+IFB1c2ggdGhlIHRlc3QgZm9yIGluZm8t
PnNjcmVlbl9iYXNlIGZyb20gZmJfcmVhZCgpIGFuZCBmYl93cml0ZSgpIGludG8NCj4+Pj4g
dGhlIGltcGxlbWVudGF0aW9ucyBvZiBzdHJ1Y3QgZmJfb3BzLntmYl9yZWFkLGZiX3dyaXRl
fS4gSW4gY2FzZXMgd2hlcmUNCj4+Pj4gdGhlIGRyaXZlciBvcGVyYXRlcyBvbiBpbmZvLT5z
Y3JlZW5fYnVmZmVyLCB0ZXN0IHRoaXMgZmllbGQgaW5zdGVhZC4NCj4+Pj4NCj4+Pj4gV2hp
bGUgYm90aGkgZmllbGRzLCBzY3JlZW5fYmFzZSBhbmQgc2NyZWVuX2J1ZmZlciwgYXJlIHN0
b3JlZCBpbiB0aGUNCj4+Pg0KPj4+IGJvdGgNCj4+Pg0KPj4+PiBzYW1lIGxvY2F0aW9uLCB0
aGV5IHJlZmVyIHRvIGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcy4gRm9yIGNvcnJlY3RuZXNz
LA0KPj4+PiB3ZSB3YW50IHRvIHRlc3QgZWFjaCBmaWVsZCBpbiBleGFjdGx5IHRoZSBjb2Rl
IHRoYXQgdXNlcyBpdC4NCj4+Pg0KPj4+IE5vdCBhIGRpcmVjdCBjb21tZW50IGZvciB0aGlz
IHBhdGNoOiBhbmQgbGF0ZXIgdGhlIHVuaW9uIGNhbiBiZSBzcGxpdA0KPj4+IGluIHR3byBz
ZXBhcmF0ZSBmaWVsZHMsIHRvIHByb3RlY3QgYWdhaW5zdCBtaXN1c2U/DQo+Pg0KPj4gTm8g
aWRlYS4gQ3VycmVudGx5IHdlIGhhdmUgc3BhcnNlIHRoYXQgd2FybnMgYWJvdXQgbWlzbWF0
Y2hpbmcgYWRkcmVzcw0KPj4gc3BhY2VzIGlmIHRoZSBmaWVsZHMgYXJlIG1peGVkIHVwLiBU
aGF0J3MgZ29vZCBlbm91Z2gsIGFzIGZhciBJJ20gY29uY2VybmVkLg0KPiANCj4gVGhlIHBv
dGVudGlhbCBpc3N1ZSB0aGF0IGlzIHN0aWxsIHByZXNlbnQgaXMgdGhhdCBhbiBmYmRldiBk
cml2ZXIgdXNlcw0KPiBmYl9pbmZvLnNjcmVlbl9iYXNlLCBhbmQgY29uZmlndXJlcyB0aGUg
dXNlIG9mIGRyYXdpbmcgb3BzIHRoYXQgdXNlDQo+IGZiX2luZm8uc2NyZWVuX2J1ZmZlciAo
b3IgdmljZS12ZXJzYSksIHdoaWNoIHdpbGwgaGFwcGlseSB1c2UgdGhlIHdyb25nDQo+IHR5
cGUgb2YgcG9pbnRlci4gIFNwYXJzZSBkb2Vzbid0IHByb3RlY3QgYWdhaW5zdCB0aGF0Lg0K
DQpSaWdodC4gRnJvbSBhIHF1aWNrIGdyZXAsIEkndmUgZm91bmQgcXVpdGUgYSBjYXNlcyB3
aGVyZSBjZmJfIGZ1bmN0aW9ucyANCm9wZXJhdGUgb24gbm9uLV9faW9tZW0gbWVtb3J5LiBJ
J20gc3VyZSB0aGF0IHRoZSBvcHBvc2l0ZSB3aXRoIHN5c18gDQpmdW5jdGlvbnMgZXhpc3Rz
IGFzIHdlbGwuIEZpeGluZyB0aGlzIHdpbGwgYmUgYSBnb29kIGZvbGxvdy11cCBwYXRjaHNl
dC4gDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------LtvMHykG0vTjj8cI1bsdZUpQ--

--------------9mzxVxtDURkET6jTpp4WXiZ4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRSphcFAwAAAAAACgkQlh/E3EQov+BE
Cw/8CadnxaAGPZYY8T1GYhs5B/NTg0V+d/3Y3zuDdM4de2DB5V/JNeenRFucNRkOzXZ2Gr0X1GkV
5F3cj6AyAz4PhNYScyJIbtkNhYO2ee/+EzkqSrJnOZVsO2uA+YMatgJha8ifaOTLgzSh3FEpTmqq
dnR80f5jBI158x0b9PeQ4at//i4mz+ztTzlKDc/hiQV1S4JApUL6HA9LTmEyMp0nloFEQRxyQ+t+
Ik5hnV/xhFDa3ttmA+x7L9NtGZHvXRQJtKkt//azY7VsHO3rLent1pWNKlelDD3BtgwKBy/2iZci
AJd7TYs89X+o7bmk/JCZ5btnXf45HHezaxmh5FgRPgmozYCfRSNC8+gPY30ELPQSo42MvELJ6Czw
wgZ15GEshuP5r/BBtugq73WCYfhnuLUDLfaGjxIoOJu+3OtlDqfb1pKSS0EAyUVRAnFUI30NYQha
E0r9/GphcqWjsiz4F9kn+AyrfdcguDMq/hhnk3mrBMexr6q/BUY5pEH5U4YIuPZOcpKUJco9NCgo
9WN9dzfrrcwgynbP+DUjP1r3fPIcFQ6APzkelfw0tdLuuzf+Jt+CzLZcDpfyk5w5/+19OSn5z2QY
VpSwIbNX5DGdtHWTALj5u/+cCapBAuzvZ9ejaQx+IeyK0E2ka8icTEKNAT4BxfcylrFaImRHq1db
8CQ=
=7O9P
-----END PGP SIGNATURE-----

--------------9mzxVxtDURkET6jTpp4WXiZ4--
