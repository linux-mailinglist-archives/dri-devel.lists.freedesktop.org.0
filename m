Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434955305B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6B111201E;
	Tue, 21 Jun 2022 11:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB00A11201E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:01:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A2DC218D6;
 Tue, 21 Jun 2022 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655809269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spBrzoSkvq15DEMtBlvMu2SLKNcBSntl2+RpTFfjYhM=;
 b=UUIoANSQ5tpF0fsAxLS/S9TLy2jg4JAVuEHKSkYsuH2R+qA3PEBXHfYM++OW+N4uA8C3iO
 Un7uWrEpcERuHboVNfluQMeAZb5ptdJQlyA4d/wR2dpynhBsTRfCZnQ6BTXbtaxfNY47uF
 cuDw0SWzDfSo8l8X0yfAUxOP1jMYGzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655809269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spBrzoSkvq15DEMtBlvMu2SLKNcBSntl2+RpTFfjYhM=;
 b=2+xKBiZ735LtBiZySej8dFM5shXTC8OYX3XrH0pZgVo5LhMCcxAg8JHeVYokI6Sw/Nj8Lx
 sUENP2Olf1zrJRCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FCB413A88;
 Tue, 21 Jun 2022 11:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yaPICvWksWILWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Jun 2022 11:01:09 +0000
Message-ID: <e8b082ab-c3d5-b0cb-0d63-b4100b116b21@suse.de>
Date: Tue, 21 Jun 2022 13:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
 <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
 <20220617081259.594c1320.alex.williamson@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220617081259.594c1320.alex.williamson@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WQaExk9do07E8GNN3B212yn9"
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WQaExk9do07E8GNN3B212yn9
Content-Type: multipart/mixed; boundary="------------JJ3mxSP67EUjbVS30Ok0ngPV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Alex Deucher <alexander.deucher@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Zack Rusin <zackr@vmware.com>
Message-ID: <e8b082ab-c3d5-b0cb-0d63-b4100b116b21@suse.de>
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
 <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
 <20220617081259.594c1320.alex.williamson@redhat.com>
In-Reply-To: <20220617081259.594c1320.alex.williamson@redhat.com>

