Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE388425E8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 14:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688CF1130AB;
	Tue, 30 Jan 2024 13:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8EC1130AB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 13:12:34 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E945E1F867;
 Tue, 30 Jan 2024 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706620353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dwtrqaNA2ugFWKDjuZkWQCUSFdZ9mFQikzhQge4k414=;
 b=W1xhONRIYMjBGaRDHVArBeypouU+OmPHXuRo+TfKZjBQnX8VZ8GU+hAdfCtwxDoJYzbwVk
 f8ruX+Y4jl+IPwfsuKvEoGOhhshk/pV5ehZqI3eblIaMxn3Lra2IZklr5ycEMH76dPXXmX
 dBZwlR74+8FRSbP5LEl5FWM1x0wc45Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706620353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dwtrqaNA2ugFWKDjuZkWQCUSFdZ9mFQikzhQge4k414=;
 b=tqxFMMjFcu/3DMu+L2b0ekHZ8Q3RB1nQVY0SEDNuqObtJhHMq+9273h45HfXFnBedhqwt7
 p/J0zqaKj/+tPlDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706620352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dwtrqaNA2ugFWKDjuZkWQCUSFdZ9mFQikzhQge4k414=;
 b=ynveuwX/NGeEt3y9TJdqgY/Gh71HxkchythF2OsIQptGLu7Ig7OkGgX1HLCuNZdEbZH7O6
 0sQ+mokBbk4li/C+RgAinj69OcPQQNwrMmYiLXRQNRKGeeIzxmy9cONegmaU3pAvguvXMq
 TZv4Rj7fKT2vcnQ/d6pz6UHK05Jdmd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706620352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dwtrqaNA2ugFWKDjuZkWQCUSFdZ9mFQikzhQge4k414=;
 b=hH0iYIFRTzIhjO9o0H6NleMrbxiDEmoX1bLEpfxT4swI/7dvLnDykN/Q0xU9y99NjBqyEw
 D/zqWxnQToPzxMAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BA03313212;
 Tue, 30 Jan 2024 13:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id s1zeK8D1uGVtJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 13:12:32 +0000
Message-ID: <24f87814-b62e-41b0-b02c-34a645d73881@suse.de>
Date: Tue, 30 Jan 2024 14:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] video: Add helpers for decoding screen_info
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-2-tzimmermann@suse.de>
 <87wmrsv2us.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87wmrsv2us.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------deFCP2xCzgCMe5KeQmBu1kdd"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.29
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------deFCP2xCzgCMe5KeQmBu1kdd
Content-Type: multipart/mixed; boundary="------------6UUqLNHjaLavhP7NXYE5fgcH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <24f87814-b62e-41b0-b02c-34a645d73881@suse.de>
Subject: Re: [PATCH 1/8] video: Add helpers for decoding screen_info
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-2-tzimmermann@suse.de>
 <87wmrsv2us.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87wmrsv2us.fsf@minerva.mail-host-address-is-not-set>

