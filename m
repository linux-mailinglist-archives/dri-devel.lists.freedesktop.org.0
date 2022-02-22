Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2C4C03E9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A7210E784;
	Tue, 22 Feb 2022 21:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CEB10E758
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:33:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id r13so23837681ejd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2mHyuXRZ8I3kYyoLE5Iu8QS0sxIBaqpluj4s82tM14=;
 b=XU8m9oP18Bpix//+UfSCTLIeU0VonowaQlKnTBNjXvrf7Sh63zBVsvoj6iNCdjssqx
 sOLjMKD1S+Q9lPtN1ITHaXj2KgS6DfyohVrHjXxgbWst8I1vZfKJZ+uE6Zffys1MgxIg
 gsMi91m2uVrFrWU/GnUevsMXhSnRsE9nBQ254=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2mHyuXRZ8I3kYyoLE5Iu8QS0sxIBaqpluj4s82tM14=;
 b=xjTw+6YFvcsL0l71HLxtjpeZ1TESwem813cT2YzqTYzSgM5/BnRabwV7L1pwBpfvMM
 XlvraBq6OaZdG/QZebxuBhxT0XpLB5+Yy5V5BRRylEhA7sYGzv1Pl0ZamWZbO6/zOG41
 zwduzn9O5ifjCFStg6ozt7PEomzBSHrMmQr5MsT5A8oygv0M0ivEmcQVuf1R6ZbQ9QDP
 6fOVI4EOuUbA24QWDceJlXBTiqBeHRMzKwVkAPiJZ4wfOK9PbdD3v7sWhVaUFFPAPS1j
 S/DXE36S6BeOqSy5x9smBUis9zGue4AOKZckds0ddRCDVyMyi4SPia2KHrh0BeOpSNYn
 qfgA==
X-Gm-Message-State: AOAM530aB1OJfU4wtVT5WA0bc6hfyXX1pK2gRie7v4wi+crfc95OycHw
 Uwq2RVQHU7MgLhkN/xVLfiJ3RqE6AExLowVdrLY=
X-Google-Smtp-Source: ABdhPJxEFFGDDFTdTbpZKsBnJQylKJwm+pFZSJ/0xyhcHTuatiYz6vHoJ+gqtkzwvylIPQWqGTTR+A==
X-Received: by 2002:a17:906:1e0c:b0:6cf:d014:e454 with SMTP id
 g12-20020a1709061e0c00b006cfd014e454mr20989506ejj.583.1645565594820; 
 Tue, 22 Feb 2022 13:33:14 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id eg42sm8775862edb.79.2022.02.22.13.33.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:33:13 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id c192so12459769wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:33:13 -0800 (PST)
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr4877434wmj.98.1645565592614; Tue, 22 Feb
 2022 13:33:12 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
 <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
 <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
In-Reply-To: <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 13:32:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WJdcVEmnUvFfkJY3V2eWF2t4xkfCKNwaFHY+FwORg4VA@mail.gmail.com>
Message-ID: <CAD=FV=WJdcVEmnUvFfkJY3V2eWF2t4xkfCKNwaFHY+FwORg4VA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 1:23 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 22/02/2022 22:25, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >>> +static int dp_link_psr_status(struct dp_link_private *link)
> >>> +{
> >>> +       u8 status[2];
> >>> +
> >>> +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> >>> +
> >>> +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> >>> +               DRM_ERROR("PSR LINK CRC ERROR\n");
> >>> +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> >>> +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> >>> +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> >>> +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> >>> +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> >>> +               DRM_INFO("PSR Capability Change\n");
> >>
> >> DRM_DEBUG_DP
> >
> > Not sure I'll have time to go back and review the series, but one
> > thing that caught my eye as this flashed through my inbox is that I
> > think all of these "shouting" are deprecated. It's even officially
> > documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
> > deprecation notes to DRM_...() functions").
>
> Agreed. But not the DRM_INFO too.

You're saying that DRM_INFO _isn't_ deprecated? I was pretty sure that
it was, too. If not, can you please submit a patch to `drm_print.h`
clarifying since my patch (which folks Acked) marked it as deprecated:

+/* NOTE: this is deprecated in favor of pr_info(). */
 #define DRM_INFO(fmt, ...)                                             \
        _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)

My understanding (also in the description of my patch) was that
DRM_INFO() by itself didn't add much so we should just use the
standard pr_info(). If pr_info() wasn't to your liking then it was
better to do drm_info(drmdev, ...) or drm_info(NULL, ...);

-Doug