--------------JJ3mxSP67EUjbVS30Ok0ngPV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDYuMjIgdW0gMTY6MTIgc2NocmllYiBBbGV4IFdpbGxpYW1zb246DQo+
IE9uIEZyaSwgMTcgSnVuIDIwMjIgMTQ6NDE6MDEgKzAyMDANCj4gVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4+IEhpDQo+Pg0KPj4gQW0g
MTcuMDYuMjIgdW0gMTQ6Mjkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+
Pj4gW2FkZGluZyBaYWNrIGFuZCBBbGV4IHRvIENjIGxpc3RdDQo+Pj4NCj4+PiBIZWxsbyBU
aG9tYXMsDQo+Pj4NCj4+PiBUaGFua3MgYSBsb3QgZm9yIHRyYWNraW5nIHRoaXMgZG93biBh
bmQgZmlndXJpbmcgb3V0IHRoZSByb290IGNhdXNlIQ0KPj4+DQo+Pj4gT24gNi8xNy8yMiAx
NDoxMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+IEFsd2F5cyBydW4gZmJkZXYg
cmVtb3ZhbCBmaXJzdCB0byByZW1vdmUgc2ltcGxlZHJtIHZpYQ0KPj4+PiBzeXNmYl9kaXNh
YmxlKCkuIFRoaXMgY2xlYXJzIHRoZSBpbnRlcm5hbCBzdGF0ZS4gVGhlIGxhdGVyIGNhbGwN
Cj4+Pj4gdG8gZHJtX2FwZXJ0dXJlX2RldGFjaF9kcml2ZXJzKCkgdGhlbiBkb2VzIG5vdGhp
bmcuIE90aGVyd2lzZSwNCj4+Pj4gd2l0aCBkcm1fYXBlcnR1cmVfZGV0YWNoX2RyaXZlcnMo
KSBydW5uaW5nIGZpcnN0LCB0aGUgY2FsbCB0bw0KPj4+PiBzeXNmYl9kaXNhYmxlKCkgdXNl
cyBpbmNvbnNpc3RlbnQgc3RhdGUuDQo+Pj4+DQo+Pj4+IEV4YW1wbGUgYmFja3RyYWNlIHNo
b3cgYmVsb3c6DQo+Pj4+DQo+Pj4+IFsgICAxMS42NjM0MjJdID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4+
PiBbICAgMTEuNjYzNDI2XSBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBkZXZpY2Vf
ZGVsKzB4NzkvMHg1ZjANCj4+Pj4gWyAgIDExLjY2MzQzNV0gUmVhZCBvZiBzaXplIDggYXQg
YWRkciBmZmZmODg4MTA4MTg1MDUwIGJ5IHRhc2sgc3lzdGVtZC11ZGV2ZC8zMTENCj4+Pj4g
WyAgIDExLjY2MzQ0MF0gQ1BVOiAwIFBJRDogMzExIENvbW06IHN5c3RlbWQtdWRldmQgVGFp
bnRlZDogRyAgICAgICAgICAgIEUgICAgIDUNCj4+Pj4gCS4xOS4wLXJjMi0xLWRlZmF1bHQr
ICMxNjg5DQo+Pj4+IFsgICAxMS42NjM0NDVdIEhhcmR3YXJlIG5hbWU6IEhQIFByb0xpYW50
IERMMTIwIEc3LCBCSU9TIEowMSAwNC8yMS8yMDExDQo+Pj4+IFsgICAxMS42NjM0NDddIENh
bGwgVHJhY2U6DQo+Pj4+IFsgICAxMS42NjM0NDldICA8VEFTSz4NCj4+Pj4gWyAgIDExLjY2
MzQ1MV0gID8gZGV2aWNlX2RlbCsweDc5LzB4NWYwDQo+Pj4+IFsgICAxMS42NjM0NTZdICBk
dW1wX3N0YWNrX2x2bCsweDViLzB4NzMNCj4+Pj4gWyAgIDExLjY2MzQ2Ml0gIHByaW50X2Fk
ZHJlc3NfZGVzY3JpcHRpb24uY29uc3Rwcm9wLjArMHgxZi8weDFiMA0KPj4+PiBbICAgMTEu
NjYzNDY4XSAgPyBkZXZpY2VfZGVsKzB4NzkvMHg1ZjANCj4+Pj4gWyAgIDExLjY2MzQ3MV0g
ID8gZGV2aWNlX2RlbCsweDc5LzB4NWYwDQo+Pj4+IFsgICAxMS42NjM0NzVdICBwcmludF9y
ZXBvcnQuY29sZCsweDNjLzB4MjFjDQo+Pj4+IFsgICAxMS42NjM0ODFdICA/IGxvY2tfYWNx
dWlyZWQrMHg4Ny8weDFlMA0KPj4+PiBbICAgMTEuNjYzNDg0XSAgPyBsb2NrX2FjcXVpcmVk
KzB4ODcvMHgxZTANCj4+Pj4gWyAgIDExLjY2MzQ4OV0gID8gZGV2aWNlX2RlbCsweDc5LzB4
NWYwDQo+Pj4+IFsgICAxMS42NjM0OTJdICBrYXNhbl9yZXBvcnQrMHhiZi8weGYwDQo+Pj4+
IFsgICAxMS42NjM0OThdICA/IGRldmljZV9kZWwrMHg3OS8weDVmMA0KPj4+PiBbICAgMTEu
NjYzNTAzXSAgZGV2aWNlX2RlbCsweDc5LzB4NWYwDQo+Pj4+IFsgICAxMS42NjM1MDldICA/
IGRldmljZV9yZW1vdmVfYXR0cnMrMHgxNzAvMHgxNzANCj4+Pj4gWyAgIDExLjY2MzUxNF0g
ID8gbG9ja19pc19oZWxkX3R5cGUrMHhlOC8weDE0MA0KPj4+PiBbICAgMTEuNjYzNTIzXSAg
cGxhdGZvcm1fZGV2aWNlX2RlbC5wYXJ0LjArMHgxOS8weGUwDQo+Pj4+IFsgICAxMS42NjM1
MzBdICBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcisweDFjLzB4MzANCj4+Pj4gWyAgIDEx
LjY2MzUzNV0gIHN5c2ZiX2Rpc2FibGUrMHgyZC8weDcwDQo+Pj4+IFsgICAxMS42NjM1NDBd
ICByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKzB4MWMvMHhmMA0KPj4+PiBbICAg
MTEuNjYzNTQ2XSAgcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMrMHgxMzAv
MHgxYTANCj4+Pj4gWyAgIDExLjY2MzU1NF0gIGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxp
Y3RpbmdfcGNpX2ZyYW1lYnVmZmVycysweDg2LzB4YjANCj4+Pj4gWyAgIDExLjY2MzU2MV0g
ID8gbWdhZzIwMF9wY2lfcmVtb3ZlKzB4MzAvMHgzMCBbbWdhZzIwMF0NCj4+Pj4gWyAgIDEx
LjY2MzU3OF0gIG1nYWcyMDBfcGNpX3Byb2JlKzB4MmQvMHgxNDAgW21nYWcyMDBdDQo+Pj4+
ICAgDQo+Pj4NCj4+PiBNYXliZSBpbmNsdWRlIGEgUmVwb3J0ZWQtYnk6IFphY2sgUnVzaW4g
PHphY2tyQHZtd2FyZS5jb20+ID8gc2luY2UNCj4+PiB0aGlzIHNlZW1zIHRvIGJlIHRoZSBl
eGFjdCBzYW1lIGlzc3VlIHRoYXQgaGUgcmVwb3J0ZWQgeWVzdGVyZGF5Lg0KPj4NCj4+IEkn
bGwgZG8uDQo+Pg0KPj4+DQo+Pj4gUGF0Y2ggbG9va3MgZ29vZCB0byBtZSBhbmQgdGhpcyBz
ZWVtcyB0byBiZSB0aGUgY29ycmVjdCBmaXggSU1PLg0KPj4+IFRoYXQgd2F5IHdlIHdvbid0
IHJlLWludHJvZHVjZSB0aGUgaXNzdWUgdGhhdCB3YXMgZml4ZWQgYnkgdGhlDQo+Pj4gc3lz
ZmJfdW5yZWdpc3RlcigpIGZ1bmN0aW9uLCB0aGF0IGlzIHRvIHJlbW92ZSBhIHBkZXYgZXZl
biBpZiB3YXNuJ3QNCj4+PiBib3VuZCB0byBhIGRyaXZlciB0byBwcmV2ZW50IGEgbGF0ZSBz
aW1wbGVkcm0gcmVnaXN0cmF0aW9uIHRvIG1hdGNoLg0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4NCj4+
IFRoYW5rcyENCj4+DQo+Pj4NCj4+PiBJIHdvbmRlciB3aGF0J3MgdGhlIGJlc3Qgd2F5IHRv
IGNvb3JkaW5hdGUgd2l0aCBBbGV4IHRvIG1lcmdlIHRoaXMNCj4+PiBmaXggYW5kIHlvdXIg
cGF0Y2ggdGhhdCBtb3ZlcyB0aGUgYXBlcnR1cmUgY29kZSBvdXQgb2YgRFJNLCBzaW5jZQ0K
Pj4+IGFzIGZhciBhcyBJIGNhbiB0ZWxsIGJvdGggc2hvdWxkIHRhcmdldCB0aGUgdjUuMjAg
cmVsZWFzZS4NCj4+DQo+PiBJZiBub3RoaW5nIGVsc2UgY29tZXMgaW4sIEknbGwgbWVyZ2Ug
dGhpcyBwYXRjaCBvbiBNb25kYXkgYW5kIHNlbmQgQWxleA0KPj4gYW4gdXBkYXRlZCB2ZXJz
aW9uIG9mIHRoZSB2ZmlvIHBhdGNoLg0KPiANCj4gUGxlYXNlIGFsc28gcHVibGlzaCBhIHRv
cGljIGJyYW5jaCBmb3IgdGhlIGJhc2Ugb2YgdGhhdCBwYXRjaCBpZiB5b3UncmUNCj4gc3Rp
bGwgbG9va2luZyBmb3IgdGhlIG5vbi1kcm0gYXBlcnR1cmUgKyB2ZmlvIHNlcmllcyB0byBn
byBpbiB0aHJvdWdoIG15DQo+IHZmaW8gdHJlZS4gIFRoYW5rcywNCg0KSSBoYXZlIG1lcmdl
IHRoZSBhcGVydHVyZSBmaXgsIGJ1dCB0aGUgdmZpbyB0aGluZyBpcyBnZXR0aW5nIA0KY29t
cGxpY2F0ZWQuIENhbiB3ZSBtZXJnZSB5b3VyIHZmaW8gcGF0Y2hlcyB0aHJvdWdoIGRybS1t
aXNjLW5leHQ/IEFzIA0KdGhlIHZmaW8tc2lkZSBvZiB0aGUgY2hhbmdlIGFscmVhZHkgZ290
IGFuIHItYiBmcm9tIEphdmllciwgaXQgc2hvdWxkIA0Kc2hvdyB1cCBpbiB2NS4yMCB0aGVu
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBBbGV4DQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------JJ3mxSP67EUjbVS30Ok0ngPV--

