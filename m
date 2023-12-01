Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0680056D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C0610E088;
	Fri,  1 Dec 2023 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8075210E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:22:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7959D21BBF;
 Fri,  1 Dec 2023 08:22:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 343B61344E;
 Fri,  1 Dec 2023 08:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id b1aVC66XaWUTVAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Dec 2023 08:22:06 +0000
Message-ID: <038bc33b-1bc9-4dbc-bea3-d17a3d37abf0@suse.de>
Date: Fri, 1 Dec 2023 09:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/8] drm/plane-helper: Move drm_plane_helper_atomic_check() into
 udl
To: Sui Jingfeng <sui.jingfeng@linux.dev>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
References: <20231128104723.20622-2-tzimmermann@suse.de>
 <9a741d8d-a699-4fe8-af59-f90c91014d01@linux.dev>
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
In-Reply-To: <9a741d8d-a699-4fe8-af59-f90c91014d01@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EEs1PzsxZECZwTHn0LVDlFrT"
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de; dkim=none;
 dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de
 (policy=none); 
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [0.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 R_SPF_SOFTFAIL(4.60)[~all:c]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[11]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,kernel.org,linux.intel.com,ffwll.ch,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-0.999];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Spam-Score: 0.80
X-Rspamd-Queue-Id: 7959D21BBF
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
Cc: amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EEs1PzsxZECZwTHn0LVDlFrT
Content-Type: multipart/mixed; boundary="------------E70ZifiODhkAg82sNZQVQ2SH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
Cc: javierm@redhat.com, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Message-ID: <038bc33b-1bc9-4dbc-bea3-d17a3d37abf0@suse.de>
Subject: Re: [1/8] drm/plane-helper: Move drm_plane_helper_atomic_check() into
 udl
References: <20231128104723.20622-2-tzimmermann@suse.de>
 <9a741d8d-a699-4fe8-af59-f90c91014d01@linux.dev>
In-Reply-To: <9a741d8d-a699-4fe8-af59-f90c91014d01@linux.dev>

