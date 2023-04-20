Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4529E6E8AEF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB0210EB86;
	Thu, 20 Apr 2023 07:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBBD10EB76
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:09:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A754921A02;
 Thu, 20 Apr 2023 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681974561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g7PEASouucR8lmJyIoRFJDXMLm7lyANi4CRdrHkuzLU=;
 b=TvbKm/78kC/GPD5SPCtfKG4/kINB4iClfVNCBpPkdHz0LkmsRFpo2A4Mgl1bRXkHq1iNgT
 PVHivTmlQeqa9uFON13PJW1KWdf8tjTXTqxgryFX+wFsVt2OcgIDkk/iGJGb3nPf60nHj+
 tKMbZ7l933rKhsqnZf2YG0MhAWzL92Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681974561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g7PEASouucR8lmJyIoRFJDXMLm7lyANi4CRdrHkuzLU=;
 b=1a2dOGXMGpaL8/Nw/4cA7ISuvdAnUgObcmI1+PHG0jfA3+wbaefmPa+sItFbY76ZIkukr+
 iKf1p70TKYbQgwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E36113584;
 Thu, 20 Apr 2023 07:09:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e8bqHSHlQGSGQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 07:09:21 +0000
Message-ID: <e716d245-8aae-5ecc-1304-e8f753b16c55@suse.de>
Date: Thu, 20 Apr 2023 09:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
Content-Language: en-US
To: Patrick McLean <chutzpah@gentoo.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
References: <20230418225757.1361301-1-chutzpah@gentoo.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230418225757.1361301-1-chutzpah@gentoo.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wHqiJap4Z9oPBUe6Q3BcuFku"
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
--------------wHqiJap4Z9oPBUe6Q3BcuFku
Content-Type: multipart/mixed; boundary="------------cO3tBNtltCyOuuw8mP0oWYbC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrick McLean <chutzpah@gentoo.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
Message-ID: <e716d245-8aae-5ecc-1304-e8f753b16c55@suse.de>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
References: <20230418225757.1361301-1-chutzpah@gentoo.org>
In-Reply-To: <20230418225757.1361301-1-chutzpah@gentoo.org>

