Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228E6D942E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61810EB56;
	Thu,  6 Apr 2023 10:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0610EB56
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 10:32:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74D1F22600;
 Thu,  6 Apr 2023 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680777143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G/HxR077xGPbYf4zYY1fUWRLYnVvMx7nM+IP9iYRd7c=;
 b=KLrxtdqZWCmWdqukx5ovNzCkcodHjsMc0QT70dusyPMIhCOErXYbDhsNQvEh9SgNdl3i4u
 5qhgtKvVbuPHKzh5PYEy+4W9ZOVRy8ey7abspT9HVgUS3XjnudET+YNbBqy9uf0ptvN6jK
 QdpNRqIshLZGPNGvJqjd+32tnia8AnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680777143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G/HxR077xGPbYf4zYY1fUWRLYnVvMx7nM+IP9iYRd7c=;
 b=83N6pCebzzlcQS7IZ4o3EpiLs2yqIcTlDTcwxuBxx2ilt480EyIamFOeuE45LPdHeVpNXt
 dknYljI7Luy9oQCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B8E6133E5;
 Thu,  6 Apr 2023 10:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5zl5EbefLmR+JwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 10:32:23 +0000
Message-ID: <6869588b-c382-fb27-2f25-c6e80038f5bc@suse.de>
Date: Thu, 6 Apr 2023 12:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, marius.vlad@collabora.com
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230405135145.305293-1-mcanal@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MIpkbZctRDJ0QC0fSDzTB6DJ"
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
Cc: mwen@igalia.com, melissa.srw@gmail.com, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MIpkbZctRDJ0QC0fSDzTB6DJ
Content-Type: multipart/mixed; boundary="------------EwHbM68hxqhhpAOSoKz0QyAE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 marius.vlad@collabora.com
Cc: mwen@igalia.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 igormtorrente@gmail.com
Message-ID: <6869588b-c382-fb27-2f25-c6e80038f5bc@suse.de>
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
In-Reply-To: <20230405135145.305293-1-mcanal@igalia.com>

