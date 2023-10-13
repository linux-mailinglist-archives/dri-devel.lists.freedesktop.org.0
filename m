Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7D7C7E3F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CE710E5BA;
	Fri, 13 Oct 2023 06:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69510E5BA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:56:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 832AE1FD7F;
 Fri, 13 Oct 2023 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697180169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iC5xG2dkuARYh+ufKdzBKK3ruYfmvxzyiAwACTALF5I=;
 b=eCn+GnNeOXJwINRjvJZ/JoooGnKHO4RRpDVyQ4M/tJej7IPJFoAIE8VEssan1oEVMTbWJh
 jA+1GyVHcmVLvocO1tZQbJfScRiq4soRrD85xdwFItdHcwIp1f5DymmuwT9QT6pJSb1GVC
 xmphn7762R/YZWhIskOrjlBwgBgmZ/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697180169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iC5xG2dkuARYh+ufKdzBKK3ruYfmvxzyiAwACTALF5I=;
 b=NQuIVeaqrbfRR3MsGM8DWUkJnxP+E494zL3w+Pw1k3TPkTcx3mL/VM7zU5C1XXuHFbT1Xh
 YmaAwhS4kI3iQ3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 680841358F;
 Fri, 13 Oct 2023 06:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 675hGAnqKGULRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Oct 2023 06:56:09 +0000
