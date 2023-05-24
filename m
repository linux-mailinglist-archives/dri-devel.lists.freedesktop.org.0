Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94270F5D1
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE28E10E664;
	Wed, 24 May 2023 12:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30710E664
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 12:03:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDE172214D;
 Wed, 24 May 2023 12:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684929779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5xYZJ0VdlqE3V6heUq7XBrAWSEtAc4ezP/9YYY5cYs=;
 b=1QK0bFGIceIfQpuPdKPKuSsPxT9Rny41ebYp5RpcmAx1JMHsOniEOLNDBasQESs/UQTYHA
 YWl9h6yIpNKTjOo4Yw7kOlaVv9hxtBAID2odf2XvmStpakGDu99eWY+lyIeDTBxyqCS+qP
 75WnDvcF18Hr8dWc+milZsSnk80OKkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684929779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5xYZJ0VdlqE3V6heUq7XBrAWSEtAc4ezP/9YYY5cYs=;
 b=5/87DbykeY08SalUEIlDgeTsq15ohzj0Zvuh2kUddnAb0qKrnIG9cji8yCf0r4noaezyDy
 /do2Ekj6SXErbDAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA56113425;
 Wed, 24 May 2023 12:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SNC2LPP8bWQkWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 12:02:59 +0000
Message-ID: <35df2c16-6e5b-bc8a-e65c-9244a815dcbd@suse.de>
Date: Wed, 24 May 2023 14:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/5] drm: shmobile: Fixes and enhancements
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1684854992.git.geert+renesas@glider.be>
 <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
 <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lXvjdDXFSdYAgrnKqVpjeokC"
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lXvjdDXFSdYAgrnKqVpjeokC
Content-Type: multipart/mixed; boundary="------------rYFRJinNdx4AkL6RbYDYq5yv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <35df2c16-6e5b-bc8a-e65c-9244a815dcbd@suse.de>
Subject: Re: [PATCH v3 0/5] drm: shmobile: Fixes and enhancements
References: <cover.1684854992.git.geert+renesas@glider.be>
 <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
 <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>
In-Reply-To: <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>

