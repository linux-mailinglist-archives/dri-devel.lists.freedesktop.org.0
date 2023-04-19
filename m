Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DF6E7390
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 09:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C156410E0DD;
	Wed, 19 Apr 2023 07:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B329910E0DD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:00:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6D7321995;
 Wed, 19 Apr 2023 07:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681887616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7AMh0Vy8+mge4FMPgFWDkiVOxhZTDS02gYWTE0ERek=;
 b=Ovb71+vKpX0yX5+i17KXwoomZ/dksQsQRps11e9eAnDiQuxko5xF1OLpYtN82CuIxRN2rb
 NP/NUKq3Dv8q3cXeJzb26eyyWW2fBlzStp7KITgkb6yyvrrQGwfpXu83I3mhNvIBfL7uKM
 cvK0JJR3ZsSM1cgXYbijpxfoEMSYuA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681887616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7AMh0Vy8+mge4FMPgFWDkiVOxhZTDS02gYWTE0ERek=;
 b=5Zb3DOVuuiFvPTr7A0Mfy7Q/EFeOLj3XKekO3B4HU+TcPCFXtIeuucGQ54FZFpOM5anv5Y
 N8wXK7PWWrVzu6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB16713580;
 Wed, 19 Apr 2023 07:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vV2VLICRP2QCNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Apr 2023 07:00:16 +0000
Message-ID: <d1f776e1-8489-010f-a500-ba68b45ad3a3@suse.de>
Date: Wed, 19 Apr 2023 09:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
To: Patrick McLean <chutzpah@gentoo.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
References: <20230418225757.1361301-1-chutzpah@gentoo.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230418225757.1361301-1-chutzpah@gentoo.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yiGyTHHE3f7HA3tJQv9bFUol"
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
--------------yiGyTHHE3f7HA3tJQv9bFUol
Content-Type: multipart/mixed; boundary="------------GSzGH7HJn9u4SmAH6SDzErjs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrick McLean <chutzpah@gentoo.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
Message-ID: <d1f776e1-8489-010f-a500-ba68b45ad3a3@suse.de>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
References: <20230418225757.1361301-1-chutzpah@gentoo.org>
In-Reply-To: <20230418225757.1361301-1-chutzpah@gentoo.org>

