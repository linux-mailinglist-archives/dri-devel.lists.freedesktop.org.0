Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B71486418
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 13:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8BD10E585;
	Thu,  6 Jan 2022 12:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9361810E3C2;
 Thu,  6 Jan 2022 12:01:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3866D212C9;
 Thu,  6 Jan 2022 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641470468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiNXi7bCJHuw4SehISFzW4PCiwShlsiwPXCIg8gsJKU=;
 b=qElQtBlv0NiXC+pyBdx8taFy3taLfEnpF2K3mhQm+gP5XWviz8/8vivK/gj9WRxNzR6xJ4
 +nt/vE4K8NgDNqntSRl4L5JqmX2TenpHU529b14W40T74dKlF29nFis2XOoH21N36Y2Red
 wQMWfkU4AOHKzVpUYXxunUq6ym7EcVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641470468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiNXi7bCJHuw4SehISFzW4PCiwShlsiwPXCIg8gsJKU=;
 b=a/2gb6DZOChJjcim9/idVmtxi8q1o1hTJLA6WHcrJi24t+UPkwSJfI6U6/jdsfdiydZjko
 xlXKGgJcHPPhx4Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F0B613C0D;
 Thu,  6 Jan 2022 12:01:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zqmlAgTa1mElKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jan 2022 12:01:08 +0000
Message-ID: <b0fee57d-6b9d-8c83-c319-6a27d00af992@suse.de>
Date: Thu, 6 Jan 2022 13:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <d76d347f-7dcb-546a-efc0-a324d773861c@suse.de>
 <fb3d8dc7-a0ff-f5ec-2fce-75515843eb92@amd.com>
 <76ea4e5b-e32f-67c8-7c9d-b110d0730185@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <76ea4e5b-e32f-67c8-7c9d-b110d0730185@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------imOiuuroRekzDytV6mfnn2b0"
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------imOiuuroRekzDytV6mfnn2b0
Content-Type: multipart/mixed; boundary="------------z0JeRl2Q2s0WBJj2NWHwH00T";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: matthew.auld@intel.com, alexander.deucher@amd.com
Message-ID: <b0fee57d-6b9d-8c83-c319-6a27d00af992@suse.de>
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <d76d347f-7dcb-546a-efc0-a324d773861c@suse.de>
 <fb3d8dc7-a0ff-f5ec-2fce-75515843eb92@amd.com>
 <76ea4e5b-e32f-67c8-7c9d-b110d0730185@amd.com>
In-Reply-To: <76ea4e5b-e32f-67c8-7c9d-b110d0730185@amd.com>

