Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8642FAEB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5742F6E342;
	Fri, 15 Oct 2021 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E26E342
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 18:25:03 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id bp7so4681276qkb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VuezPB0Kp+8kHQA7Wm3i0oiOLoiUrP9cyKbJStrIERY=;
 b=IVpo3HDaZMp7KHMTuXPZHd0U/A6GToJW+zUIihY3lndppKm3Hl7+KKHTZ/ld17lOeo
 gZ0xcZoEvpcg3GqqbVhGNRLGpyWwEEXUEXOMTiC+4EUBOjeCpzp8HjqOuylx1300szsf
 2P/s4oK7puQONzcwRo3zUGN+KqiAvx9j5oM7iHoj3HvOE3oqr6E7d4xgq765mCRVptu+
 9rN6gXzNJfW/Gm2M9/OWpFcbRgskkFeVuTATRSHR08B3+bKp3tOWy0cTpil1gkLrI+AA
 EfkGg5RL3k6isZI4soTQT8WyQcpEmbncmjW4KMMXbCDBSsSQojsFjiTfZdJv4ZQ9jzS9
 +ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuezPB0Kp+8kHQA7Wm3i0oiOLoiUrP9cyKbJStrIERY=;
 b=wGoV0bI1xIwfAt8ztvfo7yp4lCsrHTo/yOptW2ga+V6CF2/Y5DHaX7CxFNlp2xVzH+
 eZAMfsOyQsOpark3QDrSyrRdQbrj0HkankkfSdaxHnJFIIbHSTL3EsoGyJz0hNaftPRy
 zTn2icMUwHS3JXzv/XGQNKlHAaIZYpvDwlMh6H8Dt9op/xoftN4qIRB/x+LdCjIFKrma
 LZhNr96gpSo1CA+EP/tau3iD2RLdzLE2GyCU7LPolmMyQvK5HaLlMcgHpx5D6qL69ZXq
 RPqdKGLGAlZh0WgF5x+N9jTf44OChgkufs7QmYDmEjKqdO0QqPINcivYcYjUhnlW9Wsf
 vR+Q==
X-Gm-Message-State: AOAM533D7/CT52tt5wK3JV9L/qULj1ja06Hm6Pjp5o3J8JNhYmWRg5DQ
 EDYSsP6jg1KEaFsFdNuGwUOfPCzFqu2yHXYxXt5TvQ==
X-Google-Smtp-Source: ABdhPJy8eNYT/b5aHU32daC4hukb65DAURzwczXTD5i8pfp8xM2Wdva75qdOi9M+duUayeYhsXaxTyQk1ZgKTK2bWgU=
X-Received: by 2002:a37:9a83:: with SMTP id
 c125mr11044211qke.186.1634322302244; 
 Fri, 15 Oct 2021 11:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
In-Reply-To: <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Oct 2021 21:24:51 +0300
Message-ID: <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
To: Jessica Zhang <jesszhan@codeaurora.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sean Paul <seanpaul@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
>
> Hey Dan,
>
> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
> > Hello Sean Paul,
> >
> > The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> > well" from Jul 25, 2018, leads to the following
> > Smatch static checker warning:
> >
> >       drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> >       warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> >
> > drivers/gpu/drm/msm/dsi/dsi_host.c
> >      721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >      722 {
> >      723         if (!msm_host->mode) {
> >      724                 pr_err("%s: mode not set\n", __func__);
> >      725                 return -EINVAL;
> >      726         }
> >      727
> >      728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> > --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
> >                  ^^^^^^^^^^^^^^^^^^^^^^
> > I don't know why Smatch is suddenly warning about ancient msm code, but
> > clock rates should be unsigned long.  (I don't remember why).
> >
> >      730         return 0;
> >      731 }
>
> I'm unable to recreate the warning with Smatch. After running
> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
>
> CHECK scripts/mod/empty.c
> CALL scripts/checksyscalls.sh
> CALL scripts/atomic/check-atomics.sh
> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
> CC drivers/gpu/drm/msm/dsi/dsi_host.o
> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
> missing error code 'ret'
>
> Is there a specific .config you're using (that's not the default
> mainline defconfig)? If so, can you please share it?

Are you running your checks with ARM32 or ARM64 in mind?
Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
It would make sense to change all three clocks rates in msm_dsi_host
struct (and several places where they are used) to unsigned long.

>
> Thanks,
>
> Jessica Zhang
>
> > regards,
> > dan carpenter



-- 
With best wishes
Dmitry
