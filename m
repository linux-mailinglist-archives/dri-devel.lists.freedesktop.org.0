Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7F3BA9E8
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 19:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA0589E41;
	Sat,  3 Jul 2021 17:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44E89E41;
 Sat,  3 Jul 2021 17:55:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B20C0202B2;
 Sat,  3 Jul 2021 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625334932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uI52YLNP3FCGKMnKvvgPowzdKVuPV7uklQfR3jIBKAM=;
 b=embQpKyDoen3PvEV7FVN/k+DsIDafm9XED2V/rww3P2RP8bWv/TqiDfuYQBldZEKU8VRyi
 hhH+MIzH8/gSJp35OXJdH/IUwW3Ad1VDuZPltEB/a0GbQJRMWRTD7raC33Ch6B/3j/KZky
 oNqVVNcHQGPn+/c5dzDV1p+Wl5pZ/1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625334932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uI52YLNP3FCGKMnKvvgPowzdKVuPV7uklQfR3jIBKAM=;
 b=4/YKTUx3CVroFiPp8e6EJZaYQqL4CHzBNJDWB8YeyG9EvGj27Aa4utJdlAlk+Sk/ksUjNx
 lYxoBkUwAk+uHJBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 659D31348A;
 Sat,  3 Jul 2021 17:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b2AeF5Sk4GCFCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 03 Jul 2021 17:55:32 +0000
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210701173618.10718-1-tzimmermann@suse.de>
 <YN9uPeqktqiqfXc6@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 0/2] drm/i915: IRQ fixes
Message-ID: <4e4e067c-4662-aac1-bee6-6124d35f543e@suse.de>
Date: Sat, 3 Jul 2021 19:55:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN9uPeqktqiqfXc6@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rBPbtkrhevjCJz0ZV5sK5MELkehwE0V3b"
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
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rBPbtkrhevjCJz0ZV5sK5MELkehwE0V3b
Content-Type: multipart/mixed; boundary="Icz3tMJMHblGcroOyrsiKybLehPkYPZQo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, chris@chris-wilson.co.uk,
 mika.kuoppala@linux.intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, lucas.demarchi@intel.com,
 ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <4e4e067c-4662-aac1-bee6-6124d35f543e@suse.de>
Subject: Re: [PATCH v5 0/2] drm/i915: IRQ fixes
References: <20210701173618.10718-1-tzimmermann@suse.de>
 <YN9uPeqktqiqfXc6@phenom.ffwll.local>
In-Reply-To: <YN9uPeqktqiqfXc6@phenom.ffwll.local>

--Icz3tMJMHblGcroOyrsiKybLehPkYPZQo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.07.21 um 21:51 schrieb Daniel Vetter:
> On Thu, Jul 01, 2021 at 07:36:16PM +0200, Thomas Zimmermann wrote:
>> Fix a bug in the usage of IRQs and cleanup references to the DRM
>> IRQ midlayer.
>>
>> Preferably this patchset would be merged through drm-misc-next.
>>
>> v5:
>> 	* go back to _hardirq() after CI tests reported atomic
>> 	  context in PCI probe; add rsp comment
>> v4:
>> 	* switch IRQ code to intel_synchronize_irq() (Daniel)
>> v3:
>> 	* also use intel_synchronize_hardirq() from other callsite
>> v2:
>> 	* split patch
>> 	* also fix comment
>> 	* add intel_synchronize_hardirq() (Ville)
>> 	* update Fixes tag (Daniel)
>=20
> Ok now I actually pushed the right patch set.

Oh, I messed up. I forgot to reset the commit message in patch 1 v5.=20
It's for v4 and contains the opposite of what's actually happening.

Is it too late to fix this? If you can force-push into the branch, maybe =

simply replace the current message with the one for v3. [1]

Best regards
Thomas

[1] https://patchwork.freedesktop.org/patch/441954/?series=3D92054&rev=3D=
2

