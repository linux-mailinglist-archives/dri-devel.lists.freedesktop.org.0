Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA83447C40
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 09:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A476E954;
	Mon,  8 Nov 2021 08:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C936E954
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 08:50:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C64C2190B;
 Mon,  8 Nov 2021 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636361435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W4jPKsYsST6dQr9FRHWQB8IhrRDqgJUuPMCwmMcL1OY=;
 b=BmQTdXukc2jnriCWni+h9SnBGCG/MSJwC2eKwHdoo6tX8GqZpxxVtzcwJAmIvskgHaOFSR
 N7WNn/yHy3W8fhN52ITT+QqfLTw90ko/X8lUmLzfVLbtB9rngD9kheoGVAobPqHxY5P+PC
 Ax11rEb/x2bxBfM1/ARz8aoDNzmHnOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636361435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W4jPKsYsST6dQr9FRHWQB8IhrRDqgJUuPMCwmMcL1OY=;
 b=VZRN1w65luOREgI/fW4AsRxHjcldMmvFAZVmW/QFOlinfGWcCGGts5mWHrKLh3HDUE1qED
 3jxPkaFrVE5Rt4BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B317139CF;
 Mon,  8 Nov 2021 08:50:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nzyxAdvkiGHbZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 08:50:35 +0000
Message-ID: <20ba6cd3-74bd-a212-f483-e0b73a95dbc1@suse.de>
Date: Mon, 8 Nov 2021 09:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/9] drm/format-helper: Export drm_fb_clip_offset()
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-2-tzimmermann@suse.de>
 <31701408-4e54-58a4-93c9-c946ef2488af@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <31701408-4e54-58a4-93c9-c946ef2488af@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lD2yecSCRPS0fHZxMRlz2kT3"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lD2yecSCRPS0fHZxMRlz2kT3
Content-Type: multipart/mixed; boundary="------------ILABsSxHpNUGpDZlZ0x220hF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <20ba6cd3-74bd-a212-f483-e0b73a95dbc1@suse.de>
Subject: Re: [PATCH v2 1/9] drm/format-helper: Export drm_fb_clip_offset()
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-2-tzimmermann@suse.de>
 <31701408-4e54-58a4-93c9-c946ef2488af@tronnes.org>
In-Reply-To: <31701408-4e54-58a4-93c9-c946ef2488af@tronnes.org>

--------------ILABsSxHpNUGpDZlZ0x220hF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTEuMjEgdW0gMjE6NDggc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDAxLjExLjIwMjEgMTUuMTUsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gUHJvdmlkZSBhIGZ1bmN0aW9uIHRoYXQgY29tcHV0ZXMgdGhlIG9mZnNldCBpbnRv
IGEgYmxpdCBkZXN0aW5hdGlvbg0KPj4gYnVmZmVyLiBUaGlzIHdpbGwgYWxsb3cgdG8gbW92
ZSBkZXN0aW5hdGlvbi1idWZmZXIgY2xpcHBpbmcgaW50byB0aGUNCj4+IGZvcm1hdC1oZWxw
ZXIgY2FsbGVycy4NCj4+DQo+PiB2MjoNCj4+IAkqIHByb3ZpZGUgZG9jdW1lbnRhdGlvbiAo
U2FtKQ0KPj4gCSogcmV0dXJuICd1bnNpZ25lZCBpbnQnIChTYW0sIE5vcmFsZikNCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4+IC0tLQ0KPiANCj4gUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPg0KDQpUaGFua3MgYSBsb3QuIE1heSBJIGFzayB5b3UgdG8gYWxzbyBy
ZXZpZXcgcGF0Y2hlcyA3IHRvIDk/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ILABsSxHpNUGpDZlZ0x220hF--

--------------lD2yecSCRPS0fHZxMRlz2kT3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGI5NkFAwAAAAAACgkQlh/E3EQov+Be
qA//XwewE2/PKfqRQ5WOmehdS85n0nBqN87KWV5UT+SMeMSRl6sofDg04IRmD7gVlUMXGz/L4gIt
9sgF246+onbk11K7TFBD1jK05pruCd/0E7UCNek6Fv7z+kPs0e/LmjowwMZfWllWKD5MLJBvEEaU
UeDBpu0HSuemjcZIWapkl8m3KmtDWCsUWmifzb3I5OFBo2k3eF1DIrEBh2wbZ0+tTToG4tDGYS5s
uwhgt/DvjH9gRLVPly2Vtzpw1XOSpRF6Q86xuUu6IIe+zQtWhnSFUnKCu0ol2m1D71szr9G9UsGA
tLQzLZBeiLdK4Cq805BczBtgo6B/ylDB49in7k/znSymrtfbeVMkhGxUMEbcEwG77nkBwwccY24h
tRau5jTRbqPqpcgruK4J0tuoSV+ext56jAf1jmcEPGmpHbcPg4ONbY8oA3R5Pt00oTvN8l6YxUYe
PsQ77aueV2xG8hDP0sWj75HuHhwztO5nIru8T1kwIBOpGyWhs7qjDsDhO9i+joDDRvAd0qaUprSs
uTT6e7+COX2rRv63LPHTOgKM+YIT8xIrNj9uAwDVszyf0LgackGR6F3Cr9RKozQDywJ61lKW95Fw
Wt62Scq6VhFajUwZjRf+CnGzm2S3zRVR3r0OGZ2o1yCfZfrv0GRrOWfnkz9E+dfP85SSFfkFzuaP
R6A=
=iTI9
-----END PGP SIGNATURE-----

--------------lD2yecSCRPS0fHZxMRlz2kT3--
