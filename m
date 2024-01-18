Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7458314AF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBDC10E720;
	Thu, 18 Jan 2024 08:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594B10E720
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:30:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52E70222BD;
 Thu, 18 Jan 2024 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705566613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ozEtRDovwQ9HKcq5Lq9pRgZfRZYSRvRqieYTeknXktg=;
 b=y7IlbFvtudo6t7J3NPU5RGi+lE+cYIBpNMVNAv4oJAjK0IkCFNAJ8lZp/+3Cen96ydGwJv
 9aVpJ86XqCFDJeh315ycRRFqBi7r9ln68v60yF4O//3yFX5+zH+lpMZsWwUHnJL0yYkyyS
 owKB7IXOQEaHNri2WSdN7VIV0W6h8Z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705566613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ozEtRDovwQ9HKcq5Lq9pRgZfRZYSRvRqieYTeknXktg=;
 b=CYHaaf5Ravr7Aa2lkq5UcQeSLUY702upzj7uDgnX29ZUOTAyw3cBhStxlvgZvN9+yhLNy9
 yRUV5f9644G2YDBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705566613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ozEtRDovwQ9HKcq5Lq9pRgZfRZYSRvRqieYTeknXktg=;
 b=y7IlbFvtudo6t7J3NPU5RGi+lE+cYIBpNMVNAv4oJAjK0IkCFNAJ8lZp/+3Cen96ydGwJv
 9aVpJ86XqCFDJeh315ycRRFqBi7r9ln68v60yF4O//3yFX5+zH+lpMZsWwUHnJL0yYkyyS
 owKB7IXOQEaHNri2WSdN7VIV0W6h8Z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705566613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ozEtRDovwQ9HKcq5Lq9pRgZfRZYSRvRqieYTeknXktg=;
 b=CYHaaf5Ravr7Aa2lkq5UcQeSLUY702upzj7uDgnX29ZUOTAyw3cBhStxlvgZvN9+yhLNy9
 yRUV5f9644G2YDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15ACA136F5;
 Thu, 18 Jan 2024 08:30:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ELcFBJXhqGVMJwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 08:30:13 +0000
