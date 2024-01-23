Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B53838F8F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950BC10E7ED;
	Tue, 23 Jan 2024 13:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7310E814
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:15:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D6721220E9;
 Tue, 23 Jan 2024 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706015705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FLVSuqs8JLgY0NF6OVE32NixhIC0XskvA0Sg5BFqSpA=;
 b=Zd0gjn4vMMuHUt4+7NCAGHoMHh+3brbKScjoaa3eaCGnZeONi6a8U8LlGEfzad4FVEEGH5
 FfmtkDPIo7zRz1pUm7OuvZ3EsEzuJcnh9HXvDMZfwEeM29W8zn4h6q/YiRHdVZc+fRopoc
 NdRdWJvb2HmJAzcVciAE0L/xmYRRYo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706015705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FLVSuqs8JLgY0NF6OVE32NixhIC0XskvA0Sg5BFqSpA=;
 b=0784l7Kx3s3YMzIzLh1eZva3Kx3nDmurTUOk2Kp7GgvwGUnLIf4W4PkTJ9JzcNcxrbkJvT
 mxpsh9C2R6CbzCAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706015704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FLVSuqs8JLgY0NF6OVE32NixhIC0XskvA0Sg5BFqSpA=;
 b=qYO7+NeIcVjogxmcl/G3rstVWlx4fx87GpcJTnOEd2umoG9o2sG7CrgRp1cpEtJN62F6Ku
 6cJqOooOlns76TZZOUnGLuEYJqKItT/VYUtKeqKbAL7mQ8nglJ4TylzqcbOxQ9zPRUdBBw
 uEcxIkDI/Z1H5HVgS5BdbGfrq6P0B7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706015704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FLVSuqs8JLgY0NF6OVE32NixhIC0XskvA0Sg5BFqSpA=;
 b=LMIeNuPnkxsUQ+GYyeDGWHx3DHHgttQJRYun2zTv/8A9ZlpnQUNPaRWw6haWA5tsnmD3UA
 zsZkuYGd3pwha5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3EA4136A4;
 Tue, 23 Jan 2024 13:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c6m1Jti7r2WpSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Jan 2024 13:15:04 +0000
Message-ID: <3506116c-ba75-42b8-bc57-61471da352eb@suse.de>
Date: Tue, 23 Jan 2024 14:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
References: <20240123120937.27736-1-tzimmermann@suse.de>
 <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>
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
In-Reply-To: <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N8JCuP000HiD0c1Qui8kKHsg"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qYO7+NeI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LMIeNuPn
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 BAYES_HAM(-3.00)[100.00%]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:email,intel.com:email,suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: D6721220E9
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N8JCuP000HiD0c1Qui8kKHsg
Content-Type: multipart/mixed; boundary="------------hTETZm7YgKjp2H40qu9s8tSE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <3506116c-ba75-42b8-bc57-61471da352eb@suse.de>
Subject: Re: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
References: <20240123120937.27736-1-tzimmermann@suse.de>
 <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>
In-Reply-To: <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>

