Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069368269D0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B727210E1DE;
	Mon,  8 Jan 2024 08:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E8610E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:52:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FD6D1F78B;
 Mon,  8 Jan 2024 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704703923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wM5ay2YaJwopxFPSHfp3+rXJ0MUR0dGvtNncitbOQiA=;
 b=mkp9poeUthqOtYjIvBS+E4jccm4wcklRa6L+chg0K/hlxXV/wL+xBjcqKqlfwR3E0XNViS
 QkpiTCezK2nGtDfFSLM10bnKYyi8BJ4VrLQa9y3ZKHAcqZ/9g4CxY339CWOd0/bqciJDJa
 RKAhjbd5cpTbhx3k4gqAp147lrk11us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704703923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wM5ay2YaJwopxFPSHfp3+rXJ0MUR0dGvtNncitbOQiA=;
 b=qjKFxSKny2mwh5eXK31wynw2UtOZHRMFl5XqyVAbJ2aQEsusz183sczvrPfkKC+b7Cap/3
 ue1CMYlukcemfUBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704703923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wM5ay2YaJwopxFPSHfp3+rXJ0MUR0dGvtNncitbOQiA=;
 b=mkp9poeUthqOtYjIvBS+E4jccm4wcklRa6L+chg0K/hlxXV/wL+xBjcqKqlfwR3E0XNViS
 QkpiTCezK2nGtDfFSLM10bnKYyi8BJ4VrLQa9y3ZKHAcqZ/9g4CxY339CWOd0/bqciJDJa
 RKAhjbd5cpTbhx3k4gqAp147lrk11us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704703923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wM5ay2YaJwopxFPSHfp3+rXJ0MUR0dGvtNncitbOQiA=;
 b=qjKFxSKny2mwh5eXK31wynw2UtOZHRMFl5XqyVAbJ2aQEsusz183sczvrPfkKC+b7Cap/3
 ue1CMYlukcemfUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 129B71392C;
 Mon,  8 Jan 2024 08:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +0WNA7O3m2WoBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Jan 2024 08:52:03 +0000
Message-ID: <878d8a2d-ad29-4ef3-9ce5-4ce35284a586@suse.de>
Date: Mon, 8 Jan 2024 09:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: remove drm_connector_helper_get_modes_from_ddc()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704473654.git.jani.nikula@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <cover.1704473654.git.jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rQoDGvWMzIYAlLQcl5k0hqAn"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.25
X-Spamd-Result: default: False [-4.25 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_BASE64_TEXT(0.10)[]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-1.96)[94.84%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rQoDGvWMzIYAlLQcl5k0hqAn
Content-Type: multipart/mixed; boundary="------------y6TtV17sa6fthJQvn9EYhhOd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>
Message-ID: <878d8a2d-ad29-4ef3-9ce5-4ce35284a586@suse.de>
Subject: Re: [PATCH 0/2] drm: remove drm_connector_helper_get_modes_from_ddc()
References: <cover.1704473654.git.jani.nikula@intel.com>
In-Reply-To: <cover.1704473654.git.jani.nikula@intel.com>

--------------y6TtV17sa6fthJQvn9EYhhOd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCmZvciB0aGUgc2VyaWVzOg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClRoYW5rcyBmb3IgY2xlYW5pbmcgdXAuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFtIDA1LjAxLjI0IHVtIDE3OjU3IHNjaHJpZWIg
SmFuaSBOaWt1bGE6DQo+IENvbnZlcnQgbWdhZzIwMCB0byB1c2Ugc3RydWN0IGRybV9lZGlk
IGRpcmVjdGx5LCBhbmQgZHJvcA0KPiBkcm1fY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXNf
ZnJvbV9kZGMoKSwgYXMgc3VnZ2VzdGVkIGJ5IFRob21hcy4NCj4gDQo+IFRoaXMgc3VwZXJz
ZWRlcyBbMV0uDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMTE0MTA1ODE1LjQxODg5MDEtMS1qYW5pLm5pa3Vs
YUBpbnRlbC5jb20vDQo+IA0KPiBKYW5pIE5pa3VsYSAoMik6DQo+ICAgIGRybS9tZ2FnMjAw
OiBjb252ZXJ0IGdldCBtb2RlcyB0byBzdHJ1Y3QgZHJtX2VkaWQNCj4gICAgZHJtL3Byb2Jl
LWhlbHBlcjogcmVtb3ZlIHVudXNlZA0KPiAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2dl
dF9tb2Rlc19mcm9tX2RkYygpDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVf
aGVscGVyLmMgICAgIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDE0ICsrKysrKystLS0NCj4g
ICBpbmNsdWRlL2RybS9kcm1fcHJvYmVfaGVscGVyLmggICAgICAgICB8ICAxIC0NCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------y6TtV17sa6fthJQvn9EYhhOd--

--------------rQoDGvWMzIYAlLQcl5k0hqAn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWbt7IFAwAAAAAACgkQlh/E3EQov+AU
BQ//YLuS4XLxAmcX9bf83JhNcYPFe3W5fMKxZtit7CptAw+GtMs3FGwjSqO+Dna+WEw/fmqyz2EK
rC2Ozu/u/7H4MstT3/ZdBjP1kPsEQ1cA/cq6yWyEJZyEXRpqTnRMPVllROnbEbuYZAW8ZBhBlWmL
jZArOvQzkeVZP1b3KzO+oKacrMeF4O3viq8P4QbWSQqV5pNFumcl1uy4pM1Qocw7qCasNYSdQ2lO
M7ZbbNnBFvGu0Ob3Fjd7VFzvXIbhZPkxf7LI2k85sN3icw5PRLx2vdDlV6KtfDRmI+c/mpthj3hO
fxk2r5un483Wy8qUscEFQtn/EYxK3MBeAUx4eHUpcsonn/7HJRIf28fMhwF4YnCen3tRRgJb2cMq
msFkWjLZYMxHNchXm1wMMCiIRJbsGQYCBwDLsbhH6vlLane4M1fiBxqgdL8f/6IrJGEimXuZHQJi
sQGgVW8hB/dHzgwXg2fs4rUEfKtu4zVZTEYIqWNo5euC0MCd5atChJiuiZIQdtdIw1Wdt8zkHjf4
7I9eQuYI+/l1kCn/EQUDJ/c3PKydsZf4bqvFNyc1L6Gbo9cK8Myl4I0Lb1hqrdJQyuAZ9iWOKBHY
TUDV2g1eoZW9qiB+/W11y6k43n31nhJRXJJJi4puOWfw8PbI0yh0D/LH8+7F7Lm2Vqw9hontfcPJ
2vY=
=uxoY
-----END PGP SIGNATURE-----

--------------rQoDGvWMzIYAlLQcl5k0hqAn--
