Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427D610ADE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79110E78A;
	Fri, 28 Oct 2022 06:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D18910E78C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:59:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2409C1F8B6;
 Fri, 28 Oct 2022 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666940391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4MXWeO4M8kbbDWfM60kHRl49Dvi+jSuWW/27LNLA7I=;
 b=mi9rubEtkoSw3uI5z3cUtCl3gwqkAjoRm/ELcYfm5NFPPhzobIqC4puKXUM6sN1f2G70/a
 bzvPyaOrGVvfDtWnVGU6QfA1i7eQSWtlQBH72oCN+wnOszb1gId6JtEoPZCKImxoLhSfz5
 zLGL1FTiTx6jXJv/CFACjfbTQ9oszpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666940391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4MXWeO4M8kbbDWfM60kHRl49Dvi+jSuWW/27LNLA7I=;
 b=7ydEjsAzUPX32iijmFJn7UwCpA1xGqKWR/Y3TADEcGVUyvha4WA9jnJFiOmU+s3ZS8lYru
 IPguFbArfZ4wr+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0909F1377D;
 Fri, 28 Oct 2022 06:59:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qaJSAed9W2OTTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Oct 2022 06:59:51 +0000
Message-ID: <e343f02c-376d-2837-2780-199d9e39b7b3@suse.de>
Date: Fri, 28 Oct 2022 08:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <5987066.DvuYhMxLoT@steina-w> <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
 <2204479.tdWV9SEqCh@steina-w>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2204479.tdWV9SEqCh@steina-w>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h1KAnm0yR0xoyQdHgpbVMAzm"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h1KAnm0yR0xoyQdHgpbVMAzm
Content-Type: multipart/mixed; boundary="------------OQOWqSC0nQM23wiRmdZJf2tD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 kernel test robot <lkp@intel.com>
Message-ID: <e343f02c-376d-2837-2780-199d9e39b7b3@suse.de>
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <5987066.DvuYhMxLoT@steina-w> <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
 <2204479.tdWV9SEqCh@steina-w>
In-Reply-To: <2204479.tdWV9SEqCh@steina-w>

