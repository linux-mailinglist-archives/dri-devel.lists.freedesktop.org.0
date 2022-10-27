Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157560FA0F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 16:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4898310E646;
	Thu, 27 Oct 2022 14:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787DB10E646
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 14:04:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3099621C77;
 Thu, 27 Oct 2022 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666879475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ct2V+HG8XGNNXANoccejB91GXmgyAEv4ZQQGrZnDZSQ=;
 b=wMuxqbEn/WHNFID3qYrASo88h3dD2UrsjJmGkSGMSavVk5+4WUAccTGJpFwLaMkXyJkBvY
 iQC+lbgQeuU8qw+ST4ZGJ/p/txnd6qsGvg/4hkVTr36XOZk4sfEEqc0KqU5qol+nsCLdVK
 l3itcsQqPxs2c6ThYZLuxs3PZgsHrFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666879475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ct2V+HG8XGNNXANoccejB91GXmgyAEv4ZQQGrZnDZSQ=;
 b=e+O2AmtQwM6lVUBauns17FmXZ34yvLN6rL1xY1mCz/cg011qFsPAu9lN0nxT3Q4pmziuWz
 sfYQHsU7EEkxUDCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BBD113357;
 Thu, 27 Oct 2022 14:04:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 103mAfOPWmMwAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Oct 2022 14:04:35 +0000
Message-ID: <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
Date: Thu, 27 Oct 2022 16:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <20221027115707.17980-2-tzimmermann@suse.de> <5987066.DvuYhMxLoT@steina-w>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5987066.DvuYhMxLoT@steina-w>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uq6CteIfd3QPtuurxuLlcgj6"
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uq6CteIfd3QPtuurxuLlcgj6
Content-Type: multipart/mixed; boundary="------------MNMw0OewyL82Bn2GxqQbL6UJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Message-ID: <4d4a9515-facd-9dd3-1028-6a3622fe9da6@suse.de>
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <20221027115707.17980-2-tzimmermann@suse.de> <5987066.DvuYhMxLoT@steina-w>
In-Reply-To: <5987066.DvuYhMxLoT@steina-w>

