Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33147333BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F510E64D;
	Fri, 16 Jun 2023 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2D110E65A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:37:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1203421BD7;
 Fri, 16 Jun 2023 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686926271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/pc5e01Az30d0Y7EOVtqX1ghgv8iymBCr4cTKd6NYVc=;
 b=pxiGv5A2Uk44sRbQW8ymLZStrLHP4hKSsy0fjcizLCRTrfOsJG0muZR3LEEx8hedi2Y12c
 UN/AmOPNHmjpHGLP/iSfI0oOSh599hdlydntQLyGKqzf04bxSwv3phpZ4hWZoW7Gyw4RhJ
 16UYf+QqbKlh7hTKgcFgoNPyizpCKl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686926271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/pc5e01Az30d0Y7EOVtqX1ghgv8iymBCr4cTKd6NYVc=;
 b=xbba1t2427WO4fkI830Ss7ilzxtJFad8dVD0KbNe0PbI0dCLW0VWSnO2LCR54TUdKusRHB
 iSViPIkRyVy1g7Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CDB71330B;
 Fri, 16 Jun 2023 14:37:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z3+tJL5zjGRFaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:37:50 +0000
Message-ID: <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
Date: Fri, 16 Jun 2023 16:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lee Jones <lee@kernel.org>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
 <20230614135157.GU3635807@google.com>
 <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
In-Reply-To: <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uqxf1PmsVcgGFzKAiF8s860m"
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
Cc: daniel.thompson@linaro.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, michael.j.ruhl@intel.com,
 stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uqxf1PmsVcgGFzKAiF8s860m
Content-Type: multipart/mixed; boundary="------------Kge1wVVwVTDuGXE1lqDWar4A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: daniel.thompson@linaro.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 michael.j.ruhl@intel.com, stable@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Message-ID: <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
 <20230614135157.GU3635807@google.com>
 <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
In-Reply-To: <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>

--------------Kge1wVVwVTDuGXE1lqDWar4A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTGVlDQoNCkFtIDE0LjA2LjIzIHVtIDE2OjEzIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1h
bm46DQpbLi4uXQ0KPj4gQ2FuIHRoZSBCYWNrbGlnaHQgcGF0Y2hlcyBiZSBhcHBsaWVkIHdp
dGhvdXQgdGhlIG90aGVycyBhbmQgdmlzYSB2ZXJzYT8NCj4gDQo+IFVuZm9ydHVuYXRlbHkg
bm90LiBUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIHJlcXVpcmVzIHRoZSBiYWNrbGlnaHQgcGF0
Y2hlcy4NCg0KQXJlIHlvdSBPSyB3aXRoIHRoZSBwYXRjaGVzIGdvaW5nIHRocm91Z2ggZHJt
Pw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhv
bWFzDQo+IA0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------Kge1wVVwVTDuGXE1lqDWar4A--

--------------uqxf1PmsVcgGFzKAiF8s860m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSMc70FAwAAAAAACgkQlh/E3EQov+AF
FxAAzH7H+UtNiH0YBxQX3fM2qFKzS4qSWBlg3K501Pyci6J+5eAgKYuhwGctklh9HKO9dmkB/Lpt
X0sRCnnRHSC2K6Ofu4hQOrRv2T51Yz17z9G69YDW0/iDtgkMev1WebyKSyJ2YxJXts5HJffY1hq6
dBToDogmi+X2RBHKVXDTyIqn0nYt9KAk4EjhmUbkQ4Kdp383yBGdJma0UykmQfznIhNQLNtw3fjv
TKPM2FzgxpR43x4aUDz12DxdEmsP+DA+6F3iECiW0LiRAvprHE3/9c7vkdhO4hz/NIZuNoGO/HTz
0TygMS9qSTpeB4+OR502PUp65ZrcK67SoSZ9v/WOntFeQ9zYe+L3rLyvt3/fkbOYWBKF9MgQ33mx
qrn4cFZSusXpUk4V2p+Ks+XfJP0YIalvFf1dATRQGZYhOYh0oGZPDc+G1EMjpO7uYxKxwE34HJ6i
zPxtr7lEF0tbvTbIfdF6pkyxK50km6SPWiKRqxn5Nts83C3aw/xAfbpcSeUNYiF5/XErJm5ZSniR
gwzNaQHAVLgND/Ui5Sh6iM0PpIbfbXRRG4uEpRsXFDE7ArGMQDUbTv6yweN9rQUppjOTUMp49jNM
hD3j/9H9RSWJZKGxXREFTvP9k2XW82h5450VmiWR4b/Jg386iUX+7jumgmVmf/WOKP+Q4+b8hAqF
Znk=
=2ezj
-----END PGP SIGNATURE-----

--------------uqxf1PmsVcgGFzKAiF8s860m--
