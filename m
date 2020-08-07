Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DA2402AE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9775989C80;
	Mon, 10 Aug 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1466EA29
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 20:24:04 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g19so1675614plq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=8kRWK6mpY0yuzrMz6VeBLLcMrpVG8ZtSX/iAsw+ut4A=;
 b=WEQMKsvxL+jGuutK/BX9GjKhG9V6iqjN0wIPhLgvikM+b48e3QcXAaeBfnLsnUbVQM
 sEPO5cpmUWUqe4CGQPLKERNzawMZGhiNtw2+3gnBjmoKN8srnzPI9ngJ2NslwuAjvSVk
 RgOZqa5CfaRROKBbMjMpTLlU7cxtbupJL0vwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=8kRWK6mpY0yuzrMz6VeBLLcMrpVG8ZtSX/iAsw+ut4A=;
 b=ie2CVw3uvXubj76pupcuWEJMNj/iNaTad5HGLdQHz5OScN7vnla8ScKUB1V5Y39X0S
 vnopbBTjbT315K7Qn36FiFReuSxQiqyIETp0NfAIpTs6bCBCq6QNUT7Y268M8JEdNaBi
 5C4C3sVW4KgyoLf5NqwJSjL2uZK7uO6wEzDWPQYy+MX2MHvV2SAsQEcopPOg9dldErRm
 Fi/e1rPeF4xd1xgm0TC1+g+AY/NQWvYeXb3HcjiZnkwL6wWNhP1C0QYe4ZT7V9coo2Ky
 lZvtQ7DJ+iXZndMt3alsrdBl2GnMfkMx9Ixxa9JSoaXz3UTxMQyGNFlPGsZEye+JCekb
 NqFg==
X-Gm-Message-State: AOAM531ntrv0LhZU+83GhuBqqYet9K1+NIrTB927vfbXRLv8mdFFdzVy
 JmT7GCuUIT6B2s5SI4eWIuVDDQ==
X-Google-Smtp-Source: ABdhPJwUCMA+qcCj4NBJ6bH6GJrNHolYmVbC63o7ey2y7ucXrSodd1KiH1QHhuAQODHYrQ6iqRsEPQ==
X-Received: by 2002:a17:902:b089:: with SMTP id
 p9mr13616774plr.52.1596831843666; 
 Fri, 07 Aug 2020 13:24:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z23sm11490482pgv.57.2020.08.07.13.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 13:24:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
From: Stephen Boyd <swboyd@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>, Rob Clark <robdclark@gmail.com>
Date: Fri, 07 Aug 2020 13:24:01 -0700
Message-ID: <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2020-08-07 08:51:48)
> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > > index ea3c4d094d09..cc1392b29022 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
> > >  config DRM_MSM_DP
> > >       bool "Enable DP support in MSM DRM driver"
> > >       depends on DRM_MSM
> > > +     default y
> > >       help
> > >         Compile in support for DP driver in msm drm driver. DP external
> > >         display support is enabled through this config option. It can
> >
> > Hi,
> >
> > You need a very strong justification to make an optional part of a driver
> > to be "default y".
> 
> My opinion is that if the driver is built, everything should be built.
> This is what makes sense for distro's.  It is only the embedded case
> where you want to trim down unneeded features where you might want to
> disable some parts.  So 'default y' makes sense to me.
> 

Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default y'
filters people have?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
