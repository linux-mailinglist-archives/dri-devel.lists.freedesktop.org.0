Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42D416F86
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 11:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450B16E1A3;
	Fri, 24 Sep 2021 09:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431666E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 09:50:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E9F71FFDF;
 Fri, 24 Sep 2021 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632477053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXSzZXDeq6sDETrwr8IYwHXWL5FPSSLWFDjZztxONpY=;
 b=zm2A0vFDp8f7D50gwfSfI3mGnD2AXntPkuajuz2cURQydVH1zu4+cQvBYABAMTGrJ75eHH
 WXLTNQMAono9UO8LqnKMnNJg1XoLmWAYhHJG/CSW0Q29b+Kne1aRUjnz0IgiPUsHhmXnzZ
 LtU6b0gkEbIGolAflxHbKmkYJ6/0o0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632477053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXSzZXDeq6sDETrwr8IYwHXWL5FPSSLWFDjZztxONpY=;
 b=9YHjSReWjJ9CQ54aNqYaVG4TVEvh+0d9d4mUObwBvX8WTM4j362MqPX55MVTuSy9lKSw0S
 XiNK2KsEEJgq/aCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C03F139F0;
 Fri, 24 Sep 2021 09:50:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7f2cEX2fTWEtPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Sep 2021 09:50:53 +0000
Message-ID: <dc360ac4-a731-bb87-b9ae-bf3addb54448@suse.de>
Date: Fri, 24 Sep 2021 11:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH -next] drm/gma500: Fix wrong pointer passed to PTR_ERR()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, airlied@linux.ie, patrik.r.jakobsson@gmail.com
References: <20210924094040.3631675-1-yangyingliang@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210924094040.3631675-1-yangyingliang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xNNSF60el86I171luMAd6kcc"
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
--------------xNNSF60el86I171luMAd6kcc
Content-Type: multipart/mixed; boundary="------------v6xhW1svHnWNsYbKMGjvB0Od";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, airlied@linux.ie, patrik.r.jakobsson@gmail.com
Message-ID: <dc360ac4-a731-bb87-b9ae-bf3addb54448@suse.de>
Subject: Re: [PATCH -next] drm/gma500: Fix wrong pointer passed to PTR_ERR()
References: <20210924094040.3631675-1-yangyingliang@huawei.com>
In-Reply-To: <20210924094040.3631675-1-yangyingliang@huawei.com>

--------------v6xhW1svHnWNsYbKMGjvB0Od
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDkuMjEgdW0gMTE6NDAgc2NocmllYiBZYW5nIFlpbmdsaWFuZzoNCj4g
UFRSX0VSUigpIHNob3VsZCBhY2Nlc3MgdGhlIHZhbHVlIGp1c3QgdGVzdGVkIGJ5IElTX0VS
UigpLA0KPiBvdGhlcndpc2UgdGhlIHdyb25nIGVycm9yIGNvZGUgd2lsbCBiZSByZXR1cm5l
ZC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2Vp
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KDQpJbmRlZWQsIHRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpJJ2xsIGFkZCB0
aGUgZml4IHdpdGggdGhlIGNvcnJlY3QgRml4ZXMgdGFnIHNvb24uDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2
LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0KPiBpbmRleCAzZDAz
NmQyYTNiMjkuLjdhMTBiYjM5ZWYwYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9wc2JfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
ZHJ2LmMNCj4gQEAgLTQ1NCw3ICs0NTQsNyBAQCBzdGF0aWMgaW50IHBzYl9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQp
DQo+ICAgDQo+ICAgCWRldl9wcml2ID0gZGV2bV9kcm1fZGV2X2FsbG9jKCZwZGV2LT5kZXYs
ICZkcml2ZXIsIHN0cnVjdCBkcm1fcHNiX3ByaXZhdGUsIGRldik7DQo+ICAgCWlmIChJU19F
UlIoZGV2X3ByaXYpKQ0KPiAtCQlyZXR1cm4gUFRSX0VSUihkZXYpOw0KPiArCQlyZXR1cm4g
UFRSX0VSUihkZXZfcHJpdik7DQo+ICAgCWRldiA9ICZkZXZfcHJpdi0+ZGV2Ow0KPiAgIA0K
PiAgIAlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsNCj4gDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------v6xhW1svHnWNsYbKMGjvB0Od--

--------------xNNSF60el86I171luMAd6kcc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFNn3wFAwAAAAAACgkQlh/E3EQov+CH
eQ//agu9+u7cFEW+c2t0J7i86f1KjClsUV66JZlTW5PVlySYHOEMYS8iP9pASRAhX2dRjxRtFR0/
s4skcpAf0zzWd2JKeYzItLmgfIjeodA5M/8OrQaYjPpo8cAChjItpvF1i5TOjOFixzuoHAu20+R2
Z/OJhEcT/FasRVdGNl2yy4Ch11MRXHCILIAFXazstFFT4op5VH7tBS/m2KYpxcepIbxPSGInufzS
A96zq8UwJ3SSxwrp7D71vn2sjkKyqdcYeNARrEKdBdgt2w9XJu3HLw0cgHdrkPsDSPzaYkqy3DMU
dvnpuBkfwBPrmPn4BdQLvBzl4bIPJtvW6IsEcsNXJ/VifbSVNu8XUveo2YQh54wxVKFexJze4hsD
iWaWTyiT/kavzgNRuXVX0m6pWFTorHaLxNhwPF2JxWvP6EPJ8KW1lCukmlMBntUfgLF9SCmaZAJX
bREUVDmikhknbiGzFiYNUhVETa9P3pfu2Dozv5FoOLBvSjs37gWmN3D+hnP+p60mLbE8rBSW873b
n72s1kZTQGweJt6D8umdOMk+D/HDR9pRer9CNCg6p+6AqJjAN5Fx4qhLNlnQFmdf3c94MElb3JHY
NGbOd0xXgezEtUScFeAwrYxyg0X74UNbzzpVTI9xNQsWkb7i3tkNHbg6Pt9IticsADFqXshkJS06
xNw=
=IGKo
-----END PGP SIGNATURE-----

--------------xNNSF60el86I171luMAd6kcc--
