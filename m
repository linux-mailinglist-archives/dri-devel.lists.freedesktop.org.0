Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8B3814EF
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 03:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5356E30D;
	Sat, 15 May 2021 01:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994876E30D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 01:30:11 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id 31so298795vkl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnKdVLmA6JV4gVRXBLAZ9YZgzU3RbAwYHw7sjvnZr2M=;
 b=VwV6MZUCTsR/21K6Nf4JfACfINmxMfGCBHGmn98b0KfWsmCZrSQ2JpyT8Bdp68jt86
 sDNDN7SbuawvPtvhjP9wKtwRygwgJzn0tfMmDDcZ+h4vVw6XJcnXLyVLstDDSixUw5Wg
 a/R/uOdLzy1G4+2g8s+miyc6pGFSjC8j19gPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnKdVLmA6JV4gVRXBLAZ9YZgzU3RbAwYHw7sjvnZr2M=;
 b=lpQRI67p8jZWxBGBmRnbOyA6+XvUj47n5AKkSAcS8A+U4H63Jzzq8M5dzkjRCPfTF5
 GAwJEy9E7fpWwi6DRARvGkdA5uoEGdX4ysVv3Mmnq/qEL7geRTJj/RtPXfP2NzYutNH0
 iLNpc0Z9Zxuovwohcbtu5/2nDiWoj0EtICkDJuUdaBGhWL2iK61Kvzvn1mB211dG9uqZ
 irLwE4epij3UTnlsCm1XlxGMnuPmxx4Trc4pPQnO+NmztQJr28XArepte0zN8+2BKR61
 GVWAiDYuKJgs2Zvog59+J/SQnf2mXJpTMmjIm9J4A5txVz9LFBGmwZkAV27GWtLiLpus
 r65w==
X-Gm-Message-State: AOAM533g52IZ/qlYJayC8qYhU756hfTZTwlAdTp0Um200zAx+SXM3oPO
 v1RhS3JCPjX9D8ci5QvbjsMQqfkw3uEVKnMtJN7+og==
X-Google-Smtp-Source: ABdhPJx3fj4K/0hK+tGEFHOV0fBGKfWSZTp6om4TbcQ6XfQmzQb1l75qCqJGUbHXGY2nyNG5LbOZQsO3ewg/M0mqnt4=
X-Received: by 2002:a1f:c704:: with SMTP id x4mr2701192vkf.9.1621042210632;
 Fri, 14 May 2021 18:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
 <CAAEAJfD3i+L4w1NuE5pUkMuH=R3CfBztDn-ZLcYR=onkcZ4Gxg@mail.gmail.com>
 <373d0803-8658-9413-2f51-1e9804c39126@baylibre.com>
 <ce401ca2-e285-4fcf-0583-c1dae94dba6a@arm.com>
In-Reply-To: <ce401ca2-e285-4fcf-0583-c1dae94dba6a@arm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 15 May 2021 09:29:59 +0800
Message-ID: <CANMq1KDwVdhw+4UnshoG8Ex5Axyhk1d2WeUxbL=mJTGRsAMJGA@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Steven Price <steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Fei Shao <fshao@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 11:27 PM Steven Price <steven.price@arm.com> wrote:
> [snip]
> >>> Seems this version is ready to be applied if we get a review on the DT ?
> >>>
> >>> Mathias ? could you have a look ?
> >>>
> >>
> >> Given Rob has Acked the DT bindings, I think it's OK to apply patches
> >> 1, 3 and 4 via drm-misc, letting Mediatek people sort out the DT changes.
> >>
> >> My two unsolicited cents :-)
>
> You make a convincing point - and if everyone is happy for the DT
> changes to be handled separately I don't see a reason for the other
> patches to be held up.
>
> > Yeah sure, is there a panfrost maintainer in the room ? I can apply them if you ack me.
>
> I seem to be applying most Panfrost changes these days, so I'll save you
> the effort and push 1,3,4 to drm-misc-next.

Thanks Steve!!

>
> Thanks,
>
> Steve
