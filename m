Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E0E56F9BB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE911ABC9;
	Mon, 11 Jul 2022 09:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1295311ABC9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:08:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B434D201CA;
 Mon, 11 Jul 2022 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657530483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+im+2Bk18JCWnodxElEBetc4xkxeZNAntbaUxdcrNo=;
 b=AXbDkMYc5favGqMAfVrDN+niX4Qhcuwmtl2X1zf/5+WVP3CBVAtx7Ne4HvcCni3T5RFpfy
 5FrI/zlQBXsfjNvTyjgPWv4Oti7ZhsFeB6htrA2yhvs2A2MaSoaSTe/p9VcfqR/NdJC+MK
 XjFZCNYmGH/kyT5KPmz+bNbUfqkv4o4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657530483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+im+2Bk18JCWnodxElEBetc4xkxeZNAntbaUxdcrNo=;
 b=/+oNhH2xw4SRXpbcXHbBAUalhABniiXr8XH1KL6td6L9KXGWhudZ4ukP7PLNII3RXqQZIV
 CvQ7pE1a1yGVeFCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9729613322;
 Mon, 11 Jul 2022 09:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qsrMI3Poy2JVNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 09:08:03 +0000
Message-ID: <255510b6-c375-aeb4-47ab-ae5f55af482f@suse.de>
Date: Mon, 11 Jul 2022 11:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm/via: Make via a single file driver
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
 <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
 <Ysvm0tdtSsMdI7TC@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Ysvm0tdtSsMdI7TC@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HTUtBfvZmf2VlTVoLXBCElzO"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HTUtBfvZmf2VlTVoLXBCElzO
Content-Type: multipart/mixed; boundary="------------VxR0KZIGGQQ5Z0TmI8H8M2vn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <255510b6-c375-aeb4-47ab-ae5f55af482f@suse.de>
Subject: Re: [PATCH v1 0/11] drm/via: Make via a single file driver
References: <20220710085506.1384056-1-sam@ravnborg.org>
 <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
 <Ysvm0tdtSsMdI7TC@ravnborg.org>
In-Reply-To: <Ysvm0tdtSsMdI7TC@ravnborg.org>

