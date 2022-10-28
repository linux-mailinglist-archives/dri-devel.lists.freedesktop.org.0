Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85D610B51
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 09:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E86810E799;
	Fri, 28 Oct 2022 07:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5686F10E799
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 07:31:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08D7221A1B;
 Fri, 28 Oct 2022 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666942299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcyZ9FAAhaIb+UZKLHdSxuNjP/oRNZbxltQ2PICvjcw=;
 b=YnzHT5Q7MEf+LmIzKJbflNlrjr+8JSqvRo6QZUVcDX5uI1HsvcVaWaRpLpLuKR3d3LGylq
 pkdgyfNWxQDghHCf7K9hTNWIC4HXAU8WMSDxfv5DHwD+bjsYc7UaHsoVDyood0tlxZpRh5
 pgabkJkpjCoOuCUAlgIhd2Y1FLf0YLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666942299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcyZ9FAAhaIb+UZKLHdSxuNjP/oRNZbxltQ2PICvjcw=;
 b=a2Yg6I2LXl7qh6oVAkXK0cmibkiRdEICRLYPfBcjTyPSCkEWN/8fjijJmwYPh6BUdHqHD0
 VSh1keZkrzDY4rCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCB7F1377D;
 Fri, 28 Oct 2022 07:31:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JM4MLVqFW2O3XQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Oct 2022 07:31:38 +0000
Message-ID: <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
Date: Fri, 28 Oct 2022 09:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Must-Pass Test Suite for KMS drivers
Content-Language: en-US
To: maxime@cerno.tech, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221024124323.tfyxcadyd4nz56jz@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rBN7fG0GKjRtpAPYHg0NYT7y"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rBN7fG0GKjRtpAPYHg0NYT7y
Content-Type: multipart/mixed; boundary="------------m24y0gGPKII7VFHotbbJbuF9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maxime@cerno.tech, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Martin Roukala <martin.roukala@mupuf.org>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
Subject: Re: Must-Pass Test Suite for KMS drivers
References: <20221024124323.tfyxcadyd4nz56jz@houat>
In-Reply-To: <20221024124323.tfyxcadyd4nz56jz@houat>