--------------6UUqLNHjaLavhP7NXYE5fgcH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDEuMjQgdW0gMTE6NDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPj4gVGhlIHBsYWluIHZhbHVlcyBhcyBz
dG9yZWQgaW4gc3RydWN0IHNjcmVlbl9pbmZvIG5lZWQgdG8gYmUgZGVjb2RlZA0KPj4gYmVm
b3JlIGJlaW5nIHVzZWQuIEFkZCBoZWxwZXJzIHRoYXQgZGVjb2RlIHRoZSB0eXBlIG9mIHZp
ZGVvIG91dHB1dA0KPj4gYW5kIHRoZSBmcmFtZWJ1ZmZlciBJL08gYXBlcnR1cmUuDQo+Pg0K
Pj4gT2xkIG9yIG5vbi14ODYgc3lzdGVtcyBtYXkgbm90IHNldCB0aGUgdHlwZSBvZiB2aWRl
byBkaXJlY3RseSwgYnV0DQo+PiBvbmx5IGluZGljYXRlIHRoZSBwcmVzZW5jZSBieSBzdG9y
aW5nIDB4MDEgaW4gb3JpZ192aWRlb19pc1ZHQS4gVGhlDQo+PiBkZWNvZGluZyBsb2dpYyBp
biBzY3JlZW5faW5mb192aWRlb190eXBlKCkgdGFrZXMgdGhpcyBpbnRvIGFjY291bnQuDQo+
IA0KPiBJIGFsd2F5cyBkaXNsaWtlZCBob3cgdGhlIG9yaWdfdmlkZW9faXNWR0EgdmFyaWFi
bGUgbG9zdCBpdHMgbWVhbmluZy4NCj4gDQo+PiBJdCB0aGVuIGZvbGxvd3Mgc2ltaWxhciBj
b2RlIGluIHZnYWNvbidzIHZnYWNvbl9zdGFydHVwKCkgdG8gZGV0ZWN0DQo+PiB0aGUgdmlk
ZW8gdHlwZSBmcm9tIHRoZSBnaXZlbiB2YWx1ZXMuDQo+Pg0KPj4gQSBjYWxsIHRvIHNjcmVl
bl9pbmZvX3Jlc291cmNlcygpIHJldHVybnMgYWxsIGtub3duIHJlc291cmNlcyBvZiB0aGUN
Cj4+IGdpdmVuIHNjcmVlbl9pbmZvLiBUaGUgcmVzb3VyY2VzJyB2YWx1ZXMgaGF2ZSBiZWVu
IHRha2VuIGZyb20gZXhpc3RpbmcNCj4+IGNvZGUgaW4gdmdhY29uIGFuZCB2Z2ExNmZiLiBU
aGVzZSBkcml2ZXJzIGNhbiBsYXRlciBiZSBjb252ZXJ0ZWQgdG8NCj4+IHVzZSB0aGUgbmV3
IGludGVyZmFjZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4gDQo+IFRoYW5rcyBmb3IgZG9pbmcg
dGhpcyEgSXQncyBxdWl0ZSB1c2VmdWwgdG8gaGF2ZSB0aGVzZSBoZWxwZXJzLCBzaW5jZSBh
cw0KPiB5b3UgbWVudGlvbiB0aGUgc2NyZWVuX2luZm8gZGF0YSBkZWNvZGluZyBpcyBjb21w
bGV4IGFuZCB0aGUgdmFyaWFibGVzDQo+IHVzZWQgdG8gc3RvcmUgdGhlIHZpZGVvIHR5cGUg
YW5kIG1vZGVzIGFyZSBjb25mdXNpbmcgLyBtaXNsZWFkaW5nLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAN
Cj4gSSBqdXN0IGhhdmUgYSBmZXcgY29tbWVudHMgYmVsb3c6DQo+IA0KPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBfX3NjcmVlbl9pbmZvX2hhc19lZ2FfZ2Z4KHVuc2lnbmVkIGludCBtb2Rl
KQ0KPj4gK3sNCj4+ICsJc3dpdGNoIChtb2RlKSB7DQo+PiArCWNhc2UgMHgwZDoJLyogMzIw
eDIwMC00ICovDQo+PiArCWNhc2UgMHgwZToJLyogNjQweDIwMC00ICovDQo+PiArCWNhc2Ug
MHgwZjoJLyogNjQweDM1MC0xICovDQo+PiArCWNhc2UgMHgxMDoJLyogNjQweDM1MC00ICov
DQo+IA0KPiBJIHdvbmRlciBpZiBtYWtlcyBzZW5zZSB0byBkZWZpbmUgc29tZSBjb25zdGFu
dCBtYWNyb3MgZm9yIHRoZXNlIG1vZGVzPyBJDQo+IGtub3cgdGhhdCBjaGVja19tb2RlX3N1
cHBvcnRlZCgpIGluIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmdhMTZmYi5jIGFsc28gdXNlDQo+
IG1hZ2ljIG51bWJlcnMgYnV0IEkgYmVsaWV2ZSB0aGF0IGl0IGNvdWxkIGVhc2UgcmVhZGFi
aWxpdHkuDQoNClRoZXkgYXJlIGtub3duIGJ5IHRoZWlyIG51bWJlcnMsIGJ1dCBoYXZlIG5v
IG5hbWVzLiBUaGVyZSdzIGFsc28gbm8gDQpjb21tb24gcHJhY3RpY2Ugb3IgcHJlY2VkZW5j
ZSBJJ20gYXdhcmUgb2YuDQoNCk9UT0gsIGRyaXZlcnMgbGlrZSB2Z2ExNmZiIHNob3VsZCBu
byBsb25nZXIgaGF2ZSB0byB0ZXN0IG1hZ2ljIG51bWJlcnMgDQphdCBhbGwuIFRoZXkgYmlu
ZCB0byBhIGNlcnRhaW4gdHlwZSBvZiBkZXZpY2UsIHN1Y2ggYXMgZWdhLXR4dCBhbmQgDQp2
Z2EtZ2Z4LCB3aGljaCBpbXBsaWVzIGEgY29ycmVjdGx5IHNldCBtb2RlLg0KDQo+IA0KPj4g
KwkJcmV0dXJuIHRydWU7DQo+PiArCWRlZmF1bHQ6DQo+PiArCQlyZXR1cm4gZmFsc2U7DQo+
PiArCX0NCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSBib29sIF9fc2NyZWVuX2lu
Zm9faGFzX3ZnYV9nZngodW5zaWduZWQgaW50IG1vZGUpDQo+PiArew0KPj4gKwlzd2l0Y2gg
KG1vZGUpIHsNCj4+ICsJY2FzZSAweDEwOgkvKiA2NDB4NDgwLTEgKi8NCj4+ICsJY2FzZSAw
eDEyOgkvKiA2NDB4NDgwLTQgKi8NCj4+ICsJY2FzZSAweDEzOgkvKiAzMjAtMjAwLTggKi8N
Cj4+ICsJY2FzZSAweDZhOgkvKiA4MDB4NjAwLTQgKFZFU0EpICovDQo+PiArCQlyZXR1cm4g
dHJ1ZTsNCj4gDQo+IEFuZCBzYW1lIGZvciB0aGVzZS4NCj4gDQo+IEl0IGNhbiBiZSBhIGZv
bGxvdy11cCBwYXRjaCB0aG91Z2guDQo+IA0KPiBbLi4uXQ0KPiANCj4+ICtpbnQgc2NyZWVu
X2luZm9fcmVzb3VyY2VzKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksIHN0cnVjdCBy
ZXNvdXJjZSAqciwgc2l6ZV90IG51bSkNCj4+ICt7DQo+PiArCXN0cnVjdCByZXNvdXJjZSAq
cG9zID0gcjsNCj4+ICsJdW5zaWduZWQgaW50IHR5cGUgPSBzY3JlZW5faW5mb192aWRlb190
eXBlKHNpKTsNCj4+ICsJdTY0IGJhc2UsIHNpemU7DQo+PiArDQo+PiArCXN3aXRjaCAodHlw
ZSkgew0KPj4gKwljYXNlIFZJREVPX1RZUEVfTURBOg0KPj4gKwkJaWYgKG51bSA+IDApDQo+
PiArCQkJcmVzb3VyY2VfaW5pdF9pb19uYW1lZChwb3MrKywgMHgzYjAsIDEyLCAibWRhIik7
DQo+IA0KPiBJIHNlZSB0aGF0IGRyaXZlcnMvdmlkZW8vZmJkZXYvaTc0MF9yZWcuaCBoYXMg
YSAjZGVmaW5lIE1EQV9CQVNFDQo+IDB4M0IwLiBNYXliZSBtb3ZlIHRvIGEgaGVhZGVyIGlu
IGluY2x1ZGUvdmlkZW8gYWxvbmcgd2l0aCB0aGUgb3RoZXINCj4gY29uc3RhbnRzIG1lbnRp
b25lZCBhYm92ZSA/DQoNClRoYXQgY291bGQgZ28gaW50byA8dmlkZW8vdmdhLmg+LiBNREFf
QkFTRSAoYW5kIENHQV9CQVNFKSBmcm9tIHRoZSBzYW1lIA0KZmlsZSBhcmUgdW51c2VkIHRo
b3VnaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+ICsJCWlmIChudW0gPiAx
KQ0KPj4gKwkJCXJlc291cmNlX2luaXRfaW9fbmFtZWQocG9zKyssIDB4M2JmLCAweDAxLCAi
bWRhIik7DQo+PiArCQlpZiAobnVtID4gMikNCj4+ICsJCQlyZXNvdXJjZV9pbml0X21lbV9u
YW1lZChwb3MrKywgMHhiMDAwMCwgMHgyMDAwLCAibWRhIik7DQo+IA0KPiBTYW1lIGZvciB0
aGVzZSBzdGFydCBhZGRyZXNzZXMuIEkgc2VlIHRoYXQgYXJlIGFsc28gdXNlZCBieSBtZGFj
b25fc3RhcnR1cCgpDQo+IGluIGRyaXZlcnMvdmlkZW8vY29uc29sZS9tZGFjb24uYywgc28g
c29tZSBjb25zdGFudHMgZGVmaW5lZCBzb21ld2hlcmUgbWlnaHQNCj4gYmUgdXNlZnVsIGZv
ciB0aGF0IGNvbnNvbGUgZHJpdmVyIHRvby4NCj4gDQo+IFRoZSBjb21tZW50IGFsc28gYXBw
bGllcyB0byBhbGwgdGhlIG90aGVyIHN0YXJ0IGFkZHJlc3Nlcywgc2luY2UgSSBzZWUNCj4g
dGhhdCB0aG9zZSBhcmUgdXNlZCBieSBvdGhlciBkcml2ZXJzIChpODEwLCB2Z2Fjb24sIGV0
YykuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5z
dHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBB
bmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4
MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------6UUqLNHjaLavhP7NXYE5fgcH--

