Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC01686377
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446D310E3E5;
	Wed,  1 Feb 2023 10:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF4610E3E5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:10:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9D0922B44
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675246231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=9fWHKHPLyZDWf68//aV2XB1sWLNyY+I6tI0stfvBNBM=;
 b=lPbcGtsEyeG3NLf+mmjRD3di53DziNHOIJz2RTn1xKL4OXy/OZYyvsAl0O4q+GDfEasUyk
 6hHDiW+p+FZUcicbQV5dxGtEPxYVOoD0JmsK0njLW++zaYDVaksQrKD9Cg9X2TCLhBn23s
 THd0KC1YCsetnbUDF4KkSxQXQh9VV94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675246231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=9fWHKHPLyZDWf68//aV2XB1sWLNyY+I6tI0stfvBNBM=;
 b=M4NxGMZ/SEVOZixe1cdt+cBsdvsDHzkCrG6QeDh+mzO4cNI57I86nDxZlCshj5hd0ovjXd
 2BwH2VcnfpXyuvAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCCAE1348C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id etgFNZc62mOcdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 10:10:31 +0000
Message-ID: <4772c466-4e2e-c4cd-bf72-b438dedac8f6@suse.de>
Date: Wed, 1 Feb 2023 11:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is open
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------70jb7Oc0NoIC1ktCX6cl4Zts"
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
--------------70jb7Oc0NoIC1ktCX6cl4Zts
Content-Type: multipart/mixed; boundary="------------FuJmCTrO1bfqupYsVQrtPoXK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <4772c466-4e2e-c4cd-bf72-b438dedac8f6@suse.de>
Subject: PSA: drm-misc-next-fixes is open

--------------FuJmCTrO1bfqupYsVQrtPoXK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoZSBlbWFpbCBnb2VzIG91dCBhIGJpdCBsYXRlLCBhcyAtcmM2IGhhcyBhbHJl
YWR5IGJlZW4gdGFnZ2VkIGZvciBhIGZldyANCmRheXMuIFRoaXMgbWVhbnMgdGhhdCBkcm0t
bWlzYy1uZXh0LWZpeGVzIGlzIG5vdyBvcGVuIGZvciBidWcgZml4ZXMsIGFzIA0KZHJtLW5l
eHQgaXMgaW4gZmVhdHVyZSBmcmVlemUgdW50aWwgdGhlIG5leHQgLXJjMSBjb21lcyBvdXQu
DQoNClNvbWUgcnVsZXMgb2YgdGh1bWIgb24gd2hlcmUgdG8gbGFuZCB5b3VyIHBhdGNoOg0K
DQogICAgKiBpZiB5b3VyIHBhdGNoIGZpeGVzIGEgYnVnIGluIHVwc3RyZWFtLCBwbGVhc2Ug
cHV0IGl0IGludG8gDQpkcm0tbWlzYy1maXhlcywNCg0KICAgICogaWYgeW91ciBwYXRjaCBm
aXhlcyBhIGJ1ZyBpbiBkcm0tbmV4dCwgcGxlYXNlIHB1dCBpdCBpbnRvIA0KZHJtLW1pc2Mt
bmV4dC1maXhlcywNCg0KICAgICogYW55dGhpbmcgZWxzZSwgZXNwZWNpYWxseSBuZXcgZmVh
dHVyZXMsIHNob3VsZCBnbyBpbnRvIGRybS1taXNjLW5leHQuDQoNClRoZSBmbG93IGNoYXJ0
IGlzIGF0IFsxXS4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90byBkcm0tbWlzYy1maXhlcy1u
ZXh0IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQp0aGF0IGFyZSBhcHBsaWVkIHRv
IHRoZSB3cm9uZyB0cmVlIGFuZCBnZXQgc3R1Y2sgdGhlcmUgZm9yIGEgbG9uZyB0aW1lLiAN
CklmIHlvdSBoYXZlIGZpeGVzIGluIGRybS1taXNjLW5leHQgdGhhdCBtdXN0IGdvIGludG8g
ZHJtLW5leHQgc29vbiwgDQpwbGVhc2UgY2hlcnJ5LXBpY2sgdGhlbSBpbnRvIGRybS1taXNj
LW5leHQtZml4ZXMuIFdlIGhhdmUNCg0KICAgIGRpbSBjaGVycnktcGljaw0KDQp0byBoZWxw
IHlvdSB3aXRoIHRoYXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBz
Oi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRl
ci1kcm0tbWlzYy5odG1sI3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------FuJmCTrO1bfqupYsVQrtPoXK--

--------------70jb7Oc0NoIC1ktCX6cl4Zts
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaOpcFAwAAAAAACgkQlh/E3EQov+Df
dg//Up5uFnpDMlL41t+kQ+U357Q//aAgyg2e3vzn28dorCRLhuayIp3cmat49uLfK13lveRRej8b
0G4GUSgXE+MtqH4xGFBodxvjoFCR3a4waFUvIeCV8ZyEp8FqkA8u30BL61ZialsvPrWK7sP/iAiB
fOWEX+BMxfzfEd+Xm0RN3Hc1UCicY3AF9pqqQCAOgoFQqcmIXMgi8NvcaoaooJ13cybRFP/mHNMf
/9VusTRjUsMDYfxyspy9HG3CtM0ckPnGLUhTpjCSs/8T73YOkYlTuMzCKzqZAkFeQ/eIy+dbLimp
L3X9h+GuIAQHDxIsKs2yQOV4zgrwnOjzUv2ivlonTP5EsPI7+wFf7+Al2J4F8b9ZFbgkj/WuIATo
Qox3dmyPv6PVmgabem60TanMiaexI7t0MJgXlHqpzV9jgDxKBBSTEATs5FZHhRdOkMmyZ3fYeCyl
ZHD8NTw5tE/TKPWgVxi3c1vhLXRhS/KEyvww6XXPOZG3m4P95uF3nc8SNFUOMkDWKeVg0MsMYwQA
9Q6xH12uyErDu0vnyn6eHmvSogfU48gAnLwXF7Ot1fgdLWnFSRiTmGH7FTyUu/Fhy4++PGHCen1p
Zvpaeu9jqey1jPMVRUU+4r2prjh1F+FSC9vzBMzD9enCmoAxwgeMRrP9kceiYtFtbGI0iMU/vAqn
3WA=
=2gcV
-----END PGP SIGNATURE-----

--------------70jb7Oc0NoIC1ktCX6cl4Zts--
