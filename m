Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B68326EA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77A10E981;
	Fri, 19 Jan 2024 09:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467610E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 09:47:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F01C321E36;
 Fri, 19 Jan 2024 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705657600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3L1iESBkB+uqTzqLszOZmGew8SGEgJE/J2holSFdUg=;
 b=d7bcNezNb2e11MjJmHE7Lp/AbrKBZJWQR+SCo1xoaNIR44crvaaNVoxN386m3xc7kpVROu
 rEVP03kZv01lCFfnNToO1WtpHzgk9wNQRuZDIQHeQRXvT1UAr96/PSxR5LNM0kx5z2qUiY
 aG5AhqAnwNfCEkOJqG1hSLd/posrtkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705657600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3L1iESBkB+uqTzqLszOZmGew8SGEgJE/J2holSFdUg=;
 b=jo5+hnAvHw48NZGhNmxpdLUZMgx2i0G54G9FmUGI7ory2OZ6O9Rozw5djY7VgolUGv7B/k
 FB2Vf6Kv0BIENWCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705657599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3L1iESBkB+uqTzqLszOZmGew8SGEgJE/J2holSFdUg=;
 b=njgABimCF8KS1smkXpPJTXveUiDlXq/mj9MoZlZebdPn1CYTwgHsNnMPzdZwrvgtVCDg+l
 wNllGRGqQn3KYaqs98Jj9C2qh3IgDSxhkCdgAri5AUjVEopmEHXrqx+1FyynfOYfRz5pAj
 KEIliVWB8LPqSn9amoV1x3Qe44/GXdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705657599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/3L1iESBkB+uqTzqLszOZmGew8SGEgJE/J2holSFdUg=;
 b=T2Mmim0j9xnnTKLfMTYOpBFgo3Oc75WSWZP2pxhE35+8wmggS9DvDO2hhag/m8xY8iyZdE
 8HlTJwJjppzGt5Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A681D1388C;
 Fri, 19 Jan 2024 09:46:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HystJ/9EqmV7WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Jan 2024 09:46:39 +0000
Message-ID: <b73dc9f3-40cb-4477-8630-ce9fd68a0e84@suse.de>
Date: Fri, 19 Jan 2024 10:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
 <76d7c04c-dad1-4073-bd20-cb1c85b0563c@redhat.com>
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
In-Reply-To: <76d7c04c-dad1-4073-bd20-cb1c85b0563c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OqOMkYRPFhjxO1N0MrVSMz92"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=njgABimC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T2Mmim0j
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-8.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -8.50
X-Rspamd-Queue-Id: F01C321E36
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
--------------OqOMkYRPFhjxO1N0MrVSMz92
Content-Type: multipart/mixed; boundary="------------RdA46KR8GW453bKjzoPVJ00Z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <b73dc9f3-40cb-4477-8630-ce9fd68a0e84@suse.de>
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
 <76d7c04c-dad1-4073-bd20-cb1c85b0563c@redhat.com>
In-Reply-To: <76d7c04c-dad1-4073-bd20-cb1c85b0563c@redhat.com>

