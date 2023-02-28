Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBB6A5C3C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A55110E4D2;
	Tue, 28 Feb 2023 15:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403C310E4CE;
 Tue, 28 Feb 2023 15:46:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 037961FDC3;
 Tue, 28 Feb 2023 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677599164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ej7fO9l/Ju/aJPf79hnxatgSDRzxn6HXOmsbU/mD/w=;
 b=ovXcO7ZXXoaOGvgQt1StiwI3CBthua3EBiqQ7064l6wSa6QHs3ACWF1/B2GTyUIC7oyy1l
 ZJDHHV2sVOciMj/RRB69I/R2ma+9xMxMfJ7i7yYAUIYN6mOUhEMfbH7M2iaj+3wEqUuqAH
 ENLqoj3DGPuzRmwNVreKUdT9lOvIUro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677599164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ej7fO9l/Ju/aJPf79hnxatgSDRzxn6HXOmsbU/mD/w=;
 b=dA4s71Lf0jeKo4u7jjZl4piX53jXu2JLPl4q5p9o7dStw5VyHP710/Yc+2B6hOLGbHji3k
 etV+i5DUHlbobjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDEF213440;
 Tue, 28 Feb 2023 15:46:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /cRWMbsh/mOGAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 15:46:03 +0000
Message-ID: <07cb2cc5-5491-a5a4-874f-f1e10ffe4882@suse.de>
Date: Tue, 28 Feb 2023 16:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Revert "drm/shmem-helper: Switch to reservation lock"
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@intel.com
References: <20230228152612.19971-1-tzimmermann@suse.de>
 <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XLj78G5Z1SQwYxTVY90xOhKM"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XLj78G5Z1SQwYxTVY90xOhKM
Content-Type: multipart/mixed; boundary="------------YLW061QDgd20NzEB2LHbbowF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Message-ID: <07cb2cc5-5491-a5a4-874f-f1e10ffe4882@suse.de>
Subject: Re: [PATCH] Revert "drm/shmem-helper: Switch to reservation lock"
References: <20230228152612.19971-1-tzimmermann@suse.de>
 <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>
In-Reply-To: <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>

--------------YLW061QDgd20NzEB2LHbbowF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDIuMjMgdW0gMTY6Mjggc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IE9uIDIvMjgvMjMgMTg6MjYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCA2N2I3ODM2ZDQ0NTg3OTBmMTI2MWUzMWZlMGNlMzI1MDk4OTc4NGYw
Lg0KPj4NCj4+IFRoZSBsb2NraW5nIGFwcGVhcnMgaW5jb21wbGV0ZS4gQSBjYWxsZXIgb2Yg
U0hNRU0gaGVscGVyJ3MgcGluDQo+PiBmdW5jdGlvbiBuZXZlciBhY3F1aXJlcyB0aGUgZG1h
LWJ1ZiByZXNlcnZhdGlvbiBsb2NrLiBTbyB3ZSBnZXQNCj4+DQo+PiAgICBXQVJOSU5HOiBD
UFU6IDMgUElEOiA5NjcgYXQgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmM6MjQzIGRybV9nZW1fc2htZW1fcGluKzB4NDIvMHg5MCBbZHJtX3NobWVtX2hlbHBlcl0N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4gVGhhbmtzIFRob21hcywNCj4gDQo+IEFja2VkLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPiAN
Cg0KVGhhbmtzLCBtZXJnZWQgbm93LiBJIGhvcGUgdGhpcyBmaXhlcyB0aGUgaW1tZWRpYXRl
IGlzc3Vlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------YLW061QDgd20NzEB2LHbbowF--

--------------XLj78G5Z1SQwYxTVY90xOhKM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP+IbsFAwAAAAAACgkQlh/E3EQov+Cs
LA/9EtlYuObcl6prpLRWIBhh7gpHWCKCHPMcRO72MMARFteNH2nOeghlfQ/8K9QAiQOHP3DcBSeE
8ioo3V6v35HKkogsfzcJgolApquVValZdVtazj15d5qZ5CKCTP43WoM0xjuZpAdkF5/3ui3U0/Pw
WNPrjUXu+Lb9uJm0dbijpv+gfCyLLJ6TJGMgxRip4lgcTKpuT5hGja6NeDhoIdVMs4oDATs+rF9X
+we6CpL6roQYLx9piHeW6AZyS1791DPI712om8rMa5O44ZqdgZBuKq+EMmRgBEZOKZPmwJZ+ZrbA
EBS0pQBqvXiGdEulVgei3nsV+Q6zoy0r4P34To4LtjzdSSL8hxPyyoJkdGyir079+f/Updz0016o
Zmph3mq6BSFqemQD/0MWNGmDQ2shJ8IuWe30ugiRUX+cT7yklnna11tQ1RkWPeNfs4OihQXC/DPr
f7lutsER29e7MTXPQE0kQjmfEVwIKAclB0u7DftPYSgbNUR1d+K6icW0GJ1djEeL3493j1Ysa4Pb
K8o2yVXEUXAfRgzNfFcXwUc5razTdun4Yy4h0Ygw+sT9p+kCCLPoZkRJwURCXDhh8pIeytMNSjJi
0qvzAOzqycfFKsRMu97xYKAPDRnFBGRdAGnP9/e5ylrQNwYJvPwQpW1boGBKBCAUsIYHxLoJt3ir
7M8=
=vwfC
-----END PGP SIGNATURE-----

--------------XLj78G5Z1SQwYxTVY90xOhKM--
