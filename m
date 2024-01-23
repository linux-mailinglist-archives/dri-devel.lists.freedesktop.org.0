Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D9838B94
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82D710E71D;
	Tue, 23 Jan 2024 10:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0410E71D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 10:19:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7433F1FD4C;
 Tue, 23 Jan 2024 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706005156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=smiuy5aXrEQQS13LorSicJrIQyMRRfLXc5MPnihPwlI=;
 b=DW+Bpe6QsOrWg1hwfUTHlDgMJpxJ44e1OvCnf30JUjCaaTiYEr1epL+0TzjD94MegddhcC
 uE/Q0Ko6wYhopD0QANQPUWOgEUTV8963eB+hXX/rP8lOW1tEqkhsZa/hh/EMrhc6iz7p1C
 Ex5p1N/MGsK+4NKzVFeM21SnZlGSrpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706005156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=smiuy5aXrEQQS13LorSicJrIQyMRRfLXc5MPnihPwlI=;
 b=IB8yR2j7uPoQa4b+S9BDY1w60GUFogyGr8SXOGQ13KaeWx/dMVlyHj5OD4l5ZRI8M2zBEa
 dTUF9HIPuI0tePDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706005156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=smiuy5aXrEQQS13LorSicJrIQyMRRfLXc5MPnihPwlI=;
 b=DW+Bpe6QsOrWg1hwfUTHlDgMJpxJ44e1OvCnf30JUjCaaTiYEr1epL+0TzjD94MegddhcC
 uE/Q0Ko6wYhopD0QANQPUWOgEUTV8963eB+hXX/rP8lOW1tEqkhsZa/hh/EMrhc6iz7p1C
 Ex5p1N/MGsK+4NKzVFeM21SnZlGSrpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706005156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=smiuy5aXrEQQS13LorSicJrIQyMRRfLXc5MPnihPwlI=;
 b=IB8yR2j7uPoQa4b+S9BDY1w60GUFogyGr8SXOGQ13KaeWx/dMVlyHj5OD4l5ZRI8M2zBEa
 dTUF9HIPuI0tePDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C18113786;
 Tue, 23 Jan 2024 10:19:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zIxgCaSSr2WbFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Jan 2024 10:19:16 +0000
Message-ID: <1084fceb-7813-42a9-9f31-faa5d4904468@suse.de>
Date: Tue, 23 Jan 2024 11:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de> <87il3ko2fu.fsf@intel.com>
 <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
 <874jf4wfn8.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <874jf4wfn8.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4GMl9AgdFEpOh8BLDRgdgdck"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.29
X-Spamd-Result: default: False [-5.29 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-0.982];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[10];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,leemhuis.info,linux.intel.com,loongson.cn,gmail.com,ffwll.ch,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4GMl9AgdFEpOh8BLDRgdgdck
Content-Type: multipart/mixed; boundary="------------0Ids6k0kO0pTy5FMA8fssBBZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Message-ID: <1084fceb-7813-42a9-9f31-faa5d4904468@suse.de>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de> <87il3ko2fu.fsf@intel.com>
 <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
 <874jf4wfn8.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jf4wfn8.fsf@minerva.mail-host-address-is-not-set>

