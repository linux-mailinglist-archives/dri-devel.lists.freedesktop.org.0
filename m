Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A54906FE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 12:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90610E141;
	Mon, 17 Jan 2022 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903B10E141
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 11:16:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAE921F399;
 Mon, 17 Jan 2022 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642418182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnTiZM/I4lXeOrr5FJ9dytOgHT4W17EpADJ4XFi+biI=;
 b=zELPdUDwUWFsS6Z+7Wc5i6oy2EI5kLe9gqE9YN+kre4ec/sIgNaaoWvYKzCVOQIdx82bwu
 WI3xdYPRrTsdAMKq1l/KP1ag2zQZ+rs7oYmLZrOa2xN7Gbmv2NfTpCqy90FzeX4rrS8NJ+
 Du+WmRqeHKea/8eG92Sqszc38gzfCUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642418182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnTiZM/I4lXeOrr5FJ9dytOgHT4W17EpADJ4XFi+biI=;
 b=V4s+mm89QqxIM01QfXeKCx9f8pGOSeYo7DDWbKndoiIW5rrOpAI3/suBiWL9rcstXl+hRU
 tbLDImgsJf89saAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F48C13AE2;
 Mon, 17 Jan 2022 11:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J5rzIQZQ5WGIcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 11:16:22 +0000
Message-ID: <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
Date: Mon, 17 Jan 2022 12:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <YeG8ydoJNWWkGrTb@ls3530>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YeG8ydoJNWWkGrTb@ls3530>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l0YNj3Le6R4cDBjWbmghtxim"
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l0YNj3Le6R4cDBjWbmghtxim
Content-Type: multipart/mixed; boundary="------------8Q1TezFaHshXCr3Viua02Bqu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
In-Reply-To: <YeG8ydoJNWWkGrTb@ls3530>

--------------8Q1TezFaHshXCr3Viua02Bqu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDEuMjIgdW0gMTk6MTEgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IFRo
ZSBmYmRldiBsYXllciBpcyBvcnBoYW5lZCwgYnV0IHNlZW1zIHRvIG5lZWQgc29tZSBjYXJl
Lg0KPiBTbyBJJ2QgbGlrZSB0byBzdGVwIHVwIGFzIG5ldyBtYWludGFpbmVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KDQpGaXJzdCBv
ZiBhbGwsIHRoYW5rIHlvdSBmb3Igc3RlcHBpbmcgdXAgdG8gbWFpbnRhaW4gdGhlIGZiZGV2
IGNvZGViYXNlLiANCkl0IHJlYWxseSBuZWVkcyBzb21lb25lIGFjdGl2ZWx5IGxvb2tpbmcg
YWZ0ZXIgaXQuDQoNCkFuZCBub3cgY29tZXMgdGhlIEJVVC4NCg0KSSB3YW50IHRvIHNlY29u
ZCBldmVyeXRoaW5nIHNhaWQgYnkgRGFuaWFsIGFuZCBKYXZpZXIuIEluIGFkZGl0aW9uIHRv
IA0KcHVyZWx5IG9yZ2FuaXphdGlvbmFsIHRvcGljcyAodHJlZXMsIFBScywgZXRjKSwgdGhl
cmUgYXJlIGEgbnVtYmVyIG9mIA0KaW5oZXJpdCBwcm9ibGVtcyB3aXRoIGZiZGV2Lg0KDQog
ICogSXQncyA5MHMgdGVjaG5vbG9neS4gTmVpdGhlciBkb2VzIGl0IGZpdCB0b2RheSdzIHVz
ZXJzcGFjZSwgbm90IA0KaGFyZHdhcmUuIElmIHlvdSBoYXZlIG1vcmUgdGhhbiBqdXN0IHRo
ZSBtb3N0IHRyaXZpYWwgb2YgZ3JhcGhpY2FsIA0Kb3V0cHV0IGZiZGV2IGlzbid0IGZvciB5
b3UuDQoNCiAgKiBUaGVyZSdzIG5vIG5ldyBkZXZlbG9wbWVudCBpbiBmYmRldiBhbmQgdGhl
cmUgYXJlIG5vIG5ldyBkcml2ZXJzLiANCkV2ZXJ5b25lIHdvcmtzIG9uIERSTSwgd2hpY2gg
aXMgYmV0dGVyIGluIG1vc3QgcmVnYXJkcy4gVGhlIGNvbnNlcXVlbmNlIA0KaXMgdGhhdCB1
c2Vyc3BhY2UgaXMgc2xvd2x5IGxvb3NpbmcgdGhlIGFiaWxpdHkgdG8gdXNlIGZiZGV2Lg0K
DQogICogQSBmZXcgdXNlLWNhc2VzIGZvciBlZmlmYiByZW1haW4sIGJ1dCBkaXN0cmlidXRp
b25zIGFyZSBhY3RpdmVseSANCm1vdmluZyBhd2F5IGZyb20gZmJkZXYuIEkga25vdyB0aGF0
IGF0IGxlYXN0IG9wZW5TVVNFLCBGZWRvcmEgYW5kIEFscGluZSANCmRvIHRoaXMuDQoNCkkn
ZCBsaWtlIHRvIGhlYXIgd2hhdCB5b3VyIHBsYW5zIGFyZSBmb3IgZmJkZXY/DQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQo+IGluZGV4IDVkMGNkNTM3ODAzYS4uY2U0N2RiYzQ2N2NjIDEwMDY0NA0K
PiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtNzU4Mywx
MSArNzU4MywxMiBAQCBXOglodHRwOi8vZmxvYXRpbmdwb2ludC5zb3VyY2Vmb3JnZS5uZXQv
ZW11bGF0b3IvaW5kZXguaHRtbA0KPiAgIEY6CWFyY2gveDg2L21hdGgtZW11Lw0KPiANCj4g
ICBGUkFNRUJVRkZFUiBMQVlFUg0KPiAtTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiArTToJSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KPiAgIEw6CWxpbnV4
LWZiZGV2QHZnZXIua2VybmVsLm9yZw0KPiAtUzoJT3JwaGFuDQo+ICtMOglkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICtTOglNYWludGFpbmVkDQo+ICAgUToJaHR0cDov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtZmJkZXYvbGlzdC8NCj4gLVQ6
CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MNCj4gK1Q6
CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGVs
bGVyL2xpbnV4LWZiZGV2LmdpdA0KPiAgIEY6CURvY3VtZW50YXRpb24vZmIvDQo+ICAgRjoJ
ZHJpdmVycy92aWRlby8NCj4gICBGOglpbmNsdWRlL2xpbnV4L2ZiLmgNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------8Q1TezFaHshXCr3Viua02Bqu--

