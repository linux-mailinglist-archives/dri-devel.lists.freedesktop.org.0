Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1284CDFB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 16:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0181130F1;
	Wed,  7 Feb 2024 15:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="RK8a8e4Z";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RK8a8e4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41D11328C;
 Wed,  7 Feb 2024 15:28:15 +0000 (UTC)
Received: from blackpad (unknown [10.100.12.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 572E01F78D;
 Wed,  7 Feb 2024 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1707319693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG/hj8s6PyM2n6N1CqZ5VTCYc2mwIugAjTnkUwcdcHA=;
 b=RK8a8e4Z1cunI2tPdDFEaFnnzYSULcUPJtvRoMPGmqGqp5oJelwkP28/gyweQP9ldjXZCX
 Bl9t30qarBFPMrxG073RbyhJRFuBm1rYMlJHZUHxS/7au/8YH/2HFEwbAeyrc4PMiPNP/D
 cDdITAmsvkMn5PRcFMl/ShLK+GzLOIc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1707319693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG/hj8s6PyM2n6N1CqZ5VTCYc2mwIugAjTnkUwcdcHA=;
 b=RK8a8e4Z1cunI2tPdDFEaFnnzYSULcUPJtvRoMPGmqGqp5oJelwkP28/gyweQP9ldjXZCX
 Bl9t30qarBFPMrxG073RbyhJRFuBm1rYMlJHZUHxS/7au/8YH/2HFEwbAeyrc4PMiPNP/D
 cDdITAmsvkMn5PRcFMl/ShLK+GzLOIc=
Date: Wed, 7 Feb 2024 16:28:12 +0100
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
Subject: Re: [RFC 6/8] cgroup/drm: Introduce weight based drm cgroup control
Message-ID: <lisfkz7wwhwwe3wkc76ufemlotaguuxslymtz6gxfreu62u65z@dsa3zpaxtjo3>
References: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
 <20231024160727.282960-7-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="apxwvyorjkqn4u25"
Content-Disposition: inline
In-Reply-To: <20231024160727.282960-7-tvrtko.ursulin@linux.intel.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.90
X-Spamd-Result: default: False [-2.90 / 50.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,text/plain];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_TWELVE(0.00)[17];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:~]; MID_RHS_NOT_FQDN(0.50)[]
X-Spam-Flag: NO
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


--apxwvyorjkqn4u25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

(I hope I'm replying to the latest iteration and it has some validitiy
still. Sorry for my late reply. Few points caught my attention.)

On Tue, Oct 24, 2023 at 05:07:25PM +0100, Tvrtko Ursulin <tvrtko.ursulin@li=
nux.intel.com> wrote:
> @@ -15,10 +17,28 @@ struct drm_cgroup_state {
>  	struct cgroup_subsys_state css;
> =20
>  	struct list_head clients;
> +
> +	unsigned int weight;
> +
> +	unsigned int sum_children_weights;
> +
> +	bool over;
> +	bool over_budget;
> +
> +	u64 per_s_budget_us;

Nit: sounds reversed (cf USEC_PER_SEC).

> +static int drmcg_period_ms =3D 2000;
> +module_param(drmcg_period_ms, int, 0644);
> +

cgroup subsystems as loadable modules were abandoded long time ago.
I'm not sure if this works as expected then.
The common way is __seutp(), see for instance __setup() in mm/memcontrol.c

> +static bool __start_scanning(unsigned int period_us)
=2E..
> +	css_for_each_descendant_post(node, &root->css) {
> +		struct drm_cgroup_state *drmcs =3D css_to_drmcs(node);
> +		struct drm_cgroup_state *parent;
> +		u64 active;
> +
> +		if (!css_tryget_online(node))
> +			goto out;
> +		if (!node->parent) {
> +			css_put(node);
> +			continue;
> +		}

I think the parent check can go first witout put'ting (RCU is enough for
node).

> +		if (!css_tryget_online(node->parent)) {
> +			css_put(node);
> +			goto out;
> +		}

Online parent is implied onlined node. So this can be removed.

=2E..
> +
> +		css_put(node);
> +	}

I wonder if the first passes could be implemented with rstat flushing
and then only invoke signalling based on the data. (As that's
best-effort).

> +
> +	/*
> +	 * 4th pass - send out over/under budget notifications.
> +	 */
> +	css_for_each_descendant_post(node, &root->css) {
> +		struct drm_cgroup_state *drmcs =3D css_to_drmcs(node);
> +
> +		if (!css_tryget_online(node))
> +			goto out_retry;
> +
> +		if (drmcs->over || drmcs->over_budget)
> +			drmcs_signal_budget(drmcs,
> +					    drmcs->active_us,
> +					    drmcs->per_s_budget_us);
> +		drmcs->over_budget =3D drmcs->over;
> +
> +		css_put(node);
> +	}

>  static struct cgroup_subsys_state *
> @@ -82,6 +365,7 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
> =20
>  	if (!parent_css) {
>  		drmcs =3D &root_drmcs.drmcs;
> +		INIT_DELAYED_WORK(&root_drmcs.scan_work, scan_worker);

This reminds me discussion
https://lore.kernel.org/lkml/rlm36iypckvxol2edyr25jyo4imvlidtepbcjdaa2ouvwh=
3wjq@pqyuk3v2jesb/

I.e. worker needn't be initialized if controller is "invisible".

> +static void drmcs_attach(struct cgroup_taskset *tset)
> +{
> +	struct drm_cgroup_state *old =3D old_drmcs;
> +	struct cgroup_subsys_state *css;
> +	struct drm_file *fpriv, *next;
> +	struct drm_cgroup_state *new;
> +	struct task_struct *task;
> +	bool migrated =3D false;
> +
> +	if (!old)
> +		return;
> +
> +	task =3D cgroup_taskset_first(tset, &css);
> +	new =3D css_to_drmcs(task_css(task, drm_cgrp_id));
> +	if (new =3D=3D old)
> +		return;
> +
> +	mutex_lock(&drmcg_mutex);
> +
> +	list_for_each_entry_safe(fpriv, next, &old->clients, clink) {
> +		cgroup_taskset_for_each(task, css, tset) {
> +			struct cgroup_subsys_state *old_css;
> +
> +			if (task->flags & PF_KTHREAD)
> +				continue;

I'm curious, is this because of particular kthreads? Or would it fail
somehow below? (Like people should not migrate kthreads normally, so
their expectation cannot be high.)

Michal

--apxwvyorjkqn4u25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQpEWyjXuwGT2dDBqAGvrMr/1gcjgUCZcOhiQAKCRAGvrMr/1gc
juaFAP4gCQo3QiiI2lNlSE/BJ+GheTQygLXENfdfwal35LU3EwEAo1qL7Nqz3cT2
vM5wWH7kk9+bxFqs+xgymjg3vKXu8QU=
=aJfV
-----END PGP SIGNATURE-----

--apxwvyorjkqn4u25--
