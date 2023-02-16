Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3B6993D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7C10E17A;
	Thu, 16 Feb 2023 12:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720610E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:03:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B537F1FE56;
 Thu, 16 Feb 2023 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676548982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d67c9qdRI89d74h17k4dk/pFOIXSWUw6WOPM+4sgU9M=;
 b=kDfr3Q9wiL0PMEC6/+cokNqJQWhrkFHofEIe3AwgM1ZiDwwMrGseg0vjFJj/mnWRsd38VE
 mUDnEBPAdQEqww4RkEDhRMe32pL1ySBl9U3l+6HXtg55CO8gdyI6bsOB66sP01soKL61mk
 4ahPEWOVpuqfsC84UtR8PcwtWUqZfDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676548982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d67c9qdRI89d74h17k4dk/pFOIXSWUw6WOPM+4sgU9M=;
 b=dVX1a7S3rsEG8Jg9myQcxvAdnUSh5Cg9KXP24+DQj9eAfn4GZ7kE7BLJS3L6WZS3bKBrkx
 2wFL2OhmI5rL4yBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BD28131FD;
 Thu, 16 Feb 2023 12:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Li8pIXYb7mOgNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Feb 2023 12:03:02 +0000
Message-ID: <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
Date: Thu, 16 Feb 2023 13:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QJEWgNBKh3sO9KV0Y42j0ff5"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, airlied@redhat.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QJEWgNBKh3sO9KV0Y42j0ff5
Content-Type: multipart/mixed; boundary="------------zFHk7vqzkZMCjSSQ3iYBGwXJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
In-Reply-To: <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>

--------------zFHk7vqzkZMCjSSQ3iYBGwXJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUgcGF0Y2hlcy4NCg0KQW0g
MTYuMDIuMjMgdW0gMTI6MzMgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBPbiBXZWQsIEZl
YiAxNSwgMjAyMyBhdCAwNToxNToxN1BNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+IFNldCB0aGUgVkdBIGJpdCBmb3IgdW5ibGFua2luZyB3aXRoIG1hY3JvIGNvbnN0
YW50cyBpbnN0ZWFkIG9mIG1hZ2ljDQo+PiB2YWx1ZXMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdl
cy4NCj4gDQo+IGJsYW5rL3VuYmxhbmsgc2hvdWxkIHdvcmsgc2ltbGlhciB0byBib2NocyAo
c2VlIGNvbW1pdCAyNTBlNzQzOTE1ZDQpLA0KPiB0aGF0IGlzIG1heWJlIGEgbmljZSB0aGlu
ZyB0byBhZGQgb2YgeW91IG1vZGVybml6ZSB0aGUgZHJpdmVyIGFueXdheS4NClllYWgsIGl0
J3MgdGhlIFZHQSBQQVMgZmllbGQuIFsxXSBCdXQgaXMgaXQgcmVhbGx5IGNhbGxlZCBibGFu
a2luZz8gUEFTIA0KY29udHJvbHMgcGFsZXR0ZSBhY2Nlc3MsIGJ1dCBibGFua2luZyBpcyBz
b3VuZHMgbW9yZSBsaWtlIERQTVMuDQoNClRoZSBQQVMgc2V0dGluZyBpcyBhY3R1YWxseSBw
YXJ0IG9mIHRoZSBwcmltYXJ5IHBsYW5lLCBzbyBpdCdzIGN1cnJlbnQgDQpsb2NhdGlvbiBp
biB0aGUgQ1JUQyBjb2RlIGlzIG1pc2xlYWRpbmcuIEkgZGlkbid0IHdhbnQgdG8gY2hhbmdl
IHRoZSANCmRyaXZlciBsb2dpYyB0b28gbXVjaCwgYnV0IEkgZ3Vlc3MgSSdsbCBmaXggdGhh
dCBpbiB0aGUgbmV4dCBpdGVyYXRpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsx
XSANCmh0dHBzOi8vd2ViLnN0YW5mb3JkLmVkdS9jbGFzcy9jczE0MC9wcm9qZWN0cy9waW50
b3Mvc3BlY3MvZnJlZXZnYS92Z2EvYXR0cnJlZy5odG0jM0MwDQoNCj4gDQo+IHRha2UgY2Fy
ZSwNCj4gICAgR2VyZA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------zFHk7vqzkZMCjSSQ3iYBGwXJ--

--------------QJEWgNBKh3sO9KV0Y42j0ff5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPuG3YFAwAAAAAACgkQlh/E3EQov+C3
mRAAzS5nN5txKkdrqqqLttOSiPOmLn7fdgn4yA2WACQdhxsZCxoADVBXezKqW4J6OaawppnpMlZY
p0oaqg75p70tbRkyovYQauXButoi9OhJoeZe8a0Y4AJtqlbnJHm/gsUB67Q5+rlmS4GakkwqX01D
J2q+DbK+dr/rTGZJa0tPd2XWWaqIWtoBBycMoHJ5ajuOUTEkWAMOGzkrnD2FGpaGsIInHDPNa68R
Yz8OjxWIthni5T9QvSlG2LvblCGVw8uK9LmOKOSCiNe8YKqLMiJGz4OMKiThn9zMUOwjIgJ+Yp+c
yFHOXuK4dvqBGQ41N9Cgk8u07+qE/u9hc1M/FxSPk6Ybk6BNNgJqqkSi4YXQPM3l/sU6Hz8KHbtn
uUD2MPb/Psy1fcsHzJraEyLZD01GGp8vID0ThslWnht4L/Nndxq0LKxweF3psph67BN+kizyOqPv
KRyfO8hQC9/3a5goC7opeuGimPVCg/7/7XDTM31Y8uog0QW2u26WDhB7PJ7FincOWolabKQ0iL+u
FTRspw5/hcU/PEsRpuc2EacTxvdAeONDMDFKUrM/aDa+A7X6jjOaxabz0Iq/zfOQttDgDQrclnGz
wByZbc8xbko3+ar6CDb84lVY+HOSMLJ7gNSBdQjYziNiQ7ABWcS99S1Ad1rWg27KGX9aoo8ukVdO
3a8=
=6K9N
-----END PGP SIGNATURE-----

--------------QJEWgNBKh3sO9KV0Y42j0ff5--
