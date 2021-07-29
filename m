Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258CD3DAA6D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF786E1B5;
	Thu, 29 Jul 2021 17:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F926EE1E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 17:39:34 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u25so9429840oiv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fg6r52inow2eredqNuunrN7gPgWwoSNQkX9Rb9jl48w=;
 b=W0ikMwg+8KsECvQ2qw9xlVmGUUVSsYwLa9jasRSdD+NCNBIZwzY1r5dkfyTmQLWSoJ
 g/yrb0s7IUD8/WVqQTaSf+UpC5c1SsZzIVJTEM3UAJkev5aZmmyfnjhMT9W72MfP+gvm
 9/JPIICpRZsQqNNaMkMitnTTQRvC4fRM+/SI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fg6r52inow2eredqNuunrN7gPgWwoSNQkX9Rb9jl48w=;
 b=CvzXVuGtyFbIl6+CVJLxNtPgRRyR84nYOOKxksY+qectv+xKGMDPsLv27RJnCoDLMu
 iI9cd1rW2AarOBPxwcBwnhsX70WAUDz9qlOMfG1f4Mu/lFe7+jH6ClGI7OAkyyzYwOCz
 9ybegbHo/P3E98XH+8eEy0ubeK705gIJk4UcTvEYiXP2Razzs2vvYti8R/KWO5CRRWbF
 gMFs25OC7ieGwQnx6QA/Rk7Dg1Zo3KFrIZHEHq7VCb7zccFSRhwu6KJrDYCOLL+aNd5y
 gzrbzs4ggAFYpeG8Yz4bZuGuhjIJLAUlSkAn1SuWoX8QJBm2i4ZrYt2LKn13Z9QaSiJg
 eDoA==
X-Gm-Message-State: AOAM533sQ6NKybTJZi1bfsKFeB9gZxzQh06tBEXTSVUwdVe4PiUhf+R6
 4F77k+BxJ/EpEUfmwFAmbF5fafyt1tFnJ0lQfjFBnQ==
X-Google-Smtp-Source: ABdhPJx96s/1lMlV94WjqJ7laUXC8JpsMbaub1L0ZBuEamot2D9hwru5WMKYSTLrcgsmmPz4jXxWGmzs2Pt/Y2uhplQ=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr2332599oih.166.1627580373628; 
 Thu, 29 Jul 2021 10:39:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:39:33 -0500
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
 <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:39:33 -0500
Message-ID: <CAE-0n5218NnzabN=PqpRTgPSza8GjCyY4=DmdR=LTbeFtvciuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu support
To: Rob Clark <robdclark@gmail.com>
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
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-07-29 10:35:32)
> On Thu, Jul 29, 2021 at 10:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> >
> > Why is 450000000 after 550000000? Is it on purpose? If not intended
> > please sort by frequency.
>
> We've used descending order, at least for gpu opp table, on other
> gens, fwiw.. not sure if that just means we were doing it wrong
> previously
>

Ah I missed that. I don't think one way or the other is mandated, but
we're already sorting other OPP tables in the qcom dtsi files in
ascending so this is the only one that is different.