--------------cO3tBNtltCyOuuw8mP0oWYbC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjA0LjIzIHVtIDAwOjU3IHNjaHJpZWIgUGF0cmljayBNY0xlYW46DQo+IEN1
cnJlbnRseSB0aGUgQVNQRUVEIFBDSSB2ZW5kb3IgSUQgaXMgZGVmaW5lZCBpbg0KPiBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYywgbW92ZSB0aGF0IHRvIGluY2x1ZGUvbGludXgv
cGNpX2lkcy5oDQo+IHdpdGggYWxsIHRoZSByZXN0IG9mIHRoZSBQQ0kgdmVuZG9yIElEIGRl
ZmluaXRpb25zLiBSZW5hbWUgdGhlIGRlZmluaXRpb24NCj4gdG8gZm9sbG93IHRoZSBmb3Jt
YXQgdGhhdCB0aGUgb3RoZXIgZGVmaW5pdGlvbnMgZm9sbG93Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUGF0cmljayBNY0xlYW4gPGNodXR6cGFoQGdlbnRvby5vcmc+DQoNClJldmlld2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyB8IDQgKy0tLQ0KPiAgIGluY2x1
ZGUvbGludXgvcGNpX2lkcy5oICAgICAgIHwgMiArKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
ZHJ2LmMNCj4gaW5kZXggZDc4ODUyYzdjZjViLi4yMzJlNzk3NzkzYjYgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2Rydi5jDQo+IEBAIC03MCwxMiArNzAsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZHJpdmVyIGFzdF9kcml2ZXIgPSB7DQo+ICAgICogUENJIGRyaXZlcg0K
PiAgICAqLw0KPiAgIA0KPiAtI2RlZmluZSBQQ0lfVkVORE9SX0FTUEVFRCAweDFhMDMNCj4g
LQ0KPiAgICNkZWZpbmUgQVNUX1ZHQV9ERVZJQ0UoaWQsIGluZm8pIHsJCVwNCj4gICAJLmNs
YXNzID0gUENJX0JBU0VfQ0xBU1NfRElTUExBWSA8PCAxNiwJXA0KPiAgIAkuY2xhc3NfbWFz
ayA9IDB4ZmYwMDAwLAkJCVwNCj4gLQkudmVuZG9yID0gUENJX1ZFTkRPUl9BU1BFRUQsCQkJ
XA0KPiArCS52ZW5kb3IgPSBQQ0lfVkVORE9SX0lEX0FTUEVFRCwJCQlcDQo+ICAgCS5kZXZp
Y2UgPSBpZCwJCQkJXA0KPiAgIAkuc3VidmVuZG9yID0gUENJX0FOWV9JRCwJCVwNCj4gICAJ
LnN1YmRldmljZSA9IFBDSV9BTllfSUQsCQlcDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3BjaV9pZHMuaCBiL2luY2x1ZGUvbGludXgvcGNpX2lkcy5oDQo+IGluZGV4IDQ1YzNk
NjJlNjE2ZC4uNDBlMDRlODhjYTVhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Bj
aV9pZHMuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L3BjaV9pZHMuaA0KPiBAQCAtMjU1Myw2
ICsyNTUzLDggQEANCj4gICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfTkVUUk9OT01FX05GUDM4
MDBfVkYJMHgzODAzDQo+ICAgI2RlZmluZSBQQ0lfREVWSUNFX0lEX05FVFJPTk9NRV9ORlA2
MDAwX1ZGCTB4NjAwMw0KPiAgIA0KPiArI2RlZmluZSBQQ0lfVkVORE9SX0lEX0FTUEVFRAkJ
MHgxYTAzDQo+ICsNCj4gICAjZGVmaW5lIFBDSV9WRU5ET1JfSURfUU1JCQkweDFhMzINCj4g
ICANCj4gICAjZGVmaW5lIFBDSV9WRU5ET1JfSURfQVpXQVZFCQkweDFhM2INCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------cO3tBNtltCyOuuw8mP0oWYbC--

--------------wHqiJap4Z9oPBUe6Q3BcuFku
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA5SEFAwAAAAAACgkQlh/E3EQov+Bs
LQ//UxYth6q5sg0WbbQlG2RdG7PCp9c5q0RiYTghI10qc/OKdz/N85mDUYckfD+tEcsaH5XPQVXY
kZLLFfDFaiU/2m0PQClkEKnTcMRJZNahmZOgwaBuP0kmmkTDsbwzpILpjDLXX/D0JfanlOgmZ9az
J+uEx37nHr0jK+ee7ELvcC06CsLRMsdG9ux7YFyubbFOnp54VUrMErU8Uth/G4C6o/ALufl+Mb3Z
ly27DD5fnvkJ18+zz9uGU1jkb7Lb43XsEDF7nADUMmZTeCd49zmTKtCzghk+2hzfl4e3Pr4GKI36
Se+xuhfbM8zGw3pHwqsWoSGl4Cb16qnOa8WDTKLaToQrmviDRKPvwPsvusHDVvp37y799U7Y7dTI
mWZVf0wsZnSo7nw4qNrQqohd0e/vbw/ZifsNd7CAYUrTtKqBPsnlS4ALB2Mx+nmQCG1zvzDjW0u/
EWtcCfMuGsvzmnc0qpscecr9OS1kEauwJpO3uAs4TeMfZ7ECAWcp+y7wTFW0a2fHxoVyxRuCNsyI
d9ln7CZp8ELiFSkHh8xhQSIuLL/mEsmraPbasCJrUIEECaYJMkYb77vc6100UdiWTG715GJrDNC6
ewUMWs6VfxfX8eebNq/Xg3+fgqAq2/WyTO7BR3qsIRLvk3XnOIzUHCoMXM1/PQIIDEToBSTbPS7l
EF8=
=RQjA
-----END PGP SIGNATURE-----

--------------wHqiJap4Z9oPBUe6Q3BcuFku--
