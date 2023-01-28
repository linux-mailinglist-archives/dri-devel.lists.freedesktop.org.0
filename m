Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0C67F38A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0C10E1BF;
	Sat, 28 Jan 2023 01:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9D910E1BF;
 Sat, 28 Jan 2023 01:11:22 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id z13so6646196plg.6;
 Fri, 27 Jan 2023 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=GkIPhMBlAguq3FpLF2bZhv+JUE0U4Yd9XqKOrWVb86U=;
 b=T/yjCD7aAOS7VSevYpoV8uPNqOX9/HTALgteOMMYgpyI3MhRyAu+YD3dWSItr3uMKd
 3GxM6KwOplc8c6T2VCDElYplaPui6ZBpurwTBcTp/88En30KDkoRkhGQXY2kDyN56U16
 YDo679wn6KpfLCufDkgvlAzyD2zTsSicSs0GZMqfZcjwhFhfqpbM1JCdXS323w1NVpfQ
 xMSXjIqAhLoFdyE5ztg6T0XEIj2653LI/UHlea/dw8asYDJFXYjh3wkPSbrQ+8Mw7s0q
 +Oz7NwncqTLmicgOYmqhSzXhfUKVBCVVefB/BmtsjrJJV7AuzKO8JXM3EvSbWhGK7ir6
 9vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkIPhMBlAguq3FpLF2bZhv+JUE0U4Yd9XqKOrWVb86U=;
 b=1SvQKvlmXxj6L0kSsfFvRwtTLErWXwriEeehUCpDY/RxMSz6sCur84d0oTN4zGgVhK
 AOsLvsJVaReSxigHylslV2PcvsJHOO05gT+GUQxs2O8yOuwEVNaTaVe0E2k7yPb2KSCk
 Z/hTys/hYJNJZsLlNM1rrGsJnFnW8JXHw4onJHOmKKflrfMbfOdAbh9rpFPuEk6YUoyv
 qQ3v+MNUEup3+gFDWHEqFPGg8RRu57oRI6H5FnUbewKWg3PRhCPjBX24U7tr/RVhmv6N
 G5Rio+UbUNGV8l6NG4JW4ZRF/d/QuDowMLikRXI0zPbnl+0fd06P0+mHWVFVWV2HpgE7
 kihA==
X-Gm-Message-State: AO0yUKWzb+rZqVKU4Pmu1wnokPQFMi7DJ2VGuY42FPoKfo0tNxYGEOR3
 sxmuuOY6v6Peyvair5UkxeY=
X-Google-Smtp-Source: AK7set9J1CD7FAmfqjLRocvv/S1+31usQXEqv6Nnbcx3pC8XJsLD4h2fRZMz2A/hmOdiPdbN4A3tgg==
X-Received: by 2002:a05:6a20:6991:b0:bb:bb46:bb9e with SMTP id
 t17-20020a056a20699100b000bbbb46bb9emr17951461pzk.39.1674868281358; 
 Fri, 27 Jan 2023 17:11:21 -0800 (PST)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 g27-20020aa796bb000000b0059242cd5469sm3355789pfk.13.2023.01.27.17.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 17:11:21 -0800 (PST)
Date: Fri, 27 Jan 2023 15:11:19 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 10/12] cgroup/drm: Introduce weight based drm cgroup control
Message-ID: <Y9R2N8sl+7f8Zacv@slm.duckdns.org>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230112165609.1083270-11-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112165609.1083270-11-tvrtko.ursulin@linux.intel.com>
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

On Thu, Jan 12, 2023 at 04:56:07PM +0000, Tvrtko Ursulin wrote:
...
> +	/*
> +	 * 1st pass - reset working values and update hierarchical weights and
> +	 * GPU utilisation.
> +	 */
> +	if (!__start_scanning(root, period_us))
> +		goto out_retry; /*
> +				 * Always come back later if scanner races with
> +				 * core cgroup management. (Repeated pattern.)
> +				 */
> +
> +	css_for_each_descendant_pre(node, &root->css) {
> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
> +		struct cgroup_subsys_state *css;
> +		unsigned int over_weights = 0;
> +		u64 unused_us = 0;
> +
> +		if (!css_tryget_online(node))
> +			goto out_retry;
> +
> +		/*
> +		 * 2nd pass - calculate initial budgets, mark over budget
> +		 * siblings and add up unused budget for the group.
> +		 */
> +		css_for_each_child(css, &drmcs->css) {
> +			struct drm_cgroup_state *sibling = css_to_drmcs(css);
> +
> +			if (!css_tryget_online(css)) {
> +				css_put(node);
> +				goto out_retry;
> +			}
> +
> +			sibling->per_s_budget_us  =
> +				DIV_ROUND_UP_ULL(drmcs->per_s_budget_us *
> +						 sibling->weight,
> +						 drmcs->sum_children_weights);
> +
> +			sibling->over = sibling->active_us >
> +					sibling->per_s_budget_us;
> +			if (sibling->over)
> +				over_weights += sibling->weight;
> +			else
> +				unused_us += sibling->per_s_budget_us -
> +					     sibling->active_us;
> +
> +			css_put(css);
> +		}
> +
> +		/*
> +		 * 3rd pass - spread unused budget according to relative weights
> +		 * of over budget siblings.
> +		 */
> +		css_for_each_child(css, &drmcs->css) {
> +			struct drm_cgroup_state *sibling = css_to_drmcs(css);
> +
> +			if (!css_tryget_online(css)) {
> +				css_put(node);
> +				goto out_retry;
> +			}
> +
> +			if (sibling->over) {
> +				u64 budget_us =
> +					DIV_ROUND_UP_ULL(unused_us *
> +							 sibling->weight,
> +							 over_weights);
> +				sibling->per_s_budget_us += budget_us;
> +				sibling->over = sibling->active_us  >
> +						sibling->per_s_budget_us;
> +			}
> +
> +			css_put(css);
> +		}
> +
> +		css_put(node);
> +	}
> +
> +	/*
> +	 * 4th pass - send out over/under budget notifications.
> +	 */
> +	css_for_each_descendant_post(node, &root->css) {
> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
> +
> +		if (!css_tryget_online(node))
> +			goto out_retry;
> +
> +		if (drmcs->over || drmcs->over_budget)
> +			signal_drm_budget(drmcs,
> +					  drmcs->active_us,
> +					  drmcs->per_s_budget_us);
> +		drmcs->over_budget = drmcs->over;
> +
> +		css_put(node);
> +	}

It keeps bothering me that the distribution logic has no memory. Maybe this
is good enough for coarse control with long cycle durations but it likely
will get in trouble if pushed to finer grained control. State keeping
doesn't require a lot of complexity. The only state that needs tracking is
each cgroup's vtime and then the core should be able to tell specific
drivers how much each cgroup is over or under fairly accurately at any given
time.

That said, this isn't a blocker. What's implemented can work well enough
with coarse enough time grain and that might be enough for the time being
and we can get back to it later. I think Michal already mentioned it but it
might be a good idea to track active and inactive cgroups and build the
weight tree with only active ones. There are machines with a lot of mostly
idle cgroups (> tens of thousands) and tree wide scanning even at low
frequency can become a pretty bad bottleneck.

Thanks.

-- 
tejun
