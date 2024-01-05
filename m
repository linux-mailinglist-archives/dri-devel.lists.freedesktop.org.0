Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3B825009
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595010E588;
	Fri,  5 Jan 2024 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407B10E571;
 Fri,  5 Jan 2024 08:32:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 648D71F8AA;
 Fri,  5 Jan 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704443534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t/UWAYp7dCHtFY6rZhdRY77DYmAJPQVMYxlgbc2Nfl4=;
 b=1qAB9JfvxQ+28julBrurjLjovBRk/LWEirY3yDqWHYUDl9GAch4Spt5xDcsQNXkIFLTXEs
 dTXTFcgmJWypXqm3J6pTRVhWMVi/PrVg2zucQgdKupbVXaThYDCGAarOXMj7V+eIfdPyID
 R2dEY1mOfaj5cBnWe6P4xbEMPgzti8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704443534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t/UWAYp7dCHtFY6rZhdRY77DYmAJPQVMYxlgbc2Nfl4=;
 b=Jhi/NnStLvrzhzSQWwUabsWzmkILPJI+4lqnhIxTODI0Fp6Gy6qZoWHhIhmf8/c6J3vBo1
 GqAIpvObewy42JAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704443534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t/UWAYp7dCHtFY6rZhdRY77DYmAJPQVMYxlgbc2Nfl4=;
 b=1qAB9JfvxQ+28julBrurjLjovBRk/LWEirY3yDqWHYUDl9GAch4Spt5xDcsQNXkIFLTXEs
 dTXTFcgmJWypXqm3J6pTRVhWMVi/PrVg2zucQgdKupbVXaThYDCGAarOXMj7V+eIfdPyID
 R2dEY1mOfaj5cBnWe6P4xbEMPgzti8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704443534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t/UWAYp7dCHtFY6rZhdRY77DYmAJPQVMYxlgbc2Nfl4=;
 b=Jhi/NnStLvrzhzSQWwUabsWzmkILPJI+4lqnhIxTODI0Fp6Gy6qZoWHhIhmf8/c6J3vBo1
 GqAIpvObewy42JAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49886137E8;
 Fri,  5 Jan 2024 08:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xdLAEI6+l2WAPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jan 2024 08:32:14 +0000
Message-ID: <2d74c31f-7a54-449d-9ddd-9a902be86ee1@suse.de>
Date: Fri, 5 Jan 2024 09:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] drm/edid: prefer forward declarations over includes in
 drm_edid.h
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20240104211028.1129606-1-jani.nikula@intel.com>
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
In-Reply-To: <20240104211028.1129606-1-jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7R2ztmZeA4zr0JbmXkTjy0hD"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.57 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_BASE64_TEXT(0.10)[]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-2.28)[96.63%];
 ARC_NA(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,intel.com:email];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.57
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7R2ztmZeA4zr0JbmXkTjy0hD
Content-Type: multipart/mixed; boundary="------------eY6rfvQtE3TwNVwop400TkPg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <2d74c31f-7a54-449d-9ddd-9a902be86ee1@suse.de>
Subject: Re: [RESEND] drm/edid: prefer forward declarations over includes in
 drm_edid.h
References: <20240104211028.1129606-1-jani.nikula@intel.com>
In-Reply-To: <20240104211028.1129606-1-jani.nikula@intel.com>