--------------RdA46KR8GW453bKjzoPVJ00Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMTE6MTcgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IA0KPiANCj4gT24gMTcvMDEvMjAyNCAxNjo0OSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBIaQ0KPj4NCj4+IEFtIDA0LjAxLjI0IHVtIDE3OjAwIHNjaHJpZWIgSm9jZWx5biBG
YWxlbXBlOg0KPj4gWy4uLl0NCj4+PiArwqDCoMKgIC8qKg0KPj4+ICvCoMKgwqDCoCAqIEBn
ZXRfc2Nhbm91dF9idWZmZXI6DQo+Pj4gK8KgwqDCoMKgICoNCj4+PiArwqDCoMKgwqAgKiBH
ZXQgdGhlIGN1cnJlbnQgc2Nhbm91dCBidWZmZXIsIHRvIGRpc3BsYXkgYSBwYW5pYyBtZXNz
YWdlIA0KPj4+IHdpdGggZHJtX3BhbmljLg0KPj4+ICvCoMKgwqDCoCAqIFRoZSBkcml2ZXIg
c2hvdWxkIGRvIHRoZSBtaW5pbXVtIGNoYW5nZXMgdG8gcHJvdmlkZSBhIGxpbmVhciANCj4+
PiBidWZmZXIsIHRoYXQNCj4+PiArwqDCoMKgwqAgKiBjYW4gYmUgdXNlZCB0byBkaXNwbGF5
IHRoZSBwYW5pYyBzY3JlZW4uDQo+Pj4gK8KgwqDCoMKgICogSXQgaXMgY2FsbGVkIGZyb20g
YSBwYW5pYyBjYWxsYmFjaywgYW5kIG11c3QgZm9sbG93IGl0cyANCj4+PiByZXN0cmljdGlv
bnMuDQo+Pj4gK8KgwqDCoMKgICogKG5vIGxvY2tzLCBubyBtZW1vcnkgYWxsb2NhdGlvbiwg
bm8gc2xlZXAsIG5vIA0KPj4+IHRocmVhZC93b3JrcXVldWUsIC4uLikNCj4+PiArwqDCoMKg
wqAgKiBJdCdzIGEgYmVzdCBlZmZvcnQgbW9kZSwgc28gaXQncyBleHBlY3RlZCB0aGF0IGlu
IHNvbWUgDQo+Pj4gY29tcGxleCBjYXNlcyB0aGUNCj4+PiArwqDCoMKgwqAgKiBwYW5pYyBz
Y3JlZW4gd29uJ3QgYmUgZGlzcGxheWVkLg0KPj4+ICvCoMKgwqDCoCAqIFNvbWUgaGFyZHdh
cmUgY2Fubm90IHByb3ZpZGUgYSBsaW5lYXIgYnVmZmVyLCBzbyB0aGVyZSBpcyBhIA0KPj4+
IGRyYXdfcGl4ZWxfeHkoKQ0KPj4+ICvCoMKgwqDCoCAqIGNhbGxiYWNrIGluIHRoZSBzdHJ1
Y3QgZHJtX3NjYW5vdXRfYnVmZmVyIHRoYXQgY2FuIGJlIHVzZWQgaW4gDQo+Pj4gdGhpcyBj
YXNlLg0KPj4+ICvCoMKgwqDCoCAqDQo+Pj4gK8KgwqDCoMKgICogUmV0dXJuczoNCj4+PiAr
wqDCoMKgwqAgKg0KPj4+ICvCoMKgwqDCoCAqIFplcm8gb24gc3VjY2VzcywgbmVnYXRpdmUg
ZXJybm8gb24gZmFpbHVyZS4NCj4+PiArwqDCoMKgwqAgKi8NCj4+PiArwqDCoMKgIGludCAo
KmdldF9zY2Fub3V0X2J1ZmZlcikoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjYW5vdXRfYnVm
ZmVyICpzYik7DQo+Pj4gKw0KPj4NCj4+IEFmdGVyIHJlYWRpbmcgdGhyb3VnaCBTaW1hJ3Mg
Y29tbWVudHMgb24gKHRyeS0pbG9ja2luZywgSSdkIGxpa2UgdG8gDQo+PiBwcm9wb3NlIGEg
ZGlmZmVyZW50IGludGVyZmFjZTogaW5zdGVhZCBvZiBoYXZpbmcgdGhlIHBhbmljIGhhbmRs
ZXIgDQo+PiBzZWFyY2ggZm9yIHRoZSBzY2Fub3V0IGJ1ZmZlciwgbGV0IGVhY2ggZHJpdmVy
IGV4cGxpY2l0bHkgc2V0IHRoZSANCj4+IHNjYW5vdXQgYnVmZmVyIGFmdGVyIGVhY2ggcGFn
ZSBmbGlwLiBUaGUgYWxnb3JpdGhtIGZvciBtb2RlIA0KPj4gcHJvZ3JhbW1pbmcgdGhlbiBs
b29rcyBsaWtlIHRoaXM6DQo+Pg0KPj4gwqDCoDEpIE1heWJlIGNsZWFyIHRoZSBwYW5pYyBo
YW5kbGVyJ3MgYnVmZmVyIGF0IHRoZSBiZWdpbm5pbmcgb2YgDQo+PiBhdG9taWNfY29tbWl0
X3RhaWwsIGlmIG5lY2Vzc2FyeQ0KPj4gwqDCoDIpIERvIHRoZSBtb2RlIHNldHRpbmcgYXMg
dXN1YWwNCj4+IMKgwqAzKSBJbiB0aGUgZHJpdmVyJ3MgYXRvbWljX2ZsdXNoIG9yIGF0b21p
Y191cGRhdGUsIGNhbGwgc29tZXRoaW5nIGxpa2UNCj4+DQo+PiDCoMKgwqDCoMKgdm9pZCBk
cm1fcGFuaWNfc2V0X3NjYW5vdXRfYnVmZmVyKGRldiwgc2Nhbm91dF9idWZmZXIpDQo+Pg0K
Pj4gdG8gc2V0IHRoZSBwYW5pYyBoYW5kbGVyJ3MgbmV3IG91dHB1dC4NCj4+DQo+PiBUaGlz
IGF2b2lkcyBhbGwgdGhlIGxvY2tpbmcgYW5kIHRoZSBzZWNvbmQgZ3Vlc3NpbmcgYWJvdXQg
dGhlIHBpcGVsaW5lIA0KPj4gc3RhdHVzLg0KPj4NCj4+IEkgZG9uJ3Qgc2VlIGFuIGVhc3kg
d2F5IG9mIHJlbGlhYmx5IHNob3dpbmcgYSBwYW5pYyBzY3JlZW4gZHVyaW5nIGEgDQo+PiBt
b2Rlc2V0LiBCdXQgZHVyaW5nIGEgbW9kZXNldCwgdGhlIG9sZCBzY2Fub3V0IGJ1ZmZlciBz
aG91bGQgDQo+PiAodGhlb3JldGljYWxseSkgbm90IGRpc2FwcGVhciB1bnRpbCB0aGUgbmV3
IHNjYW5vdXQgYnVmZmVyIGlzIGluIA0KPj4gcGxhY2UuIFNvIGlmIHRoZSBwYW5pYyBoYXBw
ZW5zLCBpdCB3b3VsZCBibGl0IHRvIHRoZSBvbGQgYWRkcmVzcyBhdCANCj4+IHdvcnN0LiBX
ZWxsLCB0aGF0IGFzc3VtcHRpb24gbmVlZHMgdG8gYmUgdmVyaWZpZWQgcGVyIGRyaXZlci4N
Cj4gDQo+IFRoYXQncyBhbiBpbnRlcmVzdGluZyBhcHByb2FjaCwgYW5kIEkgd2lsbCBnaXZl
IGl0IGEgdHJ5Lg0KPiBJIHRoaW5rIHlvdSBzdGlsbCBuZWVkIGEgY2FsbGJhY2sgaW4gdGhl
IGRyaXZlciwgdG8gYWN0dWFsbHkgc2VuZCB0aGUgDQo+IGRhdGEgdG8gdGhlIEdQVS4NCg0K
U3VyZSwgeW91IGNvdWxkIGFkZCB0aGlzIGNhbGxiYWNrIGRpcmVjdGx5IHRvIHRoZSBzY2Fu
b3V0IGJ1ZmZlci4NCg0KPiANCj4gQWxzbyBvbmUgdGhpbmcgdGhhdCBJIGRvbid0IGhhbmRs
ZSB5ZXQsIGlzIHdoZW4gdGhlcmUgYXJlIG11bHRpcGxlIA0KPiBvdXRwdXRzLCBzbyB3ZSBt
YXkgd2FudCB0byBzZXQgYW5kIHVwZGF0ZSBtdWx0aXBsZSBzY2Fub3V0IGJ1ZmZlcnMgPw0K
DQpUaGF0IG1ha2VzIG1lIHRoaW5rIGFib3V0IGFkZGluZyBwYW5pYyBoYW5kbGluZyBkaXJl
Y3RseSB0byB0aGUgcGxhbmUsIA0Kc29tZXRoaW5nIGxpa2UgdGhpcw0KDQogICBkcm1fcGxh
bmVfZW5hYmxlX3BhbmljX291dHB1dChzdHJ1Y3QgZHJtX3BsYW5lKikNCg0KICAgZHJtX3Bs
YW5lX3NldF9wYW5pY19vdXRwdXRfYnVmZmVyKHN0cnVjdCBkcm1fcGxhbmUqLCBzdHJ1Y3Qg
DQpkcm1fc2Nhbm91dF9idWZmZXIqKQ0KDQpGaXJzdCB0aW1lIHRoZSBkcml2ZXIgY2FsbHMg
ZHJtX3BsYW5lX2VuYWJsZV9wYW5pY19vdXRwdXQoKSwgaXQgc2V0cyB1cCANCnRoZSBwYW5p
YyBoYW5kbGluZyBmb3IgdGhlIGdpdmVuIHBsYW5lIGFuZCBtYXliZSBmb3IgRFJNIGFzIGEg
d2hvbGUuDQoNCkVhY2ggaW5zdGFuY2Ugb2YgdGhlIERSTSBwYW5pYyBoYW5kbGVyIG9wZXJh
dGVzIG9uIGEgc2luZ2xlIHBsYW5lLiBUaGVuIA0KZHVyaW5nIHRoZSBwYWdlZmxpcHMsIGRy
bV9wbGFuZV9zZXRfcGFuaWNfb3V0cHV0X2J1ZmZlcigpIHVwZGF0ZXMgdGhlIA0Kb3V0cHV0
IGJ1ZmZlci4gVGhlIG5lY2Vzc2FyeSBzeW5jL2ZsdXNoIGNhbGxiYWNrcyBjYW4gYmUgcGFy
dCBvZiB0aGUgDQpkcm1fcGxhbmVfZnVuY3MuDQoNCklmL3doZW4gdGhlIHBsYW5lIGdldHMg
cmVtb3ZlZCBmcm9tIHRoZSBtb2Rlc2V0dGluZyBwaXBlbGluZSwgdGhlIHBhbmljIA0KaGFu
ZGxpbmcgd291bGQgYmUgcmVtb3ZlZCBhdXRvbWF0aWNhbGx5Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------RdA46KR8GW453bKjzoPVJ00Z--

