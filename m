Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AB56BCE0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7653310E456;
	Fri,  8 Jul 2022 15:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152B810E456
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 15:26:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id l23so6480809ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jgYORBt3h5oNBznarFeGPU7nreEFffTVmMqBLDJdiu4=;
 b=DtmFdPpzZsHOuwOoYohjvI7a3T6485xiQKNorp7om5YF58QOgdZIm+69XDuFDPu6eT
 G0VKI4aJemTOakYgNYfi5goKPkr/OciMNayYQVZC/wYVDtjj4SxaE/DpjQ7w7Sglpy6j
 S9t6UDJqFztUm1k/IXK8WjVFIKnnN4cdaWiLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jgYORBt3h5oNBznarFeGPU7nreEFffTVmMqBLDJdiu4=;
 b=4HYdQi0QZxN/ariZZQ1oBwIZ3y3fovUudRX36SOykLzgHyavdoWDqt+1mycD/KDAhn
 8PDpQpYR53tCeGID9KYdG66wAKCfuO8+wDEh7BTtwUbIHwQYHkHUAhPfiXG4C1FRJsg2
 sKRDRT7gkQ3uZykQZJvS4nulbUOFCmARWMhgv3dQ4/HKPbwde79dJNOB8nx4iPDBU6BL
 89PZEyhOU/h3SOkT891thTpGufMRLoSLPA3UVIeI+4smk6bsniLUE58eYXih743iY6Sw
 nOPkBvpMX+s3eRu2fur4R8GBDrDG8fcQYnlHv5b30DOh6NFJootjqexUSHmfhJWznd3w
 kugw==
X-Gm-Message-State: AJIora+GTs+tWzuhiAeNkPl/glM2dKROih0zDrBVlZWRC/o33sMMcVIe
 w+UxT1EgXWmfmzLM/jjTNpO+W9vNhABeUw==
X-Google-Smtp-Source: AGRyM1t7RBgSKXV0+38mCAF5JZN3mMqjzXiViE4tVQsK4qftEiM1H1/jkxQLspz7IIhdFpVhG9SlIQ==
X-Received: by 2002:a17:906:f84:b0:711:eda5:db31 with SMTP id
 q4-20020a1709060f8400b00711eda5db31mr4007096ejj.397.1657293960314; 
 Fri, 08 Jul 2022 08:26:00 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 t23-20020a170906609700b006fed062c68esm20376721ejj.182.2022.07.08.08.25.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 08:25:58 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id v14so31027153wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 08:25:58 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr3937186wrr.617.1657293957904; Fri, 08
 Jul 2022 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
In-Reply-To: <20220706191442.1150634-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Jul 2022 08:25:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
Message-ID: <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Set the panel orientation in drm when the panel is directly connected,
> i.e. we're not using an external bridge. The external bridge case is
> already handled by the panel bridge code, so we only update the path we
> take when the panel is directly connected/internal. This silences a
> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> to set orientation from panel") which is in drm-misc
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>  1 file changed, 2 insertions(+)

I don't personally have objections to this, but (to my understanding)
"the future" is that everyone should use panel_bridge. If we made the
move to panel_bridge today then we wouldn't need to do this. In
general I think panel_bridge would end up letting us delete a bunch of
code...

See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
panel-bridge") for when this was done by ti-sn65dsi86.

Then again, I spent a small amount of time looking into this and it's
definitely non-trivial. Still likely worthwhile, but not worth
blocking a tiny fix like this. It also should be fairly obvious that
we should delete this when we switch to panel_bridge.

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume that we'll just snooze this commit until drm-misc-next
merges into a tree that msm-next is based on, which will probably be
the next -rc1. If desired and Acked I could land this in
drm-misc-next, but it's probably not worth it?
