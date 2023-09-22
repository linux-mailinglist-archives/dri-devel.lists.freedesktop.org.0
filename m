Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D77ABB44
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 23:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B310E718;
	Fri, 22 Sep 2023 21:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FE810E718
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 21:54:49 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c012232792so48954051fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695419688; x=1696024488;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/7c/oVDshAtS1tuVwC10Rg8pKnTEHEmvA4PAkfR7yFw=;
 b=Ix9GeKSa0x+4Ep7Aktyxfb91P05y0HSIZ+6DyM4b8fTM5ignEs6MrhK+Ct2D9rvOJe
 lE/fiy/Wp6lbUAsIvsV6QRdD9r5bPQ21HFrCPkBPnU9H86n0qLFHbdT+pCDD+m9rpaeW
 p8E0wBp8yCgKXz3e+npjGqYUW14zL6Ju+nwTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695419688; x=1696024488;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7c/oVDshAtS1tuVwC10Rg8pKnTEHEmvA4PAkfR7yFw=;
 b=Hou4qmCB+WztzmNsLwQp5oGQttIqeJEcjrDnq9KfU5apWnccgWJwbx1nHIHrJ1a1/C
 D4PA+2Pu1Ls0dqCh4f7mSFCcGeo0K1Jn4ZMaFB38YeJ5JQ6KCMnMcZG8Fhoe/SeDR5gK
 ArGg3eDOXxfZNd7mGYXvZocPUmcJHdqZBwj3UgAxtmmj57/WXLp3lKDj4nYp35p4QPw2
 5C4vaggvYUvpKnPGawXOshDWAydMQYKxDbhzEyYe0OF7i9fd1zG3xtxEJConVSNQMMuk
 wofKhS9NDXYZm55xzADY0Q+u4Cb6pwfgZi2wuhlorkXYjThuNCJ8bNqac5yYA5fxThhX
 gL/A==
X-Gm-Message-State: AOJu0Yyyf/Y4XQeml4APMZvB0vOLmL94MS4K/Ux4N9zDKNsB1BRklvjc
 nGysxCZ9a9qypNMvcXv5uSJbHJQJKleL9bh9Nph3sg==
X-Google-Smtp-Source: AGHT+IFqBQ9m6cEHlfgPZ1B6LtM3dzQO5UTlrujPO5byQq0rStgb2iQQqBzg/dzkHnhTV6MLei3X7/hNVsZxdNYxgNY=
X-Received: by 2002:a2e:3505:0:b0:2bc:d8cb:59fe with SMTP id
 z5-20020a2e3505000000b002bcd8cb59femr424762ljz.8.1695419688131; Fri, 22 Sep
 2023 14:54:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 14:54:47 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Sep 2023 14:54:47 -0700
Message-ID: <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-19 02:50:12)
> On Mon, 18 Sept 2023 at 20:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >
> >
> > On 9/15/2023 6:21 PM, Dmitry Baryshkov wrote:
> > > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >> Add pm_runtime_force_suspend()/resume() to complete incorporating pm
> > >> runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
> > >> are added to set hpd_state to correct state. After resume, DP driver will
> > >> re training its main link after .hpd_enable() callback enabled HPD
> > >> interrupts and bring up display accordingly.
> > > How will it re-train the main link? What is the code path for that?
> >
> > 1) for edp, dp_bridge_atomic_enable(), called from framework, to start
> > link training and bring up display.
>
> And this path doesn't use .hpd_enable() which you have mentioned in
> the commit message. Please don't try to shorten the commit message.
> You see, I have had questions to several of them, which means that
> they were not verbose enough.
>
> >
> > 2) for external DP, HPD_PLUG_INT will be generated to start link
> > training and bring up display.
>
> This should be hpd_notify, who starts link training, not some event.

I think this driver should train the link during atomic_enable(), not
hpd_notify() (or directly from the irq handler). The drm_bridge_funcs
talk a bit about when the clocks and timing signals are supposed to be
enabled. For example, struct drm_bridge_funcs::atomic_pre_enable() says
the "display pipe (i.e.  clocks and timing signals) feeding this bridge
will not yet be running when this callback is called". And struct
drm_bridge_funcs::atomic_enable() says "this callback must enable the
display link feeding the next bridge in the chain if there is one."

That looks to me like link training, i.e. the display link, should
happen in the enable path and not hpd_notify. It looks like link
training could fail, but when that happens I believe the driver should
call drm_connector_set_link_status_property() with
DRM_MODE_LINK_STATUS_BAD. The two callers of that which exist in the
tree also call drm_kms_helper_hotplug_event() or
drm_kms_helper_connector_hotplug_event() after updating the link so that
userspace knows to try again.

It would be nice if there was some drm_bridge_set_link_status_bad() API
that bridge drivers could use to signal that the link status is bad and
call the hotplug helper. Maybe it could also record some diagnostics
about which bridge failed to setup the link and stop the atomic_enable()
chain for that connector.