--------------EwHbM68hxqhhpAOSoKz0QyAE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDQuMjMgdW0gMTU6NTEgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEhp
IE1hcml1cywNCj4gDQo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgY3JlYXRpbmcg
bXVsdGlwbGUgdmlydHVhbCBjb25uZWN0b3JzLCBpbg0KPj4gY2FzZSBvbmUgd291bGQgbmVl
ZCBpdC4gVXNlIG1vZHVsZSBwYXJhbWV0ZXJzIHRvIHNwZWNpZnkgaG93IG1hbnksDQo+PiBk
ZWZhdWx0aW5nIHRvIGp1c3Qgb25lLCBhbGxvY2F0aW5nIGZyb20gdGhlIHN0YXJ0LCBhIG1h
eGltdW0gb2YgNA0KPj4gcG9zc2libGUgb3V0cHV0cy4NCj4gDQo+IEkgZ290IGEgYml0IGNv
bmZ1c2VkIGJ5IHRoaXMgZGVzY3JpcHRpb24uIFRoZSBjb21taXQgbWVzc2FnZSBzYXlzIHRo
YXQgeW91DQo+IGFyZSBjcmVhdGluZyBtdWx0aXBsZSBjb25uZWN0b3JzLCBidXQgaXQgc2Vl
bXMgbGlrZSB5b3UgYXJlIGNyZWF0aW5nIG11bHRpcGxlDQo+IHBpcGVzLiBGcm9tIHdoYXQg
SSBjb3VsZCBzZWUsIGZvciBlYWNoIG5ldyBjb25uZWN0b3IgY3JlYXRlZCwgeW91IGFyZSBh
bHNvDQo+IGNyZWF0aW5nIGEgbmV3IENSVEMgYW5kIG5ldyBwbGFuZXMuDQo+IA0KPiBNb3Jl
b3ZlciwgaWYgeW91ciByZWFsIGludGVudGlvbiBpcyB0byBjcmVhdGUgbXVsdGlwbGUgcGlw
ZXMsIEkgYmVsaWV2ZSB0aGF0DQo+IHlvdSBkb24ndCByZWFsbHkgbmVlZCB0byBkdXBsaWNh
dGUgdGhlIHBsYW5lcyBhcyB3ZWxsLg0KDQpUZXJtaW5vbG9neSBjYW4gYmUgZnV6enksIGJ1
dCBhIHBpcGUgaXMgdHlwaWNhbGx5IGNvbnNpZGVyZWQgZXZlcnl0aGluZyANCmZyb20gcGxh
bmUgdG8gY29ubmVjdG9yLiBEZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlLCBzb21lIGNvbXBv
bmVudHMgY2FuIA0KYmUgcGFydCBvZiBtdWx0aXBsZSBwaXBlcyBvciBjaGFuZ2UgcGlwZXMs
IHRob3VnaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSSByYW4gdGhlIFZL
TVMgQ0kgWzFdIHdpdGggeW91ciBwYXRjaGVzIGFwcGxpZWQgYW5kLCBhbHRob3VnaCBtb3N0
IG9mIHRoZQ0KPiB0ZXN0cyBhcmUgbm93IHBhc3Npbmcgd2l0aCBtdWx0aXBsZSBwaXBlcywg
d2hpY2ggaXMgcmVhbGx5IG5pY2UsIHRoZSB0ZXN0DQo+IGttc193cml0ZWJhY2sgY3Jhc2hl
cyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6DQo+IA0KPiBbIDE5OTcuMjQ0MzQ3XSBbSUdU
XSBrbXNfd3JpdGViYWNrOiBzdGFydGluZyBzdWJ0ZXN0IHdyaXRlYmFjay1jaGVjay1vdXRw
dXQNCj4gWyAxOTk3LjI1MDY3M10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMTZjDQo+IFsgMTk5Ny4yNTA2OTFdICNQRjog
c3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0KPiBbIDE5OTcuMjUwNjkz
XSAjUEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UNCj4gWyAxOTk3
LjI1MDY5NF0gUEdEIDgwMDAwMDAwMWE4NzcwNjcgUDREIDgwMDAwMDAwMWE4NzcwNjcgUFVE
IDFhODcyMDY3IFBNRCAwDQo+IFsgMTk5Ny4yNTA2OTddIE9vcHM6IDAwMDAgWyMxXSBQUkVF
TVBUIFNNUCBQVEkNCj4gWyAxOTk3LjI1MDY5OV0gQ1BVOiAyIFBJRDogMzIyMyBDb21tOiBr
bXNfd3JpdGViYWNrIE5vdCB0YWludGVkIDYuMy4wLXJjNC1nOGMyYzI5YmExMjlmLWRpcnR5
ICMyNTcNCj4gWyAxOTk3LjI1MDcwMV0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQ
QyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS4xNi4yLTEuZmMzNyAwNC8wMS8yMDE0
DQo+IFsgMTk5Ny4yNTA3MDNdIFJJUDogMDAxMDpkcm1fdmJsYW5rX2dldCsweGEvMHhlMA0K
PiBbIDE5OTcuMjUwNzEwXSBDb2RlOiBhOSA2NiA2NiA2NiA2NiA2NiA2NiAyZSAwZiAxZiA4
NCAwMCAwMCAwMCAwMCAwMCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5
MCA5MCA5MCA5MCA1NSA0MSA1NyA0MSA1NiA0MSA1NSA0MSA1NCA1MyA8OGI+IDg3IDZjIDAx
IDAwIDAwIDQxIGJjIGVhIGZmIGZmIGZmIDg1IGMwIDc0IDc0IDg5IGY1IDQ4IDg5IGZiIDM5
DQo+IFsgMTk5Ny4yNTA3MTJdIFJTUDogMDAxODpmZmZmYjg0ZDQwN2EzYjA4IEVGTEFHUzog
MDAwMTAyMDINCj4gWyAxOTk3LjI1MDcxNF0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDog
ZmZmZmEyZWIwMmJmOGI3MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAxOTk3LjI1MDcx
OF0gUkRYOiBmZmZmYTJlYjE4MGQyNDIwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAw
MDAwMDAwMDAwMDAwMDANCj4gWyAxOTk3LjI1MDcxOV0gUkJQOiBmZmZmYTJlYjAyYmY5OWU4
IFIwODogMDAwMDAwMDAwMDAwMDAzNiBSMDk6IGZmZmZhMmViMDFkNjIwYzANCj4gWyAxOTk3
LjI1MDcyMF0gUjEwOiBmZmZmZTgyYjg0MDI3ZTQwIFIxMTogZmZmZmZmZmZjMDA0MjUyMCBS
MTI6IGZmZmZhMmViMDFjMDE5MDANCj4gWyAxOTk3LjI1MDcyMV0gUjEzOiBmZmZmYTJlYjAy
YmY5YjYwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6IGZmZmZhMmVhMWVjZDZiODANCj4g
WyAxOTk3LjI1MDcyMl0gRlM6ICAwMDAwN2Y3ZDQ0ZTg5YTgwKDAwMDApIEdTOmZmZmZhMmVi
M2JkMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbIDE5OTcuMjUwNzIz
XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+
IFsgMTk5Ny4yNTA3MjVdIENSMjogMDAwMDAwMDAwMDAwMDE2YyBDUjM6IDAwMDAwMDAwMWVj
MDIwMDAgQ1I0OiAwMDAwMDAwMDAwMDAwNmUwDQo+IFsgMTk5Ny4yNTA3MjhdIENhbGwgVHJh
Y2U6DQo+IFsgMTk5Ny4yNTA3MzVdICA8VEFTSz4NCj4gWyAxOTk3LjI1MDczNl0gIHZrbXNf
c2V0X2NvbXBvc2VyKzB4MTgvMHg2MCBbdmttc10NCj4gWyAxOTk3LjI1MDc0NV0gIHZrbXNf
d2JfYXRvbWljX2NvbW1pdCsweDkzLzB4MTUwIFt2a21zXQ0KPiBbIDE5OTcuMjUwNzQ5XSAg
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZW5hYmxlcysweDFkOS8weDI1MA0K
PiBbIDE5OTcuMjUwNzU0XSAgdmttc19hdG9taWNfY29tbWl0X3RhaWwrMHgzMy8weGIwIFt2
a21zXQ0KPiBbIDE5OTcuMjUwNzU4XSAgY29tbWl0X3RhaWwrMHg4ZC8weDE3MA0KPiBbIDE5
OTcuMjUwNzYxXSAgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0KzB4MjZiLzB4MjgwDQo+IFsg
MTk5Ny4yNTA3NjNdICBkcm1fYXRvbWljX2NvbW1pdCsweDlmLzB4YzANCj4gWyAxOTk3LjI1
MDc2Nl0gID8gX19wZnhfX19kcm1fcHJpbnRmbl9pbmZvKzB4MTAvMHgxMA0KPiBbIDE5OTcu
MjUwNzY5XSAgZHJtX21vZGVfYXRvbWljX2lvY3RsKzB4MzRjLzB4NDgwDQo+IFsgMTk5Ny4y
NTA3NzFdICA/IF9fcGZ4X2RybV9tb2RlX2F0b21pY19pb2N0bCsweDEwLzB4MTANCj4gWyAx
OTk3LjI1MDc3M10gIGRybV9pb2N0bF9rZXJuZWwrMHhkNy8weDE1MA0KPiBbIDE5OTcuMjUw
NzgwXSAgZHJtX2lvY3RsKzB4MzFmLzB4NDkwDQo+IFsgMTk5Ny4yNTA3ODFdICA/IF9fcGZ4
X2RybV9tb2RlX2F0b21pY19pb2N0bCsweDEwLzB4MTANCj4gWyAxOTk3LjI1MDc4M10gIF9f
c2Vfc3lzX2lvY3RsKzB4NmQvMHhiMA0KPiBbIDE5OTcuMjUwNzg5XSAgZG9fc3lzY2FsbF82
NCsweDQzLzB4OTANCj4gWyAxOTk3LjI1MDc5NV0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJf
aHdmcmFtZSsweDcyLzB4ZGMNCj4gDQo+IFsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLS90cmVlL21hc3Rlci90ZXN0cy92a21zX2NpDQo+
IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IC0gTWHDrXJhIENhbmFsDQo+IA0KPj4NCj4+IFRoaXMg
aXMgb2YgcGFydGljdWxhciBpbXBvcnRhbmNlIHdoZW4gdGVzdGluZyBvdXQgdGhlIERSTSBi
YWNrZW5kIGluDQo+PiBjb21wb3NpdG9ycywgYnV0IGFsc28gdG8gYmUgYWJsZSB0byBpbmRl
cGVuZGVudGx5IGhhbmRsZSBtdWx0aXBsZQ0KPj4gb3V0cHV0cy9jb25uZWN0b3JzLCBsaWtl
IHNldHRpbmcgb25lIHRvIG9mZi9zbGVlcCBvbiB3aGlsZSB0aGUgb3RoZXJzDQo+PiBhcmUg
b24sIGFuZCBjb21iaW5hdGlvbnMgdGhhdCBhcmlzZSBmcm9tIHRoYXQuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogTWFyaXVzIFZsYWQgPG1hcml1cy52bGFkQGNvbGxhYm9yYS5jb20+DQo+
PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgICAgICB8ICAz
ICstLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jICAgICAgIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19kcnYuaCAgICAgICB8ICA4ICsrKysrLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS92
a21zL3ZrbXNfb3V0cHV0LmMgICAgfCAgNSArKy0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX3dyaXRlYmFjay5jIHwgMTggKysrKysrKystLS0tLS0tLS0tDQo+PiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+Pg0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------EwHbM68hxqhhpAOSoKz0QyAE--

