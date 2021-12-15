Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A526C47616D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C810E9BD;
	Wed, 15 Dec 2021 19:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE92510E9BD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:16:41 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id d21so13767442qkl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLU/Sw5wzKqay9gp22pj8Nn9MOB4rOhm6u23bE7uK20=;
 b=B6xyOd8qdqOqaljKzPjKwLWjL2X7w7nH+zr60O+SHn6FDr1PCey+5unXwZc4F96T5Z
 2u4T7+81y7nZQOMj1Ngw+PrtT7i7JLEQ5lf+Jar59vC8TuYgaRNQ9rJiXOWajA8Q5z3i
 YRorOIVXlvW6jJtW6y9esWPKJbmyqx0Ht9qR0/V8FARH3r1FZpZISlvJ8X/Y6GbvgeW7
 hebQurTcOxREScJDR4HekCQwSSsX230j3Lg9sPhbPl+Y1qKDrDTRmei1h6MVc+yJfN59
 CxqxD13wB/oL3qnhVv2FZgrHjQ8o2/v4VBWQQxM+KuwTiGmw1ibXcG7FK5AfUDoX/NIR
 ZyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLU/Sw5wzKqay9gp22pj8Nn9MOB4rOhm6u23bE7uK20=;
 b=m0XPZ73PjLzvVHCEfjISOLSZ7+Sy92skjVVlfO0eV9WoGkkiVAm5InyWw83x3lSiLq
 +rVP5tVLo4WL6Le+318FoegEY3QJ79wj0jndGXSExjizISOGnfpFYS74NPYh1qOjUvnr
 VYsp1XW59AMMZ2ypCiZmBVQtIfXTm2uPZ7czB/JHeqOZJ135pWiIUirpVHmTMx9pELSC
 JwruQ1kxWXwtfR0mgy2aZIig6TvJDjwfDzveus6grQBj2Q8Ty8YFFvrbnUdCkiy1CB16
 Ib548PcW6v/iCee/Bpl033NjcBmsOe6i+Uw7Fjj1fOKtLyDI1mZmU23uW7n1GF70Dz4N
 ExDw==
X-Gm-Message-State: AOAM5301jbQRnUSpG1++1SOAAJwq1TX5yLr0lCs+BGfz+9RabAjK1uY1
 WI1azjDCqqclunkTe4xFfheVDfi8uJv78izWjhRAJA==
X-Google-Smtp-Source: ABdhPJyCIHhWKoRm9ofMXdUhH/Uig11PjVvPxhKyQ0j8UJ0DfTNlxEDeGx8+GspIjSAjX9xx87wEejv6RUEAYh+jdHg=
X-Received: by 2002:ae9:e641:: with SMTP id x1mr9823005qkl.59.1639595800949;
 Wed, 15 Dec 2021 11:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20211215175910.1744151-1-robdclark@gmail.com>
 <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
In-Reply-To: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Dec 2021 22:16:29 +0300
Message-ID: <CAA8EJppKGGWDkLXqccG_rPnkaYs5GhEN992Kq0nJ87t-zj4LeQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 22:10, Stephen Boyd <swboyd@chromium.org> wrote:
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

I'd second this request, Nevertheless
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>



-- 
With best wishes
Dmitry
