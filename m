Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868888005E4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E0110E81B;
	Fri,  1 Dec 2023 08:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF010E81B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:39:12 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C1BE91FD58;
 Fri,  1 Dec 2023 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701419950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j30n+JyaiMQFE2AszHvWx+PHfZHk1speGVAdnEsDm4s=;
 b=m9Fzc6O+RfpF2z8CKRMz2ZpO6epziH/hh1d9nNFJoiJzMMpMzQhgW0sO1K0K4MHkE75NSn
 x6RTSHDjKBe8sqnIDg2PjhukaF+s6CegNdf+36xrMQFcw0A5pK4odiZ09RhuFMNxY+OFRf
 Yy0tZ6BFzhFZHhXmLKF/6+EyZ67K6oI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701419950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j30n+JyaiMQFE2AszHvWx+PHfZHk1speGVAdnEsDm4s=;
 b=O7gCU3m40oUfWWDuG5ORxQaEBcwFpoTVhJ0sbKkcoXGIpYmzqFb/8zI6YAqp1KA9SpuLqU
 kZJkYjdOwmBYrPBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 96AD01344E;
 Fri,  1 Dec 2023 08:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kxmXI66baWViWAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Dec 2023 08:39:10 +0000
Message-ID: <32a7e09d-4ba2-48a4-9957-966675be113b@suse.de>
Date: Fri, 1 Dec 2023 09:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] drm: Remove infrastructure for user-space mode
 setting