--------------z0JeRl2Q2s0WBJj2NWHwH00T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDEuMjIgdW0gMDg6NDEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiANCj4gDQo+IEFtIDI2LjEyLjIxIHVtIDIxOjU5IHNjaHJpZWIgQXJ1bnByYXZpbjoNCj4+
IEhpIFRob21hcw0KPj4NCj4+IE9uIDE2LzEyLzIxIDU6MDUgcG0sIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4+IEhpDQo+Pj4NCj4+PiBBbSAwMS4xMi4yMSB1bSAxNzozOSBzY2hy
aWViIEFydW5wcmF2aW46DQo+Pj4+IC0gTWFrZSBkcm1fYnVkZHlfYWxsb2MgYSBzaW5nbGUg
ZnVuY3Rpb24gdG8gaGFuZGxlDQo+Pj4+IMKgwqDCoCByYW5nZSBhbGxvY2F0aW9uIGFuZCBu
b24tcmFuZ2UgYWxsb2NhdGlvbiBkZW1hbmRzDQo+Pj4+DQo+Pj4+IC0gSW1wbGVtZW50ZWQg
YSBuZXcgZnVuY3Rpb24gYWxsb2NfcmFuZ2UoKSB3aGljaCBhbGxvY2F0ZXMNCj4+Pj4gwqDC
oMKgIHRoZSByZXF1ZXN0ZWQgcG93ZXItb2YtdHdvIGJsb2NrIGNvbXBseSB3aXRoIHJhbmdl
IGxpbWl0YXRpb25zDQo+Pj4+DQo+Pj4+IC0gTW92ZWQgb3JkZXIgY29tcHV0YXRpb24gYW5k
IG1lbW9yeSBhbGlnbm1lbnQgbG9naWMgZnJvbQ0KPj4+PiDCoMKgwqAgaTkxNSBkcml2ZXIg
dG8gZHJtIGJ1ZGR5DQo+Pj4+DQo+Pj4+IHYyOg0KPj4+PiDCoMKgwqAgbWVyZ2VkIGJlbG93
IGNoYW5nZXMgdG8ga2VlcCB0aGUgYnVpbGQgdW5icm9rZW4NCj4+Pj4gwqDCoMKgwqAgLSBk
cm1fYnVkZHlfYWxsb2NfcmFuZ2UoKSBiZWNvbWVzIG9ic29sZXRlIGFuZCBtYXkgYmUgcmVt
b3ZlZA0KPj4+PiDCoMKgwqDCoCAtIGVuYWJsZSB0dG0gcmFuZ2UgYWxsb2NhdGlvbiAoZnBm
biAvIGxwZm4pIHN1cHBvcnQgaW4gaTkxNSBkcml2ZXINCj4+Pj4gwqDCoMKgwqAgLSBhcHBs
eSBlbmhhbmNlZCBkcm1fYnVkZHlfYWxsb2MoKSBmdW5jdGlvbiB0byBpOTE1IGRyaXZlcg0K
Pj4+Pg0KPj4+PiB2MyhNYXR0aGV3IEF1bGQpOg0KPj4+PiDCoMKgwqAgLSBGaXggYWxpZ25t
ZW50IGlzc3VlcyBhbmQgcmVtb3ZlIHVubmVjZXNzYXJ5IGxpc3RfZW1wdHkgY2hlY2sNCj4+
Pj4gwqDCoMKgIC0gYWRkIG1vcmUgdmFsaWRhdGlvbiBjaGVja3MgZm9yIGlucHV0IGFyZ3Vt
ZW50cw0KPj4+PiDCoMKgwqAgLSBtYWtlIGFsbG9jX3JhbmdlKCkgYmxvY2sgYWxsb2NhdGlv
bnMgYXMgYm90dG9tLXVwDQo+Pj4+IMKgwqDCoCAtIG9wdGltaXplIG9yZGVyIGNvbXB1dGF0
aW9uIGxvZ2ljDQo+Pj4+IMKgwqDCoCAtIHJlcGxhY2UgdWludDY0X3Qgd2l0aCB1NjQsIHdo
aWNoIGlzIHByZWZlcnJlZCBpbiB0aGUga2VybmVsDQo+Pj4+DQo+Pj4+IHY0KE1hdHRoZXcg
QXVsZCk6DQo+Pj4+IMKgwqDCoCAtIGtlZXAgZHJtX2J1ZGR5X2FsbG9jX3JhbmdlKCkgZnVu
Y3Rpb24gaW1wbGVtZW50YXRpb24gZm9yIGdlbmVyaWMNCj4+Pj4gwqDCoMKgwqDCoCBhY3R1
YWwgcmFuZ2UgYWxsb2NhdGlvbnMNCj4+Pj4gwqDCoMKgIC0ga2VlcCBhbGxvY19yYW5nZSgp
IGltcGxlbWVudGF0aW9uIGZvciBlbmQgYmlhcyBhbGxvY2F0aW9ucw0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBcnVucHJhdmluIDxBcnVucHJhdmluLlBhbmVlclNlbHZhbUBhbWQu
Y29tPg0KPj4gPFNOSVA+DQo+Pg0KPj4+PiArI2RlZmluZSBEUk1fQlVERFlfUkFOR0VfQUxM
T0NBVElPTiAoMSA8PCAwKQ0KPj4+PiArDQo+Pj4+IMKgwqAgc3RydWN0IGRybV9idWRkeV9i
bG9jayB7DQo+Pj4+IMKgwqAgI2RlZmluZSBEUk1fQlVERFlfSEVBREVSX09GRlNFVCBHRU5N
QVNLX1VMTCg2MywgMTIpDQo+Pj4+IMKgwqAgI2RlZmluZSBEUk1fQlVERFlfSEVBREVSX1NU
QVRFwqAgR0VOTUFTS19VTEwoMTEsIDEwKQ0KPj4+PiBAQCAtMTMyLDEyICsxMzksMTEgQEAg
aW50IGRybV9idWRkeV9pbml0KHN0cnVjdCBkcm1fYnVkZHlfbW0gKm1tLCANCj4+Pj4gdTY0
IHNpemUsIHU2NCBjaHVua19zaXplKTsNCj4+Pj4gwqDCoCB2b2lkIGRybV9idWRkeV9maW5p
KHN0cnVjdCBkcm1fYnVkZHlfbW0gKm1tKTsNCj4+Pj4gLXN0cnVjdCBkcm1fYnVkZHlfYmxv
Y2sgKg0KPj4+PiAtZHJtX2J1ZGR5X2FsbG9jKHN0cnVjdCBkcm1fYnVkZHlfbW0gKm1tLCB1
bnNpZ25lZCBpbnQgb3JkZXIpOw0KPj4+IEp1c3QgYSBzdHlsZSBpc3N1ZS4gVGhlIHN0cnVj
dHVyZSBpcyBjYWxsZWQgZHJtX2J1ZGR5X21tLiBGb3INCj4+PiBjb25zaXN0ZW5jeSwgSSBs
aWtlIHRvIHN1Z2dlc3QgdG8gbmFtZSBhbGwgdGhlIHB1YmxpYyBpbnRlcmZhY2VzIGFuZA0K
Pj4+IGRlZmluZXMgZHJtX2J1ZGR5X21tXyogaW5zdGVhZCBvZiBqdXN0IGRybV9idWRkeV8q
Lg0KPj4+DQo+PiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCBJIHRoaW5rIHJlbmFtaW5n
IGRybV9idWRkeV8qIHRvDQo+PiBkcm1fYnVkZHlfbW1fKiBjcmVhdGVzIGEgbG9uZyBuYW1l
IGZvciB0aGUgcHVibGljIGludGVyZmFjZXMsIGZvcg0KPj4gaW5zdGFuY2UgLSBkcm1fYnVk
ZHlfbW1fYWxsb2NfYmxvY2tzKCksDQo+PiBkaXNjdXNzaW5nIHRoZSBzdHlsZSBpc3N1ZSBp
bnRlcm5hbGx5DQo+PiBATWF0dGhldywgQGNocmlzdGlhbiAtIHBsZWFzZSBsZXQgbWUga25v
dyB5b3VyIG9waW5pb24NCj4gDQo+IEkgd291bGQgcHJlZmVyIGRybV9idWRkeSBhcyBwcmVm
aXggYXMgd2VsbCBhbmQgSSB0aGluayB3ZSBjb3VsZCByYXRoZXIgDQo+IGRyb3AgdGhlIF9t
bSBwb3N0Zml4IGZyb20gdGhlIHN0cnVjdHVyZSBoZXJlLg0KDQpJIHdhcyBtb3N0bHkgY29u
Y2VybmVkIGFib3V0IG1pc21hdGNoaW5nIG5hbWVzIGZvciBmdW5jdGlvbnMgYW5kIA0Kc3Ry
dWN0dXJlcy4gSWYgZHJtX2J1ZGR5XyAod2l0aG91dCBtbSkgZm9yIGFsbCBuYW1pbmcgaXMg
cHJlZmVycmVkLCBJIA0Kd291bGRuJ3QgbWluZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gQ2F1c2Ugd2hhdCB3ZSB0cnkgdG8gbWFuYWdlIGlzIG5vdCBuZWNlc3Nhcnkg
bWVtb3J5LCBidXQgcmF0aGVyIGFkZHJlc3MgDQo+IHNwYWNlLg0KPiANCj4gQ2hyaXN0aWFu
Lg0KPiANCj4+DQo+Pj4+IC0NCj4+Pj4gLWludCBkcm1fYnVkZHlfYWxsb2NfcmFuZ2Uoc3Ry
dWN0IGRybV9idWRkeV9tbSAqbW0sDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgbGlzdF9oZWFkICpibG9ja3MsDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1NjQgc3RhcnQsIHU2NCBzaXplKTsNCj4+Pj4gK2ludCBkcm1fYnVkZHlfYWxs
b2Moc3RydWN0IGRybV9idWRkeV9tbSAqbW0sDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHU2NCBzdGFydCwgdTY0IGVuZCwgdTY0IHNpemUsDQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHU2NCBtaW5fcGFnZV9zaXplLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgbGlzdF9oZWFkICpibG9ja3MsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOw0KPj4+PiDCoMKgIHZvaWQgZHJtX2J1ZGR5
X2ZyZWUoc3RydWN0IGRybV9idWRkeV9tbSAqbW0sIHN0cnVjdCANCj4+Pj4gZHJtX2J1ZGR5
X2Jsb2NrICpibG9jayk7DQo+Pj4gSSdkIGNhbGwgdGhvc2UgKl9hbGxvY19ibG9ja3MoKSBh
bmQgX2ZyZWVfYmxvY2tzKCkuIFJpZ2h0IG5vdyBpdCBzb3VuZHMNCj4+PiBhcyBpZiB0aGV5
IGFsbG9jYXRlIGFuZCBmcmVlIGluc3RhbmNlcyBvZiBkcm1fYnVkZHlfbW0uDQo+PiBjYW4g
d2UgY2FsbCB0aG9zZSBkcm1fYnVkZHlfYWxsb2NfYmxvY2tzKCkgYW5kIGRybV9idWRkeV9m
cmVlX2Jsb2NrcygpDQo+PiBEb2VzIHRoaXMgbWFrZSBzZW5zZT8NCj4+PiBCZXN0IHJlZ2Fy
ZHMNCj4+PiBUaG9tYXMNCj4+Pj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------z0JeRl2Q2s0WBJj2NWHwH00T--

