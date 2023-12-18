Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F09817AD1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1010E3FD;
	Mon, 18 Dec 2023 19:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA04610E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99E531FD57;
 Mon, 18 Dec 2023 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702899099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aNDqsuKiN2qZWwrQbFofWeJ5QmQvAfowiFedUmdZxJw=;
 b=lc2ouZMT8WpPIxij0e/lV2f/+qOpTvxBqWKS+1Uqt7A//FYjj3WHtNAe+cHle3cTSFW4CQ
 5GgBgksnap4v3Oyz+LmZ9qCfwQF4Bx2ytDeRXdUlSAZIsNkQLgsUU4u7Yza6wbvUOA01n3
 f4iD2GmBXm2jvFBY/AeWD/Y66PhlS0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702899099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aNDqsuKiN2qZWwrQbFofWeJ5QmQvAfowiFedUmdZxJw=;
 b=VED5cc0fpQ3fSMa9G4SRIua8a5wzSmkSUnSxLpryZFOkloN93EfRRm1eGC7Sbfbxe408yk
 5Lie3Oyg34oq6sBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702899099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aNDqsuKiN2qZWwrQbFofWeJ5QmQvAfowiFedUmdZxJw=;
 b=lc2ouZMT8WpPIxij0e/lV2f/+qOpTvxBqWKS+1Uqt7A//FYjj3WHtNAe+cHle3cTSFW4CQ
 5GgBgksnap4v3Oyz+LmZ9qCfwQF4Bx2ytDeRXdUlSAZIsNkQLgsUU4u7Yza6wbvUOA01n3
 f4iD2GmBXm2jvFBY/AeWD/Y66PhlS0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702899099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aNDqsuKiN2qZWwrQbFofWeJ5QmQvAfowiFedUmdZxJw=;
 b=VED5cc0fpQ3fSMa9G4SRIua8a5wzSmkSUnSxLpryZFOkloN93EfRRm1eGC7Sbfbxe408yk
 5Lie3Oyg34oq6sBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5933E13BC8;
 Mon, 18 Dec 2023 11:31:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qw9OFJstgGXYNwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Dec 2023 11:31:39 +0000
