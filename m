Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDC806A93
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7C610E0F1;
	Wed,  6 Dec 2023 09:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70A10E0F1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:20:32 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5BB021E58;
 Wed,  6 Dec 2023 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701854430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fxuna5gJRLzr0rCtYGEQajcGt0MEJjF0RqMFz1tH2qQ=;
 b=Sw+mmOUnPKZ/JCvb6d9uWjjaDMe8oL2LcMq72B/JdutsnJvx7lkMjOAtFjbmIh4WrRM4Wq
 4mBJGiQP8LvX+KBjxT1RwAAyUfE7Ag2UBymcw8hBjGcyrVwC7tp+ib9km7pYjgT9zgtMK/
 RFLAlOmi//tjU0HwHRJ5FbQ2yHEX1gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701854430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fxuna5gJRLzr0rCtYGEQajcGt0MEJjF0RqMFz1tH2qQ=;
 b=9RQAa3P9qYGk8FGudHE2aupPNfA7eELUKn4s0w13A69OKLsjwkUevlRo9GjzVmJOE8dbnY
 5BmLnSRP98a7C9CQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 97C3013403;
 Wed,  6 Dec 2023 09:20:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id s6fXI948cGVmMwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 09:20:30 +0000
Message-ID: <e5d76f8e-98ab-4d49-aecf-14d0b581fa46@suse.de>
Date: Wed, 6 Dec 2023 10:20:29 +0100
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
 boundary="------------MMjpKuahOdeaeBtBTJ8KwFuK"
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; TO_DN_NONE(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 BAYES_HAM(-3.00)[100.00%]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -5.29
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
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
--------------MMjpKuahOdeaeBtBTJ8KwFuK
Content-Type: multipart/mixed; boundary="------------Y0sd7ZAv0zl7iB7Z725ZRRhj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e5d76f8e-98ab-4d49-aecf-14d0b581fa46@suse.de>
Subject: Re: [PATCH 00/14] drm: Remove infrastructure for user-space mode
 setting
References: <20231122122449.11588-1-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>

--------------Y0sd7ZAv0zl7iB7Z725ZRRhj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dCwgZXhjZXB0IGZvciBwYXRjaCAxLiBJdCdzIGZh
aXJseSBpbmRlcGVuZGVudCANCmZyb20gdGhlIG90aGVyIHBhdGNoZXMgYW5kIEknbGwgcmVz
ZW5kIGl0IGRpcmVjdGx5IHRvIHRoZSB0aGUgUFBDIGxpc3QuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCkFtIDIyLjExLjIzIHVtIDEzOjA5IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1h
bm46DQo+IFRoZSBvbGQgZHJpdmVycyBmb3IgdXNlci1zcGFjZSBtb2RlIHNldHRpbmcgaGF2
ZSBiZWVuIHJlbW92ZWQgaW4gTGludXgNCj4gdjYuMy4gTm8gb25lIGhhcyBjb21wbGFpbmVk
IG9yIHJlcXVlc3RlZCB0aGVpciByZXR1cm4uIEl0IGlzIHRpbWUgdG8NCj4gcmVtb3ZlIHRo
ZXNlIGRyaXZlcnMnIGluZnJhc3RydWN0dXJlIGZyb20gdGhlIERSTSBjb3JlLg0KPiANCj4g
VGhlIHJlY2VudCBMaW51eCB2Ni42IGhhcyBiZWVuIGRlc2lnbmF0ZWQgYXMgbG9uZy10ZXJt
IHJlbGVhc2UsIFsxXSBzbw0KPiBhbnkgcmVtYWluaW5nIHVzZXJzIGhhdmUgYSBmZXcgbW9y
ZSB5ZWFycyB0byBnZXQgYSBuZXcgZ3JhcGhpY3MgY2FyZC4gVGhlDQo+IGxlZ2FjeSBkZXZp
Y2VzIGNvbnRpbnVlIHRvIGJlIHN1cHBvcnRlZCB2aWEgc2ltcGxlZHJtLiBNZXJnaW5nIHBy
b3Blcg0KPiBkcml2ZXJzIHdpdGgga2VybmVsIG1vZGUgc2V0dGluZyBpcyBhbHNvIGFuIG9w
dGlvbi4NCj4gDQo+IFBhdGNoZXMgMSB0byA3IGZpeCBhIGZldyB0cml2aWFsIGlzc3VlcyB0
aGF0IGhhdmUgYmVlbiBmb3Jnb3R0ZW4gZHVyaW5nDQo+IHRoZSByZW1vdmFsIG9mIHRoZSBk
cml2ZXJzLg0KPiANCj4gUGF0Y2hlcyA4IGFuZCA5IHJlbW92ZSB0aGUgbGVhZ2N5IGlvY3Rs
IGludGVyZmFjZXMuIE9uZSBvcCBpcyBkaWZmZXJlbnQNCj4gZnJvbSB0aGUgb3RoZXJzLCBz
byBpdCBnZXRzIGl0cyBvd24gcGF0Y2guDQo+IA0KPiBQYXRjaGVzIDEwIHRvIDEyIHJlbW92
ZSB0aGUgbGVnYWN5IHNvdXJjZSBjb2RlIGZyb20gRFJNLiBXaXRoIHRoYXQgZ29uZQ0KPiBw
YXRjaCAxMywgdGhlIEFHUCBjb2RlIGNhbiBiZSBzaW1wbGlmaWVkIGFzIHdlbGwuIFRoZXJl
IHVzZWQgdG8gYmUNCj4gYSBkZXZpY2UgZmlsZSBmb3IgdXNlci1zcGFjZSBtb2RlIHNldHRp
bmcsIC9kZXYvYWdwZ2FydCwgdGhhdCBpcyBub3cNCj4gb2Jzb2xldGUuDQo+IA0KPiBQYXRj
aCAxNCByZW1vdmVzIHRoZSBvcHRpb24gZnJvbSBLY29uZmlnLg0KPiANCj4gWzFdIGh0dHBz
Oi8va2VybmVsLm9yZy9jYXRlZ29yeS9yZWxlYXNlcy5odG1sDQo+IA0KPiBUaG9tYXMgWmlt
bWVybWFubiAoMTQpOg0KPiAgICBhcmNoL3Bvd2VycGM6IFJlbW92ZSBsZWdhY3kgRFJNIGRy
aXZlcnMgZnJvbSBkZWZhdWx0IGNvbmZpZ3MNCj4gICAgZHJtOiBGaXggVE9ETyBsaXN0IG1l
bnRpb25pbmcgbm9uLUtNUyBkcml2ZXJzDQo+ICAgIGRybTogSW5jbHVkZSA8ZHJtL2RybV9h
dXRoLmg+DQo+ICAgIGRybS9pOTE1OiBJbmNsdWRlIDxkcm0vZHJtX2F1dGguaD4NCj4gICAg
YWNjZWw6IEluY2x1ZGUgPGRybS9kcm1fYXV0aC5oPg0KPiAgICBkcm06IEluY2x1ZGUgPGRy
bS9kcm1fZGV2aWNlLmg+DQo+ICAgIGRybS9yYWRlb246IERvIG5vdCBpbmNsdWRlIDxkcm0v
ZHJtX2xlZ2FjeS5oPg0KPiAgICBkcm06IFJlbW92ZSBlbnRyeSBwb2ludHMgZm9yIGxlZ2Fj
eSBpb2N0bHMNCj4gICAgZHJtOiBSZW1vdmUgdGhlIGxlZ2FjeSBEUk1fSU9DVExfTU9ERVNF
VF9DVEwgaW9jdGwNCj4gICAgZHJtOiBSZW1vdmUgc3VwcG9ydCBmb3IgbGVnYWN5IGRyaXZl
cnMNCj4gICAgZHJtOiBSZW1vdmUgbG9ja2luZyBmb3IgbGVnYWN5IGlvY3RscyBhbmQgRFJN
X1VOTE9DS0VEDQo+ICAgIGRybTogUmVtb3ZlIHNvdXJjZSBjb2RlIGZvciBub24tS01TIGRy
aXZlcnMNCj4gICAgY2hhci9hZ3A6IFJlbW92ZSBmcm9udGVuZCBjb2RlDQo+ICAgIGRybTog
UmVtb3ZlIEtjb25maWcgb3B0aW9uIGZvciBsZWdhY3kgc3VwcG9ydCAoQ09ORklHX0RSTV9M
RUdBQ1kpDQo+IA0KPiAgIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAgICAgICAg
ICAgICAgICB8ICAgIDcgKy0NCj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9wbWFjMzJfZGVm
Y29uZmlnICAgICAgICAgfCAgICAyIC0NCj4gICBhcmNoL3Bvd2VycGMvY29uZmlncy9wcGM2
eHhfZGVmY29uZmlnICAgICAgICAgfCAgICA3IC0NCj4gICBkcml2ZXJzL2FjY2VsL2RybV9h
Y2NlbC5jICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gICBkcml2ZXJzL2NoYXIv
YWdwL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgICA2IC0NCj4gICBkcml2ZXJz
L2NoYXIvYWdwL2FncC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5IC0NCj4gICBk
cml2ZXJzL2NoYXIvYWdwL2JhY2tlbmQuYyAgICAgICAgICAgICAgICAgICAgfCAgIDExIC0N
Cj4gICBkcml2ZXJzL2NoYXIvYWdwL2NvbXBhdF9pb2N0bC5jICAgICAgICAgICAgICAgfCAg
MjkxIC0tLQ0KPiAgIGRyaXZlcnMvY2hhci9hZ3AvY29tcGF0X2lvY3RsLmggICAgICAgICAg
ICAgICB8ICAxMDYgLS0NCj4gICBkcml2ZXJzL2NoYXIvYWdwL2Zyb250ZW5kLmMgICAgICAg
ICAgICAgICAgICAgfCAxMDY4IC0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICAyMSAtDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAxMiAtDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMgICAgICAgICAgICAgIHwgIDQ1MSAtLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jICAgICAgICAgICAgICAgICAgICB8ICAg
IDggKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYyAgICAgICAgICAgICAgICAg
ICAgfCAxNjI3IC0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9j
b250ZXh0LmMgICAgICAgICAgICAgICAgIHwgIDUxMyAtLS0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RtYS5jICAgICAgICAgICAgICAgICAgICAgfCAgMTc4IC0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcnYuYyAgICAgICAgICAgICAgICAgICAgIHwgICAxNyAtDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgICAgICAgICAgICAgICAgICAgIHwgICA2
NCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faGFzaHRhYi5jICAgICAgICAgICAgICAg
ICB8ICAyMDMgLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggICAgICAg
ICAgICAgICAgfCAgICA3IC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgICAg
ICAgICAgICAgICAgICAgfCAgNjEzICstLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2lvY3RsLmMgICAgICAgICAgICAgICAgICAgfCAgIDgyICstDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9pcnEuYyAgICAgICAgICAgICAgICAgICAgIHwgIDIwNCAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5oICAgICAgICAgICAgICAgICAgfCAgMjkwIC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5X21pc2MuYyAgICAgICAgICAgICB8ICAx
MDUgLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2xvY2suYyAgICAgICAgICAgICAgICAg
ICAgfCAgMzczIC0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jICAgICAg
ICAgICAgICAgICAgfCAgMTM4IC0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDIwNCArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3NjYXR0ZXIuYyAgICAgICAgICAgICAgICAgfCAgMjIwIC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fdmJsYW5rLmMgICAgICAgICAgICAgICAgICB8ICAxMDEgLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fdm0uYyAgICAgICAgICAgICAgICAgICAgICB8ICA2NjUgLS0tLS0t
LQ0KPiAgIC4uLi9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyAgICB8
ICAgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5oICAgICAg
ICAgICB8ICAgIDEgLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9hdXRoLmggICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMjIgLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9kZXZpY2UuaCAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNzEgKy0NCj4gICBpbmNsdWRlL2RybS9kcm1fZHJ2Lmgg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE5IC0NCj4gICBpbmNsdWRlL2RybS9kcm1f
ZmlsZS5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1IC0NCj4gICBpbmNsdWRlL2Ry
bS9kcm1faW9jdGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExIC0NCj4gICBpbmNs
dWRlL2RybS9kcm1fbGVnYWN5LmggICAgICAgICAgICAgICAgICAgICAgfCAgMzMxIC0tLS0N
Cj4gICA0MCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA4MDQ1IGRlbGV0aW9u
cygtKQ0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NoYXIvYWdwL2NvbXBhdF9p
b2N0bC5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2hhci9hZ3AvY29tcGF0
X2lvY3RsLmgNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jaGFyL2FncC9mcm9u
dGVuZC5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYWdw
c3VwcG9ydC5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1f
YnVmcy5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fY29u
dGV4dC5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZG1h
LmMNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9oYXNodGFi
LmMNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYw0K
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5oDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5X21pc2Mu
Yw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2xvY2suYw0K
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fc2NhdHRlci5jDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYw0KPiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fbGVnYWN5LmgNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------Y0sd7ZAv0zl7iB7Z725ZRRhj--

--------------MMjpKuahOdeaeBtBTJ8KwFuK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVwPN4FAwAAAAAACgkQlh/E3EQov+BR
LxAAwfec3DUNqLqlWSouIDBfaBxvWrjIHNhl2kl8jo/sTDlOngqmkRl3iA5IqxjlLztZfc1v8O/k
ktxm5gYtnwqDQxw3yB8Ic51BDVfnjWZ2Uc6tKcnrb0Nia/QfUTz2SCXsg7Z1smKyEfl2FClkdovq
S6xilNMaaRFoutzP2IpV78H10k36IWapTIUd/aSYPKUv622eU2sXS3dweZeAgsSZOiNgTXKKuLsU
6YZVT8d3KRfFUSfQgy4ux3sg4Yogrh3sSlq161m6Tuk9+urzMxKPFRDrbuw1JOBiqmJhp2rCA9oO
/f82+T6VZd2RuUl/V18BbVFmfDcbumFG3x2ORe2DNoywF1UBW6gKpLwXd2hOojwrF0baQlI6GUAQ
mRnPZpd85Nzob7CdHDXbKz1xl6rbS0Koaaof00FpdFLsITFcoPmgDzrl+I/3dwe2dyBfkhWZRFWJ
jAKACSLXnbgQfzpMNBawAax1bFozWGxWBUTA9RY4EySSek2vKw/O0hs2sW3+7QCUsKZUSlvbsvCv
l38QrM3W063Xuwag1zF1rpT7+2TyAHnfYkws0E/f1AkjPt4m5KcsF3qLcqk/lBfw7PxO8YtOMnz1
YyUiuLVMQbX8ZiJXOxpQZgX66lYNgiLBb5uTcGgbAJvDD/OJ8dqAcOZa8ITMfvl7n8dnB5KDkKfY
9Po=
=VEye
-----END PGP SIGNATURE-----

--------------MMjpKuahOdeaeBtBTJ8KwFuK--
