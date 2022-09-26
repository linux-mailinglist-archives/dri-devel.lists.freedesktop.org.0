Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5A5E99EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40B010E585;
	Mon, 26 Sep 2022 06:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98D10E585
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:54:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 587D91FB1B;
 Mon, 26 Sep 2022 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664175277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=To1pUudY4uSzHzW8o01lDYdf/mRCxIkcxaxE+I3LrZU=;
 b=sH+bnj0O7RKentILtNfCmvfSgTHAIwdJImQWOEMNCPqXIfhTKDN8184F+GsG46waPrXr2H
 fpHWR/jRH0VtN11cq0yrMl+9BgJk2edfTZV4KV0i6P7g6kKwKjwIRbzPy2wQCNgI5F6e0H
 p5KvaDhhTUpGpDajOzN41boAEeFw7ZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664175277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=To1pUudY4uSzHzW8o01lDYdf/mRCxIkcxaxE+I3LrZU=;
 b=Shym1tg84mdtAHtMng4bVYoQNn8Z4EP8VHmZop5dxN2nrxLfHcP1xCLaXIH5di/RXK+ZDq
 3slEJmem2OiGcIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A5BF13486;
 Mon, 26 Sep 2022 06:54:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zIxRDa1MMWMzKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 06:54:37 +0000
Message-ID: <1e8dcb71-02b1-30d6-343a-777af237ff59@suse.de>
Date: Mon, 26 Sep 2022 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de> <YyrNXSoZJdidfF0T@intel.com>
 <17203390-af02-0934-9d9f-df68be78c3a4@suse.de> <YyrlE22J4JT6bDu5@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YyrlE22J4JT6bDu5@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wm0lhHa6ca0R3jPXEiLhuljH"
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wm0lhHa6ca0R3jPXEiLhuljH
Content-Type: multipart/mixed; boundary="------------nGH4TS0rmquhMhg02CfIy820";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Message-ID: <1e8dcb71-02b1-30d6-343a-777af237ff59@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de> <YyrNXSoZJdidfF0T@intel.com>
 <17203390-af02-0934-9d9f-df68be78c3a4@suse.de> <YyrlE22J4JT6bDu5@intel.com>
In-Reply-To: <YyrlE22J4JT6bDu5@intel.com>

--------------nGH4TS0rmquhMhg02CfIy820
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjIgdW0gMTI6MTggc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IA0KPiBNYXliZSB3ZSBoYXZlIHR3byBjbGVhcmx5IHNlcGFyYXRlIGNsYXNzZXMgb2YgdXNl
cyBjYXNlOg0KPiAxLiBkZXZpY2VzIHdoZXJlIG9ubHkgZGFtYWdlIHRvIHRoZSBmYiBjb250
ZW50cyBtYXR0ZXIgKGVnLiBzb21lIGtpbmQgb2YNCj4gICAgIHNoYWRvdyBmYiB0aGF0IGlz
IHRoZSBzYW1lIHNpemUgYXMgdGhlIHJlYWwgZmIpLg0KPiAyLiBkZXZpY2VzIHdoZXJlIGV2
ZXJ5dGhpbmcgYWJvdXQgdGhlIHNjYW5vdXQgcHJvY2VzcyBtYXR0ZXJzIChlZy4gUFNSKQ0K
PiA/DQo+IA0KPiBNYXliZSB0aGVyZSBzaG91bGQgYmUgaGVscGVycyB0byBkZWFsIHdpdGgg
anVzdCB0aGUgZmlyc3QgY2FzZSwNCj4gYW5kIHRoZW4gc29tZSBtb3JlIGhlbHBlcnMgKG9y
IGp1c3QgZHJpdmVyIGNvZGUpIHRvIHBpbGUgdGhlIHJlc3QNCj4gb24gdG9wIGFzIHdlbGwg
d2hlbiBuZWVkZWQ/DQoNCkRvZXMgaXQgaGVscCBpZiBJIGluY2x1ZGUgbXkgYXN0IHBhdGNo
ZXMgZm9yIHJldmlldyBoZXJlPyBXZSdkIGhhdmUgYSANCnVzZXIgb2YgdGhlIGNvZGUuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------nGH4TS0rmquhMhg02CfIy820--

--------------Wm0lhHa6ca0R3jPXEiLhuljH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxTKwFAwAAAAAACgkQlh/E3EQov+BI
wRAA0R4t4E8+4O42bj8xFHvCdhZGVEM7If215b80qiIAensoQnFJLkQShHTKKjZ59a7f0vhxXZ8A
EevfbvVRv8lSRaY+0GfNQlr7oOvNOG6UcJQlZYbM07fq/XCb4eX/ms0LsB6HML3UBD9iY3N3eemC
tqPZt/smyXACbmShWrMQf88MO4pfmvpcdvpa3WxMBm+3EuEAibuFwd8KzmFcv5aPmUZS2VKwVPW2
Rq5rADMz6wLTRDpk7LymHq4p9Ikd58R09rMlvhDUmV6n7b95I9kayJQfLn3tKC1YYU9kTwobXht0
4JVnlyzASLGMPaCoJ7Nf9fXN5aSeYktzdMelNKW/NkQF44xuIVrEsSJ2NPMRETWs+vR/DQ7mwjYB
mtrxSi8BSTUd70Oa98qKWtnENKnGP81wPdM8kFRUYyYXhD3QYy+9tlkcgPXereublr8lJcjS5plp
7ipClpqw71jH8VPLy4FflM8iQpoL0+r0CZb4hod/ux398vKeau/XM6O1EWzloZnto4IsT+V/WDxA
j0MxD5Vd6NSBJzpT+6Yhcdw46zYscsqJcC7K0g/6SBlZCXKWvYJEFd6zB9D7lPyrIKFlXNqeH2Yj
J1W+SRIB0JVSPq97vdiC6j1768qCfhuGSIk5IWe+dqGNZUARR0WSxnGn/snuLdCbCKeXCxdv4VcC
O7A=
=5370
-----END PGP SIGNATURE-----

--------------Wm0lhHa6ca0R3jPXEiLhuljH--