--------------hTETZm7YgKjp2H40qu9s8tSE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjQgdW0gMTQ6MTIgc2NocmllYiBIdWFjYWkgQ2hlbjoNCj4gSSdt
IHZlcnkgc29ycnkgdG8gaGVhciB0aGF0LCBJZiBKYWFrIGNhbiByZXNwb25kLCBJIHRoaW5r
IEkgY2FuIGZpbmQNCj4gdGhlIHJvb3QgY2F1c2UgYW5kIGZpeCB0aGF0Li4uDQoNCk5vIHBy
b2JsZW0sIGRvbid0IHdvcnJ5LiBXZSB3YW50ZWQgdG8gcmV2ZXJ0IHRoYXQgcGF0Y2ggYW55
d2F5LiBBbmQgdGhlIA0KKnJlYWwqIGZpeCBoZXJlIGlzIHRvIHRyYWNrIHRoZSBmcmFtZWJ1
ZmZlciBvd25lcnNoaXAgbW9yZSBjbG9zZWx5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiBIdWFjYWkNCj4gDQo+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0IDg6MDnigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0K
Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2MGFlYmM5NTU5NDkyY2VhNmE5NjI1ZjUxNGE4MDQx
NzE3ZTNhMmU0Lg0KPj4NCj4+IENvbW1pdCA2MGFlYmM5NTU5NDkyY2VhICgiZHJpdmVycy9m
aXJtd2FyZTogTW92ZSBzeXNmYl9pbml0KCkgZnJvbQ0KPj4gZGV2aWNlX2luaXRjYWxsIHRv
IHN1YnN5c19pbml0Y2FsbF9zeW5jIikgbWVzc2VzIHVwIGluaXRpYWxpemF0aW9uIG9yZGVy
DQo+PiBvZiB0aGUgZ3JhcGhpY3MgZHJpdmVycyBhbmQgbGVhZHMgdG8gYmxhbmsgZGlzcGxh
eXMgb24gc29tZSBzeXN0ZW1zLiBTbw0KPj4gcmV2ZXJ0IHRoZSBjb21taXQuDQo+Pg0KPj4g
VG8gbWFrZSB0aGUgZGlzcGxheSBkcml2ZXJzIGZ1bGx5IGluZGVwZW5kZW50IGZyb20gaW5p
dGlhbGl6YXRpb24NCj4+IG9yZGVyIHJlcXVpcmVzIHRvIHRyYWNrIGZyYW1lYnVmZmVyIG1l
bW9yeSBieSBkZXZpY2UgYW5kIGluZGVwZW5kZW50bHkNCj4+IGZyb20gdGhlIGxvYWRlZCBk
cml2ZXJzLiBUaGUga2VybmVsIGN1cnJlbnRseSBsYWNrcyB0aGUgaW5mcmFzdHJ1Y3R1cmUN
Cj4+IHRvIGRvIHNvLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBKYWFrIFJpc3Rpb2phIDxqYWFr
QHJpc3Rpb2phLmVlPg0KPj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmkt
ZGV2ZWwvWlVuTmkzcTN5QjN6WmZUbEBQNzAubG9jYWxkb21haW4vVC8jdA0KPj4gUmVwb3J0
ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPg0KPj4gQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMzExMDgwMjQ2MTMuMjg5
ODkyMS0xLWNoZW5odWFjYWlAbG9vbmdzb24uY24vDQo+PiBDbG9zZXM6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50ZWwvLS9pc3N1ZXMvMTAxMzMNCj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4g
Q2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4g
Q2M6IFRob3JzdGVuIExlZW1odWlzIDxyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvPg0KPj4g
Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+PiAtLS0N
Cj4+ICAgZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5j
DQo+PiBpbmRleCA4MmZjZmQyOWJjNGQyLi4zYzE5N2RiNDJjOWQ5IDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+PiArKysgYi9kcml2ZXJzL2Zpcm13YXJl
L3N5c2ZiLmMNCj4+IEBAIC0xMjgsNCArMTI4LDQgQEAgc3RhdGljIF9faW5pdCBpbnQgc3lz
ZmJfaW5pdCh2b2lkKQ0KPj4gICB9DQo+Pg0KPj4gICAvKiBtdXN0IGV4ZWN1dGUgYWZ0ZXIg
UENJIHN1YnN5c3RlbSBmb3IgRUZJIHF1aXJrcyAqLw0KPj4gLXN1YnN5c19pbml0Y2FsbF9z
eW5jKHN5c2ZiX2luaXQpOw0KPj4gK2RldmljZV9pbml0Y2FsbChzeXNmYl9pbml0KTsNCj4+
IC0tDQo+PiAyLjQzLjANCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJ
dm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJt
YW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------hTETZm7YgKjp2H40qu9s8tSE--

--------------N8JCuP000HiD0c1Qui8kKHsg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWvu9gFAwAAAAAACgkQlh/E3EQov+BF
wA//R4e8Vc416pmwDTgAw5nuvBeCzKpt6q8j1sjHQHTBSAc4eBKessZqyYI9xFpCjygf9heiEEiE
t2wOv7h3Y2UY/RKY4dzbOVpBzzO6l2EqwYs//cuvA/JKF0AVpmxgBpVC3YbA674Z+/VOzUoSH8Yx
h4JRpw+SHAhXV4/Rk+g7Vb6/RoYdNxb8wGyk3lHW3BuyMkLvTYQzkmlIhrn/a5lUo9Nh2hF562j5
LVGcyAyFD15C60BnnmA6yK40RdrT5A7vT4mq6Bh+byGgFI01b23eVJXHAYFPMGY1YBS+wBUGhssF
kF21MunpNekNLVxaM9nRu8M6QnoS8i70qU+hUAVrkGnKQYj7no6TtWsVyN+4/8X1q3ePZ32yTQnJ
Ic8xjKmmxVm7Lz48gErhAUGOBqTH0YUgeDyn42jToq+9oHczxSldnymm3OPe0wK2j/MMl2P/clYy
W+e4NOYMU+FRMbmRjzRNRh9zHKR7UopJMbcK7MLzD8uYfOTyiKYukpfbYIoStbEsooVDzLMGLoA8
6i+AnGHYWyrmb2+uEtdWc+7dvPpKszFHvqpWcKBgYLV83QYjqLml0nLJvDLBl09gsho+SYIi0V6Q
ihVkPynTmVDwqkVLvqs2K6SpYtfL70MC56d0kpBPBpYAGraRvZpo1OrWKeZE5mMcYdeoeMcYXGvx
4aQ=
=MYn0
-----END PGP SIGNATURE-----

--------------N8JCuP000HiD0c1Qui8kKHsg--
