Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C676248AA52
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E940113F92;
	Tue, 11 Jan 2022 09:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB290113F85
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:20:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 556691F3B6;
 Tue, 11 Jan 2022 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641892833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMzRzmqcc943s+l8/kmgMkpO4A0WvCaVF1BG6MfAxQ0=;
 b=eqNs7EYIJf3e7H5jewFT9HoeUztNBNos32dfgZeJ0U8Sj+4M0aYYB6yXMjJPc4CeU3EPJP
 k7mRuIibiQ/fuJGMKa3WCcEuHAOyy1RCxQdhv6DyrJYkR9V+0dMc2FYSvwtG6k1Wtl7jEs
 RWu8I8vBAY43G7aTRORn4ZObNPKOjIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641892833;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMzRzmqcc943s+l8/kmgMkpO4A0WvCaVF1BG6MfAxQ0=;
 b=VTvQwXlnX0z3+ZenAgT+ztt5azu7D1Xtg1qDeaoz6YbU31Wj3s1rtPPLGcdBJM9G16cfQj
 pp9O2qwVyV2HFhAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 044C913AC9;
 Tue, 11 Jan 2022 09:20:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v0OMO+BL3WHhMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 09:20:32 +0000
Message-ID: <4fa36c87-7771-28bb-15b3-82b2cb249607@suse.de>
Date: Tue, 11 Jan 2022 10:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1 1/2] drm/sprd: remove the selected DRM_KMS_CMA_HELPER
 in kconfig
Content-Language: en-US
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-2-kevin3.tang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211224141213.27612-2-kevin3.tang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4bsQbDkm3eazuMfseDLqtF8L"
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
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, lukas.bulwahn@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4bsQbDkm3eazuMfseDLqtF8L
Content-Type: multipart/mixed; boundary="------------lk4cjMBDm8TiJ0MrWqr5Pzq0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lukas.bulwahn@gmail.com, orsonzhai@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Message-ID: <4fa36c87-7771-28bb-15b3-82b2cb249607@suse.de>
Subject: Re: [PATCH v1 1/2] drm/sprd: remove the selected DRM_KMS_CMA_HELPER
 in kconfig
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-2-kevin3.tang@gmail.com>
In-Reply-To: <20211224141213.27612-2-kevin3.tang@gmail.com>

--------------lk4cjMBDm8TiJ0MrWqr5Pzq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTIuMjEgdW0gMTU6MTIgc2NocmllYiBLZXZpbiBUYW5nOg0KPiBPbiBs
aW51eC1uZXh0LCBjb21taXQgNDM1MzFlZGQ1M2YwICgiZHJtL3NwcmQ6IGFkZCBVbmlzb2Mn
cyBkcm0ga21zIG1hc3RlciIpIGFkZHMgdGhlIGNvbmZpZyBEUk1fU1BSRCwNCj4gd2hpY2gg
c2VsZWN0cyBEUk1fS01TX0NNQV9IRUxQRVIuDQo+IA0KPiBIb3dldmVyLCBjb21taXQgMDk3
MTdhZjdkMTNkICgiZHJtOiBSZW1vdmUgQ09ORklHX0RSTV9LTVNfQ01BX0hFTFBFUiBvcHRp
b24iKSBqdXN0IHJlbW92ZWQgdGhlDQo+IERSTV9LTVNfQ01BX0hFTFBFUi4gU28sIHRoZSBz
ZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSIHJlZmVycyB0byBhIG5vbi1leGlzdGluZyBrY29u
ZmlnIHN5bWJvbC4NCg0KV2l0aCB0aGUgbG9uZyBsaW5lcyBmaXhlZCwgeW91IGNhbiBhZGQN
Cg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
DQpTZWxlY3RpbmcgRFJNX0dFTV9DTUFfSEVMUEVSIGFuZCBEUk1fS01TX0hFTFBFUiBhdCB0
aGUgc2FtZSB0aW1lIGFjdHMgDQpsaWtlIERSTV9LTVNfQ01BX0hFTFBFUiBkaWQgYmVmb3Jl
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBDYzogT3Jzb24gWmhhaSA8b3Jz
b256aGFpQGdtYWlsLmNvbT4NCj4gQ2M6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21h
aWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNv
Yy5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWcgfCAxIC0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9L
Y29uZmlnDQo+IGluZGV4IDNlZGVhZWNhMC4uOWE5YzdlYmZjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL0tjb25maWcNCj4gQEAgLTMsNyArMyw2IEBAIGNvbmZpZyBEUk1fU1BSRA0KPiAgIAlk
ZXBlbmRzIG9uIEFSQ0hfU1BSRCB8fCBDT01QSUxFX1RFU1QNCj4gICAJZGVwZW5kcyBvbiBE
Uk0gJiYgT0YNCj4gICAJc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUg0KPiAtCXNlbGVjdCBE
Uk1fS01TX0NNQV9IRUxQRVINCj4gICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+ICAgCXNl
bGVjdCBEUk1fTUlQSV9EU0kNCj4gICAJc2VsZWN0IFZJREVPTU9ERV9IRUxQRVJTDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------lk4cjMBDm8TiJ0MrWqr5Pzq0--

--------------4bsQbDkm3eazuMfseDLqtF8L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHdS+AFAwAAAAAACgkQlh/E3EQov+Dd
Lw/+OF0tgDgp/Jje9GChADeBtT4TROTV+1765Kafobgyr0ZX4qqkfl5/Sl1gGBq/W66enCI0iYri
5oCRHx735DI6dGnAV3HBPUW+n/JytSUvG5+2hWX66S5Q/YvX5VUaltU8jM/1vS3ehLMfOswYn3EF
9XzljgVJF2yfa2VWa6RLKJir6bVkt6dZlxQGYY0QmNBerhAEI6m5NYg4lMkJVWHjr4bdLqRCV8gI
D6dlhaFVe4dItMCmqZuEviS51pC/f/K+wnpsND6aLB/aM2TKto8IffsNUJ6W9cc3o/sVmdIRuE5z
OmttHSED6oc6VWXYa1KV4SLz7aDSKNXflYtB38VQzF0EZQ+ePkmBkAIYfIjQZ41Mn0PFJjhErQXx
wwfRLgrONm0TtEndUuY4SnWGVqTTHaxDU8dHY+mDu5pgWDCvqQWQ8a5BJ6LiKI+wKrYUKGPUhCev
Fm43nWFKXqcWOrJCTBSH8nUgr99G9yrQmwqhYqClsfh4hVE0IiEJaDSORzJL3w2fQluuM4EucfPp
7uHVPmDdRrSiwFJJiBnpdYQHg1WWILHGvrVv3GJbEyh5zfeR/WI0ReIsnjtIdQLntHkA40WrR8j7
Wg47dpzPHxelvrtgYjSkBUfgNvIPQrz38dEMOg1u91/YRI/NyWuG/pEADCkXlX6CnkbTNXPxSECt
KJ8=
=Wnv7
-----END PGP SIGNATURE-----

--------------4bsQbDkm3eazuMfseDLqtF8L--
