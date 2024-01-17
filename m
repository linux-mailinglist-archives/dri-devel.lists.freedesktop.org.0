Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD883097D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9766610E113;
	Wed, 17 Jan 2024 15:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288110E113
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:15:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B621E21F09;
 Wed, 17 Jan 2024 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TNTxxZh/YgcBNl6jMpI2Q8whSysTmE1cMlPhg67JYNs=;
 b=P8koEquVQnUHDoKeTdmkaj9/B+d6zz7XArPTG2LXgMh3aHyTCpRcuIVO5Kh6NLhI11LF8a
 duG0KaXiMImcq1Y4dS6lOQMuZDoC8U9c/BbHOt56dkfBmaMSrj75QptdvGlVzzrk+CogNq
 968qgnmHQmLS4/wUKks0uBI4msa0HAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TNTxxZh/YgcBNl6jMpI2Q8whSysTmE1cMlPhg67JYNs=;
 b=PMclQSz5wp9gI/8QcJimuLu0Ihr+V3AiUdFKTiye4oZNozTeHuo/fnchDi2D187tATWaaR
 0uMFftPbX2liUHBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TNTxxZh/YgcBNl6jMpI2Q8whSysTmE1cMlPhg67JYNs=;
 b=P8koEquVQnUHDoKeTdmkaj9/B+d6zz7XArPTG2LXgMh3aHyTCpRcuIVO5Kh6NLhI11LF8a
 duG0KaXiMImcq1Y4dS6lOQMuZDoC8U9c/BbHOt56dkfBmaMSrj75QptdvGlVzzrk+CogNq
 968qgnmHQmLS4/wUKks0uBI4msa0HAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TNTxxZh/YgcBNl6jMpI2Q8whSysTmE1cMlPhg67JYNs=;
 b=PMclQSz5wp9gI/8QcJimuLu0Ihr+V3AiUdFKTiye4oZNozTeHuo/fnchDi2D187tATWaaR
 0uMFftPbX2liUHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 806FE13800;
 Wed, 17 Jan 2024 15:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7llXHgTvp2XwFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 15:15:16 +0000
