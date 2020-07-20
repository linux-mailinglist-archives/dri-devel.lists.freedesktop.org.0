Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8F2262BE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 17:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAC89C98;
	Mon, 20 Jul 2020 15:04:00 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9389C98
 for <dri-devel@freedesktop.org>; Mon, 20 Jul 2020 15:03:59 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g20so13030966edm.4
 for <dri-devel@freedesktop.org>; Mon, 20 Jul 2020 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
 b=LhPnnGZz+comE1cgyo/Ade5S1kE4zEhoPaaFmdVrbq0kxfF79/KbgosYjWd3jhGj6z
 PZ864OAiQJyZ8WPWu6phfbFiY0PR+batdntkmBkfGuUeF74RfofIncSfeHpmTOePF1pk
 Ui72NQbpRw423r3rcUPqaiB/ILqEoJezxU+i2HJrkDVxCMHcaCT2tK0OwO7SS2KWX0dI
 0NaiTW6dGdv3Ns2/bPxEVvBTpatUK2feYLsXNNkX3CxHcyhzEaXKMpxvhWxbF2avLfGW
 rKAvuWuQy6krRYFHtP+y+ytu/TgFRuu8J0nceHE6k6yko8K9n5dtO1b6ghj3Q0EYWq68
 rR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
 b=RBE3HoFm4ndCoDpjg0Oo4IbqxvcLT+kKrCGhHaQ2DUjrOGebZ+rcneseIFDiSfWPxW
 kqwx5l6G1FpsqedS8nXfbgGukYjOBltZRPM3qZUr3GlBYz1xy/GreOt0ItRH7+PjJE++
 c+58z226Eu2gT+bSSGYmK89nIfDhKrZlQP8wPjSCBZmOuRe2acQHiffdCFDyT1aigVWp
 K93/Gi+sPm27TD1xN11A/GfG1QMguxdsi+StdYTzVI1F6b+56P6BqklVQ1mpx8coOVlM
 FydtxHrKwYGJdSnRz5yj8jrK4213mRvxW/OfB/4ujGch91M4uOzA+d+8nX2DWYU0KKfF
 X6sA==
X-Gm-Message-State: AOAM530krdCkGZI9M+f9GXYXnWAbqeHDGtNyHe8sOgg6d+myYcTtLvJG
 TqFSDVJZ4qxVYhXx/idmTj/bg6M62+UHODeUhXQ=
X-Google-Smtp-Source: ABdhPJxr/dF/eAhMBtgTK8Ekd/dD+VXGNXZ2szgkQS7sHIh3pcfb9CmuaJFDjNwfsB5hiYCLpFtQuCqbT1WNnHB92j4=
X-Received: by 2002:a05:6402:1250:: with SMTP id
 l16mr22421840edw.362.1595257438172; 
 Mon, 20 Jul 2020 08:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
In-Reply-To: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Jul 2020 08:03:32 -0700
Message-ID: <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 15-07-20, 08:36, Rob Clark wrote:
> > I can take the first two into msm-next, the 3rd will need to wait
> > until dev_pm_opp_set_bw() lands
>
> You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> it anymore.
>

I can't really base on something newer than drm-next

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
