Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E36725EFF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 14:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72A110E4E2;
	Wed,  7 Jun 2023 12:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B7C10E4E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 12:21:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67249218B8;
 Wed,  7 Jun 2023 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686140507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ta2FRAbQj0UwuOoAp0yjJ66hb4vAKW3txPGg2Eqa/ls=;
 b=J/il2DV+GzNOLLIrsNjkeK2yO6zhHV1LqiURxOr63dIyG/NiMamaLNk+kPxwOy5NgQRG8s
 yTwchZBE8UBHQtTgXr1/Q9y9PsoDYzzxivwcgAYmy1s/FuepZ1/McbnxAnpaRtG1I5JF5a
 6OTPXe+jNemR936GMPghkUvQXP3ivvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686140507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ta2FRAbQj0UwuOoAp0yjJ66hb4vAKW3txPGg2Eqa/ls=;
 b=qwEx/5STfYKT3dNkZTXOoEkepTtUZxat+Ty2hciE7ZXt4+PcgqCN6KYkP+4UPraz5myCHp
 bwaDYDlB9klcKwAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27AAC13776;
 Wed,  7 Jun 2023 12:21:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bWDpCFt2gGQBQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jun 2023 12:21:47 +0000
Message-ID: <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Date: Wed, 7 Jun 2023 14:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FW1FeVQdL1giSXp8BKAshSuA"
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FW1FeVQdL1giSXp8BKAshSuA
Content-Type: multipart/mixed; boundary="------------7Epbi9PEVe6pPjkkKh0YiBGj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, Daniel Thompson <daniel.thompson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
In-Reply-To: <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>

--------------7Epbi9PEVe6pPjkkKh0YiBGj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjA2LjIzIHVtIDE0OjA2IHNjaHJpZWIgTWFya3VzIEVsZnJpbmc6DQo+PiBN
b2Rlcm4gTGludXggZGlzdHJvYnV0aW9ucyBoYXZlIGFkb3B0ZWQgRFJNIGRyaXZlcnMgZm9y
IGdyYXBoaWNzDQo+PiBvdXRwdXQgYW5kIHVzZSBmYmRldiBvbmx5IGZvciB0aGUga2VybmVs
J3MgZnJhbWVidWZmZXIgY29uc29sZS4NCj4gDQo+IFdvdWxkIHlvdSBsaWtlIHRvIGF2b2lk
IGEgdHlwbyBpbiBzdWJzZXF1ZW50IGNvdmVyIGxldHRlcnM/DQoNCkhhISBJdCBzYXlzICdk
aXN0cm9idXRpb25zJy4NCg0KPiANCj4gUmVnYXJkcywNCj4gTWFya3VzDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------7Epbi9PEVe6pPjkkKh0YiBGj--

--------------FW1FeVQdL1giSXp8BKAshSuA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSAdloFAwAAAAAACgkQlh/E3EQov+CX
jg/9FNBf8ZoZQO+eosw1vBEZ9nuaT0FLZyWHr9yNEU33bOLCa5mmAi3B1TRjYwdSk7shlRf73twX
YRuSuMrW/2ODEiN2DVkaf8jSOCbZgZxcPHYZRJiHKThM7ApQxlRSZ+mjD3QPNpWwp8x0LumHcN+V
dYjdR0/LZCp47I5sIsIr6BUP67GEqaBjy2UY1SKdAKIhlAlD4YJmPwrC/bJ+HZCBkDFuaimu4qAV
YkKXc2qIXo7wLgFCKW10q/Jgk6Duph4BrHK/ypbZd/5Tgeb+NgV9gq6L9QQzOpIzKFO42zYoSWXl
stDmdBcxM+cdcLW0b4b+veBIRI44YJUt/0vv//SliYQw8wGUHqDKM1zSckdqVYdL9MqZWXlBUIjH
3yUrOmdyjhnoFdY+PjgqmP2mX8I/uYgQjPXWYDyhI8tWxMIgjyFZtlT2tGO6B0PktrBfLv/5lqTO
qei+gMMJydV0ceV8M0usD1SVEdkFeR4/CtjHxotSfj670KWWRczIP78PxWoW/OWMWEatidEv14z2
+czkANOTrdRickPxEjBxaPYTnZcZQE8yGsdW6ufhnsQdcT/Uv1LN55509+C2QMHVwDng70u60Gdx
AYKRWTZKRXfvjHmOD3GmgT3M4ZMR9kg4LMdB79fPEa3jyq4o2Im13Jt5ylFPIz/NLf9qY366H6yp
z9Y=
=GLVN
-----END PGP SIGNATURE-----

--------------FW1FeVQdL1giSXp8BKAshSuA--