> -Daniel
>=20
>>
>> Thomas Zimmermann (2):
>>    drm/i915: Use the correct IRQ during resume
>>    drm/i915: Drop all references to DRM IRQ midlayer
>>
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_ring_submission.c |  7 +++++--
>>   drivers/gpu/drm/i915/i915_drv.c                 |  1 -
>>   drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
>>   drivers/gpu/drm/i915/i915_irq.h                 |  1 +
>>   5 files changed, 12 insertions(+), 9 deletions(-)
>>
>>
>> base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
>> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
>> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
>> prerequisite-patch-id: 0cca17365e65370fa95d193ed2f1c88917ee1aef
>> prerequisite-patch-id: 12b9894350a0b56579d29542943465ef5134751c
>> prerequisite-patch-id: 3e1c37d3425f4820fe36ea3da57c65e166fe0ee5
>> prerequisite-patch-id: 1017c860a0bf95ce370d82b8db1745f5548fb321
>> prerequisite-patch-id: dcc022baab7c172978de9809702c2f4f54323047
>> prerequisite-patch-id: 0d05ee247042b43d5ab8f3af216e708a8e09bee8
>> prerequisite-patch-id: 110c411161bed6072c32185940fcd052d0bdb09a
>> prerequisite-patch-id: d2d1aeccffdfadf2b951487b8605f59c795d84cf
>> prerequisite-patch-id: 85fe31e27ca13adc0d1bcc7c19b1ce238a77ee6a
>> prerequisite-patch-id: c61fdacbe035ba5c17f1ff393bc9087f16aaea7b
>> prerequisite-patch-id: c4821af5dbba4d121769f1da85d91fbb53020ec0
>> prerequisite-patch-id: 0b20ef3302abfe6dc123dbc54b9dd087865f935b
>> prerequisite-patch-id: d34eb96cbbdeb91870ace4250ea75920b1653dc2
>> prerequisite-patch-id: 7f64fce347d15232134d7636ca7a8d9f5bf1a3a0
>> prerequisite-patch-id: c83be7a285eb6682cdae0df401ab5d4c208f036b
>> prerequisite-patch-id: eb1a44d2eb2685cea154dd3f17f5f463dfafd39a
>> prerequisite-patch-id: 92a8c37dae4b8394fd6702f4af58ac7815ac3069
>> prerequisite-patch-id: f0237988fe4ae6eba143432d1ace8beb52d935f8
>> prerequisite-patch-id: bcf4d29437ed7cb78225dec4c99249eb40c18302
>> prerequisite-patch-id: 6407b4c7f1b80af8d329d5f796b30da11959e936
>> prerequisite-patch-id: 4a69e6e49d691b555f0e0874d638cd204dcb0c48
>> prerequisite-patch-id: be09cfa8a67dd435a25103b85bd4b1649c5190a3
>> prerequisite-patch-id: 813ecc9f94251c3d669155faf64c0c9e6a458393
>> prerequisite-patch-id: beb2b5000a1682cbd74a7e2ab1566fcae5bccbf0
>> prerequisite-patch-id: 754c8878611864475a0b75fd49ff38e71a21c795
>> prerequisite-patch-id: d7d4bac3c19f94ba9593143b3c147d83d82cb71f
>> prerequisite-patch-id: 983d1efbe060743f5951e474961fa431d886d757
>> prerequisite-patch-id: 3c78b20c3b9315cd39e0ae9ea1510c6121bf9ca9
>> --
>> 2.32.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Icz3tMJMHblGcroOyrsiKybLehPkYPZQo--

--rBPbtkrhevjCJz0ZV5sK5MELkehwE0V3b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDgpJMFAwAAAAAACgkQlh/E3EQov+Bo
BA//UdNoIZ8WQdxJdtXinHI0Xzo4wh8xZ/Ips0SsML9xt2N7t9EuHAzjZ9CzLWJFD76+k6P/i2R6
F0rZPgrik8DfHRys8/+bdGmpq43gotza6SMe02PwU0ZGPvbigz5Sb3vo0XFX69DR2ab0BytYDRrX
0tp8kWIs1GlF68Kg/KupnT6FZmk0/FMazXI76zNg6P/H1HfqM49uKpXWyrQYXl8cjnjsgWB78hN3
CONMVMdQNM1y+EqPgzx46pVEQYKSF/vR5zIgCehNHmrmo73ReG0QZ5AsV25ddxjOpnl4Wkmyf9j+
JI+hRY+GtGv2dh1APbW2Ysp1trlBMQcl/M27K2jzmCKd38hcXNmc8DuqcCI3uKVP9AMYl/M5Ls4v
BhG4xpPOCv0nm9yr9CxwUQJBPaYq3QfGvcnHOV1l4Cbh5yzXF433AoJYvaZkaHncCwTgO1K08dkq
51zo4ApgpcYjfy1kIIqWfupinst/ptRsT4X+4wchpIcXAQDNgoNqIGPv1mRtfxAzecNqORc2PecK
RJz2hYfvX30O9TvbJo5b07LhI0uEE0zVJYvBhYN8wLiGf0YVW2X+mIfSfZPgzTE95q6J1Uy74Xdg
DjzAmHqDKZT84i67DBeKmH3KUwD/z64qjYSI7t5QiGyjxDOub2a7kaXR/o73jIV4IqDYL81iDXoW
Z8o=
=Lqi8
-----END PGP SIGNATURE-----

--rBPbtkrhevjCJz0ZV5sK5MELkehwE0V3b--
