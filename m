Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F6A72390C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532BD10E29D;
	Tue,  6 Jun 2023 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C044A10E29D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:31:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DA3C1FD63;
 Tue,  6 Jun 2023 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686036661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twXg+xyPG+lFoBJfTJBbRoTGex3dFvbzYd1BOEBBbR0=;
 b=hn+sJi66uFdpd6d4dGAqKmUQ5hUg5nCynSvqhwWr63V9TOLZqimn8OAR/maw/uDCf7Zuxv
 NhXO9n+MwwzE1/9W+j1nrfTMKVC+ctn1h0mTSXxi4dDUPhsPD68SaDKADX/XXmujQgt9Yx
 6/BD58ZYPTjLpYiP1nrM3FTWnFFHvVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686036661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twXg+xyPG+lFoBJfTJBbRoTGex3dFvbzYd1BOEBBbR0=;
 b=m58fLFo2ZLZrH/wtmMDe/DrVTUcNOXjKCuG9HvAUTSJQhDAX2JiywT7JqhkBiythOiqEHY
 fCuCqQ2oWnuFykCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FBC713519;
 Tue,  6 Jun 2023 07:31:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VCR4JbTgfmTLDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 07:31:00 +0000
Message-ID: <2270e585-0b5b-a897-9df6-74a02797062d@suse.de>
Date: Tue, 6 Jun 2023 09:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
 <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UviwDrStIna7qOwTGESVTtQV"
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
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UviwDrStIna7qOwTGESVTtQV
Content-Type: multipart/mixed; boundary="------------AchDYbqhnEBCIJe4SJSB6T0V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Message-ID: <2270e585-0b5b-a897-9df6-74a02797062d@suse.de>
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
 <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
In-Reply-To: <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>

--------------AchDYbqhnEBCIJe4SJSB6T0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDYuMjMgdW0gMDc6Mjggc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBNb24sIEp1biAwNSwgMjAyMyBhdCAwNDo0ODowMFBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IFVzZSB0aGUgaGFyZHdhcmUgZGV2aWNlIGluIHN0cnVjdCBmYl9p
bmZvLmRldmljZSBhcyBwYXJlbnQgb2YgdGhlDQo+PiBiYWNrbGlnaHQgZGV2aWNlLiBBbGln
bnMgdGhlIGRyaXZlciB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlYmFzZQ0KPj4gYW5kIHBy
ZXBhcmVzIGZiZGV2IGZvciBtYWtpbmcgc3RydWN0IGZiX2luZm8uZGV2IG9wdGlvbmFsLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPj4gQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hp
bmcub3JnPg0KPiANCj4gWW91IGxlZnQgb3V0IHRoZSBDYzoNCg0KSW5kZWVkLCB0aGFua3Mg
Zm9yIHJldmlld2luZy4gSG93ZXZlciBJIGRvbid0IHJlbWVtYmVyIHRoYXQgY2hlY2twYXRj
aCANCndhcm5lZCBhYm91dCBpdC4gSXQncyBteSBpbXByZXNzaW9uIHRoYXQgaXQgc2hvdWxk
IGhhdmUuIDovDQoNCkJlc3QgcmVnYXJkcw0KDQo+IA0KPiByZWdhcmRzLA0KPiBkYW4gY2Fy
cGVudGVyDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------AchDYbqhnEBCIJe4SJSB6T0V--

--------------UviwDrStIna7qOwTGESVTtQV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR+4LMFAwAAAAAACgkQlh/E3EQov+Bf
ww//Wo7qmEIekc4cDjguGj389can37uH/UiPpiuNTVeSDfaa1sIdh/At/5QRAnmyWgb92VENaRTF
+Ar7dKuRvqsrSKR74zQ3eVpephSsk7MnAr9TJnRR+7NqDQs2xaWFVIK6HhdD8Gs8Ybl/N7/0qb5+
56u48u48+Xrx2Cd1/4/WNdD/Ry5poUbS42TdZOBvmpSjZLHzPFG9d3nEwLeKYMB7AWPpQ5SBlsXL
hrgT72YdcWEE3IQFjsj1UKv5QW+8vtvrFUxdQ5dtDEJQi4MAZVPgP3GvIwR0GTeM2Wn2NKt6kTrU
EXG8WJgGPm47t+QxRDt+jSJVhubyx+tUOMTncdRoqBbg4Z06HbB59WRSX5G8DQJtmAl9uLl6fYiC
A02J8/eJAAboIS/Lag4ShRmhk8qQOqmOObdphp19VQ4rOElUpYhFwRXu0jLOyZBYf1+tCNgsAxjK
N08BCBbcJa0w0mg1jz+68AiPnxvkETtSF90A1I8lVEMrQ8k0TGGTqKuBBsaCNrLLDBtJlherJPq8
Hgwn5Hb4fupuaTZX8it0A++iG4vNKssNraAlJOEqCGiMQQcub7Ufib3BzIFnfg9kpoYhnJqnTtf0
/sNijj7jO4guJQl96xuDk2jdVdiWqJkAKtvBOE+byJY7gRIcKSMnxlcgSsoUbs1MJKKIJhGtPcb5
bKw=
=aAIv
-----END PGP SIGNATURE-----

--------------UviwDrStIna7qOwTGESVTtQV--
