Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E63838A3B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A463B10E021;
	Tue, 23 Jan 2024 09:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F2E10E021
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:24:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 763AD1F770;
 Tue, 23 Jan 2024 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706001831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OaaT226xMrQq18fOAzMOfgL7VSqkFsg9HIaoIH7htj4=;
 b=f3O/w8zmvHFAalqow5Sj4vYGTn/FPvISWH9FPJp0wMxci+ILmumn+raMWc8rjIk/rMcMrU
 /TSTo6CYAeUIpNm7vDH+jd9X2ko8du+Mj9BRaJYbNgf/z4FX7dZggeuIFw7Dzhvw3JbY5T
 SS/u4KMP5ve8yW/sB/otMaZp4K0Hchw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706001831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OaaT226xMrQq18fOAzMOfgL7VSqkFsg9HIaoIH7htj4=;
 b=7kmmyAW9/dlwvMlCE9hagUMnYcx5MAlAim7AI/FvigpXgRltjZGlRqEJ/1ACLWA+1CBp9l
 s5/UByY8KIztULBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706001830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OaaT226xMrQq18fOAzMOfgL7VSqkFsg9HIaoIH7htj4=;
 b=s63D5d9X5k45mi0i2nJ4vTE5p2AsvOi6jnMigUBQGRmjFc2stoOCUfVbgfXb71CsouzsHI
 CXCfNSO+BIc9Q6sYQJPGCJf9cp1Jg6YPllczS3MdMxUiI00u9WeEjYR/h8job1yoMTeFqM
 lHXvKGuAGq0Omfz45+Lb1wl22YbtNq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706001830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OaaT226xMrQq18fOAzMOfgL7VSqkFsg9HIaoIH7htj4=;
 b=t2RxRM8CYpCFZ6jj66ht6XoIKHKYyft+8H6gtzFECtgSgSfSXjVnJqagcQDSs20jclRmVW
 cPiwZgn+vK1lZ4Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48EEC136A4;
 Tue, 23 Jan 2024 09:23:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id InRSEKaFr2V3AwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Jan 2024 09:23:50 +0000