--------------MIpkbZctRDJ0QC0fSDzTB6DJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQun7YFAwAAAAAACgkQlh/E3EQov+A5
rBAAsH2BwgwiPvCdeYDI+o4wqwi/n+Tu2AWIVrqWenSwCWyLBGBYqq5g2OWBA8V0MblyeWM+XL8g
b1MIFzARSEatI/xjG2YkRKtG32ZQTMbc1V0OOYkmedZIuoj/gTob+9xzB6oNPwDz1CddV6xIfue7
HJL4aZDqRh4yrpJ6fJm+qQjsHLOBytO3Qy0G+yjeDU5IodmwNIt8cCMpa42FjcvqyqzwfI1eQk/t
Ofsq53Od8LjYeY/5ACqqTlqYcisrLjqU3PSXmfrOnQvPH7zY/fsVpVE6YPYn5WCLAdSkHlfVv4Dl
fLLNkqecDRyH76Muu8Jsp3wtSt7IJ7Lbi4Vno3TpvBSFHJ9XN595rzq7Uj//O1MAXw+uKPi4Kkvp
nsOQEpTqlnBfZZvANXidbiWZ4IiPKGvaBx1L9E2cZ81Brb/yQ2tOE19RfQ8dj9tVQLdgaNYFf7hn
BIoWQt/Ds0TA+tyfvKi9yzyAi7kUCDOO+CEOEzqs1cbbgRDLGRdqetXioI4ueiIYk9W+fd08JF+a
7K4+GVjFxL+nlgFPbCmSJme2LCtUglRwFZeosew9+E13B3BSmZEonza1DAvHPPVqyMej//S/77cm
3KxQqizXS38P+h4sclOD8XhK23mFB3AaZ/AnaO//V/8qNSMNXkFLOrcAZ/35PFNJh396bsXvdIOc
uc4=
=qis/
-----END PGP SIGNATURE-----

--------------MIpkbZctRDJ0QC0fSDzTB6DJ--
