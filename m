Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A3501C0D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 21:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2E10E330;
	Thu, 14 Apr 2022 19:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505EC10E2FE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 19:40:31 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 w23-20020a056830111700b00603c6d1ce73so109849otq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
 b=ETgEm9IDuhcJCpRZjCKvwitdHctDrYi29lxjTbWawEHjmBCyLjRt4MYCErwWxyIiIU
 9oGWk2XpMi1dM7n5ZXoIhJ0xbZW+2UzdP/epWdGbxtw72AUKBsEqN300BmeuFGb6JktJ
 WiZk4JZpzp/44sQgTfDviIGsknHKZQ6/7y4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
 b=vTMREn4+843FIiLwgzbKVpRyjoBxAD4bBly+coBISAWuP0DIE3WCkaPWhhQAYWRS0F
 kcOQybtElcuB5baMABXzQeZlVFCkiF9GYffdBeAy25UaoILDTX0lmAgvXyjV2aDHhPeO
 QxRpk6B2lFpH9pgVex3wOoMGFUKsGtsz5h1DzeZ1rO21vN0Tdboh7WkYS0tiYY2Xx6GV
 yQD9cKuTOyT7hND/wYHcyQ4YOeBYb3BAp11QvzuVoJfTl9h22cUixOEDPk9LzweYkoaE
 hO8XTnK3TrmK/Bd/U/hM1CJzwzBBruT6jhgDdJd1BTEBzchScU2v1kcAklmUbiCwJptF
 /JBQ==
X-Gm-Message-State: AOAM530ff0SNSRvgvs8e3UcgjX87V1dtoj5TVFlPVz65jOqtwb6DZMaz
 itU4pBQi7DhbRmxbS+FZ8XJFkV2MKXWoiZv15blkLw==
X-Google-Smtp-Source: ABdhPJzlgZCJ3S0otpiIbEsDjjXXeYSCOZF8aExMi2XEL/qGTFsnoTp0g7uybuwoqYnKkMyfeBWPcXWlvFAuimKyVBc=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1455625ota.159.1649965230478; Thu, 14
 Apr 2022 12:40:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:40:29 -0700
MIME-Version: 1.0
In-Reply-To: <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:40:29 -0700
Message-ID: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
>
> I think it's too verbose and a bit incorrect.
> This is a bit saner:
> /*
>   * These ops do not make sense for eDP, since they are provided
>   * by the panel-bridge corresponding to the attached eDP panel.
>   */
>
> My question was whether we really need to disable them for eDP since for
> eDP the detect and and get_modes will be overridden anyway.

And to go further, I'd expect that a bridge should expose the
functionality that it supports, regardless of what is connected down the
chain. Otherwise we won't be able to mix and match bridges because the
code is brittle, making assumptions about what is connected.
