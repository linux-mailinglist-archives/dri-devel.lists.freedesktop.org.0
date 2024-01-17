Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D703A830984
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECED892A1;
	Wed, 17 Jan 2024 15:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A86892A1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:16:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B33B11FCA1;
 Wed, 17 Jan 2024 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j1S0lI21Wkqh4u2SxzUxTE2cF8OYRwTSwxBvEsWinoU=;
 b=j9wLjo8uopIvAQgXg4K4t2Vfr49VYD4lZ2j7BqRgMMF5OU+e6aUe5PQ4SkFptCSio15gwa
 yq/sT0k3xyyHm/tx2UDJOhNby3LML52BtRK+rzUfUQ5RTmrvcwoewJ0PMhh238JZw9c85u
 jwZu0G2d4CRMERh78w+EW5zJq2Pw0Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j1S0lI21Wkqh4u2SxzUxTE2cF8OYRwTSwxBvEsWinoU=;
 b=ZU8CN4vzOxO0zKJaxtGpIRREsyjp63HflZBSgSWPS25Ff2Kq1V+27uAXkZqZFxFm4aSaza
 F4HWjF9RG7d5T+DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j1S0lI21Wkqh4u2SxzUxTE2cF8OYRwTSwxBvEsWinoU=;
 b=j9wLjo8uopIvAQgXg4K4t2Vfr49VYD4lZ2j7BqRgMMF5OU+e6aUe5PQ4SkFptCSio15gwa
 yq/sT0k3xyyHm/tx2UDJOhNby3LML52BtRK+rzUfUQ5RTmrvcwoewJ0PMhh238JZw9c85u
 jwZu0G2d4CRMERh78w+EW5zJq2Pw0Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j1S0lI21Wkqh4u2SxzUxTE2cF8OYRwTSwxBvEsWinoU=;
 b=ZU8CN4vzOxO0zKJaxtGpIRREsyjp63HflZBSgSWPS25Ff2Kq1V+27uAXkZqZFxFm4aSaza
 F4HWjF9RG7d5T+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7489D13800;
 Wed, 17 Jan 2024 15:16:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WM9AGlzvp2XwFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 15:16:44 +0000
Message-ID: <204b13f8-1645-48b6-84cd-b1aa6e376f80@suse.de>
Date: Wed, 17 Jan 2024 16:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] drm/ast: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-9-jfalempe@redhat.com>
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
In-Reply-To: <20240104160301.185915-9-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------izdP70mhC0xICQy866f64lI8"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j9wLjo8u;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZU8CN4vz
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
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
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: B33B11FCA1
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
--------------izdP70mhC0xICQy866f64lI8
Content-Type: multipart/mixed; boundary="------------7uE5hdqyoUZTcigpJ3ostpTH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <204b13f8-1645-48b6-84cd-b1aa6e376f80@suse.de>
Subject: Re: [PATCH v7 8/9] drm/ast: Add drm_panic support
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-9-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-9-jfalempe@redhat.com>