--------------imOiuuroRekzDytV6mfnn2b0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHW2gMFAwAAAAAACgkQlh/E3EQov+B4
fRAAgNsIFS9mdSNNbfJYfouTsJlrQeb5dUB+G3yWG0K+R3Cyb0qum7Gz/0PAOYJdF/gSAth7Nwvs
HxEOpoTPbNEX4J/Qow4CGCQQmLFACdlQFBMnAB5fOSdGqcXnJTDtDIcpe3SRiE9nUhvHDa8LplFp
RGX/R6CPJNzxiLGJ7dflJCRYaClCU7UkE7GToeRa2Om90km3/o+u4JcClGCCmbF8Pqk4u9L7ha0S
BmBgjHbCfqJq1N+KDBLDvtlHxnatwoD4ycgYphz/Iv/fZKoe7OFuw/Ngg2O0hA+bagmHn5k6LAKy
/4/X6xIBPzyN+t1oaxeVjkNF+QD0+rqIOU6wHQ7AUKDdKnbZbHAsDQiKwNAemUoBQNhXdPuDKlxN
u6AoT0hUXhqX8I01Yz/AsSRXAZ2xZZOJUQJMlNdDlQuBY7r7U7MZTPsUOt8oCn34dIKS6dKR24nT
rsAAYU4vOInOKvjUeh7nYKJbe1pe1XWfsQqu41fHbAPR4y2YjYPfoSrmsqiLYkIpXvvjJ/Tb5eq2
+5C+ukYEYpZ9VZ523f1lgWZ6QuRRj7v4jeKk+MT9MT1elK1iIa/63EAcsL6l9ZXCJvzHEn63ZISD
QZSjm2SIJw2xLfK5Bb7vZKU3WpN57mdIDhfgbLICufkLxdcGylBqsBU1m8usvCeXjuf1rWU80gbi
Ihs=
=rZue
-----END PGP SIGNATURE-----

--------------imOiuuroRekzDytV6mfnn2b0--
