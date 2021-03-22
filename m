Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB45343D88
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91E989C89;
	Mon, 22 Mar 2021 10:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EFF89C33
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:12:21 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id u7so11826125qtq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+QsdQNn2B2kiESOyuIxExVIMJAPoMZsfZxGW7eBGps=;
 b=VPAD+tfOdONIolCc6FSoAzupF71767JDnGba2LOXuvdrr5FGJ6Yp8lk5ZcDR9xHoF6
 XX9QTi2j1AYC5GzVsg8k3olZpZvmOzRhLCPMnomfobP1ez4sJucCVePAy1OmceyJFUfm
 G9y4tVRyGru4X1z7YLQKcQkdtr0gl2n9Ws8GBEw0rmt7c3MUMhaGqg39vSzyuik9T4ch
 S2YpXfeIHYDnUQfJkB3ivB3iwEX6WIaKCGiCfRfGlBWt2AjZhEmu+sVk6ca4JFrd5XoM
 yQLH1Pj9ZupSsILm9TKRtKP2fgkYQBXTV4NP3Hvl+xKbf1pHJvT93BxvP9qRFa/Uc179
 6yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+QsdQNn2B2kiESOyuIxExVIMJAPoMZsfZxGW7eBGps=;
 b=oHS5NJG6GM/Sz76oUaaer0EsB3Oxbs+9Qmb6tbHtlcjior79jE+9yJ//viR9ZuGBW1
 18bkbUH+INN9JmKTgd4r7cJ32KJkJuhcGH+p/FxqmvLFd1VdWFHmoAHpS83XW4Aqj9je
 p5A/vRr3NMJJ86qB0cxBpFcAe5qjSS8vwpoYlKDLa4Jh2ODIvr7dgLd2G3nBNfBXnlkb
 h2xlNUKrqdnqfsDdKFS4Erbxljrc+xASadBMNAaPi6PzxGTwY2yWRxCJgNI8Ay3uD73d
 1fdRIl+s+2IBD3wryqNFuX+kxXfPMWc09JVIkZwOE1/6D1sfDVJCVMaxTeESaszsLUDJ
 V0pA==
X-Gm-Message-State: AOAM532WQTlDrTkGV74P73wt9GbLq+tFE0k2AZn56/FmBDIDkbAK/VjS
 ugJ6MN8zl85paCGkBVR9EXSrQ2s/MiKvAH3rtzNlAg==
X-Google-Smtp-Source: ABdhPJx1AQb1oUdzdK2w2rNiyUv2k9lWEkPEf8c5bnagcjUYYrp7KNc2xIGRL3p2NgqT7UUKfybvWPIGQAmFn6IwrWA=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr8679480qtd.135.1616407940343; 
 Mon, 22 Mar 2021 03:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
 <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
 <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
In-Reply-To: <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Mar 2021 13:12:09 +0300
Message-ID: <CAA8EJprRCgXyqYiJBWz+q1jbwYbg8m2v=40kmB9ChgOJvaF9Cg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Fabio Estevam <festevam@gmail.com>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Mar 2021 at 19:25, Fabio Estevam <festevam@gmail.com> wrote:
>
> On Fri, Mar 19, 2021 at 12:13 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> > Thanks for the feedback.
> > I will follow the same approach for fixing the suspend/resume path then.
> >
> > Let me test it and then I will re-submit Dmitry's patch and the one
> > for suspend/resume as part of a patch series.
>
> This approach works here for the suspend/resume path too.
>
> I have just submitted the series, thanks.

Thank you!

-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
