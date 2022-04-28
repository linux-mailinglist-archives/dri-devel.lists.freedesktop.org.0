Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30390512E34
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434A10F793;
	Thu, 28 Apr 2022 08:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8230810F793
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:25:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l18so8013518ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBFLXMdrqZoM8pTN9XOZZVLOcyL+2U8hpcEKfTTlXlY=;
 b=acPfvYBo2zGMcnL/ebZtDurllXBYVvGnQWuYbMdEyr/qKgqwEyxoxvyTBSgGBJRepN
 576veejTCJPrq5g0WnVeEqMKfXhzQy9BrtyfSMjgpZ299k+IXH5ISoEUe3gZsd0S4135
 94XlelFYgIROHiCxNIMcPrWG5fGhxOUK7zwS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBFLXMdrqZoM8pTN9XOZZVLOcyL+2U8hpcEKfTTlXlY=;
 b=Je9pmbGWVvyi/Rh7PR+mj64XcflCUf43BWFK3rglN12Y67Gt8UHpJreFS+Nl12YEpj
 m7r9K+ws9HsRJyFOBXzxYN8O/Ru7/zuIC1bBbx98FzX1MhnFr5SV+pdTLwu0TpP0Sk8O
 A2/CUf3KKxrwMnZriiDnGp7UF5tN1kRQU7N5npvlLzTIm2VDCJR7lRwLySQ7D2n+7qtF
 rySGqwsygYwcf7BRjZAMKbbR6jqLe4eT2U4Bn010PaZeptA2dyBDu4f6wLXyAd0NdgOo
 1R5VhGUUbsj1/JdfFUStBjpzjV5WDJedL+IpbOiM4ehbd1kUKPQ9XisvKcdDbr23ShAI
 yXKw==
X-Gm-Message-State: AOAM530PXNpZWzh5PAEf02HFtyYPB/ccw0lzjfTPf7wwcTtF87iKuv7v
 q0K6zlR+3+iJLm6rwF3IMVCPDUBSBdrEtnf76vQ2iw==
X-Google-Smtp-Source: ABdhPJyyqoaJEPIXQO48nP32E2pidZpyto+Tp7PAetnqqtbxUKQnW+q5FcYhfABf4qMQZGVhvMLBniJjkCWi7+KbQWQ=
X-Received: by 2002:a17:906:1315:b0:6ef:5903:c5d1 with SMTP id
 w21-20020a170906131500b006ef5903c5d1mr30037607ejb.537.1651134329995; Thu, 28
 Apr 2022 01:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat> <YmEdAVwZuA7Wo1Ch@aptenodytes>
 <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <CGME20220427143420eucas1p1aa7dff284512e1c48c3db414633237ea@eucas1p1.samsung.com>
 <20220427143410.bectqumq62qmlv5x@houat>
 <8cc97a1b-f03a-3303-4357-fc26abe58fcd@samsung.com>
In-Reply-To: <8cc97a1b-f03a-3303-4357-fc26abe58fcd@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 28 Apr 2022 13:55:18 +0530
Message-ID: <CAMty3ZDFCJyXxM1__H=XTupLy-npDwJVbBf2k1H=Yo7LFf82rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Apr 28, 2022 at 11:47 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Maxime,
>
> On 27.04.2022 16:34, Maxime Ripard wrote:
> > On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
> >> On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski
> >> <paul.kocialkowski@bootlin.com> wrote:
> >>> On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> >>>> On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> >>>>> On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> >>>>>> + Linus
> >>>>>> + Marek
> >>>>>> + Laurent
> >>>>>> + Robert
> >>>>>>
> >>>>>> On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> >>>>>> <bjorn.andersson@linaro.org> wrote:
> >>>>>>> Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> >>>>>>> bridge")' attempted to simplify the case of expressing a simple panel
> >>>>>>> under a DSI controller, by assuming that the first non-graph child node
> >>>>>>> was a panel or bridge.
> >>>>>>>
> >>>>>>> Unfortunately for non-trivial cases the first child node might not be a
> >>>>>>> panel or bridge.  Examples of this can be a aux-bus in the case of
> >>>>>>> DisplayPort, or an opp-table represented before the panel node.
> >>>>>>>
> >>>>>>> In these cases the reverted commit prevents the caller from ever finding
> >>>>>>> a reference to the panel.
> >>>>>>>
> >>>>>>> This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> >>>>>>> panel or bridge")', in favor of using an explicit graph reference to the
> >>>>>>> panel in the trivial case as well.
> >>>>>> This eventually breaks many child-based devm_drm_of_get_bridge
> >>>>>> switched drivers.  Do you have any suggestions on how to proceed to
> >>>>>> succeed in those use cases as well?
> >>>>> I guess we could create a new helper for those, like
> >>>>> devm_drm_of_get_bridge_with_panel, or something.
> >>>> Oh wow I feel stupid for not thinking about that.
> >>>>
> >>>> Yeah I agree that it seems like the best option.
> >>> Should I prepare a patch with such a new helper?
> >>>
> >>> The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> >>> case and add one for the child node case, maybe:
> >>> drm_of_find_child_panel_or_bridge.
> >>>
> >>> I really don't have a clear idea of which driver would need to be switched
> >>> over though. Could someone (Jagan?) let me know where it would be needed?
> >> sun6i_mipi_dsi
> > It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_bridge at all?
> >
> >> exynos_drm_dsi
> > If you reference 711c7adc4687, I don't see why we would need to switch
> > it back to the old behaviour. It wasn't iterating over its child node
> > before, so what does the switch to drm_of_get_bridge broke exactly?
>
> It broke getting the panel if it is a direct child of the DSI device
> node. It worked before because it used following code:
>
> dsi->panel = of_drm_find_panel(device->dev.of_node);
>
> which got replaced by devm_drm_of_get_bridge().

Yes, we need to revert that change back to find the individual panel
and bridge. I'm preparing a patch for it.

Jagan.
