Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F9832679
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E3810E977;
	Fri, 19 Jan 2024 09:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93B710E977
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 09:22:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F4FD1F7E4;
 Fri, 19 Jan 2024 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705656138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5aAibxCV5X34Pm+cjk4ETEvZP3zzhCiAQET3453gQvY=;
 b=CH5+6hKi89JggeaE1lE+KvioKgoC+N/aQBb+q/vI8vmkTlztDL4xsLLbVKpMtBShW5foID
 BpzrVXmLeSgwcUMyB9OyNnUwUrV94vs+sSc9qgpQ3hq4XfTnZLcV9DXjHZwV9NQLi2c/kQ
 TFRgBmCck+zaVpqJjR4AhEOOyP3BhEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705656138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5aAibxCV5X34Pm+cjk4ETEvZP3zzhCiAQET3453gQvY=;
 b=ddDr+pes9JmCuuzF0gwnz50Mf0xlCsEL5I1bptxuFy5tcHGG5VpkLfLy0z2XfBUHgg5kcM
 6srtpdDyiU8jCeBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705656138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5aAibxCV5X34Pm+cjk4ETEvZP3zzhCiAQET3453gQvY=;
 b=CH5+6hKi89JggeaE1lE+KvioKgoC+N/aQBb+q/vI8vmkTlztDL4xsLLbVKpMtBShW5foID
 BpzrVXmLeSgwcUMyB9OyNnUwUrV94vs+sSc9qgpQ3hq4XfTnZLcV9DXjHZwV9NQLi2c/kQ
 TFRgBmCck+zaVpqJjR4AhEOOyP3BhEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705656138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5aAibxCV5X34Pm+cjk4ETEvZP3zzhCiAQET3453gQvY=;
 b=ddDr+pes9JmCuuzF0gwnz50Mf0xlCsEL5I1bptxuFy5tcHGG5VpkLfLy0z2XfBUHgg5kcM
 6srtpdDyiU8jCeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43DF91388C;
 Fri, 19 Jan 2024 09:22:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lCdxD0o/qmX1UQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Jan 2024 09:22:18 +0000
Message-ID: <613cf732-fc95-4f61-b64d-772206460535@suse.de>
Date: Fri, 19 Jan 2024 10:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
Content-Language: en-US
To: Zack Rusin <zack.rusin@broadcom.com>
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
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
In-Reply-To: <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zO156rzRNws1mrvpX8HRwZP1"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-5.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.09
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zO156rzRNws1mrvpX8HRwZP1
Content-Type: multipart/mixed; boundary="------------P9HjSGaqLiGyV3f4slYmCU2v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Ian Forbes <ian.forbes@broadcom.com>, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 martin.krastev@broadcom.com
Message-ID: <613cf732-fc95-4f61-b64d-772206460535@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
In-Reply-To: <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>

