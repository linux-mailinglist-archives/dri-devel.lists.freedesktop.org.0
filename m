Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D546F79E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 00:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370C988894;
	Thu,  9 Dec 2021 23:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9F10E125
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 23:41:28 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p18so5053603plf.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 15:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r5IxUk7IoRTtrl9b80LUZD9vVdZvTnVgPepWlX6Ohsg=;
 b=jdweGnXL6ND3BiYR6OrJRdg5Np7KCGmUX0f6pWmIZofXaOe97M4P6exXy9VtmzFCIx
 98frCoSGt4fnj1kVXOYDRhRccWPuK0L10zo03sxW2Kic2fIoxAYQ3fFXW9fWADAswkgK
 UG/ty3h235tjYAvc3RVKU0nlEccy7zoJpzcGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r5IxUk7IoRTtrl9b80LUZD9vVdZvTnVgPepWlX6Ohsg=;
 b=jmpuJDliWtJqxJTMsTx20+toQAqbVnv8bx8cOqQUyhOWmmL5KYLfsvTfjh4UgwGeyC
 Uj7p4rDWTcj7FOvPOzx5n4PlgTXG2XeVveXnBQCBXPFeVLIe78ve6y4WC/dVeNHtcDqr
 KmgAOidX/mjyDa3rcgH82ebB6dk39ooJcd+Rl1gYXcTZMB6QHQi6HS/O30tdiFh2EL2q
 T6/RG/IusLodC43uYt/P2KNYtwzk4Km374cXRzokGUc29keCUrnsZoIS6F/hDX1KT10g
 oZIVHqNR5ZT0TpJRjIO7TIJnAIDBNA+OhCWcGo4wc8gK9N4M1I1LSE/VBOOlO7afloRk
 oThQ==
X-Gm-Message-State: AOAM533ii5J2l2HcgZkKjM3adr1LpGAnyLS6pxnzQpGmGu40PorkC9Dm
 XU0+G+kS4kChbbsgrDydga9KRw==
X-Google-Smtp-Source: ABdhPJzyk4sf1WNPIubTmnLyaDj9YqUyzvUL41XvKfsOUs2io7OX0emxdLtUfl9UQJ01SI14m51qjw==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr19136275pjb.157.1639093287759; 
 Thu, 09 Dec 2021 15:41:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id mu4sm11720860pjb.8.2021.12.09.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 15:41:27 -0800 (PST)
Date: Thu, 9 Dec 2021 15:41:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
Message-ID: <202112091539.6B349AC@keescook>
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com> <202112082220.81ECDC63D@keescook>
 <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <treding@nvidia.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 05:20:45PM -0500, Harry Wentland wrote:
> 
> 
> On 2021-12-09 01:23, Kees Cook wrote:
> > On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
> >> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> >>> The link_status array was not large enough to read the Adjust Request
> >>> Post Cursor2 register. Adjust the size to include it. Found with a
> >>> -Warray-bounds build:
> >>>
> >>> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> >>> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >>>    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >>>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> >>> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >>>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >>>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
> >>
> >> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
> >> published in 2014, and Tegra is the only user of
> >> drm_dp_get_adjust_request_post_cursor().
> > 
> > I see POST_CURSOR2 is used here too:
> > 
> > drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > 
> 
> Looks like we read and parse that in the admgpu driver without
> using drm_dp_get_adjust_request_post_cursor.

Right, and probably that could be switched to use it, but I'm not sure
what the impact of the larger link_status read is.

> 
> I don't have a strong feeling but I liked your original
> patch a bit better. I'm not sure what it means when part
> of a spec is deprecated. Once a spec is written display
> vendors might implement it. We should make sure that
> displays like that are always handled in a sane manner.

Jani, Dave, any guidance here? I'm fine with whatever, but the current
code is for sure broken. ;)

-Kees

-- 
Kees Cook
