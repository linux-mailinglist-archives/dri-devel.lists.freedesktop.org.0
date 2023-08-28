Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129F78A827
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585110E250;
	Mon, 28 Aug 2023 08:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994C10E250
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AD3821B1B;
 Mon, 28 Aug 2023 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693212680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YS8e1L8fy8R+sqnpecFZuJkMlDaGs4krtp7hLbupfhU=;
 b=NGdBZbIVbLoDS1hdYNZ4txHl5sQMhDEj/CIY7pV9LRNv6BJTAER97LTge1U7QpkmXtRq4V
 UsOvu/ZLoAXfLmFiXREoy5pdZlyzQlccCQcDwurzUPp/z1+4Oubxd/CeWbgxyEfdLuRMee
 80JpQbRYFuRhpw1ZtuUnGtHeq0cfoFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693212680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YS8e1L8fy8R+sqnpecFZuJkMlDaGs4krtp7hLbupfhU=;
 b=yCmaCWLpzpXD1boOA3nxaat3edYySBThLzegU2aJgd5ZcPzQ5lU1+mnAwM+yk18J+Nhj9A
 xQ2GRIyoC2DphqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E855F13A11;
 Mon, 28 Aug 2023 08:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id no2tNwdg7GT7fAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 08:51:19 +0000
Message-ID: <b439219a-037a-5641-de9d-adf5eca363ff@suse.de>
Date: Mon, 28 Aug 2023 10:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230806120926.5368-1-tzimmermann@suse.de>
 <20230807171101.GB281773@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230807171101.GB281773@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0NZ0NHtVPQWE2ThqtYmgtPGF"
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0NZ0NHtVPQWE2ThqtYmgtPGF
Content-Type: multipart/mixed; boundary="------------UIgAg7MKP0T1ayQXZWd9iPlo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
 davem@davemloft.net
Message-ID: <b439219a-037a-5641-de9d-adf5eca363ff@suse.de>
Subject: Re: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
References: <20230806120926.5368-1-tzimmermann@suse.de>
 <20230807171101.GB281773@ravnborg.org>
In-Reply-To: <20230807171101.GB281773@ravnborg.org>

--------------UIgAg7MKP0T1ayQXZWd9iPlo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDA3LjA4LjIzIHVtIDE5OjExIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
Li4uDQo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQoN
CkkgY29tcGxldGVseSBtaXNzZWQgeW91ciByZXZpZXcuIFRoYW5rcyBhIGxvdC4gSSd2ZSBu
b3cgcHVzaGVkIHRoZSANCnBhdGNoZXMgdG8gZHJtLW1pc2MtbmV4dC4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gCVNhbQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------UIgAg7MKP0T1ayQXZWd9iPlo--

--------------0NZ0NHtVPQWE2ThqtYmgtPGF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTsYAcFAwAAAAAACgkQlh/E3EQov+Bu
Ig//Y4T+G5nfOjVSa9mGMYv222Anwt0XOZxngCo/HW9T9OdO0Xua/RfzsoTK8zmKaSaCDMPfEeGy
IhGA+FZ0SOZ00JQkWRpWFRiwDVKeAGERwEx5fedthnkk7xG81eGiAzupVumZTjA/s6CAmnZ4yrzJ
+8muTcRM4c/BsxhCqz+/+NzYP5BcGEL9Pv9N+UvipP1V9MSKO75qSTCbR22wA3dT2N1c65mkT86w
tkJDtKl/MErB8d3iqTQnoP+xH9yBM/zvFNWtoDBYflyjiekZt6qiFuTb4Mw0/OdxcxMrZpsKGSkV
DOJn+NjbgEGDCn9dRPiigU6ZMWyV9j2qMz2wSoN4jG3EWw2i/kCN8s1xQLeDYJR8u89o4ms8Si2p
GO/mLERAF5eqiEk+ixVHjANbDdw+063iaHRO2Lh3DUL1AUx59F6oi08FNXxoo6VnVRBNXEpEKydU
75+Qvwad4RaJn27Cwl+UHY06bBiTDPYZJCfGsQkI4BWUhXNM7kt7+le9F519pJPdpot9hEPAUVfh
pv73GUupfgKU03PRUXmtDnuHHLgoMtd6xI8t4ML3Q/fEt5cp9ENLhEfOq7sqsByxo7lNokeREfCC
6pDYWqXlSzVbl0mTTb95BsOGz6AV1oDz85mUE6UBn7M21xFtS4D+uu98nfYfbtJvvNZBlqbDZ6a8
Qgs=
=xy4u
-----END PGP SIGNATURE-----

--------------0NZ0NHtVPQWE2ThqtYmgtPGF--