--------------0Ids6k0kO0pTy5FMA8fssBBZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjQgdW0gMTA6NDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob3JzdGVuIExlZW1odWlzIDxyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZv
PiB3cml0ZXM6DQo+IA0KPj4gT24gMjMuMDEuMjQgMDk6NTMsIEphbmkgTmlrdWxhIHdyb3Rl
Og0KPj4+IE9uIFdlZCwgMDggTm92IDIwMjMsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPj4NCj4+Pj4gQXMgeW91
IGtub3csIHRoZXJlJ3MgYSBwbGF0Zm9ybSBkZXZpY2UgdGhhdCByZXByZXNlbnRzIHRoZSBm
aXJtd2FyZQ0KPj4+PiBmcmFtZWJ1ZmZlci4gVGhlIGZpcm13YXJlIGRyaXZlcnMsIHN1Y2gg
YXMgc2ltcGxlZHJtLCBiaW5kIHRvIGl0LiBJbg0KPj4+PiBpOTE1IGFuZCB0aGUgb3RoZXIg
bmF0aXZlIGRyaXZlcnMgd2UgcmVtb3ZlIHRoYXQgcGxhdGZvcm0gZGV2aWNlLCBzbw0KPj4+
PiB0aGF0IHNpbXBsZWRybSBkb2VzIG5vdCBydW4uDQo+Pj4NCj4+PiBUaGUgcHJvYmxlbSBp
cyBzdGlsbCBub3QgcmVzb2x2ZWQuIEFub3RoZXIgYnVnIHJlcG9ydCBhdCBbMV0uDQo+Pj4N
Cj4+PiBUaGUgY29tbWl0IG1lc3NhZ2UgaGVyZSBwb2ludHMgYXQgNjBhZWJjOTU1OTQ5ICgi
ZHJpdmVycy9maXJtd2FyZTogTW92ZQ0KPj4+IHN5c2ZiX2luaXQoKSBmcm9tIGRldmljZV9p
bml0Y2FsbCB0byBzdWJzeXNfaW5pdGNhbGxfc3luYyIpIGFzDQo+Pj4gcmVncmVzc2luZywg
YW5kIEphYWsgYWxzbyBiaXNlY3RlZCBpdCAoc2VlIENsb3NlczopLg0KPj4+DQo+Pj4gSSBh
Z3JlZSB0aGUgcGF0Y2ggaGVyZSBpcyBqdXN0IHBhcGVyaW5nIG92ZXIgdGhlIGlzc3VlLCBi
dXQgbGFja2luZyBhDQo+Pj4gcHJvcGVyIGZpeCwgZm9yIG1vbnRocywgYSByZXZlcnQgd291
bGQgYmUgaW4gb3JkZXIsIG5vPw0KPj4+DQo+IA0KPiBZZXMsIEkgYWdyZWUgdGhhdCB0aGlz
IHBhdGNoIGhhcyB0byBiZSByZXZlcnRlZCwgc2luY2UgYXMgeW91IHNhaWQgdGhlDQo+IGlz
c3VlIGhhcyBub3QgYmVlbiBmaXhlZCBhbmQgaXMgY2F1c2luZyByZWdyZXNzaW9ucyBmb3Ig
bXVsdGlwbGUgdXNlcnMuDQoNCkkgd2FudGVkIHRvIHNlbmQgb3V0IGEgcmV2ZXJ0IGFueXdh
eS4gSSdsbCBkbyB0aGlzIGluIGEgYml0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPj4+IFsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0v
aXNzdWVzLzEwMTMzDQo+Pg0KPj4gSW50ZXJlc3RpbmcuDQo+Pg0KPj4gSkZZSSBmb3IgdGhv
c2UgdGhhdCBkb24ndCBmb2xsb3cgdGhpcyBjbG9zZWx5OiBIdWFjYWkgQ2hlbiBwcm9wb3Nl
ZCBhDQo+PiBmaXggYW5kIGFza2VkIGEgZWFybGllciByZXBvcnRlciB0byB0ZXN0IGl0LCBi
dXQgYWZhaWNzIGhlYXJkIG5vdGhpbmcgYmFjazoNCj4+DQo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvQ0FBaFYtSDVlWE03Rk56dVJDTXRoQXppR19qZzc1WHdRVjNncnB3PXNk
eUotOUdYZ3ZBQG1haWwuZ21haWwuY29tLw0KPj4NCj4gDQo+IEl0J3Mgbm90IGEgZml4IGJ1
dCBhIGRlYnVnIHBhdGNoIGZvciB0aGUgcGF0Y2ggYXV0aG9yIHRvIGdldCBtb3JlIGluZm8g
Pw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------0Ids6k0kO0pTy5FMA8fssBBZ--

--------------4GMl9AgdFEpOh8BLDRgdgdck
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWvkqMFAwAAAAAACgkQlh/E3EQov+D4
XhAAv2fMjHciQDOET6fMFxPvZLDKEBO3TMFxWWkwkQZ3O/tWZSdqdiPC+ERF+SaXNDxEpMptzBKI
ug9wYI6FUuAfyjTLnY/WVSi8omXfkepQAJ1Ie3tDx0ohq9Y1Nh7MqZ11RRI0qJvAyhl+Kr6OpieO
NECUGllGJ/wpixiPBb7FVtUuyrRY9RAL+YjW0XvoD7drLmtlUTeg5ukp60oSLdhlKSBCAOYYrLLo
tYrCDJSibdSmbOcAjBf8YiXIgY4J/FmX5gVxsJ+xpchPCzvrViQ0Qw0MLdjMpe5ZDFICnOHO3lIJ
R1lCtF7zWahzdtDI6wjUPN3R22YJWCAEPLNcubyr97skLG90/ZeFeU12V08zCa94SRV7tqoKOZQJ
DlnauW8vkHnQwM1BzaCmqfN5asjffi6zQrvcVghirFeQpTmfWJTOYcz9gcwGJ1XY/+9mEW92TVUu
CVChc1sx41WkbMFu5BmJ0BGv/TkHImSVWOo8SsOFJ0pD+dzRN/LL48D63SL6Etp8DDpZk90pwiRK
fQ1q0ORGJIjNsq+oSa4HXEDSWZy8TE1w1XiA9+WPAq+Rh+xwzPLGEP7GaZ0lATyiaj/jpQJeJOnj
UCUAHAJkJZllMwyR8Ks2XPXW8xupMAhZn7A/VWAx3XhkQjCEJmblt0fyd7t4hEpycBqsGpqvGTbL
9L8=
=sIGs
-----END PGP SIGNATURE-----

--------------4GMl9AgdFEpOh8BLDRgdgdck--
