Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60053EF95
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 22:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482C10E626;
	Mon,  6 Jun 2022 20:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B8F10E626
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 20:30:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bg6so11340939ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjlupzUpssQ/zXPtSpKMZWj3HluXgdG+Y/6lVpRKYVE=;
 b=jc7C1tatqDAwbmm4LtwxcZKUU4YS1aHlJAk16DJLh6iid4pPV6KnFvBqqryAGu4hpT
 gBOLwzgiy8mJ/KhKV+72Ub5FrPj9vR4NcxRr+2XWTWoRdkjQ5EIOVAWuZVDOa6dhCLeY
 CnIDgfMOqKU4Yf0R1TXwOkwAyXUWaZcjXVZ94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjlupzUpssQ/zXPtSpKMZWj3HluXgdG+Y/6lVpRKYVE=;
 b=c7UskmMJm7UDwvM5SZ/Qm70maQKBu/N22fICCICJYcPqwD2CxO9hGooJlgEwnzjvqe
 BlnAKGZJ1KGCYK/tsL7llCai/xZr+RzetDaGbdDyvBAnQ2JzmuH4tLoCqJ3W7tBdu0bk
 wgtlybNveH9WVmgevFUtXSMaRibQfjzDLRVpRz1Td4j6OMidtI1szFmnsCwzYw/+GeA9
 Jdy3g5ofFj/c8a3APMdpJ64K/vrDr+KdG8fCXQkAOoSHY12WijCSw5E5ApiuwBbgs4yM
 GP2vjGHausVa3qx4/zhpsTZ/vdo7ltxD+AGQO3r0tgyij8yCFbCkMMibt/tyNKQE8Jlu
 5rzw==
X-Gm-Message-State: AOAM531eIe9wBB9LJLXKUiOMHu4+Y5Wf63fEMeq1cnFna4k6ckmKLu+v
 nAd0ALXxIgFLXdcesozPJxcNgC+40irJu/+6uHo=
X-Google-Smtp-Source: ABdhPJx+vi5oyPUO7bjCFLTe5aqtmYs+/pzlDF3ft8GE0GZ+Z9yexvMA9OEvtKXgM27CvUDbjYUonA==
X-Received: by 2002:a17:906:3bd9:b0:6ff:4b5:4a8f with SMTP id
 v25-20020a1709063bd900b006ff04b54a8fmr16607630ejf.139.1654547421015; 
 Mon, 06 Jun 2022 13:30:21 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 o5-20020aa7c7c5000000b0042ad421574esm9237806eds.33.2022.06.06.13.30.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:30:18 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id n185so8233789wmn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 13:30:18 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr14738745wmd.118.1654547418071; Mon, 06
 Jun 2022 13:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
 <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
 <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
 <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
 <CAD=FV=X1F61nDcoQz4w1pJX_=Zzt6sLH8bcsGrxxTpGs6=yZ4w@mail.gmail.com>
In-Reply-To: <CAD=FV=X1F61nDcoQz4w1pJX_=Zzt6sLH8bcsGrxxTpGs6=yZ4w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 13:30:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URUUEtLfJprO72s307Op4Y9CQw0Uk3TUPBq8XAokhCsg@mail.gmail.com>
Message-ID: <CAD=FV=URUUEtLfJprO72s307Op4Y9CQw0Uk3TUPBq8XAokhCsg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state
 machine fixes
To: Sean Paul <seanpaul@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 3, 2022 at 8:17 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jun 3, 2022 at 8:11 AM Sean Paul <seanpaul@chromium.org> wrote:
> >
> > On Mon, May 23, 2022 at 5:51 PM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > On Thu, Mar 10, 2022 at 3:50 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > On Mon, Feb 28, 2022 at 12:25 PM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > > Ping for review? Sean, perhaps? (You already reviewed this on the
> > > > Chromium tracker.)
> > >
> > > Ping
> >
> > Apologies for the delay. Please in future ping on irc/chat if you're
> > waiting for review from me, my inbox is often neglected.
> >
> > The set still looks good to me,
> >
> > Reviewed-by: Sean Paul <seanpaul@chromium.org>
>
> Unless someone yells, I'll plan to apply both patches to
> drm-misc-fixes early next week, possibly Monday. Seems like if someone
> was going to object to these they've had plenty of time up until now.

As promised, I pushed these to drm-misc-fixes:

e54a4424925a drm/atomic: Force bridge self-refresh-exit on CRTC switch
ca871659ec16 drm/bridge: analogix_dp: Support PSR-exit to disable transition

-Doug
