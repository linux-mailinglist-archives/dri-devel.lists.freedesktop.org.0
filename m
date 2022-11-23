Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E076352F5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CEE10E51F;
	Wed, 23 Nov 2022 08:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2399B10E517
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:42:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0BF11F8AF;
 Wed, 23 Nov 2022 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669192918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIU8rB0jBxPdshXU3vQfGHebITOdy2BC9J0ZJyhHVhw=;
 b=fpeL45wJ1w0tROUmRaiKWTXJ83RNc4peu0UVzlXLGYkilraPp3MhSZWXhoprf6g0HlZ81v
 kF44fXYsS6lQHoC8vuMyUIUjccglpwZCgK1ga+MSHS3r0M9LNHPvQJ3pvIX9udXAPY8TGd
 yHsvQtR/wvgY3hwjiOGQcEB9f3tlcRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669192918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIU8rB0jBxPdshXU3vQfGHebITOdy2BC9J0ZJyhHVhw=;
 b=5x48guDJrIWu45HcQgwoWfecq7PNMVpHehfV08TAzDo93UohPMPjAHUiboy57Aoz+ly4/q
 b8FyZM3FTrxki3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92D1213A37;
 Wed, 23 Nov 2022 08:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aoW9ItbcfWPAeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 08:41:58 +0000
Message-ID: <d1a3302d-b0e3-f470-f2c0-c48f990701f2@suse.de>
Date: Wed, 23 Nov 2022 09:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>
References: <OS0PR01MB592225470AD263665B0E8647860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <OS0PR01MB592225470AD263665B0E8647860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YtdBwOD1MwLhXVusXGrhYRId"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YtdBwOD1MwLhXVusXGrhYRId
Content-Type: multipart/mixed; boundary="------------C0AxTP0fjJ0eEs6VraromRGQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <d1a3302d-b0e3-f470-f2c0-c48f990701f2@suse.de>
Subject: Re: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
References: <OS0PR01MB592225470AD263665B0E8647860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592225470AD263665B0E8647860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>