--------------E70ZifiODhkAg82sNZQVQ2SH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMTIuMjMgdW0gMDM6MzYgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjMvMTEvMjggMTg6NDUsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gVGhlIHVkbCBkcml2ZXIgaXMgdGhlIG9ubHkgY2FsbGVyIG9mIGRybV9wbGFu
ZV9oZWxwZXJfYXRvbWljX2NoZWNrKCkuDQo+PiBNb3ZlIHRoZSBmdW5jdGlvbiBpbnRvIHRo
ZSBkcml2ZXIuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZV9oZWxwZXIuYyB8IDMyIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9k
ZXNldC5jwqAgfCAxOSArKysrKysrKysrKysrKysrLS0NCj4+IMKgIGluY2x1ZGUvZHJtL2Ry
bV9wbGFuZV9oZWxwZXIuaMKgwqDCoMKgIHzCoCAyIC0tDQo+PiDCoCAzIGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lX2hlbHBlci5jIA0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lX2hlbHBlci5jDQo+PiBpbmRleCA1ZTk1MDg5Njc2ZmY4Li43
OTgyYmU0YjAzMDZkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZV9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZV9oZWxwZXIu
Yw0KPj4gQEAgLTI3OSwzNSArMjc5LDMgQEAgdm9pZCBkcm1fcGxhbmVfaGVscGVyX2Rlc3Ry
b3koc3RydWN0IGRybV9wbGFuZSANCj4+ICpwbGFuZSkNCj4+IMKgwqDCoMKgwqAga2ZyZWUo
cGxhbmUpOw0KPj4gwqAgfQ0KPj4gwqAgRVhQT1JUX1NZTUJPTChkcm1fcGxhbmVfaGVscGVy
X2Rlc3Ryb3kpOw0KPj4gLQ0KPj4gLS8qKg0KPj4gLSAqIGRybV9wbGFuZV9oZWxwZXJfYXRv
bWljX2NoZWNrKCkgLSBIZWxwZXIgdG8gY2hlY2sgcGxhbmUgYXRvbWljLXN0YXRlDQo+PiAt
ICogQHBsYW5lOiBwbGFuZSB0byBjaGVjaw0KPj4gLSAqIEBzdGF0ZTogYXRvbWljIHN0YXRl
IG9iamVjdA0KPj4gLSAqDQo+PiAtICogUHJvdmlkZXMgYSBkZWZhdWx0IHBsYW5lLXN0YXRl
IGNoZWNrIGhhbmRsZXIgZm9yIHBsYW5lcyB3aG9zZSANCj4+IGF0b21pYy1zdGF0ZQ0KPj4g
LSAqIHNjYWxlIGFuZCBwb3NpdGlvbmluZyBhcmUgbm90IGV4cGVjdGVkIHRvIGNoYW5nZSBz
aW5jZSB0aGUgcGxhbmUgDQo+PiBpcyBhbHdheXMNCj4+IC0gKiBhIGZ1bGxzY3JlZW4gc2Nh
bm91dCBidWZmZXIuDQo+PiAtICoNCj4+IC0gKiBUaGlzIGlzIG9mdGVuIHRoZSBjYXNlIGZv
ciB0aGUgcHJpbWFyeSBwbGFuZSBvZiBzaW1wbGUgDQo+PiBmcmFtZWJ1ZmZlcnMuIFNlZQ0K
Pj4gLSAqIGFsc28gZHJtX2NydGNfaGVscGVyX2F0b21pY19jaGVjaygpIGZvciB0aGUgcmVz
cGVjdGl2ZSBDUlRDLXN0YXRlIA0KPj4gY2hlY2sNCj4+IC0gKiBoZWxwZXIgZnVuY3Rpb24u
DQo+PiAtICoNCj4+IC0gKiBSRVRVUk5TOg0KPj4gLSAqIFplcm8gb24gc3VjY2Vzcywgb3Ig
YW4gZXJybm8gY29kZSBvdGhlcndpc2UuDQo+PiAtICovDQo+PiAtaW50IGRybV9wbGFuZV9o
ZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgDQo+
PiBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4+IC17DQo+PiAtwqDCoMKgIHN0cnVjdCBk
cm1fcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZSA9IA0KPj4gZHJtX2F0b21pY19nZXRf
bmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1f
Y3J0YyAqbmV3X2NydGMgPSBuZXdfcGxhbmVfc3RhdGUtPmNydGM7DQo+PiAtwqDCoMKgIHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUgPSBOVUxMOw0KPj4gLQ0KPj4g
LcKgwqDCoCBpZiAobmV3X2NydGMpDQo+PiAtwqDCoMKgwqDCoMKgwqAgbmV3X2NydGNfc3Rh
dGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgbmV3X2NydGMpOw0K
Pj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVf
c3RhdGUobmV3X3BsYW5lX3N0YXRlLCANCj4+IG5ld19jcnRjX3N0YXRlLA0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1BM
QU5FX05PX1NDQUxJTkcsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fUExBTkVfTk9fU0NBTElORywNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhbHNlLCBm
YWxzZSk7DQo+PiAtfQ0KPj4gLUVYUE9SVF9TWU1CT0woZHJtX3BsYW5lX2hlbHBlcl9hdG9t
aWNfY2hlY2spOw0KPiANCj4gDQo+IFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgcmVtb3ZlZCwg
ZG9lcyB0aGUgY29tbWVudHMgb2YgdGhlIA0KPiBkcm1fY3J0Y19oZWxwZXJfYXRvbWljX2No
ZWNrKCkNCj4gZnVuY3Rpb24gKGluIHRoZSBkcm1fY3J0Y19oZWxwZXIuYykgbmVlZCB0byB1
cGRhdGUgYXMgd2VsbD8gSSdtIGFzayANCj4gYmVjYXVzZSBJIHNlZSB0aGUNCj4gY29tbWVu
dHMgb2YgdGhlIGRybV9jcnRjX2hlbHBlcl9hdG9taWNfY2hlY2soKSBzdGlsbCByZWZlcmVu
Y2luZyB0aGlzIA0KPiBmdW5jdGlvbi4NCg0KR29vZCBwb2ludC4gSSdsbCB1cGRhdGUgdGhh
dCBjb21tZW50LiBUaGFua3MgZm9yIHJldmlld2luZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bW9kZXNldC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4+
IGluZGV4IDQwODc2YmNkZDc5YTQuLjc3MDIzNTljOTBjMjIgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX21vZGVzZXQuYw0KPj4gQEAgLTIxLDcgKzIxLDYgQEANCj4+IMKgICNp
bmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4NCj4+IMKgICNpbmNs
dWRlIDxkcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0v
ZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4NCj4+IC0jaW5jbHVkZSA8ZHJtL2RybV9w
bGFuZV9oZWxwZXIuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5o
Pg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+PiBAQCAtMjYxLDYgKzI2
MCwyMiBAQCBzdGF0aWMgY29uc3QgdWludDY0X3QgdWRsX3ByaW1hcnlfcGxhbmVfZm10bW9k
c1tdIA0KPj4gPSB7DQo+PiDCoMKgwqDCoMKgIERSTV9GT1JNQVRfTU9EX0lOVkFMSUQNCj4+
IMKgIH07DQo+PiArc3RhdGljIGludCB1ZGxfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgDQo+PiAqcGxhbmUsDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSkNCj4+ICt7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgKm5ld19wbGFuZV9zdGF0ZSA9IA0KPj4gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0
YXRlKHN0YXRlLCBwbGFuZSk7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fY3J0YyAqbmV3X2Ny
dGMgPSBuZXdfcGxhbmVfc3RhdGUtPmNydGM7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fY3J0
Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUgPSBOVUxMOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAo
bmV3X2NydGMpDQo+PiArwqDCoMKgwqDCoMKgwqAgbmV3X2NydGNfc3RhdGUgPSBkcm1fYXRv
bWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgbmV3X2NydGMpOw0KPj4gKw0KPj4gK8Kg
wqDCoCByZXR1cm4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUobmV3X3Bs
YW5lX3N0YXRlLCANCj4+IG5ld19jcnRjX3N0YXRlLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1BMQU5FX05PX1NDQUxJ
TkcsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBEUk1fUExBTkVfTk9fU0NBTElORywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhbHNlLCBmYWxzZSk7DQo+PiAr
fQ0KPj4gKw0KPj4gwqAgc3RhdGljIHZvaWQgdWRsX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0
b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSANCj4+ICpwbGFuZSwNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4+IMKgIHsNCj4+IEBAIC0yOTYsNyArMzEx
LDcgQEAgc3RhdGljIHZvaWQgDQo+PiB1ZGxfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+IMKgIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyANCj4+IHVkbF9wcmltYXJ5X3BsYW5lX2hl
bHBlcl9mdW5jcyA9IHsNCj4+IMKgwqDCoMKgwqAgRFJNX0dFTV9TSEFET1dfUExBTkVfSEVM
UEVSX0ZVTkNTLA0KPj4gLcKgwqDCoCAuYXRvbWljX2NoZWNrID0gZHJtX3BsYW5lX2hlbHBl
cl9hdG9taWNfY2hlY2ssDQo+PiArwqDCoMKgIC5hdG9taWNfY2hlY2sgPSB1ZGxfcHJpbWFy
eV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrLA0KPj4gwqDCoMKgwqDCoCAuYXRvbWljX3Vw
ZGF0ZSA9IHVkbF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlLA0KPj4gwqAg
fTsNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcGxhbmVfaGVscGVyLmggDQo+
PiBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZV9oZWxwZXIuaA0KPj4gaW5kZXggM2E1NzRlOGNk
MjJmNC4uNzVmOWM0ODMwNTY0YSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9w
bGFuZV9oZWxwZXIuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5o
DQo+PiBAQCAtMjYsNyArMjYsNiBAQA0KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
DQo+PiAtc3RydWN0IGRybV9hdG9taWNfc3RhdGU7DQo+PiDCoCBzdHJ1Y3QgZHJtX2NydGM7
DQo+PiDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOw0KPj4gwqAgc3RydWN0IGRybV9tb2Rl
c2V0X2FjcXVpcmVfY3R4Ow0KPj4gQEAgLTQyLDcgKzQxLDYgQEAgaW50IGRybV9wbGFuZV9o
ZWxwZXJfdXBkYXRlX3ByaW1hcnkoc3RydWN0IGRybV9wbGFuZSANCj4+ICpwbGFuZSwgc3Ry
dWN0IGRybV9jcnRjICpjcg0KPj4gwqAgaW50IGRybV9wbGFuZV9oZWxwZXJfZGlzYWJsZV9w
cmltYXJ5KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVf
Y3R4ICpjdHgpOw0KPj4gwqAgdm9pZCBkcm1fcGxhbmVfaGVscGVyX2Rlc3Ryb3koc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUpOw0KPj4gLWludCBkcm1fcGxhbmVfaGVscGVyX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgc3RydWN0IA0KPj4gZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpOw0KPj4gwqAgLyoqDQo+PiDCoMKgICogRFJNX1BMQU5FX05PTl9BVE9N
SUNfRlVOQ1MgLSBEZWZhdWx0IHBsYW5lIGZ1bmN0aW9ucyBmb3IgDQo+PiBub24tYXRvbWlj
IGRyaXZlcnMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------E70ZifiODhkAg82sNZQVQ2SH--

