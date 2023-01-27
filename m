Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DD67DB1E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 02:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EC910E3C5;
	Fri, 27 Jan 2023 01:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C5410E160
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 01:13:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y15so2812814edq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CF01fh/f0hITGD+MQzyiKhCXqnGsvJyZ9uRxx+H98MU=;
 b=dvJ1aGnFt1pS3es/e/WqL8ToqRyNvrS6b+rH6MEGmZD2ICAYISfVAHWE3cpKE8+7AW
 rXDdDtrUF5/yOT3M2hz8YMcS3jrmIIqXTZdHjOHsFunoFUw51j2DqWgQxG4apAXVW7Mm
 c7mQEq8JDpOf+Mwf4us1d/to+qbbqh+uzkQzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CF01fh/f0hITGD+MQzyiKhCXqnGsvJyZ9uRxx+H98MU=;
 b=uSjC6XyB+sbMTxswYpEs0IIFIl98UxkOKYFgy3zV90VROshQZoHfr1TVmbgXluttSD
 lmfGqN31Z17MDQNcmmlFNGyy268rvmFhcf/mHXd8G8zv1Ok7tAjxIUXP0Kn12POUF2+9
 IQZ84cajV57KxMAws5b8gERSDrE70BtNoh02SDDwCozayoRP31crApY+dfkIxdokmYXY
 cK7yNboQ85Hg915NehOZg3ksj4CGjRfZDaSgjiMnrQqeRJhMxabUwGdwpAynxG0/eFo6
 T+paPm5/YEi/pXe45ZaB0PqlYHByJSCytvmgD1Ymo4inbZ0AeHRuSh943S7J7T7COlAo
 Bqpg==
X-Gm-Message-State: AO0yUKWlZ4ozz5AwJu3TjwpZoSpF/oHbdh4nyIAwASCD2oj0RXjM9Boy
 RDtLZQN/M+3pQ/A1cgr0Fc9ywB+wOGa7sMXmeRE=
X-Google-Smtp-Source: AK7set8wtZSa7pTg4aQVnjV+8LmgmMsifKKtY45dtxXRqgc8AB4w7rF2sjREHO50u5B0+N/EXmwlLw==
X-Received: by 2002:a05:6402:298c:b0:49f:a3d7:b84d with SMTP id
 eq12-20020a056402298c00b0049fa3d7b84dmr14291696edb.34.1674782028139; 
 Thu, 26 Jan 2023 17:13:48 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 a6-20020a509b46000000b0049e65e4ff20sm1513314edj.14.2023.01.26.17.13.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 17:13:46 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id r2so3618130wrv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:13:45 -0800 (PST)
X-Received: by 2002:a5d:6b51:0:b0:2bf:c5cc:e1d6 with SMTP id
 x17-20020a5d6b51000000b002bfc5cce1d6mr99974wrw.659.1674782025133; Thu, 26 Jan
 2023 17:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
In-Reply-To: <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jan 2023 17:13:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_FhzyZFiJT3hYnURpuM7VvnR_RDBufCcwXu+H2obxgw@mail.gmail.com>
Message-ID: <CAD=FV=U_FhzyZFiJT3hYnURpuM7VvnR_RDBufCcwXu+H2obxgw@mail.gmail.com>
Subject: Re: [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally powering up DSI
 hosts at modeset
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 13, 2023 at 3:56 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
>
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
>
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
>
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
>
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++----------------------
>  1 file changed, 11 insertions(+), 57 deletions(-)

Does anyone have any comments on this patch series? It would probably
make sense to wait to land until early in a kernel's release cycle, so
perhaps there is no hurry. That being said, it would still be good to
know what the plan is.

Abhinav: I think you're the one that was most concerned with removing
the special case for ps8640. Does that mean you'd be willing to review
this patch?

For whether or not the "tc358762" panel works with the MSM display
driver after this series, are the correct people on this thread?

Thanks!

-Doug