--------------7uE5hdqyoUZTcigpJ3ostpTH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDEuMjQgdW0gMTc6MDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEFkZCBzdXBwb3J0IGZvciB0aGUgZHJtX3BhbmljIG1vZHVsZSwgd2hpY2ggZGlzcGxheXMg
YSBtZXNzYWdlIHRvDQo+IHRoZSBzY3JlZW4gd2hlbiBhIGtlcm5lbCBwYW5pYyBvY2N1cnMu
DQo+IA0KPiB2Nw0KPiAgICogVXNlIGRybV9mb3JfZWFjaF9wcmltYXJ5X3Zpc2libGVfcGxh
bmUoKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2
LmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmMNCj4gaW5kZXggOTBiY2IxZWI5Y2Q5Li44ZGRjZTNkN2ZkYTkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IEBAIC0zNSw2ICszNSw3IEBADQo+ICAgI2luY2x1
ZGUgPGRybS9kcm1fZmJkZXZfZ2VuZXJpYy5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dl
bV9zaG1lbV9oZWxwZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9tb2R1bGUuaD4NCj4g
KyNpbmNsdWRlIDxkcm0vZHJtX3BhbmljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJv
YmVfaGVscGVyLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgImFzdF9kcnYuaCINCj4gQEAgLTQ4
LDYgKzQ5LDI3IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtb2Rlc2V0LCBhc3RfbW9kZXNldCwg
aW50LCAwNDAwKTsNCj4gICAgKiBEUk0gZHJpdmVyDQo+ICAgICovDQo+ICAgDQo+ICtzdGF0
aWMgaW50IGFzdF9nZXRfc2Nhbm91dF9idWZmZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwN
Cj4gKwkJCQkgIHN0cnVjdCBkcm1fc2Nhbm91dF9idWZmZXIgKnNiKQ0KPiArew0KPiArCXN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lOw0KPiArCXN0cnVjdCBhc3RfcGxhbmUgKmFzdF9wbGFu
ZTsNCj4gKw0KPiArCWRybV9mb3JfZWFjaF9wcmltYXJ5X3Zpc2libGVfcGxhbmUocGxhbmUs
IGRldikgew0KPiArCQlhc3RfcGxhbmUgPSB0b19hc3RfcGxhbmUocGxhbmUpOw0KPiArCQlp
ZiAoIWFzdF9wbGFuZS0+dmFkZHIpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQlzYi0+
Zm9ybWF0ID0gcGxhbmUtPnN0YXRlLT5mYi0+Zm9ybWF0Ow0KPiArCQlzYi0+d2lkdGggPSBw
bGFuZS0+c3RhdGUtPmZiLT53aWR0aDsNCj4gKwkJc2ItPmhlaWdodCA9IHBsYW5lLT5zdGF0
ZS0+ZmItPmhlaWdodDsNCj4gKwkJc2ItPnBpdGNoID0gcGxhbmUtPnN0YXRlLT5mYi0+cGl0
Y2hlc1swXTsNCj4gKwkJaW9zeXNfbWFwX3NldF92YWRkcl9pb21lbSgmc2ItPm1hcCwgYXN0
X3BsYW5lLT52YWRkcik7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKwlyZXR1cm4gLUVO
T0RFVjsNCj4gK30NCj4gKw0KPiAgIERFRklORV9EUk1fR0VNX0ZPUFMoYXN0X2ZvcHMpOw0K
PiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBhc3RfZHJpdmVyID0g
ew0KPiBAQCAtNjIsOCArODQsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIg
YXN0X2RyaXZlciA9IHsNCj4gICAJLm1ham9yID0gRFJJVkVSX01BSk9SLA0KPiAgIAkubWlu
b3IgPSBEUklWRVJfTUlOT1IsDQo+ICAgCS5wYXRjaGxldmVsID0gRFJJVkVSX1BBVENITEVW
RUwsDQo+IC0NCj4gLQlEUk1fR0VNX1NITUVNX0RSSVZFUl9PUFMNCj4gKwkuZ2V0X3NjYW5v
dXRfYnVmZmVyID0gYXN0X2dldF9zY2Fub3V0X2J1ZmZlciwNCj4gKwlEUk1fR0VNX1NITUVN
X0RSSVZFUl9PUFMsDQo+ICAgfTsNCj4gICANCj4gICAvKg0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------7uE5hdqyoUZTcigpJ3ostpTH--

--------------izdP70mhC0xICQy866f64lI8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWn71wFAwAAAAAACgkQlh/E3EQov+Be
Ug/+Kt995ywXqTVdThbZdcwbYgXngvZVNNRh2SqlzqMXTpET7cwny2JzfsgFV3q+JwLG0gwyN1QV
HOEjRY6B9p2o42sfhEjebMd0R3OpJ0ONnevwNSDAmrYD4j9Nfwck461etMEUN8YyRlEOvKJIFu+5
kWOpZ+p4cGpiSPx/xQ9EMiVZgo/viCcvOkH/cgicGRngS0KAqwGB6sBNwzCKFddPmFZU/XMsKvAR
ZefirVH8ofau5+aWVmtut0uDZOBAMRY5CNjuxI8fc4qN2YyauwEozNNe+04II0nDRkpvRL/BH8LU
Crje9RPY87d5ujx9V1gUspyKVdLl8WB/mCFHFYHaBDKzqyKldfNalkCnVwqZ55So4y9WoitEPhkL
BQDEQh6ybYEbxzlSn9eHq7DdD5GXQY3FqBEo53LY3ANaY/NDSM+DxgnOWrXYMAzRsWCm3Lg5KZys
G6j0sQkZxp3f9epDkgfDOkppmmuFmeyPHh/Td99qVymTEDgRECI8PuQEdaiC7K+OXfikLQSCDU8I
TAXfr2M9+SbuBwlw/yBXJaTCmrtKlkXJ7DQi9Wf0cd2gZP+vC4KPujTONhDqMUKnY4CL4fpBrGG/
3cOWWbMRSeg7bOvTrJeDIYOXAFOL7mJmUhicBgOx/pM/+cGlpMPGFhQ6hQp/n5+oauyfN8VI4ewq
XVo=
=YEKO
-----END PGP SIGNATURE-----

--------------izdP70mhC0xICQy866f64lI8--
