Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715546B4065
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6879110E035;
	Fri, 10 Mar 2023 13:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565510E035
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 13:27:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03F9A21DB9;
 Fri, 10 Mar 2023 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678454857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ks7Oci8XixrTrUbMZLPwSv3WouvCeKHBUsmjjB4iWDA=;
 b=q6P13Aqs8dMr8va0cf5X7wAviZuY4wghr5cHvx4cR6D6SBr1NQa9ba/4LCRtG3iivpVuEd
 D41XMMVzvTBkZ0O9v1WE/+QrHM8ZEKKP202cLZE2k0ONrTc0+zBjccNjDFjaxKlxP8Rdqg
 AeANpdnCP5sA9XSS8LUEbnXMW8VPBuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678454857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ks7Oci8XixrTrUbMZLPwSv3WouvCeKHBUsmjjB4iWDA=;
 b=LkiE2Ahfh/PqmQK8XRq00P7ysD2jTcyXKB9g8LGBMXAAn462N1SIqAOrY2gxAXHOe8Rb3i
 h27MZHCxdtdR9SBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD322134F7;
 Fri, 10 Mar 2023 13:27:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i137NEgwC2RMQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Mar 2023 13:27:36 +0000
Message-ID: <b4fbb074-8e8a-7c4c-64ed-f7f7585a6dfb@suse.de>
Date: Fri, 10 Mar 2023 14:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/mcde: Do not use dirty GEM FB handling
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
References: <20230309082421.439813-1-linus.walleij@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230309082421.439813-1-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8cmMygycvQzP9H0j0vVJFST2"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8cmMygycvQzP9H0j0vVJFST2
Content-Type: multipart/mixed; boundary="------------xm0X2AuPmpm5iK1LtNLX7ViQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Message-ID: <b4fbb074-8e8a-7c4c-64ed-f7f7585a6dfb@suse.de>
Subject: Re: [PATCH] drm/mcde: Do not use dirty GEM FB handling
References: <20230309082421.439813-1-linus.walleij@linaro.org>
In-Reply-To: <20230309082421.439813-1-linus.walleij@linaro.org>

--------------xm0X2AuPmpm5iK1LtNLX7ViQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDMuMjMgdW0gMDk6MjQgc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBU
aGlzIGRyaXZlciBoYXMgbm8gd2F5IHRvIGhhbmRsZSBkYW1hZ2UsIHRoZSByZWFzb24gdGhl
DQo+IGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZGlydHkoKSB3YXMgdXNlZCB3YXMgYmVjYXVz
ZSBJIGhhZCB0aGUNCj4gYW1iaXRpb24gdGhhdCB0aGUgZHJpdmVyIHdvdWxkIG9ubHkgc2Vu
ZCBvdXQgdXBkYXRlcyB0byBEU0kNCj4gY29tbWFuZCBkaXNwbGF5cyB3aGVuZXZlciBzb21l
dGhpbmcgY2hhbmdlZCwgc28gYXMgdG8NCj4gbWluaW1pemUgdHJhZmZpYy4NCj4gDQo+IEl0
IHR1cm5zIG91dCB0aGlzIGFtYml0aW9uIHdpdGggY29tbWFuZCBtb2RlIGlzbid0IHdvcmtp
bmcNCj4gaW4gcHJhY3RpY2UgYmVjYXVzZSBhbGwgdGhlIE1DREUgZG9lcyBpcyB0byBjcmVh
dGUgYQ0KPiBjb250aW51b3VzIHN0cmVhbSBvZiBEU0kgY29tbWFuZHMgYW5kIHdoaWxlIGl0
IGlzIHBvc3NpYmxlIHRvDQo+IHNlbmQgc2luZ2xlIGZyYW1lIHVwZGF0ZXMgd2l0aCBpdCwg
aXQncyBub3QgYmVlbiB3b3J0aHdoaWxlLg0KPiBTbyB3ZSBhcmUganVzdCBzZXR0aW5nIHVw
IGNvbnRpbnVvdXMgdXBkYXRlcy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+IFRob21hcyB5
b3UgY2FuIHBpY2sgdGhpcyBhcyBhIHByZXJlcXVpc2l0ZSBpbnRvIHlvdXIgc2VyaWVzDQo+
IG9yIGp1c3QgQUNLIGl0IGFuZCBJIHdpbGwgbWVyZ2UgaXQgaW50byBkcm0tbWlzYy1uZXh0
IHNvIHlvdQ0KPiBjYW4gYmFzZSB5b3VyIHdvcmsgb24gaXQuDQoNCkknbGwgYWRkIHRoZSBw
YXRjaCB0byBteSBkbWEtZmJkZXYgc2VyaWVzLiBUaGFua3MgYSBsb3QuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9k
cnYuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2Rl
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYw0KPiBpbmRleCA0YWVk
YjA1MGQyYTUuLmE1OTJhZDBkNzg4NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21jZGUvbWNkZV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Ry
di5jDQo+IEBAIC05NCw3ICs5NCw3IEBADQo+ICAgI2RlZmluZSBNQ0RFX1BJRF9NQUpPUl9W
RVJTSU9OX01BU0sgMHhGRjAwMDAwMA0KPiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnX2Z1bmNzIG1jZGVfbW9kZV9jb25maWdfZnVuY3MgPSB7DQo+IC0J
LmZiX2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZGlydHksDQo+ICsJLmZiX2Ny
ZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlLA0KPiAgIAkuYXRvbWljX2NoZWNrID0gZHJtX2F0
b21pY19oZWxwZXJfY2hlY2ssDQo+ICAgCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0LA0KPiAgIH07DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------xm0X2AuPmpm5iK1LtNLX7ViQ--

--------------8cmMygycvQzP9H0j0vVJFST2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQLMEgFAwAAAAAACgkQlh/E3EQov+C8
CQ/+IAgSTRVSDpKdpxDiFLHv3XndL43PwqDXK4aeL9DsE8RJIwG3zK1miqdBDyyjaS0K+1CGRoVK
QOvWfYf/76SHb1m1mNM851iYsLeiC4QK4iV13zxKOCSPQfCe5cxKouJYXYBocw8xG2YHCcL8UkcU
V1nPxuaoK0kL/JzzPbh1GxSJYDHjRl7DkeRrOFwgNhat2EnxDIMmKl0f1VS8ssRMxTIj4UdpMbmT
4LE1Rs+/EimcHibEvyHgTGV25v+zoW2wpIU2Ql1BVu9iu8Es//nV7MCNFyBS/pCtgntLm/3vZRH1
htWmqa6kHC3QslKShd53FrGTlr09K2gcUPYDAhaybaiNG98J1UZS/H4hAO7J8MgrH4AF+JMpnBBN
Hw1yn9VQYllFWb/qhXJcjSjtDVZ1QHBOQbslUS6ggDDSB8HkcVIhy/24oUEio0QhZWQ1bfj1sXFp
tBwGTAUsD/pyoj4LJCgAC1D5qQvafNtUhw/G3qOIbA0fXMaVGogWCVIKXTXL7Dhq+rNZDpWoKuA3
wP0X5A8xlp5lnEd6I0gPJxFB3LcVEbFkitYs28MaWEZnQNt8HEZdZSKRPFZ7CfbPjYiiUkrPrBK7
+sxPrGqpL+U86WdHL/Jtiee7bOo6nhjbLLcpEB97QMoIptZznbp97Q+qNJnalFxsrbRPU/GIQbiS
s48=
=sM/v
-----END PGP SIGNATURE-----

--------------8cmMygycvQzP9H0j0vVJFST2--
