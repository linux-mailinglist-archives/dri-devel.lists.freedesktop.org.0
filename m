Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA13F60C56A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E0E10E124;
	Tue, 25 Oct 2022 07:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5CC10E124
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 07:36:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 075A61FD94;
 Tue, 25 Oct 2022 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666683418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NXIbC7MfPyAwURI7JcmJLHDt3e++5nBr95st0yu/FvY=;
 b=FsZsTIq680Nn79kFMtP04VWYyR0g7iSpRdNVggtEBAGJozcTl8bJAn35lpk3Dt+eHTlW5G
 qY6nj3mtw1ofv7ZhS38MB+Q9r/X70eqPCwo/Z5IQTlIbdNL9Vb2s388Ra62+EYmWAVFj2z
 FoEjl3IX7IR1R9FJiIqlGDcZi7+IEIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666683418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NXIbC7MfPyAwURI7JcmJLHDt3e++5nBr95st0yu/FvY=;
 b=kCtOzcL/+zE0lBs1j4Ubq/3x8D/oeTNF6rwvBr/8CsXpuxzv6FlXqyUfoUWSBOttc2kxPU
 DnJUe87lgolUO7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8DFD13A64;
 Tue, 25 Oct 2022 07:36:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I+FINxmSV2OAAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 07:36:57 +0000
Message-ID: <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>
Date: Tue, 25 Oct 2022 09:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: ast: resolutions that require single-buffering (due to VRAM
 limitations) are unavailable
Content-Language: en-US
To: Jeremy Rand <jeremyrand@danwin1210.de>, dri-devel@lists.freedesktop.org
References: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------riugWP1X7M2gLClOKoHm2BTe"
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
--------------riugWP1X7M2gLClOKoHm2BTe
Content-Type: multipart/mixed; boundary="------------DW6Jj7jb97by94IE6dUV0Kye";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jeremy Rand <jeremyrand@danwin1210.de>, dri-devel@lists.freedesktop.org
Message-ID: <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>
Subject: Re: ast: resolutions that require single-buffering (due to VRAM
 limitations) are unavailable
References: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>
In-Reply-To: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>