--------------P9HjSGaqLiGyV3f4slYmCU2v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMTk6MjUgc2NocmllYiBaYWNrIFJ1c2luOg0KPiBPbiBN
b24sIEphbiAxNSwgMjAyNCBhdCAzOjIx4oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMTIuMDEuMjQg
dW0gMjE6Mzggc2NocmllYiBJYW4gRm9yYmVzOg0KPj4+IFNWR0EgcmVxdWlyZXMgc3VyZmFj
ZXMgdG8gZml0IHdpdGhpbiBncmFwaGljcyBtZW1vcnkgKG1heF9tb2JfcGFnZXMpIHdoaWNo
DQo+Pj4gbWVhbnMgdGhhdCBtb2RlcyB3aXRoIGEgZmluYWwgYnVmZmVyIHNpemUgdGhhdCB3
b3VsZCBleGNlZWQgZ3JhcGhpY3MgbWVtb3J5DQo+Pj4gbXVzdCBiZSBwcnVuZWQgb3RoZXJ3
aXNlIGNyZWF0aW9uIHdpbGwgZmFpbC4NCj4+Pg0KPj4+IEFkZGl0aW9uYWxseSwgZGV2aWNl
IGNvbW1hbmRzIHdoaWNoIHVzZSBtdWx0aXBsZSBncmFwaGljcyByZXNvdXJjZXMgbXVzdA0K
Pj4+IGhhdmUgYWxsIHRoZWlyIHJlc291cmNlcyBmaXQgd2l0aGluIGdyYXBoaWNzIG1lbW9y
eSBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZQ0KPj4+IGNvbW1hbmQuIFRodXMgd2UgbmVlZCBh
IHNtYWxsIGNhcnZlIG91dCBvZiAxLzQgb2YgZ3JhcGhpY3MgbWVtb3J5IHRvIGVuc3VyZQ0K
Pj4+IGNvbW1hbmRzIGxpa2VzIHN1cmZhY2UgY29waWVzIHRvIHRoZSBwcmltYXJ5IGZyYW1l
YnVmZmVyIGZvciBjdXJzb3INCj4+PiBjb21wb3NpdGlvbiBvciBkYW1hZ2UgY2xpcHMgY2Fu
IGZpdCB3aXRoaW4gZ3JhcGhpY3MgbWVtb3J5Lg0KPj4+DQo+Pj4gVGhpcyBmaXhlcyBhbiBp
c3N1ZSB3aGVyZSBWTXMgd2l0aCBsb3cgZ3JhcGhpY3MgbWVtb3J5ICg8IDY0TWlCKSBjb25m
aWd1cmVkDQo+Pj4gd2l0aCBoaWdoIHJlc29sdXRpb24gbW9kZSBib290IHRvIGEgYmxhY2sg
c2NyZWVuIGJlY2F1c2Ugc3VyZmFjZSBjcmVhdGlvbg0KPj4+IGZhaWxzLg0KPj4NCj4+IFRo
YXQgaXMgYSBsb25nLXN0YW5kaW5nIHByb2JsZW0sIHdoaWNoIHdlIGhhdmUgb2JzZXJ2ZWQg
d2l0aCBvdGhlcg0KPj4gZHJpdmVycyBhcyB3ZWxsLiBPbiBsb3ctbWVtb3J5IGRldmljZXMs
IFRUTSBkb2Vzbid0IHBsYXkgd2VsbC4gVGhlIHJlYWwNCj4+IGZpeCB3b3VsZCBiZSB0byBl
eHBvcnQgYWxsIG1vZGVzIHRoYXQgcG9zc2libHkgZml0IGFuZCBzb3J0IG91dCB0aGUNCj4+
IGludmFsaWQgY29uZmlndXJhdGlvbnMgaW4gYXRvbWljX2NoZWNrLiBJdCdzIGp1c3QgYSBs
b3QgbW9yZSB3b3JrLg0KPj4NCj4+IERpZCB5b3UgY29uc2lkZXIgc2ltcGx5IGlnbm9yaW5n
IHZtd2dmeCBkZXZpY2VzIHdpdGggbGVzcyB0aGFuIDY0IE1pQiBvZg0KPj4gVlJBTT8NCj4g
DQo+IFVuZm9ydHVuYXRlbHkgd2UgY2FuJ3QgZG8gdGhhdCBiZWNhdXNlIG9uIG5ldyBlc3gg
c2VydmVycyB3aXRob3V0DQo+IGdwdSdzIHRoZSBkZWZhdWx0IGlzIDE2TUIuIEEgbG90IG9m
IHBlb3BsZSBhcmUgc3RpbGwgcnVubmluZyB0aGVpciBlc3gNCj4gYm94ZXMgd2l0aCA0TUIs
IHdoaWNoIGlzIGluIGdlbmVyYWwgdGhlIG1vc3QgY29tbW9uIHByb2JsZW0gYmVjYXVzZQ0K
PiB3aXRoIDRNQiBwZW9wbGUgc3RpbGwgdGVuZCB0byBsaWtlIHRvIHNldCAxMjgweDgwMCB3
aGljaCB3aXRoIDMyYnBwIGZiDQo+IHRha2VzIDQwOTYwMDAgYnl0ZXMgYW5kIHdpdGggNE1C
IGF2YWlsYWJsZSB0aGF0IGxlYXZlcyBvbmx5IDk2S0INCj4gYXZhaWxhYmxlIGFuZCB3ZSBu
ZWVkIG1vcmUgdG8gYWxzbyBhbGxvY2F0ZSB0aGluZ3MgbGlrZSB0aGUgY3Vyc29yLg0KPiBF
dmVuIGlmIHR0bSBkaWQgZXZlcnl0aGluZyByaWdodCB0ZWNobmljYWxseSAxMjgweDgwMCBA
IDMyYnBwDQo+IHJlc29sdXRpb24gd2lsbCBmaXQgaW4gYSA0TUIgZ3JhcGhpY3MgbWVtb3J5
LCBidXQgdGhlbiB0aGUgc3lzdGVtIHdpbGwNCj4gbm90IGJlIGFibGUgdG8gaGF2ZSBhIGhh
cmR3YXJlICh3ZWxsLCB2aXJ0dWFsaXplZCkgY3Vyc29yLiBJdCdzDQo+IGV4dHJlbWVseSB1
bmxpa2VseSBwZW9wbGUgd291bGQgZXZlbiBiZSBhd2FyZSBvZiB0aGlzIHRyYWRlb2ZmIHdo
ZW4NCj4gbWFraW5nIHRoZSBkZWNpc2lvbiB0byBpbmNyZWFzZSByZXNvbHV0aW9uLg0KDQpE
byB5b3UgYWxsb2NhdGUgYnVmZmVyIHN0b3JhZ2UgZGlyZWN0bHkgaW4gdGhlIHByb3ZpZGVk
IFZSQU0/IElmIHNvIGhvdyANCmRvIHlvdSBkbyBwYWdlIGZsaXBzIHRoZW4/IFlvdSdkIG5l
ZWQgZm9yIHRoZSBleGFtcGxlIG9mIDEyODB4ODAwLTMyLCANCnlvdSdkIG5lZWQgYXJvdW5k
IDggTWlCIHRvIGtlZXAgZnJvbnQgYW5kIGJhY2sgYnVmZmVyIGluIFZSQU0uIEkgZ3Vlc3Ms
IA0KeW91IG9ubHkgc3VwcG9ydCB0aGUgZnJhbWVidWZmZXIgY29uc29sZSAod2hpY2ggZG9l
c24ndCBkbyBwYWdlZmxpcHMpPw0KDQpJbiBtZ2FnMjAwIGFuZCBhc3QsIEkgaGFkIHRoZSBs
dXh1cnkgZm9yIHJlcGxhY2luZyBUVE0gd2l0aCBTSE1FTSANCmhlbHBlcnMsIHdoaWNoIHdv
cmtlZCBhcm91bmQgdGhlIHByb2JsZW0gZWFzaWx5LiBNYXliZSB0aGF0J3MgYW4gb3B0aW9u
IA0KZm9yIGxvdy1tZW1vcnkgc3lzdGVtcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gU28gdGhlIGRyaXZlciBlaXRoZXIgbmVlZHMgdG8gcHJlYWxsb2NhdGUgYWxsIHRo
ZSBtZW1vcnkgaXQgcG9zc2libHkNCj4gbWlnaHQgbmVlZCBmb3IgYWxsIHRoZSBiYXNpYyBm
dW5jdGlvbmFsaXR5IGJlZm9yZSBtb2Rlc2V0dGluZyBvciB0aGUNCj4gYXZhaWxhYmxlIG1v
ZGVzIG5lZWQgdG8gYmUgdmFsaWRhdGVkIHdpdGggc29tZSBjb25zdHJhaW50cy4NCj4gDQo+
IHoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3
IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChB
RyBOdWVybmJlcmcpDQo=

