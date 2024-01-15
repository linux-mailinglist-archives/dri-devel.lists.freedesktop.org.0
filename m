Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049482D4EE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A103810E07B;
	Mon, 15 Jan 2024 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E95410E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:21:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E7CA61FB3B;
 Mon, 15 Jan 2024 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705306870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NR8YmSTfDNL7OE58BjKqA9khMNZ94ijKfi6mIKtUDQI=;
 b=kXVcMX/gNdMpeg4f+aqxcuQmtwRkpV2IIjfIkrD4YfAEKy8BNRsEgDsjX86Gp+D9cP5Pn3
 GNwVuKsvFYAEUkHP2Yk53FYFFg0wMWQpFQKqz4BqxoHPJG/XKMPe0m4t6Bs5l3+oOODCrl
 iwKZJxRx0vvi+L3qdcPaWV8AAfQifDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705306870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NR8YmSTfDNL7OE58BjKqA9khMNZ94ijKfi6mIKtUDQI=;
 b=aW9kTVo8oQ4HorTxqWyINh/PACELFe4Tn2E1qmhlwReepDtzgAq8YBmmUjVE36efDsswAF
 6cAOcNResFQtjoDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705306868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NR8YmSTfDNL7OE58BjKqA9khMNZ94ijKfi6mIKtUDQI=;
 b=gYhxTmlEpLwMr1+KFVqt/b93QyuRDfrPUfOp/rjFbto/4kz0E3/W9NwcaIBISLF3wI8p72
 JDH+RiFQ+VCl0Wqx9VNxSY7gwJqI/V6usVo7dYnD1/1gnmPyBLHeSxh2iGWpDqDOGxeDfb
 qtXgp1rkRmEExC6aTE1LX5r9uLCR9OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705306868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NR8YmSTfDNL7OE58BjKqA9khMNZ94ijKfi6mIKtUDQI=;
 b=v0xRbUFrjaEeHmGScYLY3ybmGxLG2qv6qHgHaiRy5p7zcekttUdxMadPOa88dIiMwSFS9E
 AT+iSzApblaNZHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA425132FA;
 Mon, 15 Jan 2024 08:21:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id g4yBK/TqpGXefgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jan 2024 08:21:08 +0000
