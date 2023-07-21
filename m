Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B975D737
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EA410E708;
	Fri, 21 Jul 2023 22:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85010E09A;
 Fri, 21 Jul 2023 22:14:52 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-666e64e97e2so1554335b3a.1; 
 Fri, 21 Jul 2023 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689977692; x=1690582492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=dXrwI0f7BDKHLGwATVJjnhmJ48tgd3+2nr9dmXSF18o=;
 b=r3cG7lOFcoYQwf+fNGpD139Z1Covyp+2lo5zJD5XnTAf8/K2pT9/dUBD2deat8FKKY
 npfSKBeTWt4RQmlwADclDm3Xd4QSNgj7U/QuvE7Vkq1WJcsnq0VH2IZGR/0WuWD7+4su
 kiKtRxjosdCNcaRgSFvEgYafPhLPyLWkrbkuBDotW3bpA9q1EiSVmA2iZ4tTSqwy+x1V
 KiHpqELnKXUa/gYZKJKU3S/5o+DJixx9URsj4dgQ1EG8f6aW6uYrKfS/sYl7EHM94Nbo
 9uTZv8JxLxGV3Og6f1YzX10gR7qDoVLgNvBQMuU3LzHEcL3qr43+/kFZWh+cmYCbyOpe
 7O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689977692; x=1690582492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXrwI0f7BDKHLGwATVJjnhmJ48tgd3+2nr9dmXSF18o=;
 b=b3DlFcY7Dhopb+txK2nK38fjpBhCXOo/1QTi+9UnlEEaR8MEGSKIUQKHw4z1/Y5KqW
 vmdnP0pFJsLHrB55L/7O0BH37ObHFZvRf2tuvghl1xyw8gF5TSqbbgoM2L8hFokKPH+T
 +b/zV7gyymAR8R+K1vr+RWHe3zv0hwpJYb1n1/TJDPCjpDOagSFaglhHwdOL7x+Jbis3
 lYI164xsWtmydg1+HVo3f8iwjYFjwZNkHbzlWE3bJUm+88wzp5PSf4dulfEURlgx7Xuj
 LMaJhKvctWC5rK5mNXvmv2ELDyuAXDCjw4F6nFDRE8rkuV/yr4Pts30SGKq7FU5wl7ix
 OsvA==
X-Gm-Message-State: ABy/qLatWMepWbHhLgC+TldTvNRtMhcwf8xwGmIKb0UzbyxLncTtoVcX
 EXzovuwS8MtAAHu8u8ehSUU=
X-Google-Smtp-Source: APBJJlHoNi2MjEt7qTibhO+ffZRb9Yn/LK9ofBG7ZxnPqOG9HkkZfu+1e7w3xEKaYag4IjlOOLyZaw==
X-Received: by 2002:a05:6a00:80e:b0:67a:31b7:456c with SMTP id
 m14-20020a056a00080e00b0067a31b7456cmr1390223pfk.9.1689977691056; 
 Fri, 21 Jul 2023 15:14:51 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 d134-20020a63368c000000b0055be951145csm3613018pga.36.2023.07.21.15.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:14:50 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:14:49 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 08/17] drm/cgroup: Track DRM clients per cgroup
Message-ID: <ZLsDWcwTL9aE0-5h@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-9-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712114605.519432-9-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Jul 12, 2023 at 12:45:56PM +0100, Tvrtko Ursulin wrote:
> +void drmcgroup_client_migrate(struct drm_file *file_priv)
> +{
> +	struct drm_cgroup_state *src, *dst;
> +	struct cgroup_subsys_state *old;
> +
> +	mutex_lock(&drmcg_mutex);
> +
> +	old = file_priv->__css;
> +	src = css_to_drmcs(old);
> +	dst = css_to_drmcs(task_get_css(current, drm_cgrp_id));
> +
> +	if (src != dst) {
> +		file_priv->__css = &dst->css; /* Keeps the reference. */
> +		list_move_tail(&file_priv->clink, &dst->clients);
> +	}
> +
> +	mutex_unlock(&drmcg_mutex);
> +
> +	css_put(old);
> +}
> +EXPORT_SYMBOL_GPL(drmcgroup_client_migrate);

So, you're implicitly migrating the fd to the latest ioctl user on the first
access. While this may work for state-less control like usage time. This
likely will cause problem if you later want to add stateful control for
memory consumption. e.g. What happens if the new destination doesn't have
enough budget to accommodate the fd's usage? Let's say we allow over-commit
with follow-up reclaim or oom kill actions, if so, can we guarantee that all
memory ownership for can always be updated? If not, what happens after
failure?

If DRM needs to transfer fd ownership with resources attached to it, it
likely would be a good idea to make that an explicit operation so that the
attempt can be verified and failed if necessary.

Thanks.

-- 
tejun