--------------OQOWqSC0nQM23wiRmdZJf2tD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMTAuMjIgdW0gMDg6MzMgc2NocmllYiBBbGV4YW5kZXIgU3RlaW46DQo+
IEhpIFRob21hcywNCj4gDQo+IEFtIERvbm5lcnN0YWcsIDI3LiBPa3RvYmVyIDIwMjIsIDE2
OjA0OjM0IENFU1Qgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+ICogUEdQIFNpZ25l
ZDogMTAvMjcvMjAyMiBhdCAwNDowNDozNCBQTQ0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMjcu
MTAuMjIgdW0gMTU6MDcgc2NocmllYiBBbGV4YW5kZXIgU3RlaW46DQo+Pj4gSGVsbG8gVGhv
bWFzLA0KPj4+DQo+Pj4gQW0gRG9ubmVyc3RhZywgMjcuIE9rdG9iZXIgMjAyMiwgMTM6NTc6
MDYgQ0VTVCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4+PiBQcm9wZXJ0aWVzIG9m
IDMyLWJpdCBpbnRlZ2VycyBhcmUgcmV0dXJuZWQgZnJvbSB0aGUgT0YgZGV2aWNlIHRyZWUN
Cj4+Pj4gYXMgdHlwZSBfX2JlMzIuIENhc3QgUENJIHZlbmRvciBhbmQgZGV2aWNlIElEcyBm
cm9tIF9fYmUzMiB0byB1MzINCj4+Pj4gYmVmb3JlIGNvbXBhcmluZyB0aGVtIHRvIGNvbnN0
YW50cy4gRml4ZXMgc3BhcnNlIHdhcm5pbmdzIHNob3duIGJlbG93Lg0KPj4+Pg0KPj4+PiAg
ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYzoyMzc6MTc6IHdhcm5pbmc6IHJlc3Ry
aWN0ZWQgX19iZTMyDQo+Pj4+ICAgICBkZWdyYWRlcw0KPj4+Pg0KPj4+PiB0byBpbnRlZ2Vy
IGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmM6MjM4OjE4OiB3YXJuaW5nOiByZXN0cmlj
dGVkDQo+Pj4+IF9fYmUzMg0KPj4+PiBkZWdyYWRlcyB0byBpbnRlZ2VyIGRyaXZlcnMvZ3B1
L2RybS90aW55L29mZHJtLmM6MjM4OjU0OiB3YXJuaW5nOg0KPj4+PiByZXN0cmljdGVkIF9f
YmUzMiBkZWdyYWRlcyB0byBpbnRlZ2VyDQo+Pj4+DQo+Pj4+IFNlZSBbMV0gZm9yIHRoZSBi
dWcgcmVwb3J0Lg0KPj4+Pg0KPj4+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiBMaW5rOg0KPj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjEwMTkyMjA4LkQ4ODhJNlg3LWxrcEBpbnRlbC5j
b20vICMNCj4+Pj4gWzFdIC0tLQ0KPj4+Pg0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdGlu
eS9vZmRybS5jIHwgNSArKysrLQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlueS9vZmRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYw0K
Pj4+PiBpbmRleCAwZTFjYzIzNjlhZmNjLi4wZGE4YjI0OGNjYzZlIDEwMDY0NA0KPj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L29mZHJtLmMNCj4+Pj4gQEAgLTIzMSw4ICsyMzEsMTEgQEAgc3RhdGlj
IHU2NCBkaXNwbGF5X2dldF9hZGRyZXNzX29mKHN0cnVjdCBkcm1fZGV2aWNlDQo+Pj4+ICpk
ZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2YgcmV0dXJuIGFkZHJlc3M7DQo+Pj4+DQo+Pj4+
ICAgIH0NCj4+Pj4NCj4+Pj4gLXN0YXRpYyBib29sIGlzX2F2aXZvKF9fYmUzMiB2ZW5kb3Is
IF9fYmUzMiBkZXZpY2UpDQo+Pj4+ICtzdGF0aWMgYm9vbCBpc19hdml2byhfX2JlMzIgdmVu
ZG9yX2lkLCBfX2JlMzIgZGV2aWNlX2lkKQ0KPj4+Pg0KPj4+PiAgICB7DQo+Pj4+DQo+Pj4+
ICsJdTMyIHZlbmRvciA9IChfX2ZvcmNlIHUzMil2ZW5kb3JfaWQ7DQo+Pj4+ICsJdTMyIGRl
dmljZSA9IChfX2ZvcmNlIHUzMilkZXZpY2VfaWQ7DQo+Pj4NCj4+PiBJIGRvbid0IGhhdmUg
bXVjaCBjb250ZXh0LCBidXQganVzdCBmcm9tIHJlYWRpbmcgdGhpcywgc2hvdWxkbid0IHRo
aXMgYmUNCj4+PiBiZTMyX3RvX2NwdSgpIGluc3RlYWQ/DQo+Pg0KPj4gSSBzaG91bGQgaGF2
ZSBleHBsYWluZWQgdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIFRoZSB2YWx1ZXMgYXJl
DQo+PiBzdXBwb3NlZCB0byBiZSBpbiBiaWcgZW5kaWFuLiBXZSBjb21wYXJlIHRvIFBDSSBp
ZHMuIFRoZSBjb2RlIG9yaWdpbmFsbHkNCj4+IHdhcyB0YWtlbiBmcm9tIFsxXSwgd2hpY2gg
ZG9lcyB0aGUgcmlnaHQgdGhpbmcuIFRoZSBuZXh0IHZlcnNpb24gd2lsbA0KPj4gYWRkIHRo
aXMgaW5mbyB0byB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+
PiBUaG9tYXMNCj4+DQo+PiBbMV0NCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjAuNS9zb3VyY2UvZHJpdmVycy92aWRlby9mYmRldi9vZmZiLmMjTDMNCj4+IDU3
DQo+IA0KPiBUaGFua3MgZm9yIHRoZSBsaW5rLiBUaGUgY29tbWl0IG1lc3NhZ2UgZm9yIHRo
YXQgb3JpZ2luYWwgY2hhbmdlIFsyXSBpbmRpY2F0ZXMNCj4gdGhpcyB3YXMgYSBmaXggb24g
YSBQb3dlcnN0YXRpb24gd2hpY2ggaGFwcGVucyB0byBiZSBhIFBvd2VyUEMgYWthIGJpZy1l
bmRpYW4uDQo+IFRoaXMgdGhpcyBoYXBwZW5zIHRvIHdvcmsgYXMgaW50ZW5kZWQsIGJ1dCBu
b3Qgb24gbGl0dGxlLWVuZGlhbiBtYWNoaW5lcy4NCj4gdmVuZG9yX2lkIGlzIF9fYmUzMiAo
YmlnLWVuZGlhbikgYW5kIHlvdSBjb21wYXJlIHRoaXMgdG8gUENJX1ZFTkRPUl9JRF9BVEkN
Cj4gKDB4MTAwMikgd2hpY2ggaXMgbmF0aXZlLWVuZGlhbi4gSSBndWVzcyB5b3Ugc2VlIHRo
ZSBwcm9ibGVtLg0KPiBTZWUgYWxzbyBbM10gd2hlcmUgYSBwcm9wZXJ0eSBpcyBjb252ZXJ0
ZWQgcHJvcGVybHkuDQo+IA0KPiBUaGlua2luZyBhYm91dCBpdCwgaW5zdGVhZCBvZiBjYWxs
aW5nICdpc19hdml2bygqdmVuZG9yX3AsICpkZXZpY2VfcCknDQo+IEknZCBwcmVmZXIgc29t
ZXRoaW5nIGxpa2UgJ2lzX2F2aXZvKGJlMzJfdG9fY3B1cCh2ZW5kb3JfcCksDQo+IGJlMzJf
dG9fY3B1cChkZXZpY2VfcCkpJywgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBwYXNzIF9fYmUz
MiBhcm91bmQuDQoNCk1ha2VzIHNlbnNlLiBUaGFua3MgZm9yIHJldmlld2luZy4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBBbGV4YW5kZXIN
Cj4gDQo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvDQo+IGNvbW1pdC8/aWQ9NTdhMjBkOGZiMGQyYTA1
YWJlNDBhYmQ2YmIyOWUzZjkyMzcyMWYxYg0KPiBbM10gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuMC41L3NvdXJjZS9kcml2ZXJzL2J1cy9mc2wtbWMvZnNsLW1jLWJ1
cy5jI0wxMDI3DQo+IA0KPj4+IEJlc3QgcmVnYXJkcywNCj4+PiBBbGV4YW5kZXINCj4+Pg0K
Pj4+PiArDQo+Pj4+DQo+Pj4+ICAgIAkvKiBUaGlzIHdpbGwgbWF0Y2ggbW9zdCBSNXh4ICov
DQo+Pj4+ICAgIAlyZXR1cm4gKHZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0FUSSkgJiYNCj4+
Pj4gICAgCQ0KPj4+PiAgICAJICAgICAgICgoZGV2aWNlID49IFBDSV9WRU5ET1JfSURfQVRJ
X1I1MjAgJiYgZGV2aWNlIDwgMHg3ODAwKSB8fA0KPiANCj4gDQo+IA0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------OQOWqSC0nQM23wiRmdZJf2tD--

