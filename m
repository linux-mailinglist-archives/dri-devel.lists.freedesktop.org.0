Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA75880757
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CED10F5D9;
	Tue, 19 Mar 2024 22:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r1d0n3+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D4910F5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:45:09 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dd161eb03afso5416560276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710888309; x=1711493109; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pQqzWk+vG/Yifue6kYN9pL804kvE+CAcl3rI2SerYrg=;
 b=r1d0n3+XXtFVjRHCJNtARNNxCl6PYyg93OKjtAVNPUhkpBz0jFMTG8niTmadzuDXI5
 04Oc7NXXnD/JsoGKvhba8MEMIFkkXW4euYAgkFkMc8w7B/mj6v5KUpvs+rRh6EfoaclM
 2DGRpBtmdY23w3DHUmdEi5dZbTwK+WgjV/s9R9AcEn2viqdLGCy0S0Etwtcm1DrZCxAa
 YIqVhkG7pm40tYN3+vdgs2EJhWeph7Gp0z8L/mcic37NP+lPVn6ilARGjYdyTDTygixR
 y2mTlHBp7pXYrN1yG+nj/vbTbdFMylD+QlQ+RupxBYywNOgCds4Bky6uQLGWzSYIYtBx
 vlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710888309; x=1711493109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pQqzWk+vG/Yifue6kYN9pL804kvE+CAcl3rI2SerYrg=;
 b=ojSxzzVNK+pV/BovCrOjujov2XC32CKUxF0zgXfPtgJ3NV5FW3TxfY432JHTqSpT3s
 KTH4YzvfLCx4lDXyVbmlnTZAImJXN9jYYVn4X+lRTkKKtfroYp3VP3s8YuSPoFwmVyw0
 vucy9thq3N19+uA3C69wwRKLeHfs1jL8fTcE9oPnkFimIOu4m9em2cV6jUzquIFoKM1J
 qb9JJgn/a9MChbW+A7Dsxxj8Ss0vOJS8lXZvm02oNAIBrCz3DndC9VG+Nbo3XrSIZEDo
 tbdsHE4u/IkIw/atPdeW+2Ck7yharfJXARZcWGceOwVBthlnrUkrYrvtyC0vjrHW0ibr
 rZMg==
X-Gm-Message-State: AOJu0YxQmuq5VF2iuwxstMyMfkRD321RLwJM5w3qs2AmBbqf+2CBfI+7
 i9PoJXioa7PKr8A2ynM0m9bCiun7l2ND9/N3GGPmUvO9rbL9hgfXvY9/Q8TvxPDpLUHu/qaBBkw
 czQVNhbRlqTEX6eHfOoAnNRu3NYxjqmPa9jxdvw==
X-Google-Smtp-Source: AGHT+IHAZs2FKAPJJSOuCRtpl8N3osuzygCJ/ew0ONS2Wfx9/D47o8Y7hTNZXigpA+m4BsbEswZ9ChA4+j+EbdZMdiI=
X-Received: by 2002:a25:abcc:0:b0:dc6:b088:e742 with SMTP id
 v70-20020a25abcc000000b00dc6b088e742mr15020800ybi.8.1710888308713; Tue, 19
 Mar 2024 15:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
In-Reply-To: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Mar 2024 00:44:57 +0200
Message-ID: <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not
 optional for panels
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Mar 2024 at 22:58, Douglas Anderson <dianders@chromium.org> wrote:
>
> In response to my patch removing the "wait for HPD" logic at the
> beginning of the MSM DP transfer() callback [1], we had some debate
> about what the "This is an optional function" meant in the
> documentation of the wait_hpd_asserted() callback. Let's clarify.
>
> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> was introduced there was no great way for panel drivers to wait for
> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> could only wait for HPD if a GPIO was used. At the time, we ended up
> just saying that if we were using the "built-in" HPD signal that DP
> AUX controllers needed to wait for HPD themselves at the beginning of
> their transfer() callback. The fact that the wait for HPD at the
> beginning of transfer() was awkward/problematic was the whole reason
> wait_hpd_asserted() was added.
>
> Let's make it obvious that if a DP AUX controller implements
> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> start of their transfer() function. We'll still allow DP controllers
> to work the old way but mark it as deprecated.
>
> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I would consider changing the docs to say that implementing
> wait_hpd_asserted() is actually _required_ for any DP controllers that
> want to support eDP panels parented on the DP AUX bus. The issue is
> that one DP controller (tegra/dpaux.c, found by looking for those that
> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> this work on tegra since I also don't see any delay loop for HPD in
> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> optional and described the old/deprecated way things used to work
> before wait_hpd_asserted().
>
> Changes in v2:
> - Make it clear that panels don't need to call if HPD is a GPIO.
>
>  include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
