Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D3557596
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC611A307;
	Thu, 23 Jun 2022 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBECC11A305;
 Thu, 23 Jun 2022 08:36:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B6F61FD51;
 Thu, 23 Jun 2022 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655973389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezi/MbNia+KTClH7MlaUGkfog8Tj+VDlDAD/W8XwsuE=;
 b=pE1jGinaOiSF6udgErXBWZnokf+XME+cD4wr6gvMPlM69lUHOFACPtAx58SYUde42UAEWt
 zxNTLMRCMQ4gEiIQkiSkT3cW4xKTNIWOFZ6Y9ZDQd/MlDYCYBhXYjc7GciI5Oonuv+TyBI
 5kOMM/xvAKQbcM8LWpxQTjIxLAvOu7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655973389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezi/MbNia+KTClH7MlaUGkfog8Tj+VDlDAD/W8XwsuE=;
 b=RQU8YWIYeYFcD1BX/xyZRpd5bzfmVMt7PdlOrJzW6DNhKHoKtlhjARR4rMWZtYNWgje4/Z
 IPwkelwSQZ2AiXDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62D3C13461;
 Thu, 23 Jun 2022 08:36:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yXBDFw0mtGJ5CgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 08:36:29 +0000
Message-ID: <12471428-9bfb-0249-c305-8009c5af1f25@suse.de>
Date: Thu, 23 Jun 2022 10:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
 <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de> <87r13frdjl.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87r13frdjl.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HWxm6sDYE6wCzHWTcOskg0OE"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HWxm6sDYE6wCzHWTcOskg0OE
Content-Type: multipart/mixed; boundary="------------0JZnNrdgcEuapGw52i50miGG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <12471428-9bfb-0249-c305-8009c5af1f25@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
 <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de> <87r13frdjl.fsf@intel.com>
In-Reply-To: <87r13frdjl.fsf@intel.com>

--------------0JZnNrdgcEuapGw52i50miGG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDYuMjIgdW0gMTA6MjYgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
VGh1LCAyMyBKdW4gMjAyMiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IHdlIGJhY2ttZXJnZWQg
djUuMTktcmMyLiBUaGF0J3Mgd2h5IHRoZSBsaXN0IG9mDQo+PiBjaGFuZ2VkIGZpbGVzIGlz
IHNvIGxvbmcuDQo+IA0KPiBJIHRob3VnaHQgd2Ugc2hvdWxkIG9ubHkgYmFja21lcmdlIExp
bnVzJyB0cmVlIHZpYSBiYWNrbWVyZ2luZyBkcm0tbmV4dCwNCj4gd2hpY2ggYXZvaWRzIHRo
aXMgcHJvYmxlbSBhbHRvZ2V0aGVyLg0KDQpJIGRpZCBiYWNrbWVyZ2UgdmlhIGRybS1uZXh0
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------0JZnNrdgcEuapGw52i50miGG--

--------------HWxm6sDYE6wCzHWTcOskg0OE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0Jg0FAwAAAAAACgkQlh/E3EQov+Aw
mxAAo/JyUXKabLu/nIxG/lTpEZt6Gggez4thtvWMkURhAu6Ql4YVDqIOMm/xQZhNsXYvmcKSsnGQ
wMjWadUX7qMcwJCzskEMEhFB0BBnSNZ10K8WcMioqhavhWoXlz1eYzQLWt73yHvIh78PcyRWcZ/I
uSGuubnoyyqA/PgkAaKccYJRP9CVieJqnmBBVoHeYj1KExVSRQl5lNgMBuR5G2aKIhjR3pNO8lJg
bahlA3T6giAQHIel/fqsnjEIM6xEAh6pvAIQ1MG5PDEfmJJqoN1GaE7gVYc4stCoWS+MJ6wvHsIA
3vio3VF8ubvVSRoEy9LRBhvW+PRyB6aDUqBKLj0uC3X8SsGuCBXOEc34rGfecTbJ54B18TKm5QAN
RXI8/YTOLWHRiU3BdGPptL+NkWMIbfh5TluEC3saIKsNEwdywA7qk8epZ7NzBMgmlgVgjIdfyjw/
46b4FvFWDf7Vp+HWJtoSMn0jzplv42svft3isOslBE70WJxT0txPAop2RooTP4pod7tJNWm92dJL
JnANIIvsnL6z068kxtv25pwb7yBKskYrk0L8bR4+PLsdyCNEZZ90xk04Y4MbUXkiUxqLdim3b56u
oSWLUllAVURecEqFBF2vFCPIL4X9boj5kUsSlwQrqtb6Y7dtKg7Y5qnQWD4TwkBLXU4cXkGbcME2
kKA=
=vX4R
-----END PGP SIGNATURE-----

--------------HWxm6sDYE6wCzHWTcOskg0OE--
