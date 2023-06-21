Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A665737C9D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9E10E3E7;
	Wed, 21 Jun 2023 08:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7C010E3E7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:01:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A56A41F8B5;
 Wed, 21 Jun 2023 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687334508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVYDKVUBX5i3kBt8vecgcLJr7S0fB3THNZk19tZMOTc=;
 b=runiOXysrWgFaLZp3WyVVjqLY+Fbb7bwdTPXQxViSkoz+gCggDgRRXsCxF6Tys5N3Z/5fo
 vDDZXtDE+yZKSYyl6OhBlAnD6x6vfFq1yo484CTAoDR42iJ2LonIccaofDXM6fie+wWuQY
 idvQS09wZGdwiv62QGTMh2VBvHZ1UYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687334508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVYDKVUBX5i3kBt8vecgcLJr7S0fB3THNZk19tZMOTc=;
 b=62lWyr4KRBvcFzTUw1O9nq2L2UrfsAA62zfmiODslg9nZatf01EmeNDwjj8uZEG6qTQoUs
 CsMX3fq+fOrqrZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D522133E6;
 Wed, 21 Jun 2023 08:01:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AZ9xGWyukmRISAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 08:01:48 +0000
Message-ID: <d082dc9a-ba3c-bed0-0ccc-dde8c83db2dc@suse.de>
Date: Wed, 21 Jun 2023 10:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] drm/prime: Unexport helpers for fd/handle
 conversion
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, contact@emersion.fr, linux-graphics-maintainer@vmware.com,
 alexdeucher@gmail.com
References: <20230620080252.16368-1-tzimmermann@suse.de>
 <20230620080252.16368-4-tzimmermann@suse.de>
 <9e76793f-52c6-ea3a-536c-8e6d6b706e4c@quicinc.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9e76793f-52c6-ea3a-536c-8e6d6b706e4c@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0lT656gXqFuQSsh0b5FKr3MP"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0lT656gXqFuQSsh0b5FKr3MP
Content-Type: multipart/mixed; boundary="------------adJ5zqBxLJGiyVVCtFxoXJ3h";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, contact@emersion.fr, linux-graphics-maintainer@vmware.com,
 alexdeucher@gmail.com
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Message-ID: <d082dc9a-ba3c-bed0-0ccc-dde8c83db2dc@suse.de>
Subject: Re: [PATCH v2 3/3] drm/prime: Unexport helpers for fd/handle
 conversion
References: <20230620080252.16368-1-tzimmermann@suse.de>
 <20230620080252.16368-4-tzimmermann@suse.de>
 <9e76793f-52c6-ea3a-536c-8e6d6b706e4c@quicinc.com>
In-Reply-To: <9e76793f-52c6-ea3a-536c-8e6d6b706e4c@quicinc.com>

--------------adJ5zqBxLJGiyVVCtFxoXJ3h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjA2LjIzIHVtIDE3OjU1IHNjaHJpZWIgSmVmZnJleSBIdWdvOg0KPiBPbiA2
LzIwLzIwMjMgMTo1OSBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBVbmV4cG9y
dCBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSgpIGFuZCBkcm1fZ2VtX3ByaW1lX2hhbmRs
ZV90b19mZCgpLg0KPj4gQm90aCBhcmUgb25seSB1c2VkIGludGVybmFsbHkgd2l0aGluIHRo
ZSBQUklNRSBjb2RlLg0KPj4NCj4+IHYyOg0KPj4gwqDCoMKgwqAqIHJld29yZCBkb2NzIGFz
IGZ1bmN0aW9ucyBhcmUgbm93IHVuZXhwb3J0ZWQgKFNpbW9uKQ0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gUmV2
aWV3ZWQtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4NCj4+IEFja2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IA0KPiBSZXZp
ZXdlZC1ieTogSmVmZnJleSBIdWdvIDxxdWljX2podWdvQHF1aWNpbmMuY29tPg0KDQpUaGFu
a3MgYSBsb3QuDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------adJ5zqBxLJGiyVVCtFxoXJ3h--

--------------0lT656gXqFuQSsh0b5FKr3MP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSSrmsFAwAAAAAACgkQlh/E3EQov+C/
SA//cl6xahei57YJmdw3r8C8RnqQAFRMRH/5sew4DwWXtkzWpoYu0+tCmDQ3dTKLqiHzjtsd9zfE
zQvULL7cODQhSxNqlC3NovDiCAxHl+mVUhzWwWt4LcrxKJOQh3Lx6jUWtd57MBKbJFJ29JGhIjVq
DSMLRPRe1CAL4vYdQtjBldqxJkcXnzkU77F2arX/VHp/6oL6jLXokfvQj3Agk+ZhhGAIQdwBWcZD
HFKqla0rThWrZEcr39sPKNJkR2wiDyDxD/dWDFCs0Xp8foi2jhIVrMw014OlbIwSq5e8bcVgJfiH
6d4p/u2SD2QqLmGGZMCOmRtIznp2xe4xAUY0t9dCxly0LyZadSS15zzTym+uYO6L+hXF4NmVWmwQ
bYdcIkfpUr3VLEHFFbYU2pQnHAebsGGsVLYxz/WHkv9UpzmCnagN4KGHF3Kt+znrPrx5iGog1cB/
4h2V5GYYdoyuyrY6jL/cgd56e0Hq+u9/yjUkcq/amMtAK9u7lgGOlGZq6sJXi9ICB8qgHkzQdLYw
t6w4rjfxlKZQmIVoXdGbmgG1M58Yx16UuVhxOmN2caj5lPUUqMoPnTabFBjNtgSXUNQ3oWBz7wqJ
XPxGbCrbkZT8S+SsbgjXKkEjIAJjt9DG2VIEzzyIQ9BFh3fq2gnMhmiVQSFsBHzmq8hA34L4LoyB
454=
=qbN0
-----END PGP SIGNATURE-----

--------------0lT656gXqFuQSsh0b5FKr3MP--
