Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FB65CE1C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 09:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCE410E439;
	Wed,  4 Jan 2023 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D71510E438
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 08:14:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9809838D82;
 Wed,  4 Jan 2023 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672820045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPuYbLl9KV623eXQfgBgV4+FncB9NOLbNjS/NEin68A=;
 b=IzeltI+QmSYLQvCryst+DSBFjdPj84ZZYo2t84+HxWvxodvvLwmhxznzTV+2kx64V6FXN9
 K/3VM/3OPgv/rEvcmKl0kUl8MaY1Kq6tGZM8tGghqd+Mryvd6uPhbRAD7t984TE4HOZ6R2
 M9fd5VOwMvgqmC6kuaU//YF5CwM8tYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672820045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPuYbLl9KV623eXQfgBgV4+FncB9NOLbNjS/NEin68A=;
 b=f5kylmOlkTJGqFva7UDhDq2GkyU74zDBRPljsHrzcgAKW2frCfkUQoI7ypuKmiQPmctqea
 XcwT040ZkwuEDwAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66E18133D1;
 Wed,  4 Jan 2023 08:14:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0W/gF001tWMQEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jan 2023 08:14:05 +0000
Message-ID: <afb68161-1f16-41ec-1883-7e79c201e9b6@suse.de>
Date: Wed, 4 Jan 2023 09:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9ctT6mFME7EFM4UJu2cwvaTO"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9ctT6mFME7EFM4UJu2cwvaTO
Content-Type: multipart/mixed; boundary="------------pfgEiApxe2pAPDTRz6WrJk6x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <afb68161-1f16-41ec-1883-7e79c201e9b6@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>
In-Reply-To: <cd5c3f0e-eec1-c492-24af-a0b3efad7e2e@igalia.com>