--------------VxR0KZIGGQQ5Z0TmI8H8M2vn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDcuMjIgdW0gMTE6MDEgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDA5OjAxOjUwQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkgU2FtLA0KPj4NCj4+IHRoaXMg
bG9va3MgbGlrZSBhIGdvb2Qgc29sdXRpb24gdG8gbWUuIEknZCBnaXZlIHlvdSBhIGRldGFp
bGVkIHJldmlldywgYnV0DQo+PiBkcmktZGV2ZWwgZGVjaWRlZCB0byBvbmx5IHNlbmQgbWUg
dGhlIGNvbG9yIGxldHRlci4gSSBoYWQgdG8gdXNlIHBhdGNod29yaw0KPj4gZ2V0IHRoZSBw
YXRjaGVzLg0KPj4NCj4+IEZvciB0aGUgc2VyaWVzDQo+Pg0KPj4gQWNrZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBUaGFua3MhDQo+IA0KPj4N
Cj4+IHdpdGggc3VnZ2VzdGlvbnMgYmVsb3cuDQo+Pg0KPj4gQW0gMTAuMDcuMjIgdW0gMTA6
NTQgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4gV2UgaGF2ZSBhbiB1cGNvbWluZyBvcGVu
Y2hyb21lIGRyaXZlciBmb3IgVklBIHdoZXJlIHNvbWUNCj4+PiBvZiB0aGUgZmlsZXMgY29u
ZmxpY3RzIHdpdGggdGhlIGV4aXN0aW5nIHZpYSBkcml2ZXIuDQo+Pj4NCj4+PiBJdCBpcyBu
b3QgYWNjZXB0YWJsZSB0byBqdXN0IGRlbGV0ZSB0aGUgZXhpc3RpbmcgRFJJMQ0KPj4+IGJh
c2VkIGRyaXZlciBhcyB0aGVyZSBhcmUgbW9zdCBsaWtlbHkgdXNlcnMgb3V0IHRoZXJlLA0K
Pj4+IHNvIGEgZGlmZmVyZW50IGFwcHJvYWNoIHdhcyByZXF1aXJlZC4NCj4+Pg0KPj4+IEl0
IHdhcyBkaXNjY3Vzc2VkIHdoYXQgdG8gZG8gYW5kIHRoZSBsZWFzdCBpbnZhc2l2ZQ0KPj4+
IHNvbHV0aW9uIHdhcyB0byBrZWVwIHRoZSBEUkkxIGRyaXZlciBpbiB0aGUgY3VycmVudA0K
Pj4+IGRpcmVjdG9yeSBhcyBhIHNpbmdsZSBmaWxlLg0KPj4+DQo+Pj4gVGhvbWFzIFppbW1l
cm1hbm4gYWxyZWFkeSBwb3N0ZWQgYSBwYXRjaCB0byBkbyB0aGUNCj4+PiBzYW1lIGJ1dCBp
dCBhdHRlbXBlZCB0byBoYXZlIGEgc2luZ2xlIGRyaXZlcg0KPj4+IGZvciB0aGUgRFJJMSBh
bmQgdGhlIHVwY29taW5nIG5ldyBkcml2ZXIuDQo+Pg0KPj4gQWZ0ZXIgdGhlIG9wZW5jaHJv
bWUgcGF0Y2hlcyBsYW5kLCB0aGVyZSB3aWxsIGJlIGFuIG9wdGlvbiBpbiBLY29uZmlnIHRv
DQo+PiBidWlsZCB0aGUgb2xkIGRyaXZlciBpbnN0ZWFkIG9mIG9mIHRoZSBuZXcgb25lPw0K
Pj4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2hzZXQgZW1iZWRzIHRoZSBmaWxlcyBvbmUgYnkgb25l
IHRvIG1ha2UgdGhlDQo+Pj4gZGlmZnMgcmVtb3RlbHkgcmVhZGFibGUgYW5kIGVuZCB1cCB3
aXRoIGFuIGluZGVwZW5kZW50DQo+Pj4gRFJJMSBkcml2ZXIuDQo+Pj4NCj4+PiBUaGUgZHJp
dmVyIHdhcyBidWlsdCB0ZXN0ZWQgZm9yIGVhY2ggc3RlcC4NCj4+Pg0KPj4+IFRoZSBkcml2
ZXIgaXMgaW4gdGhlIGVuZCByZW5hbWVkIHRvIHZpYV9kcmkxLg0KPj4+IFNvbWUgZmVlZGJh
Y2sgb24gdGhpcyB3b3VsZCBiZSBnb29kIGFzIEkgZG8gbm90IGtub3cNCj4+PiB3aGF0IGlt
cGFjdCBpdCB3aWxsIGhhdmUgb24gdXNlcnMuDQo+Pg0KPj4gSSBkb24ndCBrbm93IGhvdyBN
ZXNhIGRlY2lkZXMgYWJvdXQgd2hpY2ggdXNlcnNwYWNlIGRyaXZlciB0byBsb2FkLCBidXQg
SXQNCj4+IHNlZW1zIHJlbGF0ZWQgdG8gdGhlIG5hbWUgb2YgdGhlIGtlcm5lbCBkcml2ZXIu
IFJlbmFtaW5nIHRoZSBtb2R1bGUgbWlnaHQNCj4+IGludGVyZmVyZSBzb21laG93LiAgQnV0
IGlmIHRoZSBvbGQgYW5kIG5ldyBkcml2ZXIgYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSBhdA0K
Pj4gYnVpbGQgdGltZSwgaXQgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0gdG8gdXNlIHRoZSBz
YW1lIG5hbWUgZm9yIGJvdGgNCj4+IG1vZHVsZXMuDQo+IA0KPiBBbm90aGVyIG9wdGlvbiBj
b3VsZCBiZSB0byBrZWVwIHRoZSAidmlhLmtvIiBuYW1lIGFuZCBjb21lIHVwIHdpdGggYQ0K
PiBuZXcgbmFtZSBmb3IgdGhlIG9wZW5jaHJvbWUgdmFyaWFudCAodmlhX2RybT8pLg0KDQp2
aWFrbXMua28gdGhlbi4NCg0KPiBJIHRoaW5rIHdlIG5lZWQgdG8gYWxsb3cgYm90aCBkcml2
ZXJzIHRvIGJlIGJ1aWx0IGFzIGEgdXNlciBtYXkgd2FudCB0bw0KPiB0cnkgb3V0IHRoZSBv
bGQgYW5kIHRoZSBuZXcgZHJpdmVyIHdpdGhvdXQgdG8gbXVjaCBoYXNzbGUuDQoNCkkgd2lz
aCB3ZSdkIG1ha2UgaXQgcmVhbGx5IGhhcmQgdG8gdXNlIHRoZSBvbGQgZHJpdmVyLiA6KQ0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBJbiB0aGUgbmV4dCBpdGVyYXRpb24g
SSB3aWxsIGRyb3AgdGhlIHJlbmFtZSBvZiB0aGUgZHJpdmVyIC0gaXQgaXMgZWFzeQ0KPiB0
byBkbyBsYXRlciBhcyBpdCBpcyBhIHNpbXBsZSBvbmUtbGluZXIuDQo+IA0KPj4+DQo+Pj4g
VGhlIHZlcnkgbGFzdCBwYXRjaCBzeW5jaHJvbml6ZSB0aGUgdmlhXzNkX3JlZyBoZWFkZXIN
Cj4+PiBmaWxlIHdpdGggdGhlIG9uZSB1c2VkIGluIHRoZSBvcGVuY2hyb21lIGRyaXZlci4N
Cj4+PiBUaGlzIHdhcyBhZGRlZCB0byB2ZXJpZnkgdGhhdCB0aGUgbmV3IGhlYWRlciB3b3Vs
ZCBub3QNCj4+PiBicmVhayB0aGUgRFJJMSBkcml2ZXIuDQo+Pg0KPj4gU29tZSBvZiB0aGUg
bWFjcm9zIGludHJvZHVjZSBsaW5lIHdyYXBzLiBJIGRvbid0IGtub3cgaWYgeW91IGRpZCB0
aGF0DQo+PiBpbnRlbnRpb25hbGx5LCBidXQgaXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4g
V2UgaGF2ZSBhIDEwMC1jaGFyYWN0ZXIgbGltaXQNCj4+IHBlciBsaW5lLg0KPiBUaGUgdmlh
XzNkX3JlZyBmaWxlIHdhcyBjb3BpZWQgdmVyYmF0aW0gZnJvbSB0aGUgb3BlbmNocm9tZSBy
ZXBvLg0KPiBJIHdpbGwgZml4IHVwIHJlbGV2YW50IGNoZWNrcGF0Y2ggd2FybmluZ3MgaW4g
YSBmb2xsb3ctdXAgcGF0Y2ggc28gaXQgaXMNCj4gb2J2aW91cyB3aGF0IGlzIGNoYW5nZWQg
ZnJvbSB0aGUgb3JpZ2luYWwgc291cmNlLg0KPiANCj4+IE1heWJlIHlvdSBjYW4gYWxzbyBh
ZGQgYW4gZXh0cmEgcGF0Y2ggdGhhdCBhZGRzIFNQRFggbGljZW5zZSB0YWdzIGF0IHRoZSB0
b3ANCj4+IG9mIHRoZSBmaWxlcy4NCj4gWWVwLCB3aWxsIGRvLg0KPiANCj4gVGhhbmtzIGZv
ciB0aGUgZmVlZGJhY2shDQo+IA0KPiAJU2FtDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------VxR0KZIGGQQ5Z0TmI8H8M2vn--

