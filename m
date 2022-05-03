Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098EC517F55
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9568F10EBBC;
	Tue,  3 May 2022 08:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309EB10EB10
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 08:02:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 975A8210EA;
 Tue,  3 May 2022 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651564941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVdaUivsud/QCNs4hneCrlWLIes3QzeTiBxAQZbxcv8=;
 b=qmjxNnYEeDlx7klMOWbLYNWFETOHHZIvTv69D65i2Nz3nBrbFbtEQvhjWZ4rIDhwRHa17b
 Y2HN3l6fFKZBsXENeOJxenAEeZKMB/gAD/LQupnFMnMBELzCOGOdIEc2QJkCI6Il93YZlk
 mHoKCU0tzmB0rmZH4bHrPUB51Qw21wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651564941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVdaUivsud/QCNs4hneCrlWLIes3QzeTiBxAQZbxcv8=;
 b=1RIA5cPIBvD5iEPgZH+8XMhUAlbauNHQPxVo8WraaeYYAdvct1NxshHRz26DGS4RowmowS
 lu3qOH508gZwbGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F98413ABE;
 Tue,  3 May 2022 08:02:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DyxHDY3hcGLGLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 May 2022 08:02:21 +0000
Message-ID: <36cf700e-2949-fb1f-1de0-46a4dc8e1cf4@suse.de>
Date: Tue, 3 May 2022 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] drm/format-helper: Implement drm_fb_swab() with
 per-line helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-2-tzimmermann@suse.de>
 <e1324acb-7f0c-eff9-4c2b-f48de57b848c@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e1324acb-7f0c-eff9-4c2b-f48de57b848c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ptZk60PFuuUTepo2LYiAV0JI"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ptZk60PFuuUTepo2LYiAV0JI
Content-Type: multipart/mixed; boundary="------------QjwOW0050CVy6bqCAr1Y9dc5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <36cf700e-2949-fb1f-1de0-46a4dc8e1cf4@suse.de>
Subject: Re: [PATCH 1/4] drm/format-helper: Implement drm_fb_swab() with
 per-line helpers
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-2-tzimmermann@suse.de>
 <e1324acb-7f0c-eff9-4c2b-f48de57b848c@redhat.com>
In-Reply-To: <e1324acb-7f0c-eff9-4c2b-f48de57b848c@redhat.com>

--------------QjwOW0050CVy6bqCAr1Y9dc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDUuMjIgdW0gMDk6NDggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDQvMjcvMjIgMTY6MTQsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVwbGFjZSB0aGUgaW5uZXIgbG9vcCBvZiBkcm1f
ZmJfc3dhYigpIHdpdGggaGVscGVyIGZ1bmN0aW9ucyB0aGF0DQo+PiBzd2FwIHRoZSBieXRl
cyBpbiBlYWNoIHBpeGVsLiBUaGlzIHdpbGwgYWxsb3cgdG8gc2hhcmUgdGhlIG91dGVyDQo+
PiBsb29wIHdpdGggb3RoZXIgY29udmVyc2lvbiBoZWxwZXJzLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0t
DQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJt
QHJlZGhhdC5jb20+DQo+IA0KPiBJJ3ZlIGEgbWV0YSBxdWVzdGlvbiB0aG91Z2guDQo+IA0K
PiBTb21ldGhpbmcgdGhhdCBJIG5ldmVyIGZ1bGx5IHVuZGVyc3Rvb2QgaW4gdGhlIGNvbnZl
cnNpb24gaGVscGVycyBpcyBpZiB0aGVyZQ0KPiBpcyBzb21lIGNvbnZlbnRpb24gYWJvdXQg
dGhlIG5hbWUgb2YgdGhlIHBhcmFtZXRlcnMuIFNpbmNlIGl0IHNlZW1zIHRoYXQgaW4NCj4g
c29tZSBwbGFjZXMgd2UgdXNlIGRidWYsIHNidWYgYnV0IGluIG90aGVycyB3ZSB1c2Ugc3Jj
IGFuZCBkc3QsIGFuZCBzbyBmb3J0aC4NCj4gDQo+IElmIGlzIGp1c3QgdGhhdCB0aGUgbmFt
aW5nIGhhdmVuJ3QgYmVlbiB1c2VkIGNvbnNpc3RlbnRseSwgbWF5YmUgdGhpcyByZXdvcmsN
Cj4gKG9yIGEgZm9sbG93LXVwKSBjb3VsZCBiZSBhbiBvcHBvcnR1bml0eSB0byBhZGQgY29u
c2lzdGVuY3kgaW4gdGhhdCByZWdhcmQuDQoNCkl0J3MganVzdCBpbmNvbnNpc3RlbnQuIEkg
dHJ5IHRvIHVzZSBkYnVmIGFuZCBzYnVmIGlmIHBvc3NpYmxlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------QjwOW0050CVy6bqCAr1Y9dc5--

--------------ptZk60PFuuUTepo2LYiAV0JI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJw4YwFAwAAAAAACgkQlh/E3EQov+AM
HBAAl6VeFfk/2ZhGugWG/8Co9ptRy5a7/I86QpMVjs5ZKNlE97M4zwi4L/p7xUnQlWMrGkDSsQH3
kc/oKs/IKy8clzIlrWtJ1V68EZG8pzx7hnAlAr5+9y00h2xf6y2Ylf182JuZf2JqigfhJNPlmHPr
RJOUxbgZ72v4vrIEyPkHSM1w0V3vk4FT9eIVgZ8mLk/4/5UpolszZdYJTWYu4FZ66sawZoOu+H6G
phdeiXyIprhNf/TIrkrjiGhp9Bg2TttlrXxS7vyJ1Uf6jRvqxhKARsKvglk1QslIwsmYEWylA35c
INvVw6BAn4mbJltEUVY9d8uo4viP2BJKhasfCX9cYFN3sUxhPYU+9MZF4gz2xwPJ9UptUBxsfE+S
riV8UWHuXVODa1VX7gPQPdOtoaYt5r7CAeJe312MiT/XheiD/1T1FiXGBbADQG253KD8XY4S3CJK
/RCev2kJDzSn6hoycXMZXFffM+PRHnjqVV4yUPuM9fUcHQP4ghn6rWA26MF+TFgQ0WHNIsNoxMFV
OFUDazX8y/ThMI58bjL0y88jYTtQExpv7KSBzW9nAKe5H6gg/2PnfinVp0lNvkkPSjkg0mYFxyRV
s9e0XwkTVdDOFa5xeWQChgVTlU5VH0+L0wbBWwHILEZsuoYVa7+oKtXm/SA889r5sfUEEqlr7II4
b4s=
=tIxa
-----END PGP SIGNATURE-----

--------------ptZk60PFuuUTepo2LYiAV0JI--
