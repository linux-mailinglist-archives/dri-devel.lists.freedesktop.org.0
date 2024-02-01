Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B79845287
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31A10E5EA;
	Thu,  1 Feb 2024 08:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825E310E5EA
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 08:17:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF535221B1;
 Thu,  1 Feb 2024 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706775439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0XDPNqdL7AzJ4bDcrCfCzXmkLc/Eb2YnvHgnkS6F3Ug=;
 b=cPW7FbNDeFJqv2yhvxGxmScANCxmwPm0k4uTLDHOARwWBCpMLuynx9LXS/UVNgc5pVauVB
 g0Bjn97EoNQzCmvWuBdcHprqYbKz+o91Kl4xcscW6sVH/rL++MpkxL3M7JR+ECqn+j8yAA
 Q8yqHoLoUve9vGowbSkGa5INsAlynUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706775439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0XDPNqdL7AzJ4bDcrCfCzXmkLc/Eb2YnvHgnkS6F3Ug=;
 b=AhKU2YzRfbx9knOxnyhQE/ZbzDR/JP61ni1UAJ3ZqigstnrXzGRVOlm5uk/E1zcwgbF3ra
 Nvuk5rmsXuYxltCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706775439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0XDPNqdL7AzJ4bDcrCfCzXmkLc/Eb2YnvHgnkS6F3Ug=;
 b=cPW7FbNDeFJqv2yhvxGxmScANCxmwPm0k4uTLDHOARwWBCpMLuynx9LXS/UVNgc5pVauVB
 g0Bjn97EoNQzCmvWuBdcHprqYbKz+o91Kl4xcscW6sVH/rL++MpkxL3M7JR+ECqn+j8yAA
 Q8yqHoLoUve9vGowbSkGa5INsAlynUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706775439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0XDPNqdL7AzJ4bDcrCfCzXmkLc/Eb2YnvHgnkS6F3Ug=;
 b=AhKU2YzRfbx9knOxnyhQE/ZbzDR/JP61ni1UAJ3ZqigstnrXzGRVOlm5uk/E1zcwgbF3ra
 Nvuk5rmsXuYxltCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6268C1329F;
 Thu,  1 Feb 2024 08:17:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id bjnNFo9Tu2VUQgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Feb 2024 08:17:19 +0000
Message-ID: <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
Date: Thu, 1 Feb 2024 09:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
To: mhklinux@outlook.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, drawat.floss@gmail.com, javierm@redhat.com,
 deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
References: <20240201060022.233666-1-mhklinux@outlook.com>
Content-Language: en-US
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
In-Reply-To: <20240201060022.233666-1-mhklinux@outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RSTStixnH0ez825aw0C0c0dB"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.59 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,outlook.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 TO_DN_NONE(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,suse.de:email];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[outlook.com,microsoft.com,kernel.org,gmail.com,redhat.com,gmx.de,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.59
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
Cc: linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RSTStixnH0ez825aw0C0c0dB
Content-Type: multipart/mixed; boundary="------------CbJRBa0hGe4rp2SYqjcA0c0b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, drawat.floss@gmail.com, javierm@redhat.com,
 deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Message-ID: <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
Subject: Re: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
References: <20240201060022.233666-1-mhklinux@outlook.com>
In-Reply-To: <20240201060022.233666-1-mhklinux@outlook.com>