--------------DW6Jj7jb97by94IE6dUV0Kye
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTAuMjIgdW0gMDk6MTIgc2NocmllYiBKZXJlbXkgUmFuZDoNCj4gSGkg
ZHJpLWRldmVsLA0KPiANCj4gSSBoYXZlIHR3byBtYWNoaW5lcyB3aXRoIEFTUEVFRCBHUFUn
cyAoYXN0IExpbnV4IGRyaXZlcikuwqAgT25lIG1hY2hpbmUgDQo+IGlzIHg4Nl82NCwgcnVu
bmluZyBhbiBBU1JvY2sgUmFjayBUb21teSA5MC1TQzAyUDEtMDBVQk5aIEdQVSAoQVNUMjUx
MCANCj4gY2hpcHNldCkgd2l0aCBLREUgUGxhc21hIFdheWxhbmQ7IHRoZSBvdGhlciBpcyBw
cGM2NGxlLCBydW5uaW5nIGFuIA0KPiBpbnRlZ3JhdGVkIEFTVDI1MDAgR1BVIHdpdGggS0RF
IFBsYXNtYSBYMTEuwqAgQm90aCB0aGUgQVNUMjUxMCBhbmQgDQo+IEFTVDI1MDAgaGF2ZSAx
NiBNaUIgVlJBTSBhY2NvcmRpbmcgdG8gbHNwY2kuwqAgQm90aCBBU1BFRUQgR1BVJ3MgYXJl
IA0KPiBhZHZlcnRpc2VkIGFzIHN1cHBvcnRpbmcgdXAgdG8gMTkyMHgxMjAwIHJlc29sdXRp
b24sIGJ1dCBLREUgb25seSANCj4gZGV0ZWN0cyBhIG1heGltdW0gcmVzb2x1dGlvbiBvZiAx
OTIweDEwODAuDQo+IA0KPiBTb21lIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gYWJvdXQgdGhp
cyBidWcgY2FuIGJlIGZvdW5kIGF0IA0KPiBodHRwczovL2ZvcnVtcy5yYXB0b3Jjcy5jb20v
aW5kZXgucGhwL3RvcGljLDMxLjAuaHRtbCAuDQo+IA0KPiBJIGJlbGlldmUgdGhpcyBpcyBh
IExpbnV4IGJ1ZywgYmVjYXVzZSBpdCBpcyBzb2xlbHkgZGVwZW5kZW50IG9uIHRoZSANCj4g
TGludXggdmVyc2lvbi7CoCBUaGUgZm9sbG93aW5nIExpbnV4IHZlcnNpb25zIGFyZSBjb25m
aXJtZWQgdG8gaGF2ZSB0aGUgYnVnOg0KPiANCj4gRGViaWFuOg0KPiA1LjYuMC0xIChwcGM2
NGVsKQ0KPiBGZWRvcmE6DQo+IDUuNi4wLTEuZmMzMy54ODZfNjQNCj4gNS42LjAtMS5mYzMz
LnBwYzY0bGUNCj4gNS4xNy41LTMwMC5mYzM2Lng4Nl82NA0KPiA1LjE4LjYtMjAwLmZjMzYu
cHBjNjRsZQ0KPiA2LjEuMC0wLnJjMC4yMDIyMTAwN2dpdDRjODYxMTQxOTRlNi41LmZjMzgu
cHBjNjRsZQ0KPiANCj4gV2hlcmVhcyB0aGUgZm9sbG93aW5nIExpbnV4IHZlcnNpb25zIGFy
ZSBjb25maXJtZWQgdG8gd29yayBmaW5lIChtYXggDQo+IHJlc29sdXRpb24gZGV0ZWN0ZWQg
YnkgS0RFIGlzIDE5MjB4MTIwMCBhcyBpdCBzaG91bGQgYmUsIGFuZCB0aGF0IA0KPiByZXNv
bHV0aW9uIHdvcmtzIGZpbmUgd2hlbiBzZWxlY3RlZCk6DQo+IA0KPiBEZWJpYW46DQo+IDUu
NS4wLTIgKHBwYzY0ZWwpDQo+IEZlZG9yYToNCj4gNS41LjE3LTIwMC5mYzMxLng4Nl82NA0K
PiA1LjUuMTctMjAwLmZjMzEucHBjNjRsZQ0KPiANCj4gSSBiZWxpZXZlIHRoZSBidWcgd2Fz
IGludHJvZHVjZWQgYnkgTGludXggY29tbWl0IA0KPiA5MjUzZjgzMGM5MTY2YmZhNmNjMDdk
NWVkNTllMTc0ZTlkNWVjNmNhLCB3aGljaCBhZGRzIGEgVlJBTSBzaXplIGNoZWNrIA0KPiB0
aGF0IGFzc3VtZXMgZG91YmxlLWJ1ZmZlcmluZy7CoCAxOTIweDEwODAgcmVzb2x1dGlvbiBh
dCA0IGJ5dGVzIHBlciANCj4gcGl4ZWwgd2l0aCAyIGJ1ZmZlcnMgaXMgMTYuNiBNQiwgd2hp
bGUgYnVtcGluZyB0aGF0IHRvIDE5MjB4MTIwMCByZXN1bHRzIA0KPiBpbiAxOC40IE1CLsKg
IFNpbmNlIHRoZSBWUkFNIHNpemUgaXMgMTYgTWlCID09IDE2LjggTUIsIHRoYXQgZXhwbGFp
bnMgdGhlIA0KPiBpc3N1ZS4NCg0KVGhhbmtzIGZvciByZXBvcnRpbmcuIEl0J3MgYmVlbiBh
IGtub3duIGlzc3VlIGZvciBhIHdoaWxlLg0KDQpCdXQgaW4gdGhlIG1vc3QgcmVjZW50IGRl
dmVsIHRyZWUsIHdlIGhhdmUgcmVwbGFjZWQgYXN0IG1lbW9yeSANCm1hbmFnZW1lbnQsIHNv
IHRoYXQgaXQgY2FuIG5vdyB1c2UgdGhlIGZ1bGwgdnJhbSBzaXplIGZvciBzY2Fub3V0IA0K
YnVmZmVycy4gU2VlDQoNCiANCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2Ry
bS10aXAvY29tbWl0L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYz9pZD1mMmZhNWE5
OWNhODFjZTEwNTY1MzllODNjNzA1ZjNkNmJlYzYyZTMxDQoNClRvIHRlc3QsIGdldCB0aGUg
bGF0ZXN0IGRybS10aXAgZnJvbQ0KDQogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9kcm0vZHJtLXRpcA0KDQphbmQgdHJ5IG9uIHlvdXIgbWFjaGluZS4NCg0KVGhlIHVwZGF0
ZWQgZHJpdmVyIHNob3VsZCBiZWNvbWUgYXZhaWxhYmxlIGluIExpbnV4IHY2LjMuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFN0ZXBzIHRvIHJlcHJvZHVjZToNCj4gDQo+
ICogQWRkIGEgR1BVIHRoYXQgdXNlcyB0aGUgYXN0IGRyaXZlciwgd2hpY2ggc3VwcG9ydHMg
MTkyMHgxMjAwIA0KPiByZXNvbHV0aW9uIGFuZCBoYXMgMTYgTWlCIFZSQU0uDQo+ICogQm9v
dCBpbnRvIEtERS4NCj4gKiBHbyB0byBLREUgU3lzdGVtIFNldHRpbmdzIC0+IERpc3BsYXkg
YW5kIE1vbml0b3IgLT4gRGlzcGxheSANCj4gQ29uZmlndXJhdGlvbi4NCj4gKiBMb29rIGF0
IGxpc3Qgb2YgZGV0ZWN0ZWQgcmVzb2x1dGlvbnMuDQo+ICogS0RFIHdpbGwgb25seSBkZXRl
Y3QgdXAgdG8gMTkyMHgxMDgwIHJlc29sdXRpb24uDQo+IA0KPiBJJ20gYXR0YWNoaW5nIHRo
ZSBvdXRwdXQgb2YgImpvdXJuYWxjdGwgLS1uby1ob3N0bmFtZSAtayIsIGFsdGhvdWdoIEkn
bSANCj4gZG91YnRmdWwgdGhhdCBhbnl0aGluZyB1c2VmdWwgaXMgaW4gdGhlIGxvZy4NCj4g
DQo+IEkgcmVwb3J0ZWQgdGhpcyBidWcgdG8gRmVkb3JhIGF0IA0KPiBodHRwczovL2J1Z3pp
bGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIxMzY5NTAgLCBhbmQgd2FzIGRpcmVj
dGVkIA0KPiB0byB0aGlzIG1haWxpbmcgbGlzdC4NCj4gDQo+IEhhcHB5IHRvIHByb3ZpZGUg
bW9yZSBkZXRhaWxzIG9uIHJlcXVlc3QuwqAgKEknbSBub3Qgc3Vic2NyaWJlZCB0byB0aGlz
IA0KPiBsaXN0LCBzbyBwbGVhc2UgQ0MgYW55IHJlcGxpZXMgdG8gbWUuKQ0KPiANCj4gQ2hl
ZXJzLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------DW6Jj7jb97by94IE6dUV0Kye--

