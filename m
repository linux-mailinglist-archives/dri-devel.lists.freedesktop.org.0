Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0075505DED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 20:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4810E008;
	Mon, 18 Apr 2022 18:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A3710E008
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 18:13:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 490F01F37E;
 Mon, 18 Apr 2022 18:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650305587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=si23PaLEnuzr6+ft/I7ng5XB22HBdAUIVX/eVGYxNrU=;
 b=jZDVQuSkKXj+dd95S2Ebt07rY0SsNUTJxdp+jZmcF/N7iCLqrlV2TTXqNiesduHdjYeWYS
 gT9qBsjBWiiGBkFkfPMjXQc4uKVYGPPForjdLN8oAAQSLr8r/cFEwd0UNBN/Is+lYMyRPS
 gd09aBcMaIX7ASR0VPALBjxDtd6QHoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650305587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=si23PaLEnuzr6+ft/I7ng5XB22HBdAUIVX/eVGYxNrU=;
 b=sGeUgW9pw0RL1vLKcb8hbMoC2E5tyLOAaASDd+XwvaiQYP7oTQC+U1xNichzhKuqZrUevN
 wRYTS8c6/6BOc/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D2C213A9B;
 Mon, 18 Apr 2022 18:13:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KqH1ATOqXWJdegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Apr 2022 18:13:07 +0000
Message-ID: <2615cd84-8844-0506-c5d4-19629bf071c6@suse.de>
Date: Mon, 18 Apr 2022 20:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
 <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
 <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de> <87tub55lk8.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87tub55lk8.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NYgVkb8zlIJrl7410LdrxqRJ"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NYgVkb8zlIJrl7410LdrxqRJ
Content-Type: multipart/mixed; boundary="------------2t0xWST37vrl2cdNwDnWL520";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2615cd84-8844-0506-c5d4-19629bf071c6@suse.de>
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
 <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
 <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de> <87tub55lk8.fsf@intel.com>
In-Reply-To: <87tub55lk8.fsf@intel.com>