--------------rYFRJinNdx4AkL6RbYDYq5yv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI0LjA1LjIzIHVtIDEzOjU0IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBXZWQsIE1heSAyNCwgMjAyMyBhdCAxOjQy4oCvUE0g
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gQW0g
MjMuMDUuMjMgdW0gMTc6MzEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+Pj4gQ3Vy
cmVudGx5LCB0aGVyZSBhcmUgdHdvIGRyaXZlcnMgZm9yIHRoZSBMQ0QgY29udHJvbGxlciBv
biBSZW5lc2FzDQo+Pj4gU3VwZXJILWJhc2VkIGFuZCBBUk0tYmFzZWQgU0gtTW9iaWxlIGFu
ZCBSLU1vYmlsZSBTb0NzOg0KPj4+ICAgICAxLiBzaF9tb2JpbGVfbGNkY2ZiLCB1c2luZyB0
aGUgZmJkZXYgZnJhbWV3b3JrLA0KPj4+ICAgICAyLiBzaG1vYl9kcm0sIHVzaW5nIHRoZSBE
Uk0gZnJhbWV3b3JrLg0KPj4+IEhvd2V2ZXIsIG9ubHkgdGhlIGZvcm1lciBkcml2ZXIgY2Fu
IGJlIHVzZWQsIGFzIGFsbCBwbGF0Zm9ybSBzdXBwb3J0DQo+Pj4gaW50ZWdyYXRlcyB0aGUg
Zm9ybWVyLiAgTm9uZSBvZiB0aGVzZSBkcml2ZXJzIHN1cHBvcnQgRFQtYmFzZWQgc3lzdGVt
cy4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgZmlyc3Qgc3RlcCB0byBlbmFi
bGUgdGhlIFNILU1vYmlsZSBEUk0gZHJpdmVyIGZvcg0KPj4+IFJlbmVzYXMgQVJNLWJhc2Vk
IFNILU1vYmlsZSBhbmQgUi1Nb2JpbGUgU29Dcy4gIFRoZSBuZXh0IHN0ZXBzIHBsYW5uZWQg
YXJlDQo+Pj4gdG8gKDEpIGFkZCBEVCBzdXBwb3J0ICh3b3JrcywgYnV0IG5lZWRzIGEgaGFj
ayBkdWUgdG8gbGFjayBvZiAoMikpLCBhbmQgKDIpDQo+Pj4gY29udmVydCB0aGUgZHJpdmVy
IHRvIGF0b21pYyBtb2Rlc2V0dGluZy4NCj4+Pg0KPj4+IENoYW5nZXMgY29tcGFyZWQgdG8g
djJbMV06DQo+Pj4gICAgIC0gQWRkIFJldmlld2VkLWJ5Lg0KPj4+DQo+Pj4gQ2hhbmdlcyBj
b21wYXJlZCB0byB2MVsyXToNCj4+PiAgICAgLSBBZGQgUmV2aWV3ZWQtYnksDQo+Pj4gICAg
IC0gRHJvcCBkZXBlbmRlbmN5IG9uIEFSTS4NCj4+Pg0KPj4+IFRoaXMgaGFzIGJlZW4gdGVz
dGVkIG9uIHRoZSBSLU1vYmlsZSBBMS1iYXNlZCBBdG1hcmsgVGVjaG5vDQo+Pj4gQXJtYWRp
bGxvLTgwMC1FVkEgZGV2ZWxvcG1lbnQgYm9hcmQsIHVzaW5nIGEgdGVtcG9yYXJ5DQo+Pj4g
cGxhdGZvcm0tZW5hYmxlbWVudCBwYXRjaFszXS4NCj4+Pg0KPj4+IFRoYW5rcyBmb3IgYXBw
bHlpbmcgdG8gZHJtLW1pc2MhDQo+Pg0KPj4gSXQncyBhbGwgYmVlbiByZXZpZXdlZC4gRG8g
eW91IHdhbnQgbWUgdG8gbWVyZ2UgdGhlIHBhdGNoc2V0Pw0KPiANCj4gVGhhdCB3b3VsZCBi
ZSBncmVhdCEgVGhhbmtzIQ0KDQpEb25lLiBUaGFua3MgZm9yIHRoZSBwYXRjaGVzLg0KDQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------rYFRJinNdx4AkL6RbYDYq5yv--

--------------lXvjdDXFSdYAgrnKqVpjeokC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRt/PMFAwAAAAAACgkQlh/E3EQov+AV
+xAAvgVs+mqCTd9xD8v9SpRrPCRJVbevcqghZYd1/s6HOcnNGtyU6kMB2t663z4adoVPSFLqN+cP
oEKoVJ9J6IR573tm2PBKqZIP6Y+0pV03XGGFG09V54NhGO+8qW8UsQqz4jqfHWKc7dJG2ISh9YTL
2c+v3iWj4QTB5k87ytg1sDOapzmrnBqCDaVhKeNy73ep25FZEkqKhpA69xpZSqGoa0IXpBQulSBI
6nt+CkuFZDH+/AkRAsXYJp7DdjJYFdKP7GgYNj4xH1B7Q6TfYFBCyfiJkUEVgAG1k0i6RJGcFpXs
qJ6g0v6eAGTiNMYblzFTCaRBD2Aa7yONL1kVNpDPo9RRVoIC/p2tkvLH1/0txNl9kKOPlOky8cnE
UoLQZW42EjWUac6B7xv/aixp4Cgd9Iz69L3kKAOyTydJgzwMPcXLVGWuvTgSwz8v5Oc1xsFXy4DJ
LO7e/kwGGmrmtZLzadPh6ZdVrYnXceN0DeoxbvKRhOxy/5Nl1YR31gSHzOlFT4yOvV0WT0LDMvoE
a1q+VwNSQzpsFAJ5nZDpIw6fQsKy+Cv8WhFCfRTrtiOVWYdjY5miRlwtKUG/B/9bBRGMd6mAFfxE
fKlPhy9/o4X3Joucz3N365EZ9tL8IgE5AVH6TtzMMzW7ImLo8TBOX7NrLXqJNEP8x/iyiIlPzUJo
4FA=
=gfft
-----END PGP SIGNATURE-----

--------------lXvjdDXFSdYAgrnKqVpjeokC--