--------------EEs1PzsxZECZwTHn0LVDlFrT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVpl60FAwAAAAAACgkQlh/E3EQov+B9
NA/9HAQ1MbVlu/nnWWMarpik8ASrD6/E0fS8MvtouJsa/Evujrj9iKcpBigo1qGL9KKpWSWATXnp
s9Zfl0ZrGmEJxnucV317M1PEPn6ep581s4EmFf0YYAvT+++S5FxGfMTmkDdhgqyavbPb5qp3XQXi
On0xj1I7V3xWbWzcZc9p7OqXZYpmt1MIW0yg92xYu2QW7X0gNb7ZSHxtG3LWFJi/sGaIxPtWupYY
WX+LO61U4GoRyx1bsc5uiyZ1nm0O4s34TD+MFMBDSB/zVPF1MmgzHx1ZxjBSK9R9rlimNIcgPdSw
JI/yS9Nr7MYV9XUl/GPjQAtWPKaPCkpnpU0mzUPwsiyZbwDlSnDXqIU5/B+GNKSo2rfJYhLpa78B
WYA1Oap+Og7AhlqiD7ga+mSHWEvDCBGWULg1VqiA1urWnQIgUqDgZUz8rCAxxYInuc4t5W7t1G34
yt45RzSaPpHxF7LqcykEcgsp89WEpOfceDQ+Yenc/lt9qZVkfEt1bjC5qKVKveWT30tlkFkF31Yv
zugeYiDgwTdvt//D7B7duBKm94SUpKPkpsdW+ow+zZTx6ktgXG3UHzd85x0ai7v91FaOgYYpAanb
UVLgqqbN1AoVfhbAM9pICQz9Rp1i+E9Cy2iQyRtyLVpBBOs51zuZ7hbH12Smrom2cB3FZWF+TKoL
/MY=
=nTfR
-----END PGP SIGNATURE-----

--------------EEs1PzsxZECZwTHn0LVDlFrT--