Message-ID: <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
Date: Mon, 18 Dec 2023 12:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
References: <20231214163849.359691-1-jfalempe@redhat.com>
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
In-Reply-To: <20231214163849.359691-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DeDvKaxP7h9T1G30F0aFAcpi"
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [-4.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: -4.09
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
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DeDvKaxP7h9T1G30F0aFAcpi
Content-Type: multipart/mixed; boundary="------------2wCfWV9HHgaS7L6XdmQ0a40h";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Message-ID: <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
References: <20231214163849.359691-1-jfalempe@redhat.com>
In-Reply-To: <20231214163849.359691-1-jfalempe@redhat.com>

--------------2wCfWV9HHgaS7L6XdmQ0a40h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTIuMjMgdW0gMTc6Mzggc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFdoZW4gbWdhZzIwMCBzd2l0Y2hlZCBmcm9tIHNpbXBsZSBLTVMgdG8gcmVndWxhciBhdG9t
aWMgaGVscGVycywNCj4gdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBnYW1tYSBzZXR0aW5n
cyB3YXMgbG9zdC4NCj4gVGhpcyBsZWFkcyB0byBhIGJsYWNrIHNjcmVlbiwgaWYgdGhlIGJp
b3MvdWVmaSBkb2Vzbid0IHVzZSB0aGUgc2FtZQ0KPiBwaXhlbCBjb2xvciBkZXB0aC4NCj4g
VGhpcyBoYXMgYmVlbiBmaXhlZCB3aXRoIGNvbW1pdCBhZDgxZTIzNDI2YTYgKCJkcm0vbWdh
ZzIwMDogRml4IGdhbW1hDQo+IGx1dCBub3QgaW5pdGlhbGl6ZWQuIikgZm9yIG1vc3QgRzIw
MCwgYnV0IEcyMDBFUiwgRzIwMEVWLCBHMjAwU0UgdXNlDQo+IHRoZWlyIG93biB2ZXJzaW9u
IG9mIGNydGNfaGVscGVyX2F0b21pY19lbmFibGUoKSBhbmQgbmVlZCB0byBiZSBmaXhlZA0K
PiB0b28uDQo+IA0KPiBGaXhlczogMWJhZjkxMjdjNDgyICgiZHJtL21nYWcyMDA6IFJlcGxh
Y2Ugc2ltcGxlLUtNUyB3aXRoIHJlZ3VsYXIgYXRvbWljIGhlbHBlcnMiKQ0KPiBDYzogPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICN2Ni4xKw0KPiBSZXBvcnRlZC1ieTogUm9nZXIgU2V3
ZWxsIDxyb2dlci5zZXdlbGxAY2FudGFiLm5ldD4NCj4gU3VnZ2VzdGVkLWJ5OiBSb2dlciBT
ZXdlbGwgPHJvZ2VyLnNld2VsbEBjYW50YWIubmV0Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2Nl
bHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggICAgfCAgNCArKysrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwZXIuYyB8ICAyICsrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwZXYuYyB8ICAyICsrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwc2UuYyB8ICAyICsrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICB8IDI2ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2
LmgNCj4gaW5kZXggNTdjN2VkY2FiNjAyLi5lZDkwYTkyYjVmY2QgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaA0KPiBAQCAtMzkyLDYgKzM5MiwxMCBA
QCB2b2lkIG1nYWcyMDBfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2Rpc2FibGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAgCS5kZXN0cm95ID0gZHJtX3BsYW5lX2NsZWFu
dXAsIFwNCj4gICAJRFJNX0dFTV9TSEFET1dfUExBTkVfRlVOQ1MNCj4gICANCj4gK3ZvaWQg
bWdhZzIwMF9jcnRjX3NldF9nYW1tYShzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwNCj4gKwkJ
CSAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQsDQo+ICsJCQkgICAg
c3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpnYW1tYV9sdXQpOw0KPiArDQo+ICAgZW51bSBk
cm1fbW9kZV9zdGF0dXMgbWdhZzIwMF9jcnRjX2hlbHBlcl9tb2RlX3ZhbGlkKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCj4gICAJCQkJCQkgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUpOw0KPiAgIGludCBtZ2FnMjAwX2NydGNfaGVscGVyX2F0b21pY19jaGVj
ayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpuZXdf
c3RhdGUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9nMjAwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGVyLmMN
Cj4gaW5kZXggYmNlMjY3ZTBmN2RlLi4zODgxNWNiOTRjNjEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGVyLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwZXIuYw0KPiBAQCAtMjAyLDYgKzIwMiw4
IEBAIHN0YXRpYyB2b2lkIG1nYWcyMDBfZzIwMGVyX2NydGNfaGVscGVyX2F0b21pY19lbmFi
bGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgIA0KPiAgIAltZ2FnMjAwX2cyMDBlcl9y
ZXNldF90YWdmaWZvKG1kZXYpOw0KPiAgIA0KPiArCW1nYWcyMDBfY3J0Y19zZXRfZ2FtbWEo
bWRldiwgZm9ybWF0LCBjcnRjX3N0YXRlLT5nYW1tYV9sdXQpOw0KPiArDQo+ICAgCW1nYWcy
MDBfZW5hYmxlX2Rpc3BsYXkobWRldik7DQo+ICAgDQo+ICAgCWlmIChmdW5jcy0+ZW5hYmxl
X3ZpZHJzdCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfZzIwMGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBldi5j
DQo+IGluZGV4IGFjOTU3ZjQyYWJlMS4uZTY5OGEzYTQ5OWJmIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBldi5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMGV2LmMNCj4gQEAgLTIwMyw2ICsyMDMs
OCBAQCBzdGF0aWMgdm9pZCBtZ2FnMjAwX2cyMDBldl9jcnRjX2hlbHBlcl9hdG9taWNfZW5h
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gICANCj4gICAJbWdhZzIwMF9nMjAwZXZf
c2V0X2hpcHJpbHZsKG1kZXYpOw0KPiAgIA0KPiArCW1nYWcyMDBfY3J0Y19zZXRfZ2FtbWEo
bWRldiwgZm9ybWF0LCBjcnRjX3N0YXRlLT5nYW1tYV9sdXQpOw0KPiArDQo+ICAgCW1nYWcy
MDBfZW5hYmxlX2Rpc3BsYXkobWRldik7DQo+ICAgDQo+ICAgCWlmIChmdW5jcy0+ZW5hYmxl
X3ZpZHJzdCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfZzIwMHNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5j
DQo+IGluZGV4IGJkNmU1NzNjOWExYS4uN2U0ZWEwMDQ2YTZiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNlLmMNCj4gQEAgLTMzNCw2ICszMzQs
OCBAQCBzdGF0aWMgdm9pZCBtZ2FnMjAwX2cyMDBzZV9jcnRjX2hlbHBlcl9hdG9taWNfZW5h
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gICANCj4gICAJbWdhZzIwMF9nMjAwc2Vf
c2V0X2hpcHJpbHZsKG1kZXYsIGFkanVzdGVkX21vZGUsIGZvcm1hdCk7DQo+ICAgDQo+ICsJ
bWdhZzIwMF9jcnRjX3NldF9nYW1tYShtZGV2LCBmb3JtYXQsIGNydGNfc3RhdGUtPmdhbW1h
X2x1dCk7DQo+ICsNCj4gICAJbWdhZzIwMF9lbmFibGVfZGlzcGxheShtZGV2KTsNCj4gICAN
Cj4gICAJaWYgKGZ1bmNzLT5lbmFibGVfdmlkcnN0KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiBpbmRleCBhZjNjZTVhNmE2MzYuLmQyYTA0YjMxNzIz
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4g
QEAgLTY1LDkgKzY1LDkgQEAgc3RhdGljIHZvaWQgbWdhZzIwMF9jcnRjX3NldF9nYW1tYV9s
aW5lYXIoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYsDQo+ICAgCX0NCj4gICB9DQo+ICAgDQo+
IC1zdGF0aWMgdm9pZCBtZ2FnMjAwX2NydGNfc2V0X2dhbW1hKHN0cnVjdCBtZ2FfZGV2aWNl
ICptZGV2LA0KPiAtCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1h
dCwNCj4gLQkJCQkgICBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0KQ0KPiArc3RhdGljIHZv
aWQgbWdhZzIwMF9jcnRjX3NldF9nYW1tYV90YWJsZShzdHJ1Y3QgbWdhX2RldmljZSAqbWRl
diwNCj4gKwkJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdCwNCj4g
KwkJCQkJIHN0cnVjdCBkcm1fY29sb3JfbHV0ICpsdXQpDQo+ICAgew0KPiAgIAlpbnQgaTsN
Cj4gICANCj4gQEAgLTEwMyw2ICsxMDMsMTYgQEAgc3RhdGljIHZvaWQgbWdhZzIwMF9jcnRj
X3NldF9nYW1tYShzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwNCj4gICAJfQ0KPiAgIH0NCj4g
ICANCj4gK3ZvaWQgbWdhZzIwMF9jcnRjX3NldF9nYW1tYShzdHJ1Y3QgbWdhX2RldmljZSAq
bWRldiwNCj4gKwkJCSAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQs
DQo+ICsJCQkgICAgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpnYW1tYV9sdXQpDQo+ICt7
DQo+ICsJaWYgKGdhbW1hX2x1dCkNCj4gKwkJbWdhZzIwMF9jcnRjX3NldF9nYW1tYV90YWJs
ZShtZGV2LCBmb3JtYXQsIGdhbW1hX2x1dC0+ZGF0YSk7DQo+ICsJZWxzZQ0KPiArCQltZ2Fn
MjAwX2NydGNfc2V0X2dhbW1hX2xpbmVhcihtZGV2LCBmb3JtYXQpOw0KPiArfQ0KDQpQbGVh
c2Uga2VlcCB0aGlzIG9wZW4tY29kZWQgaXRzIGNhbGxlcnMuIFdpdGggdGhhdCBjaGFuZ2Vk
DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCg0KPiArDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIG1nYV93YWl0X3ZzeW5jKHN0cnVj
dCBtZ2FfZGV2aWNlICptZGV2KQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyB0aW1lb3V0
ID0gamlmZmllcyArIEhaLzEwOw0KPiBAQCAtNjE2LDEwICs2MjYsNyBAQCB2b2lkIG1nYWcy
MDBfY3J0Y19oZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3Ry
dWN0IGRybV9hdG9taWNfcw0KPiAgIAlpZiAoY3J0Y19zdGF0ZS0+ZW5hYmxlICYmIGNydGNf
c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkgew0KPiAgIAkJY29uc3Qgc3RydWN0IGRybV9m
b3JtYXRfaW5mbyAqZm9ybWF0ID0gbWdhZzIwMF9jcnRjX3N0YXRlLT5mb3JtYXQ7DQo+ICAg
DQo+IC0JCWlmIChjcnRjX3N0YXRlLT5nYW1tYV9sdXQpDQo+IC0JCQltZ2FnMjAwX2NydGNf
c2V0X2dhbW1hKG1kZXYsIGZvcm1hdCwgY3J0Y19zdGF0ZS0+Z2FtbWFfbHV0LT5kYXRhKTsN
Cj4gLQkJZWxzZQ0KPiAtCQkJbWdhZzIwMF9jcnRjX3NldF9nYW1tYV9saW5lYXIobWRldiwg
Zm9ybWF0KTsNCj4gKwkJbWdhZzIwMF9jcnRjX3NldF9nYW1tYShtZGV2LCBmb3JtYXQsIGNy
dGNfc3RhdGUtPmdhbW1hX2x1dCk7DQo+ICAgCX0NCj4gICB9DQo+ICAgDQo+IEBAIC02NDIs
MTAgKzY0OSw3IEBAIHZvaWQgbWdhZzIwMF9jcnRjX2hlbHBlcl9hdG9taWNfZW5hYmxlKHN0
cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfDQo+ICAgCWlmIChmdW5j
cy0+cGl4cGxsY19hdG9taWNfdXBkYXRlKQ0KPiAgIAkJZnVuY3MtPnBpeHBsbGNfYXRvbWlj
X3VwZGF0ZShjcnRjLCBvbGRfc3RhdGUpOw0KPiAgIA0KPiAtCWlmIChjcnRjX3N0YXRlLT5n
YW1tYV9sdXQpDQo+IC0JCW1nYWcyMDBfY3J0Y19zZXRfZ2FtbWEobWRldiwgZm9ybWF0LCBj
cnRjX3N0YXRlLT5nYW1tYV9sdXQtPmRhdGEpOw0KPiAtCWVsc2UNCj4gLQkJbWdhZzIwMF9j
cnRjX3NldF9nYW1tYV9saW5lYXIobWRldiwgZm9ybWF0KTsNCj4gKwltZ2FnMjAwX2NydGNf
c2V0X2dhbW1hKG1kZXYsIGZvcm1hdCwgY3J0Y19zdGF0ZS0+Z2FtbWFfbHV0KTsNCj4gICAN
Cj4gICAJbWdhZzIwMF9lbmFibGVfZGlzcGxheShtZGV2KTsNCj4gICANCj4gDQo+IGJhc2Ut
Y29tbWl0OiA2YzlkYmVlODRjZDAwNWJlZDVmOWQwN2IzYTI3OTdhZTY0MTRiNDM1DQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------2wCfWV9HHgaS7L6XdmQ0a40h--

--------------DeDvKaxP7h9T1G30F0aFAcpi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWALZoFAwAAAAAACgkQlh/E3EQov+Di
LA//ZXXlnz9FHXAzkfGZp2T2JD8S88tCVvIzCn88gOmCTTjbFcDNLjifcEnA769TqEARoEH38tt8
yEPb3qLRIu43Tsh/pnRVfQuJM7ByRhVamTvAmx21GQ3h+q8m8WFScaZW9uS/otBrgB0PLeGpH2R8
pj0W8u5rEyti+2ph9E5aVOdEI3PG0SW1TxOL/62eliCNqc/TmNMTOZzOtrAmrNvJc95Tt4ppyZOC
5VGLhhD1wEoZu1/2m7ynjLe/NVzS2Q5fR27FxwJn17ZScOU9YZtGTV+8kBXL1ujdQcpzKX4qvSfz
uKPk/Mai6zqlo3UNaBVHPS/VHHzJO17NwDfml92osyNr1zAiFm1ug1ECtbFJXFxFlwLUfyuuwTbc
oF7/taJgJi4C/Z2Ok1qiuIe/ntcR7MU9n59iF2kqkJk0wO3y+ytlQqR67SOZWDNMFtXXjpHNR3V3
OP/jKtf/DMW30CDfmWR5eJzhyFPFu8z0Ra3Xl+hjh+gUScwBh5bvsGcA5V5jjt+0L7Z/k/3FHSsR
DXgWMxK5yC76Siq3EtEfnydOv3XxzHHnQQsK3m+UTGHwDDAIXZ7To+di2wvoAzzkk8+xNvdSmnYA
3zJK5oLO7WewwUblJL0J/WPHQ0w3Etkx0vNocC5pdPLGfatcTfkGNrPDJcfLtI7Fw1yThtLrPLyR
hmI=
=zqkX
-----END PGP SIGNATURE-----

--------------DeDvKaxP7h9T1G30F0aFAcpi--
