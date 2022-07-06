Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA25695D7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 01:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344A910E260;
	Wed,  6 Jul 2022 23:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A276810E260
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 23:25:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r18so21078468edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
 b=gUDNXgh8oYKcJZw0fUdo4BytcCdgQxI55O9Z8eNCVrgBjjaoaN+pidJLGzKrW3fAqI
 hsvgccN+NLv3W4Qd5dsHD4E/vPub65TAG6ylvI/+TfIpXY4YS8UOm1l61MtOvueWxmzh
 TU02Ugf9JLdShW2ETtxvEPvMRHEZhot0uKREE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
 b=57ubDh181uX1rruiL/icVvElBifxntHX8pb4tWNxrNVfMFPgdccJcCaZP+ZVQ0ySyd
 qo9ukZSR3OExqHI3zXB1zMz2In6GnI/g3Ivj4tmt7WGuCmUCJvmpzZM6A4TZHE2bdXhe
 ymOgDrz+zIubt3/qyCZxbETX0QtZag3yx2szxX89nY9wDqmhzCrm7U36BHFs0iUWXM3E
 RYy+hcBBiLoozNE0++Y6ea9GpAVW6ioDlEZvfieszlboSQTbRG2MpCvLWiXx52VmqYzU
 gSEQI9WvfEhKy+CbL9elvDF9ATD+NvVbRTPPqnx5J9Ag5uPh7GOA3xdeETB+PD3gmwy6
 xbtg==
X-Gm-Message-State: AJIora+oDZ4xydaFNnXyB+t4K9hwttj35sa3EKMCM/ABqODv3OTx8mV7
 yQBmFL5lwfkUSwLEwtqOEB1S8D8vSPVI7bBVKt0=
X-Google-Smtp-Source: AGRyM1t3gyVUt+miggo2Urfpo4nRcnOtxDxiGDKZBgD5XwfP/fW3cIv+mpyeKJ38nVODNRrqFtEYoQ==
X-Received: by 2002:a05:6402:528e:b0:43a:2079:6411 with SMTP id
 en14-20020a056402528e00b0043a20796411mr31040822edb.267.1657149933947; 
 Wed, 06 Jul 2022 16:25:33 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 f22-20020a50ee96000000b0043a0da110e3sm10292055edr.43.2022.07.06.16.25.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 16:25:33 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id b26so24040926wrc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 16:25:33 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr38633425wrr.583.1657149550898; Wed, 06
 Jul 2022 16:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Jul 2022 16:18:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected
 connector
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 6, 2022 at 12:32 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

NOTE: I tested this upstream with these two trees merged together:

msm-next: 1ff1da40d6fc Merge branches 'msm-next-lumag-core'...
qcom/for-next: d014f9463260 Merge branches 'arm64-for-5.20'...

...plus a revert to make things boot again [1]. I booted this on a
sc7280-herobrine running Chrome OS. When I do this, the original
reported glitching is fixed (yay) and I think we should land it.

...but I'm not convinced that all glitching is fixed by this. In
particular I've occasionally seen an underrun at bootup (blue color)
followed by a temporary glitch. With the above plus ${SUBJECT} patch I
also reliably see a glitch on my external (DP) display every time I
plug in. I don't see either on the downstream Chrome OS kernel,
though...

[1] https://lore.kernel.org/r/20220706144706.1.I48f35820bf3670d54940110462555c2d0a6d5eb2@changeid