Message-ID: <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
Date: Mon, 15 Jan 2024 09:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
Content-Language: en-US
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
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
In-Reply-To: <20240112203803.6421-1-ian.forbes@broadcom.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4uF2jaFfMqRaYoQOSzHcTIwr"
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gYhxTmlE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v0xRbUFr
X-Spamd-Result: default: False [-7.80 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 MX_GOOD(-0.01)[]; DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 SIGNED_PGP(-2.00)[]; DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E7CA61FB3B
X-Spam-Level: 
X-Spam-Score: -7.80
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
Cc: maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4uF2jaFfMqRaYoQOSzHcTIwr
Content-Type: multipart/mixed; boundary="------------Qsa85RVCghR7ZZg17QhhS03x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 martin.krastev@broadcom.com
Message-ID: <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
In-Reply-To: <20240112203803.6421-1-ian.forbes@broadcom.com>

--------------Qsa85RVCghR7ZZg17QhhS03x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDEuMjQgdW0gMjE6Mzggc2NocmllYiBJYW4gRm9yYmVzOg0KPiBTVkdB
IHJlcXVpcmVzIHN1cmZhY2VzIHRvIGZpdCB3aXRoaW4gZ3JhcGhpY3MgbWVtb3J5IChtYXhf
bW9iX3BhZ2VzKSB3aGljaA0KPiBtZWFucyB0aGF0IG1vZGVzIHdpdGggYSBmaW5hbCBidWZm
ZXIgc2l6ZSB0aGF0IHdvdWxkIGV4Y2VlZCBncmFwaGljcyBtZW1vcnkNCj4gbXVzdCBiZSBw
cnVuZWQgb3RoZXJ3aXNlIGNyZWF0aW9uIHdpbGwgZmFpbC4NCj4gDQo+IEFkZGl0aW9uYWxs
eSwgZGV2aWNlIGNvbW1hbmRzIHdoaWNoIHVzZSBtdWx0aXBsZSBncmFwaGljcyByZXNvdXJj
ZXMgbXVzdA0KPiBoYXZlIGFsbCB0aGVpciByZXNvdXJjZXMgZml0IHdpdGhpbiBncmFwaGlj
cyBtZW1vcnkgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUNCj4gY29tbWFuZC4gVGh1cyB3ZSBu
ZWVkIGEgc21hbGwgY2FydmUgb3V0IG9mIDEvNCBvZiBncmFwaGljcyBtZW1vcnkgdG8gZW5z
dXJlDQo+IGNvbW1hbmRzIGxpa2VzIHN1cmZhY2UgY29waWVzIHRvIHRoZSBwcmltYXJ5IGZy
YW1lYnVmZmVyIGZvciBjdXJzb3INCj4gY29tcG9zaXRpb24gb3IgZGFtYWdlIGNsaXBzIGNh
biBmaXQgd2l0aGluIGdyYXBoaWNzIG1lbW9yeS4NCj4gDQo+IFRoaXMgZml4ZXMgYW4gaXNz
dWUgd2hlcmUgVk1zIHdpdGggbG93IGdyYXBoaWNzIG1lbW9yeSAoPCA2NE1pQikgY29uZmln
dXJlZA0KPiB3aXRoIGhpZ2ggcmVzb2x1dGlvbiBtb2RlIGJvb3QgdG8gYSBibGFjayBzY3Jl
ZW4gYmVjYXVzZSBzdXJmYWNlIGNyZWF0aW9uDQo+IGZhaWxzLg0KDQpUaGF0IGlzIGEgbG9u
Zy1zdGFuZGluZyBwcm9ibGVtLCB3aGljaCB3ZSBoYXZlIG9ic2VydmVkIHdpdGggb3RoZXIg
DQpkcml2ZXJzIGFzIHdlbGwuIE9uIGxvdy1tZW1vcnkgZGV2aWNlcywgVFRNIGRvZXNuJ3Qg
cGxheSB3ZWxsLiBUaGUgcmVhbCANCmZpeCB3b3VsZCBiZSB0byBleHBvcnQgYWxsIG1vZGVz
IHRoYXQgcG9zc2libHkgZml0IGFuZCBzb3J0IG91dCB0aGUgDQppbnZhbGlkIGNvbmZpZ3Vy
YXRpb25zIGluIGF0b21pY19jaGVjay4gSXQncyBqdXN0IGEgbG90IG1vcmUgd29yay4NCg0K
RGlkIHlvdSBjb25zaWRlciBzaW1wbHkgaWdub3Jpbmcgdm13Z2Z4IGRldmljZXMgd2l0aCBs
ZXNzIHRoYW4gNjQgTWlCIG9mIA0KVlJBTT8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSWFu
IEZvcmJlcyA8aWFuLmZvcmJlc0Bicm9hZGNvbS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+IGluZGV4IDI4ZmYz
MGUzMmZhYi4uMzlkNmQxN2ZjNDg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYw0KPiBAQCAtMjg1NCwxMiArMjg1NCwxMiBAQCBlbnVtIGRybV9tb2RlX3N0
YXR1cyB2bXdfY29ubmVjdG9yX21vZGVfdmFsaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciwNCj4gICAJc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2
KGRldik7DQo+ICAgCXUzMiBtYXhfd2lkdGggPSBkZXZfcHJpdi0+dGV4dHVyZV9tYXhfd2lk
dGg7DQo+ICAgCXUzMiBtYXhfaGVpZ2h0ID0gZGV2X3ByaXYtPnRleHR1cmVfbWF4X2hlaWdo
dDsNCj4gLQl1MzIgYXNzdW1lZF9jcHAgPSA0Ow0KPiArCXUzMiBhc3N1bWVkX2NwcCA9IGRl
dl9wcml2LT5hc3N1bWVfMTZicHAgPyAyIDogNDsNCj4gKwl1MzIgcGl0Y2ggPSBtb2RlLT5o
ZGlzcGxheSAqIGFzc3VtZWRfY3BwOw0KPiArCXU2NCB0b3RhbCA9IG1vZGUtPnZkaXNwbGF5
ICogcGl0Y2g7DQo+ICsJYm9vbCB1c2luZ19zdGR1ID0gZGV2X3ByaXYtPmFjdGl2ZV9kaXNw
bGF5X3VuaXQgPT0gdm13X2R1X3NjcmVlbl90YXJnZXQ7DQo+ICAgDQo+IC0JaWYgKGRldl9w
cml2LT5hc3N1bWVfMTZicHApDQo+IC0JCWFzc3VtZWRfY3BwID0gMjsNCj4gLQ0KPiAtCWlm
IChkZXZfcHJpdi0+YWN0aXZlX2Rpc3BsYXlfdW5pdCA9PSB2bXdfZHVfc2NyZWVuX3Rhcmdl
dCkgew0KPiArCWlmICh1c2luZ19zdGR1KSB7DQo+ICAgCQltYXhfd2lkdGggID0gbWluKGRl
dl9wcml2LT5zdGR1X21heF93aWR0aCwgIG1heF93aWR0aCk7DQo+ICAgCQltYXhfaGVpZ2h0
ID0gbWluKGRldl9wcml2LT5zdGR1X21heF9oZWlnaHQsIG1heF9oZWlnaHQpOw0KPiAgIAl9
DQo+IEBAIC0yODcwLDkgKzI4NzAsMTMgQEAgZW51bSBkcm1fbW9kZV9zdGF0dXMgdm13X2Nv
bm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+
ICAgCWlmIChtYXhfaGVpZ2h0IDwgbW9kZS0+dmRpc3BsYXkpDQo+ICAgCQlyZXR1cm4gTU9E
RV9CQURfVlZBTFVFOw0KPiAgIA0KPiAtCWlmICghdm13X2ttc192YWxpZGF0ZV9tb2RlX3Zy
YW0oZGV2X3ByaXYsDQo+IC0JCQltb2RlLT5oZGlzcGxheSAqIGFzc3VtZWRfY3BwLA0KPiAt
CQkJbW9kZS0+dmRpc3BsYXkpKQ0KPiArCWlmICh1c2luZ19zdGR1ICYmDQo+ICsJCSh0b3Rh
bCA+IChkZXZfcHJpdi0+bWF4X21vYl9wYWdlcyAqIFBBR0VfU0laRSAqIDMgLyA0KSB8fA0K
DQpJREsgdGhlIGRldGFpbHMgb2Ygdm13Z2Z4J3MgbWVtb3J5IG1hbmFnZW1lbnQsIGJ1dCBp
bnN0ZWFkIG9mIHRoaXMgJzMvNCANCnRlc3QnLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8g
cGFydGl0aW9uIHRoZSBWUkFNIHZpYSBUVE0gYW5kIHRlc3QgDQphZ2FpbnN0IHRoZSBwYXJ0
aXRpb24gc2l6ZXM/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKwkJdG90YWwgPiBk
ZXZfcHJpdi0+bWF4X21vYl9zaXplKSkgew0KPiArCQlyZXR1cm4gTU9ERV9NRU07DQo+ICsJ
fQ0KPiArDQo+ICsJaWYgKCF2bXdfa21zX3ZhbGlkYXRlX21vZGVfdnJhbShkZXZfcHJpdiwg
cGl0Y2gsIG1vZGUtPnZkaXNwbGF5KSkNCj4gICAJCXJldHVybiBNT0RFX01FTTsNCj4gICAN
Cj4gICAJcmV0dXJuIE1PREVfT0s7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------Qsa85RVCghR7ZZg17QhhS03x--

--------------4uF2jaFfMqRaYoQOSzHcTIwr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWk6vQFAwAAAAAACgkQlh/E3EQov+AX
vBAAsoqr+BS3UY+PgwE0bOQjc80+8pCRfGaX+QBJ6tlNBGAYv1Ul7bc+jAjSfVnPJYZLwwin4TaI
hjqdrhk5sPBjMD/6jbO60cHJQFrqYboRWe92SKyvrPI0KBxum4aCMMJrV76izpkv1ScpFDfbjDo9
WENDozsdJlpCC9RV4oEsastP+vMkiDKfaqPX1i5meB+vYFnDNoulG1D01Gmqqd/5BXH4dVaJaPSk
tZ/8/PD6iItSKZo+NqKf5sPOBBhaIQDod0UCuSVhS2og+FH12tuX2LTbqY67lsa/eITLRaup3/p+
rJeXfy2JL1dKPi/FdNpAz1ylO78leukqpZUzOIDUvOQK841sr2rOlZscnko1g6rsM793IxXThU75
gHEmmyqt0Rt3Oo7TcvjOEyRj/SXrvNWpX3Uonuu9vGmHjD2GG0izJOkg3Nn0eaoP3xc96Fu3vgvI
CcVC11WXjIKGiDPgcr+CHEFAUoG8VVVLqhVBwGdNG5cGw8CEnDjm4QYk5nnrMt8Cct1n+4xZ8jLK
Q5SbU2eImXSB/XIOO14XX5ed69NQ7SLRFKAlzTWBt34plStxhcLxqSb7LH+McN7NdvAIhVR1CoPT
TGLNRWSRZV7PeriyPJ42zslCmTUGIQiL9+UXzPyjakGb2Y64hVQzH7po+6SaR4Alr0A8bRF/T7dj
9SA=
=G/Uv
-----END PGP SIGNATURE-----

--------------4uF2jaFfMqRaYoQOSzHcTIwr--
