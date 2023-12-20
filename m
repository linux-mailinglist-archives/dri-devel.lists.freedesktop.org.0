Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711981A030
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40A210E59A;
	Wed, 20 Dec 2023 13:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2510E59A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:48:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 491171F834;
 Wed, 20 Dec 2023 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=26iluqXi/6eolzzmfB1qWPyG+bKbZJmiBvcSHEoa61w=;
 b=Ap/6vbcrOLeXBBWxYWSa+JUF+zYekD/0socAurKLrzYF3dd1I2GkUFYqtVkLvQ+vktX9N1
 qACT1CPJ7w4LVBnVn2Im+fSWDere6Pr3liVQwn1bBnDS6tUczoF8B8mB7LExZwe3AxosJE
 vxptbkByDlBBnXf7tp6TPe8h0/V1m20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=26iluqXi/6eolzzmfB1qWPyG+bKbZJmiBvcSHEoa61w=;
 b=mlo09KWK3twkQVxsbEXQ1AQxVIOmE6StVECy2zZ3KFJj/VO0gotyLV93v/TVDetBpnrc1h
 XXM/0dcaQ4Y8srAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=26iluqXi/6eolzzmfB1qWPyG+bKbZJmiBvcSHEoa61w=;
 b=Ap/6vbcrOLeXBBWxYWSa+JUF+zYekD/0socAurKLrzYF3dd1I2GkUFYqtVkLvQ+vktX9N1
 qACT1CPJ7w4LVBnVn2Im+fSWDere6Pr3liVQwn1bBnDS6tUczoF8B8mB7LExZwe3AxosJE
 vxptbkByDlBBnXf7tp6TPe8h0/V1m20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=26iluqXi/6eolzzmfB1qWPyG+bKbZJmiBvcSHEoa61w=;
 b=mlo09KWK3twkQVxsbEXQ1AQxVIOmE6StVECy2zZ3KFJj/VO0gotyLV93v/TVDetBpnrc1h
 XXM/0dcaQ4Y8srAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EA8413A08;
 Wed, 20 Dec 2023 13:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id lCRZApbwgmWpJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:48:06 +0000
Message-ID: <6d296b3a-854e-4cc6-a5bb-c448be5bc709@suse.de>
Date: Wed, 20 Dec 2023 14:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
References: <20231214163849.359691-1-jfalempe@redhat.com>
 <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
 <beec3b5d-689a-4b25-be4b-9ff7532bb2e6@redhat.com>
 <3b2fbb7f-3243-4f98-90bc-edb1b4db2bb4@redhat.com>
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
In-Reply-To: <3b2fbb7f-3243-4f98-90bc-edb1b4db2bb4@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IAVrz0S5TQdlo7b7BkgulNxT"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.82
X-Spamd-Result: default: False [-4.82 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-2.54)[97.91%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.981]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[cgit.freedesktop.org:url];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IAVrz0S5TQdlo7b7BkgulNxT
Content-Type: multipart/mixed; boundary="------------O2z7KBShViF7L0z2q4fzKBMv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Message-ID: <6d296b3a-854e-4cc6-a5bb-c448be5bc709@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
References: <20231214163849.359691-1-jfalempe@redhat.com>
 <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
 <beec3b5d-689a-4b25-be4b-9ff7532bb2e6@redhat.com>
 <3b2fbb7f-3243-4f98-90bc-edb1b4db2bb4@redhat.com>
In-Reply-To: <3b2fbb7f-3243-4f98-90bc-edb1b4db2bb4@redhat.com>

--------------O2z7KBShViF7L0z2q4fzKBMv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTIuMjMgdW0gMTQ6MDYgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEkganVzdCBtZXJnZWQgaXQgdG8gZHJtLW1pc2MtZml4ZXM6DQo+IA0KPiBodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2g9ZHJtLW1pc2MtZml4
ZXMmaWQ9MTFmOWViODk5ZWNjOGMwMmI3NjljZjhkMjUzMmJhMTI3ODZhN2FmNw0KPiANCj4g
VGhhbmtzLA0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSBmaXguDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJh
bmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------O2z7KBShViF7L0z2q4fzKBMv--

--------------IAVrz0S5TQdlo7b7BkgulNxT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWC8JUFAwAAAAAACgkQlh/E3EQov+CN
mw/+OJ+9c8nqi7nKvYsGF7AXKk+cnk1XCwBkf3zYoEi357bRw/0W/VfWu4neJQbXixY7wga2rmBC
oMiHGaAx9t9SbJEVC8RKykWeWqrsS8E5XWrVAxl0Fm2fxbcsqRhcMzTCCtacvpKJmd8QFy4/kRKy
iSsxWcVF4KuHbBWMb6IhNlCuyHGhPfM/VzNJMcr4/8RoBk8lzLMDxJ0oCR4M1D3K5yjxBQsZWGpU
UrThfAASGC9I9T6r5J71STuUo+G+a2X7C3tlbshirGUkNfF2zQXbZUy51lw6CkzB2itsNN4fpn9m
fm7TlQiqvKT50qkSTeLmmCDYLVPBNNPd0nk3VDPHTxJraAhRE/dVWdZn7tYzhY/DwfcqcZHUhMYv
3K7AhUcTbBUUnAYNeC6uLOKggrEm1QJ/ZuLEHs56W6b0qCcqxmqH9JYl9ftcxVekhgdh9V2IQ7dy
jhg8gPyY+IyF1KAJVTO8TN2AXLa2jg8n+92a/Jki5INDv/dwyIkGDbDNGx4/Gvm4+MSTQbRNMrrm
wLPcFM3gRNIqKy+6aQ9mv8VOhwYDb1zYPRnP960CC2woBXmVw3md82k00Ts8TUFHUbSWEtQtegQ/
VUwi9wEF5m36rymVFj7V5rHnbNV9Dc2Xo2M4UXM5LcBSgKngG1OOn7K6bjfD2ZoniCixZQjUnHSS
t0E=
=DbJ7
-----END PGP SIGNATURE-----

--------------IAVrz0S5TQdlo7b7BkgulNxT--
