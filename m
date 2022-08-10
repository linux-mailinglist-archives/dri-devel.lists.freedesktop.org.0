Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C958E761
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 08:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAD4B029E;
	Wed, 10 Aug 2022 06:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B99AEC4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:41:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7F551F90C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660113677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=URPQLOkGn6C92SR6CESvNIjMoUJ2ZQq/qoFTaVR9b/E=;
 b=WP8q1X/SbNSCR0LPeMIrcOsgi/1UhXAp4rReJXyAoWcFnfOyzsY31l24zZ1R7m+1yivGCA
 1hDuPVp44NB4L2vuew9FNvHpkX54SgfSFDEfz1VulchSaT/cnmldhO/BfD6MnxMylnwihg
 7ggEWbh7wPS4Q2LiyTl7DNcHA4hcgig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660113677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=URPQLOkGn6C92SR6CESvNIjMoUJ2ZQq/qoFTaVR9b/E=;
 b=sP4OTgxP/2WiwmmRPpL/43zSLXx2VuWxt1WqRkzbiWkecRMJa8wyeANqla7Fawbhl5ihRo
 J4zyspPbhwmffvAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8E8013A7E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:41:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cR4pKA1T82K/PgAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:41:17 +0000
Message-ID: <181643ff-23fe-f034-396b-88f43c383d29@suse.de>
Date: Wed, 10 Aug 2022 08:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is closed
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6f7wbVq9JmK1kz0COMtPEzd0"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6f7wbVq9JmK1kz0COMtPEzd0
Content-Type: multipart/mixed; boundary="------------0OwxKGoLBxOOWGmmN75FY3JV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <181643ff-23fe-f034-396b-88f43c383d29@suse.de>
Subject: PSA: drm-misc-next-fixes is closed

--------------0OwxKGoLBxOOWGmmN75FY3JV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBqdXN0IGxldHRpbmcgeW91IGtub3cgdGhhdCBkcm0tbWlzYy1uZXh0LWZp
eGVzIGlzIGNsb3NpbmcuIHY2LjAtcmMxIA0Kd2lsbCBsaWtlbHkgYmUgdGFnZ2VkIG5leHQg
d2Vla2VuZCBhbmQgZHJtLW5leHQgd2lsbCBiZSBvcGVuIGZvciANCmZlYXR1cmVzIGFuZCBi
dWdmaXhlcyB1bnRpbCAtcmM2IGNvbWVzIG91dC4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90
byBkcm0tbWlzYy1maXhlcy1uZXh0IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQpn
ZXR0aW5nIGFwcGxpZWQgdG8gdGhlIHdyb25nIHRyZWUgYW5kL29yIGdldCBzdHVjayBmb3Ig
YSBsb25nIHRpbWUuIFNvbWUgDQpydWxlcyBvZiB0aHVtYiBhcmU6DQoNCiAgICogaWYgeW91
ciBwYXRjaCBmaXhlcyBhIGJ1ZyBpbiB1cHN0cmVhbSwgcGxlYXNlIHB1dCBpdCBpbnRvIA0K
ZHJtLW1pc2MtZml4ZXMsDQoNCiAgICogYW55dGhpbmcgZWxzZSBzaG91bGQgZ28gaW50byBk
cm0tbWlzYy1uZXh0Lg0KDQpUaGUgZmxvdyBjaGFydCBpcyBhdCBbMV0uDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9y
Zy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0tbWlzYy5odG1sI3doZXJlLWRvLWkt
YXBwbHktbXktcGF0Y2gNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0OwxKGoLBxOOWGmmN75FY3JV--

--------------6f7wbVq9JmK1kz0COMtPEzd0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLzUwwFAwAAAAAACgkQlh/E3EQov+Ay
vBAA0JQ0Q3veRyXDSivlnxdiMHZfT7y6aGCnqFd8KFCXfa085kmQKGY5lEwLP/2BjHRf7DRSJWbZ
lDWCRXaglAxH3FLrjJ7iUFF5YgJ+FaKNst9/AiD9hcvflIH4TImAoCmTCxwdcc3MYUCcRSIkMi15
OthBs1SdAVO6nT4MwIpOAJKM+/5tUZa6hb+Cp6+Bmoq+7m3hCboaqjTDnlO9p0ziG1/niww0NrOl
x1PZvfebdS1D5YK/+C2Zh5pRaRAm9SoSAc4Ww+E727bCYfjlKkUOaFs+1riup+ITpeWNymxrco+E
Y1l+ZKxLedRWayctQ2XGuLw+DZ/AyoX27nsuCMAZqtop4XRg5S88xLq6dXgf35CEz8s/+0SM6iFD
Y+wpfwfFq/MDjmcdJZhhq4XhGpeCPY2fLD6rscWI0UiwK+MJjci2+N2JaP8Fa3aBbNFwyNdAVyMY
zH+plGCoUXh5FMQFBfH6hksBqWqEM/EIDSMJOtZ4w7IA5UYNfTS8mswNFUjrKsD5YLxRouQ0ZuC5
amyOSM+Lnwz64mFmOvgrTZnC/wuaNE5PfLLaxEzYeGAc8TeAIGSNUjZqTSDPzaY7U0axyw+5cjxB
Na/rS7gZixOat6cNnAD+VUW+7wv0tHZy5qjJ7c+MIUvGPbGUXPI480jDRh4dKIm+eqCgwK1VyboT
lUE=
=wAyi
-----END PGP SIGNATURE-----

--------------6f7wbVq9JmK1kz0COMtPEzd0--
