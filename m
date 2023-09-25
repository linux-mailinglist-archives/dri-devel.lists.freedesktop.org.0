Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987427AD2AC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 10:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871510E1DB;
	Mon, 25 Sep 2023 08:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107710E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 08:06:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F6FD21871;
 Mon, 25 Sep 2023 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695629197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nKlZkiYEZg84HydCd50oy+SAWL2n1MumwA6jO2Zuyow=;
 b=ccqhmzcRxv8Z0MOGAIxYdvr3lwTO0nIKiJTtisCAFhOP2C/fT4yMAa/Qyr+IHTX/nDdYyG
 QmzTJtz+F7Rir5QV7blpHO7skIqlqBWNcTTqqY2e0TlvL+cJofOExDU6QRlb+OPzujgEg9
 04XNOTPFavOH4h/2vGjZpMzccoOWo0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695629197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nKlZkiYEZg84HydCd50oy+SAWL2n1MumwA6jO2Zuyow=;
 b=cFFREgK2+XbW3UdptXvAhooVKgY8Kis3ODWFnlEJ8n+ux7aXNkp/h8if6H/rgjuO+UmlKy
 VlxQg7AcPrc4vLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1894113A67;
 Mon, 25 Sep 2023 08:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NknLBI0/EWXkUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Sep 2023 08:06:37 +0000
Message-ID: <40de19cc-e01f-4b3e-893a-28a82ded2682@suse.de>
Date: Mon, 25 Sep 2023 10:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230918090400.13264-1-tzimmermann@suse.de>
 <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N49f0PY1h4Flu2XiTlzG7p98"
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 arnd@arndb.de, Linux-sh list <linux-sh@vger.kernel.org>, deller@gmx.de,
 rdunlap@infradead.org, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de,
 oe-kbuild-all@lists.linux.dev, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N49f0PY1h4Flu2XiTlzG7p98
Content-Type: multipart/mixed; boundary="------------IgWtqYNwoUvgFyzMGqa207yo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 arnd@arndb.de, Linux-sh list <linux-sh@vger.kernel.org>, deller@gmx.de,
 rdunlap@infradead.org, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 glaubitz@physik.fu-berlin.de, sam@ravnborg.org
Message-ID: <40de19cc-e01f-4b3e-893a-28a82ded2682@suse.de>
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
References: <20230918090400.13264-1-tzimmermann@suse.de>
 <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>
In-Reply-To: <CAMuHMdWodf+dfrs8wtwsyYJttx448o3AMVFwTXGzFVZ6MU3-Ew@mail.gmail.com>

