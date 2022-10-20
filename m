Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51738605A94
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB1710E54A;
	Thu, 20 Oct 2022 09:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676810E540
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:06:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 202351F8BD;
 Thu, 20 Oct 2022 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666256801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhBS7hOWcDoOxGfLTg0ldAbSb8WIrdGlJ8SAnzdCsi0=;
 b=X2gRYCi8XyejmPPtKhjUNRqKjhP1dtIO8crJ0TBg3nliCaqjATmDresKPRapx1OlOrR+Lk
 yuiFooyU7jzKti3lfE6bFTBGPJChtfyb0qp7Fktm46wH70T6b6VXLF+2Ods1m/pG9a9nN+
 17qEJ55YNJ9N5VLvh5EPlMjtzcEh4F0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666256801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhBS7hOWcDoOxGfLTg0ldAbSb8WIrdGlJ8SAnzdCsi0=;
 b=Bt3JY0dR7jdxjpwIsWzhgIysQCMMNgwa5vw3aIVGLjOZR9Kg3Z6vhl8Dsg9XXbL8mGgGhF
 n3ZIf0eqGMXJ+6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0166213494;
 Thu, 20 Oct 2022 09:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x/7cOqAPUWMYMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 09:06:40 +0000
Message-ID: <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
Date: Thu, 20 Oct 2022 11:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221020034131.491973-1-zack@kde.org>
 <20221020034131.491973-14-zack@kde.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221020034131.491973-14-zack@kde.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YzZLyD0BWNtuP7qC4oGpU4Xr"
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YzZLyD0BWNtuP7qC4oGpU4Xr
Content-Type: multipart/mixed; boundary="------------JPsr4suoglZfBtmRVtodcFv2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Message-ID: <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
Subject: Re: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
References: <20221020034131.491973-1-zack@kde.org>
 <20221020034131.491973-14-zack@kde.org>
In-Reply-To: <20221020034131.491973-14-zack@kde.org>

--------------JPsr4suoglZfBtmRVtodcFv2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWmFjaw0KDQpBbSAyMC4xMC4yMiB1bSAwNTo0MSBzY2hyaWViIFphY2sgUnVzaW46DQo+
IEZyb206IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQpbLi4uXQ0KPiBAQCAtMTY3
MCw2ICsxNjQwLDEwIEBAIHN0YXRpYyBpbnQgdm13X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAgIAlpZiAocmV0KQ0K
PiAgIAkJZ290byBvdXRfdW5sb2FkOw0KPiAgIA0KPiArCXZtd19maWZvX3Jlc291cmNlX2lu
Yyh2bXcpOw0KPiArCXZtd19zdmdhX2VuYWJsZSh2bXcpOw0KPiArCWRybV9mYmRldl9nZW5l
cmljX3NldHVwKCZ2bXctPmRybSwgIHZtdy0+YXNzdW1lXzE2YnBwID8gMTYgOiAzMik7DQoN
ClRoZSBwcmVmZXJyZWQgd2F5IG9mIHNldHRpbmcgdGhlIGNvbG9yIGRlcHRoIGlzIHdpdGgg
c3RydWN0IA0KZHJtX21vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aC4gWzFdIE5vdGUgdGhh
dCBpdCBpcyB0aGUgY29sb3IgZGVwdGg7IA0Kbm90IHRoZSBwaXhlbCBzaXplLiBJbiB5b3Vy
IGNhc2U6DQoNCmlmICh2bXctPmFzc3VtZV8xNmJwcCkNCglkZXYtPm1vZGVfY29uZmlnLnBy
ZWZlcnJlZF9kZXB0aCA9IDE2Ow0KZWxzZQ0KCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVk
X2RlcHRoID0gMjQ7DQoNCkl0J3MgYWxzbyBhIGhpbnQgdG8gdXNlcnNwYWNlLiBbMl0NCg0K
VGhlIHByZWZlcl9icHAgcGFyYW1ldGVyIG9mIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkg
c2hvdWxkIGJlIDAuIEl0IGlzIA0KYSBmYWxsYmFjayB0byBmb3JjZSBhIGNlcnRhaW4gcGl4
ZWwgc2l6ZSwgYXMgcHJlZmVycmVkX2RlcHRoIGZhaWxzLg0KDQpbMV0gDQpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni4xLXJjMS9zb3VyY2UvaW5jbHVkZS9kcm0vZHJt
X21vZGVfY29uZmlnLmgjTDg4Mw0KWzJdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMS1yYzEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyNMMjcy
DQoNCj4gKw0KPiAgIAl2bXdfZGVidWdmc19nZW1faW5pdCh2bXcpOw0KPiAgIAl2bXdfZGVi
dWdmc19yZXNvdXJjZV9tYW5hZ2Vyc19pbml0KHZtdyk7DQo+ICAgDQpbLi4uXQ0KPiAtDQo+
IC0vKioNCj4gLSAqIHZtd19mYl9kaXJ0eV9mbHVzaCAtIGZsdXNoIGRpcnR5IHJlZ2lvbnMg
dG8gdGhlIGttcyBmcmFtZWJ1ZmZlcg0KPiAtICoNCj4gLSAqIEB3b3JrOiBUaGUgc3RydWN0
IHdvcmtfc3RydWN0IGFzc29jaWF0ZWQgd2l0aCB0aGlzIHRhc2suDQo+IC0gKg0KPiAtICog
VGhpcyBmdW5jdGlvbiBmbHVzaGVzIHRoZSBkaXJ0eSByZWdpb25zIG9mIHRoZSB2bWFsbG9j
IGZyYW1lYnVmZmVyIHRvIHRoZQ0KPiAtICoga21zIGZyYW1lYnVmZmVyLCBhbmQgaWYgdGhl
IGttcyBmcmFtZWJ1ZmZlciBpcyB2aXNpYmxlLCBhbHNvIHVwZGF0ZWQgdGhlDQo+IC0gKiBj
b3JyZXNwb25kaW5nIGRpc3BsYXlzLiBOb3RlIHRoYXQgdGhpcyBmdW5jdGlvbiBydW5zIGV2
ZW4gaWYgdGhlIGttcw0KPiAtICogZnJhbWVidWZmZXIgaXMgbm90IGJvdW5kIHRvIGEgY3J0
YyBhbmQgdGh1cyBub3QgdmlzaWJsZSwgYnV0IGl0J3MgdHVybmVkDQo+IC0gKiBvZmYgZHVy
aW5nIGhpYmVybmF0aW9uIHVzaW5nIHRoZSBwYXItPmRpcnR5LmFjdGl2ZSBib29sLg0KPiAt
ICovDQo+IC1zdGF0aWMgdm9pZCB2bXdfZmJfZGlydHlfZmx1c2goc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQ0KDQpUaGlzIGlzIHRoZSBmbHVzaCBmdW5jdGlvbiBmb3Igdm13Z2Z4JyBk
ZWZlcnJlZCBJL08uIElmIHlvdSB3YW50IHRvIA0KaW1wbGVtZW50IGRlZmVycmVkIEkvTyB3
aXRoIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiwgeW91IGhhdmUgdG8gc2V0IA0Kc3Ry
dWN0IGRybV9tb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93X2ZiZGV2IHRvIHRydWUuIFszXQ0K
DQpbM10gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xLXJjMS9zb3Vy
Y2UvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgjTDg5MA0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------JPsr4suoglZfBtmRVtodcFv2--

