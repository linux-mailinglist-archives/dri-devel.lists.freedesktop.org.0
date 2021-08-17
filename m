Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1783EEA45
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14E489B22;
	Tue, 17 Aug 2021 09:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D4789B22
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:47:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q10so27686028wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lGFkCkrWnsotXeKYsCAfkHd4AHSw7XX4I2430+/pP98=;
 b=UR+83Ua1QDTzlEGz72mm57+9kI5HdvITUa7u4+OgvMZT3CGeflq4qKsHE/Wch8me9N
 GUOHG4hlf3zpQ/Lax7el04Qir+O3je/rFzhByCNVFBN9Q6ZMwoAZr6M+jIruNdjilYHC
 W4R0q+/W4aG8v5YZRnPlV/LENntqJkE+YMGLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lGFkCkrWnsotXeKYsCAfkHd4AHSw7XX4I2430+/pP98=;
 b=JsEgdn33m1V3hj9B/adYU0WGa+Bozt0iA+N75C3OiziH7TowRYNsgX+ei1GuvXaSOV
 Uo9o5iieiPVG0h6F/XzJmZyoe9ijMwx3InS0+wKp1OZCx2nBtYaJOwICtCohf+/a/i/B
 /pr3LqAdmVNssm5u2iyQfAYECo5j9/3vigR7ebOXFLn7TkuKBKqUvyvtvjJt9EH/Egf+
 sCr+y87QMz22QMD8hfpgF3wBIeeOfW0FoCPl5axjkSYe9PdGVeePj+RemMPXYrMtc2Oz
 2B5fARjFpdpkI6clJjvgcne3X/7oV060Tkuo3eU0bLLd9cwkBNS1lzw9LSO4vnd09QYX
 jlcg==
X-Gm-Message-State: AOAM5315bDnXTWBf11H5naufwGPpE4UFDplBzNAMpMTSbymOEf1s6RBt
 4CURsM2G1FryBvvyZUDKWFcaIg==
X-Google-Smtp-Source: ABdhPJwsHGU0cJYnbc76iXe5Z2wNBCl3pZAiQsCX+2sywUtxUWKYARwh4qrP0J6FrhneaVcbv69lQA==
X-Received: by 2002:a5d:4bd1:: with SMTP id l17mr2929525wrt.5.1629193675978;
 Tue, 17 Aug 2021 02:47:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o125sm1597554wme.15.2021.08.17.02.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 02:47:55 -0700 (PDT)
Date: Tue, 17 Aug 2021 11:47:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 08/22] drm/i915/guc: Don't enable scheduling on a banned
 context, guc_id invalid, not registered
Message-ID: <YRuFySMEGtbQegKa@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-9-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-9-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 16, 2021 at 06:51:25AM -0700, Matthew Brost wrote:
> When unblocking a context, do not enable scheduling if the context is
> banned, guc_id invalid, or not registered.
> 
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c3b7bf7319dd..353899634fa8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1579,6 +1579,9 @@ static void guc_context_unblock(struct intel_context *ce)
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  
>  	if (unlikely(submission_disabled(guc) ||
> +		     intel_context_is_banned(ce) ||
> +		     context_guc_id_invalid(ce) ||
> +		     !lrc_desc_registered(guc, ce->guc_id) ||
>  		     !intel_context_is_pinned(ce) ||
>  		     context_pending_disable(ce) ||
>  		     context_blocked(ce) > 1)) {

I think this entire if condition here is screaming that our intel_context
state machinery for guc is way too complex, and on the wrong side of
incomprehensible.

Also some of these check state outside of the context, and we don't seem
to hold spinlocks for those, or anything else.

I general I have no idea which of these are defensive programming and
cannot ever happen, and which actually can happen. There's for sure way
too many races going on given that this is all context-local stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