--------------HTUtBfvZmf2VlTVoLXBCElzO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL6HMFAwAAAAAACgkQlh/E3EQov+Bj
0A//YN/98ZTmc11cdWQb4AN1znGMkaoolgtNVc758rfPaR/5A7aeOp4MeOQBPF/0zSUgtsUrDGzR
8OW3FPLOI8ztIye35rJAWVe5Y36fgyHOg067/FCP9l5LHCdKuGHWgvVFZUgzxyG75cp7T8YhNKD4
3BjLmJPuNlBs3s9GhwzC/B3eao8i5E3ORITf07YUlFRioskFy0cenJNe6XLzQ4XvT51IyEkKkGqJ
Jc1g5JGQaXBAwMwYqZISGItl3znHVAzgZNzyX2fkDgBj3jvhfnfJhXrKUYJ29LtG8Irj/28lG/S7
1WzTm+7/8uAaK/qpS3rGJuRmAkuVI60b1thOEH1ZONYN7lEFgATN1Y9dxsKa32Asy48PO5tCf+99
9X1khoJyoOsv+WySGsBr6clGxSLDEWI0puVW5tUYSyzN6Ta4z0+Snzs21cwiCQbyfn+sJNjdHUur
mrgLa+s5Kln8GjwLBarJ/BYdKQ8CV2vd8CXkZi5j+HMkNE6JdbQEAUv3Y87VLtYKGmlJNFu6ChDN
KLwwSSMFyNb7aSzuWZxnsr94758Kr3W0b9Os3NLficxJkXmSC8/unQZG3d1gYcbrOZeLqgr4QAsj
KhsHn9EXEWHAN7g7IvdpySB2AcANgao/ut1/YNIQHoYpAzBnv+1G9389CYsT6FGC+dKOmo7DoVTb
Wlk=
=7AFB
-----END PGP SIGNATURE-----

--------------HTUtBfvZmf2VlTVoLXBCElzO--
