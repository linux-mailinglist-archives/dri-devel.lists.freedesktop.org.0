Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE06E8AE8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C3610EB6C;
	Thu, 20 Apr 2023 07:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D610EB6C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:08:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B87A219FF;
 Thu, 20 Apr 2023 07:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681974529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAo92SChtpAtmwD4nIEYzdLyQzJp7T4ZS5sE2ZhYXUA=;
 b=NVk/VoYJRP5Pf0cGjX+k9KaXoyztcvLH+bGJcwj17zpRm/xhf5n1Vi9w5ftP/EY/4BEIGO
 Yl7CyQsZwl9STqRn/MvSzDPHpmMYSn0LNH/AytrKgb6jY2T3UJ/kURskWb3HVzQvtWYIB/
 hTWBG2CmRzlifmRa2tXZQX9E6lLBhr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681974529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAo92SChtpAtmwD4nIEYzdLyQzJp7T4ZS5sE2ZhYXUA=;
 b=2m0BwtizZjWoABoSH7eDf9k8PqPoxwCeyd84t7EaFzpJJIOFObzHwoHdk0UVrCbcsG6H86
 AzN1AF59M+nBQNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EF7313584;
 Thu, 20 Apr 2023 07:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ufg2GgHlQGQqQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 07:08:49 +0000
Message-ID: <d65e2938-2910-2330-b9c2-082ab947015d@suse.de>
Date: Thu, 20 Apr 2023 09:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230419183704.GA216848@bhelgaas>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230419183704.GA216848@bhelgaas>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fBXlzMBH8ux1wzMknLGyNXwL"
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>, Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fBXlzMBH8ux1wzMknLGyNXwL
Content-Type: multipart/mixed; boundary="------------FZWKkLmBVR50DcV1BIp4JuCg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>, Patrick McLean <chutzpah@gentoo.org>
Message-ID: <d65e2938-2910-2330-b9c2-082ab947015d@suse.de>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
References: <20230419183704.GA216848@bhelgaas>
In-Reply-To: <20230419183704.GA216848@bhelgaas>

