Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06764F582D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138E110F273;
	Wed,  6 Apr 2022 09:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450810F276
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3328F1F38A;
 Wed,  6 Apr 2022 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649236075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6u5ENVjeKZgNEV3PqW1vYquihGYYJC7UqK8NkrZEspA=;
 b=ZZRLDT5D1HtFiJ9leIzqZbfuizKl2A96rcPF6q/fQ6Q2t0ufGpJotTUdvOspuNj0LOV/O1
 /Mu9/+h4oA8IJZ98o2wW6devX0Kn6hc2mwW0u0eq/WtKlO54nFCFSc6D+u9jPh0VJtKmMd
 CprOJa2guOrx4fYRuMXKjlspmM61ksg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649236075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6u5ENVjeKZgNEV3PqW1vYquihGYYJC7UqK8NkrZEspA=;
 b=bzz1ojM4S07BV3LzGUFJHUuMPzGs37T1Ftuq2mmzBaQOs8MdgtFsmf5XeXEA6b7z8vxLvj
 mFuDfb1Yjk7b5iDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF86F139F5;
 Wed,  6 Apr 2022 09:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XnxeOWpYTWIlfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 09:07:54 +0000
Message-ID: <c290853e-f0e2-ceed-b53c-859bec1fbce3@suse.de>
Date: Wed, 6 Apr 2022 11:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 5/6] drm/vc4: kms: Warn if we have an incompatible muxing
 setup
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <20220328153659.2382206-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220328153659.2382206-6-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WLXDcK0jTsdVGuZljJjk7JrN"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WLXDcK0jTsdVGuZljJjk7JrN
Content-Type: multipart/mixed; boundary="------------snHJH7971lQVb7VndTcrndK6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <c290853e-f0e2-ceed-b53c-859bec1fbce3@suse.de>
Subject: Re: [PATCH 5/6] drm/vc4: kms: Warn if we have an incompatible muxing
 setup
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <20220328153659.2382206-6-maxime@cerno.tech>
In-Reply-To: <20220328153659.2382206-6-maxime@cerno.tech>

--------------snHJH7971lQVb7VndTcrndK6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI4LjAzLjIyIHVtIDE3OjM2IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gVGhl
IGRvY3VtZW50YXRpb24gZXhwbGljaXRseSBzdGF0ZXMgd2UgbXVzdCBwcmV2ZW50IHRoZSBv
dXRwdXQNCj4gMiBhbmQgMyBmcm9tIGZlZWRpbmcgZnJvbSB0aGUgc2FtZSBIVlMgY2hhbm5l
bC4NCj4gDQo+IExldCdzIGFkZCBhIHdhcm5pbmcgdG8gbWFrZSBzb21lIG5vaXNlIGlmIHdl
IGV2ZXIgZmluZCBvdXJzZWx2ZXMgaW4gc3VjaA0KPiBhIGNhc2UuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jDQo+IGlu
ZGV4IDk0YzU4ZWMzN2EyNy4uZDk0Zjc4ZWFjOTM2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9rbXMuYw0KPiBAQCAtMjg2LDYgKzI4Niw5IEBAIHN0YXRpYyB2b2lkIHZjNV9odnNfcHZf
bXV4aW5nX2NvbW1pdChzdHJ1Y3QgdmM0X2RldiAqdmM0LA0KPiAgIA0KPiAgIAkJc3dpdGNo
ICh2YzRfY3J0Yy0+ZGF0YS0+aHZzX291dHB1dCkgew0KPiAgIAkJY2FzZSAyOg0KPiArCQkJ
V0FSTl9PTihWQzRfR0VUX0ZJRUxEKEhWU19SRUFEKFNDQUxFUl9ESVNQQ1RSTCksDQo+ICsJ
CQkJCSAgICAgIFNDQUxFUl9ESVNQQ1RSTF9EU1AzX01VWCkgPT0gY2hhbm5lbCk7DQo+ICsN
Cg0KU2hvdWxkIGJlIGRybV9XQVJOX09OKCkuDQoNCklzIHRoYXQgc29tZXRoaW5nIHRoYXQg
Y291bGQgYmUgZGV0ZWN0ZWQgZHVyaW5nIGF0b21pYy1jaGVjayBzdGVwcz8NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiAgIAkJCW11eCA9IChjaGFubmVsID09IDIpID8gMCA6IDE7
DQo+ICAgCQkJcmVnID0gSFZTX1JFQUQoU0NBTEVSX0RJU1BFQ1RSTCk7DQo+ICAgCQkJSFZT
X1dSSVRFKFNDQUxFUl9ESVNQRUNUUkwsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------snHJH7971lQVb7VndTcrndK6--

--------------WLXDcK0jTsdVGuZljJjk7JrN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNWGkFAwAAAAAACgkQlh/E3EQov+C0
Sg/+M+9VIrGLykDX0nr5yfMSPDiV1CJQFApyxTPCBxaWleevXrrrzB8DPdi+Jsn8wWdAEYNNg4WN
2MDotqgzsAPW5beHBb9DFwb5Wnpxt4UqP44qbloOx6wL06OPjLJGKWSYXENIoitVJVUR9N/znVgw
SlPd7YQj1x1SPsQ+r/+2HULn64ra7lcXua86sh3bgz9tqrwuJzBeGRpZ1XgsA/+J02nhRB+KvKxA
SewVImIqocWeJJPYLPXtZwtmsJvFBxcxqaSBSYvb5snKC6IP4K0mvKVaHtyAmoEHKI9TSvEqjb3s
ALmr8KAItdMh/vM59OmZWdH95UGCSGLrbEsTISUYaSGHPfwYaYLOm8HcmdOrdgRuSybHDtFr10F2
4nw/923ez457a8rcYNs1gTS2WMMO2zFvXflEqUHpRQZnXvAebDSWbKgUDDbHrVfxrDCKK6WKaxAm
uUBZPmuxucNYq0SH4U9a7aI6H6HVebwm5Cxn+BSp2mSb6+G4xhg7ffuiVOTKP+Nrj8qixuc4AjrE
yE+TbL37h7Ohu/GSc6UF9MpWZda3X1XlqIC2CIzLyCvfnZiR9nKkceYxFeYiLYHLHLlQqi7qOcPE
h/SE8AN3ZOjtKNx2UrcDaaV2jxKDmGG9LyVAVMMbYawgSIsLqW3aVzAwXTIgQdSMXTG1aQKnB0da
qK8=
=MZfE
-----END PGP SIGNATURE-----

--------------WLXDcK0jTsdVGuZljJjk7JrN--