--------------riugWP1X7M2gLClOKoHm2BTe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNXkhkFAwAAAAAACgkQlh/E3EQov+C5
cBAAv/cw/uvphNSVBVpX5MzrLNTT9+4RQFLS7poQb5C1F5P96QXgyNBGjNAhVk0J3HnsuACMyqHI
NRu4JwBSmlJTOMiOQBXqe/flM0i0C8KvzvGb6xgl/bVAU07GNwVquuf2NwwswNWJTFk5lV0AsQ/p
i+JwnIlxfxfjpGtfPJVSjhZcJ8zFFQ74Gkd9XTi+9A5ctr1jcktLm9qjpOrgWgBljuTPsSHPesb1
5r86sSmrrdpJwpVjMSYD9JIgIS7m5rR04wC7LF6lH5ehowpNKhqF3AlALfKh8uhYxPTFDs4D3MLg
OIhviJfwECT066pT3Sj96F5N2f1pxuF+xz+OaJVmYp2fzwWyV56586TxLQ7l1tKl1vk0NGOVRS/s
d1WgVeanZEQpm3/jZCiObOmGDmin0wSr858ZCbzrdgm0cnY17Xb9pA0bRTs/JZfm9j0LiQ+kNyk1
5xfocg4Ldnmn2/ADJiWml9QO5fD7hfaAFmJg4gFWKb6Jc/frHsURopsTGPGR5B/V6cgVYOPatYOl
2drs5/wRzGo641RmDPY6gjMWnf1YAy7O7qWIOCueCqTCkoEWdR5YtFuOHJkZ/bk+9QyBc6B9E5pF
WrYlBzaueJO5cs6XLCYBH9j6J5yGzN7k7aE8daPvOyMWzYPtf2chlt1kMCuq/qlwONl1FvBkJ15L
xO0=
=rCWd
-----END PGP SIGNATURE-----

--------------riugWP1X7M2gLClOKoHm2BTe--
