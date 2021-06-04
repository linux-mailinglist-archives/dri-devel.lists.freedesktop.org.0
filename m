Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66A39B4BD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778966E116;
	Fri,  4 Jun 2021 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304086E116
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:20:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so7361812wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MlLRghsOuKLwjgoQCjs8GbKtMrMTYO5/H3rsXE4lnmE=;
 b=BwB8CNsPpGqA4d2iyln07GuYSNNvEKFslQL1VpguNpmtjGfhzBBIPHzNqF3JZ9qajj
 m4iba/vW4E19eMa2c9VfvmPVo84do9pu6GxQjOrQkL5u4xZesLwtyChi1bsBRDCNnMn4
 D5CcImJEq7RlvBzsKpv/srFjyo7hKOeXB3beM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MlLRghsOuKLwjgoQCjs8GbKtMrMTYO5/H3rsXE4lnmE=;
 b=NCPv/4kB//uYv4+U9siX/Td8XXiGDKNi3Pj/O6WU2tKxsaYKm/UpnTTtS2d/mdAIL0
 NMUQipbi7PmvbiQysinAr0E1YunsTruO7p09M6UViyMKhcYz7LoLrQwYUiCLQLPb5WWt
 cOuzAtoJ6hSvx0NWMX60/td5MMgo7h+6Jz24a5avqpf8CQTvDVd3g38z2ZOQ7HiE4loM
 cETLTPj9dVYjkYUErFmPPQh71+2L5xaFBbwjdgWit/6geR9oc9kG7oAVEAqNWp1X4pUH
 e1iMte9qZMPXD3lavQlY/ejUDO9TWEQzFm0So3HTpCG/h4CD/GojjBWyx9F8UM1UHFzx
 m+dQ==
X-Gm-Message-State: AOAM531jnY74cnj51+hfmQ0tysQGJAR5NM6t4UjPE/AkKisfZK76rjNF
 bKsisTGU79Lk2BY4esSABond9PLrVaxcEg==
X-Google-Smtp-Source: ABdhPJyeDufy1MRgJYrGva2UJGEqNOq9+FmNn/sFrIuOk3Ds3HK/z+wrTHvu7JVH4REfIhNk3xuqPA==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr2387892wmp.165.1622794807872; 
 Fri, 04 Jun 2021 01:20:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k5sm6135837wrv.85.2021.06.04.01.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 01:20:07 -0700 (PDT)
Date: Fri, 4 Jun 2021 10:20:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [v3 PATCH 2/2] drm/i915/guc: Update sizes of CTB buffers
Message-ID: <YLniNZjpBz6E24cK@phenom.ffwll.local>
References: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
 <20210603230408.54856-1-matthew.brost@intel.com>
 <20210603230408.54856-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603230408.54856-2-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 04:04:08PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Future GuC will require CTB buffers sizes to be multiple of 4K.
> Make these changes now as this shouldn't impact us too much.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>

Assuming this was just rebased?

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
>  1 file changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index ec795d7c3a7d..8d1173032431 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -38,6 +38,32 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>  #define CT_PROBE_ERROR(_ct, _fmt, ...) \
>  	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
>  
> +/**
> + * DOC: CTB Blob

These are supposed to be pulled into the kerneldoc builds, but that's not
happening in this patch?

Now I think the GuC docs in general are fairly outdated, so is the DOC
review coming later, or is the DOC: header here simply cargo-culted :-)

If it's not coming later we need to do a JIRA to clean this all up and
link all the new/changed kerneldoc into our GuC doc structure.
-Daniel

> + *
> + * We allocate single blob to hold both CTB descriptors and buffers:
> + *
> + *      +--------+-----------------------------------------------+------+
> + *      | offset | contents                                      | size |
> + *      +========+===============================================+======+
> + *      | 0x0000 | H2G `CTB Descriptor`_ (send)                  |      |
> + *      +--------+-----------------------------------------------+  4K  |
> + *      | 0x0800 | G2H `CTB Descriptor`_ (recv)                  |      |
> + *      +--------+-----------------------------------------------+------+
> + *      | 0x1000 | H2G `CT Buffer`_ (send)                       | n*4K |
> + *      |        |                                               |      |
> + *      +--------+-----------------------------------------------+------+
> + *      | 0x1000 | G2H `CT Buffer`_ (recv)                       | m*4K |
> + *      | + n*4K |                                               |      |
> + *      +--------+-----------------------------------------------+------+
> + *
> + * Size of each `CT Buffer`_ must be multiple of 4K.
> + * As we don't expect too many messages, for now use minimum sizes.
> + */
> +#define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> +
>  struct ct_request {
>  	struct list_head link;
>  	u32 fence;
> @@ -175,29 +201,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  
>  	GEM_BUG_ON(ct->vma);
>  
> -	/* We allocate 1 page to hold both descriptors and both buffers.
> -	 *       ___________.....................
> -	 *      |desc (SEND)|                   :
> -	 *      |___________|                   PAGE/4
> -	 *      :___________....................:
> -	 *      |desc (RECV)|                   :
> -	 *      |___________|                   PAGE/4
> -	 *      :_______________________________:
> -	 *      |cmds (SEND)                    |
> -	 *      |                               PAGE/4
> -	 *      |_______________________________|
> -	 *      |cmds (RECV)                    |
> -	 *      |                               PAGE/4
> -	 *      |_______________________________|
> -	 *
> -	 * Each message can use a maximum of 32 dwords and we don't expect to
> -	 * have more than 1 in flight at any time, so we have enough space.
> -	 * Some logic further ahead will rely on the fact that there is only 1
> -	 * page and that it is always mapped, so if the size is changed the
> -	 * other code will need updating as well.
> -	 */
> -
> -	blob_size = PAGE_SIZE;
> +	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
>  	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
>  	if (unlikely(err)) {
>  		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
> @@ -209,17 +213,17 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  
>  	/* store pointers to desc and cmds for send ctb */
>  	desc = blob;
> -	cmds = blob + PAGE_SIZE / 2;
> -	cmds_size = PAGE_SIZE / 4;
> +	cmds = blob + 2 * CTB_DESC_SIZE;
> +	cmds_size = CTB_H2G_BUFFER_SIZE;
>  	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "send",
>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>  
>  	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
>  
>  	/* store pointers to desc and cmds for recv ctb */
> -	desc = blob + PAGE_SIZE / 4;
> -	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
> -	cmds_size = PAGE_SIZE / 4;
> +	desc = blob + CTB_DESC_SIZE;
> +	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
> +	cmds_size = CTB_G2H_BUFFER_SIZE;
>  	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "recv",
>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