--------------WQaExk9do07E8GNN3B212yn9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKxpPQFAwAAAAAACgkQlh/E3EQov+B3
LxAAwHj7wlMXNfmbA3geTxs+1DqdJk3+YG8MvPASM0l3X5WZjBDvsA8dwLM98seUIJftJiBw1tdy
bJG0+LzFW3cFdDar6Yqbq++ykFiB3SZf+jR/z/eC47CJokHl2J0C3oUDlpEE5XG2VyDmOV/KNNlA
MhaR9xh2h3QWCnFxfOaH3XVlMhWQ7mDmHgEqMJzFG3h+vaRa2w5xJDXhasf4NqaaZ0lJd5aKB9AM
vMYcI0JDzFnTBnt1vEn323Hi+RnzXXR8ODbiVHOI9iEKzkNbb0nxftoRGp4FmVL0Y2RbJKJdSrqe
q7OhY+Tf/LTkN3WU6/hppbVze6XJSZGWG0wDtmk22NrRBWdwV6rMPfYi9ybQZsRKRu1QBTebfHbI
6S76be2nh5wAEavflBexFEUonYSOm47LxWe51Yvfehs9jKO2UH1heZTDvCuoAU4xo0KhxubbJRpO
tqdThclAJKnHdlbReUGnd4DwPjj1JweLRVN5bedh12b6tscuaLYi4s81hsU7XE+u1/xMoSB3XKyH
Nn4nqwplqLF5DPCdmBdX0wqo6Crlu0AFFmYK1HXgkGnt3VzW5eufPohC4n2+lsCE5hOy91iyChxq
ldMmnGY50LXkSAyzBcYDdJhyzgnlont/s315gUWNgFS//I3x5UN0VfE+5vFG4zbTP3OsnbfvgpU2
o08=
=i6w1
-----END PGP SIGNATURE-----

--------------WQaExk9do07E8GNN3B212yn9--
