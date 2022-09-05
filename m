Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F45ACD68
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A8F10E203;
	Mon,  5 Sep 2022 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7610E203
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:08:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98DDF1FDB5;
 Mon,  5 Sep 2022 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662365288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw0bSizev1QPj7dDOUfBaBuCild7F8/32V3j/nya9bI=;
 b=WSyXRP2AxhaWwoZ2BS7zQ50AqQ2TrGXdzDIpLp+5iu79dMzkMLG4wBL0dz3mYQbX10aoGV
 8lBhKBIUL3HVJ3ZiTZwpyQIVivr2FiBI5bnhbMDEfVoFqNBHw3MvWrFxheVBN+vDFeS0X+
 XUq9/nKlDTfSQaiQVKhnB0C4S7wEPt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662365288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw0bSizev1QPj7dDOUfBaBuCild7F8/32V3j/nya9bI=;
 b=uPRS2d3Eqpvyhh++kN3Zr/3VjqZo52DyDum9fCOopOCP1o8J1QXdp8bMEQt7GdExj6CX4r
 GtFVmL8nnJsDQbBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 841E313A66;
 Mon,  5 Sep 2022 08:08:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mgdtH2iuFWOGAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:08:08 +0000
Message-ID: <40c21291-d7bb-0a51-84c2-06cc1fa8a68d@suse.de>
Date: Mon, 5 Sep 2022 10:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/12] drm/udl: Increase the default URB list size to 20
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-7-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-7-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hZVd5W33AIeiBbu7FE0UBBKY"
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
--------------hZVd5W33AIeiBbu7FE0UBBKY
Content-Type: multipart/mixed; boundary="------------TZKToeoA9RjmMeqb5TYkhnqC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <40c21291-d7bb-0a51-84c2-06cc1fa8a68d@suse.de>
Subject: Re: [PATCH 06/12] drm/udl: Increase the default URB list size to 20
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-7-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-7-tiwai@suse.de>

--------------TZKToeoA9RjmMeqb5TYkhnqC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEl0
IHNlZW1zIHRoYXQgdGhlIGN1cnJlbnQgc2l6ZSAoNCkgZm9yIHRoZSBVUkIgbGlzdCBpcyB0
b28gc21hbGwgb24NCj4gc29tZSBkZXZpY2VzLCBhbmQgaXQgcmVzdWx0ZWQgaW4gdGhlIG9j
Y2FzaW9uYWwgc3RhbGxzLiAgSW5jcmVhc2UgdGhlDQo+IGRlZmF1bHQgVVJCIGxpc3Qgc2l6
ZSB0byAyMCBmb3Igd29ya2luZyBhcm91bmQgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBU
YWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9tYWluLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jDQo+
IGluZGV4IDZhZWQ2ZTBmNjY5Yy4uMmI3ZWFmZDQ4ZWMyIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfbWFpbi5jDQo+IEBAIC0yMCw3ICsyMCw3IEBADQo+ICAgI2RlZmluZSBOUl9VU0Jf
UkVRVUVTVF9DSEFOTkVMIDB4MTINCj4gICANCj4gICAjZGVmaW5lIE1BWF9UUkFOU0ZFUiAo
UEFHRV9TSVpFKjE2IC0gQlVMS19TSVpFKQ0KPiAtI2RlZmluZSBXUklURVNfSU5fRkxJR0hU
ICg0KQ0KPiArI2RlZmluZSBXUklURVNfSU5fRkxJR0hUICgyMCkNCj4gICAjZGVmaW5lIE1B
WF9WRU5ET1JfREVTQ1JJUFRPUl9TSVpFIDI1Ng0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgdWRs
X3BhcnNlX3ZlbmRvcl9kZXNjcmlwdG9yKHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------TZKToeoA9RjmMeqb5TYkhnqC--

--------------hZVd5W33AIeiBbu7FE0UBBKY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVrmgFAwAAAAAACgkQlh/E3EQov+Ai
JRAAwa4mQ8/NfiP+y5GCW0VlTrooZTo+Fsn+l2HNYraJ+QkEG8zN1COKklyIG1rq7ZCx+h5B1eBD
YS3SbMXoffUb7dWSQIjaeV8hGyvs21UPV6P+FErxjDL7v6GjYcCX0DekiVr9B8S/IqRjc8WNlcmk
+DWkx5vYYD+VyxxPvjYnLN7jd6bn0vP/ZX3Cbdiw3A64QyhxWWBFWC5sm38Nac0Pscb5UYgl+WIF
IXP4SLNtpTqFkJ5Hw9fREeJfzYxJP/Lj9x6TTWkYQ89c2BppC6jMn0Ten5qe9Ntp4cf6KakWu+UJ
p6ajAr2psK6gWp/CHJRgxL8lWoArmZlgnfvsCXSu2U3A0VGnrbb4v+CgHh6qmBLHUbyThzIN9xFS
/G42SPTsPCW/59RgL6tNTHpKAIPC1Pr9s1Mhy2m6piKkwFyUnACg+TtphF5TarAmF/oQ6SYUVssm
eR4CGaIskSg5bc+GyBuwcYGFd4j0yV38NZ6eR2VSEMoe2s3qDrVNOT6NDZcF9BwDNBo5BCQn0ctT
Zse5J34zxVG1i61vv83LQT48jTDQRZvEIMwj6CTTQxST1eyvI8gTQQgyNVJGPyJgaHbMiJqPtRZo
UEwF7/kAO44HnRuEVUi82kvi5YUfWP0AD+Ybeh9RB3P7YonCGb3+W4HPCwPE+w8nj9iMBleObY87
URQ=
=Mg43
-----END PGP SIGNATURE-----

--------------hZVd5W33AIeiBbu7FE0UBBKY--
