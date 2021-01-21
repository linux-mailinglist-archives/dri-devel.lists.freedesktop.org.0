Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011C2FEC85
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 15:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12389C2A;
	Thu, 21 Jan 2021 14:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16E289C2A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 14:00:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id v24so2623957lfr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8BMXTeaE3oPt4xC0UBSh95/rbcE7z2V9jAZrbMx+6I=;
 b=JmQnXe77uGNKzuD1/lCSiAM+GxZ/LyvZQ/+WJoy6KLDHxuOJEFqeXyMCLqhVbseWbx
 GB4OSylMqZtGMnS6vf4AbMMJ2kdewkkZ7kJr7mGNuKnPabc1bMeHMnUONmA22fYSl5h4
 Fwt3KlQF2R6Z0FQrQc8VhumBj4L6uhgV4VZwwUG3ty3gykgotRjSZjJi0dUpecc9letY
 /Uxyuv/0aOti9kVabV9mU0yZrDaOrVCZx4vd3VNHL+HE0GknZttr+BbiU64F0bHwsYbn
 N40zDRQlg8M2vSJxC5Miv9xKgZHD3Kz5wdk7XokP5XkNkFzHiKNs9X1uLfuIX/5rucC9
 0Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8BMXTeaE3oPt4xC0UBSh95/rbcE7z2V9jAZrbMx+6I=;
 b=IdbjQ7R2NYMh6z8rrZrj2HVpYVqxmutmi42UPwumCPcR4zO9p///GjKigNO2KY68Hm
 3+LxPhTwtwN241Tc/ZqFukIk10N6etD5wQ/0GeiOx1ZjgY4wTBTR4pU/HA2hVkMt3pOu
 UAwCOgBRC7c32g2IEi+OgKcos2Z+mPN4pAlfJSPyUjB9gb5NqP4ksxSpz7jYxEkp9pGZ
 FNhagXjeaYYmK09qCzNyOZK/YYyUfuyTku324wukXlCWNOxfDnSi0OAYTSmLbBFjYMa6
 8NEtJimoHrtpVCqlk3/KH/vYp50OMpPE36Ve0IUDsWw9W31vmB6ElEMiWpbUDqQpboUG
 bDNA==
X-Gm-Message-State: AOAM5306FRC6DOylzxoO+Gaq6AoNUSDoHnxwyN6/8s1W1XMupMEIHjwk
 g/mt2IZDqU0X8ybWYiuq4dhuOrjfcA2lhCWwouVAig==
X-Google-Smtp-Source: ABdhPJwGcdyEbDfXPSpzRVqKX0xJz8/CfO6pS5iy1wKsyjSvmz8Dyzv+Ns9mXjZranZW5dbt/sp8pwZdlwq0GFqe7xI=
X-Received: by 2002:ac2:511c:: with SMTP id q28mr2637602lfb.343.1611237638090; 
 Thu, 21 Jan 2021 06:00:38 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
 <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
In-Reply-To: <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 21 Jan 2021 19:30:26 +0530
Message-ID: <CAO_48GFjWknXrRLHby6LVFbh0hzY2793FjLwzz9knnHnb7_EXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dma-fence: allow signaling drivers to set fence
 timestamp
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Veera Sundaram Sankaran <veeras@codeaurora.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Veera,

On Wed, 20 Jan 2021 at 02:00, John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Jan 15, 2021 at 4:31 PM Veera Sundaram Sankaran
> <veeras@codeaurora.org> wrote:
> >
> > Some drivers have hardware capability to get the precise HW timestamp
> > of certain events based on which the fences are triggered. The delta
> > between the event HW timestamp & current HW reference timestamp can
> > be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
> > domain. This allows it to set accurate timestamp factoring out any
> > software and IRQ latencies. Add a timestamp variant of fence signal
> > function, dma_fence_signal_timestamp to allow drivers to update the
> > precise timestamp for fences.

Thank you for the patches!

Daniel, Christian, Gustavo: if there are no objections, I will queue
up this series via drm-misc-next.

> >
> > Changes in v2:
> > - Add a new fence signal variant instead of modifying fence struct
> >
> > Changes in v3:
> > - Add timestamp domain information to commit-text and
> > dma_fence_signal_timestamp documentation
> >
> > Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> > ---
> >  drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
> >  include/linux/dma-fence.h   |  3 ++
> >  2 files changed, 66 insertions(+), 7 deletions(-)
>
> Thanks for respinning this!
>
> Reviewed-by: John Stultz <john.stultz@linaro.org>
>
> -john

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