--------------m24y0gGPKII7VFHotbbJbuF9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDI0LjEwLjIyIHVtIDE0OjQzIHNjaHJpZWIgbWF4aW1lQGNlcm5v
LnRlY2g6DQo+IEhpLA0KPiANCj4gSSd2ZSBkaXNjdXNzaW5nIHRoZSBpZGVhIGZvciB0aGUg
cGFzdCB5ZWFyIHRvIGFkZCBhbiBJR1QgdGVzdCBzdWl0ZSB0aGF0DQo+IGFsbCB3ZWxsLWJl
aGF2ZWQgS01TIGRyaXZlcnMgbXVzdCBwYXNzLg0KPiANCj4gVGhlIG1haW4gaWRlYSBiZWhp
bmQgaXQgY29tZXMgZnJvbSB2NGwyLWNvbXBsaWFuY2UgYW5kIGNlYy1jb21wbGlhbmNlLA0K
PiB0aGF0IGFyZSBiZWluZyB1c2VkIHRvIHZhbGlkYXRlIHRoYXQgdGhlIGRyaXZlcnMgYXJl
IHNhbmUuDQo+IA0KPiBXZSBzaG91bGQgcHJvYmFibHkgc3RhcnQgYnVpbGRpbmcgdXAgdGhl
IHRlc3QgbGlzdCwgYW5kIGV2ZW50dWFsbHkNCj4gbWFuZGF0ZSB0aGF0IGFsbCB0ZXN0cyBw
YXNzIGZvciBhbGwgdGhlIG5ldyBLTVMgZHJpdmVycyB3ZSB3b3VsZCBtZXJnZQ0KPiBpbiB0
aGUga2VybmVsLCBhbmQgYmUgcnVuIGJ5IEtDaSBvciBzaW1pbGFyLg0KPiANCj4gSSBkaWQg
YSBmaXJzdCBwYXNzIHRvIGNyZWF0ZSBhIGRyYWZ0IG9mIHN1Y2ggYSB0ZXN0LXN1aXRlLCB3
aGljaCB3b3VsZA0KPiBjb250YWluOg0KPiANCj4gaWd0QGNvcmVfYXV0aEBiYXNpYy1hdXRo
DQo+IGlndEBjb3JlX2F1dGhAZ2V0Y2xpZW50LW1hc3Rlci1kcm9wDQo+IGlndEBjb3JlX2F1
dGhAZ2V0Y2xpZW50LXNpbXBsZQ0KPiBpZ3RAY29yZV9hdXRoQG1hbnktbWFnaWNzDQo+IGln
dEBjb3JlX2dldGNsaWVudA0KPiBpZ3RAY29yZV9nZXRzdGF0cw0KPiBpZ3RAY29yZV9nZXR2
ZXJzaW9uDQo+IGlndEBjb3JlX2hvdHVucGx1Z0Bob3RyZWJpbmQtbGF0ZWNsb3NlDQo+IGln
dEBjb3JlX2hvdHVucGx1Z0Bob3R1bmJpbmQtcmViaW5kDQo+IGlndEBjb3JlX2hvdHVucGx1
Z0B1bmJpbmQtcmViaW5kDQo+IGlndEBjb3JlX3NldG1hc3Rlcg0KPiBpZ3RAY29yZV9zZXRt
YXN0ZXJfdnNfYXV0aA0KPiBpZ3RAZGV2aWNlX3Jlc2V0QHVuYmluZC1yZXNldC1yZWJpbmQN
Cj4gaWd0QGRybV9yZWFkDQo+IGlndEBkdW1iX2J1ZmZlcg0KPiBpZ3RAZmJkZXYNCg0KTWF5
YmUgd2UgbWFrZSB0aGlzIHRlc3Qgb3B0aW9uYWw/IEF0IGxlYXN0IHNwcmQgZGVjaWRlZCB0
byBub3Qgc3VwcG9ydCANCmZiZGV2IGF0IGFsbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiBpZ3RAZmVhdHVyZV9kaXNjb3ZlcnlAZGlzcGxheQ0KPiBpZ3RAa21zXzNkDQo+IGln
dEBrbXNfYWRkZmJfYmFzaWMNCj4gaWd0QGttc19hc3luY19mbGlwcw0KPiBpZ3RAa21zX2Nv
bG9yDQo+IGlndEBrbXNfY29uY3VycmVudA0KPiBpZ3RAa21zX2N1cnNvcl9jcmMNCj4gaWd0
QGttc19jdXJzb3JfZWRnZV93YWxrDQo+IGlndEBrbXNfY3Vyc29yX2xlZ2FjeUBiYXNpYy1i
dXN5LWZsaXAtYmVmb3JlLWN1cnNvcg0KPiBpZ3RAa21zX2N1cnNvcl9sZWdhY3lAYmFzaWMt
ZmxpcC1hZnRlci1jdXJzb3INCj4gaWd0QGttc19jdXJzb3JfbGVnYWN5QGJhc2ljLWZsaXAt
YWZ0ZXItY3Vyc29yDQo+IGlndEBrbXNfZGlzcGxheV9tb2Rlcw0KPiBpZ3RAa21zX2RpdGhl
cg0KPiBpZ3RAa21zX2RwX2F1eF9kZXYNCj4gaWd0QGttc19mbGlwQGJhc2ljLWZsaXAtdnMt
ZHBtcw0KPiBpZ3RAa21zX2ZsaXBAYmFzaWMtZmxpcC12cy1tb2Rlc2V0DQo+IGlndEBrbXNf
ZmxpcEBiYXNpYy1mbGlwLXZzLXdmX3ZibGFuaw0KPiBpZ3RAa21zX2ZsaXBAYmFzaWMtcGxh
aW4tZmxpcA0KPiBpZ3RAa21zX2ZsaXBfZXZlbnRfbGVha0BiYXNpYw0KPiBpZ3RAa21zX2Zv
cmNlX2Nvbm5lY3Rvcl9iYXNpY0Bmb3JjZS1jb25uZWN0b3Itc3RhdGUNCj4gaWd0QGttc19m
b3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtZWRpZA0KPiBpZ3RAa21zX2ZvcmNlX2Nvbm5l
Y3Rvcl9iYXNpY0Bmb3JjZS1sb2FkLWRldGVjdA0KPiBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rv
cl9iYXNpY0BwcnVuZS1zdGFsZS1tb2Rlcw0KPiBpZ3RAa21zX2dldGZiDQo+IGlndEBrbXNf
aGRtaV9pbmplY3QNCj4gaWd0QGttc19oZHINCj4gaWd0QGttc19pbnZhbGlkX21vZGUNCj4g
aWd0QGttc19sZWFzZQ0KPiBpZ3RAa21zX3BhbmVsX2ZpdHRpbmcNCj4gaWd0QGttc19waXBl
X2NyY19iYXNpYw0KPiBpZ3RAa21zX3BsYW5lX2FscGhhX2JsZW5kDQo+IGlndEBrbXNfcGxh
bmUNCj4gaWd0QGttc19wbGFuZV9jdXJzb3INCj4gaWd0QGttc19wbGFuZV9sb3dyZXMNCj4g
aWd0QGttc19wbGFuZV9tdWx0aXBsZQ0KPiBpZ3RAa21zX3BsYW5lX3NjYWxpbmcNCj4gaWd0
QGttc19wcm9wX2Jsb2INCj4gaWd0QGttc19wcm9wZXJ0aWVzDQo+IGlndEBrbXNfcm1mYg0K
PiBpZ3RAa21zX3NjYWxpbmdfbW9kZXMNCj4gaWd0QGttc19zZXF1ZW5jZQ0KPiBpZ3RAa21z
X3NldG1vZGUNCj4gaWd0QGttc19zeXNmc19lZGlkX3RpbWluZw0KPiBpZ3RAa21zX3R2X2xv
YWRfZGV0ZWN0DQo+IGlndEBrbXNfdW5pdmVyc2FsX3BsYW5lDQo+IGlndEBrbXNfdmJsYW5r
DQo+IGlndEBrbXNfdnJyDQo+IGlndEBrbXNfd3JpdGViYWNrDQo+IA0KPiBNb3N0IG9mIHRo
ZW0gYXJlIHNraXBwZWQgb24gdmM0IHJpZ2h0IG5vdywgYnV0IEkgY291bGQgc2VlIHRoYXQg
c29tZSBvZg0KPiB0aGVtIGZhaWwgYWxyZWFkeSAoa21zX3JtZmIsIGNvcmVfaG90dW5wbHVn
KSwgc28gaXQgcHJvdmVzIHRvIGJlIHVzZWZ1bA0KPiBhbHJlYWR5Lg0KPiANCj4gV2hhdCBk
byB5b3UgdGhpbms/IElzIHRoZXJlIHNvbWUgbW9yZSB0ZXN0cyBuZWVkZWQsIG9yIGRpZCBJ
IGluY2x1ZGUNCj4gc29tZSB0ZXN0cyB0aGF0IHNob3VsZG4ndCBoYXZlIGJlZW4gdGhlcmU/
DQo+IA0KPiBUaGFua3MhDQo+IE1heGltZQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------m24y0gGPKII7VFHotbbJbuF9--