Message-ID: <d7011af6-6955-4ce9-8d8b-5b6dd6cfd829@suse.de>
Date: Fri, 13 Oct 2023 08:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iosys-map: Clean up errors in iosys-map.h
To: chenguohua@jari.cn
References: <14ac9e76.941.18b26f86290.Coremail.chenguohua@jari.cn>
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
In-Reply-To: <14ac9e76.941.18b26f86290.Coremail.chenguohua@jari.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oqVBiOxNQVXnU6hpVPz7xlXx"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -12.09
X-Spamd-Result: default: False [-12.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; TO_DN_NONE(0.00)[];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oqVBiOxNQVXnU6hpVPz7xlXx
Content-Type: multipart/mixed; boundary="------------vAMMIhEYx0HC0OdizLS7C3GL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: chenguohua@jari.cn
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d7011af6-6955-4ce9-8d8b-5b6dd6cfd829@suse.de>
Subject: Re: [PATCH] iosys-map: Clean up errors in iosys-map.h
References: <14ac9e76.941.18b26f86290.Coremail.chenguohua@jari.cn>
In-Reply-To: <14ac9e76.941.18b26f86290.Coremail.chenguohua@jari.cn>

--------------vAMMIhEYx0HC0OdizLS7C3GL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMTAuMjMgdW0gMDQ6NTggc2NocmllYiBjaGVuZ3VvaHVhQGphcmkuY246
DQo+IEZpeCB0aGUgZm9sbG93aW5nIGVycm9ycyByZXBvcnRlZCBieSBjaGVja3BhdGNoOg0K
PiANCj4gRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnOicgKGN0eDpWeFcp
DQoNClRoaXMgbG9va3MgbGlrZSBhIGZhbHNlLXBvc2l0aXZlIHJlcG9ydCBhbmQgSSdkIHNh
eSB0aGF0IGNoZWNrcGF0Y2ggDQphc3N1bWVzIHRoYXQgaXQncyBhID86IG9wZXJhdG9yLiBC
dXQgdGhlc2UgbWFjcm9zIGNvbnRhaW4gX0dlbmVyaWMgDQpzdGF0ZW1lbnRzLCB3aGljaCBh
cmUgc2ltaWxhciB0byBzd2l0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEd1b0h1YSBDaGVuZyA8Y2hlbmd1b2h1YUBqYXJpLmNuPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oIHwgMjAgKysrKysrKysrKy0tLS0t
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaCBi
L2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4gaW5kZXggY2I3MWFhNjE2YmQzLi4xMDhm
ZDBkZDkxMjEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4g
KysrIGIvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaA0KPiBAQCAtMzQ5LDI5ICszNDksMjkg
QEAgc3RhdGljIGlubGluZSB2b2lkIGlvc3lzX21hcF9tZW1zZXQoc3RydWN0IGlvc3lzX21h
cCAqZHN0LCBzaXplX3Qgb2Zmc2V0LA0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfNjRCSVQN
Cj4gICAjZGVmaW5lIF9faW9zeXNfbWFwX3JkX2lvX3U2NF9jYXNlKHZhbF8sIHZhZGRyX2lv
bWVtXykJCQkJXA0KPiAtCXU2NDogdmFsXyA9IHJlYWRxKHZhZGRyX2lvbWVtXykNCj4gKwl1
NjQgOiB2YWxfID0gcmVhZHEodmFkZHJfaW9tZW1fKQ0KPiAgICNkZWZpbmUgX19pb3N5c19t
YXBfd3JfaW9fdTY0X2Nhc2UodmFsXywgdmFkZHJfaW9tZW1fKQkJCQlcDQo+IC0JdTY0OiB3
cml0ZXEodmFsXywgdmFkZHJfaW9tZW1fKQ0KPiArCXU2NCA6IHdyaXRlcSh2YWxfLCB2YWRk
cl9pb21lbV8pDQo+ICAgI2Vsc2UNCj4gICAjZGVmaW5lIF9faW9zeXNfbWFwX3JkX2lvX3U2
NF9jYXNlKHZhbF8sIHZhZGRyX2lvbWVtXykJCQkJXA0KPiAtCXU2NDogbWVtY3B5X2Zyb21p
bygmKHZhbF8pLCB2YWRkcl9pb21lbV8sIHNpemVvZih1NjQpKQ0KPiArCXU2NCA6IG1lbWNw
eV9mcm9taW8oJih2YWxfKSwgdmFkZHJfaW9tZW1fLCBzaXplb2YodTY0KSkNCj4gICAjZGVm
aW5lIF9faW9zeXNfbWFwX3dyX2lvX3U2NF9jYXNlKHZhbF8sIHZhZGRyX2lvbWVtXykJCQkJ
XA0KPiAtCXU2NDogbWVtY3B5X3RvaW8odmFkZHJfaW9tZW1fLCAmKHZhbF8pLCBzaXplb2Yo
dTY0KSkNCj4gKwl1NjQgOiBtZW1jcHlfdG9pbyh2YWRkcl9pb21lbV8sICYodmFsXyksIHNp
emVvZih1NjQpKQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAgICNkZWZpbmUgX19pb3N5c19tYXBf
cmRfaW8odmFsX18sIHZhZGRyX2lvbWVtX18sIHR5cGVfXykgX0dlbmVyaWModmFsX18sCQlc
DQo+IC0JdTg6IHZhbF9fID0gcmVhZGIodmFkZHJfaW9tZW1fXyksCQkJCQlcDQo+IC0JdTE2
OiB2YWxfXyA9IHJlYWR3KHZhZGRyX2lvbWVtX18pLAkJCQkJXA0KPiAtCXUzMjogdmFsX18g
PSByZWFkbCh2YWRkcl9pb21lbV9fKSwJCQkJCVwNCj4gKwl1OCA6IHZhbF9fID0gcmVhZGIo
dmFkZHJfaW9tZW1fXyksCQkJCQlcDQo+ICsJdTE2IDogdmFsX18gPSByZWFkdyh2YWRkcl9p
b21lbV9fKSwJCQkJCVwNCj4gKwl1MzIgOiB2YWxfXyA9IHJlYWRsKHZhZGRyX2lvbWVtX18p
LAkJCQkJXA0KPiAgIAlfX2lvc3lzX21hcF9yZF9pb191NjRfY2FzZSh2YWxfXywgdmFkZHJf
aW9tZW1fXykpDQo+ICAgDQo+ICAgI2RlZmluZSBfX2lvc3lzX21hcF9yZF9zeXModmFsX18s
IHZhZGRyX18sIHR5cGVfXykJCQkJXA0KPiAgIAl2YWxfXyA9IFJFQURfT05DRSgqKHR5cGVf
XyAqKSh2YWRkcl9fKSkNCj4gICANCj4gICAjZGVmaW5lIF9faW9zeXNfbWFwX3dyX2lvKHZh
bF9fLCB2YWRkcl9pb21lbV9fLCB0eXBlX18pIF9HZW5lcmljKHZhbF9fLAkJXA0KPiAtCXU4
OiB3cml0ZWIodmFsX18sIHZhZGRyX2lvbWVtX18pLAkJCQkJXA0KPiAtCXUxNjogd3JpdGV3
KHZhbF9fLCB2YWRkcl9pb21lbV9fKSwJCQkJCVwNCj4gLQl1MzI6IHdyaXRlbCh2YWxfXywg
dmFkZHJfaW9tZW1fXyksCQkJCQlcDQo+ICsJdTggOiB3cml0ZWIodmFsX18sIHZhZGRyX2lv
bWVtX18pLAkJCQkJXA0KPiArCXUxNiA6IHdyaXRldyh2YWxfXywgdmFkZHJfaW9tZW1fXyks
CQkJCQlcDQo+ICsJdTMyIDogd3JpdGVsKHZhbF9fLCB2YWRkcl9pb21lbV9fKSwJCQkJCVwN
Cj4gICAJX19pb3N5c19tYXBfd3JfaW9fdTY0X2Nhc2UodmFsX18sIHZhZGRyX2lvbWVtX18p
KQ0KPiAgIA0KPiAgICNkZWZpbmUgX19pb3N5c19tYXBfd3Jfc3lzKHZhbF9fLCB2YWRkcl9f
LCB0eXBlX18pCQkJCVwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBU
b3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0K
SFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------vAMMIhEYx0HC0OdizLS7C3GL--

--------------oqVBiOxNQVXnU6hpVPz7xlXx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUo6gkFAwAAAAAACgkQlh/E3EQov+A0
6g//QvNDef+SKvuQ3o1WxEuLcABLcTqJfTtX14OFhMR/NxPpC1XNAlvPpu2bLVqBwxOsZYHEJxtK
ZGc07w33DCPc8hIavr5YNJcGcbOJiBvrh7AEJgb0eH3kRXSrmrtKdpO+qMBjJG2wIyF2CIUdbZ23
xvjC4DeJ8I0jIK2k9v5Px2/SjcHP1bwnLji2fNRqujfbe67mlwbUjjBm9DPrRY7GyL+5abUxbEgb
FEHOsB7i606/jg2XfY5vY2PzGWTjLZPaXEyc9am+hIBgVbQADweE7ScZSoHF8fyiI4fKP0JE5Usz
xQZbvGR6uOA5/uFhaiA9fbxKh7gp4nzY1haGcUhdnOyGXqJcsGdQEiusFrNBwohqJArBDaagp8b0
3z7DahhHX1EC6KLxJW3SAjWZIKwZy9oe43x7wz/2X6FUSg+YsXsI88aPn9umbrcRWO6Eck74MEWh
mHkgDjXRF4defE5FlJx/FQ1SCrbZQ8pJRQZiEnTfRuDKIf+9LdqGkKUmHSy7OwLULhzfQJ8mc5BW
qJRWab3TfS1AjU1E4ndq0jKrBGh0eULikzPrWC5Wv0OZcbHVeMsxKbqlOJ1eLlKN89aAXcitQO07
+7VUAoaALUAyco8yZ+uxraa/phF6ssdBJiaPOt44841Rw0uzhbBhY8MyLHl+3JznhKjtgB+JLaLq
AhM=
=MBzz
-----END PGP SIGNATURE-----

--------------oqVBiOxNQVXnU6hpVPz7xlXx--
