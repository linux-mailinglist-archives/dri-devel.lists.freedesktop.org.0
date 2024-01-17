Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA73830994
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0047110E052;
	Wed, 17 Jan 2024 15:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFDC10E052
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:17:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F24A51FCA1;
 Wed, 17 Jan 2024 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rqqOz+If9aVIws40aIi7Yi+beLBRs2alWgXVWnVve74=;
 b=ZBAESAsHnl9PPdaZ2vXkjxL5ifjfWec1a6Ss8E1g7X0/RjR6BTpWs2WHwBgRIrjSHQKOje
 GJ9A7zuKnYMt8yLcROlf6gy/+rD2ZTkm/oArtTYulrFEbpfVlWo8TbRWtOCxtj1W9BCreg
 0/UKCxGQXsWGArst7ROVCwWQhPq8gt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rqqOz+If9aVIws40aIi7Yi+beLBRs2alWgXVWnVve74=;
 b=qcZQe+NrzjL0Tja3/URGQXiINPBI0xzx43xAlyvkoqrCVz4hVhXkzd8Mabl5I1DSljOV/q
 3/iKG03Z298CHDCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rqqOz+If9aVIws40aIi7Yi+beLBRs2alWgXVWnVve74=;
 b=ZBAESAsHnl9PPdaZ2vXkjxL5ifjfWec1a6Ss8E1g7X0/RjR6BTpWs2WHwBgRIrjSHQKOje
 GJ9A7zuKnYMt8yLcROlf6gy/+rD2ZTkm/oArtTYulrFEbpfVlWo8TbRWtOCxtj1W9BCreg
 0/UKCxGQXsWGArst7ROVCwWQhPq8gt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rqqOz+If9aVIws40aIi7Yi+beLBRs2alWgXVWnVve74=;
 b=qcZQe+NrzjL0Tja3/URGQXiINPBI0xzx43xAlyvkoqrCVz4hVhXkzd8Mabl5I1DSljOV/q
 3/iKG03Z298CHDCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B246613800;
 Wed, 17 Jan 2024 15:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCqSKZLvp2XwFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 15:17:38 +0000
