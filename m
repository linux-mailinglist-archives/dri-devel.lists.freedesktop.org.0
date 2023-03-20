Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3F6C1802
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE7210E59A;
	Mon, 20 Mar 2023 15:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1625B10E59A;
 Mon, 20 Mar 2023 15:19:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF09221AB1;
 Mon, 20 Mar 2023 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679325563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TZyE2yoE8wIMfl+TLkLiU7RcOvDmNlp3bYFVGDuerQw=;
 b=PSbk2A+rz+/IvK78dCjRTpVLCYYcVYlG6cSSNSP6igWNlNXX0IzRpYD+c7p204EAb71P+p
 G1J+3r9oh/ac/VYYWPoslQCiOg/pYbhy0bRe7sshbOQUnyPSsES5MyIGaySrV42T+VhZGa
 Li1FszVP5jSwlmHjDONKSYEOEuInE1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679325563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TZyE2yoE8wIMfl+TLkLiU7RcOvDmNlp3bYFVGDuerQw=;
 b=/VbnuVuM1QQTUkLYX+QZsDloqk6ERfpsU/rwpGULIiyL3+7aaKAmhZz7vxadu27GhoRdQw
 67x9Kh+hYW7uiLCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E0C113A00;
 Mon, 20 Mar 2023 15:19:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IOncHXt5GGR7QQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:19:23 +0000
Message-ID: <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
Date: Mon, 20 Mar 2023 16:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EsIFws0rYDozMG0ll6cZwqL5"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EsIFws0rYDozMG0ll6cZwqL5
Content-Type: multipart/mixed; boundary="------------ua2JUI7nazWQJDCPdVVU5PmR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
In-Reply-To: <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>

