Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A77F9C5C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06B10E1FA;
	Mon, 27 Nov 2023 09:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58BE10E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:07:13 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66A9521B6B;
 Mon, 27 Nov 2023 09:07:11 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 01F3E132A6;
 Mon, 27 Nov 2023 09:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OHWCOT5cZGXEZQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 09:07:10 +0000
Message-ID: <29b049b7-13d6-484c-b65f-f1a9ddb201b7@suse.de>
Date: Mon, 27 Nov 2023 10:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mxsfb: Drop extra space in request_irq args
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231125222504.97744-1-marex@denx.de>
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
In-Reply-To: <20231125222504.97744-1-marex@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------09S5DFGA04P7ij3o3aJuoaYR"
X-Spamd-Bar: +
X-Spam-Score: 1.90
X-Rspamd-Server: rspamd1
X-Spam-Level: *
X-Rspamd-Queue-Id: 66A9521B6B
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de; dkim=none;
 dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de
 (policy=none); 
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de
X-Spamd-Result: default: False [1.90 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]; 
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 R_SPF_SOFTFAIL(4.60)[~all:c]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 MIME_BASE64_TEXT(0.10)[]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_SPAM_SHORT(0.10)[0.033]; NEURAL_HAM_LONG(-1.00)[-0.999];
 RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,infradead.org:email,suse.de:email,lists.freedesktop.org:email,agner.ch:email,nxp.com:email,pengutronix.de:email,ffwll.ch:email,denx.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,linux.intel.com,kernel.org,nxp.com,pengutronix.de,agner.ch,lists.infradead.org];
 RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------09S5DFGA04P7ij3o3aJuoaYR
Content-Type: multipart/mixed; boundary="------------36l68mVlYIQkSxEwMC2CGeM1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org
Message-ID: <29b049b7-13d6-484c-b65f-f1a9ddb201b7@suse.de>
Subject: Re: [PATCH] drm/mxsfb: Drop extra space in request_irq args
References: <20231125222504.97744-1-marex@denx.de>
In-Reply-To: <20231125222504.97744-1-marex@denx.de>

--------------36l68mVlYIQkSxEwMC2CGeM1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI1LjExLjIzIHVtIDIzOjI0IHNjaHJpZWIgTWFyZWsgVmFzdXQ6DQo+IERyb3Ag
ZXh0cmEgc3BhY2UsIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IC0tLQ0KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdt
YWlsLmNvbT4NCj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCj4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+DQo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IENjOiBO
WFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+DQo+IENjOiBQZW5ndXRyb25peCBL
ZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0Br
ZXJuZWwub3JnPg0KPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+DQo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2Rydi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYw0K
PiBpbmRleCA2MjVjMWJmYzQxNzMzLi4zYmZhMzY5YjI1MDdlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL214c2ZiX2Rydi5jDQo+IEBAIC0xOTcsNyArMTk3LDcgQEAgc3RhdGljIGlu
dCBteHNmYl9pcnFfaW5zdGFsbChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaXJxKQ0K
PiAgIA0KPiAgIAlteHNmYl9pcnFfZGlzYWJsZShkZXYpOw0KPiAgIA0KPiAtCXJldHVybiBy
ZXF1ZXN0X2lycShpcnEsIG14c2ZiX2lycV9oYW5kbGVyLCAwLCAgZGV2LT5kcml2ZXItPm5h
bWUsIGRldik7DQo+ICsJcmV0dXJuIHJlcXVlc3RfaXJxKGlycSwgbXhzZmJfaXJxX2hhbmRs
ZXIsIDAsIGRldi0+ZHJpdmVyLT5uYW1lLCBkZXYpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0
aWMgdm9pZCBteHNmYl9pcnFfdW5pbnN0YWxsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------36l68mVlYIQkSxEwMC2CGeM1--

--------------09S5DFGA04P7ij3o3aJuoaYR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVkXD4FAwAAAAAACgkQlh/E3EQov+Ct
vBAAm1W0Io6LPA0+jAX2XkY1qlCEN7aEctQhmgLdwkp3GqgK0J6Pd9RE17bctcvYkIvh7LIK9KFQ
kdERSrvpDcCdIpzDnj8v16E8jmH7S/2uK4oQ4Uldxjx/OzyIha3tjjhGa/Vi+Ig9J8WrY5JPPQS3
HNxQajY0PofhN2RNF8j2JGuYd7m8ILVEgz/UAgjED1f0m8VjzViHy7X7ffMQMCWaxKFJBmUXPA3S
RT4cn18TFRQLx2iovTffZ4PcIq+Mq8wH2eq76qD3U+/k0bGvlUOInXxHkWn4Zxnofnujax6Jr5G6
u4gTEhVxappF8H/QFGUEs7kIw/jqaBgwk+sWgX8LfxAnbpJ0LSxHAZa3tqN0+VKWdvRTdWrFANsK
WuS6BqASUgOCpxApky8my1XJ1K8Ao951d61CcILBqm4V0iZiovFPNWdPdfe45ugyRy7MSFIMRefP
sBDiURS4nZzUYRBPFfLcI4KKLQWpui/Kskpzh3OJsacgajpSB6QPUd+gsdjJl+m52sWtDOkqe2mO
KysyjBGr1f5VXi+ZZg3X9iVcRR0R3ScouGIL2+gaki0y/u8rxCmYfpmRo/MtvZd+iJSE+0wtbRk8
NAlxOO1LOHM1s7ggUIYh/idgHZ7j0KDryG7PEuC1HFqU+xh8Wjt8IHypU/3N9BfE+Qpgdu8proN8
XTc=
=7E60
-----END PGP SIGNATURE-----

--------------09S5DFGA04P7ij3o3aJuoaYR--