--------------deFCP2xCzgCMe5KeQmBu1kdd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW49cAFAwAAAAAACgkQlh/E3EQov+B8
Vg/+JIcDVRVCa896bw8h1nXA7TOrW5P3A6UQwpnfQaZQ8pmzTSwoDv38gvn+6Dq/Zck4natIJTKg
A91+UH9SK2zKtiV1xNPkG+6F9yZM+kj9HLaexz/J4v83jrQJBxLSrCsxCTI835AlOjgbGpLOw0Xn
aj0cmmOB1ILWdMErGhpYV+84hRR/gGK0AWZC7YPd30LftQcvZbxCd487slqvkbUtE/P3bugE1J6N
M/9GskcbOPLSYjCUXkyuBEEoQ8SmQA1bpwQmB42OH1o86Uw/KC8LYS0tHzJpGM1LK4sUsSFNwvkQ
pGka4k26PaNTgucXxA1kBpibWTxqS7Fak4bboG29oNO+DgeMZCCAqAziYOYP+rhpnL12fwB9JcqA
ukJnYag1/PEbAp9ulCACWtl5g7o+t+O2ZfLf2Zh9xVALFitjYl5CJfPm2ZWDu4XkAEQcEEWGyB+U
5VLcU8I/zidU0dBYuKQj4mYudfzi5CD1qv6egQ1lh5vOkSjrKc2su/BoiDfVbdMZSt10AjYa/Yrf
YvgtCSj6HdezgUpujG9fnfpQ1wnSGrHTYVw20aEM3t7bfJtJ2kWMoTIBVpaiRu144cfMYJm3m1Sc
k5PUdHOHxLJKr1rk/a1rXRnwHOnpf0uY/zfEyjNv+tH0p45xAY5NSJ/3emb1Q7gBkSHfo0PmUcOK
UzQ=
=sWGt
-----END PGP SIGNATURE-----

--------------deFCP2xCzgCMe5KeQmBu1kdd--