--------------h1KAnm0yR0xoyQdHgpbVMAzm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNbfeYFAwAAAAAACgkQlh/E3EQov+DN
1Q//ZxXpDhk1MxwcfQo14JkQHSNMlIT3ImM8BouxAPHcNqsrDxlUDPq3GyldyWt8DpvkelNaJOhr
b3W6JvuVIssUjVhMZ7OzUh0rx0Bsqe6OulvJpoKHHyY4018ZyZgNNlVG4huXJDs0aNhsnQn9yots
xDwsv1XXxnUwT+BEg7Mn8jQ2UM1ACZ4Ka57wln77eGuL4GvPbbUXkt8JFkkGIypYuknFcwzBzhsO
Gq6o/orkYpu9PyecxzXDQM7OozxXOBexEylOvSuOlqQrA0MxPxBOAxP22Fr9ZfmaRrG3ipYZpoX8
F/JSkri5vDJbGZ+OuLDcO1MoR0KDPU5UM2TeGsNYKEgPtXhOpAqwdAqvswWvPCb2QCNVJ5UHg/Jn
NpjsM3izOjXOJ1tSPhcf2dVJhH9AykccVM2MWous4IXCTg4IGxJfGu5YzYq/G80v+nLO8ffXgN4s
LO4m5Vwrp1s5wdOfD+iW5verOo0UB9IRRxjRgIBAOXWPTpM9Bt0ata1khCsjyxL9WkyAvYJejsPa
VqsfhlvGpFr92XpcKDuVOEdwQTAQe+qNhgbT3gewBhgOPDbimMZvS5eRTVnB+HuoeslvW5PYQrWc
2EgnnXYz9p/qsRrOkAT81k2MJMjanjeZJ/tWF+IEnw9L2iuVHYxDZ6+ANTcDzEiBef6tqMSuT1if
ujk=
=qvXW
-----END PGP SIGNATURE-----

--------------h1KAnm0yR0xoyQdHgpbVMAzm--
