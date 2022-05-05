Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E851B926
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0336B10E676;
	Thu,  5 May 2022 07:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5895D10E676
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:32:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0802D1F37F;
 Thu,  5 May 2022 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651735956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXstb6qIrKmVpMJGfGqh1asVn65N4FtaTqGBmpBFdTg=;
 b=FaYTKslVJR6IAWMRbeaZV7z6jvZN8xFr4rrMBUnqQ4WtfUN+sTrDnqjuo8b5sCNZPBfRJk
 9vFC0eug3w/WBuV1lZ6eI9ga7UN6gt2tulEdIkNdipTrd4ad1+SiHsMjUSBd05L7GsSceS
 CX07Sqe+1n7TVeJR0mt4dng8f4z1o44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651735956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXstb6qIrKmVpMJGfGqh1asVn65N4FtaTqGBmpBFdTg=;
 b=hmMyJaBa9eEWbNIyvRnlWX8qDIgc3dYsl98gLL2ta7s7MhCH6aBUSejNv76DsnM+MQ0xLt
 /CDtHdlYri4sK8BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4CE613A65;
 Thu,  5 May 2022 07:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A/n1MpN9c2JRcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 07:32:35 +0000
Message-ID: <f0f408f5-f6e9-79d4-809d-6fa197afd110@suse.de>
Date: Thu, 5 May 2022 09:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm: simplify the return expression of ast_drm_resume()
Content-Language: en-US
To: cgel.zte@gmail.com, airlied@redhat.com
References: <20220505022208.57157-1-chi.minghao@zte.com.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220505022208.57157-1-chi.minghao@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XBHppxJhtYzlIVTtnikAC9w6"
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XBHppxJhtYzlIVTtnikAC9w6
Content-Type: multipart/mixed; boundary="------------hIdRGWqeECLwcxDrefsYqbec";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: cgel.zte@gmail.com, airlied@redhat.com
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Message-ID: <f0f408f5-f6e9-79d4-809d-6fa197afd110@suse.de>
Subject: Re: [PATCH] drm: simplify the return expression of ast_drm_resume()
References: <20220505022208.57157-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220505022208.57157-1-chi.minghao@zte.com.cn>

--------------hIdRGWqeECLwcxDrefsYqbec
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDUuMjIgdW0gMDQ6MjIgc2NocmllYiBjZ2VsLnp0ZUBnbWFpbC5jb206
DQo+IEZyb206IE1pbmdoYW8gQ2hpIDxjaGkubWluZ2hhb0B6dGUuY29tLmNuPg0KPiANCj4g
U2ltcGxpZnkgdGhlIHJldHVybiBleHByZXNzaW9uLg0KPiANCj4gUmVwb3J0ZWQtYnk6IFpl
YWwgUm9ib3QgPHplYWxjaUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaW5naGFv
IENoaSA8Y2hpLm1pbmdoYW9AenRlLmNvbS5jbj4NCg0KVGhhbmtzIGEgbG90LiBJIGFkZGVk
IHlvdXIgcGF0Y2ggdG8gZHJtLW1pc2MtbmV4dC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyB8IDcgKy0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IGluZGV4IDc0NjVjNGYwMTU2YS4uNzYw
YjI3OTcxNTU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBAQCAtMTU5LDE1
ICsxNTksMTAgQEAgc3RhdGljIGludCBhc3RfZHJtX3RoYXcoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikNCj4gICANCj4gICBzdGF0aWMgaW50IGFzdF9kcm1fcmVzdW1lKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpDQo+ICAgew0KPiAtCWludCByZXQ7DQo+IC0NCj4gICAJaWYgKHBjaV9l
bmFibGVfZGV2aWNlKHRvX3BjaV9kZXYoZGV2LT5kZXYpKSkNCj4gICAJCXJldHVybiAtRUlP
Ow0KPiAgIA0KPiAtCXJldCA9IGFzdF9kcm1fdGhhdyhkZXYpOw0KPiAtCWlmIChyZXQpDQo+
IC0JCXJldHVybiByZXQ7DQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0dXJuIGFzdF9kcm1fdGhh
dyhkZXYpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50IGFzdF9wbV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------hIdRGWqeECLwcxDrefsYqbec--

--------------XBHppxJhtYzlIVTtnikAC9w6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzfZMFAwAAAAAACgkQlh/E3EQov+Ap
mBAAjJrVm7nKu11xecXvBNDzIxiMSFxXqDDffYT3K5Wso1Ht5T3L6grX3bq+HpCTle6e8Jf4nAXm
zskg7puoC27rt2EmA4809jnRU7hsfc06GijopIH4qwZVlV4tLBXsS3pA2PMnwjFfJxbO2XUrOCU7
Xa/9+uEbu4wNQQRO6qbimDHE5BZLExBy9KeGXrKZvKEoYGQ0uXN5xxcU3uCxmlSlvwMjf8gj7UPG
MiWEGGkKo5f5cYpAFp9doagh5TNKmYpD/62BDH7lEbvzZVu0Bs0w9ldMkb0WaSJrABT7Hcgtq/pM
LO4iLxaXllFH7Gp9xwZmUvud2GDcxPj7antjB8eQTDn3Rhl7YF+DhusZczPbkOkNyBNOq+bZww4R
akNxvwMH75JVZD/bem04cx14xgHLn7qAXUfkjVoWiRfVPcsWQ5ggAJ3/Y63lmDAWpANigZOcBE88
Icj2p2g4IR+bRx7al1a/3Dx34udWGW1yRArODfEQZNkxFK6nKcoWSzT11kzYXnVnaKN97p+YhzB8
lGzvSXxuByJjZozOkNJmSbRi7Xtu2J4rtMdYPzIrmU7JiIXbJtO5WJV3n3G+wUw/WxYmIM3NbCZb
pGNzQc1rzbgnaWcVidAT041Htk1hr/bnnt8GL4RDn852Sd99FTIZf2+27G2LdR3KF07fHKel792p
suU=
=uKFD
-----END PGP SIGNATURE-----

--------------XBHppxJhtYzlIVTtnikAC9w6--
