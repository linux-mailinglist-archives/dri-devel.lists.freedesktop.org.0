Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E735580F5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8D10E4AE;
	Thu, 23 Jun 2022 16:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BCE10E4AE;
 Thu, 23 Jun 2022 16:54:45 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id t5so9846198eje.1;
 Thu, 23 Jun 2022 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8Xq43bbRjEKacSTo4BPL6Cozz0OrPL8PFpBY9tp/cI=;
 b=Rg/Gf3YdC0aE2ENWZRvbMZezUfPTW0Pu8ZU8TA8MoB5WsvY7nduewZ/lR0FSC3jhSC
 hHKxGp6WXZdmDwKiYqn4iRQump5POT9c5CCRW5XFWfjVFbvSNCKohfT9cGOAcMY7YJ96
 3tIRpSenqKoF2h8dBP1em1U7YYZW+yUj2BhO4a7z6cfFKA1oN/wcYsHYxmK4qwLZPkIy
 i+nMuwbSrdje5IVl2Y/LjIjW9X8cogkM1cSMN8xo/ZZ89p2ZUUdK+i0l49NaXdW/kHLC
 kadnvoyknhHn/uG+Kt0VailtxX5kmEwvuIffeXS1K82fQpWecJamF79/EaitERy3cuKu
 5ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8Xq43bbRjEKacSTo4BPL6Cozz0OrPL8PFpBY9tp/cI=;
 b=yIHX6asRMEfm2KYrYvgd0nbNkYfpQ3EZdXZ2bU7MEX5sFYhMCRx7Jthp0ljAsLWzXF
 s7ki/YnkZv24v8WTMwaOZSBsFvDeY44qX6ddHP33W4c/ZMSF5BXBbAMQ6VvhPzy8noC4
 X0c0oJ6UNEcKVTLXHYKWKxu+zJoI1vvmaZNd8fylex3vZunAaQWIgBLdS0Q1T61wfPLB
 3I18VtrQxHgletXqs9rEVytmTvVMKR3HKZ5Ak81z0lvmomtwxn3IZbR5iENrEuFML04B
 lDHsV59/pNINrXmVq5YcGXngzqHJZ9GcTH7sD29iZNr8lI1kWw3JXr8oJaInr/RFyA6l
 gL3Q==
X-Gm-Message-State: AJIora9tjiMUxw3kGYJoQBLvL1Wf2tqXe5+0M8oEiC8Y1QlHVbtWdBQY
 P8oJ3JbkWm1VVPkrFaI/SUr+skhW3cCsCRa8wv8=
X-Google-Smtp-Source: AGRyM1smtBLHykyN2J24gb4EAWkLDqyTjcF41lu/jXG57L7NlyfkxJnfLMfq84io+slBSvnBNrMIAlyRbwovs+v+YZM=
X-Received: by 2002:a17:906:c041:b0:718:c984:d9ee with SMTP id
 bm1-20020a170906c04100b00718c984d9eemr9543450ejb.722.1656003284142; Thu, 23
 Jun 2022 09:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220623153001.3136739-1-nathan@kernel.org>
 <03448497-30c9-7655-ae6a-a66a1f649828@amd.com>
In-Reply-To: <03448497-30c9-7655-ae6a-a66a1f649828@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jun 2022 12:54:32 -0400
Message-ID: <CADnq5_M8E1x4dDRmFd=Y7Zmz=5DbS9ADGnmiDiP20rdHpKBJxA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix indentation in
 dcn32_get_vco_frequency_from_reg()
To: Leo <sunpeng.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: llvm@lists.linux.dev, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 23, 2022 at 12:26 PM Leo <sunpeng.li@amd.com> wrote:
>
>
>
> On 2022-06-23 11:30, Nathan Chancellor wrote:
> > Clang warns:
> >
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:549:4: warning: misleading indentation; statement is not part of the previous 'else' [-Wmisleading-indentation]
> >                           pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
> >                           ^
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:542:3: note: previous statement is here
> >                   else
> >                   ^
> >   1 warning generated.
> >
> > Indent this statement to the left, as it was clearly intended to be
> > called unconditionally, which will fix the warning.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1655
> > Fixes: 3e838f7ccf64 ("drm/amd/display: Get VCO frequency from registers")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Just hit this myself, thanks for the fix!
> Reviewed-by: Leo Li <sunpeng.li@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> > index 113f93b3d3b2..4e8059f20007 100644
> > --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> > +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> > @@ -546,7 +546,7 @@ static uint32_t dcn32_get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mg
> >                * this works because the int part is on the right edge of the register
> >                * and the frac part is on the left edge
> >                */
> > -                     pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
> > +             pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
> >               pll_req.value |= pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_frac;
> >
> >               /* multiply by REFCLK period */
> >
> > base-commit: fdf249c70a36e2daa7ddf1252cf3b71faed87abc
>
