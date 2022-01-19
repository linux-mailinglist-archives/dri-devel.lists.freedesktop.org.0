Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED943493DBD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B388A10E217;
	Wed, 19 Jan 2022 15:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2410E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:54:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 814E2212C5;
 Wed, 19 Jan 2022 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642607688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=huSQfD1kXWPxYY8LjOeU4PnuzXl1Fa3PIHCPfVNpPD4=;
 b=OxRHgpGHsiS9/qgPyLl2pav/JxQzvHxK34IoXxp3fnsLA3qPye7uIIcuJqhmHMixmeqabl
 wB7eS+pgOv3Ykrt9o57mOTGZCVuTT2nzsa/IG8JMWy82S7+BetcNbWLF9aDWC3Qr1Z/SRZ
 gmeEQsWM6isiMtCR7jx/INvWrIyr0MM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642607688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=huSQfD1kXWPxYY8LjOeU4PnuzXl1Fa3PIHCPfVNpPD4=;
 b=MZLDgg5D8Y6admaU+zjUjBRQLolKcDdEg53rAerqr4l7oLUQsN3J/2xp7whmKS2Vtwp11y
 0d0HLd08ApUmzIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F01B13F84;
 Wed, 19 Jan 2022 15:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eTw9Ekg06GHSEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Jan 2022 15:54:48 +0000
Message-ID: <83484eca-8562-bf76-78f1-75b626a59029@suse.de>
Date: Wed, 19 Jan 2022 16:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/ast: Create threshold values for AST2600
Content-Language: en-US
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220117083643.41493-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220117083643.41493-1-kuohsiang_chou@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UM0o5JZz0JfmaFfA8BBBd2b7"
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
Cc: hungju_huang@aspeedtech.com, airlied@linux.ie, tommy_huang@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com, luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UM0o5JZz0JfmaFfA8BBBd2b7
Content-Type: multipart/mixed; boundary="------------pbZ4Zwa0cbdW7pS18cwzXL1v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: hungju_huang@aspeedtech.com, airlied@linux.ie,
 tommy_huang@aspeedtech.com, airlied@redhat.com, arc_sung@aspeedtech.com,
 luke_chen@aspeedtech.com
Message-ID: <83484eca-8562-bf76-78f1-75b626a59029@suse.de>
Subject: Re: [PATCH] drm/ast: Create threshold values for AST2600
References: <20220117083643.41493-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20220117083643.41493-1-kuohsiang_chou@aspeedtech.com>

--------------pbZ4Zwa0cbdW7pS18cwzXL1v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMDk6MzYgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4g
VGhlIHRocmVzaG9sZCB2YWx1ZSBpcyB1c2VkIGZvciBBU1QyNjAwIG9ubHkuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLdW9Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVj
aC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDUg
KysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IDFjN2E1N2EwMy4u
N2YyZTI0OGE2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IEBAIC00NzEs
NyArNDcxLDEwIEBAIHN0YXRpYyB2b2lkIGFzdF9zZXRfY29sb3JfcmVnKHN0cnVjdCBhc3Rf
cHJpdmF0ZSAqYXN0LA0KPiAgIHN0YXRpYyB2b2lkIGFzdF9zZXRfY3J0dGhkX3JlZyhzdHJ1
Y3QgYXN0X3ByaXZhdGUgKmFzdCkNCj4gICB7DQo+ICAgCS8qIFNldCBUaHJlc2hvbGQgKi8N
Cj4gLQlpZiAoYXN0LT5jaGlwID09IEFTVDIzMDAgfHwgYXN0LT5jaGlwID09IEFTVDI0MDAg
fHwNCj4gKwlpZiAoYXN0LT5jaGlwID09IEFTVDI2MDApIHsNCj4gKwkJYXN0X3NldF9pbmRl
eF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGE3LCAweGUwKTsNCj4gKwkJYXN0X3Nl
dF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGE2LCAweGEwKTsNCj4gKwl9
IGVsc2UgaWYgKGFzdC0+Y2hpcCA9PSBBU1QyMzAwIHx8IGFzdC0+Y2hpcCA9PSBBU1QyNDAw
IHx8DQo+ICAgCSAgICBhc3QtPmNoaXAgPT0gQVNUMjUwMCkgew0KPiAgIAkJYXN0X3NldF9p
bmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGE3LCAweDc4KTsNCj4gICAJCWFz
dF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhhNiwgMHg2MCk7DQo+
IC0tDQo+IDIuMjcuMA0KPiANCg0KTWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------pbZ4Zwa0cbdW7pS18cwzXL1v--

--------------UM0o5JZz0JfmaFfA8BBBd2b7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHoNEcFAwAAAAAACgkQlh/E3EQov+Bj
TBAAqHNQCMhLLJVRD+PwOfYhzJrdCGFqVmqUFsq/etfNOgDANfIw1HcEeSlbLAtWHIZxvD/11C+q
lTz7YdEoXgyA4mDaW8RKllMZaUXfCt8HUpt2tnBd1t8dmrZ7/QJGuJet+ZvwAjSu2pcQqt8Z1hyL
sFV3XQSasx6ntFSBSkBJwvxTE3giJcH1unxwNfg6MRHpnBtP3UmhUzYIMbrlz63xdilKyePrdrkV
BxdH+tLD3l4/JOGsJpbvZMK7DaX2Wbvaavsuf3fNz87hCcp7HRWCoH2cnMWazhDzNKN8ikNN9WrU
+xy6gGShBDmmWJqFNYnVO38rU86Lb6QHtsUwXbZAIsIvPpuH6UdZYfdSbe5VdF9wjjgbjnQ7aMXL
0Iu3wMPI7KoNB4z9GnrBJPhVwAHoip5q3gXYdg4BsPT2jy3wzOmwWwrb9Mu4dPuiGyNZi819K9mV
yN9YomPYSsqRMJiRY9MfPK0K7T4elm7jWBhe9y0kzwtcPGoUbwZ6WwS6GId3QN1mWQ2tJr74rNur
DFmmT0OEqJqYf8PMJ2iTlKNbi9PMwyY+CufBQTsetjzXITxWd88s1fGlrD4m2Ax6GsYZg12jnzDx
J1WEW5h/YcIRnfVrFqAsb/pY//SXTcmmdWscSP0+OencE/FP8jifxA6w9cUFd3Uw3m8E1CP3EhFR
Kz8=
=+vsY
-----END PGP SIGNATURE-----

--------------UM0o5JZz0JfmaFfA8BBBd2b7--
