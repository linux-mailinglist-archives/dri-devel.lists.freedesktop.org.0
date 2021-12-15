Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709984762A6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDC410E949;
	Wed, 15 Dec 2021 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E5C10E66F;
 Wed, 15 Dec 2021 20:08:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o13so40091437wrs.12;
 Wed, 15 Dec 2021 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3w4bLnhbXz+gy4SSpVMo/9wv7aCJ9iSr/1jbBUNhCaU=;
 b=ATdR/dyVoQdaZhzVXDf29nzCxot+WfN8B5xJ5jG/FBPbFWGWJL839oattpLc20+WTL
 ps4AtKHyz3T0ot0009a+eTOiax5HNoybFydP6fHKZ/s4duQBZ+pGmTri8MS44+TTD0sr
 GqDvBWRokjMBZpxYDx7UEPltGDcUDq8TRnwXzW6WwD/qma3ZvsyVjpRLkOd77stfF/gW
 s+TZPOIZbHPeIvpVRhjMlJRXgJrZjkA/o6KVVx98ewUoD0GCHgutzioMPOa9yjN6CG+S
 NG0P1pLPsf2fHuj4+ImCnhItud7ra/q/NKaV2BPlM8iCy6dNKSmuTwZTv2RzSVtysBS2
 o7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3w4bLnhbXz+gy4SSpVMo/9wv7aCJ9iSr/1jbBUNhCaU=;
 b=o5xAfbCmgW3yOzgmN3sBhXfRtJuOqaHcEZytRZXzOUoNk5uyNXmZXKrn60jS0nGFbk
 OYvLmw1onFnVglo4NP1qF5IQyKIfAa9gksrgv/KhiriCfvI2jmlvwEj9J5UwBwsAVL35
 h1MY0CeyjC6ZSppnYbTwXZ1RhHggJVrT4P+1U/puJnAnD2JjnnydCFmG0zzi/1Gv0Z41
 wcoRcZHzEP5+zqMhEQWvHw/OVwURGUF39Az17RqvN9JU6lx8eC0PjeEJ3i2vs8ME+AN8
 V2PPIr6NJhMlyjBlqoZDXwo3/8jftuO2R+SZuzUKj33B+MOHE+SgO8C4UcnPviXjSPOY
 gOxA==
X-Gm-Message-State: AOAM533BW9OmrbWfg4j3P9X55M+EsGu3+lHPoKBJkASujuLwyeNVScRG
 Q3mv1vnJ3lQeARktUCs4eNYFBNbZbX7YTQpViIE=
X-Google-Smtp-Source: ABdhPJwK7KInIW25AHd0uB7Kp/T+/V2CIAVdobV+Z7fppew3Fl124A1Bw4BeAJs0FQtE816PMicxsU+qug0RS1Ov6Vo=
X-Received: by 2002:a5d:5986:: with SMTP id n6mr6090673wri.297.1639598911879; 
 Wed, 15 Dec 2021 12:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20211215175910.1744151-1-robdclark@gmail.com>
 <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
In-Reply-To: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Dec 2021 12:13:52 -0800
Message-ID: <CAF6AEGsrCssqo3v3uw00C0YmGAXd6DpqeCRpioqxKRkXeN27gg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't use autosuspend for display
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 11:10 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-12-15 09:59:02)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > No functional change, as we only actually enable autosuspend for the GPU
> > device.  But lets not encourage thinking that autosuspend is a good idea
> > for anything display related.
>
> I'd prefer to see a small blurb about why it's not a good idea to use
> autosuspend for display things. Then this commit can be dug out of the
> history and someone new can quickly understand the reasoning behind it.
> Just saying it's not a good idea doesn't really help.

The issue is that we have multiple different devices at play, and
potentially specific requirements about power sequencing when lighting
up or shutting down the display.. autosuspend would just turn that
into a giant race condition.  I'll squash something about this into
the commit msg

BR,
-R

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
