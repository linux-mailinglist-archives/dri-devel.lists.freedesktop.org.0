Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A93F066D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25536E5CF;
	Wed, 18 Aug 2021 14:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86D6E5D1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:20:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so3623703wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eLPh1ufyRl6cee+tsMi/YYP1fCI/ZcZPoOHnw+iuZiw=;
 b=La4elH+vTAmtDVolI+PxFMsQuqOk4Yvrft927jC+awkswgo87nKdKXP67X7/aZAOSE
 RpgNMA0VRcv2vbTmxLM7O82yMncOC10AxOsmSTFoVfRP6Qt2m71EMCw/sjvz85kiSfVA
 aKvtncojDWFK8Fy7dXCWuu/TjUH02zQb5lmtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eLPh1ufyRl6cee+tsMi/YYP1fCI/ZcZPoOHnw+iuZiw=;
 b=huw3Vrze/mIc1VGYPQxj9ZIPBWtxD47G2dJM/o2yZGg0wSMOrmGPEDv3x0aEcwEDdR
 F+KIogBaapZTHMmF51WeDMKsBmXjw7Dgv6z2ngZziVcmWVz9Nwn9dsNw+IQcrxixom8s
 dxnCIpDumK2+Yy7V66haR9vwgZRWYpPWI/VF4sdqs4Ho4MWQ9czr/B5u5HecfKAaY2OS
 CyusHBcWF8anQdI6o112vfQ/DWiBS0AYwTEI6BEa3ZvKINm7XPT+1vJQNeq2sH1Pu4W7
 LyCsQxTrFQfvxFvsWNmiV4ATrz8Idmc3RgFHiE1WjRoXVe2O8oYzNAEGaBUaCrQ7ueLr
 ZDpg==
X-Gm-Message-State: AOAM530jhPdkmhR6IevyOAnUOAGHKNx++DdKk1YjpsKOkYVUyikO5x9O
 VfiN/A/DH3++UkCHOaJU7eGSoF7KdxDE4Q==
X-Google-Smtp-Source: ABdhPJzcuDpzCI5pwk0Io/n50r/I9b/bRulvelZR5aSUeFD9HEU/1+mor6iWWCd5ULyE9JG/Q/XHIQ==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr3556962wme.90.1629296409874; 
 Wed, 18 Aug 2021 07:20:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b20sm5802178wmj.20.2021.08.18.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:20:08 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:20:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Print error name on CTB
 (de)registration failure
Message-ID: <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701155513.2024-3-michal.wajdeczko@intel.com>
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

On Thu, Jul 01, 2021 at 05:55:11PM +0200, Michal Wajdeczko wrote:
> Instead of plain error value (%d) print more user friendly error
> name (%pe).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a26bb55c0898..18d52c39f0c2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -167,8 +167,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
>  	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
>  					    desc_addr, buff_addr, size);
>  	if (unlikely(err))
> -		CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
> -			 guc_ct_buffer_type_to_str(type), err);
> +		CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
> +			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));

errname() is what you want here, not this convoluted jumping through hoops
to fake an error pointer.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  	return err;
>  }
>  
> @@ -195,8 +195,8 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
>  	int err = guc_action_deregister_ct_buffer(ct_to_guc(ct), type);
>  
>  	if (unlikely(err))
> -		CT_ERROR(ct, "Failed to deregister %s buffer (err=%d)\n",
> -			 guc_ct_buffer_type_to_str(type), err);
> +		CT_ERROR(ct, "Failed to deregister %s buffer (%pe)\n",
> +			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));
>  	return err;
>  }
>  
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
