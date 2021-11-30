Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022046308E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189146E45E;
	Tue, 30 Nov 2021 10:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B636E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:03:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A6EF212C5;
 Tue, 30 Nov 2021 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638266620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=03JLIC9fjfdV6XrpzK/YgUDK7BA35BqlRCl1TRGN+Zw=;
 b=t59HqKambuUz6yuOKeL0eve1ms6ozXuGlY3OpGCUCjRu5s1JBHx67OY+DDE9gItr0mTcx8
 IVHUiOcYOLEWFFL1UB9kdU5DiIJCZ9blgmhODiA2Lah6RM5tNQS2DWawpssJk+pmGceZyn
 u/shvt31fCxCF8+xsLabUL9oDjbUbOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638266620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=03JLIC9fjfdV6XrpzK/YgUDK7BA35BqlRCl1TRGN+Zw=;
 b=m9/euoAzffv1QOAOOlTzIT9fDvWslC2tkku2r75F647yzQVk/BanB6IlGyq2LfkfGU5cg8
 sWV6I2bcaCFq0HCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDF5A13C98;
 Tue, 30 Nov 2021 10:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZotBNfv2pWG3KgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Nov 2021 10:03:39 +0000
Message-ID: <f84bc3ce-5a9e-6f3a-0e23-eb8adc05b13f@suse.de>
Date: Tue, 30 Nov 2021 11:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/7] agp: Various minor fixes
Content-Language: en-US
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
References: <20211112141628.12904-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GPvq20nNt2Y3R54vcMxvkwC2"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GPvq20nNt2Y3R54vcMxvkwC2
Content-Type: multipart/mixed; boundary="------------RFGvPO7iehQXle5AYrPhyVCE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f84bc3ce-5a9e-6f3a-0e23-eb8adc05b13f@suse.de>
Subject: Re: [PATCH 0/7] agp: Various minor fixes
References: <20211112141628.12904-1-tzimmermann@suse.de>
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>

--------------RFGvPO7iehQXle5AYrPhyVCE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZyEgQW55IGZlZWRiYWNrIG9uIHRoZXNlIHBhdGNoZXM/DQoNCkFtIDEyLjExLjIxIHVt
IDE1OjE2IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IEZpeCBhIG51bWJlciBvZiBj
b21waWxlciB3YXJuaW5ncyBpbiB0aGUgQUdQIGRyaXZlcnMuIE5vIGZ1bmN0aW9uYWwNCj4g
Y2hhbmdlcy4NCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICg3KToNCj4gICAgYWdwOiBSZW1v
dmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4gICAgYWdwOiBJbmNsdWRlICJjb21wYXRfaW9j
dGwuaCIgd2hlcmUgbmVjZXNzYXJ5DQo+ICAgIGFncDogRG9jdW1lbnRhdGlvbiBmaXhlcw0K
PiAgICBhZ3AvYXRpOiBSZXR1cm4gZXJyb3IgZnJvbSBhdGlfY3JlYXRlX3BhZ2VfbWFwKCkN
Cj4gICAgYWdwL252aWRpYTogSWdub3JlIHZhbHVlIHJldHVybmVkIGJ5IHJlYWRsKCkNCj4g
ICAgYWdwL3N3b3JrczogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnY3VycmVudF9zaXplJw0K
PiAgICBhZ3AvdmlhOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdjdXJyZW50X3NpemUnDQo+
IA0KPiAgIGRyaXZlcnMvY2hhci9hZ3AvYXRpLWFncC5jICAgIHwgMTAgKysrKysrKystLQ0K
PiAgIGRyaXZlcnMvY2hhci9hZ3AvYmFja2VuZC5jICAgIHwgIDIgKysNCj4gICBkcml2ZXJz
L2NoYXIvYWdwL2Zyb250ZW5kLmMgICB8ICA0ICsrKy0NCj4gICBkcml2ZXJzL2NoYXIvYWdw
L252aWRpYS1hZ3AuYyB8ICA2ICsrKy0tLQ0KPiAgIGRyaXZlcnMvY2hhci9hZ3Avc3dvcmtz
LWFncC5jIHwgIDUgKy0tLS0NCj4gICBkcml2ZXJzL2NoYXIvYWdwL3ZpYS1hZ3AuYyAgICB8
ICAzIC0tLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjMzLjENCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------RFGvPO7iehQXle5AYrPhyVCE--

--------------GPvq20nNt2Y3R54vcMxvkwC2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGl9vsFAwAAAAAACgkQlh/E3EQov+CA
+g//QqX+2loLojzqdFQlFcc+vQr/iwRoXlEB7RbAo4fcTZLgOJupnbgANxVe98Y4y1tNXnQ6vVE6
AjlNWdnRqBPoQxJUJDyDzEvidpRPe81gKb8qmLA0wgL+eRNC55P/D5R2wV+Q7t+Oa1ovsIARQ80M
sHaE6QhWvjA8DX47S8e79B6EsHsDbd/hdz8v+h3Jw9oxbSIK3KPrk3Vd55tNaFnmdIxZJp7a76e/
JG1P46UmZt3EjQxoa4j82HOaNWtL0eIxo4ryQ7y2IhP0nEAKQXJr/vUz2fZKSkk3NjQXZEl6sxWZ
sWIyTcWhVDK3Xofyif7FXH/zRBgB4nWqLnkuXdMhfstgDSTq1MaJa7kV2o3EYIUGQ4LRittBE3X1
7NTPccNfDBImipWBLrEnBsJSm2TnFUM1OCcugf5jlESX+Cj4z3PYhZCuBMEirgLtYLC8rXAtSe1Z
C09jRVQ3ZerORTynKv+Dvsh/Ddq4QMmVjAmH60Z4EplMS6d5DixtWas+G/h1QGAB13gESplxi6DD
gdNBKzY05K6rFgfbooyMnrBBHaRPviS+s0cjD4PSelTmrWL7tH8rEqvoqvWM1Lyu/mnQVayN8fNQ
QXWzV4S78ImRYoH1HUx3TJbEYXEKYuTO5iAheIN0W3vN+PkAZfIak3EyZivbXCRdnb9h8zNdGyQP
3to=
=j1//
-----END PGP SIGNATURE-----

--------------GPvq20nNt2Y3R54vcMxvkwC2--
