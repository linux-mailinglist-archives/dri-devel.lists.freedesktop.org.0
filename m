Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED15A02F98
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 19:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECCB10E02B;
	Mon,  6 Jan 2025 18:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Nhk54qT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88A910E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 18:15:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3862a921123so9883839f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 10:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736187245; x=1736792045; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iyGA4lAiCzsKD8bpG2OLbm7SvOEgsIMLWbFXGinwzoo=;
 b=Nhk54qT4h1BUSYNAUmEiyikXvmkFbGbuZQPHKo3iid6iVGgXRlqDOHvA5Gq9cCCwdu
 BEew3di1vOj7M+f+VROlinJIGLI1Kuog64J1FjMoG5tNP6Gc777sgYoKuIUWCQZI7EYQ
 q0nXMi1ue0qSla1E50SHbPisVW7NkPNukfDcbFwR10DGS+MNDGRc3gt/rI2ZN9Jsupjx
 Losz4l3jkg4EkCWCCRCHziky0deNQkaEZfy0wAwVm1caR4YNBVMf6MWS1vExZ6MFaV7S
 D+d/V2+tJbmc9Y5T+gjsFDni+qLdEjuNCi0q10KOJODqkn6nJ8j1BSj1dT5g/m9qWF+1
 LiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187245; x=1736792045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyGA4lAiCzsKD8bpG2OLbm7SvOEgsIMLWbFXGinwzoo=;
 b=TFci1RLc/OgDY9SGiNFpHOFhGCAdtyIEvoll581xrv7bmXgjr+QmiKyG0RRsGcEfdB
 B/ff5JkEIXi7bBb4geSQFoqEWFyd8BcKDHE/7PBGghPYnBaDah/8+GUi5TG5z/5VCXmI
 wHMZsgEnhvAdciHuG9biIutsSBS0PJVeTfDD1cgYhX5kCQW1q/00XW+oEUaDvkdSQfTT
 uk4YdHGgynmVvHqex5s27rnWp/+orkw+aJdYtfrccyY2isEYUJMvx9+BjZjbQYmEf9rW
 NyLJZOdXZiqog3M0icn9bDhfCn5whg0tQbyYb+g8EsMwMwUsvCtYQ6VMsgv6/VtJB/vs
 FQkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNzLoN4MgHq2WEIvw7hMoydp1tMDwcIOO1AQXbgHFQ/7aYrzBsKi/SfEePvmzRbndVMKsQcX7Ju6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6N5m/LgjRyUhH4Wm/q2fR2RATNGeqd8+cxw/vqlTc6D66d1uG
 iWFMas2a1GPS49iY2Q0x807DWlTzJAhhM5cwsPdoBXmcF/kmeYeCgfW0LhSKPNvDfJVAcYHsOUS
 R
X-Gm-Gg: ASbGncuvfB40cl3bwDgmmxIkC971HHD5LSAgjUfz4X0M72wg0NfD2rtlLzkU0Ljlayb
 mnfUOiCe2ep8+cKEgR551rPMcddjs5PY6Om/vofJkF6kKb/DgLOkFk3y2sctdbUycUFdRU3Vxvy
 N27uj6n+MVrrQ3fq41GYwGQIw7eLBNzy2B9Wh35ggM8vawidVSQUKugmDMa1sdW4X4CC5KL7pFk
 0BS8t20PTfT9CCQdDo5HC0XPyyMEMirq4eVEQUPKJ8TJ8s5A40tEwaIlaI=
X-Google-Smtp-Source: AGHT+IGkwIuJtbwbUThZtAjQyXw8sV6HWFXnREb8nnP6DrTXZ11YQLIKmj95wr8m/cODFINVqbqcRA==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id
 5b1f17b1804b1-43690d46037mr324429325e9.6.1736185713421; 
 Mon, 06 Jan 2025 09:48:33 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289d3dsm580766155e9.41.2025.01.06.09.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 09:48:33 -0800 (PST)
Date: Mon, 6 Jan 2025 18:48:31 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/7] kernel/cgroup: Add "dmem" memory accounting cgroup
Message-ID: <uj6railxyazpu6ocl2ygo6lw4lavbsgg26oq57pxxqe5uzxw42@fhnqvq3tia6n>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241204134410.1161769-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3gfwd2ja7fjanltd"
Content-Disposition: inline
In-Reply-To: <20241204134410.1161769-2-dev@lankhorst.se>
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


--3gfwd2ja7fjanltd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/7] kernel/cgroup: Add "dmem" memory accounting cgroup
MIME-Version: 1.0

Hello.

On Wed, Dec 04, 2024 at 02:44:01PM +0100, Maarten Lankhorst <dev@lankhorst.=
se> wrote:
> +bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *lim=
it_pool,
> +				      struct dmem_cgroup_pool_state *test_pool,
> +				      bool ignore_low, bool *ret_hit_low)
> +{
> +	struct dmem_cgroup_pool_state *pool =3D test_pool;
> +	struct page_counter *climit, *ctest;
> +	u64 used, min, low;
> +
> +	/* Can always evict from current pool, despite limits */
> +	if (limit_pool =3D=3D test_pool)
> +		return true;
> +

> +	if (limit_pool) {
> +		if (!parent_dmemcs(limit_pool->cs))
> +			return true;
> +
> +		for (pool =3D test_pool; pool && limit_pool !=3D pool; pool =3D pool_p=
arent(pool))
> +			{}
> +
> +		if (!pool)
> +			return false;
> +	} else {
> +		/*
> +		 * If there is no cgroup limiting memory usage, use the root
> +		 * cgroup instead for limit calculations.
> +		 */
> +		for (limit_pool =3D test_pool; pool_parent(limit_pool); limit_pool =3D=
 pool_parent(limit_pool))
> +			{}
> +	}

I'm trying to understand the two branches above. If limit_pool is a root
one, eviction is granted and no protection is evaluated.

Then it checks that test_pool is below limit_pool (can this ever fail,
given the limit_pool must have been above when charging in test_pool?).
(OK, this may be called arbitrarily by modules.)

I think it could be simplified and corrected like this:

	/* Resolve NULL limit_pool */
	if (!limit_pool)
		for (limit_pool =3D test_pool; pool_parent(limit_pool); limit_pool =3D po=
ol_parent(limit_pool));
=09
	/* Check ancestry */
	if (!cgroup_is_descendant(test_pool->cs->css.cgroup, limit_pool->cs->css.c=
group))
		return false;

HTH,
Michal

--3gfwd2ja7fjanltd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ3wXbAAKCRAt3Wney77B
Sc3yAP9ovqhdPX1shEVmXcwsztc0uf1lRR+Wsxf3kwK/GFzF/AEA62OrZTWy+e7K
cKrPC5As6ORKo4sBmoUVQk/+c0xCRgY=
=per/
-----END PGP SIGNATURE-----

--3gfwd2ja7fjanltd--
