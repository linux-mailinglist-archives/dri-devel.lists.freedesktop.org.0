Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94914526AF4
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 22:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9910EA79;
	Fri, 13 May 2022 20:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9610EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 20:07:50 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a21so11215599edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
 b=Z8kJgkrl1ICP+BHtwk0Kv0Ik1kTt5soCfHi56pWTcJMzYbpRkqUX6jgW6iVpuM01bP
 dUCoGTDtoou29KeWoXgevvlN94X1JwMBX+3AxqZRfib5zFYYWhL3QUauNdrp4YwUf081
 Ei6HAkxKxBgT9UY+3J7C2pJspiT8AMzk0Axq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
 b=Tp7X/Ph73BqMtoJAIjIAQbVgN+n7vkc/oC744zkMkcZ/1peIu8/PAYXa4r0ESLvtex
 QQcakUGuDENwrWwUWMHtKVDGu383L231IX3AnaWxrQcd/NhBllrnQodAqciOtRozzNDJ
 rld/OP0J5ERevD75DkmYQoxgW0UBHeXiJv/cfIleNenW/ckaD/C97eGVhkZzEhstqOxU
 Rgr3QbCuvN0gsjwYUQS3lvdik08R5rABVR+hM503G13kMRLPrmCSVqurrb5zAdkaSsGs
 fI32pQGFP0HII5oQ0/m3CRtCFSSDDvZ+Q/ElDnOJ/lZceLnMUUTKZZFrTgcm9+4tfJvG
 MEag==
X-Gm-Message-State: AOAM531r7dlB3zVNTIALGO4aC2OTOps+73yOjFttwxCj5xg/UOw7XMfn
 c4l0xyhjkCL/wBKruMaqPI/GTmqTu3fbr4QaJJ0=
X-Google-Smtp-Source: ABdhPJxoap9yCAuICYaNXf2KtGys+Apngui8tSNR13eAuYWu43va1DyRNIhy+O5KyFQAYNnGPf+i3w==
X-Received: by 2002:aa7:cd0a:0:b0:425:bc13:4ccb with SMTP id
 b10-20020aa7cd0a000000b00425bc134ccbmr353185edw.229.1652472468948; 
 Fri, 13 May 2022 13:07:48 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 ig25-20020a1709072e1900b006f3ef214d9fsm1093669ejc.5.2022.05.13.13.07.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:07:48 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id q23so12757027wra.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:07:48 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr5361193wrx.422.1652472467490; Fri, 13
 May 2022 13:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
 <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
In-Reply-To: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 May 2022 13:07:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 2:32 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, May 11, 2022 at 12:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 10.05.22 um 22:51 schrieb Douglas Anderson:
> > > If we're unable to read the EDID for a display because it's corrupt /
> > > bogus / invalid then we'll add a set of standard modes for the
> > > display. When userspace looks at these modes it doesn't really have a
> > > good concept for which mode to pick and it'll likely pick the highest
> > > resolution one by default. That's probably not ideal because the modes
> > > were purely guesses on the part of the Linux kernel.
> >
> > I'm skeptical. Why does the kernel do a better job than userspace here?
> > Only the graphics driver could possibly make such a decision.
> >
> > Not setting any preferred mode at least gives a clear message to userspace.
>
> OK, that's a fair point. So I tried to find out what our userspace is
> doing. I believe it's:
>
> https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/common/drm_util.cc;l=529
>
> Specifically this bit of code:
>
>   // If we still have no preferred mode, then use the first one since it should
>   // be the best mode.
>   if (!*out_native_mode && !modes.empty())
>     *out_native_mode = modes.front().get();
>
> Do you agree with what our userspace is doing here, or is it wrong?
>
> If our userspace is doing the right thing, then I guess the problem is
> the call to "drm_mode_sort(&connector->modes);" at the end of
> drm_helper_probe_single_connector_modes(). Would you be OK with me
> _not_ sorting the modes in the "bad EDID" case? That also seems to fix
> my problem...

I've implemented the "don't mark preferred, but don't sort" as a v3.
Hopefully it looks good.

https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-Doug