--------------CbJRBa0hGe4rp2SYqjcA0c0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjQgdW0gMDc6MDAgc2NocmllYiBtaGtlbGxleTU4QGdtYWlsLmNv
bToNCj4gRnJvbTogTWljaGFlbCBLZWxsZXkgPG1oa2xpbnV4QG91dGxvb2suY29tPg0KPiAN
Cj4gQSByZWNlbnQgY29tbWl0IHJlbW92aW5nIHRoZSB1c2Ugb2Ygc2NyZWVuX2luZm8gaW50
cm9kdWNlZCBhIGxvZ2ljDQo+IGVycm9yLiBUaGUgZXJyb3IgY2F1c2VzIGh2ZmJfZ2V0bWVt
KCkgdG8gYWx3YXlzIHJldHVybiAtRU5PTUVNDQo+IGZvciBHZW5lcmF0aW9uIDIgVk1zLiBB
cyBhIHJlc3VsdCwgdGhlIEh5cGVyLVYgZnJhbWUgYnVmZmVyDQo+IGRldmljZSBmYWlscyB0
byBpbml0aWFsaXplLiBUaGUgZXJyb3Igd2FzIGludHJvZHVjZWQgYnkgcmVtb3ZpbmcNCj4g
YW4gImVsc2UgaWYiIGNsYXVzZSwgbGVhdmluZyBHZW4yIFZNcyB0byBhbHdheXMgdGFrZSB0
aGUgLUVOT01FTQ0KPiBlcnJvciBwYXRoLg0KPiANCj4gRml4IHRoZSBwcm9ibGVtIGJ5IHJl
bW92aW5nIHRoZSBlcnJvciBwYXRoICJlbHNlIiBjbGF1c2UuIEdlbiAyDQo+IFZNcyBub3cg
YWx3YXlzIHByb2NlZWQgdGhyb3VnaCB0aGUgTU1JTyBtZW1vcnkgYWxsb2NhdGlvbiBjb2Rl
LA0KPiBidXQgd2l0aCAiYmFzZSIgYW5kICJzaXplIiBkZWZhdWx0aW5nIHRvIDAuDQoNCklu
ZGVlZCwgdGhhdCdzIGhvdyBpdCB3YXMgc3VwcG9zZWQgdG8gd29yay4gSURLIGhvdyBJIGRp
ZG4ndCBub3RpY2UgdGhpcyANCmJ1Zy4gVGhhbmtzIGEgbG90IGZvciB0aGUgZml4Lg0KDQo+
IA0KPiBGaXhlczogMGFhMDgzOGM4NGRhICgiZmJkZXYvaHlwZXJ2X2ZiOiBSZW1vdmUgZmly
bXdhcmUgZnJhbWVidWZmZXJzIHdpdGggYXBlcnR1cmUgaGVscGVycyIpDQo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgS2VsbGV5IDxtaGtsaW51eEBvdXRsb29rLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0t
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCAyIC0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9oeXBlcnZfZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2
X2ZiLmMNCj4gaW5kZXggYzI2ZWU2ZmQ3M2M5Li44ZmRjY2YwMzNiMmQgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMNCj4gKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9oeXBlcnZfZmIuYw0KPiBAQCAtMTAxMCw4ICsxMDEwLDYgQEAgc3RhdGlj
IGludCBodmZiX2dldG1lbShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2LCBzdHJ1Y3QgZmJfaW5m
byAqaW5mbykNCj4gICAJCQlnb3RvIGdldG1lbV9kb25lOw0KPiAgIAkJfQ0KPiAgIAkJcHJf
aW5mbygiVW5hYmxlIHRvIGFsbG9jYXRlIGVub3VnaCBjb250aWd1b3VzIHBoeXNpY2FsIG1l
bW9yeSBvbiBHZW4gMSBWTS4gVXNpbmcgTU1JTyBpbnN0ZWFkLlxuIik7DQo+IC0JfSBlbHNl
IHsNCj4gLQkJZ290byBlcnIxOw0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------CbJRBa0hGe4rp2SYqjcA0c0b--

--------------RSTStixnH0ez825aw0C0c0dB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW7U44FAwAAAAAACgkQlh/E3EQov+BQ
+Q/+LraNaBvf8EiYIkWJ1xjl5gBQr1UbHhEGBgLY78kB5t6m4EP76UxbT36hsj8dq9TcYKX7dWe5
Jmyffr8h4L56Hy34Gr3YnXX67zqEFP3DULTuJyAUgBsjh2rNwZ3gPMyeIEPEGFIsi9CG/v/KdICN
oSgtrkJNq/gtqn+uRRY4dRWEn4JTz7FgW9lcg7yJeocnHNXJNd5f4RVOE/mF6pe3K1eLV5Xar4uv
XMxz7DTPg1eNYEsJDGd2rL0QkhYrzt06T/JljBHl8A3O3gfUMpnQtYXKU2tdFcp/Arqpgy1IqyTb
rmcV6r1Wp4ECHfQNca4jtd9XfHNgfBPI9N9ZQXTKTt5/WxxuEVIXQXHge87sQeCaZM4uh5Pc0kyd
EWQpiB1v3XOzpJun48cmaQWEbVYvgDVXqR8N/hjot3tYD2cTiPwX6ZVbIGQ95MyNO5GfWWsITqF/
ou/HKeeDQKIU+zVtZizo4EC+P6uvKyW3vfctRJ9X5MnWTdyw2wpjUs5AzdFnu/KgflB5RUlYUTyg
yByWp+2YEjnzoW84h1u5BTbwr58gHlpljIqTRWRf/ZNNxpWJD58volM8+SlDyGD+h7Ujw4Xpn9To
xouMOQe7LPtKRq5GvE2dAKUYCkjW1bSThD0pIdYK8KCOf5IuPvFYz+kysuUTtNlm+bSBipTgsqLT
Gu4=
=bN3A
-----END PGP SIGNATURE-----

--------------RSTStixnH0ez825aw0C0c0dB--