Message-ID: <2eda1b21-b519-4dd2-8e81-a9a1a0fda65d@suse.de>
Date: Wed, 17 Jan 2024 16:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/9] drm/mgag200: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-8-jfalempe@redhat.com>
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
In-Reply-To: <20240104160301.185915-8-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9GRd5g7beRxB6isaGnTvzDCf"
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P8koEquV;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PMclQSz5
X-Spamd-Result: default: False [-6.30 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B621E21F09
X-Spam-Level: 
X-Spam-Score: -6.30
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
--------------9GRd5g7beRxB6isaGnTvzDCf
Content-Type: multipart/mixed; boundary="------------vx02b0pUXP0lupbrK1Jfz80C";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <2eda1b21-b519-4dd2-8e81-a9a1a0fda65d@suse.de>
Subject: Re: [PATCH v7 7/9] drm/mgag200: Add drm_panic support
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-8-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-8-jfalempe@redhat.com>

--------------vx02b0pUXP0lupbrK1Jfz80C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDEuMjQgdW0gMTc6MDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEFkZCBzdXBwb3J0IGZvciB0aGUgZHJtX3BhbmljIG1vZHVsZSwgd2hpY2ggZGlzcGxheXMg
YSBtZXNzYWdlIHRvDQo+IHRoZSBzY3JlZW4gd2hlbiBhIGtlcm5lbCBwYW5pYyBvY2N1cnMu
DQo+IA0KPiB2NToNCj4gICAqIEFsc28gY2hlY2sgdGhhdCB0aGUgcGxhbmUgaXMgdmlzaWJs
ZSBhbmQgcHJpbWFyeS4gKFRob21hcyBaaW1tZXJtYW5uKQ0KPiANCj4gdjc6DQo+ICAgKiB1
c2UgZHJtX2Zvcl9lYWNoX3ByaW1hcnlfdmlzaWJsZV9wbGFuZSgpDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAyMiArKysrKysr
KysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYw0KPiBpbmRleCAy
ZmIxOGI3ODJiMDUuLjJiZjU5MThlYWRjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX2Rydi5jDQo+IEBAIC0xMywxMCArMTMsMTIgQEANCj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2
Lmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJkZXZfZ2VuZXJpYy5oPg0KPiArI2luY2x1
ZGUgPGRybS9kcm1fZnJhbWVidWZmZXIuaD4NCg0KTmVlZHMgdG8gZ28gYmVsb3cgZHJtX2Zp
bGUuaA0KDQpXaXRoIHRoYXQgZml4ZWQ6DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2Zp
bGUuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPg0KPiAgICNpbmNsdWRlIDxk
cm0vZHJtX21hbmFnZWQuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9tb2R1bGUuaD4NCj4g
KyNpbmNsdWRlIDxkcm0vZHJtX3BhbmljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcGNp
aWRzLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgIm1nYWcyMDBfZHJ2LmgiDQo+IEBAIC04NCw2
ICs4NiwyNSBAQCByZXNvdXJjZV9zaXplX3QgbWdhZzIwMF9wcm9iZV92cmFtKHZvaWQgX19p
b21lbSAqbWVtLCByZXNvdXJjZV9zaXplX3Qgc2l6ZSkNCj4gICAJcmV0dXJuIG9mZnNldCAt
IDY1NTM2Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgbWdhZzIwMF9nZXRfc2Nhbm91
dF9idWZmZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJCQkgICAgICBzdHJ1Y3Qg
ZHJtX3NjYW5vdXRfYnVmZmVyICpzYikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZTsNCj4gKwlzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiA9IHRvX21nYV9kZXZpY2UoZGV2
KTsNCj4gKwlzdHJ1Y3QgaW9zeXNfbWFwIG1hcCA9IElPU1lTX01BUF9JTklUX1ZBRERSX0lP
TUVNKG1kZXYtPnZyYW0pOw0KPiArDQo+ICsJLyogZmluZCB0aGUgcHJpbWFyeSBhbmQgdmlz
aWJsZSBwbGFuZSAqLw0KPiArCWRybV9mb3JfZWFjaF9wcmltYXJ5X3Zpc2libGVfcGxhbmUo
cGxhbmUsIGRldikgew0KPiArCQlzYi0+Zm9ybWF0ID0gcGxhbmUtPnN0YXRlLT5mYi0+Zm9y
bWF0Ow0KPiArCQlzYi0+d2lkdGggPSBwbGFuZS0+c3RhdGUtPmZiLT53aWR0aDsNCj4gKwkJ
c2ItPmhlaWdodCA9IHBsYW5lLT5zdGF0ZS0+ZmItPmhlaWdodDsNCj4gKwkJc2ItPnBpdGNo
ID0gcGxhbmUtPnN0YXRlLT5mYi0+cGl0Y2hlc1swXTsNCj4gKwkJc2ItPm1hcCA9IG1hcDsN
Cj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0KPiArCXJldHVybiAtRU5PREVWOw0KPiArfQ0KPiAr
DQo+ICAgLyoNCj4gICAgKiBEUk0gZHJpdmVyDQo+ICAgICovDQo+IEBAIC05OSw2ICsxMjAs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgbWdhZzIwMF9kcml2ZXIgPSB7
DQo+ICAgCS5tYWpvciA9IERSSVZFUl9NQUpPUiwNCj4gICAJLm1pbm9yID0gRFJJVkVSX01J
Tk9SLA0KPiAgIAkucGF0Y2hsZXZlbCA9IERSSVZFUl9QQVRDSExFVkVMLA0KPiArCS5nZXRf
c2Nhbm91dF9idWZmZXIgPSBtZ2FnMjAwX2dldF9zY2Fub3V0X2J1ZmZlciwNCj4gICAJRFJN
X0dFTV9TSE1FTV9EUklWRVJfT1BTLA0KPiAgIH07DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJl
cmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9u
YWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------vx02b0pUXP0lupbrK1Jfz80C--

--------------9GRd5g7beRxB6isaGnTvzDCf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWn7wQFAwAAAAAACgkQlh/E3EQov+CQ
EA//dlJIuUnyA7ux3RgRUAE/xxCp3eXmWeh/KfvORlHRGy3YtWrZWQESEgx/vs9sG2qECc65gtbc
4Cl0D4zHpGZuOy8Ftuty0wQKHQ8pKN1fOUEaGD5FM9GQqPLrIekE92/XSIQBByq4qVH5WLtG4MJb
1lNme9kPNBhiZhKGOFBJtvh04bwPiYyJmBqxr4tH5o/mUPJb0bhdueABgBYar2YqbJ0Ohevy0WL8
W0xYmpbZVLsU9LAPrpU/Jkm1w8ag8fVp5k8vHVm8xlNHUB/oNgm2Ulvzi7mUyVsCVPIw1HIxERaM
Bt5z3utOmNuS5ZIV8IExTbY9u0XJ3WGkjaXYvIU/bhpcSORtJ54bAniyZJFWZqbFwyLI6FKCIr+k
9dYDrbZc4K5Jtxjgpt75m/g7/DLC3ngAysz7z2mUt7SiW7xRfi74Qq7KRZhMk95mbJQ7K237DTab
OlzYt2wqMAIJj6ogOf6itQ/exNj00K1CKq7wocMepiWSxhc4qo67kAyt7Nwc3EpOAJ+OGQXi1TyM
rnQwtvN9rS58UT69fqMss9wRXU9KfCbmksqLDC+O2LYGsw22/toYnVEU3fDYxUQuLIvw/Vu5SDmr
nDjTDBYis7Y9MAOnSt3T9oQ1hUfDfeNgKokLDo1xnPbXQcbbzV6e/8vXmKdZXk7thrNyxtxpEcQY
yOo=
=1zq9
-----END PGP SIGNATURE-----

--------------9GRd5g7beRxB6isaGnTvzDCf--
