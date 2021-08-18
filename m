Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD763F0678
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018A26E5D1;
	Wed, 18 Aug 2021 14:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D4B6E5D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:21:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u16so3816858wrn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0v4xEbpIxtPVynvlGn3w3JYqYPXUExkhDuGZEZiBb0s=;
 b=PWMtcQ88dU0Ra/j9UlC6zoeDBUvZrHSv2T2OG0dkZZavbgyQ1Nfac3CSLfDnrIBah7
 RKOEqhHmH6Tv8TCfTtPTY5jUJZdUFslEe/oauIU8XwfcpfcFf0f90xAlgqHbzwxG5efL
 3Zn7IsbPooSJATuw2VfdHi9mLs1wvx2qT27TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0v4xEbpIxtPVynvlGn3w3JYqYPXUExkhDuGZEZiBb0s=;
 b=fdXfkyngOr0lj0bM2uw2DugbhBFqN0R5dvhpKNGPYBeNHVbucndfJjsqOef9Ro0j/j
 BEpBwHTqIH+/35ub5Sir3XYmXe89eqZAPQayDp/r+qkuWo/u0bjoDkfJxg35TXGrQ8xB
 2j2+RNh5tC7wChe3tJodShx5yF9I0aJ6p7yTz4cgA4VWmaXPMRIhbCtwFRE9xJ1cjB40
 nmjZfD/LvIc49nG9kqcwTM1GgM+620wdVhg/Cohfs2c4QRyo5/hILeK6j54uAsVpn2zO
 nWaWab+MaetPlajMR8maxFzu5/nn4K6SJ3TY10x5m24D2MvgkBlhOMxZhUCeSL03g6Q6
 gDnw==
X-Gm-Message-State: AOAM531F40UyJV4K+L/wVsKhXddGvBLlN7V6FbP0/hwaHF+U0rjIMXF7
 S/59cmTkbzyNcPduDGnxbHWyLQ==
X-Google-Smtp-Source: ABdhPJyWfFJF1FWtEGpBG7Ra/ScV/YUaqnrjfr7y+2S5kTOUVCyj+pseqiaBZVAYJFv8mtTPAx+INQ==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr10969422wrm.64.1629296510009; 
 Wed, 18 Aug 2021 07:21:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm5905317wrr.91.2021.08.18.07.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:21:48 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:21:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/guc: Verify result from CTB
 (de)register action
Message-ID: <YR0XemRAhh6kmJw0@phenom.ffwll.local>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701155513.2024-2-michal.wajdeczko@intel.com>
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

On Thu, Jul 01, 2021 at 05:55:10PM +0200, Michal Wajdeczko wrote:
> In commit b839a869dfc9 ("drm/i915/guc: Add support for data
> reporting in GuC responses") we missed the hypothetical case
> that GuC might return positive non-zero value as success data.
> 
> While that would be lucky treated as error case, and at the
> end will result in reporting valid -EIO, in the meantime this
> value will be passed to ERR_PTR that could be misleading.
> 
> v2: rebased
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>

Return value where all integers are possible is always a bit fragile,
especially here where the meaning additionally depends upon whether you
supply a reply buffer or not.

Would be good to document this with some kerneldoc, but maybe the CTB
interface is a bit too unclear here and that's not worth it (there's at
least a ton of functions/variants that just arent used).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 43409044528e..a26bb55c0898 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -148,12 +148,15 @@ static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
>  		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
>  		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
>  	};
> +	int ret;
>  
>  	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
>  	GEM_BUG_ON(size % SZ_4K);
>  
>  	/* CT registration must go over MMIO */
> -	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
> +	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
> +
> +	return ret > 0 ? -EPROTO : ret;
>  }
>  
>  static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
> @@ -177,11 +180,14 @@ static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
>  		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
>  		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
>  	};
> +	int ret;
>  
>  	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
>  
>  	/* CT deregistration must go over MMIO */
> -	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
> +	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
> +
> +	return ret > 0 ? -EPROTO : ret;
>  }
>  
>  static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
