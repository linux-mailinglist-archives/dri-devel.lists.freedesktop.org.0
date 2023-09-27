Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B17B0E45
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5325310E196;
	Wed, 27 Sep 2023 21:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591110E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 21:41:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5041cc983f9so19665856e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695850890; x=1696455690;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=3ZPhCbxws0N6c+RxZtsL4OLtzT2jJtD2gNaLRXE6jZk=;
 b=UKfqh8hbTv5prnYhn4Is02/Y99bf9ZjEpuwqKoOLwg7LgWRGmST1o5EUKGBopUXauB
 hRsK05AcpWbuTzkALS6xQdhBc2Pm5scxiBXfcKX+d5faIIOtFW/41yhGFABPIVPq4CU5
 t1/O3DtNFHXpJaXhlpTzpkK0JIAwqTLGN8tfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695850890; x=1696455690;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZPhCbxws0N6c+RxZtsL4OLtzT2jJtD2gNaLRXE6jZk=;
 b=Fy2L2g1m3u6Ba2yZjdB5K2QMkDKrLAXFizTR9aA/0R/TgLSOk8OXJlfRIPljAR6CVj
 Op5NLS/Lbz6uXCaN9VYT0u6NbOs6GSdXAI78q1C819hAYF+Xc91jYb/FpxCLRXKI1lGo
 1ykI8tLgN//hP0x2sngKsk9P0apylTPlW4JIiVL8JsRykxZ8e7Dk0XyAQcrlHFm/tH3Z
 SzZPajUcIfaPFXreAxmyjoJZjjcIoCO0p9QGAlui799IyIv2immdZV8UWdL9NBrzq5ey
 3EZRULi7wrjc1T1VrH0jIsiM+oFjetdodSrimqC1ovGB7ydwEHnucvjOt8ktQufSRvGV
 Pzzw==
X-Gm-Message-State: AOJu0YyeLeFkAno+GtgAz7EAv1I7TketMwRxM9zjWyLWlVi/lMAi1vtt
 cG/IlbLo2PWumLHBb0jPNCdB9Kle84ncQwxRAIPCog==
X-Google-Smtp-Source: AGHT+IFWMD3WqTjjVpi0l63bw4jdnCFGNGz+jsmvkSy1ubVGWSZDX9PFKymKxC9und2e4VwY9YkPdw+kH9e4OxSiqRo=
X-Received: by 2002:a05:6512:3089:b0:504:31a0:f9e2 with SMTP id
 z9-20020a056512308900b0050431a0f9e2mr3398152lfd.58.1695850890154; Wed, 27 Sep
 2023 14:41:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Sep 2023 16:41:29 -0500
MIME-Version: 1.0
In-Reply-To: <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 27 Sep 2023 16:41:29 -0500
Message-ID: <CAE-0n51Ep4zBx6bswL4Yb+F0+8dW+L2kaKQaZBi-91jsVqm_9Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2023-09-22 18:35:27)
> On 9/22/2023 2:54 PM, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2023-09-19 02:50:12)
> >>
> >> This should be hpd_notify, who starts link training, not some event.
> >
> > I think this driver should train the link during atomic_enable(), not
> > hpd_notify() (or directly from the irq handler). The drm_bridge_funcs
> > talk a bit about when the clocks and timing signals are supposed to be
> > enabled. For example, struct drm_bridge_funcs::atomic_pre_enable() says
> > the "display pipe (i.e.  clocks and timing signals) feeding this bridge
> > will not yet be running when this callback is called". And struct
> > drm_bridge_funcs::atomic_enable() says "this callback must enable the
> > display link feeding the next bridge in the chain if there is one."
> >
> > That looks to me like link training, i.e. the display link, should
> > happen in the enable path and not hpd_notify. It looks like link
> > training could fail, but when that happens I believe the driver should
> > call drm_connector_set_link_status_property() with
> > DRM_MODE_LINK_STATUS_BAD. The two callers of that which exist in the
> > tree also call drm_kms_helper_hotplug_event() or
> > drm_kms_helper_connector_hotplug_event() after updating the link so that
> > userspace knows to try again.
> >
> > It would be nice if there was some drm_bridge_set_link_status_bad() API
> > that bridge drivers could use to signal that the link status is bad and
> > call the hotplug helper. Maybe it could also record some diagnostics
> > about which bridge failed to setup the link and stop the atomic_enable()
> > chain for that connector.
>
> Doing link training when we get hpd instead of atomic_enable() is a
> design choice we have been following for a while because for the case
> when link training fails in atomic_enable() and setting the link status
> property as you mentioned, the compositor needs to be able to handle
> that and also needs to try with a different resolution or take some
> other corrective action. We have seen many compositors not able to
> handle this complexity.

The chrome compositor handles this case[1]. If the link status is set to
bad and there are non-zero number of modes on a connected connector it
resets the status to good to try again.

> So the design sends the hotplug to usermode only
> after link training succeeds.

I suspect this is why my trogdor device turns off after rebooting when I
apply a ChromeOS update with the lid closed and DP connected. Userspace
wants to know that a display is connected, but this driver is still link
training by the time userspace boots up so we don't see any drm
connector indicating status is connected. No drm connectors connected
means the OS should shutdown.

>
> I do not think we should change this design unless prototyped with an
> existing compositor such as chrome or android at this point.

Is this driver used with android?

[1] https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/gpu/hardware_display_plane_manager_atomic.cc;l=114;drc=67520ac99db89395b10f2ab728b540eef0da8292