--------------FZWKkLmBVR50DcV1BIp4JuCg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjMgdW0gMjA6Mzcgc2NocmllYiBCam9ybiBIZWxnYWFzOg0KPiBP
biBXZWQsIEFwciAxOSwgMjAyMyBhdCAwOTowMDoxNUFNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEFtIDE5LjA0LjIzIHVtIDAwOjU3IHNjaHJpZWIgUGF0cmljayBN
Y0xlYW46DQo+Pj4gQ3VycmVudGx5IHRoZSBBU1BFRUQgUENJIHZlbmRvciBJRCBpcyBkZWZp
bmVkIGluDQo+Pj4gZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMsIG1vdmUgdGhhdCB0
byBpbmNsdWRlL2xpbnV4L3BjaV9pZHMuaA0KPj4+IHdpdGggYWxsIHRoZSByZXN0IG9mIHRo
ZSBQQ0kgdmVuZG9yIElEIGRlZmluaXRpb25zLiBSZW5hbWUgdGhlIGRlZmluaXRpb24NCj4+
PiB0byBmb2xsb3cgdGhlIGZvcm1hdCB0aGF0IHRoZSBvdGhlciBkZWZpbml0aW9ucyBmb2xs
b3cuDQo+Pg0KPj4gVGhhbmtzIGEgbG90LiBDYW4geW91IHBsZWFzZSBhbHNvIG1vdmUgYW5k
IHJlbmFtZSB0aGUgUENJIGRldmljZSBpZHM/IFsxXQ0KPiANCj4gR2VuZXJhbGx5IHdlIG1v
dmUgdGhpbmdzIHRvIHBjaV9pZHMuaCBvbmx5IHdoZW4gdGhleSBhcmUgc2hhcmVkDQo+IGJl
dHdlZW4gbXVsdGlwbGUgZHJpdmVycy4gIFRoaXMgaXMgbW9zdGx5IHRvIG1ha2UgYmFja3Bv
cnRzIGVhc2llci4NCj4gDQo+IFBDSV9WRU5ET1JfSURfQVNQRUVEIGlzIChvciB3aWxsIGJl
KSB1c2VkIGluIGJvdGggYXN0X2Rydi5jIGFuZA0KPiBsaWJhdGEtY29yZS5jLCBzbyBpdCBx
dWFsaWZpZXMuDQo+IA0KPiBJdCBkb2Vzbid0IGxvb2sgbGlrZSBQQ0lfQ0hJUF9BU1QyMDAw
IGFuZCBQQ0lfQ0hJUF9BU1QyMTAwIHdvdWxkDQo+IHF1YWxpZnkgc2luY2UgdGhleSdyZSBv
bmx5IHVzZWQgaW4gYXN0X2Rydi5jIGFuZCBhc3RfbWFpbi5jLCB3aGljaCBhcmUNCj4gcGFy
dCBvZiB0aGUgc2FtZSBkcml2ZXIuDQoNCk9rLCBJIHNlZS4gQ2FuIEkgdGFrZSB0aGUgcGF0
Y2ggaW50byBEUk0gdHJlZXM/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiBb
MV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMi9zb3VyY2UvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgjTDUyDQo+Pg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljayBNY0xlYW4gPGNodXR6cGFoQGdlbnRvby5vcmc+DQo+Pj4gLS0tDQo+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgfCA0ICstLS0NCj4+PiAgICBpbmNs
dWRlL2xpbnV4L3BjaV9pZHMuaCAgICAgICB8IDIgKysNCj4+PiAgICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2Rydi5jDQo+Pj4gaW5kZXggZDc4ODUyYzdjZjViLi4yMzJlNzk3NzkzYjYgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPj4+IEBAIC03MCwxMiArNzAsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIGFzdF9kcml2ZXIgPSB7DQo+Pj4g
ICAgICogUENJIGRyaXZlcg0KPj4+ICAgICAqLw0KPj4+IC0jZGVmaW5lIFBDSV9WRU5ET1Jf
QVNQRUVEIDB4MWEwMw0KPj4+IC0NCj4+PiAgICAjZGVmaW5lIEFTVF9WR0FfREVWSUNFKGlk
LCBpbmZvKSB7CQlcDQo+Pj4gICAgCS5jbGFzcyA9IFBDSV9CQVNFX0NMQVNTX0RJU1BMQVkg
PDwgMTYsCVwNCj4+PiAgICAJLmNsYXNzX21hc2sgPSAweGZmMDAwMCwJCQlcDQo+Pj4gLQku
dmVuZG9yID0gUENJX1ZFTkRPUl9BU1BFRUQsCQkJXA0KPj4+ICsJLnZlbmRvciA9IFBDSV9W
RU5ET1JfSURfQVNQRUVELAkJCVwNCj4+PiAgICAJLmRldmljZSA9IGlkLAkJCQlcDQo+Pj4g
ICAgCS5zdWJ2ZW5kb3IgPSBQQ0lfQU5ZX0lELAkJXA0KPj4+ICAgIAkuc3ViZGV2aWNlID0g
UENJX0FOWV9JRCwJCVwNCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2lfaWRz
LmggYi9pbmNsdWRlL2xpbnV4L3BjaV9pZHMuaA0KPj4+IGluZGV4IDQ1YzNkNjJlNjE2ZC4u
NDBlMDRlODhjYTVhIDEwMDY0NA0KPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvcGNpX2lkcy5o
DQo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9wY2lfaWRzLmgNCj4+PiBAQCAtMjU1Myw2ICsy
NTUzLDggQEANCj4+PiAgICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfTkVUUk9OT01FX05GUDM4
MDBfVkYJMHgzODAzDQo+Pj4gICAgI2RlZmluZSBQQ0lfREVWSUNFX0lEX05FVFJPTk9NRV9O
RlA2MDAwX1ZGCTB4NjAwMw0KPj4+ICsjZGVmaW5lIFBDSV9WRU5ET1JfSURfQVNQRUVECQkw
eDFhMDMNCj4+PiArDQo+Pj4gICAgI2RlZmluZSBQQ0lfVkVORE9SX0lEX1FNSQkJMHgxYTMy
DQo+Pj4gICAgI2RlZmluZSBQQ0lfVkVORE9SX0lEX0FaV0FWRQkJMHgxYTNiDQo+Pg0KPj4g
LS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------FZWKkLmBVR50DcV1BIp4JuCg--

--------------fBXlzMBH8ux1wzMknLGyNXwL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA5QAFAwAAAAAACgkQlh/E3EQov+Dp
WhAAwIpCUomyib680JTAXWMaE9ItcjEx2bb3MWlyX24cpcmOMqCU/bG7kl2t+HCQyMK/u8C4YR00
J3zYLO62H41KVeGzNEqnHLavRVsnB1beZ5G0je402Ql6bcklfc6dwfB3skxlk3yV1HSdER5sg0zL
LKRAOtsXAVKJMtk7/Ii8gwDrEQaimQsxSyotowK9UfwIqmR6PNWmgiX0MvfgIgcTwKz9OhgIZTiX
cphI7+GpVW0nz+Wxdsxj6bahj5ANBYGgccvnZoGNsQwaijf0qr1SqVuu4ODmFFs/67rvpTSJm8yF
jukJVJF00mSjbLfWj0I6+1/Ra6KBtorX39cdU7dx35udDSG93ZoIBjXiEm0sO2KOUDuho8CRTY2k
Q3TZd9tu33VHtypDcjsB+Sc9RG3tlLvn++FqGWhQ1VBhd73oXhdQv6RenuuDrst9HyYx3maDOGFT
RQvBaqKfKmOPIa42Ffvkl6N/YirxiH1YCE2vhAoUo+ckGFcILlbSJ/Z42rmR2bCalMlgjshv6sLj
4p635uY0Uz4dPCPKFGSxvDvsCT3tn2dlPgy6zk8zX24s5BYLpk5woCn12T0ISTkdKFZHL9KpkNnI
BP7zV0hYOrjknHBYGq0Apk9CUlb9fIum6PHn4PE9xtiPMp/S0Qyr322QbO5sFZoaUBj+jK1aI54f
MBI=
=pDQL
-----END PGP SIGNATURE-----

--------------fBXlzMBH8ux1wzMknLGyNXwL--
