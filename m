Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6F50B308
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388110E095;
	Fri, 22 Apr 2022 08:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F372510E095
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:37:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F32361F37B;
 Fri, 22 Apr 2022 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650616623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37FEahUJdlj/gRtko9u06GxXpQ+C9ea4POpASYThvVc=;
 b=NL08b4nv7QRYOgshL/lT5Hr+yGTBl907pnBrzwLCrWbNjIX9/Mlutk0xBKZZgM+zlq7mtG
 TdsWUjfDuIQYK6yPu+qaZhLZUjSsYPHnFlwC0+VfjH5xmlCdF6zR4ws9KbFpg6qny3dfy+
 O9pPdrW8lpuFgZ4QkAGyGuL1CjLlIBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650616623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37FEahUJdlj/gRtko9u06GxXpQ+C9ea4POpASYThvVc=;
 b=aKs/qiuH3jQq+4fpPP7zC3AQI74PNUE3ANbXJksFFH/3rvn3qBFaHt2YsH5VsNkoy5b23G
 jTJPwvALkUcowlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAD74131BD;
 Fri, 22 Apr 2022 08:37:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x+F5MC5pYmJ7egAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Apr 2022 08:37:02 +0000
Message-ID: <9dca836a-bd84-d200-fc01-56e4d6f13eb9@suse.de>
Date: Fri, 22 Apr 2022 10:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: FG040346DSSWBG04 patch review
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>
References: <718e8029-b6a8-f221-156c-ac8ac84a8d77@denx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <718e8029-b6a8-f221-156c-ac8ac84a8d77@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NrPfFPfSvr3DBj0RsaF5lxBB"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NrPfFPfSvr3DBj0RsaF5lxBB
Content-Type: multipart/mixed; boundary="------------U1LK6UvtyE9CY9q0uynQ3fYC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <9dca836a-bd84-d200-fc01-56e4d6f13eb9@suse.de>
Subject: Re: FG040346DSSWBG04 patch review
References: <718e8029-b6a8-f221-156c-ac8ac84a8d77@denx.de>
In-Reply-To: <718e8029-b6a8-f221-156c-ac8ac84a8d77@denx.de>

--------------U1LK6UvtyE9CY9q0uynQ3fYC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMjM6NTkgc2NocmllYiBNYXJlayBWYXN1dDoNCj4gSGVs
bG8gYWxsLA0KPiANCj4gY291bGQgZWl0aGVyIG9mIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sg
YXQgdGhlc2UgdHdvIHBhbmVsIHBhdGNoZXMgPw0KPiBJdCBpcyB5ZXQgYW5vdGhlciBEUEkg
cGFuZWwsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gZ2V0IHNvbWUgQUIvUkIgb24gaXQgDQo+IGJl
Zm9yZSBhcHBseWluZy4NCj4gDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC80ODIzMDYvDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC80ODIzMDcvDQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KZm9yIGJvdGggb2YgdGhlbS4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gVGhhbmsgeW91DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------U1LK6UvtyE9CY9q0uynQ3fYC--

--------------NrPfFPfSvr3DBj0RsaF5lxBB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJiaS4FAwAAAAAACgkQlh/E3EQov+Ci
XRAAgAEtaIDBQ/iWCFzwPXBQ2YCuGduh3dGF4DGnJzR/cNSY95RaTKJQFi2Z/doou6jqEvvckFQY
IwHzZGbt065qMD1OSST5Ewl0f/lYxjI7P7WYs5R9a7Is4Q34EVGs2t0c7GZcR2P2ndOKXKOUzSD+
fKaBHoqBNttp5foDyIs4/nqHn2RT5QhPmHKdMnKwvAykbyXEoO3h7EJjExriPSaqgEjidkk2/Thr
klhXu6bE2DjJmdjGLORMbsdV9V+9bJY438rLxv3jKQoAVkoKo2urtqVdM7qE+UMBN6WBGTmS05F4
L+9NTW7N8dVWSpXw0wl6S+PiKNVHBIfYw5a5hGI/Ju8Dn5722Tz9nzaPB/TGc9xqjPaSaYMN+jdZ
9syLGwbf+MCYCOirafxxn6MURWdxI9wNDZwYCgcP7ZeLudRYYTk4pbSD4hpEE0XQd7+ikRJveBzx
LIz19fKYFaLr8ACMiB1pd1Rj5qTaB+akpq3WSm1F5E/BhscH1lFAb/ZTmXaBMGyWiSi2sAvS/pMN
JqV6yptsKA6jQ7U3/QABlnI/WVnaM2MPOtkVA7VhjRmA5AZfhwQ6WcAljlABm+IyCbE3vwYsBYAg
+A2EMpjoETk+kARBNORP8BV9bEdfy+pfTmZ7gPLJPWM1p5ah9wsXPFIzDF1PlqsNuuuzeQVpOYv2
lJM=
=NrZy
-----END PGP SIGNATURE-----

--------------NrPfFPfSvr3DBj0RsaF5lxBB--
