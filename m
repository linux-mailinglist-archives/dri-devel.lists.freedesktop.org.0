Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B813BC5DA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 07:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2912189930;
	Tue,  6 Jul 2021 05:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072789930
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 05:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF02C223CF;
 Tue,  6 Jul 2021 05:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625547761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SIpMdj2nbAzsadWbJAqGlwYINQ6qoVirdKhNxMUwOc=;
 b=PXA8dYMMSFWV/QYjHnqTr7ntgcBxbJAbo18yuO5h6jqRVl8JCo7W53Uuv+uM9UsVMG12Dr
 ciXsJ5tlKDp2aCn8Ive34bK69oHHEPqziVLV3UuuUhv6hBJNlYbsRr91eqG7TJk9B2kZqq
 kOMQ0ZHKX/T/3Z5RW25x0xMJvhd85lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625547761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SIpMdj2nbAzsadWbJAqGlwYINQ6qoVirdKhNxMUwOc=;
 b=i5J0T3p4x1ka+H22EMLZmujFzXKix/1naDnf0z/zyXUIZTVQjBuJ8yrU9Wk3QNu2TSD82W
 BBKwjdgkmoH+MlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87E5413480;
 Tue,  6 Jul 2021 05:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lAQaIPHj42CpSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 05:02:41 +0000
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
To: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
 <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4c2dac42-672d-bbf2-32bc-592799be0963@suse.de>
Date: Tue, 6 Jul 2021 07:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eKk3Odes9FafvFP73Z1qmUifN3FslQapi"
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eKk3Odes9FafvFP73Z1qmUifN3FslQapi
Content-Type: multipart/mixed; boundary="mxdqxGyuYFQdB1RB5mHA2EoWxJBxyVVa1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com
Message-ID: <4c2dac42-672d-bbf2-32bc-592799be0963@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
 <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>
In-Reply-To: <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>

--mxdqxGyuYFQdB1RB5mHA2EoWxJBxyVVa1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.07.21 um 23:29 schrieb Melissa Wen:
> On 07/05, Daniel Vetter wrote:
>> On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 05.07.21 um 11:27 schrieb Daniel Vetter:
>>>> On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
>>>>> Vkms copies each plane's framebuffer into the output buffer; essent=
ially
>>>>> using a shadow buffer. DRM provides struct drm_shadow_plane_state, =
which
>>>>> handles the details of mapping/unmapping shadow buffers into memory=
 for
>>>>> active planes.
>>>>>
>>>>> Convert vkms to the helpers. Makes vkms use shared code and gives m=
ore
>>>>> test exposure to shadow-plane helpers.
>>>>>
>>>>> Thomas Zimmermann (4):
>>>>>     drm/gem: Export implementation of shadow-plane helpers
>>>>>     drm/vkms: Inherit plane state from struct drm_shadow_plane_stat=
e
>>>>>     drm/vkms: Let shadow-plane helpers prepare the plane's FB
>>>>>     drm/vkms: Use dma-buf mapping from shadow-plane state for compo=
sing
>>>>
>>>> So I think right now this fits, but I think it'll mismit going forwa=
rd: We
>>>> don't really have a shadow-plane that we then toss to the hw, it's a=

>>>> shadow-crtc-area. Right now there's no difference, because we don't
>>>> support positioning/scaling the primary plane. But that's all kinda =
stuff
>>>> that's on the table.
>>>>
>>>> But conceptually at least the compositioning buffer should bet part =
of the
>>>> crtc, not of the primary plane.
>>>>
>>>> So not sure what to do, but also coffee hasn't kicked in yet, so may=
be I'm
>>>> just confused.
>>>
>>> I'm not sure if I understand your concern. Can you elaborate? The
>>> compositing output buffer is not affected by this patchset. Only the =
input
>>> frambuffers of the planes. Those are shadow buffers. AFAICT the compo=
ser
>>> code memcpy's the primary plane and then blends the other planes on t=
op.
>>> Supporting transformation of the primary plane doesn't really change =
much
>>> wrt to the vmaping of input fbs.
>>
>> Yeah that's the current implementation, because that's easier. But
>> fundamentally we don't need a copy of the input shadow plane, we need =
a
>> scratch area that's sized for the crtc.
>=20
> Maybe I'm missing something, but I am not sure the relevance for vkms t=
o
> switch to shadow-buffered plane. (?)

It replaces the vkms code with shared code. Nothing else. For the shared =

shadow-buffer code it means more testing. If vkms ever supports color=20
formats that use multiple planes, the new code will be ready.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mxdqxGyuYFQdB1RB5mHA2EoWxJBxyVVa1--

--eKk3Odes9FafvFP73Z1qmUifN3FslQapi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDj4/EFAwAAAAAACgkQlh/E3EQov+BL
2g//Z716qz37+0pZPn5rBrKDO5JWMFXj9ib0D5c4JnBAobhRK2ZwWU0RZBwmzasCyyxnI4lxgJEN
oz1JkzNQI54juO0xMHh4JVnLokWrSo9mR++w3FOiqGem0GrazQ7I2SWD8VQgElMxwYQLVziTSniS
96Bnt2jrswfg6h9/5GqvCkmJHe0P2JjjZsHrE4+DPXHzUlXm2ReeU3sFcpPFxz1oppQ3n2/bNXrn
U18jTRKufcBBYKCM7SYrmg3jk5Fc5OGCuP1KUX7aovGDF5xzwHjv1pWdRKGaGpzf4hlCyu/H77z1
N7D4hsLcx2uDfMVrzawGf2P+UrV5yxeU9A+2z41EC3WCE5KeFhLQsjufw0/7aQIKuX3PmWvKyXmW
CyWV5wHCFlIci9OsxvaDPwx7w0h6ii9kRKMdBuG3yqCREmae7xZdVjndNnPMkth8jlMSTQy+Lla+
TTcPXEJRK1RwQQ1rxGicuyq820CjEKXqEz0b/h7FpJh0N+cqZMfPQ2lhj5NLySLScGo1kcP3a4ug
46n/LCfkVUlGk6uiy8ecAxyjImyGCjBzEfNU0K9296C+t+yE66aGwoqyQs8yVEwfOWaZcZ8nJIWV
3tbSNoBmPZHypizbPUt1MkFWN+i7EVzdOrY9WamFgXTb8CIxlTCIrOSRCVm9MHChltQcu4mxN5IQ
OYs=
=nDWq
-----END PGP SIGNATURE-----

--eKk3Odes9FafvFP73Z1qmUifN3FslQapi--