--------------C0AxTP0fjJ0eEs6VraromRGQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjIgdW0gMDk6Mjggc2NocmllYiBCaWp1IERhczoNCj4gSGkgQWxs
LA0KPiANCj4gVGhlIGJlbG93IHBhdGNoIGluIExpbnV4LW5leHQgMjAyMjExMjMgaXMgY2F1
c2luZyByZWdyZXNzaW9uIG9uIFJlbmVzYXMge1JaL0cyTSwgUi1DYXIgR2VuLTN9DQo+IFBs
YXRmb3Jtcy4NCj4gDQo+IFN0ZXBzIHRvIHJlcHJvZHVjZToNCj4gDQo+IFVzZSB0aGUgYXJt
NjQgZGVmY29uZmlnIHRvIGJ1aWxkIHRoZSBrZXJuZWwgYW5kIHRoZW4gYm9vdCB0aGUgYm9h
cmQuDQo+IA0KPiBJcyB0aGVyZSBhbnkgcGF0Y2ggdG8gZml4IHRoZSBwcm9ibGVtPyBJIGFt
IGhhcHB5IHRvIHRlc3QuDQoNCkEgcmV2ZXJ0IGlzIGFscmVhZHkgb24gdGhlIHdheS4gSXQg
c2hvdWxkIHJlYWNoIGxpbnV4LW5leHQgYnkgbmV4dCB3ZWVrLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBMb2dzOi0NCj4gDQo+IFsgICAyMy43NjI5OTldIENvbnNvbGU6
IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSAyNDB4NjcNCj4gWyAg
IDIzLjc2MzEyOF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFsg
ICAyMy43NjMxMzNdIFdBUk5JTkc6IENQVTogMyBQSUQ6IDI3OCBhdCBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJfZGVmaW8uYzozNDAgZmJfZGVmZXJyZWRfaW9fc2NoZWR1bGVfZmx1
c2grMHgzOC8weDQwDQo+IFsgICAyMy43NjMxNjRdIE1vZHVsZXMgbGlua2VkIGluOiBjZmc4
MDIxMSgrKSByY2FyX2R1X2RybSgrKSByY2FyX21pcGlfZHNpIHJjYXJfY21tIHJjYXJfbHZk
cyBzbmRfc29jX2hkbWlfY29kZWMgdnNwMSBkd19oZG1pX2NlYyBkd19oZG1pX2kyc19hdWRp
byByY2FyX2ZkcDEgdjRsMl9tZW0ybWVtIHZpZGVvYnVmMl92bWFsbG9jIHJjYXJfZHdfaGRt
aSB2aWRlb2J1ZjJfZG1hX2NvbnRpZyBkd19oZG1pIHZpZGVvYnVmMl9tZW1vcHMgaGNpX3Vh
cnQgdmlkZW9idWYyX3Y0bDIgY2VjIHZpZGVvYnVmMl9jb21tb24gY3JjdDEwZGlmX2NlIGJ0
cWNhIGRybV9kaXNwbGF5X2hlbHBlciBzbmRfc29jX2F1ZGlvX2dyYXBoX2NhcmQgZHJtX2Rt
YV9oZWxwZXIgdmlkZW9kZXYgc25kX3NvY19zaW1wbGVfY2FyZF91dGlscyBidGJjbSB3bGNv
cmVfc2RpbyBtYyByY2FyX2ZjcCBkaXNwbGF5X2Nvbm5lY3RvciBibHVldG9vdGggcmNhcl9j
YW4gZHJtX2ttc19oZWxwZXIgZWNkaF9nZW5lcmljIHJlbmVzYXNfdXNiMyBlY2Mgc25kX3Nv
Y19yY2FyIGRybSByZmtpbGwgY2FuX2RldiBwd21fcmNhciB1c2JfZG1hYyByZW5lc2FzX3Vz
YmhzIHBoeV9yY2FyX2dlbjNfdXNiMyBpcHY2DQo+IFsgICAyMy43NjMzMTRdIENQVTogMyBQ
SUQ6IDI3OCBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDYuMS4wLXJjNi1uZXh0
LTIwMjIxMTIzLTEwNDMyLWc3MzZiNmQ4MWQ5M2MgIzMxNA0KPiBbICAgMjMuNzYzMzIzXSBI
YXJkd2FyZSBuYW1lOiBIb3BlUnVuIEhpSG9wZSBSWi9HMk0gd2l0aCBzdWIgYm9hcmQgKERU
KQ0KPiBbICAgMjMuNzYzMzI5XSBwc3RhdGU6IDgwMDAwMDA1IChOemN2IGRhaWYgLVBBTiAt
VUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gWyAgIDIzLjc2MzMzN10gcGMgOiBm
Yl9kZWZlcnJlZF9pb19zY2hlZHVsZV9mbHVzaCsweDM4LzB4NDANCj4gWyAgIDIzLjc2MzM0
NF0gbHIgOiBkcm1fZmJfaGVscGVyX3N5c19pbWFnZWJsaXQrMHhhOC8weGM0IFtkcm1fa21z
X2hlbHBlcl0NCj4gWyAgIDIzLjc2MzQ3NF0gc3AgOiBmZmZmODAwMDBhYzViM2MwDQo+IFsg
ICAyMy43NjM0NzhdIHgyOTogZmZmZjgwMDAwYWM1YjNjMCB4Mjg6IDAwMDAwMDAwZmZmZmZm
ZmYgeDI3OiAwMDAwMDAwMDAwMDAwMDEwDQo+IFsgICAyMy43NjM0ODldIHgyNjogZmZmZjAw
MDVjMTM1NjAwMCB4MjU6IGZmZmYwMDA1YzNhODA4MDAgeDI0OiBmZmZmMDAwNWMwMjUyOGNj
DQo+IFsgICAyMy43NjM0OTldIHgyMzogMDAwMDAwMDAwMDAwMDAwMCB4MjI6IDAwMDAwMDAw
MDAwMDAxODAgeDIxOiAwMDAwMDAwMDAwMDAwMDA4DQo+IFsgICAyMy43NjM1MDldIHgyMDog
MDAwMDAwMDAwMDAwMDAxMCB4MTk6IGZmZmYwMDA1YzAyNTI4MDAgeDE4OiAwMDAwMDAwMDAw
MDAwMDAxDQo+IFsgICAyMy43NjM1MTldIHgxNzogMDAwMDAwMDAwMDAwMDAwNCB4MTY6IDAw
MDAwMDAwMDAwMDAwMDAgeDE1OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgICAyMy43NjM1Mjld
IHgxNDogMDAwMDAwMDAwMDAwMDAyMCB4MTM6IDAwMDAwMDAwMDAwMDAwMDAgeDEyOiAwMDAw
MDAwMDAwMDAwMDIwDQo+IFsgICAyMy43NjM1MzldIHgxMTogMDAwMDAwMDBmZmZmZmZmZiB4
MTA6IDAwMDAwMDAwMDAwMDAwMDEgeDkgOiAwMDAwMDAwMDAwMDAwMDAxDQo+IFsgICAyMy43
NjM1NDldIHg4IDogZmZmZjAwMDVjMTM1NjAxMCB4NyA6IDAwMDAwMDAwMDAwMDAwMDggeDYg
OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgICAyMy43NjM1NTldIHg1IDogMDAwMDAwMDAwMDAw
MDE5MCB4NCA6IDAwMDAwMDAwMDAwMDAxODAgeDMgOiAwMDAwMDAwMDAwMDAwMDA4DQo+IFsg
ICAyMy43NjM1NjldIHgyIDogMDAwMDAwMDAwMDAwMDAwMCB4MSA6IDAwMDAwMDAwMDAwMDAw
MDAgeDAgOiBmZmZmMDAwNWMzYTgwODAwDQo+IFsgICAyMy43NjM1ODBdIENhbGwgdHJhY2U6
DQo+IFsgICAyMy43NjM1ODVdICBmYl9kZWZlcnJlZF9pb19zY2hlZHVsZV9mbHVzaCsweDM4
LzB4NDANCj4gWyAgIDIzLjc2MzU5NF0gIGRybV9mYmRldl9mYl9pbWFnZWJsaXQrMHgzOC8w
eDcwIFtkcm1fa21zX2hlbHBlcl0NCj4gWyAgIDIzLjc2MzY3MV0gIHNvZnRfY3Vyc29yKzB4
MTVjLzB4MjAwDQo+IFsgICAyMy43NjM2ODBdICBiaXRfY3Vyc29yKzB4M2FjLzB4NTAwDQo+
IFsgICAyMy43NjM2ODddICBmYmNvbl9jdXJzb3IrMHhlYy8weDExYw0KPiBbICAgMjMuNzYz
Njk0XSAgaGlkZV9jdXJzb3IrMHgzYy8weGMwDQo+IFsgICAyMy43NjM3MDhdICByZWRyYXdf
c2NyZWVuKzB4MTI4LzB4MjQwDQo+IFsgICAyMy43NjM3MTddICBkb19iaW5kX2Nvbl9kcml2
ZXIuaXNyYS4wKzB4MmM4LzB4MzljDQo+IFsgICAyMy43NjM3MjZdICBkb190YWtlX292ZXJf
Y29uc29sZSsweDE0MC8weDIwMA0KPiBbICAgMjMuNzYzNzM2XSAgZG9fZmJjb25fdGFrZW92
ZXIrMHg2Yy8weGU0DQo+IFsgICAyMy43NjM3NDJdICBmYmNvbl9mYl9yZWdpc3RlcmVkKzB4
MWU0LzB4MWYwDQo+IFsgICAyMy43NjM3NDldICByZWdpc3Rlcl9mcmFtZWJ1ZmZlcisweDIx
NC8weDMxMA0KPiBbICAgMjMuNzYzNzYxXSAgX19kcm1fZmJfaGVscGVyX2luaXRpYWxfY29u
ZmlnX2FuZF91bmxvY2srMHgzM2MvMHg1MzQgW2RybV9rbXNfaGVscGVyXQ0KPiBbICAgMjMu
NzYzODM3XSAgZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZpZysweDRjLzB4NjAgW2RybV9r
bXNfaGVscGVyXQ0KPiBbICAgMjMuNzYzOTEyXSAgZHJtX2ZiZGV2X2NsaWVudF9ob3RwbHVn
KzB4YzQvMHgxNTAgW2RybV9rbXNfaGVscGVyXQ0KPiBbICAgMjMuNzYzOTg3XSAgZHJtX2Zi
ZGV2X2dlbmVyaWNfc2V0dXArMHg5MC8weDE1NCBbZHJtX2ttc19oZWxwZXJdDQo+IFsgICAy
My43NjQwNjFdICByY2FyX2R1X3Byb2JlKzB4MTU0LzB4MTg0IFtyY2FyX2R1X2RybV0NCj4g
WyAgIDIzLjc2NDEwM10gIHBsYXRmb3JtX3Byb2JlKzB4NjgvMHhlMA0KPiBbICAgMjMuNzY0
MTE1XSAgcmVhbGx5X3Byb2JlKzB4YmMvMHgyZTANCj4gWyAgIDIzLjc2NDEyMl0gIF9fZHJp
dmVyX3Byb2JlX2RldmljZSsweDc4LzB4ZTANCj4gWyAgIDIzLjc2NDEyOV0gIGRyaXZlcl9w
cm9iZV9kZXZpY2UrMHhkOC8weDE1Yw0KPiBbICAgMjMuNzY0MTM2XSAgX19kcml2ZXJfYXR0
YWNoKzB4OTQvMHgxOWMNCj4gWyAgIDIzLjc2NDE0M10gIGJ1c19mb3JfZWFjaF9kZXYrMHg3
MC8weGQwDQo+IFsgICAyMy43NjQxNDldICBkcml2ZXJfYXR0YWNoKzB4MjQvMHgzMA0KPiBb
ICAgMjMuNzY0MTU1XSAgYnVzX2FkZF9kcml2ZXIrMHgxNTQvMHgyMGMNCj4gWyAgIDIzLjc2
NDE2MV0gIGRyaXZlcl9yZWdpc3RlcisweDc4LzB4MTMwDQo+IFsgICAyMy43NjQxNjhdICBf
X3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDI4LzB4MzQNCj4gWyAgIDIzLjc2NDE3Nl0g
IHJjYXJfZHVfcGxhdGZvcm1fZHJpdmVyX2luaXQrMHgyMC8weDEwMDAgW3JjYXJfZHVfZHJt
XQ0KPiANCj4gQ2hlZXJzLA0KPiBCaWp1DQo+IA0KPj4gU3ViamVjdDogW1BBVENIIHYyIDUv
Nl0gZHJtL2ZiLWhlbHBlcjogU2NoZWR1bGUgZGVmZXJyZWQtSS9PIHdvcmtlciBhZnRlcg0K
Pj4gd3JpdGluZyB0byBmcmFtZWJ1ZmZlcg0KPiANCj4+IFNjaGVkdWxlIHRoZSBkZWZlcnJl
ZC1JL08gd29ya2VyIGluc3RlYWQgb2YgdGhlIGRhbWFnZSB3b3JrZXIgYWZ0ZXINCj4+IHdy
aXRpbmcgdG8gdGhlIGZiZGV2IGZyYW1lYnVmZmVyLiBUaGUgZGVmZXJyZWQtSS9PIHdvcmtl
ciB0aGVuIHBlcmZvcm1zDQo+PiB0aGUgZGlydHktZmIgdXBkYXRlLiBUaGUgZmJkZXYgZW11
bGF0aW9uIHdpbGwgaW5pdGlhbGl6ZSBkZWZlcnJlZCBJL08NCj4+IGZvciBhbGwgZHJpdmVy
cyB0aGF0IHJlcXVpcmUgZGFtYWdlIHVwZGF0ZXMuIEl0IGlzIHRoZXJlZm9yZSBhIHZhbGlk
DQo+PiBhc3N1bXB0aW9uIHRoYXQgdGhlIGRlZmVycmVkLUkvTyB3b3JrZXIgaXMgcHJlc2Vu
dC4NCj4gDQo+PiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBwZXJmb3JtIHRoZSBkYW1hZ2Ug
aGFuZGxpbmcgZGlyZWN0bHkgZnJvbSB3aXRoaW4NCj4+IHRoZSB3cml0ZSBvcGVyYXRpb24u
IEJ1dCBkb2luZyB0aGlzIGNvdWxkIGluY3JlYXNlIHRoZSBvdmVyaGVhZCBvZiB0aGUNCj4+
IHdyaXRlIG9yIGludGVyZmVyZSB3aXRoIGEgY29uY3VycmVudGx5IHNjaGVkdWxlZCBkZWZl
cnJlZC1JL08gd29ya2VyLg0KPj4gSW5zdGVhZCwgc2NoZWR1bGluZyB0aGUgZGVmZXJyZWQt
SS9PIHdvcmtlciB3aXRoIGl0cyByZWd1bGFyIGRlbGF5IG9mDQo+PiA1MCBtcyByZW1vdmVz
IGxvYWQgb2ZmIHRoZSB3cml0ZSBvcGVyYXRpb24gYW5kIGFsbG93cyB0aGUgZGVmZXJyZWQt
SS9PDQo+PiB3b3JrZXIgdG8gaGFuZGxlIG11bHRpcGxlIHdyaXRlIG9wZXJhdGlvbnMgdGhh
dCBhcnJpdmVkIGR1cmluZyB0aGUgZGVsYXkNCj4+IHRpbWUgd2luZG93Lg0KPiANCj4+IHYy
Og0KPj4gCSoga2VlcCBkcm1fZmJfaGVscGVyX2RhbWFnZSgpIChEYW5pZWwpDQo+PiAJKiB1
c2UgZmJfZGVmZXJyZWRfaW9fc2NoZWR1bGVfZmx1c2goKSAoRGFuaWVsKQ0KPj4gCSogY2xh
cmlmeSBjb21tZW50cyAoRGFuaWVsKQ0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gUmV2aWV3ZWQtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------C0AxTP0fjJ0eEs6VraromRGQ--

