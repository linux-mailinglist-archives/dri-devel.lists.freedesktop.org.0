Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D18489C68
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 16:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168CE10FD36;
	Mon, 10 Jan 2022 15:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EBA10FD3A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 15:40:47 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so78184pjh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 07:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4TL6PsFI27SpOgQsA4dW6LswzJmJ46hdUG8toLOJxw=;
 b=KAOVifIap9tu408fXfJlHTeiRGMsLFfvJot4BLlz48tAniJqwwtrkcllGmt5hQrIql
 ey7+u818etNkkAQYK46rP12TxD96u7wW7EP0hCCVJlJeJBAYacxQI4yh4n/q4mfhg042
 nFUz5gY9GkyZAckQFWjeH0UPY9oavdp1QLkU6A5/kBMXO+rSIPpOthpB7pTSZZHmLyi2
 PtuuAHX51RdHmg1fNwoa1YAUWA9IroZuZE+r5F6lSwrXrEH7Fy34bP/wB9F1FqLJCfhv
 /LgrqLmtvrVm15lhAsje47++ESG7ztFPbIXN7ii9bdd7NFikd7OmuqaP53g4/GBUCfjB
 sPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4TL6PsFI27SpOgQsA4dW6LswzJmJ46hdUG8toLOJxw=;
 b=N430xzgwZ1mO0qjBudWxQqsqI7tqseCPhfuYAmHWJRlrWvK6C2JDfZBHL0SnOxWTCJ
 RGJ9VXNtscaqI2Zy2bz/GvnOuC5LhKCG2jGJaiUG8yF4t+rEWDLsY5lwopBm1XsArQuM
 yjsz8Vaed1zSG23dhT8n5teYtn4VavWKglWRadjGLtS7X/xmhEnpk74H5xuY3MxegP9V
 cqRTnK7BUU07ZozpiLvPhhpJKTtevQT2ItnWs2NCMxkzcm4O8CUMpYZDzM8/SFtjaP3/
 IKWx94J43Fil7cLHq91IPObY7InwzDsGAVah+Q+tRwuDGvalCJ3FB6LAS+rPkepcaB18
 Zazg==
X-Gm-Message-State: AOAM531MPOuWiqLR4BlJykqC+H0hV/mK6catA/32JQmvlpxaRK3yZaKb
 DKb8L7SDK93zVBdv9McLYUxKixgOc0ZfdEeygMCvfQ==
X-Google-Smtp-Source: ABdhPJw++JgKWjKt1diL15dR1POl2WnbaUAckRlgyfdumvjypm5AzlOaYlqVSPUPcQ6xHjsMu4K21jrqR43WhaRMkko=
X-Received: by 2002:a17:903:110c:b0:149:8018:e9d4 with SMTP id
 n12-20020a170903110c00b001498018e9d4mr21666plh.117.1641829247083; Mon, 10 Jan
 2022 07:40:47 -0800 (PST)
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
In-Reply-To: <CAMty3ZAti1MRDmks476R8+-moM9138oa=OBftH2R3QDrAOG+MA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 10 Jan 2022 16:40:36 +0100
Message-ID: <CAG3jFyt1OKVup-sKNBUr=WF7w7cWNO-j=GKajYHd5rTYNKC+qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
To: Jagan Teki <jagan@amarulasolutions.com>
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

On Mon, 10 Jan 2022 at 16:35, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Robert,
>
> On Mon, Jan 10, 2022 at 9:02 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Hey Jagan,
> >
> > This is a mistake on my end, I must have been looking at reviewing
> > this series and then accidentally included it with another batch of
> > patches. Thank you for catching this.
>
> Thanks for the response.
>
> >
> > I would suggest reverting these two patches[1][2]. Is that ok with you?
>
> May be I will revert 1/2. but 2/2 is valid. Please let me know, if you
> have any concerns on reverting 1/2.

Please go ahead!
