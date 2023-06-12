Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9172BFAD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5F10E1F1;
	Mon, 12 Jun 2023 10:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FCF10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:46:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8BA8201A7;
 Mon, 12 Jun 2023 10:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686566780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XKUVIMDVJIG/UmtUdhol+jEC2QYZC04MyRqvdtB1JVM=;
 b=mUlrG4hRnU0/QybWitK+0wlKfNS01dhUAVUNYgeZAGc3Fqj9eRVSsqlhgnpQnYaONx9YOc
 UKkbJxD90h+pyvkkC1ikuZQNdsTOOi0RS6AlvYn8jnzUqqA8IsPUS6q80+hVf3ua+i6hYU
 Mj76FfYbtV9IuW/oDYt/y6TA1oUyFLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686566780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XKUVIMDVJIG/UmtUdhol+jEC2QYZC04MyRqvdtB1JVM=;
 b=GBbfEnJnmmcciQRJOOmEcK348eL7HTUX2HvbFuAjVyBJZKPGdRomAmGyqW7SuuAENDq+Ch
 iorIfZMHUaJ+npBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A66CD138EC;
 Mon, 12 Jun 2023 10:46:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DUybJ3z3hmSiMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 10:46:20 +0000
Message-ID: <7b73550c-3e8d-6cb3-ace7-49cc405f8086@suse.de>
Date: Mon, 12 Jun 2023 12:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jczAnVEPWIiygzYqzfIvFYvB"
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jczAnVEPWIiygzYqzfIvFYvB
Content-Type: multipart/mixed; boundary="------------ied9YunLYcXBK5a4s7zjJrSU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
Message-ID: <7b73550c-3e8d-6cb3-ace7-49cc405f8086@suse.de>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
In-Reply-To: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>

--------------ied9YunLYcXBK5a4s7zjJrSU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDYuMjMgdW0gMTA6MzUgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQpbLi4uXQ0KPiANCj4gQlRXLCBJIGFtIHdvbmRlcmluZyBpZiBpdCB3b3VsZCBiZSBwb3Nz
aWJsZSB0byB3cml0ZSBhIERSTSBlbXVsYXRpb24NCj4gbGF5ZXIgb24gdG9wIG9mIChiYXNp
YywgZS5nLiBubyBNTUlPLCBqdXN0IGZiKSBmYmRldj8NCg0KVGhhdCBleGlzdHMsIHNvcnQg
b2YuICBJIGZpcnN0IHBvc3RlZCBpdCBoZXJlOg0KDQogICBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NTY5Lw0KDQphbmQgaXQgaGFzIGxhdGVyIGJlZW4g
dHJhbnNmb3JtZWQgaW50byB0aGVzZSBjb252ZXJzaW9uIGhlbHBlcnMgdGhhdCBJIA0KaGF2
ZSBzb21ld2hlcmUgb24gZ2l0bGFiLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------ied9YunLYcXBK5a4s7zjJrSU--

--------------jczAnVEPWIiygzYqzfIvFYvB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSG93sFAwAAAAAACgkQlh/E3EQov+Dg
hg//UQNYjBQLz502Rz811LBrAJFzZAtFe6BeN9TBDTKqkScQQY5g4UU4wCzy5vq3t82Vg7cgtjxc
che0ZWmH3fhLR+b/F2zlEzMecgFSGTXXa860DKC87Vkdj5gvRjOvIi9MPi5Tfzw+C9kFHXybkhHv
sdxnuXEqAy4Qz0+8yucEsBYrAT2RCSnhbL/xC4NLIB1Srw/9NpzicbrjXSo8mKPeXCB5bE+sjptY
T+H0BOsVdnJhzwmsvrKYKJe2UiWdr5jawXSWm9gR01QP/DgHmhLYYMVoeHrwwfTHTu0RWxi9G6YS
f0jH0fDqfDe4n26cIhXKM3lcm3NVZQczgphJdty9rHdEzKVE1A89t/udc8xLMyEKDtXbJijme4ud
5yzUTNK0ju3WyF5+oA6Bnu0ti8DOuWEREIrs7Gv9e09+j53+peOQUfLjl77031/vF1dWaG8WBTPz
yxNt4fHhW4/lzLdTW7rGg9Aec9805fGYpphcUcVXMVxIHt+R4KtlCFBz+NUL9B9pKCwKZNXajLSh
TYNziiXe0kdt7oDvYMvOri+5ZzH9Ngv+aIfKlrEgeOQLnEo6gjVTo9VrIXN5yv9bFKf61QBrps0X
zUaC4hw+uqcAfZveNj+u2QdrGtQp9hBI/g7EFFiCPBVcNFFCTDVPZwJdAWdcL5wlwTJrR9+zqUlg
h1Y=
=SNdA
-----END PGP SIGNATURE-----

--------------jczAnVEPWIiygzYqzfIvFYvB--