--------------pfgEiApxe2pAPDTRz6WrJk6x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KVGhhbmtzIGZvciByZXBvcnRpbmcgdGhlIHByb2JsZW0uDQoNCkFtIDAzLjAxLjIz
IHVtIDIyOjE4IHNjaHJpZWIgTWHDrXJhIENhbmFsOg0KPiBIaSBUaG9tYXMsDQo+IA0KPiBP
biAxLzIvMjMgMDg6MjksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gRml4IHRoZSBj
b2xvci1mb3JtYXQgc2VsZWN0aW9uIG9mIHRoZSBzaW5nbGUtcHJvYmUgaGVscGVyLiBHbw0K
Pj4gdGhyb3VnaCBhbGwgdXNlci1zcGVjaWZpZWQgdmFsdWVzIGFuZCB0ZXN0IGVhY2ggZm9y
IGNvbXBhdGliaWxpdHkNCj4+IHdpdGggdGhlIGRyaXZlci4gSWYgbm9uZSBpcyBzdXBwb3J0
ZWQsIHVzZSB0aGUgZHJpdmVyLXByb3ZpZGVkDQo+PiBkZWZhdWx0LiBUaGlzIGd1YXJhbnRl
ZXMgdGhhdCB0aGUgY29uc29sZSBpcyBhbHdheXMgYXZhaWxhYmxlIGluDQo+PiBhbnkgY29s
b3IgZm9ybWF0IGF0IGxlYXN0Lg0KPj4NCj4+IFVudGlsIG5vdywgdGhlIGZvcm1hdCBzZWxl
Y3Rpb24gb2YgdGhlIHNpbmdsZS1wcm9iZSBoZWxwZXIgdHJpZWQNCj4+IHRvIGVpdGhlciB1
c2UgYSB1c2VyLXNwZWNpZmllZCBmb3JtYXQgb3IgYSAzMi1iaXQgZGVmYXVsdCBmb3JtYXQu
DQo+PiBJZiB0aGUgdXNlci1zcGVjaWZpZWQgZm9ybWF0IHdhcyBub3Qgc3VwcG9ydGVkIGJ5
IHRoZSBkcml2ZXIsIHRoZQ0KPj4gc2VsZWN0aW9uIGZhaWxlZCBhbmQgdGhlIGRpc3BsYXkg
cmVtYWluZWQgYmxhbmsuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4gDQo+IEkgc3Rh
cnRlZCB0byBnZXQgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIHRoZSBSYXNwYmVycnkgUGkg
NCBNb2RlbCBCDQo+IChhcm02NC9kZWZjb25maWcpIHVzaW5nIGRybS1taXNjLW5leHQ6DQo+
IA0KPiBbwqDCoMKgIDQuMzc2MzE3XSBbZHJtXSBJbml0aWFsaXplZCB2YzQgMC4wLjAgMjAx
NDA2MTYgZm9yIGdwdSBvbiBtaW5vciAwDQo+IFvCoMKgwqAgNC40MzM1ODddIHZjNC1kcm0g
Z3B1OiBbZHJtXSBicHAvZGVwdGggdmFsdWUgb2YgMTYvMjQgbm90IHN1cHBvcnRlZA0KPiBb
wqDCoMKgIDQuNDMzNjE3XSB2YzQtZHJtIGdwdTogW2RybV0gYnBwL2RlcHRoIHZhbHVlIG9m
IDE2LzI0IG5vdCBzdXBwb3J0ZWQNCj4gW8KgwqDCoCA0LjQzMzYyOV0gdmM0LWRybSBncHU6
IFtkcm1dIGJwcC9kZXB0aCB2YWx1ZSBvZiAxNi8yNCBub3Qgc3VwcG9ydGVkDQo+IFvCoMKg
wqAgNC40MzM2NDBdIHZjNC1kcm0gZ3B1OiBbZHJtXSBicHAvZGVwdGggdmFsdWUgb2YgMTYv
MjQgbm90IHN1cHBvcnRlZA0KPiBbwqDCoMKgIDQuNDMzNjUwXSB2YzQtZHJtIGdwdTogW2Ry
bV0gYnBwL2RlcHRoIHZhbHVlIG9mIDE2LzI0IG5vdCBzdXBwb3J0ZWQNCj4gW8KgwqDCoCA0
LjQzMzY1OF0gdmM0LWRybSBncHU6IFtkcm1dIE5vIGNvbXBhdGlibGUgZm9ybWF0IGZvdW5k
DQo+IFvCoMKgwqAgNC40MzM4NTRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLQ0KPiBbwqDCoMKgIDQuNDMzODYxXSBXQVJOSU5HOiBDUFU6IDIgUElEOiA2NiBhdCAN
Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYzoxNjA0IA0KPiBfX2RybV9hdG9taWNf
aGVscGVyX3NldF9jb25maWcrMHgyZTgvMHgzMTQgW2RybV0NCj4gW8KgwqDCoCA0LjQzNDE3
Ml0gTW9kdWxlcyBsaW5rZWQgaW46IGJ0YmNtKCspIGNyY3QxMGRpZl9jZSANCj4gcmVzZXRf
cmFzcGJlcnJ5cGkgY2xrX3Jhc3BiZXJyeXBpIHJhc3BiZXJyeXBpX2h3bW9uIGJsdWV0b290
aCANCj4gZWNkaF9nZW5lcmljIGVjYw0KPiBwd21fYmNtMjgzNSBicm9hZGNvbSByZmtpbGwg
aXByb2Nfcm5nMjAwIGJjbV9waHlfbGliIGkyY19iY20yODM1IHZjNCANCj4gcm5nX2NvcmUg
c25kX3NvY19oZG1pX2NvZGVjIGJjbTI3MTFfdGhlcm1hbCBjZWMgZHJtX2Rpc3BsYXlfaGVs
cGVyDQo+IHYzZCBwY2llX2JyY21zdGIgZHJtX2RtYV9oZWxwZXIgZ3B1X3NjaGVkIGdlbmV0
IGRybV9zaG1lbV9oZWxwZXIgDQo+IG52bWVtX3JtZW0gbWRpb19iY21fdW5pbWFjIGRybV9r
bXNfaGVscGVyIGRybSBmdXNlIGlwX3RhYmxlcyB4X3RhYmxlcw0KPiBpcHY2DQo+IFvCoMKg
wqAgNC40MzQzMjJdIENQVTogMiBQSUQ6IDY2IENvbW06IGt3b3JrZXIvdTg6MiBOb3QgdGFp
bnRlZCANCj4gNi4xLjAtcmM2LTAwMDExLWczN2M5MGQ1ODlkYzAgIzI5DQo+IFvCoMKgwqAg
NC40MzQzMzddIEhhcmR3YXJlIG5hbWU6IFJhc3BiZXJyeSBQaSA0IE1vZGVsIEIgUmV2IDEu
NCAoRFQpDQo+IFvCoMKgwqAgNC40MzQzNDVdIFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91bmQg
ZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jDQo+IFvCoMKgwqAgNC40MzQzNzZdIHBzdGF0ZTog
ODAwMDAwMDUgKE56Y3YgZGFpZiAtUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTIA0KPiBCVFlQ
RT0tLSkNCj4gW8KgwqDCoCA0LjQzNDM5MF0gcGMgOiBfX2RybV9hdG9taWNfaGVscGVyX3Nl
dF9jb25maWcrMHgyZTgvMHgzMTQgW2RybV0NCj4gW8KgwqDCoCA0LjQzNDY2OF0gbHIgOiBf
X2RybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcrMHg2NC8weDMxNCBbZHJtXQ0KPiBbwqDC
oMKgIDQuNDM0OTQzXSBzcCA6IGZmZmY4MDAwMDgyYzM4NDANCj4gW8KgwqDCoCA0LjQzNDk0
OV0geDI5OiBmZmZmODAwMDA4MmMzODUwIHgyODogZmZmZjJkNmQ0NDhlMTJjMCB4Mjc6IA0K
PiAwMDAwMDAwMDAwMDAwMDAxDQo+IFvCoMKgwqAgNC40MzQ5NzJdIHgyNjogMDAwMDAwMDAw
MDAwMDAzOCB4MjU6IGZmZmYyZDZkNDQ4ZTEyYzAgeDI0OiANCj4gZmZmZjJkNmQ0MDFhMDY5
MA0KPiBbwqDCoMKgIDQuNDM0OTkxXSB4MjM6IGZmZmYyZDZkNDFmNzQwODAgeDIyOiBmZmZm
MmQ2ZDQwZDhhNDAwIHgyMTogDQo+IGZmZmYyZDZkNDMzZmNjMDANCj4gW8KgwqDCoCA0LjQz
NTAwOV0geDIwOiBmZmZmMmQ2ZDQwMWEwNjkwIHgxOTogZmZmZjJkNmQ0NGI4ZTE4MCB4MTg6
IA0KPiAwMDAwMDAwMDAwMDAwMDIwDQo+IFvCoMKgwqAgNC40MzUwMjddIHgxNzogMDAwMDAw
MDAwMDAwMDAxMCB4MTY6IGZmZmZhNjc1N2JlZTUyZDAgeDE1OiANCj4gMDAwMDAwMDAwMDAw
MDAwMA0KPiBbwqDCoMKgIDQuNDM1MDQ0XSB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAgeDEzOiAw
MDAwMDAwMDAwMDAwMDAwIHgxMjogDQo+IDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgwqDCoCA0
LjQzNTA2M10geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogZmZmZjJkNmQ0MzI0MDgwMCB4
OSA6IA0KPiBmZmZmMmQ2ZDQ0YjhlMjAwDQo+IFvCoMKgwqAgNC40MzUwODFdIHg4IDogMDAw
MDAwMDAwMDAwMDAwMCB4NyA6IGZmZmYyZDZkNDRiOGUxODAgeDYgOiANCj4gZmZmZjJkNmQ0
MGQ4YTQwMA0KPiBbwqDCoMKgIDQuNDM1MDk5XSB4NSA6IGZmZmYyZDZkNDVlN2NhODAgeDQg
OiAwMDAwMDAwMDAwMDAwMDUwIHgzIDogDQo+IGZmZmZhNjc1NDk4YzNiYWQNCj4gW8KgwqDC
oCA0LjQzNTExNl0geDIgOiAwMDAwMDAwMDAwMDAwMDA0IHgxIDogZmZmZjJkNmQ0MzIzZjA4
MCB4MCA6IA0KPiBmZmZmMmQ2ZDQzM2ZjYzAwDQo+IFvCoMKgwqAgNC40MzUxMzZdIENhbGwg
dHJhY2U6DQo+IFvCoMKgwqAgNC40MzUxNDNdwqAgX19kcm1fYXRvbWljX2hlbHBlcl9zZXRf
Y29uZmlnKzB4MmU4LzB4MzE0IFtkcm1dDQo+IFvCoMKgwqAgNC40MzU0NDBdwqAgZHJtX2Ns
aWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMrMHgxNDAvMHgyNDQgW2RybV0NCj4gW8KgwqDC
oCA0LjQzNTcyM13CoCBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2xvY2tlZCsweDUwLzB4
MTY4IFtkcm1dDQo+IFvCoMKgwqAgNC40MzYwMDFdwqAgZHJtX2NsaWVudF9tb2Rlc2V0X2Nv
bW1pdCsweDJjLzB4NTQgW2RybV0NCj4gW8KgwqDCoCA0LjQzNjI3M13CoCBfX2RybV9mYl9o
ZWxwZXJfaW5pdGlhbF9jb25maWdfYW5kX3VubG9jaysweDU0OC8weDVhMCANCj4gW2RybV9r
bXNfaGVscGVyXQ0KPiBbwqDCoMKgIDQuNDM2NDA3XcKgIGRybV9mYl9oZWxwZXJfaW5pdGlh
bF9jb25maWcrMHgzOC8weDUwIFtkcm1fa21zX2hlbHBlcl0NCj4gW8KgwqDCoCA0LjQzNjUy
OF3CoCBkcm1fZmJkZXZfY2xpZW50X2hvdHBsdWcrMHhhOC8weDEyMCBbZHJtX2ttc19oZWxw
ZXJdDQo+IFvCoMKgwqAgNC40MzY2NDhdwqAgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXArMHg4
MC8weDE1MCBbZHJtX2ttc19oZWxwZXJdDQo+IFvCoMKgwqAgNC40MzY3NjhdwqAgdmM0X2Ry
bV9iaW5kKzB4MWYwLzB4MjJjIFt2YzRdDQo+IFvCoMKgwqAgNC40MzY5MjhdwqAgdHJ5X3Rv
X2JyaW5nX3VwX2FnZ3JlZ2F0ZV9kZXZpY2UrMHgxNjgvMHgxYjQNCj4gW8KgwqDCoCA0LjQz
Njk1OF3CoCBfX2NvbXBvbmVudF9hZGQrMHhiYy8weDE1Yw0KPiBbwqDCoMKgIDQuNDM2OTc0
XcKgIGNvbXBvbmVudF9hZGQrMHgxNC8weDIwDQo+IFvCoMKgwqAgNC40MzY5OTBdwqAgdmM0
X2hkbWlfZGV2X3Byb2JlKzB4MWMvMHgyOCBbdmM0XQ0KPiBbwqDCoMKgIDQuNDM3MTQ2XcKg
IHBsYXRmb3JtX3Byb2JlKzB4YTgvMHhkMA0KPiBbwqDCoMKgIDQuNDM3MTU4XcKgIHJlYWxs
eV9wcm9iZSsweDEzMC8weDJmNA0KPiBbwqDCoMKgIDQuNDM3MTc0XcKgIF9fZHJpdmVyX3By
b2JlX2RldmljZSsweGI0LzB4ZTANCj4gW8KgwqDCoCA0LjQzNzE4OV3CoCBkcml2ZXJfcHJv
YmVfZGV2aWNlKzB4M2MvMHgxZjgNCj4gW8KgwqDCoCA0LjQzNzIwMl3CoCBfX2RldmljZV9h
dHRhY2hfZHJpdmVyKzB4MTE4LzB4MTQwDQo+IFvCoMKgwqAgNC40MzcyMTddwqAgYnVzX2Zv
cl9lYWNoX2RydisweDg0LzB4ZDANCj4gW8KgwqDCoCA0LjQzNzIyOV3CoCBfX2RldmljZV9h
dHRhY2grMHhkMC8weDE5Yw0KPiBbwqDCoMKgIDQuNDM3MjQzXcKgIGRldmljZV9pbml0aWFs
X3Byb2JlKzB4MTQvMHgyMA0KPiBbwqDCoMKgIDQuNDM3MjU2XcKgIGJ1c19wcm9iZV9kZXZp
Y2UrMHgzNC8weDk4DQo+IFvCoMKgwqAgNC40MzcyNjhdwqAgZGVmZXJyZWRfcHJvYmVfd29y
a19mdW5jKzB4ODgvMHhjNA0KPiBbwqDCoMKgIDQuNDM3MjgyXcKgIHByb2Nlc3Nfb25lX3dv
cmsrMHgxY2MvMHgyYzgNCj4gW8KgwqDCoCA0LjQzNzI5NV3CoCB3b3JrZXJfdGhyZWFkKzB4
MjQ4LzB4NDU4DQo+IFvCoMKgwqAgNC40MzczMDRdwqAga3RocmVhZCsweGVjLzB4MTk4DQo+
IFvCoMKgwqAgNC40MzczMTldwqAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjANCj4gW8KgwqDC
oCA0LjQzNzMzM10gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IA0K
PiBBZnRlciBiaXNlY3RpbmcgdGhlIHByb2JsZW0sIEkgd2FzIGFibGUgdG8gZGV0ZWN0IHRo
YXQgdGhlIHdhcm5pbmcgDQo+IHN0YXJ0ZWQgdG8NCj4gYXBwZWFyIG9uIHRoZSBjb21taXQg
MzdjOTBkNTg5ZGMwICgiZHJtL2ZiLWhlbHBlcjogRml4IHNpbmdsZS1wcm9iZSANCj4gY29s
b3ItZm9ybWF0DQo+IHNlbGVjdGlvbiIpLg0KPiANCj4gRG8geW91IGhhdmUgYW55IGlkZWEg
b24gd2hhdCBtaWdodCBiZSBjYXVzaW5nIHRoaXMgd2FybmluZz8NCg0KdmM0IHdhbnRzIDE2
IGJpdHMgcGVyIHBpeGVsIGFuZCAyNC1iaXQgY29sb3IgZGVwdGggYXQgdGhlIHNhbWUgdGlt
ZS4gDQpUaGF0IG1ha2VzIG5vIHNlbnNlLg0KDQpEb2VzIGl0IHdvcmsgaWYgeW91IGNhbGwg
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSB3aXRoIDMyIGJwcCBhdCBbMV0/IA0KTGlrZSB0
aGlzOg0KDQogICBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkcm0sIDMyKQ0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4yLXJjMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMjTDM5MQ0K
DQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IC0gTWHDrXJhIENhbmFsDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------pfgEiApxe2pAPDTRz6WrJk6x--