--------------rBN7fG0GKjRtpAPYHg0NYT7y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNbhVoFAwAAAAAACgkQlh/E3EQov+AB
SA/8Cwg3z1ondGChup0qD/vHCV8EIOXPXbDNN5lRVoAiBJYinfxUDsyK2+d41WRi1iPP44QSwn7c
kTZ3dndeAdGj/YFw2vhT0Q/mosHVBjFIx/0ct06G/OykAlmEmiBuL6iS+7YYAPzELolw8dLZExF9
oyTgSp9VYTuRs1hxgAbMQkX8JGaqwuYqJv5uQityufSLlDm3TpwYmovfrbNAfq+zS5+QYuCLzaMQ
ySEbq9vssEJhok9UynI45fr6/tAPt6LtIjXw9eJKiaH6je8/gOiLngaebueaKDP4MMyRlfx4wxLl
DL10HE4vgLxhsn+DRQfVjxAsQtlC+jCcoB+IPHLQxnUjsuwoY/U3pFm5RYr2E2/hei1hDVEiUn4s
56zdGHrPRLAf3nX+rEhyA6MR6zguh4WP6JtKSFaWlH0nsQgQaC8Mjg8E8jfa27BYWADBVO6zZb34
TVOc+wkBb3hPaLSPxG4TBtdP7g/gOrRClCmzLcqZgt6QY5QzCfReVpKV1FrNx1lM+0xOaaggwpDl
zKqQeoqKRbGfTNglthVdsvULXB+SKm7EmrT0aeAFCUbk/Ht8857Qwp8dhH1sAofpST0/oN5ojJT+
MsjCBKxn3t72RaSY2Z+DptVlGTYa9139ZVU5UtC40RguuxxiB80j1krxCKRJoAzzxJkyJOFMjqlT
eBk=
=XAy0
-----END PGP SIGNATURE-----

--------------rBN7fG0GKjRtpAPYHg0NYT7y--