--------------2t0xWST37vrl2cdNwDnWL520
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFuaQ0KDQpBbSAwNy4wNC4yMiB1bSAxMDo0NSBzY2hyaWViIEphbmkgTmlrdWxhOg0K
Li4uDQo+Pg0KPj4gSSB0aGluayBhbm90aGVyIGlkZWEgdGhhdCBjb3VsZCB3b3JrIGlzIHRv
IHVzZSBhbiBpbnRlcm1lZGlhdGUgc3ltYm9sLg0KPj4gRm9yIERQLCBkcml2ZXJzIHdvdWxk
IHNlbGVjdCB0aGUgdHJpc3RhdGUgRFBfSEVMUEVSLCB3aGljaCBpbiB0dXJuDQo+PiBzZWxl
Y3RzIHRyaXN0YXRlIERJU1BMQVlfSEVMUEVSIGFuZCBib29sZWFuIERJU1BMQVlfRFBfSEVM
UEVSLiAgQnV0IHRoaXMNCj4+IHdvdWxkIHJlcXVpcmUgYSAndXNlbGVzcycgc3ltYm9sIERQ
X0hFTFBFUiBvbmx5IGZvciBjb252ZW5pZW5jZS4gIEl0J3MNCj4+IGFuIGV2ZW4gbGVzcyBv
cHRpbWFsIHNvbHV0aW9uLCBpdCBzZWVtcy4NCj4gDQo+IERvY3VtZW50YXRpb24va2J1aWxk
L2tjb25maWctbGFuZ3VhZ2UucnN0Og0KPiANCj4gICAgTm90ZToNCj4gCXNlbGVjdCBzaG91
bGQgYmUgdXNlZCB3aXRoIGNhcmUuIHNlbGVjdCB3aWxsIGZvcmNlDQo+IAlhIHN5bWJvbCB0
byBhIHZhbHVlIHdpdGhvdXQgdmlzaXRpbmcgdGhlIGRlcGVuZGVuY2llcy4NCj4gCUJ5IGFi
dXNpbmcgc2VsZWN0IHlvdSBhcmUgYWJsZSB0byBzZWxlY3QgYSBzeW1ib2wgRk9PIGV2ZW4N
Cj4gCWlmIEZPTyBkZXBlbmRzIG9uIEJBUiB0aGF0IGlzIG5vdCBzZXQuDQo+IC0tPglJbiBn
ZW5lcmFsIHVzZSBzZWxlY3Qgb25seSBmb3Igbm9uLXZpc2libGUgc3ltYm9scw0KPiAtLT4J
KG5vIHByb21wdHMgYW55d2hlcmUpIGFuZCBmb3Igc3ltYm9scyB3aXRoIG5vIGRlcGVuZGVu
Y2llcy4NCj4gCVRoYXQgd2lsbCBsaW1pdCB0aGUgdXNlZnVsbmVzcyBidXQgb24gdGhlIG90
aGVyIGhhbmQgYXZvaWQNCj4gCXRoZSBpbGxlZ2FsIGNvbmZpZ3VyYXRpb25zIGFsbCBvdmVy
Lg0KPiANCj4gTW9zdCBvZiB0aGUgZGlmZmljdWx0IEtjb25maWcgaXNzdWVzIEkndmUgZW5j
b3VudGVyZWQgb3ZlciB0aGUgeWVhcnMNCj4gY29tZSBmcm9tIG5vdCBmb2xsb3dpbmcgdGhl
IGFib3ZlIHR3byBydWxlcy4gUGVvcGxlIGJyZWFrIHRob3NlIHJ1bGVzDQo+IGZvciAiY29u
dmVuaWVuY2UiLCBjYXVzaW5nIGEgbG90IG9mIGluY29udmVuaWVuY2UgZG93biB0aGUgbGlu
ZS4NCg0KSSBoYXZlIG1lYW53aGlsZSB1cGRhdGVkIHRoZSBwYXRjaHNldCBhbmQgYWxsIG5l
dyBib29sZWFuIG9wdGlvbnMgYXJlIA0KaW50ZXJuYWwuIE5vIHNlbGVjdCB3aWxsIGJlIHBl
cmZvcm1lZCBvbiAndmlzaWJsZScgc3ltYm9scy4gU28gaXQgc2hvdWxkIA0KYmUgZmluZS4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiAN
Cj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4gICAgLS0NCj4+
PiBCZXN0IHJlZ2FyZHMsDQo+Pj4NCj4+PiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMNCj4+
PiBMaW51eCBFbmdpbmVlcmluZw0KPj4+IFJlZCBIYXQNCj4+Pg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------2t0xWST37vrl2cdNwDnWL520--

--------------NYgVkb8zlIJrl7410LdrxqRJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJdqjIFAwAAAAAACgkQlh/E3EQov+Ct
Yw//cu3kH4SpUFNB5AhPGrZ1COPofoDfRvpgykFzG3v//DuliZ3KO5cCcZmAC6dExoK1EoHCqSKr
TcSzA1pnjtLQnATGgsEG8qkV+RB7WcPUH/JJ8XQ36+cHUMbb4mv3CsUSkQgOYZI8mFX466MXCMHM
4JMcFyOKpQNeyGE5+KRFV7iiGSwptArg8O24d0QknW4vCwQLyOT4bgWwZX/QRLM6gN/FMC+c7G7l
2A5u5rf6Wbk+1S+kAPJrxCnHJwCHAGLSiptNIVduRg7YSI+P3UrfiBzaQMjBTsbDrAca+cuEZMBy
xrX3TmxG1g2zAtj5+Haq1MryOPmDtOqw8PjJdcxddb1tVNB5cb4lluRUclLgT6mkDIlFkZy9g+L+
s3Xa+muDNgTTkbVKXXoaC8k9KQevoxEuGH0Y2vic7pScQy8s/JakB59oc3qbfvJ+fSGdjBxNcz4+
jmOVyLYRBHYTL1w6e/xHLJ4lewfutkdbrlr5Z2YdsWuqIqelAUftKH3Wt5QWYVdvH3CUIb/eTzI9
smmdOFKI+5I+wztnN305TAIxtvA4psZzG7LSlphRoO4vz0omgxG0ON9RbrzmyyWb6nWT5DOa0P6b
D/KofUTpTTJ/uVSgQ+NzLycgCRMmIB8VG0doKZX5IRGjuJJc4r3GWwoOK3Q/udZ9vg14lxHmvU0w
WfI=
=oGKF
-----END PGP SIGNATURE-----

--------------NYgVkb8zlIJrl7410LdrxqRJ--