--------------ua2JUI7nazWQJDCPdVVU5PmR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDMuMjMgdW0gMTY6MTEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxNy4wMy4yMyB1bSAxMDoyMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SGkgQ2hyaXN0aWFuDQo+Pg0KPj4gQW0gMTcuMDMuMjMgdW0gMDk6NTMgc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOg0KPj4+IEFtIDE2LjAzLjIzIHVtIDEwOjM3IHNjaHJpZWIgVGhvbWFz
IFppbW1lcm1hbm46DQo+Pj4+IENvbnZlcnQgcmFkZW9uJ3MgZmJkZXYgY29kZSB0byBkcm1f
Y2xpZW50LiBSZXBsYWNlcyB0aGUgY3VycmVudA0KPj4+PiBhZC1ob2MgaW50ZWdyYXRpb24u
IFRoZSBjb252ZXJzaW9uIGluY2x1ZGVzIGEgbnVtYmVyIG9mIGNsZWFudXBzLg0KPj4+PiBP
bmx5IGJ1aWxkIGZiZGV2IHN1cHBvcnQgaWYgdGhlIGNvbmZpZyBvcHRpb24gaGFzIGJlZW4g
c2V0Lg0KPj4+DQo+Pj4gSSdtIHRvcm4gYXBhcnQgb24gdGhhdC4gT24gdGhlIG9uZSBoYW5k
IGl0IGxvb2tzIGxpa2UgYSByZWFsbHkgbmljZSANCj4+PiBjbGVhbnVwIG9uIHRoZSBvdGhl
ciBoYW5kIHdlIGRvbid0IHJlYWxseSB3YW50IHRvIHRvdWNoIHJhZGVvbiBhbnkgbW9yZS4N
Cj4+DQo+PiBJdCdzIGEgZHJpdmVyIGluIHRoZSB1cHN0cmVhbSBrZXJuZWwuIFlvdSBoYXZl
IHRvIGV4cGVjdCBhdCBsZWFzdCBzb21lIA0KPj4gY2hhbmdlcy4NCj4gDQo+IFNvbWUgY2hh
bmdlcyBpcyBub3QgdGhlIHByb2JsZW0sIGJ1dCB3ZSBuZWVkIGEganVzdGlmaWNhdGlvbiB0
byBjaGFuZ2UgDQo+IHNvbWV0aGluZy4gSnVzdCB0aGF0IGl0J3MgbmljZSB0byBoYXZlIHdv
bid0IGRvIGl0IHdpdGhvdXQgZXh0ZW5zaXZlIA0KPiB0ZXN0aW5nLg0KPiANCj4+DQo+Pj4N
Cj4+PiBBbGV4IHdoYXQgZG8geW91IHRoaW5rPyBJcyB0aGF0IHdvcnRoIHRoZSByaXNrIG9m
IGJyZWFraW5nIHN0dWZmPw0KPj4NCj4+IE1vdmluZyBhbGwgZmJkZXYgZW11bGF0aW9uIHRv
IHN0cnVjdCBkcm1fY2xpZW50IGlzIHJlcXVpcmVkIGZvciBuZXcgDQo+PiBpbi1rZXJuZWwg
RFJNIGNsaWVudHMsIHN1Y2ggYXMgYSBEUk0ga2VybmVsIGxvZ2dlciBvciBhIGJvb3Qgc3Bs
YXNoLg0KPiANCj4gV2VsbCB0aGF0J3MgYSByYXRoZXIgZ29vZCBqdXN0aWZpY2F0aW9uLiBJ
IHN1Z2dlc3QgdG8gYWRkIHRoYXQgdG8gdGhlIA0KPiBjb3Zlci1sZXR0ZXIuDQoNCk9rLCB3
aWxsIGdvIGludG8gYSBwb3NzaWJsZSB2Mi4gVGhlIG1pZC10ZXJtIHBsYW4gaXMgdG8gY29u
dmVydCB0aGUgDQpmYmRldiBjb2RlIGluIGFsbCByZW1haW5pbmcgZHJpdmVycyB0byBzdHJ1
Y3QgZHJtX2NsaWVudCBhbmQgcmVtb3ZlIHRoZSANCm9sZCBhZC1ob2MgY2FsbGJhY2tzLg0K
DQpXaXRoIHN0cnVjdCBkcm1fY2xpZW50LCB3ZSBjYW4gc2VsZWN0IGluLWtlcm5lbCBjbGll
bnRzIGF0IGNvbXBpbGUgdGltZSANCm9yIHJ1bnRpbWUganVzdCBsaWtlIHVzZXJzcGFjZSBj
bGllbnRzLiBJIGd1ZXNzLCB3ZSBjYW4gaGF2ZSBhIGJvb3R1cCANCnNjcmVlbiBhbmQgdGhl
biBzd2l0Y2ggdG8gdGhlIGNvbnNvbGUgb3IgdGhlIERSTSBsb2dnZXIuIE9yIGdvIGZyb20g
YW55IA0KY2xpZW50IHRvIHRoZSBsb2dnZXIgb24ga2VybmVsIHBhbmljcyAob3Igc29tZXRo
aW5nIGxpa2UgdGhhdCkuIFRoZXJlJ3MgDQpiZWVuIG9jY2FzaW9uYWwgdGFsayBhYm91dCB1
c2Vyc3BhY2UgY29uc29sZXMsIHdoaWNoIHdvdWxkIHVzZSBzdWNoIA0KZnVuY3Rpb25hbGl0
eS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0
aWFuLg0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+
IENocmlzdGlhbi4NCj4+Pg0KPj4+Pg0KPj4+PiBUaG9tYXMgWmltbWVybWFubiAoMTApOg0K
Pj4+PiDCoMKgIGRybS9yYWRlb246IE1vdmUgcmFkZW9uX2FsaWduX3BpdGNoKCkgbmV4dCB0
byBkdW1iLWJ1ZmZlciBoZWxwZXJzDQo+Pj4+IMKgwqAgZHJtL3JhZGVvbjogSW1wcm92ZSBm
YmRldiBvYmplY3QtdGVzdCBoZWxwZXINCj4+Pj4gwqDCoCBkcm0vcmFkZW9uOiBSZW1vdmUg
c3RydWN0IHJhZGVvbl9mYmRldg0KPj4+PiDCoMKgIGRybS9yYWRlb246IFJlbW92ZSB0ZXN0
IGZvciAhc2NyZWVuX2Jhc2UgaW4gZmJkZXYgcHJvYmluZw0KPj4+PiDCoMKgIGRybS9yYWRl
b246IE1vdmUgZmJkZXYgb2JqZWN0IGhlbHBlcnMgYmVmb3JlIHN0cnVjdCBmYl9vcHMgZXQg
YWwNCj4+Pj4gwqDCoCBkcm0vcmFkZW9uOiBGaXggY29kaW5nIHN0eWxlIGluIGZiZGV2IGVt
dWxhdGlvbg0KPj4+PiDCoMKgIGRybS9yYWRlb246IE1vdmUgZmJkZXYgY2xlYW51cCBjb2Rl
IGludG8gZmJfZGVzdHJveSBjYWxsYmFjaw0KPj4+PiDCoMKgIGRybS9yYWRlb246IENvcnJl
Y3RseSBjbGVhbiB1cCBmYWlsZWQgZGlzcGxheSBwcm9iaW5nDQo+Pj4+IMKgwqAgZHJtL3Jh
ZGVvbjogSW1wbGVtZW50IGNsaWVudC1iYXNlZCBmYmRldiBlbXVsYXRpb24NCj4+Pj4gwqDC
oCBkcm0vcmFkZW9uOiBPbmx5IGJ1aWxkIGZiZGV2IGlmIERSTV9GQkRFVl9FTVVMQVRJT04g
aXMgc2V0DQo+Pj4+DQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0NCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb24uaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+Pj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8wqDCoCA0IC0NCj4+Pj4gwqAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmPCoMKgwqDCoCB8wqDCoCAzICst
DQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5owqDCoMKgwqAg
fMKgwqAgMSAtDQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZiLmPC
oMKgwqDCoMKgIHwgNDAwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmJkZXYuY8KgwqAgfCA0MjIgDQo+Pj4+ICsrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9nZW0uY8KgwqDCoMKgIHzCoCAyNCArKw0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9rbXMuY8KgwqDCoMKgIHzCoCAxOCAtDQo+Pj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX21vZGUuaMKgwqDCoCB8wqAgMjAgKy0NCj4+Pj4gwqAg
MTAgZmlsZXMgY2hhbmdlZCwgNDY0IGluc2VydGlvbnMoKyksIDQzMyBkZWxldGlvbnMoLSkN
Cj4+Pj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ZiLmMNCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2ZiZGV2LmMNCj4+Pj4NCj4+Pj4NCj4+Pj4gYmFzZS1jb21taXQ6IGVj
MDcwOGU4NDZiODE5YzhkNWI2NDJkZTQyNDQ4YTg3ZDc1MjY1NjQNCj4+Pg0KPj4NCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ua2JUI7nazWQJDCPdVVU5PmR--

