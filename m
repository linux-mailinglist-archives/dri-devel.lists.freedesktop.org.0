Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6363ED3C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECD310E5A2;
	Thu,  1 Dec 2022 10:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6E10E5A2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:07:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r26so1632277edc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pi+9qZJbDOPwcCoCHj0wRUKui6+gdzHva6vitay+VbE=;
 b=aVQm9z43BDafUnUtEsDqNFv4kowCV0O3nRhxZk8wvw2YC9jcbxxc/FL0bsjU2M4XZZ
 E1R5pr71KlNOR5WUzbkDtu0Zuxl7E25iUl9EIWX9xwsut2gHX42kozeCEdG8zcljgkcu
 j33CmfRA9nCQVo+Fw39n9XXstQtQS3fDRELio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pi+9qZJbDOPwcCoCHj0wRUKui6+gdzHva6vitay+VbE=;
 b=gurMuwcH6v443JDFu7sHzze0oEbKB5HoWj0ezRSF0M0hzz83fgIOcHY1CfyEMd4pxa
 rfV/o47AYjLtH4/dmTMGDnZNC8CKxzELen5H8JH2Mt7N6wu3BPqhhh/E+fiQ9OR6TSlH
 Yx1QwwWmZ9X2lBNi33lhUuz2smzt8TmR45UqWaPgy5hl7TkuKoYC5HE+rM1MAxODIe2S
 stPjIcOyQNuThV2ASNbXiz1+aq0yXW7XI/sXTLpKOMr0EOVswtVjoJeeLbXDdhiTmPIr
 tr1/z/RfbpaLjaZwRTKJobiaSEojQpFJ/YwAtiRhtMhqjzz3WvBoV928FFSktgBnq4ij
 Ooxw==
X-Gm-Message-State: ANoB5pnHtv7y6JkysZILQ28rU6CvqSsYGvzWGGjaoVyHEP+DmkDKJnX1
 2UtHLIoHlHZolLWdulZbwFqu05gX2mgIEA==
X-Google-Smtp-Source: AA0mqf7HfCVVVZfp/IfvFKNnVbIGiGElDxI4ewdpDTop0ScRkSpLJBhidONtjzezXu8iRs5lUc2iqg==
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id
 fd18-20020a056402389200b00454cbefc161mr42112310edb.365.1669889257800; 
 Thu, 01 Dec 2022 02:07:37 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e18-20020a170906315200b007b935641971sm1615988eje.5.2022.12.01.02.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:07:36 -0800 (PST)
Date: Thu, 1 Dec 2022 11:07:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
Message-ID: <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
> It's a bit a FAQ, and we really can't claim to be the authoritative
> source for allocating these numbers used in many standard extensions
> if we tell closed source or vendor stacks in general to go away.
> 
> Iirc this was already clarified in some vulkan discussions, but I
> can't find that anywhere anymore. At least not in a public link.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Neil Trevett <ntrevett@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

From irc:

<airlied> danvet: ack from me

> ---
>  include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index bc056f2d537d..de703c6be969 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -88,6 +88,18 @@ extern "C" {
>   *
>   * The authoritative list of format modifier codes is found in
>   * `include/uapi/drm/drm_fourcc.h`
> + *
> + * Open Source User Waiver
> + * -----------------------
> + *
> + * Because this is the authoritative source for pixel formats and modifiers
> + * referenced by GL, Vulkan extensions and other standards and hence used both
> + * by open source and closed source driver stacks, the usual requirement for an
> + * upstream in-kernel or open source userspace user does not apply.
> + *
> + * To ensure, as much as feasible, compatibility across stacks and avoid
> + * confusion with incompatible enumerations stakeholders for all relevant driver
> + * stacks should approve additions.
>   */
>  
>  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
> -- 
> 2.37.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
