Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60C4D306E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FAB10EB52;
	Wed,  9 Mar 2022 13:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC67710EB4F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:48:29 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n2so1994427plf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Awv2807Q48rVf5K7n4tpsQ5KWBJDVYHY3kmCWNGk/aI=;
 b=wcsOfALNDGWwsppDVr612z56RIFdWApQ9M7wYfkJMq8/nhsKXsyw0kUUx2ytQ3ByPz
 zxpSHo1d+oR+6+rDhvl/kyJW7BR7yQAr/q++8bz8KhQVUiUscD8mN7mE4ATjdySjvqnq
 einFiM8EQ7zx0LK5iXHZClxZkmp13xYREyuO/zvxbFnzaxyub6tECJA89p37uOCS9WUa
 j0bT5jMYmF+ZZRn6G/BQ02rNDkquRPi5dwKuD+O6u2EX14z1GLCiPowGsop2oYdThZIL
 u4gd1htJyC834tEP9cAT+ZzpmcnuaD6AADdllgz/iFBuh31TRqz9TQwAuG1DUu8vor1y
 B50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Awv2807Q48rVf5K7n4tpsQ5KWBJDVYHY3kmCWNGk/aI=;
 b=dB9XxTKk/oJzKo0gDVqAG+Qd2T0s4yJpwCuFvkc58zgPN0VwBwmhKzjiImvl+QVHEz
 /ueHSVgGy+GP6H/Qns5xPdudIdlagvj/F7KERlACvEd+EnZ5u+YmJV/n1W4QvnRkwPs7
 DzKZho5gdrIqVs64y5FX0Tc0VF95kUsir/Lt3+uNNGv0EkTeypuC6V91wSoDQDhEaLoc
 7zuxoRSA52f1PkpKTGkXnLPzpN6yl9q1romuRoUGxRSyx9W+3Z7TBDRjw1L6KXvf+v2F
 OeXogsnmLXTIXbPjaaI1yoWCZF3pLTgU674P5ug4d35X0/2Jqs+N8fp8B03KvXzZcpuX
 4b8g==
X-Gm-Message-State: AOAM530QpdKcw5Wm728ovdPs/N+/28/hVGCe6ODPi+9ei1ibnNwPEOFc
 di1NEsRDxsdVLwG4NikO18GZGtWUt+ljA1dBAk/REQ==
X-Google-Smtp-Source: ABdhPJxxGgkv/4ONjg/97nbBdxzNOqwNnUzRdkuGoFC3g9OqxkCMUZRKN+0ZNpfJPSVMPuq50dxWQN74mQ3jU4SqXbA=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr10521690pjb.179.1646833709168; Wed, 09
 Mar 2022 05:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20220303201943.501746-1-trix@redhat.com>
 <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
 <5b6a10bd-5650-2924-d1cc-e4664a0e7255@redhat.com>
In-Reply-To: <5b6a10bd-5650-2924-d1cc-e4664a0e7255@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:48:18 +0100
Message-ID: <CAG3jFyuBuJmr=NJROWHyEQqW9qng6KtwhJ1a9ACUEGfZ7g-Mxg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
To: Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, nathan@kernel.org, tzungbi@google.com,
 pihsun@chromium.org, laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, hsinyi@chromium.org, sam@ravnborg.org,
 xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Mar 2022 at 02:45, Tom Rix <trix@redhat.com> wrote:
>
>
> On 3/8/22 2:57 PM, Nick Desaulniers wrote:
> > On Thu, Mar 3, 2022 at 12:19 PM <trix@redhat.com> wrote:
> >> From: Tom Rix <trix@redhat.com>
> >>
> >> Clang static analysis reports this issue
> >> anx7625.c:876:13: warning: The left operand of '&' is
> >>    a garbage value
> >>    if (!(bcap & 0xOA01)) {
> >>          ~~~~ ^
> >>
> >> bcap is only set by a successful call to
> >> anx7625_aux_trans().  So check.
> >>
> >> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
> > Is this the correct Fixes tag?
> yes
> > I think it should be
> >
> > Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid
> > through aux channel")
>
> This one changes the name of the function
>
> -       anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> +       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
>
> A return check from the earlier commit, when this block of code came
> into existence, is when it was first needed.
>
> Tom
>
> >
> > instead.
> >
> >> Signed-off-by: Tom Rix <trix@redhat.com>
> >> ---
> >>   drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> index 633618bafd75d..f02ac079ed2ec 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> @@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
> >>          }
> >>
> >>          /* Read downstream capability */
> >> -       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> >> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
> >> +       if (ret < 0)
> >> +               return ret;
> >> +
> >>          if (!(bcap & 0x01)) {
> >>                  pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> >>                  return 0;
> >> --
> >> 2.26.3
> >>
> >
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