Message-ID: <39622a13-3999-4bf6-b8fc-f7a70c8cd5da@suse.de>
Date: Thu, 18 Jan 2024 09:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/45] tty: vt: use VESA blanking constants
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-32-jirislaby@kernel.org>
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
In-Reply-To: <20240118075756.10541-32-jirislaby@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h0vEtYR4n9cc2zehO4z3Os4l"
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y7IlbFvt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CYHaaf5R
X-Spamd-Result: default: False [-2.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[hansenpartnership.com:email,suse.de:dkim,lists.freedesktop.org:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de,lists.freedesktop.org,HansenPartnership.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 52E70222BD
X-Spam-Level: 
X-Spam-Score: -2.80
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h0vEtYR4n9cc2zehO4z3Os4l
Content-Type: multipart/mixed; boundary="------------2w6xYYv6Qqcu08jEk1kOTx55";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org
Message-ID: <39622a13-3999-4bf6-b8fc-f7a70c8cd5da@suse.de>
Subject: Re: [PATCH 31/45] tty: vt: use VESA blanking constants
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-32-jirislaby@kernel.org>
In-Reply-To: <20240118075756.10541-32-jirislaby@kernel.org>

--------------2w6xYYv6Qqcu08jEk1kOTx55
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMDg6NTcgc2NocmllYiBKaXJpIFNsYWJ5IChTVVNFKToN
Cj4gVGhlcmUgYXJlIFZFU0EgYmxhbmtpbmcgY29uc3RhbnRzIGRlZmluZWQgaW4gY29uc29s
ZS5oIGFscmVhZHkuIFNvIHVzZQ0KPiB0aGVtIGluIHRoZSBjb25zb2xlIGNvZGUgaW5zdGVh
ZCBvZiBjb25zdGFudCB2YWx1ZXMuDQoNClRoZXNlIGNvbnN0YW50cyBhbHNvIGV4aXN0IGlu
IGluY2x1ZGUvdWFwaS9saW51eC9mYi5oLiBJdCB3b3VsZCBiZSBuaWNlIA0KdG8gZmluZCBh
IGNvbW1vbiBoZWFkZXIgd2hlcmUgdGhleSBjYW4gYmUgc2hhcmVkLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8
amlyaXNsYWJ5QGtlcm5lbC5vcmc+DQo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXgu
ZGU+DQo+IENjOiAiSmFtZXMgRS5KLiBCb3R0b21sZXkiIDxKYW1lcy5Cb3R0b21sZXlASGFu
c2VuUGFydG5lcnNoaXAuY29tPg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3Jn
DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBsaW51eC1w
YXJpc2NAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdHR5L3Z0L3Z0LmMg
ICAgICAgICAgICAgICAgIHwgOSArKysrKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2NvbnNv
bGUvbmV3cG9ydF9jb24uYyB8IDIgKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2NvbnNvbGUvc3Rp
Y29uLmMgICAgICB8IDIgKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2NvbnNvbGUvdmdhY29uLmMg
ICAgICB8IDYgKysrLS0tDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3Z0L3Z0
LmMgYi9kcml2ZXJzL3R0eS92dC92dC5jDQo+IGluZGV4IDI3OWY4MDJhYTIyMi4uNmY0NmZl
ZmVkY2ZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3R0eS92dC92dC5jDQo+ICsrKyBiL2Ry
aXZlcnMvdHR5L3Z0L3Z0LmMNCj4gQEAgLTQzMzQsNyArNDMzNCw3IEBAIHN0YXRpYyBpbnQg
c2V0X3Zlc2FfYmxhbmtpbmcodTggX191c2VyICptb2RlX3VzZXIpDQo+ICAgCQlyZXR1cm4g
LUVGQVVMVDsNCj4gICANCj4gICAJY29uc29sZV9sb2NrKCk7DQo+IC0JdmVzYV9ibGFua19t
b2RlID0gKG1vZGUgPCA0KSA/IG1vZGUgOiAwOw0KPiArCXZlc2FfYmxhbmtfbW9kZSA9ICht
b2RlIDwgNCkgPyBtb2RlIDogVkVTQV9OT19CTEFOS0lORzsNCj4gICAJY29uc29sZV91bmxv
Y2soKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+IEBAIC00MzYxLDcgKzQzNjEsNyBAQCB2
b2lkIGRvX2JsYW5rX3NjcmVlbihpbnQgZW50ZXJpbmdfZ2Z4KQ0KPiAgIAlpZiAoZW50ZXJp
bmdfZ2Z4KSB7DQo+ICAgCQloaWRlX2N1cnNvcih2Yyk7DQo+ICAgCQlzYXZlX3NjcmVlbih2
Yyk7DQo+IC0JCXZjLT52Y19zdy0+Y29uX2JsYW5rKHZjLCAxLCAxKTsNCj4gKwkJdmMtPnZj
X3N3LT5jb25fYmxhbmsodmMsIFZFU0FfVlNZTkNfU1VTUEVORCwgMSk7DQo+ICAgCQljb25z
b2xlX2JsYW5rZWQgPSBmZ19jb25zb2xlICsgMTsNCj4gICAJCWJsYW5rX3N0YXRlID0gYmxh
bmtfb2ZmOw0KPiAgIAkJc2V0X29yaWdpbih2Yyk7DQo+IEBAIC00MzgyLDcgKzQzODIsOCBA
QCB2b2lkIGRvX2JsYW5rX3NjcmVlbihpbnQgZW50ZXJpbmdfZ2Z4KQ0KPiAgIA0KPiAgIAlz
YXZlX3NjcmVlbih2Yyk7DQo+ICAgCS8qIEluIGNhc2Ugd2UgbmVlZCB0byByZXNldCBvcmln
aW4sIGJsYW5raW5nIGhvb2sgcmV0dXJucyAxICovDQo+IC0JaSA9IHZjLT52Y19zdy0+Y29u
X2JsYW5rKHZjLCB2ZXNhX29mZl9pbnRlcnZhbCA/IDEgOiAodmVzYV9ibGFua19tb2RlICsg
MSksIDApOw0KPiArCWkgPSB2Yy0+dmNfc3ctPmNvbl9ibGFuayh2YywgdmVzYV9vZmZfaW50
ZXJ2YWwgPyBWRVNBX1ZTWU5DX1NVU1BFTkQgOg0KPiArCQkJCSAodmVzYV9ibGFua19tb2Rl
ICsgMSksIDApOw0KPiAgIAljb25zb2xlX2JsYW5rZWQgPSBmZ19jb25zb2xlICsgMTsNCj4g
ICAJaWYgKGkpDQo+ICAgCQlzZXRfb3JpZ2luKHZjKTsNCj4gQEAgLTQ0MzMsNyArNDQzNCw3
IEBAIHZvaWQgZG9fdW5ibGFua19zY3JlZW4oaW50IGxlYXZpbmdfZ2Z4KQ0KPiAgIAl9DQo+
ICAgDQo+ICAgCWNvbnNvbGVfYmxhbmtlZCA9IDA7DQo+IC0JaWYgKHZjLT52Y19zdy0+Y29u
X2JsYW5rKHZjLCAwLCBsZWF2aW5nX2dmeCkpDQo+ICsJaWYgKHZjLT52Y19zdy0+Y29uX2Js
YW5rKHZjLCBWRVNBX05PX0JMQU5LSU5HLCBsZWF2aW5nX2dmeCkpDQo+ICAgCQkvKiBMb3ct
bGV2ZWwgZHJpdmVyIGNhbm5vdCByZXN0b3JlIC0+IGRvIGl0IG91cnNlbHZlcyAqLw0KPiAg
IAkJdXBkYXRlX3NjcmVlbih2Yyk7DQo+ICAgCWlmIChjb25zb2xlX2JsYW5rX2hvb2spDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9jb24uYyBiL2Ry
aXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0X2Nvbi5jDQo+IGluZGV4IDAzOWQxYzk5Mzdk
Mi4uYWQzYTA5MTQyNzcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUv
bmV3cG9ydF9jb24uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9j
b24uYw0KPiBAQCAtNDgwLDcgKzQ4MCw3IEBAIHN0YXRpYyBpbnQgbmV3cG9ydF9ibGFuayhz
dHJ1Y3QgdmNfZGF0YSAqYywgaW50IGJsYW5rLCBpbnQgbW9kZV9zd2l0Y2gpDQo+ICAgew0K
PiAgIAl1bnNpZ25lZCBzaG9ydCB0cmVnOw0KPiAgIA0KPiAtCWlmIChibGFuayA9PSAwKSB7
DQo+ICsJaWYgKGJsYW5rID09IFZFU0FfTk9fQkxBTktJTkcpIHsNCj4gICAJCS8qIHVuYmxh
bmsgY29uc29sZSAqLw0KPiAgIAkJdHJlZyA9IG5ld3BvcnRfdmMyX2dldChucHJlZ3MsIFZD
Ml9JUkVHX0NPTlRST0wpOw0KPiAgIAkJbmV3cG9ydF92YzJfc2V0KG5wcmVncywgVkMyX0lS
RUdfQ09OVFJPTCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29uc29sZS9zdGlj
b24uYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9zdGljb24uYw0KPiBpbmRleCBmM2JiNDhh
MGU5ODAuLjgxN2I4OWM0NWU4MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9jb25z
b2xlL3N0aWNvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9zdGljb24uYw0K
PiBAQCAtMzAwLDcgKzMwMCw3IEBAIHN0YXRpYyBib29sIHN0aWNvbl9zd2l0Y2goc3RydWN0
IHZjX2RhdGEgKmNvbnApDQo+ICAgDQo+ICAgc3RhdGljIGludCBzdGljb25fYmxhbmsoc3Ry
dWN0IHZjX2RhdGEgKmMsIGludCBibGFuaywgaW50IG1vZGVfc3dpdGNoKQ0KPiAgIHsNCj4g
LSAgICBpZiAoYmxhbmsgPT0gMCkgew0KPiArICAgIGlmIChibGFuayA9PSBWRVNBX05PX0JM
QU5LSU5HKSB7DQo+ICAgCWlmIChtb2RlX3N3aXRjaCkNCj4gICAJICAgIHZnYV9pc19nZngg
PSAwOw0KPiAgIAlyZXR1cm4gMTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vY29u
c29sZS92Z2Fjb24uYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYw0KPiBpbmRl
eCA1MDI1YWI1MDFmMDIuLjkxMGRjNzM4NzRiNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92
aWRlby9jb25zb2xlL3ZnYWNvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS92
Z2Fjb24uYw0KPiBAQCAtODAwLDEwICs4MDAsMTAgQEAgc3RhdGljIHZvaWQgdmdhX3BhbF9i
bGFuayhzdHJ1Y3Qgdmdhc3RhdGUgKnN0YXRlKQ0KPiAgIHN0YXRpYyBpbnQgdmdhY29uX2Js
YW5rKHN0cnVjdCB2Y19kYXRhICpjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3aXRjaCkNCj4g
ICB7DQo+ICAgCXN3aXRjaCAoYmxhbmspIHsNCj4gLQljYXNlIDA6CQkvKiBVbmJsYW5rICov
DQo+ICsJY2FzZSBWRVNBX05PX0JMQU5LSU5HOgkJLyogVW5ibGFuayAqLw0KPiAgIAkJaWYg
KHZnYV92ZXNhX2JsYW5rZWQpIHsNCj4gICAJCQl2Z2FfdmVzYV91bmJsYW5rKCZ2Z2FzdGF0
ZSk7DQo+IC0JCQl2Z2FfdmVzYV9ibGFua2VkID0gMDsNCj4gKwkJCXZnYV92ZXNhX2JsYW5r
ZWQgPSBWRVNBX05PX0JMQU5LSU5HOw0KPiAgIAkJfQ0KPiAgIAkJaWYgKHZnYV9wYWxldHRl
X2JsYW5rZWQpIHsNCj4gICAJCQl2Z2Ffc2V0X3BhbGV0dGUoYywgY29sb3JfdGFibGUpOw0K
PiBAQCAtODEzLDcgKzgxMyw3IEBAIHN0YXRpYyBpbnQgdmdhY29uX2JsYW5rKHN0cnVjdCB2
Y19kYXRhICpjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3aXRjaCkNCj4gICAJCXZnYV9pc19n
ZnggPSBmYWxzZTsNCj4gICAJCS8qIFRlbGwgY29uc29sZS5jIHRoYXQgaXQgaGFzIHRvIHJl
c3RvcmUgdGhlIHNjcmVlbiBpdHNlbGYgKi8NCj4gICAJCXJldHVybiAxOw0KPiAtCWNhc2Ug
MToJCS8qIE5vcm1hbCBibGFua2luZyAqLw0KPiArCWNhc2UgVkVTQV9WU1lOQ19TVVNQRU5E
OgkvKiBOb3JtYWwgYmxhbmtpbmcgKi8NCj4gICAJCWlmICghbW9kZV9zd2l0Y2ggJiYgdmdh
X3ZpZGVvX3R5cGUgPT0gVklERU9fVFlQRV9WR0FDKSB7DQo+ICAgCQkJdmdhX3BhbF9ibGFu
aygmdmdhc3RhdGUpOw0KPiAgIAkJCXZnYV9wYWxldHRlX2JsYW5rZWQgPSB0cnVlOw0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0Niwg
OTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMs
IEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJu
YmVyZykNCg==

--------------2w6xYYv6Qqcu08jEk1kOTx55--

--------------h0vEtYR4n9cc2zehO4z3Os4l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWo4ZQFAwAAAAAACgkQlh/E3EQov+Aa
cw/9GQ0PgqhvWZqzdvxs32R3bd7OniNvdXA3h5yAFHPi/wbCyj6cfIbd9oD+wGN+YhISc2jbPuNR
PDue4szvjBEDGuc0vryM3PcRu5qml4LKkLOVRfAgbZXIVpi+KNqaiCzUBc3nC2+92IImYcSYeGX0
gCZipjWDEfGXubOCcIekklCfypBvHInQC7NdtMh7H0fLeDfdPx9ijTHNqDvjxVQlal35uK2HDhf0
GL3xRmWQBqGrLmAkwLuptic8n4a7dUsOw/AxOKDyEwup7gs1TvqifrNqT5UVqO1KW7/Kjm+Qd+YO
cuWzWZMtDGfPHk8mdHPMRnG3dc6FgCdCPz7x7pjg+ovfNh7/gkxVsCpuiqG8kur18AGrgclyPbpH
elTvxHLGJGzThybCxJWP7WjclnA44Key6YDQ4t7CUL+Ncq36tTwG9+6QUXog9v2QlmHPKCJUHk/c
3/fs0JNpW5yWF8cGQiLhiAWAzhatPe+BZkoRUDPVOqdnbkQSY1s7s51spYR1BYaPdipS3y5j0mwx
MdM1THDtDRTOgadQbu8EOCt3M+TnrfEnu0LGOnMUZw6aTI/A0sZNAYHQAqn+z7JNQi7GlaNsbmXl
orGtfvS21NbRczFp5eOQy5tkjGY1Xln6FMghV844NWGRNduhyi0CTLzHyjVdww0B6dzzVZ/JCyl7
HEI=
=L4AR
-----END PGP SIGNATURE-----

--------------h0vEtYR4n9cc2zehO4z3Os4l--