--------------eY6rfvQtE3TwNVwop400TkPg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjAxLjI0IHVtIDIyOjEwIHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+IFRoZXJl
J3Mgbm8gbmVlZCB0byBpbmNsdWRlIGVpdGhlciBsaW51eC9oZG1pLmggb3IgZHJtL2RybV9t
b2RlLmguIFRoZXkNCj4gY2FuIGJlIHJlbW92ZWQgYnkgdXNpbmcgZm9yd2FyZCBkZWNsYXJh
dGlvbnMuDQo+IA0KPiBXaGlsZSBhdCBpdCwgZ3JvdXAgdGhlIGZvcndhcmQgZGVjbGFyYXRp
b25zIHRvZ2V0aGVyLCBhbmQgcmVtb3ZlIHRoZQ0KPiB1bm5lY2Vzc2FyeSBvbmVzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9lZGlkLmggfCAxMiArKysrKy0tLS0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9pbmNsdWRl
L2RybS9kcm1fZWRpZC5oDQo+IGluZGV4IDU0Y2M2ZjA0YTcwOC4uODZjMTgxMmE4MDM0IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oDQo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9lZGlkLmgNCj4gQEAgLTI0LDExICsyNCwxNCBAQA0KPiAgICNkZWZpbmUgX19E
Uk1fRURJRF9IX18NCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gLSNp
bmNsdWRlIDxsaW51eC9oZG1pLmg+DQo+IC0jaW5jbHVkZSA8ZHJtL2RybV9tb2RlLmg+DQo+
ICAgDQo+ICtlbnVtIGhkbWlfcXVhbnRpemF0aW9uX3JhbmdlOw0KPiArc3RydWN0IGRybV9j
b25uZWN0b3I7DQo+ICAgc3RydWN0IGRybV9kZXZpY2U7DQo+ICtzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZTsNCj4gICBzdHJ1Y3QgZHJtX2VkaWQ7DQo+ICtzdHJ1Y3QgaGRtaV9hdmlfaW5m
b2ZyYW1lOw0KPiArc3RydWN0IGhkbWlfdmVuZG9yX2luZm9mcmFtZTsNCj4gICBzdHJ1Y3Qg
aTJjX2FkYXB0ZXI7DQo+ICAgDQo+ICAgI2RlZmluZSBFRElEX0xFTkdUSCAxMjgNCj4gQEAg
LTMxOSwxMSArMzIyLDYgQEAgc3RydWN0IGNlYV9zYWQgew0KPiAgIAl1OCBieXRlMjsgLyog
bWVhbmluZyBkZXBlbmRzIG9uIGZvcm1hdCAqLw0KPiAgIH07DQo+ICAgDQo+IC1zdHJ1Y3Qg
ZHJtX2VuY29kZXI7DQo+IC1zdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsNCj4gLXN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlOw0KPiAtc3RydWN0IGRybV9kaXNwbGF5X21vZGU7DQo+IC0NCj4g
ICBpbnQgZHJtX2VkaWRfdG9fc2FkKGNvbnN0IHN0cnVjdCBlZGlkICplZGlkLCBzdHJ1Y3Qg
Y2VhX3NhZCAqKnNhZHMpOw0KPiAgIGludCBkcm1fZWRpZF90b19zcGVha2VyX2FsbG9jYXRp
b24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsIHU4ICoqc2FkYik7DQo+ICAgaW50IGRybV9h
dl9zeW5jX2RlbGF5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------eY6rfvQtE3TwNVwop400TkPg--

--------------7R2ztmZeA4zr0JbmXkTjy0hD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWXvo0FAwAAAAAACgkQlh/E3EQov+D+
Hw//ShoUzgRZ98L++eN9US/P000Uf9UZS1sx07LyuDjFzCBEnOI93dMHrnv6EindSoOXcdSZ4U/w
Un130ELBh2X7ofIABFismPl58AtqMZ4+Pu8fxLTycQonzc2xz2cFqAwZicCc3t6PTKRsV4DU9jzH
cyv0eo9zbVOIeFbuc/QhuPo8qAw0QmWfL1JCWZYUoaYFq3Cl/plEucktAcPr4bt1MmfVXjNzBOA0
T2Zs7b3eckUucC47ljGvfzFg2EH6+wFc5ou4IWdiZieI0Tuth13bEPrCfzc43/eVrhHCrEsWNA5b
vkFxop1RtSfoGogUzUqFgH70F3ML7Io7mbgGNT/kAQec4otqlDkgsy4mWf4b3E8wH29HwKCmAWPb
haWDOXs2Oi83nZviwWlHC1Kz/AGq0vAGDhmkfhaUS6IgR1JaCX2VZDHoWCi0erzdqLYf9yCbl8qf
DPr+R3zWcQhojyiGeH3DdwKijqANt1O70GMmfEm5iB2dBDjUiuMapDBLUu6WOGrc7Hupjypmtz4K
aHkTvi+Jx7XmsL/bhuGeSiUZFysonNtRP0hBqoQNXdJLYpXdjKmlb55gOHSM/gs0d57e5U0jLMjU
IFFVmTJzJe7Vi5z+HTDaeFzkr6FksIDKkGB/veJQxPBt+pfR3DbFTAeNAlSfo9owA6uMBj5xAsTm
rmY=
=2lFU
-----END PGP SIGNATURE-----

--------------7R2ztmZeA4zr0JbmXkTjy0hD--
