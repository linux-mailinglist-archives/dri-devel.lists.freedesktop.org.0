Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07EA155BC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 18:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A1B10E1C5;
	Fri, 17 Jan 2025 17:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="QMl2+nX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5CA10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 17:30:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so16575835e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1737134967; x=1737739767; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jsXeTDpN3LmohLv7MAiOIweQD1yeDmykm13NwCHWMEg=;
 b=QMl2+nX7/noFGYH6qB8bncGdara5kCZfJMjmx3u6CAbJNE0Y44fcMUH6nvwBo5HRHt
 JRoQekbu2103IvT+aB0R1ZC7+TqoW3OSUEkBBTKHSih2eA5DncHg22qPKUEG0/HyXYAJ
 drQr1O+GmFT77tjUKfOYxrOE5vQ+GUnWVUfVmkSRCBvpa9vdMZNZKPQUufWJccxcyh/C
 O1qh8YJuPrqHRNo144uZPR03uJaqYnpkxQOM1PwK+HLkb/HoZAcQQuOsxxCXA0354kUe
 8eG8NlwVBJKkHdB2xiaQu8/dAJLaOwLeBNJAbURc7sC/HIoWru7jBLHf5ZzqqlCUuoym
 kdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737134967; x=1737739767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsXeTDpN3LmohLv7MAiOIweQD1yeDmykm13NwCHWMEg=;
 b=pg2YqFd+KW9Tb/V1TjVt6DKkHwReL81cpgXQLX7vlbeMS8ob7ywJ6fKda8GEkpMeSt
 ClWZuNamaor7lB/kDdLwi57wsWINUdGAC8AhlPopH6B6i1KtRub54ZWGlI5qzG5malr4
 rTAn+YwoxAOUlfNF3s2f5vEfMpzXec6IY2e0DD2cUvX6v8EQxMPsG30tmz5nDhiFej3K
 o0znsiTo/i/3n5xKbkQ35V909PYuJM+hP7XpWFS2UeWX+8d67So0ptKTaDFp2fEL0XO3
 LxlUyjhCHiRzfnTp+V/wqF2oSBrZ/knPRk76YwM8X2BVN8kEPVLOWliZ88WREQAAVk9e
 ZS7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZvB7MrmKFWaRY0ECbMOWXNrzl5e2AfMi0TLLU1irY2IfglYznXJ7r0WGSfuzOeUOYtxkpSCOOXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqkdLj8Vmdjs5eDfghAhLfGhpYb4UwEyVzTVooDczMqM+iaL3b
 VUZzWhRBpWBF2Mbh4g7CAlhzonP67Ibc5HZRGyTEAFWPS5eiioBPlhIdEUUOW1c=
X-Gm-Gg: ASbGncuAuNnQeEe3mB1ZuMOzt01SSUeRnSYNniBfm6Qq5yGOtzl3jK/1wHG/gIngh6H
 XAdnA+i5El+cpC40CT8xFVoxXsTBLIdtndi9C88j/FjhPCbvhT/4Yl8EG0iXl6O5WkXHpE7coG9
 HDLdPGpB4phU/mVWpPgik7ZVTfQShsijP3pNqK++hTyyvvmX8TN2iPtFyQGG2wTWglhIzAFw0E5
 nNytUx2kGlbEGD3dr1Wm9e5hVPMy2Hp2jKVoaS8+8ZlOJQR+mNv0uiPzUk=
X-Google-Smtp-Source: AGHT+IERF4iHOHPcbM5nuH3FJfAV1BNIQj1Wcp7xUmZ3b+laxqzqes1j3Dh3jvwp9n1JkYnyhv16EQ==
X-Received: by 2002:a05:600c:3542:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-4389145137dmr31233705e9.25.1737134967041; 
 Fri, 17 Jan 2025 09:29:27 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ace90sm101507705e9.16.2025.01.17.09.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 09:29:26 -0800 (PST)
Date: Fri, 17 Jan 2025 18:29:25 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Friedrich Vock <friedrich.vock@gmx.de>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
Message-ID: <oe3qgfb3jfzoacfh7efpvmuosravx5kra3ss67zqem6rbtctws@5dmmklctrg3x>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
 <4d6ccc9a-3db9-4d5b-87c9-267b659c2a1b@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7hm3w7xjc6ubac3y"
Content-Disposition: inline
In-Reply-To: <4d6ccc9a-3db9-4d5b-87c9-267b659c2a1b@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7hm3w7xjc6ubac3y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 09:20:08AM +0100, Friedrich Vock <friedrich.vock@gm=
x.de> wrote:
> These pools are allocated on-demand, so if a
> cgroup has not made any allocations for a specific device, there will be
> no pool corresponding to that device's memory.

Here I understand.

> Pools have a hierarchy of their own (that is, for a given cgroup's
> pool corresponding to some device, the "parent pool" refers to the
> parent cgroup's pool corresponding to the same device).
>=20
> In dmem_cgroup_calculate_protection, we're trying to update the
> protection values for the entire pool hierarchy between
> limit_pool/test_pool (with the end goal of having accurate
> effective-protection values for test_pool).

If you check and bail out at start:
	if (!cgroup_is_descendant(test_pool->cs->css.cgroup, limit_pool->cs->css.c=
group))
		return;
=2E..

> Since pools only store parent pointers to establish that hierarchy, to
> find child pools given only the parent pool, we iterate over the pools
> of all child cgroups and check if the parent pointer matches with our
> current "parent pool" pointer.
=20
> The bug happens when some cgroup doesn't have any pool in the hierarchy
> we're iterating over (that is, we iterate over all pools but don't find
> any pool whose parent matches our current "parent pool" pointer).

=2E..then the initial check ensures, you always find a pool that is
a descendant of limit_pool (at least the test_pool).
And there are pools for whole path between limit_pool and test_pool, or
am I mistaken here?

> The cgroup itself is part of the (cgroup) hierarchy, so the result of
> cgroup_is_descendant is obviously true - but because of how we
> allocate pools on-demand, it's still possible there is no pool that is
> part of the (pool) hierarchy we're iterating over.

Can there be a pool without cgroup?

Thanks,
Michal

--7hm3w7xjc6ubac3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ4qTcwAKCRAt3Wney77B
SXjDAQCncLM/XCLLSWKy6chCwIjuq/y0pPpusJ/lNYAoUxKz/AD+KrmKYQl6E53c
NXucf48+OersRlcXPZxZtqCIfNK3PQ0=
=tx46
-----END PGP SIGNATURE-----

--7hm3w7xjc6ubac3y--