--------------EsIFws0rYDozMG0ll6cZwqL5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQYeXsFAwAAAAAACgkQlh/E3EQov+Dm
Kg/3b8DYVmMky8EeFTFr+tm64X0PXSyqhJMUNzgEW3bcJGaQsbk0NjkP1zUS66pisMMrC7ULZinM
TXHzbhcM9itbvV2Sa3nDn9bN2Ct0yvXuibjfgh6DZOe6CkZiZYyebqEVfCmwOjob/JFGMFxb5waH
gr7S+HvgngK0HrxCkPRm/90px1c8kXa2jq12N0WsjXvyS3MzK9Yn9wbE2o3vywFRQ46CKo5d7NuI
04f6hoInHbTHgxtPj5t673vx0nzwKP0g+EIjHuomLr9chhwzxPFQBEagYe4zSNvq5QzYdTujGskG
rNqZv7pCLYy+KoXVN5zoytc25PNJ8ZgjUw5G5TJ7Xb2liEAJx40jUoSWLh9fsjNj9GczmWlhZyNl
O1ha09FqUNNlTwMJ62F+5YsurfKQA9QYwMGsPwKxxJbi+WGsFcO6ON93swUuKHXlpj8R/SuspvtY
/+xIYE6cZazgprFea1138rcw4XG0MuO+risIyeZNe8HoPNmsXpIi6T+R5NpKxTDWEoh5IZ2NrRlf
JMprXANMECMYVpLuRFOriI2FqE3W8h2IBuJEahlpH6Cb2dox7RfwseZ9tg9r3+GjJKEieK+fr489
R0k6wDg3DMGR+tUcnuQ9LS5MbHHHyFq98rHgsPH2izPear3py9Hcrehl/8WPqLyuTr0dyqgwilcw
2w==
=UAfV
-----END PGP SIGNATURE-----

--------------EsIFws0rYDozMG0ll6cZwqL5--