--------------GSzGH7HJn9u4SmAH6SDzErjs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjMgdW0gMDA6NTcgc2NocmllYiBQYXRyaWNrIE1jTGVhbjoNCj4g
Q3VycmVudGx5IHRoZSBBU1BFRUQgUENJIHZlbmRvciBJRCBpcyBkZWZpbmVkIGluDQo+IGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jLCBtb3ZlIHRoYXQgdG8gaW5jbHVkZS9saW51
eC9wY2lfaWRzLmgNCj4gd2l0aCBhbGwgdGhlIHJlc3Qgb2YgdGhlIFBDSSB2ZW5kb3IgSUQg
ZGVmaW5pdGlvbnMuIFJlbmFtZSB0aGUgZGVmaW5pdGlvbg0KPiB0byBmb2xsb3cgdGhlIGZv
cm1hdCB0aGF0IHRoZSBvdGhlciBkZWZpbml0aW9ucyBmb2xsb3cuDQoNClRoYW5rcyBhIGxv
dC4gQ2FuIHlvdSBwbGVhc2UgYWxzbyBtb3ZlIGFuZCByZW5hbWUgdGhlIFBDSSBkZXZpY2Ug
aWRzPyBbMV0NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmgjTDUyDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgTWNMZWFuIDxj
aHV0enBhaEBnZW50b28ub3JnPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9kcnYuYyB8IDQgKy0tLQ0KPiAgIGluY2x1ZGUvbGludXgvcGNpX2lkcy5oICAgICAgIHwg
MiArKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gaW5kZXggZDc4ODUyYzdjZjVi
Li4yMzJlNzk3NzkzYjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IEBAIC03
MCwxMiArNzAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIGFzdF9kcml2
ZXIgPSB7DQo+ICAgICogUENJIGRyaXZlcg0KPiAgICAqLw0KPiAgIA0KPiAtI2RlZmluZSBQ
Q0lfVkVORE9SX0FTUEVFRCAweDFhMDMNCj4gLQ0KPiAgICNkZWZpbmUgQVNUX1ZHQV9ERVZJ
Q0UoaWQsIGluZm8pIHsJCVwNCj4gICAJLmNsYXNzID0gUENJX0JBU0VfQ0xBU1NfRElTUExB
WSA8PCAxNiwJXA0KPiAgIAkuY2xhc3NfbWFzayA9IDB4ZmYwMDAwLAkJCVwNCj4gLQkudmVu
ZG9yID0gUENJX1ZFTkRPUl9BU1BFRUQsCQkJXA0KPiArCS52ZW5kb3IgPSBQQ0lfVkVORE9S
X0lEX0FTUEVFRCwJCQlcDQo+ICAgCS5kZXZpY2UgPSBpZCwJCQkJXA0KPiAgIAkuc3VidmVu
ZG9yID0gUENJX0FOWV9JRCwJCVwNCj4gICAJLnN1YmRldmljZSA9IFBDSV9BTllfSUQsCQlc
DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BjaV9pZHMuaCBiL2luY2x1ZGUvbGlu
dXgvcGNpX2lkcy5oDQo+IGluZGV4IDQ1YzNkNjJlNjE2ZC4uNDBlMDRlODhjYTVhIDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BjaV9pZHMuaA0KPiArKysgYi9pbmNsdWRlL2xp
bnV4L3BjaV9pZHMuaA0KPiBAQCAtMjU1Myw2ICsyNTUzLDggQEANCj4gICAjZGVmaW5lIFBD
SV9ERVZJQ0VfSURfTkVUUk9OT01FX05GUDM4MDBfVkYJMHgzODAzDQo+ICAgI2RlZmluZSBQ
Q0lfREVWSUNFX0lEX05FVFJPTk9NRV9ORlA2MDAwX1ZGCTB4NjAwMw0KPiAgIA0KPiArI2Rl
ZmluZSBQQ0lfVkVORE9SX0lEX0FTUEVFRAkJMHgxYTAzDQo+ICsNCj4gICAjZGVmaW5lIFBD
SV9WRU5ET1JfSURfUU1JCQkweDFhMzINCj4gICANCj4gICAjZGVmaW5lIFBDSV9WRU5ET1Jf
SURfQVpXQVZFCQkweDFhM2INCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------GSzGH7HJn9u4SmAH6SDzErjs--

--------------yiGyTHHE3f7HA3tJQv9bFUol
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ/kX8FAwAAAAAACgkQlh/E3EQov+Dk
BA//YQZGku84kB7OcKWfdoQapEYRx80LUVIUj/B8t5KjzjLnrBnSdp9fY18Ck2Ygs8LH70k6MVEe
frNHW4xHCb/jrPmW5Z8STaKSW/6/0U3QjxEIa8d4+/+UAz/CiZ3RSbxtsm/5arDne6zIcQBCAlPE
bbcu527bkwTwpawvKPGb/RxVaNSTVcoS2o5N9PX0zwKlI9TbwwMtYmlGsIMWmssP++5Y/+00n4Nj
fieAsp0Hy9IilWFd4jxpYXvwwm3V7TwApvNg/W3Cn1905UFVRvdaaSlnMkLua9ILNOeTkEJiWA4u
hjJaQV7Vi+trJlDkNGjJqLx0XVqlZPvGj1j7QfHrknKRaMoFvBJBieTG3xbxIGuSq33RO8pErnQx
8ukdFaT/DmGNs9ZEcEWikihBM+qrZt9rAC6Id9U5mIvAYMM0ArYQur3EVQFfvCDDgOfyH5ZU13hu
fB4VmgP43dyWjG1M7eBFb/QeG7pmlHGkFdiO+gpChQBPXSfVpe6h235ERxpz+VxZWykc4mvGf0Ev
AspgwQt3WBS9ug0i3WCHHEI77cQmwGB9eLDgeAvjVVnLOMDPZYy2+xWMa8kU8MeHYxW6rCUuhj/O
q7VbJbVPEzTpl/Qgns9KvDPqmgyk0gIUDiWdtjVC7G75ucC+Dea4HyNaGnAOZk51f2wa8Niqa31Q
lZk=
=RGD0
-----END PGP SIGNATURE-----

--------------yiGyTHHE3f7HA3tJQv9bFUol--