--------------l0YNj3Le6R4cDBjWbmghtxim
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHlUAYFAwAAAAAACgkQlh/E3EQov+C0
LQ//ZoGs5bMCFn9WBQ7zO9i5wFwNh7TDZX2K1AW//MV+bjL4qF3JeAeA3PCAauWzC1vPxwq5zk7A
5ud9b6KXN1wFk/3beHjHb6hgBPGjRjmve/mxlooNHMf+g1j0gAzZzBXIv4S2PMUMRBcAh2EHhKhV
lumNarchne9RZElI8AeVN5pKVtn2yeB3VDHp3mFfCDxXIEIEee8DJi7phhYNu5D6JXmT6xDt0l44
zUfZCLbnrAlfpstD5yKnjgXMSwIxSKTvM9Ixz7AYG5QTjvBa1SBm55KLEGBbTozLet22Ob6A1fjx
hCRY2NZGOqvd8o/i0DLPMmUxPxk2qG/5vPxXHQtwP6WnIoeb6bci5GEHPK8vRWQ4FrLSkVtLOQXa
JM37/PpjR7WnLvKPh4RlZkJ9NY5MoEjoqa2e17nl0Uc/7L7TdEJginl4CnHdMTcA7JjuDi5JCJ0o
NWCWIj3GoIhZaGlA0x6Hoeu3W3WBWDF2BhB4cZnhXCteahHqND9HU7no0EOSkUL7PTzf+FiiIp4/
pux6dMglU3LHGE0BwTBX0EvrP5PJrg1Awd4vH/i8r7j+DK5oxT9/qQr+8Wx76SKi8owrZSVz3thK
xHwko1P0pG9gCZwb0ywBLlR28CP5BnCE/kM+9wxTnAeTb33w9JHmHqakI7DvvvAt1DslY+b8jylg
7oM=
=5yiM
-----END PGP SIGNATURE-----

--------------l0YNj3Le6R4cDBjWbmghtxim--