--------------IgWtqYNwoUvgFyzMGqa207yo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMjUuMDkuMjMgdW0gMDk6MzMgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDEx
OjQ14oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3Rl
Og0KPj4gRml4IGxpbmtlciBlcnJvciBpZiBGQj1tIGFib3V0IG1pc3NpbmcgZmJfaW9fcmVh
ZCBhbmQgZmJfaW9fd3JpdGUuIFRoZQ0KPj4gbGlua2VyJ3MgZXJyb3IgbWVzc2FnZSBzdWdn
ZXN0cyB0aGF0IHRoaXMgY29uZmlnIHNldHRpbmcgaGFzIGFscmVhZHkNCj4+IGJlZW4gYnJv
a2VuIGZvciBvdGhlciBzeW1ib2xzLg0KPj4NCj4+ICAgIEFsbCBlcnJvcnMgKG5ldyBvbmVz
IHByZWZpeGVkIGJ5ID4+KToNCj4+DQo+PiAgICAgICBzaDQtbGludXgtbGQ6IGRyaXZlcnMv
dmlkZW8vZmJkZXYvc2g3NzYwZmIubzogaW4gZnVuY3Rpb24gYHNoNzc2MGZiX3Byb2JlJzoN
Cj4+ICAgICAgIHNoNzc2MGZiLmM6KC50ZXh0KzB4Mzc0KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZnJhbWVidWZmZXJfYWxsb2MnDQo+PiAgICAgICBzaDQtbGludXgtbGQ6IHNoNzc2
MGZiLmM6KC50ZXh0KzB4Mzk0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZmJfdmlkZW9t
b2RlX3RvX3ZhcicNCj4+ICAgICAgIHNoNC1saW51eC1sZDogc2g3NzYwZmIuYzooLnRleHQr
MHgzOWMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmYl9hbGxvY19jbWFwJw0KPj4gICAg
ICAgc2g0LWxpbnV4LWxkOiBzaDc3NjBmYi5jOigudGV4dCsweDNhNCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYHJlZ2lzdGVyX2ZyYW1lYnVmZmVyJw0KPj4gICAgICAgc2g0LWxpbnV4
LWxkOiBzaDc3NjBmYi5jOigudGV4dCsweDNhYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGZiX2RlYWxsb2NfY21hcCcNCj4+ICAgICAgIHNoNC1saW51eC1sZDogc2g3NzYwZmIuYzoo
LnRleHQrMHg0MzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmcmFtZWJ1ZmZlcl9yZWxl
YXNlJw0KPj4gICAgICAgc2g0LWxpbnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoNzc2
MGZiLm86IGluIGZ1bmN0aW9uIGBzaDc3NjBmYl9yZW1vdmUnOg0KPj4gICAgICAgc2g3NzYw
ZmIuYzooLnRleHQrMHg4MDApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB1bnJlZ2lzdGVy
X2ZyYW1lYnVmZmVyJw0KPj4gICAgICAgc2g0LWxpbnV4LWxkOiBzaDc3NjBmYi5jOigudGV4
dCsweDgwNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZiX2RlYWxsb2NfY21hcCcNCj4+
ICAgICAgIHNoNC1saW51eC1sZDogc2g3NzYwZmIuYzooLnRleHQrMHg4MTQpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBmcmFtZWJ1ZmZlcl9yZWxlYXNlJw0KPj4gICAgPj4gc2g0LWxp
bnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoNzc2MGZiLm86KC5yb2RhdGErMHhjKTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZmJfaW9fcmVhZCcNCj4+ICAgID4+IHNoNC1saW51
eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9zaDc3NjBmYi5vOigucm9kYXRhKzB4MTApOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmYl9pb193cml0ZScNCj4+ICAgICAgIHNoNC1saW51
eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9zaDc3NjBmYi5vOigucm9kYXRhKzB4MmMpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZmJfZmlsbHJlY3QnDQo+PiAgICAgICBzaDQtbGlu
dXgtbGQ6IGRyaXZlcnMvdmlkZW8vZmJkZXYvc2g3NzYwZmIubzooLnJvZGF0YSsweDMwKTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY2ZiX2NvcHlhcmVhJw0KPj4gICAgICAgc2g0LWxp
bnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoNzc2MGZiLm86KC5yb2RhdGErMHgzNCk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNmYl9pbWFnZWJsaXQnDQo+Pg0KPj4gU3VnZ2Vz
dGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4+IFJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDkxMzA2MzIuTFMw
NENQV3UtbGtwQGludGVsLmNvbS8NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPj4gKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+PiBAQCAtMTc1Niw3ICsxNzU2LDcgQEAg
Y29uZmlnIEZCX0NPQkFMVA0KPj4NCj4+ICAgY29uZmlnIEZCX1NINzc2MA0KPj4gICAgICAg
ICAgYm9vbCAiU0g3NzYwL1NINzc2My9TSDc3MjAvU0g3NzIxIExDREMgc3VwcG9ydCINCj4+
IC0gICAgICAgZGVwZW5kcyBvbiBGQiAmJiAoQ1BVX1NVQlRZUEVfU0g3NzYwIHx8IENQVV9T
VUJUWVBFX1NINzc2MyBcDQo+PiArICAgICAgIGRlcGVuZHMgb24gRkI9eSAmJiAoQ1BVX1NV
QlRZUEVfU0g3NzYwIHx8IENQVV9TVUJUWVBFX1NINzc2MyBcDQo+PiAgICAgICAgICAgICAg
ICAgIHx8IENQVV9TVUJUWVBFX1NINzcyMCB8fCBDUFVfU1VCVFlQRV9TSDc3MjEpDQo+PiAg
ICAgICAgICBzZWxlY3QgRkJfSU9NRU1fSEVMUEVSUw0KPj4gICAgICAgICAgaGVscA0KPj4g
LS0NCj4gDQo+IEFueSByZWFzb24gdGhpcyBjYW4ndCBiZWNvbWUgdHJpc3RhdGUgaW5zdGVh
ZD8NCj4gZHJpdmVycy92aWRlby9mYmRldi9zaDc3NjBmYi5jIHVzZXMgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcigpLCBhbmQNCj4gYWxyZWFkeSBoYXMgYWxsIG5lZWRlZCBNT0RVTEVfKigp
Lg0KDQpJJ3ZlIG1lYW53aGlsZSBmaXhlZCB0aGUgaW1tZWRpYXRlIGlzc3VlLiBCdXQgSSBk
b24ndCBzZWUgYW55dGhpbmcgdGhhdCANCndvdWxkIHByZXZlbnQgdGhlIG9wdGlvbiBhbmQg
ZHJpdmVyIGZyb20gYmVpbmcgYSB0cmlzdGF0ZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------IgWtqYNwoUvgFyzMGqa207yo--

--------------N49f0PY1h4Flu2XiTlzG7p98
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmURP4wFAwAAAAAACgkQlh/E3EQov+Bu
NRAAve0QlHbYxAdkF3i6vjzM4B2OR2mQP7kXp4HuO8txrb1RQ9ojd4LLsfwP/K+2Q7rSCscDsrYb
VsAGeAM0za+fTd1Glq+njziueYMg8PETbnIYXo4Hgx6yNXUc5E9eoFgkysg5EwB0l2lFcjDCxG+T
2SZBqZXvcAg1X5LHwaa0xHqf8Dpai/twMR30QuiVQgY9cMJDXHyrMEcGYncRTj21BYMnZvH6Kfqm
6MWDY4wnvSw0qEt/U9ATEhzTENWG4c95kjOEpdz/wZGPgGg7HfsS6zXAFkLZmUJeoUablK9DRWua
ibciYUszxPuetb2E/5Y2vfkRJVFV54YevhPyTibU68mZu4aIoxpmtOJ++73v6qbtzDqAZPGfoFYc
QKm+ISQLTZTefJcl11A+K+HsCzC50NVtolvsUIclKzpLuSisW9LvLSQmQKOdZplfDzPazvG9Io9G
sCW1fVZwn2Fw/yI4gpR+WX7yy3h6mWDygG7uaW4XML+xrUDz+y8Oq4wGDL2IRmAsl93/nvWNqzHC
ttMu4kOZwH/33uz8fdFbV0l4LOoRMc6/y6jOv0W0J9XfVz4dXsroT2ICRQLfluusDcHlxcu4sm20
mIT0dQOlpmYrnh3k71C/fVTUzm8PSaKsEduijbpK0Txt0GcCzw0A3Yb5BkLas3bd+kBnev1KoIVW
kFY=
=ouYQ
-----END PGP SIGNATURE-----

--------------N49f0PY1h4Flu2XiTlzG7p98--