--------------P9HjSGaqLiGyV3f4slYmCU2v--

--------------zO156rzRNws1mrvpX8HRwZP1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWqP0kFAwAAAAAACgkQlh/E3EQov+CU
rw/+Ijocnd6R8Iiz7uYZHlphNgvG9NHREmGw1ZVDOw2suz+IzhpK6YQUzNaHpma0JtnFykRVZz8x
qZLDzUnQ9mTgg8vrMIw9a/FQzWb4OjVYubF4kwpT4dH4mljXogVFpBKY8FzAHBDLR6LdxC+zwK9y
DSjXqjpD0uZCqCWD0tyIE4jrRn+QylqUr/tgV4LkrgAwWPmxawYOn/bBsSk/WaGOYtmZDj08UnlC
XGc+/m9DCjBA41lEien1Q89uhFPG/TgGj9hkGF+A2RH/Pj1w8Afz57rVry1j4g26oL5fgDCJHc8+
8ygsLjeifnZ+Rge3z3t7HsdBmpMrIlJkfizQNMGJqTb6iGohl+eBfVKN/3bXmF0y8pUsjnWTicbs
hAhP0/uNbpiOozyLgVPjOXNjRgdJvkzcMSszXug3mcichOTgnfh4OunK4KteLT7JH/Ury5Bt651L
zv8uCHsQ+mZQfgtgjInDdSx91kpEOXyKX/VXTviRNQ6hTlc10xCKeKwx/3Ve+ha5ycoP7cmzVMcF
F6IbnYJcmADS2+PqOb4t87x++SGUwQVRVSGSd0Lw686jR1+oOW40z41rpxWlVdvN040NJPu47pNq
wRmshsnrKg2B3j6Dphwzcdq4BIzRSh3RZmN/crF46jVgIRWL/MX3GcDg1OlPus3S5mXEcv4k/35t
cFY=
=mzoh
-----END PGP SIGNATURE-----

--------------zO156rzRNws1mrvpX8HRwZP1--
