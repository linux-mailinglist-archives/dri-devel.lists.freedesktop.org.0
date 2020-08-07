Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E890E23F031
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 17:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CA06E0AD;
	Fri,  7 Aug 2020 15:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62C06E0AD;
 Fri,  7 Aug 2020 15:51:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c15so2090084wrs.11;
 Fri, 07 Aug 2020 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8KKNb4TkrE6Ypv5Ck8Yh1XjDKF4AFR1yDDhTp3rLrk=;
 b=bo8cuN9el/eDYqqyyB/XysVl/VZvWGfzR+Vj+TRUOCZW3z+J/ntDSoalHmoJ0giTt6
 7D4H2Y8Ejwr6PH1h5SjterSCcnnMVcgIwHkC+brWBDEdy7NwWREsG95HSH2XW6Gc8DoU
 DeiZ0ZdXjWr5WKeI2vl9cFu+21Jo9gzUdoSXK94HsmgfX3OcNN0HH6FvXsCZN86JkssI
 BQX73k5779DPXMa6HqfeVVPes5zv0jDww+9nuqa7UnNbQNWpOBH2iCw1/UBMpzZkEcrx
 XcHEXcjdMvULWffqNdenjXSvW8+W7+11FZw5TErWFfWkAQPhu4pMKm7ZtHCq5cMimruP
 DBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8KKNb4TkrE6Ypv5Ck8Yh1XjDKF4AFR1yDDhTp3rLrk=;
 b=fKcgYE0E2p9dpZ7ShQ/RAUPQJ1n/DgnDVjOxlZwHWu1S48dgAoWu91nkXfh7lz17ay
 6pTcX7n+OIyflmn+gcZJEuaubqSoI9RygYc/2hDGoRtF+jP4Q2PX0Mm9KoVKpvMFR9Xo
 od/17BTilAiIxLN7lgvvvUoIPO6naV+ieGSlEDQERIsUu+uhsrUOok0WbLwWf7fL9UUN
 K/S/JMSxnV/Yl11JuBUb1NSADVP/9A4KC4nd2fTX27XiQzVy1Xe4mw0qlKq/fkR32V99
 5EiVMce9Q5nNMyCSsFB6rxREcbXFvhQYbuUinl/fg8079yrOyIWpR6MitJPhXklFOAbD
 8qrw==
X-Gm-Message-State: AOAM531zFGRNonbtbeie1GnC/a5exugYAaujph3WsoA4U6+00iCJuVgP
 3YZ8VDTt2ECuqfCzr9E54jELNljDY5pm1GQiBOI=
X-Google-Smtp-Source: ABdhPJxOuPWr3wvV9ELQ6TgKNOqVn/hVXy8qaCByWnSbkOvUKzemxZS7/rDkhkXwWS6kCiI602GZS0cRDCayKNIIIQI=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr12061544wrq.327.1596815464428; 
 Fri, 07 Aug 2020 08:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
In-Reply-To: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Aug 2020 08:51:48 -0700
Message-ID: <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index ea3c4d094d09..cc1392b29022 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
> >  config DRM_MSM_DP
> >       bool "Enable DP support in MSM DRM driver"
> >       depends on DRM_MSM
> > +     default y
> >       help
> >         Compile in support for DP driver in msm drm driver. DP external
> >         display support is enabled through this config option. It can
>
> Hi,
>
> You need a very strong justification to make an optional part of a driver
> to be "default y".

My opinion is that if the driver is built, everything should be built.
This is what makes sense for distro's.  It is only the embedded case
where you want to trim down unneeded features where you might want to
disable some parts.  So 'default y' makes sense to me.

BR,
-R

> so why?
>
> thanks.
> --
> ~Randy
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