Message-ID: <2e7de6c3-43a1-4511-b910-b25eb80a5bfe@suse.de>
Date: Tue, 23 Jan 2024 10:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] video: Simplify Kconfig options
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240118090721.7995-1-tzimmermann@suse.de>
 <Zaky46R04of5mPRX@phenom.ffwll.local>
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
In-Reply-To: <Zaky46R04of5mPRX@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UiOP064P3fnfB0waqQPYMK70"
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s63D5d9X;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t2RxRM8C
X-Spamd-Result: default: False [-6.30 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[redhat.com,gmx.de,gmail.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 763AD1F770
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
Cc: deller@gmx.de, airlied@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UiOP064P3fnfB0waqQPYMK70
Content-Type: multipart/mixed; boundary="------------kJWOFfpTBcEcnUn8SJ1eXd0j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <2e7de6c3-43a1-4511-b910-b25eb80a5bfe@suse.de>
Subject: Re: [PATCH v2 0/3] video: Simplify Kconfig options
References: <20240118090721.7995-1-tzimmermann@suse.de>
 <Zaky46R04of5mPRX@phenom.ffwll.local>
In-Reply-To: <Zaky46R04of5mPRX@phenom.ffwll.local>

--------------kJWOFfpTBcEcnUn8SJ1eXd0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMTU6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAxOCwgMjAyNCBhdCAxMDowNToyNUFNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IFJlcGxhY2UgQ09ORklHX1ZJREVPX0NNRExJTkUgYW5kIENPTkZJ
R19WSURFT19OT01PREVTRVQgYnkgdGhlIHNpbmdsZQ0KPj4gb3B0aW9uIENPTkZJR19WSURF
Ty4gU2VsZWN0IHRoZSBsYXR0ZXIgZm9yIERSTSBvciBmYmRldi4gQm90aCBvcmlnaW5hbA0K
Pj4gb3B0aW9ucyB1c2VkIHRvIGJlIHNlbGVjdGVkIGluIG1vc3QgY2FzZXMsIHNvIHRoaXMg
Y2hhbmdlIHNpbXBsaWZpZXMNCj4+IHRoZSBLY29uZmlnIHJ1bGVzLg0KPj4NCj4+IFNpbmNl
IGNvbW1pdCBjYTZjMDgwZWVmNDIgKCJhcmNoL3BhcmlzYzogRGV0ZWN0IHByaW1hcnkgdmlk
ZW8gZGV2aWNlDQo+PiBmcm9tIGRldmljZSBpbnN0YW5jZSIpIGFyY2hpdGVjdHVyZSBoZWxw
ZXJzIGZvciBmYmRldiBkbyBub3QgbG9uZ2VyDQo+PiByZXF1aXJlIGZiZGV2IGluIHRoZWly
IGltcGxlbWVudGF0aW9uIGFuZCBjb3VsZCBiZSB1c2VkIGZvciBub24tZmJkZXYNCj4+IGNv
ZGUgYXMgd2VsbC4gRXZlbnR1YWxseSBndWFyZGluZyB0aGVtIHdpdGggQ09ORklHX1ZJREVP
IHdpbGwgbWFrZQ0KPj4gdGhlbSBhdmFpbGFibGUgdG8gYW55IHN1YnN5c3RlbS4NCj4+DQo+
PiB2MjoNCj4+IAkqIHN1cHBvcnQgQ09ORklHX0ZCX0NPUkU9bSB2aWEgSVNfRU5BQkxFRCgp
IChrZXJuZWwgdGVzdCByb2JvdCkNCj4+DQo+PiBUaG9tYXMgWmltbWVybWFubiAoMyk6DQo+
PiAgICB2aWRlby9jbWRsaW5lOiBJbnRyb2R1Y2UgQ09ORklHX1ZJREVPIGZvciB2aWRlbz0g
cGFyYW1ldGVyDQo+PiAgICB2aWRlby9jbWRsaW5lOiBIaWRlIF9fdmlkZW9fZ2V0X29wdGlv
bnMoKSBiZWhpbmQgQ09ORklHX0ZCX0NPUkUNCj4+ICAgIHZpZGVvL25vbW9kZXNldDogU2Vs
ZWN0IG5vbW9kZXNldD0gcGFyYW1ldGVyIHdpdGggQ09ORklHX1ZJREVPDQo+IA0KPiBPbiB0
aGUgc2VyaWVzOg0KPiANCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQoNClB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MgYSBs
b3QuIEZZSSB0aGVyZSdzIGEgY29uZmxpY3Qgd2l0aCANCmNvbW1pdCA2ODkyMzdhYjM3YzUg
KCJmYmRldi9pbnRlbGZiOiBSZW1vdmUgZHJpdmVyIikuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAg
fCAgMyArLS0NCj4+ICAgZHJpdmVycy9zdGFnaW5nL3NtNzUwZmIvS2NvbmZpZyAgIHwgIDEg
LQ0KPj4gICBkcml2ZXJzL3ZpZGVvL0tjb25maWcgICAgICAgICAgICAgfCAgNSArLS0tLQ0K
Pj4gICBkcml2ZXJzL3ZpZGVvL01ha2VmaWxlICAgICAgICAgICAgfCAgMyArLS0NCj4+ICAg
ZHJpdmVycy92aWRlby9jbWRsaW5lLmMgICAgICAgICAgIHwgIDIgKysNCj4+ICAgZHJpdmVy
cy92aWRlby9mYmRldi9LY29uZmlnICAgICAgIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZyAgfCAg
MiArLQ0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyAgfCAgMiAtLQ0K
Pj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2dlb2RlL0tjb25maWcgfCAgMyAtLS0NCj4+ICAg
aW5jbHVkZS9saW51eC9mYi5oICAgICAgICAgICAgICAgIHwgIDcgLS0tLS0tDQo+PiAgIGlu
Y2x1ZGUvdmlkZW8vY21kbGluZS5oICAgICAgICAgICB8ICA4ICsrLS0tLS0NCj4+ICAgMTEg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkNCj4+DQo+
Pg0KPj4gYmFzZS1jb21taXQ6IDA1YjMxN2U4NDU3YzhlMmJkMWE3OTdjOTQ0MGVjMDdiN2Yz
NDE1ODQNCj4+IC0tIA0KPj4gMi40My4wDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------kJWOFfpTBcEcnUn8SJ1eXd0j--

--------------UiOP064P3fnfB0waqQPYMK70
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWvhaUFAwAAAAAACgkQlh/E3EQov+C7
wA/+IbG+uc59HFkD4gMDR48TJL5HM1r8T9kXLwM5blG3H38woamBTVRp/w7zUSPrsoF/Ybw/xVXz
0nfANHHdWskMeLhYyWrQrE21m1oOFLp6AMQlxsa6N0+ky4sdHZRkWkpp+OH30FDQulVWdXbocHNP
XfGv9dWdAYqgX7of0I3B5NlbqDu+NyeNcwyFHbxdW4uMC2+GmhjYUSfL51GGYtFk0TdNjy5Z7d76
p+4SmSHfRkMWG8qL/xGQKrGailc8KvtCYCvSodmwrB23t5bfsXaD6v0hnZyRaa7XhFiO0LAWIqde
srAgSASxYI/ngC8TY5Hh5G+2o9btBUuUK8oniEdenGz61z00iHESoHTiLDcn+wScb+cr6S7KFgl/
9BH0aLjj/skOM6//PG6QSk/zf8RTzA6SeH4TvGrZa0ICgxI+lI96LAP4EtUT3BqMFbUpYHIJ7H8q
sSLFZGu+lp1PnCpPQoOZIItgLPSJuDCcW12feZ5hJQTdFQ74d1dQjdYY9FvPdAKkLPIuApdrDE8v
h9lzVB8fOo9dVGG3KwKIFuc92KxhtIXBX+R1/Jmm1gsaUuvg+6VRXAGT48Lq3P8cAahfScSJ/On1
yhfwT89adbZQO0fKiCTWC/ESehawL1w7233NOBssH3C89NH3vLWpyTeD8ADI77b1q40wFn11qUCT
7fY=
=dbPb
-----END PGP SIGNATURE-----

--------------UiOP064P3fnfB0waqQPYMK70--