Message-ID: <fb2d00c5-0d70-45e3-a207-812ed63405af@suse.de>
Date: Wed, 17 Jan 2024 16:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
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
In-Reply-To: <20240104160301.185915-7-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tyYbtuReV020gwUNl1nfeskp"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZBAESAsH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qcZQe+Nr
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.82 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-1.32)[90.27%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -5.82
X-Rspamd-Queue-Id: F24A51FCA1
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tyYbtuReV020gwUNl1nfeskp
Content-Type: multipart/mixed; boundary="------------A3I5y3RrYpFBSZSjZDOdtP7J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <fb2d00c5-0d70-45e3-a207-812ed63405af@suse.de>
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-7-jfalempe@redhat.com>

--------------A3I5y3RrYpFBSZSjZDOdtP7J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjAxLjI0IHVtIDE3OjAwIHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBB
ZGQgc3VwcG9ydCBmb3IgdGhlIGRybV9wYW5pYyBtb2R1bGUsIHdoaWNoIGRpc3BsYXlzIGEg
dXNlci1mcmllbmRseQ0KPiBtZXNzYWdlIHRvIHRoZSBzY3JlZW4gd2hlbiBhIGtlcm5lbCBw
YW5pYyBvY2N1cnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpm
YWxlbXBlQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlu
eS9zaW1wbGVkcm0uYyB8IDE1ICsrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0K
PiBpbmRleCA3Y2UxYzQ2MTc2NzUuLjZkZDJhZmVlODRkNCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTI1LDYgKzI1LDcgQEANCj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fbWFu
YWdlZC5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMu
aD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX3BhbmljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9k
cm1fcHJvYmVfaGVscGVyLmg+DQo+ICAgDQo+ICAgI2RlZmluZSBEUklWRVJfTkFNRQkic2lt
cGxlZHJtIg0KPiBAQCAtOTg1LDYgKzk4NiwxOSBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRy
bV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpk
cnYsDQo+ICAgCXJldHVybiBzZGV2Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgc2lt
cGxlZHJtX2dldF9zY2Fub3V0X2J1ZmZlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAr
CQkJCQlzdHJ1Y3QgZHJtX3NjYW5vdXRfYnVmZmVyICpzYikNCj4gK3sNCj4gKwlzdHJ1Y3Qg
c2ltcGxlZHJtX2RldmljZSAqc2RldiA9IHNpbXBsZWRybV9kZXZpY2Vfb2ZfZGV2KGRldik7
DQo+ICsNCj4gKwlzYi0+d2lkdGggPSBzZGV2LT5tb2RlLmhkaXNwbGF5Ow0KPiArCXNiLT5o
ZWlnaHQgPSBzZGV2LT5tb2RlLnZkaXNwbGF5Ow0KPiArCXNiLT5waXRjaCA9IHNkZXYtPnBp
dGNoOw0KPiArCXNiLT5mb3JtYXQgPSBzZGV2LT5mb3JtYXQ7DQo+ICsJc2ItPm1hcCA9IHNk
ZXYtPnNjcmVlbl9iYXNlOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICAgLyoNCj4g
ICAgKiBEUk0gZHJpdmVyDQo+ICAgICovDQo+IEBAIC0xMDAwLDYgKzEwMTQsNyBAQCBzdGF0
aWMgc3RydWN0IGRybV9kcml2ZXIgc2ltcGxlZHJtX2RyaXZlciA9IHsNCj4gICAJLm1pbm9y
CQkJPSBEUklWRVJfTUlOT1IsDQo+ICAgCS5kcml2ZXJfZmVhdHVyZXMJPSBEUklWRVJfQVRP
TUlDIHwgRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VULA0KPiAgIAkuZm9wcwkJCT0gJnNp
bXBsZWRybV9mb3BzLA0KPiArCS5nZXRfc2Nhbm91dF9idWZmZXIJPSBzaW1wbGVkcm1fZ2V0
X3NjYW5vdXRfYnVmZmVyLA0KPiAgIH07DQo+ICAgDQo+ICAgLyoNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------A3I5y3RrYpFBSZSjZDOdtP7J--

--------------tyYbtuReV020gwUNl1nfeskp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWn75IFAwAAAAAACgkQlh/E3EQov+DM
sQ//W88ihPDP5NO/WTf2nN+7IbJG5P2QRLNJt01yWFPcRJQEw2+A3vIpXrydxntm9DY2Q9dNbY+y
Grh1TjCWudN1CDEcpM9rslRVTi3MO3J2lT3oElkSMTX21mdfd2oq6G2yocP1MRTALlm6kdQv20kF
NB/d6lPuxjt3D5U7BUFIW1ZCzroc+tnOU0hhSyHS0fgMb6ukuBxpF4J0Qjg/TsVsk93EOeW4gzlQ
OZ2uMvNb2eZpxzc2bEUnk96G9A2c2/RLyAHvVoxRdJEiyHN++vVpAloxYiqn2k1D+M9kJtSJh+zG
BwyM0qyrCcY0eemUNta1ICeLa8UWFSCQh4DbrXz5aeneVE+FJeW6PcwxT/py2lRPXzjirKT76h0v
mj1CRuacR/Inojaupm4sDyeCda194SCBsgl4i2jnN8UK0sfruvvW+bHFocHQ81q8s+NGqW/mLfxK
ZZXp46Ir8RyShMhmnwf3whwmK7DRdV0sAHiiuaKvGa9BEJryy638ABNX0AGR1REFDx3aC+axMXh8
Xn/v/7Fr2OPrkOtoSROZlN4KhdwlhIUv/OGSRyFgLzp9oejXsCS5QEPLpnIM/ZrkDGxa8WtdqhXA
OXehOBsqBuZ37bVkep+na9OnyeHTKNEv/Zh25opvJ8/BXff7XZ/wLfDGe/l63ATB/5y8m4RkZGeF
55Y=
=b24h
-----END PGP SIGNATURE-----

--------------tyYbtuReV020gwUNl1nfeskp--