--------------9ctT6mFME7EFM4UJu2cwvaTO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO1NUwFAwAAAAAACgkQlh/E3EQov+CU
NBAAm3VWmb6yJAHNR0AknWEbhrCvQtzVyPn3W4LfgHSImJD4Eb7s1BSRoey33wXIasyUIml6nQJJ
oIlw7Mo24BBnodU7998wDclJW36WKbkkXc4BJTt/CJ/61m48xlpTsC0fsSVbs3QAJekSRdGDQOAI
gz0otjzGoYLYlQOh/Y6og8fduEMAK1RHOAGCLzd3vSGH8fr5XOPl9tyPl+LasSmNIuTxMa88TbiG
z43uDyciKE8r/UYHrPEptkTLewJZTNVxbKgchliiIuClN3oxjL05fY71+OI8nS86cmm30s0G1531
yEkgRfUSeebDV3BDezAwKxKpjG6wxpwIStqUgcnx4pN01CFflY89Jhp7ZLlymGxuSW2XyrDUn09M
hhVQH7Q9ZSkUhDcCSJcNcoH2NfqBDquNwGUjyIB2naSR/8JZi+OCO1kuFL3gVLAyVX11hq+6aghl
afrG5ZHaJHs4Fj47XlwqqxwOdjY4GhuV71WrWIlnZ0ycpP0uRkkUp6fnLgc8b0lLMpxjrf0UPmf+
7vqtGokUIkPb4Hw7PqAdJ75sIGZylzO4JtagQgEnkjULzPQLh48mAnySm9Z78KS1sVXBDKlKZ/F3
C0spLMGxyIgVrTWiiI77ccRye2tJ4wghlH8GnixJv/kuABdJdyJJsqJPX9r7woeLuWHiTtmbucKq
2Tk=
=YEpd
-----END PGP SIGNATURE-----

--------------9ctT6mFME7EFM4UJu2cwvaTO--
