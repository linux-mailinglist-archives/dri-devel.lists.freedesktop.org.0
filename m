Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8A350B96C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4F10E26D;
	Fri, 22 Apr 2022 14:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CE10E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:03:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id g13so16634953ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
 b=EwnC0F+Pg4MtRzeeWPuywGVVfrIfoQpkjZejmyOOhaV3NRtb5XzudpYoMW98fIdcAm
 NUM6hR06S3J+6kzWZeWdVcyZdI0Toqj/vsaUJ+zpNTbPAQhBWPEucmWtE0wTHtBDsJ05
 p7cS3QW5VSa1GBar/5aair5GlO7o2wDtoN4xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
 b=sG/MNzYdl/4r03RJb04gBG+00gOaoxbflR3f5x3fH+MxtAfDzXl6drXYw+/QPjE7Fx
 4vyQRTlC+ly1uM7vHoryE5usQ5dfTF3CgzYkBwaOlpD0REX/K0znbYqucWMZSXWOMGdX
 3vB1fr0FmCIRvV7gRmaya7DGari5+dYgPTRdhDMcGy6X7cSzZF3B2+TueGKZ9e+agFe5
 wjR8HArgCkxm3sRksSwJIdVO+yH8E9vqFug57NFFEX4NuJ638e/qmjHAdG2R6jd5UxYr
 jdfCollor7FiYBCbEBNTvlX7H7lHc9sM14uugoNnkjyRubY+uazYmq1qrQ12DVeA2vSU
 +hzg==
X-Gm-Message-State: AOAM533f1LdwXp2RaeoJELvc1aOb8WsPRBIvekmL5gzuQ75+2JYJA5qL
 THtObFVcD7wgVrM3YRsHD1TZ1VR8BpgOZpAeDOY=
X-Google-Smtp-Source: ABdhPJz5+inYXhunDAfP66J62FbQZywGt+018TFlV9FSgfC54e1/d4Ujf7jv+OQbmKYuEW61D1MVuw==
X-Received: by 2002:a17:906:7f09:b0:6f0:22bf:2e65 with SMTP id
 d9-20020a1709067f0900b006f022bf2e65mr4216546ejr.359.1650636205340; 
 Fri, 22 Apr 2022 07:03:25 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170906170200b006efe7be5f10sm782660eje.185.2022.04.22.07.03.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:03:22 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id c10so11232061wrb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:03:22 -0700 (PDT)
X-Received: by 2002:a5d:6506:0:b0:20a:c240:90e2 with SMTP id
 x6-20020a5d6506000000b0020ac24090e2mr3855081wru.342.1650636201140; Fri, 22
 Apr 2022 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 07:03:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
> controller driver should support aux transactions originating from the
> panel-edp driver and hence should be initialized and ready.
>
> The panel bridge supporting the panel should be ready before the bridge
> connector is initialized. The generic panel probe needs the controller
> resources to be enabled to support the aux transactions originating from
> the panel probe.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comments for panel probe
>   - modify the error handling checks
>
> Changes in v8:
>   - handle corner cases
>   - add comment for the bridge ops
>
> Changes in v7:
>   - aux_bus is mandatory for eDP
>   - connector type check modified to just check for eDP
>
> Changes in v6:
>   - Remove initialization
>   - Fix aux_bus node leak
>   - Split the patches
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 73 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 23 +-----------
>  drivers/gpu/drm/msm/dp/dp_parser.h  | 13 ++++++-
>  5 files changed, 101 insertions(+), 30 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