--------------YtdBwOD1MwLhXVusXGrhYRId
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN93NYFAwAAAAAACgkQlh/E3EQov+Dq
YQ//eImqx+UP5CaEzt43qbgFD9rVga1oKV3Ed70pbfOZOZPBJdWcjlo1sDHYMMN4Px8+eRsfNrHZ
VqcVYmZXgzfJHgt/y+lbhypvNLyVq2MGlOSqKy74P2LVPqSY4He150vLSlWENn/RedvpASKWcF48
no9Su7qLpPsKb7vb5WfbWxD5+ypJk/4h0QiYqrJkiNQ1BygrmgSXwB3S773qztzSkgqHHUN/cn/o
Bj76pC2G+JSC4XXFSK+FFex/HN/hynstNFIFj891AyqZgVjxwUt1PF/trGRP7D6Dvy4Cai8oDqCs
qR81eG11hNV7e0KmM5PN8MKrAoVZ24jX4nMkuw6/GOW6rCoDILA3v+yu4nhOnw6TxjfqfXNGYg1n
ltr1XIubp7qXaV4Lk/MLYUje83yJGKGVqbUr7lImWlkZ93YP4E7Pb/toPdZQqooTS87omr4iOW7u
fRbOg94b9nAU2XylDX/3BbSAT0eL64+S3ia5cSpRg4JIyOJgHuiHYV3LJa6nOf5NeUWu4cQsdDE/
KBhVa8D7A5EksKO4XBeCKNAK7L0ngPQxbCUgnG7E/IHPXS3898R62TLkTNuRbcykC6Hb8fU6hnQn
xRmbF7JAoNFONrJdQFMfi0RMuo6RtU4zwoYguJeYPo5q2zd2T1BCqrLkvSqOOxA4BBOK9kEPCpms
ah4=
=AAix
-----END PGP SIGNATURE-----

--------------YtdBwOD1MwLhXVusXGrhYRId--