--------------YzZLyD0BWNtuP7qC4oGpU4Xr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNRD6AFAwAAAAAACgkQlh/E3EQov+Bf
4hAAtG8bcclPS7rxzczq+vWyafvjIFsjIlOu6BEOK/mzxN/OaT2D3AhjbLy7Aedzm6Yje4gJcKWb
bALcWE/WZRhvXxcgzRWKpE5hpwTd6FAArTqR2vtvHBzijnzqZZfqAVEdzK2F61UraLwJL7AMOrgS
U3+8OmU0C7Xq2gVWd5c+41kv0uGmc80qYMHN6OBhtLHQ66m5U/DO7e4zE0MZxy6VKUAyW/JP9Icq
byyt+u6u7P2BLGGME548MvoQI0CDgEe8D1PDPCNflDTu9Xvbn2/465xxd6ZXBb6gSgSvtg/JLPx4
8Su1cysMgthe4v5oPoSpksJ5MABwXd8PtfMc19un1VYsOopZF/E3Q8vS/6UiE5v52+zgsryZb9yZ
rbdaa9sNE1wXHKiUiBUhVdqD7m3yeWC5J+6btXPZh0NLqKz1397JG+pMI6vjFd4ubIC+PG3dbGQQ
KxFFbLJLv7Ea8JMrjO/DzcwoDbrTnvhO3bqcnJuTRcDggG92vODwe0Q9AP39L18rgWXvF4mcZD7v
b9sANvCqA4ennrsmf3yi9CJlbZapmNooCbWfCco1xr8QBktarn4qMdwiimX9V8NQmlPdPQlImZA6
r1q4ve0iO94BOG0xfgQ5diSuaevlsc4Y8XzOLrOFBf6Mu72wcooKI4esd8RqD7kA1lykWOCTyI12
JQs=
=aUBN
-----END PGP SIGNATURE-----

--------------YzZLyD0BWNtuP7qC4oGpU4Xr--
