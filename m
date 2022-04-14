Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FD5018ED
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57210FF3A;
	Thu, 14 Apr 2022 16:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81010FF3A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:40:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t25so7070979edt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
 b=N693k4tshoimUMR7PJSOzCwUrqo6jmdbynTTZ5/gGXiI4BUH5YFaTyhChlD1qYPwIv
 Kh7ugHtuZ2uky5ruCQ6mniUIioKbVQxsbZ/Rnh06noLFOOH9Mi+acFsRtex2XGvkaG4R
 Q3VlTKcErFU8W0iVIIxODoppOuI9yIftPOgPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
 b=z6Sc2h7L5/fpdV3JgJFygqwfbHaEDCFQrk8Fgqa2Lu9GXJsoPCR4m2LGbfGjAFDtee
 DxsetUvDvVJpeJ+1esabxqb5+HVofecqmXqKARfqDdH3odcjJ82cQ6BLwqMVF41c6TZt
 qdSXksqfCEoZhl3TTi1DuKrMIvmwQP2kavMICYF25XFSyu2IAQS0q9BqRY+3reVaksUk
 fWCYtfUC8tquMt1jIgi4RjxBbhCp76gDeL00QmykR7Yc3s/gEYiEVxIPHPA7B9nA0GJT
 iY7FjTp3/TbpdvxOjZfvmDqgaQzs1gjqH/ZHnytqRXg6ZDysljKzZknTgYG+LreBLEJ7
 GlUw==
X-Gm-Message-State: AOAM5317b/YVO21Tzp4CHDvRn+47/frl7oGUaJBTv1Y0J6iUqM0s3/i6
 YCcrN3A+uVlyoq/Z1qAnGlAGaL1ig2PB0CUE
X-Google-Smtp-Source: ABdhPJy2eD8P92okM1EQQibr77CAmnHT69xvk90FhKrfK6z++NuAMxKzEA0eyETX2w/MjooDtPXTuA==
X-Received: by 2002:a05:6402:35d2:b0:421:36a0:1bc8 with SMTP id
 z18-20020a05640235d200b0042136a01bc8mr3052806edc.28.1649954431001; 
 Thu, 14 Apr 2022 09:40:31 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 bw3-20020a170906c1c300b006e88cdfbc32sm796496ejb.45.2022.04.14.09.40.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:40:30 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id c7so7758019wrd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:40:29 -0700 (PDT)
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr2734623wrc.422.1649954428907; Thu, 14
 Apr 2022 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:40:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add support for the eDP panel over aux_bus
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

On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This series adds support for generic eDP panel over aux_bus.
>
> These changes are dependent on the following series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*

You're basically depending on the last two patches of that series.
What's the plan there? In patchwork they're marked as "Not
Applicable". If they're good to go, maybe we should land them? If not,
maybe you should include them (with Dmitry as the author, of course)
at the beginning of your series?


> Sankeerth Billakanti (4):
>   drm/msm/dp: Add eDP support via aux_bus
>   drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>   drm/msm/dp: wait for hpd high before aux transaction
>   Support the eDP modes given by panel

One of these things is not like the others. One of these things just
doesn't belong. Can you spot which patch is missing the prefix by
looking at the subject line of all 4 patches? ;-)
