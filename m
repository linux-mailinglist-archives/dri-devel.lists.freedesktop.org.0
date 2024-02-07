Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69DD84CDFD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 16:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E93C10E43C;
	Wed,  7 Feb 2024 15:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="iHJI7Px6";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="iHJI7Px6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96A10E43C;
 Wed,  7 Feb 2024 15:28:27 +0000 (UTC)
Received: from blackpad (unknown [10.100.12.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84B441F78D;
 Wed,  7 Feb 2024 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1707319705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0otgvNBb5KzjRCm8rrIOZU3r4HHRV/yk8Qfy0AQY/sk=;
 b=iHJI7Px6VMDyc9rNu9eZ6ZCRJb6Jbq6e1Ey8E7XA07Tt06+5agi3al/a/Aw2j+gCYaV5z+
 vcCdbjAxT9mxbywgCjlI/BX54JcWfXWbrdrRAcQSQe1HGKsM4Qby8kaK1FX/ChLGB/KhG7
 NjbflrpgVNLGrtxwWlNulz94PyoSvWI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1707319705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0otgvNBb5KzjRCm8rrIOZU3r4HHRV/yk8Qfy0AQY/sk=;
 b=iHJI7Px6VMDyc9rNu9eZ6ZCRJb6Jbq6e1Ey8E7XA07Tt06+5agi3al/a/Aw2j+gCYaV5z+
 vcCdbjAxT9mxbywgCjlI/BX54JcWfXWbrdrRAcQSQe1HGKsM4Qby8kaK1FX/ChLGB/KhG7
 NjbflrpgVNLGrtxwWlNulz94PyoSvWI=
Date: Wed, 7 Feb 2024 16:28:24 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Rob Clark <robdclark@chromium.org>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, 
 "T . J . Mercier" <tjmercier@google.com>, Kenny.Ho@amd.com, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Brian Welty <brian.welty@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [RFC 1/8] cgroup: Add the DRM cgroup controller
Message-ID: <7oxj33pfscydm6vgdpl5vppxbx5htqg6rjfyd7qyg27p3bu2gk@wzl3x3dgurom>
References: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
 <20231024160727.282960-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4wkez2ktgloibqzk"
Content-Disposition: inline
In-Reply-To: <20231024160727.282960-2-tvrtko.ursulin@linux.intel.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.24 / 50.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 R_RATELIMIT(0.00)[to_ip_from(RLo1h4tb73ac66wms7hnks9h9b)];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 RCPT_COUNT_TWELVE(0.00)[17];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:~]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-1.54)[92.03%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.24
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


--4wkez2ktgloibqzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Tue, Oct 24, 2023 at 05:07:20PM +0100, Tvrtko Ursulin <tvrtko.ursulin@li=
nux.intel.com> wrote:
> +struct drm_cgroup_state {
> +	struct cgroup_subsys_state css;
> +};
> +
> +struct drm_root_cgroup_state {
> +	struct drm_cgroup_state drmcs;
> +};
> +
> +static struct drm_root_cgroup_state root_drmcs;

Special struct type for root state is uncommon.
Have=20
struct drm_cgroup_state root_drmcs;
and possible future members can be global state variables.


> +static void drmcs_free(struct cgroup_subsys_state *css)
> +{
> +	struct drm_cgroup_state *drmcs =3D css_to_drmcs(css);
> +
> +	if (drmcs !=3D &root_drmcs.drmcs)
> +		kfree(drmcs);
> +}

I think it can be relied on root cgroup not being ever free'd by cgroup
core.

Michal

--4wkez2ktgloibqzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQpEWyjXuwGT2dDBqAGvrMr/1gcjgUCZcOhlgAKCRAGvrMr/1gc
jg8GAP4xhzIzp4cw/OdmjqaWeXT/ZMnZB9xNkDvNSnu+1WrU+wEA2fJ/0eG7EwFX
DwMdO1kNXwAxmU9NGjHLMO6Fd2AxegQ=
=50vt
-----END PGP SIGNATURE-----

--4wkez2ktgloibqzk--