--------------OqOMkYRPFhjxO1N0MrVSMz92
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWqRP8FAwAAAAAACgkQlh/E3EQov+Dq
Nw/9HRQdh/g9Fi7g5CmAPXYpnLS9uWETF7sashvZZjEzxILtT4CI6kNqEIG5MEDb2rY8c+0BELEH
Zl6cDr+ymXKyVMWUEjMquWMUonTi1X73pPv9Bwx5KZ46Llv4cpaw2IcPT3cpcHTcjIWQhv0Kyg4c
2157cxqOuGlJSq0YtvSC9Tis58xkigzeaNH2bLLM6To34cqD1vuUlRegEfg1kmUIFH7lkO0B0ToY
moGDSFxcVrn12lE1viFSUjqMKljAUO3Rj8Ny+1nc7TGZD3Lu9FfVUSlOb6tUL049RZMjjATnPkhp
0RGBSzfvsdbptbm4RSm8+C5OlsFIUVYA+b7OD5NKyZFmDasfIQUcL9bDV58kcM3GHZYmVBWirRHb
441G7od8C0wzq/DiMzl6L01bX0lmRes/b9QAPq6EeGbe4yKCXr2JPUpgb0VcdTRP6XunaOcv1yCa
Kg/qarbCX6yjLvmf4keu6LxbVte//7XycrOUdJwtePdg6I5LOKy6n7Fcd8W7+iiUGCfLj5C4mVR2
tZegRkv0IUw1PQTD1IN92mu59GLzgv9jN2pEZtLEUQQ1a8GNyaqeYBOcuVIedXwb84W5x5M9PVWt
luhQmNhTBTKp+NX2tV6cB5IOSRLc9RDtKR5oiYcTd0VuRtR9PTDS/7gRZCzx4f/lHVW48bwZC/XH
GLE=
=qCdC
-----END PGP SIGNATURE-----

--------------OqOMkYRPFhjxO1N0MrVSMz92--