Content-Language: en-US
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
References: <20231122122449.11588-1-tzimmermann@suse.de>
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
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IE1xyyFSyXG8BNqQk00ceaEh"
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 1.91
X-Spam-Level: *
X-Spamd-Result: default: False [1.91 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; TO_DN_NONE(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; NEURAL_SPAM_LONG(3.31)[0.944];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_SPAM_SHORT(2.70)[0.899];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
--------------IE1xyyFSyXG8BNqQk00ceaEh
Content-Type: multipart/mixed; boundary="------------atAPzspXkJt3VfC1iBbcEiYg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Cc: dri-devel@lists.freedesktop.org
Message-ID: <32a7e09d-4ba2-48a4-9957-966675be113b@suse.de>
Subject: Re: [PATCH 00/14] drm: Remove infrastructure for user-space mode
 setting
References: <20231122122449.11588-1-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>

--------------atAPzspXkJt3VfC1iBbcEiYg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjExLjIzIHVtIDEzOjA5IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IFRoZSBvbGQgZHJpdmVycyBmb3IgdXNlci1zcGFjZSBtb2RlIHNldHRpbmcgaGF2ZSBiZWVu
IHJlbW92ZWQgaW4gTGludXgNCj4gdjYuMy4gTm8gb25lIGhhcyBjb21wbGFpbmVkIG9yIHJl
cXVlc3RlZCB0aGVpciByZXR1cm4uIEl0IGlzIHRpbWUgdG8NCj4gcmVtb3ZlIHRoZXNlIGRy
aXZlcnMnIGluZnJhc3RydWN0dXJlIGZyb20gdGhlIERSTSBjb3JlLg0KDQpGVFI6IGFja2Vk
IGJ5IGFpcmxpZWQgYW5kIHNpbWEgdmlhIGRyaS1kZXZlbA0KDQpodHRwczovL3Blb3BsZS5m
cmVlZGVza3RvcC5vcmcvfmNicmlsbC9kcmktbG9nLz9jaGFubmVsPWRyaS1kZXZlbCZoaWdo
bGlnaHRfbmFtZXM9JmRhdGU9MjAyMy0xMS0zMA0KDQo+IA0KPiBUaGUgcmVjZW50IExpbnV4
IHY2LjYgaGFzIGJlZW4gZGVzaWduYXRlZCBhcyBsb25nLXRlcm0gcmVsZWFzZSwgWzFdIHNv
DQo+IGFueSByZW1haW5pbmcgdXNlcnMgaGF2ZSBhIGZldyBtb3JlIHllYXJzIHRvIGdldCBh
IG5ldyBncmFwaGljcyBjYXJkLiBUaGUNCj4gbGVnYWN5IGRldmljZXMgY29udGludWUgdG8g
YmUgc3VwcG9ydGVkIHZpYSBzaW1wbGVkcm0uIE1lcmdpbmcgcHJvcGVyDQo+IGRyaXZlcnMg
d2l0aCBrZXJuZWwgbW9kZSBzZXR0aW5nIGlzIGFsc28gYW4gb3B0aW9uLg0KPiANCj4gUGF0
Y2hlcyAxIHRvIDcgZml4IGEgZmV3IHRyaXZpYWwgaXNzdWVzIHRoYXQgaGF2ZSBiZWVuIGZv
cmdvdHRlbiBkdXJpbmcNCj4gdGhlIHJlbW92YWwgb2YgdGhlIGRyaXZlcnMuDQo+IA0KPiBQ
YXRjaGVzIDggYW5kIDkgcmVtb3ZlIHRoZSBsZWFnY3kgaW9jdGwgaW50ZXJmYWNlcy4gT25l
IG9wIGlzIGRpZmZlcmVudA0KPiBmcm9tIHRoZSBvdGhlcnMsIHNvIGl0IGdldHMgaXRzIG93
biBwYXRjaC4NCj4gDQo+IFBhdGNoZXMgMTAgdG8gMTIgcmVtb3ZlIHRoZSBsZWdhY3kgc291
cmNlIGNvZGUgZnJvbSBEUk0uIFdpdGggdGhhdCBnb25lDQo+IHBhdGNoIDEzLCB0aGUgQUdQ
IGNvZGUgY2FuIGJlIHNpbXBsaWZpZWQgYXMgd2VsbC4gVGhlcmUgdXNlZCB0byBiZQ0KPiBh
IGRldmljZSBmaWxlIGZvciB1c2VyLXNwYWNlIG1vZGUgc2V0dGluZywgL2Rldi9hZ3BnYXJ0
LCB0aGF0IGlzIG5vdw0KPiBvYnNvbGV0ZS4NCj4gDQo+IFBhdGNoIDE0IHJlbW92ZXMgdGhl
IG9wdGlvbiBmcm9tIEtjb25maWcuDQo+IA0KPiBbMV0gaHR0cHM6Ly9rZXJuZWwub3JnL2Nh
dGVnb3J5L3JlbGVhc2VzLmh0bWwNCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICgxNCk6DQo+
ICAgIGFyY2gvcG93ZXJwYzogUmVtb3ZlIGxlZ2FjeSBEUk0gZHJpdmVycyBmcm9tIGRlZmF1
bHQgY29uZmlncw0KPiAgICBkcm06IEZpeCBUT0RPIGxpc3QgbWVudGlvbmluZyBub24tS01T
IGRyaXZlcnMNCj4gICAgZHJtOiBJbmNsdWRlIDxkcm0vZHJtX2F1dGguaD4NCj4gICAgZHJt
L2k5MTU6IEluY2x1ZGUgPGRybS9kcm1fYXV0aC5oPg0KPiAgICBhY2NlbDogSW5jbHVkZSA8
ZHJtL2RybV9hdXRoLmg+DQo+ICAgIGRybTogSW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4N
Cj4gICAgZHJtL3JhZGVvbjogRG8gbm90IGluY2x1ZGUgPGRybS9kcm1fbGVnYWN5Lmg+DQo+
ICAgIGRybTogUmVtb3ZlIGVudHJ5IHBvaW50cyBmb3IgbGVnYWN5IGlvY3Rscw0KPiAgICBk
cm06IFJlbW92ZSB0aGUgbGVnYWN5IERSTV9JT0NUTF9NT0RFU0VUX0NUTCBpb2N0bA0KPiAg
ICBkcm06IFJlbW92ZSBzdXBwb3J0IGZvciBsZWdhY3kgZHJpdmVycw0KPiAgICBkcm06IFJl
bW92ZSBsb2NraW5nIGZvciBsZWdhY3kgaW9jdGxzIGFuZCBEUk1fVU5MT0NLRUQNCj4gICAg
ZHJtOiBSZW1vdmUgc291cmNlIGNvZGUgZm9yIG5vbi1LTVMgZHJpdmVycw0KPiAgICBjaGFy
L2FncDogUmVtb3ZlIGZyb250ZW5kIGNvZGUNCj4gICAgZHJtOiBSZW1vdmUgS2NvbmZpZyBv
cHRpb24gZm9yIGxlZ2FjeSBzdXBwb3J0IChDT05GSUdfRFJNX0xFR0FDWSkNCj4gDQo+ICAg
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgICAgICAgICAgIHwgICAgNyAr
LQ0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcgICAgICAgICB8
ICAgIDIgLQ0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdzL3BwYzZ4eF9kZWZjb25maWcgICAg
ICAgICB8ICAgIDcgLQ0KPiAgIGRyaXZlcnMvYWNjZWwvZHJtX2FjY2VsLmMgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDEgKw0KPiAgIGRyaXZlcnMvY2hhci9hZ3AvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDYgLQ0KPiAgIGRyaXZlcnMvY2hhci9hZ3AvYWdwLmgg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDkgLQ0KPiAgIGRyaXZlcnMvY2hhci9hZ3Av
YmFja2VuZC5jICAgICAgICAgICAgICAgICAgICB8ICAgMTEgLQ0KPiAgIGRyaXZlcnMvY2hh
ci9hZ3AvY29tcGF0X2lvY3RsLmMgICAgICAgICAgICAgICB8ICAyOTEgLS0tDQo+ICAgZHJp
dmVycy9jaGFyL2FncC9jb21wYXRfaW9jdGwuaCAgICAgICAgICAgICAgIHwgIDEwNiAtLQ0K
PiAgIGRyaXZlcnMvY2hhci9hZ3AvZnJvbnRlbmQuYyAgICAgICAgICAgICAgICAgICB8IDEw
NjggLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEyIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Fn
cHN1cHBvcnQuYyAgICAgICAgICAgICAgfCAgNDUxIC0tLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9hdXRoLmMgICAgICAgICAgICAgICAgICAgIHwgICAgOCArLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYnVmcy5jICAgICAgICAgICAgICAgICAgICB8IDE2MjcgLS0tLS0t
LS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbnRleHQuYyAgICAgICAg
ICAgICAgICAgfCAgNTEzIC0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZG1hLmMg
ICAgICAgICAgICAgICAgICAgICB8ICAxNzggLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2Rydi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDE3IC0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgfCAgIDY0ICstDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9oYXNodGFiLmMgICAgICAgICAgICAgICAgIHwgIDIwMyAtLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCAgICAgICAgICAgICAgICB8ICAgIDcg
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYyAgICAgICAgICAgICAgICAgICB8
ICA2MTMgKy0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyAgICAgICAg
ICAgICAgICAgICB8ICAgODIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jICAg
ICAgICAgICAgICAgICAgICAgfCAgMjA0IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
bGVnYWN5LmggICAgICAgICAgICAgICAgICB8ICAyOTAgLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9sZWdhY3lfbWlzYy5jICAgICAgICAgICAgIHwgIDEwNSAtLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fbG9jay5jICAgICAgICAgICAgICAgICAgICB8ICAzNzMgLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMgICAgICAgICAgICAgICAgICB8ICAx
MzggLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BjaS5jICAgICAgICAgICAgICAgICAg
ICAgfCAgMjA0ICstLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2NhdHRlci5jICAgICAg
ICAgICAgICAgICB8ICAyMjAgLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
YyAgICAgICAgICAgICAgICAgIHwgIDEwMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV92
bS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDY2NSAtLS0tLS0tDQo+ICAgLi4uL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jICAgIHwgICAgMSArDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmggICAgICAgICAgIHwgICAgMSAtDQo+
ICAgaW5jbHVkZS9kcm0vZHJtX2F1dGguaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
MiAtDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2RldmljZS5oICAgICAgICAgICAgICAgICAgICAg
IHwgICA3MSArLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMTkgLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9maWxlLmggICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDUgLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9pb2N0bC5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMTEgLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9sZWdh
Y3kuaCAgICAgICAgICAgICAgICAgICAgICB8ICAzMzEgLS0tLQ0KPiAgIDQwIGZpbGVzIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDgwNDUgZGVsZXRpb25zKC0pDQo+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2hhci9hZ3AvY29tcGF0X2lvY3RsLmMNCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jaGFyL2FncC9jb21wYXRfaW9jdGwuaA0KPiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NoYXIvYWdwL2Zyb250ZW5kLmMNCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMNCj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMNCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9jb250ZXh0LmMNCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9kbWEuYw0KPiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2hhc2h0YWIuYw0KPiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jDQo+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5LmgNCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3lfbWlzYy5jDQo+ICAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbG9jay5jDQo+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMNCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9zY2F0dGVyLmMNCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV92bS5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHJtL2RybV9sZWdhY3kuaA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------atAPzspXkJt3VfC1iBbcEiYg--

--------------IE1xyyFSyXG8BNqQk00ceaEh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVpm64FAwAAAAAACgkQlh/E3EQov+Di
ohAAiyqxAUboy6aQqo8xOmN6nriPLqhW9G62kmuiikhykIUSJew/1oaSpWnEOwMqha/+M/2ij6qq
KqlrmHR2H0Z+ygrZSvxi+bdLXGLZ4vsjezEHcT4IelgG+OpQDkWr5Zct5532lheBvDBy/zid4XYz
5mdUscxKiH3aVh/LhHMy2iGrox5X4BNe6Oiw/Pv2qdXhb2tXUPmD2wwfidNR4zKaUhUiSB7XWpjw
A9etHX7U7Eito+FOsBLcyCMPgnwdHxy4XivMdaVgY96QRutTQOh74D/e2ka2lw7DcCMFOSQX3vqa
kuD9gNaWInJhqxOvI4w7Gw8yE00PMhWs4XpgmMOoWePUTdXmby1k5CFx8tWTbjFG+2ePNsxHfq4K
/Lqp8aK63INu0aw1wO5Rv6uQn735fT/ovvJvcgD/t+tushDI3dJC1L+sb5jOPDTPF103lhPKVHJw
Qivyyci4GZCGKqNZ1tNtrI03rmBEoJHUsJag5WCLCievg1AkGmVGl51MaLOFHT4Bv61l2l8Gy0O0
KeifHbixIXynMClnFnMutlvLMxMqQ3VpSNAqoU1/H5Xl9AVOC3Oxp+N295CLrYD1Yt0hPYz08IBw
GdgS9Lzn/Z1aydXYwVa/z8Wwnx3oU0xPD4NCe6US3iBZytfrrA0bso8eTVINH7AZ5MoSJEuxv6LC
JCM=
=OpYN
-----END PGP SIGNATURE-----

--------------IE1xyyFSyXG8BNqQk00ceaEh--
