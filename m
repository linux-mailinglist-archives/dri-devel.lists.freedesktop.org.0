Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377BE46BC0E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 14:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7635DEB6B8;
	Tue,  7 Dec 2021 13:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE9FEB6B3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 13:00:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27FA81FDFE;
 Tue,  7 Dec 2021 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638882016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+C8znulBKfN2iqCnpcXwfq/A/cdrkCZr52J26lpfUyA=;
 b=IZtx9SM9+SakYOsz8jBa0MNR9U65fWq6gRkSLmuQpgRuufpCzLia6gclbZBIuVRO7xKKXJ
 hluXHKYGlGQ/tw8Ts25/ZPXS2ZygLu+3AE9y2hTzw86NTzsDHYb7b0r6fZzviioo/M0Eyq
 3oqtPjqI30NIbPjjWQwSrH6/QA2J3xY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638882016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+C8znulBKfN2iqCnpcXwfq/A/cdrkCZr52J26lpfUyA=;
 b=I7Oay/eG0I6BpwMaEtiqsJPDP0GaIB4GSFJLafQY0bcwh2UoKPh5v0UdaEVy4vSgiPpRDI
 U3jvTYQPcwxIoDBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFDAA13A78;
 Tue,  7 Dec 2021 13:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dOw6Nd9ar2GaPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 13:00:15 +0000
Message-ID: <26f988d4-3fac-fcc0-f80a-c9d7516c266b@suse.de>
Date: Tue, 7 Dec 2021 14:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/rockchip: use generic fbdev setup
Content-Language: en-US
To: John Keeping <john@metanate.com>
References: <20211029115014.264084-1-john@metanate.com>
 <ab7ace79-0148-1efa-ec17-6994bb35fd2f@suse.de> <YX01C6l93I2YPgku@donbot>
 <6e69f9bb-5a1e-7b79-38e8-d2860e5ee615@suse.de>
 <20211101113415.3bed0f62.john@metanate.com> <Ya9LdiutXV7lCOtT@donbot>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Ya9LdiutXV7lCOtT@donbot>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UbAOQXuN5ozF4VxDiNVJF0Ed"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UbAOQXuN5ozF4VxDiNVJF0Ed
Content-Type: multipart/mixed; boundary="------------GufJmFGkh9XtWaqveMIfvlqc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Keeping <john@metanate.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-ID: <26f988d4-3fac-fcc0-f80a-c9d7516c266b@suse.de>
Subject: Re: [PATCH] drm/rockchip: use generic fbdev setup
References: <20211029115014.264084-1-john@metanate.com>
 <ab7ace79-0148-1efa-ec17-6994bb35fd2f@suse.de> <YX01C6l93I2YPgku@donbot>
 <6e69f9bb-5a1e-7b79-38e8-d2860e5ee615@suse.de>
 <20211101113415.3bed0f62.john@metanate.com> <Ya9LdiutXV7lCOtT@donbot>
In-Reply-To: <Ya9LdiutXV7lCOtT@donbot>

--------------GufJmFGkh9XtWaqveMIfvlqc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMTI6NTQgc2NocmllYiBKb2huIEtlZXBpbmc6DQo+IA0K
PiBBcmUgeW91IGFibGUgdG8gcGljayB0aGlzIHVwIChhbmQgWzFdKT8gIE90aGVyd2lzZSB3
aGF0IGlzIG5lZWRlZCBoZXJlDQo+IGFuZCB3aG8gc2hvdWxkIHBpY2sgdGhpcyB1cD8NCj4g
DQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTExMDExMTQ2
MjIuODEzNTM2LTEtam9obkBtZXRhbmF0ZS5jb20vDQo+IA0KDQpJIGFkZGVkIGJvdGggcGF0
Y2hlcyB0byBkcm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------GufJmFGkh9XtWaqveMIfvlqc--

--------------UbAOQXuN5ozF4VxDiNVJF0Ed
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvWt8FAwAAAAAACgkQlh/E3EQov+Cw
Kw/9HsNOGnt0zzCJ/bfdMgu2znBHFFGK6kl9x24z0DjOoWvjlMKWpUfILBnjeJkAf+uqRpI7MOul
oqbt7rHnWPu64tGdqUcFJ0Ta9oiWJg4ow0mSOOUWjStO2LmC4uIGQdjJYtUdoXcghlnnBCICqkLY
bxWZOh1UfXEU59rjSu+ZyY3Eo51ANVdLU8mNwWqEiCNdjN6Uxo27052qkfbgRYQnQQIuLpUoJGg9
ZIB3yS+Jf3uqVYxh8vJs50kW4/4xUWIl8Ye77275AoC8wT5kr7BRcIv6/rqMtr5FmR4yaG8qYm6H
7XTJrb9EzLeSy5To8MY0Z190228alxkhBdT3Qq8BvjlWEIrrU6nRSDdtBiYMRxy5S/fzmDZ/jXhK
wQgys58+1PutAgXPx48H3XbO3NugNwvB4GV697ZIgu+AtSZCbh5RQ7X30hC2zNxbZirYpZ4m/S67
v60uKzWvxKW1YIbsi4Xc5+gJcu6uvJ92BZ+8lpjOlMDx4ajB2u+IsFIvTmv1/p8kbysRaGcjq6dP
rteItmAddk/DTbSz0tLbGr6U9OCgUOrbGXB78Zh/iF3d5V00D0Ct5XQyPGQpaOu+HgnLNWHrkewg
0d77NHE9OZWtp4i3KbuTjTYMtaDTPOe5hMfLkspB3j+TayoukB5+K5gTvIydiWub3ZS5mlHdteGE
ukc=
=exws
-----END PGP SIGNATURE-----

--------------UbAOQXuN5ozF4VxDiNVJF0Ed--
