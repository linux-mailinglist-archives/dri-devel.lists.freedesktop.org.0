Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD59D4FA05C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 01:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD6A10E1F7;
	Fri,  8 Apr 2022 23:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCD710E1F7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 23:59:33 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id b33so6090900qkp.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 16:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ep4HFxZGemluJutovsTbozz4aCXR3Ya1T5frn7xqC+A=;
 b=W1MkNAp8xV5HT+QqAx4kLm0SNYJQBh84WYuvZfZmLltO29+iMFuxhXu/9iPkvvyghd
 evMPG3QDhUti9BYqPcLkpVCb1PNebe36yhEAlsoPSXsm3ZX1Vdjytwd28ik26yCTeZwo
 8ssm5qZ2k165XPYHn58Y0MR0QZWeokpgdMBw3N386WqBL6BOOU30pUPL/lORltzQpyTH
 fZQwOHaCVMxUgS8CNdYui496fBoMJXXkV5Jw1OyddA+IJeRUUkw8w5mANj0JWfU8wwEK
 8W0sKFHiwwsInstAxplk6zqDrVbY6DTjdc+00p/zKab3JIGMD0QrQkir+tnW0GGs9w0e
 ReAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ep4HFxZGemluJutovsTbozz4aCXR3Ya1T5frn7xqC+A=;
 b=8NgkvET/I2ciNEPky2iGR+xWpFmwsIeymIVw3YazvHMsQ/b3b8s1RpAQsaS00zrZSD
 iu7Ma+VQD/0jp4PystU6QsBEC9w1Zy+EUpNtz8UaXaIgHRuHgUlCyD4CUjDhvkHTsGgC
 0mw5NvyEqcvOjnjrXOPoXZsxc1ly1O8TquBqEyuLTZ8WZYCLku80hMRjxoQ3O9YnCS27
 fqZBx+QecWqLHq8Kf6asYE1I1+T+mJ60ltIEksUOb0uRuDSwuZp6prqmmpVtrOqKl/iG
 4+zCg4p8WlsBmrPYriuktSmowxfcMQaDa2i/mAa2mnpkWSxjlAcEICrq+SDshs/FKssy
 UQvA==
X-Gm-Message-State: AOAM5333vi/GGIrudBLAnTMswy45dMmJgC4O4Q0rwoDQ97sqLXvGf1K1
 nw5CuYqh83cp9aV/doc1bSgpk4eNJY8qbClu2ucvEg==
X-Google-Smtp-Source: ABdhPJybXQIl400imv5u+eLq4wIpQrgRiwQ4eURC/e6m01mzUErigFhQXkQJfEw+aw8JJtTDDj1iqa8rcBKROaoImMU=
X-Received: by 2002:a05:620a:2449:b0:69a:4ae:85e5 with SMTP id
 h9-20020a05620a244900b0069a04ae85e5mr7089008qkn.30.1649462372909; Fri, 08 Apr
 2022 16:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
 <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
In-Reply-To: <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 02:59:21 +0300
Message-ID: <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 23:30, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 4/8/2022 5:27 AM, Dmitry Baryshkov wrote:
> > On 07/04/2022 00:28, Kuogee Hsieh wrote:
> >> dp_hpd_plug_handle() is responsible for setting up main link and send
> >> uevent to notify user space framework to start video stream. Similarly,
> >> dp_hdp_unplug_handle is responsible to send uevent to notify user space
> >> framework to stop video stream and then tear down main link.
> >> However there are rare cases, such as in the middle of system
> >> suspending,
> >> that uevent could not be delivered to user space framework. Therefore
> >> some kind of recover mechanism armed by timer need to be in place in the
> >> case of user space framework does not respond to uevent.
> >
> > Hmm, how does userpsace 'respond' to the uevent? The driver should
> > send hotplug notifications to userspace, but it must not expect any
> > particular reaction. The userspace might be as simple, as fbdev
> > emulation, but the driver still should function correctly.
>
> yes, driver is function correctly by setting up main link. but it does
> not know which resolution to display.
>
> It send hotplug notification through uevent to framework after main link
> is ready.
>
> Framework  is responsible to set up MDP timing engine to start video stream.
>
>
> However it does not know which

It's of no concern to the driver. It is completely the userspace
problem. After resuming, it should reread available video output
properties. The display could have been changed while the system is
suspended.
From your description I still do not understand why you need the
'recovery' mechanism.

-- 
With best wishes
Dmitry
