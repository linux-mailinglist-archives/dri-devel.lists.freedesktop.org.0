Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E348B63F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710810E326;
	Tue, 11 Jan 2022 18:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2810E323
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 18:58:42 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z22so25944311edd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OseqO9uvatTwFS9vmE3SyFEp4j52HosRPK45i5UL9kA=;
 b=ivr3i8jTj8D112gKPTLoZSOffkjoCeWEyRVkv/yKYsVZ4lkc8obbwxJzc8HtfU3Z4u
 /cJ92la3VhQc/L4iR5ibKEVyQWh8oBaEfSZL1xTnY/rELUAmTARjeay3tEVZVgxqSDsr
 5zhG7kpmDMyuRhHSuOS8f0aQ6Vxv0hg/PCYIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OseqO9uvatTwFS9vmE3SyFEp4j52HosRPK45i5UL9kA=;
 b=vyoU/9k8tKMlebPxL1mdhHx4tQJ6ETgTjKmv0yykTQeFleUGH9hPLD9sTI9YOFo5jF
 fYg4CIMlYJe6E+tFNg5vQkMzdXySMjVbV4v5oWYRM/0jALItgzgkRj6FU7Qol9846AkO
 SsIedd6ZGP2L1mHvaPCvuDhA8n5ni0gz1zgrOrazkn4yRa4U2Pfhq362rb6Z0kx81l5X
 0aVz/5ZYauQ80vydHzCwfWN+Y6hZP6f/sB73mV1nc3dg4shn7JITqa9N71sIgm8IsF+r
 cQExEDpTc7DfzgtWzd6cEqDOA4HLKg59dRi6cRLQ3aLZdH19WyEzK0syMXzwggIpi5ok
 jPig==
X-Gm-Message-State: AOAM533dPLb3wgKg7ougD7PUfI67rxVSAwQoFu/Zzc+nWSj8uzVyUbI1
 BFeuxPdOHVpfC8NFlRULfctUYYQuSjlsW1GScfYCSA==
X-Google-Smtp-Source: ABdhPJzsJBR31op+ZQJBwUUBWjfuzKvYSnVDI1Fdz0WpVjzkQfFUVrFR0YdhirA/LRLBI57arAdRceDB8iPcuSsqBPA=
X-Received: by 2002:a17:907:3e09:: with SMTP id
 hp9mr4993000ejc.537.1641927521449; 
 Tue, 11 Jan 2022 10:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
 <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
 <CAMty3ZA_UsvmTprozT+MgfZ4Q4LthSk340rV_0YwcmTy1Vyk4w@mail.gmail.com>
 <CAMty3ZBp7_JFvsBcQTpRMBYS7oWcT0TagUW2uQRGMuaakzF+cQ@mail.gmail.com>
 <1a195d36-3ac0-389e-442f-ebeb7f85ab40@samsung.com>
 <45de6555-7407-5f48-247b-4d093eb17fe2@samsung.com>
 <CAMty3ZCCT-ecR1LLecsixbt4Hd26zi_nqZ-1GJH7Wji91XT-tQ@mail.gmail.com>
 <CAG3jFyty+tdcm--gTHyXbmeQFx0btF0X-orD3HV0keC43FLfow@mail.gmail.com>
 <CAMty3ZAti1MRDmks476R8+-moM9138oa=OBftH2R3QDrAOG+MA@mail.gmail.com>
 <CAG3jFyt1OKVup-sKNBUr=WF7w7cWNO-j=GKajYHd5rTYNKC+qQ@mail.gmail.com>
In-Reply-To: <CAG3jFyt1OKVup-sKNBUr=WF7w7cWNO-j=GKajYHd5rTYNKC+qQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Jan 2022 00:28:30 +0530
Message-ID: <CAMty3ZCK1MJz=MG-wLUVQNgNznLKQT91CF1+BW57KY7LNTOu9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 9:10 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Mon, 10 Jan 2022 at 16:35, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Robert,
> >
> > On Mon, Jan 10, 2022 at 9:02 PM Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > Hey Jagan,
> > >
> > > This is a mistake on my end, I must have been looking at reviewing
> > > this series and then accidentally included it with another batch of
> > > patches. Thank you for catching this.
> >
> > Thanks for the response.
> >
> > >
> > > I would suggest reverting these two patches[1][2]. Is that ok with you?
> >
> > May be I will revert 1/2. but 2/2 is valid. Please let me know, if you
> > have any concerns on reverting 1/2.
>
> Please go ahead!

Sent.

Thanks,
Jagan.
