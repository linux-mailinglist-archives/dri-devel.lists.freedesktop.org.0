Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F7739C30D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D66E40F;
	Fri,  4 Jun 2021 21:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBE06F55D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:56:10 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so10520923otl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 14:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=evDQonRj1S3K8SX7rZUDCIBczFx/sTo8Wvx2aYwIKls=;
 b=OWVBOB4L27Ux5W7z3KOprvIdOjq6V6gJYuHTJkkC+0KGtG05Uyygnys63nU6Hg4h7j
 iB+z2RmmKspf7lVJInQgiatOtsE65JJNqbtYqHRLPcsOVBsrm6FGazfGDlE4y5uGFGXG
 +4+fz2igEEl0ganIoL7z4jkhrrpZTxNkyRA6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=evDQonRj1S3K8SX7rZUDCIBczFx/sTo8Wvx2aYwIKls=;
 b=Of9wvb2rlzLr8li16T/diyb6XhnGHeip7G9+KcvWf278jY37hnHoj9dQ/bhz2CcCpX
 SYwhK0HaZmqUYsmzS6/PkfEmM/BQIhzaNrwD52d3dP70rN49AfVx5GPLEHhJN+XpEMz6
 Zl8aoXEoHTMJIFndx++DLeTEHo3NNthp9LInFPohHlzpWwD5D78teOg8kAqCfEl0DfHn
 iVKEpBfvvk2wZQWW1q55SPhABXMgTrgtm8OzJPYcaPgcqMiBV1ubKU7kzx7l6dk66zKL
 HF///9NW6rjsJzDA9335pPu/PNLC1WXym9D5/YOh+VgCUasYucq5zvob7ikiH56g9wCI
 LaJA==
X-Gm-Message-State: AOAM532AhAGiV5qLRn7Y8/GIvc6a1YaEW55AbNDJMLDRUqQvnZjxjauL
 VOkS3JOJEhXrlNY3o7kjVg5ca7+4++1glo7D6EuhEQ==
X-Google-Smtp-Source: ABdhPJz30wwX+MWCxP0OwF1fi1pxyg1nUhQ2q7Vjonlctql1t61M7fV2t4d5RvkXGcWbtIcYD5GCLLqwA8BnqteyMT4=
X-Received: by 2002:a05:6830:3154:: with SMTP id
 c20mr5443978ots.233.1622843769406; 
 Fri, 04 Jun 2021 14:56:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 21:56:09 +0000
MIME-Version: 1.0
In-Reply-To: <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-5-bjorn.andersson@linaro.org>
 <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 4 Jun 2021 21:56:09 +0000
Message-ID: <CAE-0n527b2FRKs83=9OBdUYPJXdT_fLx1-AHNA2uAQkpcSTWaQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
To: Bjorn Andersson <bjorn.andersson@linaro.org>, abhinavk@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting abhinavk@codeaurora.org (2021-05-28 16:40:32)
> On 2021-05-10 21:20, Bjorn Andersson wrote:
> > The eDP controller found in SC8180x is at large compatible with the
> > current implementation, but has its register blocks at slightly
> > different offsets.
> >
> > Add the compatible and the new register layout.
> >
> I am not able to completely recall the history of why in the DP bindings
> we added DP register base as a big hunk and let catalog handle the
> submodule
> offsets.

I complained that there were many I/O regions for the DP block that
didn't seem to be changing between SoCs. Nobody objected to removing it
back then, but if the plan was to move things around later on then it
makes sense to split it out like it was done initially.

>
> I guess earlier that made sense because DP sub-block offsets were fixed.
> But if we plan to re-use the DP driver for eDP as well like this series,
> then maybe it might be
> better if this comes from device tree like the earlier version was
> planning to
>
> https://patchwork.kernel.org/project/dri-devel/patch/0101016ec6ddf446-e87ab1ce-5cbf-40a0-a0bb-cd0151cd577a-000000@us-west-2.amazonses.com/
>

Agreed.