--------------MNMw0OewyL82Bn2GxqQbL6UJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMTAuMjIgdW0gMTU6MDcgc2NocmllYiBBbGV4YW5kZXIgU3RlaW46DQo+
IEhlbGxvIFRob21hcywNCj4gDQo+IEFtIERvbm5lcnN0YWcsIDI3LiBPa3RvYmVyIDIwMjIs
IDEzOjU3OjA2IENFU1Qgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+IFByb3BlcnRp
ZXMgb2YgMzItYml0IGludGVnZXJzIGFyZSByZXR1cm5lZCBmcm9tIHRoZSBPRiBkZXZpY2Ug
dHJlZQ0KPj4gYXMgdHlwZSBfX2JlMzIuIENhc3QgUENJIHZlbmRvciBhbmQgZGV2aWNlIElE
cyBmcm9tIF9fYmUzMiB0byB1MzINCj4+IGJlZm9yZSBjb21wYXJpbmcgdGhlbSB0byBjb25z
dGFudHMuIEZpeGVzIHNwYXJzZSB3YXJuaW5ncyBzaG93biBiZWxvdy4NCj4+DQo+PiAgICBk
cml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jOjIzNzoxNzogd2FybmluZzogcmVzdHJpY3Rl
ZCBfX2JlMzIgZGVncmFkZXMNCj4+IHRvIGludGVnZXIgZHJpdmVycy9ncHUvZHJtL3Rpbnkv
b2Zkcm0uYzoyMzg6MTg6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgX19iZTMyDQo+PiBkZWdyYWRl
cyB0byBpbnRlZ2VyIGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmM6MjM4OjU0OiB3YXJu
aW5nOg0KPj4gcmVzdHJpY3RlZCBfX2JlMzIgZGVncmFkZXMgdG8gaW50ZWdlcg0KPj4NCj4+
IFNlZSBbMV0gZm9yIHRoZSBidWcgcmVwb3J0Lg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjIxMDE5MjIwOC5EODg4STZYNy1sa3BAaW50
ZWwuY29tLw0KPj4gIyBbMV0gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJt
LmMgfCA1ICsrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkv
b2Zkcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMNCj4+IGluZGV4IDBlMWNj
MjM2OWFmY2MuLjBkYThiMjQ4Y2NjNmUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGlueS9vZmRybS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5j
DQo+PiBAQCAtMjMxLDggKzIzMSwxMSBAQCBzdGF0aWMgdTY0IGRpc3BsYXlfZ2V0X2FkZHJl
c3Nfb2Yoc3RydWN0IGRybV9kZXZpY2UNCj4+ICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
b2YgcmV0dXJuIGFkZHJlc3M7DQo+PiAgIH0NCj4+DQo+PiAtc3RhdGljIGJvb2wgaXNfYXZp
dm8oX19iZTMyIHZlbmRvciwgX19iZTMyIGRldmljZSkNCj4+ICtzdGF0aWMgYm9vbCBpc19h
dml2byhfX2JlMzIgdmVuZG9yX2lkLCBfX2JlMzIgZGV2aWNlX2lkKQ0KPj4gICB7DQo+PiAr
CXUzMiB2ZW5kb3IgPSAoX19mb3JjZSB1MzIpdmVuZG9yX2lkOw0KPj4gKwl1MzIgZGV2aWNl
ID0gKF9fZm9yY2UgdTMyKWRldmljZV9pZDsNCj4gDQo+IEkgZG9uJ3QgaGF2ZSBtdWNoIGNv
bnRleHQsIGJ1dCBqdXN0IGZyb20gcmVhZGluZyB0aGlzLCBzaG91bGRuJ3QgdGhpcyBiZQ0K
PiBiZTMyX3RvX2NwdSgpIGluc3RlYWQ/DQoNCkkgc2hvdWxkIGhhdmUgZXhwbGFpbmVkIHRo
YXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGUgdmFsdWVzIGFyZSANCnN1cHBvc2VkIHRv
IGJlIGluIGJpZyBlbmRpYW4uIFdlIGNvbXBhcmUgdG8gUENJIGlkcy4gVGhlIGNvZGUgb3Jp
Z2luYWxseSANCndhcyB0YWtlbiBmcm9tIFsxXSwgd2hpY2ggZG9lcyB0aGUgcmlnaHQgdGhp
bmcuIFRoZSBuZXh0IHZlcnNpb24gd2lsbCANCmFkZCB0aGlzIGluZm8gdG8gdGhlIGNvbW1p
dCBtZXNzYWdlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni4wLjUvc291cmNlL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvb2ZmYi5jI0wzNTcNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBBbGV4YW5kZXINCj4g
DQo+PiArDQo+PiAgIAkvKiBUaGlzIHdpbGwgbWF0Y2ggbW9zdCBSNXh4ICovDQo+PiAgIAly
ZXR1cm4gKHZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0FUSSkgJiYNCj4+ICAgCSAgICAgICAo
KGRldmljZSA+PSBQQ0lfVkVORE9SX0lEX0FUSV9SNTIwICYmIGRldmljZSA8IDB4NzgwMCkg
fHwNCj4gDQo+IA0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------MNMw0OewyL82Bn2GxqQbL6UJ--

--------------uq6CteIfd3QPtuurxuLlcgj6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNaj/IFAwAAAAAACgkQlh/E3EQov+Br
pg//Ufs1colIxr27svmmhx3QfSkYDvTZOekny05FDAE52UrmWq5fpnzWtVudKEdDz/vaiF/h6OuN
VQyhoaMVh8PxMTrhBp01ABSUuGcQ6R+mxXE/0/RgYkRKdoh+VYNP571PoVkGpuCLBbRLpieQqdB2
fYGFa1RikxpFqg6A+4o1aM5hstzbSEdk+RQ6lWo+hDfYbrjGwU/cOherbopn1+VnQFbVOmPY+2tS
PPpD33+ha6s79te/9ryUr6/zBgHME0JDKTeFsoXDG1CN7Ox8192jnF+ZKy+zWO7b25q6FTksbjxQ
DU2F4r63YQK+78R5QkekJkKdw0NkjdY0g4eb1E3IQagq5U+vZI6wrpduq0F/YtFtNCqHfifPXyQM
fETtBnkPXfaOF0oEtHPDowA1UWzR1LQvodQUqVKYy1u330xkznGqos6nVNqW/EPujgdjN964sT8M
duNQaTQ5hDW1ENhkHEeIyxMGzrLWhtf8QQyS5nVOD0r2M9vTGczIw5DVcchCHVoFIHNse6Apzso6
xiGl6XTz4Zli9cqNBU4jnouKM+jof9PnYw97HHWxu6EmBloW+gIJjoQHdy0ymfaovkZdpB0UVhUu
xR7+EjLRrBdW+uosdXtSYErDvc6GTgnmP+Q3/ouA/LSb52TlqrcUgzLi05Qi8NtICGZ0nFwociRF
OyQ=
=BqSc
-----END PGP SIGNATURE-----

--------------uq6CteIfd3QPtuurxuLlcgj6--
