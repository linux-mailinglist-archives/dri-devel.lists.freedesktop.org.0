Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC1475781
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DA710E52A;
	Wed, 15 Dec 2021 11:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D364A10E48E;
 Wed, 15 Dec 2021 11:12:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 781621F386;
 Wed, 15 Dec 2021 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639566745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbZO9ysX0uCXDwHVS9hyNW+8Tmt8urhUpLdw4FhMSJo=;
 b=oNJG8RBc74gmNQz5uRboqK6lUIhA06/mxUa2Duh/gl20ysqe5sJUGlxcvrGIwB6ZO1T+KU
 gX1MP1dbJqlP2qOFSd8OQgLc9CU6gUHs1m38Zr9z4Mmg7YUl1KT7xT5J1C1UDYIwlXnX6H
 7GQovU16qxEsG3gUoRaivjzqigH7tYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639566745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbZO9ysX0uCXDwHVS9hyNW+8Tmt8urhUpLdw4FhMSJo=;
 b=Y1Mo6E1ktA8KRGhl+YTwmRerTL82XXMxi4+7bNo6g0g0xLYAUYeJ/ni9/0yojIaHNsKhXp
 o12D5DrpR5WaVrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 362551330B;
 Wed, 15 Dec 2021 11:12:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CD0oDJnNuWGsCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 11:12:25 +0000
Message-ID: <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
Date: Wed, 15 Dec 2021 12:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into separate
 helper module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de> <87pmpy3za7.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87pmpy3za7.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NjiJBJidkxdywBFmRsUVvTBz"
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NjiJBJidkxdywBFmRsUVvTBz
Content-Type: multipart/mixed; boundary="------------CjvT8PR4kFFI3de8QxPISLnx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
Subject: Re: [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into separate
 helper module
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de> <87pmpy3za7.fsf@intel.com>
In-Reply-To: <87pmpy3za7.fsf@intel.com>

--------------CjvT8PR4kFFI3de8QxPISLnx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMTI6MDQgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
V2VkLCAxNSBEZWMgMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gCSogbW92ZSBEUCBoZWxwZXIgY29kZSBpbnRvIGRwLyAoSmFuaSkN
Cj4gDQo+IEkgc3VnZ2VzdGVkIGFkZGluZyB0aGUgc3ViZGlyZWN0b3J5LCBidXQgSSdtIGdv
aW5nIHRvIGJpa2VzaGVkIHRoZSBuYW1lLA0KPiB3aGljaCBJIGRpZG4ndCBzdWdnZXN0Lg0K
PiANCj4gJCBmaW5kIGRyaXZlcnMvZ3B1L2RybSAtbWluZGVwdGggMSAtbWF4ZGVwdGggMSAt
dHlwZSBkIHwgd2MgLWwNCj4gNjgNCj4gDQo+IEFzc3VtaW5nIHdlIG1vdmUgbW9yZSBvZiB0
aGUgZHJtIG1vZHVsZXMgdG8gc3ViZGlyZWN0b3JpZXMsIGhvdyBhcmUgdGhleQ0KPiBnb2lu
ZyB0byBzdGFuZCBvdXQgZnJvbSBkcml2ZXJzPw0KPiANCj4gSSBzdWdnZXN0ZWQgZHJtX2Rw
LCB3aGljaCBJIHVuZGVyc3RhbmQgcmVzdWx0cyBpbiB0YXV0b2xvZ3ksIGJ1dCBoZXksDQo+
IGFsbCB0aGUgZmlsZW5hbWVzIHVuZGVyIGRybS8gYWxzbyBoYXZlIGRybV8qLltjaF0uIEFu
ZCBJIGZpbmQgdGhhdCB2ZXJ5DQo+IHVzZWZ1bCBmb3IgZ2l0IGdyZXBzIGFuZCBvdGhlciBj
b2RlIGFyY2hlb2xvZ3kuIFdpdGgganVzdCB0aGUgZHAgbmFtZSwNCj4geW91J2QgaGF2ZSB0
byBrbm93IGFuZCBsaXN0IGFsbCB0aGUgZHJtIHN1YmRpcmVjdG9yaWVzIHdoZW4gbG9va2lu
ZyB1cA0KPiBzdHVmZiB0aGF0J3MgcGFydCBvZiBkcm0gYnV0IG5vdCBkcml2ZXJzLg0KDQpJ
IHRoaW5rIHdlIGhhdmUgZW5vdWdoIGZpbGVuYW1lIHByZWZpeGVzIGFscmVhZHkuIGRybS9k
cm1fZHAvZHJtX2RwXyBpcyANCmp1c3QgcmlkaWN1bG91cy4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------CjvT8PR4kFFI3de8QxPISLnx--

--------------NjiJBJidkxdywBFmRsUVvTBz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG5zZgFAwAAAAAACgkQlh/E3EQov+Bp
ixAAwWs8icDnyBSxV2SFa3psBdVLmho2jWbzofKikPHRoIcQYX/gUZfJJkp5B/s4nOKVq/PfyKms
cEHDVBGJxyKsjQHvRqDja4JA5RZD52fvYt3+mJM4eZK7cqZabIURhhWnKMKbQKChZQ2fWECJpBcF
AHJ2n95F/Tz7N2NUxAtWspQZSfYgoIEpc4hfwMDNlSFHdfzjb/OzUHNyPo5Wj/xZhbTp9jCScVau
Qd3wDAp3/94OEsk3SvmuDqlCO2N4NCVPHHOQ8ZxI9WUm7tIWqd8oZ2P3usRwWQrCzNP/24qENqV8
3NKz7xFup4ZIGVqL3XlgtELUyDTc2d0KhB/KiQnoIm5G3ABGla6sHnO53NpCKvWDiWKiloZwWgfb
m/c4v+tGONqUpvhEJYAwDIptWMNioWmfMTIcKQ5EI2TX+pEcCj40fPmykz2ms4RekdAXmYKo+TW0
fHI1ihrdJTHma0XKP/if1b0iLpqy+6JJ1edAgoOyMG8tzDiLmKeJIAOoaQg0qTqXHc4qkFMOTT79
uoJE08Ysab/cT4isNZDpsVxHEwiNvtc94sPLvU8HCcyBLsPpOkY1aiKbRV4WNxJx3llBtGNUL47I
N35xD2LxHS7sH43a9o5hxQyiZlh0aWqIuQ1mIEIbmL7edw2cDOT1XXVyBvRZ8VXDio3GKHIiJcHi
VAI=
=vQBm
-----END PGP SIGNATURE-----

--------------NjiJBJidkxdywBFmRsUVvTBz--
