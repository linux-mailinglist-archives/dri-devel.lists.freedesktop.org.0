Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F66A1B31F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE6D10E93D;
	Fri, 24 Jan 2025 09:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="RtM3Uwup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BBF10E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:56:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso12305345e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1737712569; x=1738317369; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HFtaZY6ZZraVAs4Am9Vg5xV1oypKfUrqh6METYm11sk=;
 b=RtM3Uwup9zuXp6l6XAg+z1L9QhwS0F19a1um+5uObDmuM4ZXiR1iFtf34EiM9zTrJS
 1JKAN7ufQKMTaZ4yM29qSZojswyqG4UlnyN6dAlvlxmw7WA5lYM/4fJDcsZCBV/t2QAp
 TQn8iyAw3JQPm+iOX0o4FpIYG8VBlQVWuY8e2hYMt9N/BArZTUIs/k9tycJc/KD3blAR
 CpEBkrB5V0jW/l9Skt/fFF/h66pOUJZ9ToyMmQRBzpWtFYkU7hwIyMWMaUzesRuDvJDo
 9g1RtNEmkwxgyl/b0jsLZJDgXgS6TXa8jBs8njzxTIu0PyzzaD1PPE5hfrcraz5/DNXW
 Si3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737712569; x=1738317369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFtaZY6ZZraVAs4Am9Vg5xV1oypKfUrqh6METYm11sk=;
 b=fcmAppKRUGWEAqLSseMqIbrIhgnWHPpp/gFxJxh5lI03oGLb1MWtMF7fmDJishTgre
 CiAPDcHb3jr/OrW9pj1ywXnINARCwiW2Yad0vGHkv+9dgSMYPv+8eDEzjJd9bqxAooCt
 ulGHc3p3MYKT+vB6+zEgFOl6RslZScyEK+zJwpJSucPLCnqccqp4K2kwFbhGAFS4ujnx
 Qp9sknUQX8ycWFNSDBYohvqxUSr9sCvFx6nCTXHnpZ0AslsSzOmeezkrO1y0Nddl4dl9
 WJz+EaO+/H7d7a9OoHauHeKVhehCHhT+EpidV43QHvdDQTennblbD/sTLdR3VaKT0J7k
 ceBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMx+0pXrQB0tIfuIx94ZrYFxC2ApwYivIEyCDwB2w2Q3OUFnQdsFMDmadYvEJUM4I1zYugKRRFqmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpjMgQof95C+LSSFxBQ8ae+1RMJU6jkg1FDTLDiAv66luqEiCS
 eOSgjDHkKRBtuNjOX8JjSpN7CnoHe/yHEFHwBnhKF4H2/dv98SVkR3cvYyNPsQI=
X-Gm-Gg: ASbGncswm+JtQCnvAtv5RHqEjSNZc2GuPP4htms8CcKagbhmjYR0BgNPrvikxqQ9CYd
 vBt24/pUKqET9Guj7V3eNeL4q6gkKq0EykLKgy5x3JMrMF9KXKvhJvVN1RU8BvXdDE8Ffk77n5m
 jOJuzoTMzAVVPIsM0bYlPFYLy1YEgthXWFv0IEhTH21gqTkOswROUgjtS5gsZxQQpE7a6NxiSlp
 l9p1aMIMkEkLrZFscsd4clbHBoqXmIVT615gwoFKY8IcULyyHSTVYavABhvtCv/VXvzQaOkpUek
 G975DymhXb5cXHnzEw==
X-Google-Smtp-Source: AGHT+IGxpw5taskk35HLdhUeYYcYpfgCX2aqes5gSqbZ3vWLljthfE6j/dI9FbVrsv4Q3UQvxshbzw==
X-Received: by 2002:a05:600c:63ce:b0:437:c453:ff19 with SMTP id
 5b1f17b1804b1-438bd0bd5eemr23052955e9.14.1737712569291; 
 Fri, 24 Jan 2025 01:56:09 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd507c59sm20351855e9.17.2025.01.24.01.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:56:08 -0800 (PST)
Date: Fri, 24 Jan 2025 10:56:07 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Friedrich Vock <friedrich.vock@gmx.de>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
Message-ID: <qu3jdiik2sfstey4ecxdojndkzb5gzblg37i76p43xccnotawl@jlbafrgjad2x>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
 <4d6ccc9a-3db9-4d5b-87c9-267b659c2a1b@gmx.de>
 <oe3qgfb3jfzoacfh7efpvmuosravx5kra3ss67zqem6rbtctws@5dmmklctrg3x>
 <672de60e-5c10-406b-927c-7940d2fbc921@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6hrt3edpenmuek2m"
Content-Disposition: inline
In-Reply-To: <672de60e-5c10-406b-927c-7940d2fbc921@gmx.de>
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


--6hrt3edpenmuek2m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 08:02:55PM +0100, Friedrich Vock <friedrich.vock@gm=
x.de> wrote:
> Yeah, there are pools for the whole path between limit_pool and
> test_pool, but the issue is that we traverse the entire tree of cgroups,
> and we don't always stay on the path between limit_pool and test_pool
> (because we're iterating from the top down, and we don't know what the
> path is in that direction - so we just traverse the whole tree until we
> find test_pool).
>=20
> This means that we'll sometimes end up straying off-path - and there are
> no guarantees for which pools are present in the cgroups we visit there.
> These cgroups are the potentially problematic ones where the issue can
> happen.
>=20
> Ideally we could always stay on the path between limit_pool and
> test_pool, but this is hardly possible because we can only follow parent
> links (so bottom-up traversal) but for accurate protection calculation
> we need to traverse the path top-down.

Aha, thanks for bearing with me.

	css_foreach_descendant_pre(css, limit_pool->cs->css) {
		dmemcg_iter =3D container_of(css, struct dmemcg_state, css);

		struct dmem_cgroup_pool_state *found_pool =3D NULL;
		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
			if (pool->region =3D=3D limit_pool->region) {
				found_pool =3D pool
				break;
			}
		}
		if (!found_pool)
			continue;

		page_counter_calculate_protection(
			climit, &found->cnt, true);
	}

Here I use (IMO) more idiomatic css_foreach_descendant_pre() instead and
I use the predicate based on ->region (correct?) to match pool's
devices.

Would that work as intended?

Michal

--6hrt3edpenmuek2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5NjtQAKCRAt3Wney77B
Sb9kAQDx2dXNJx0ji8l5wnSMZa+EVuGB9ub0rZlAyG+KV+9M2QD/d5JuUzDjSqnA
KJTKp7PQu58CspZeNoeZdl8PWueJHwQ=
=2rqU
-----END PGP SIGNATURE-----

--6hrt3edpenmuek2m--
