Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF36FF17C
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662110E09C;
	Thu, 11 May 2023 12:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDB10E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 12:27:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A415821BEE;
 Thu, 11 May 2023 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683808019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xy1l2ss8E338uG329wii5yR77yH6SJsF4p9AZPUdgMY=;
 b=mla5Tjn/xcmFfQojDy2kLlbUDzspUu5niuFvnIaQKIkFchSoAhcp5iz7hkkLldYKsApK8F
 L7RbD6L4K5MBDHE5vF5EG6FPJrdQDJRHixO6HGmgu0Zm1osnZpsGhM8wXeeOpi6Jls+H4t
 fDwflVN7Dd3Zjek1ZZDx5tT1kfD/ikY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683808019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xy1l2ss8E338uG329wii5yR77yH6SJsF4p9AZPUdgMY=;
 b=VBi0nRUFr4+1/cl0qWjrde72nDuaI1P/c2aLYox2QVwV95qQgQAwqL7NlKoLCy3bOAmAOA
 ZBL/8Kn0IuYb2PCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 70914134B2;
 Thu, 11 May 2023 12:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f4yJGhPfXGStAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 12:26:59 +0000
Message-ID: <3cdf3215-99ac-5000-1911-28639c4e6248@suse.de>
Date: Thu, 11 May 2023 14:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] drm/mgag200: Fix gamma lut not initialized.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230510131034.284078-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230510131034.284078-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ep00Q1gUqxYrBb4sUMKF3PpG"
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
Cc: Phil Oester <kernel@linuxace.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ep00Q1gUqxYrBb4sUMKF3PpG
Content-Type: multipart/mixed; boundary="------------0Gsj77Aht7BoEG0XSjodIJB6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Cc: stable@vger.kernel.org, Phil Oester <kernel@linuxace.com>
Message-ID: <3cdf3215-99ac-5000-1911-28639c4e6248@suse.de>
Subject: Re: [PATCH v2] drm/mgag200: Fix gamma lut not initialized.
References: <20230510131034.284078-1-jfalempe@redhat.com>
In-Reply-To: <20230510131034.284078-1-jfalempe@redhat.com>

--------------0Gsj77Aht7BoEG0XSjodIJB6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjMgdW0gMTU6MTAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFdoZW4gbWdhZzIwMCBzd2l0Y2hlZCBmcm9tIHNpbXBsZSBLTVMgdG8gcmVndWxhciBhdG9t
aWMgaGVscGVycywNCj4gdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBnYW1tYSBzZXR0aW5n
cyB3YXMgbG9zdC4NCj4gVGhpcyBsZWFkcyB0byBhIGJsYWNrIHNjcmVlbiwgaWYgdGhlIGJp
b3MvdWVmaSBkb2Vzbid0IHVzZSB0aGUgc2FtZQ0KPiBwaXhlbCBjb2xvciBkZXB0aC4NCj4g
DQo+IHYyOiByZWJhc2Ugb24gdG9wIG9mIGRybS1taXNjLWZpeGVzLCBhbmQgYWRkIENjIHN0
YWJsZSB0YWcuDQoNCkxvb2tzIGdvb2QuIFBsZWFzZSBhZGQgdGhlIHBhdGNoIHRvIGRybS1t
aXNjLWZpeGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBMaW5rOiBodHRw
czovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIxNzExNTUNCj4gRml4
ZXM6IDFiYWY5MTI3YzQ4MiAoImRybS9tZ2FnMjAwOiBSZXBsYWNlIHNpbXBsZS1LTVMgd2l0
aCByZWd1bGFyIGF0b21pYyBoZWxwZXJzIikNCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwu
b3JnPg0KPiBUZXN0ZWQtYnk6IFBoaWwgT2VzdGVyIDxrZXJuZWxAbGludXhhY2UuY29tPg0K
PiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMg
fCA1ICsrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggMGE1YWFm
NzgxNzJhLi41NzZjNGM4MzhhMzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfbW9kZS5jDQo+IEBAIC02NDAsNiArNjQwLDExIEBAIHZvaWQgbWdhZzIwMF9j
cnRjX2hlbHBlcl9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0
IGRybV9hdG9taWNfDQo+ICAgCWlmIChmdW5jcy0+cGl4cGxsY19hdG9taWNfdXBkYXRlKQ0K
PiAgIAkJZnVuY3MtPnBpeHBsbGNfYXRvbWljX3VwZGF0ZShjcnRjLCBvbGRfc3RhdGUpOw0K
PiAgIA0KPiArCWlmIChjcnRjX3N0YXRlLT5nYW1tYV9sdXQpDQo+ICsJCW1nYWcyMDBfY3J0
Y19zZXRfZ2FtbWEobWRldiwgZm9ybWF0LCBjcnRjX3N0YXRlLT5nYW1tYV9sdXQtPmRhdGEp
Ow0KPiArCWVsc2UNCj4gKwkJbWdhZzIwMF9jcnRjX3NldF9nYW1tYV9saW5lYXIobWRldiwg
Zm9ybWF0KTsNCj4gKw0KPiAgIAltZ2FnMjAwX2VuYWJsZV9kaXNwbGF5KG1kZXYpOw0KPiAg
IA0KPiAgIAlpZiAoZnVuY3MtPmVuYWJsZV92aWRyc3QpDQo+IA0KPiBiYXNlLWNvbW1pdDog
YTI2Y2MyOTM0MzMxYjU3YjVhNzE2NGJmZjM0NGYwYTJlYzI0NWZjMA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------0Gsj77Aht7BoEG0XSjodIJB6--

--------------ep00Q1gUqxYrBb4sUMKF3PpG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRc3xIFAwAAAAAACgkQlh/E3EQov+DH
txAAi93YTwBzlMczeRk501ES8kZbz9M923Dhu1mweDhVf1CPwsTtOLl5ETSu3kOBZNYZQwGegOPH
GDWi0p/yGJ2SsLy1gEIlm2WA0NdQS+qf15C26Ae+O4ukHCYyS0+rydGkAD07mhcXrwJivwuFJEe8
TFj0DL5h/POmJCkLlUyeIldS/iRqD6+7p2u/BnpJRiCDw4Br8nysEsIxHb/nv7n3brB2UFueM2R6
vVbHfWpeM4bpzMRLVbcdbBnT84ikHnnlAuFVc3AB5vlOyQLayDw7stt8C24MlVubRSCZcqOCt8r1
d0oTjhNNPMcbQ2HtgRgkesPhFay5hJP1Tn+GIK17KjoG2JiuRKlieDaB5mJKQrMMFAvlcxXxNXit
IOoL7W+A7xsgXYISNDXOYxGoJoXt4I2M8dTc/sLOG2a2vtfq8HkDf1O8gNsE/WnyRYT4DMaKqKWu
eVn9Y1eiotkoX3zqfmt32KUYAGgZMrmO2CU/ABwjGL6NHVwbb8T39CeCiMie0rmFT9QxVNXnJSy6
JyEvtepeu/Nn5tEll28mrHb0O5E9vfhttIMu68qDu60j7pZ2WYpGpW8EXMaei6Lz0nK1+snQ9Nzh
+Y9pFjuvhByjgDEoFAcoHuBawjX2OPrSt2gc7un2gezl7aZC66UFHiOKDrA+SdQP6hmZaGb7AB0H
dOk=
=DBC5
-----END PGP SIGNATURE-----

--------------ep00Q1gUqxYrBb4sUMKF3PpG--
