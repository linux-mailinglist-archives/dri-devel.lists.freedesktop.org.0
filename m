Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4F700ED0
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 20:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A6310E264;
	Fri, 12 May 2023 18:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110B10E264
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:30:24 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-ba6fffc5524so1857012276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683916224; x=1686508224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8pKQb+0xYXxOucpnQzXDi3qX8jDqCIpUeJjG+K7ITys=;
 b=ha15g8FNo/FKZNrF+fIFFhPoe8LUpkxENpBqAGkhlgIIw6RpVsD4q25DcY6gKzpOoa
 oE9ce0ibbeel8jUFuWC+GQF5KKxHreoW5ikWUjYRb9sdWI3OXNmus3V4iKZ9vHKqd6sg
 VFxLljBA8G2zdnOjAu+Z1Js/XYXeyUQEJmoaoCuOqG5pxckNIdYrzW1VBharM7ZexDzO
 MAvtpzlCA1HLpSyajO6KSxrLNGQLfJ014MnGrNCn3ihPSv6NXEv3zvSt8gPoc6j9guXQ
 hzvsSormsrqNGJQpht3s+lGzNwHuhUoybeKRwb9mn3F+7sDGqIeAxlIvHtB2hx9i0mfI
 yYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683916224; x=1686508224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pKQb+0xYXxOucpnQzXDi3qX8jDqCIpUeJjG+K7ITys=;
 b=TFsQrgBifpi2pUCcZKoz0DM+vMOaUyooiR2I2fvVCnTyAy0BuxV9mEBNR/azNW+A8J
 +r//7C8yf5rbtO+1SKbjTWYU7mMjkEbt1JOkP3KeitqYe5uAL/ONIA0f9l9qh+B2lxjs
 jaL1D6cNyBZk8TOcTjwyiyVWUkcp8s3zPC0zALqfEz2MguvE9DnOCyg1tzECNsCXc3MZ
 2OmOPmRVhR0H67aDrM1A4XQFyIGfPz9ALSkiOFU3zJfTvYqytsSbTurxVwdRPNMdPYOG
 hsX1SyAos6BKVOiD1TNX29woHYAwXxox+L3IVV+yxGetznWAEMDUxM5FyJZzdROeS482
 xohg==
X-Gm-Message-State: AC+VfDyDpD2uYsh1OqZrmz0TdSDhizzXBNhGOqwz1NWbeU+pthL5iRgv
 wEuITTzMMlVZ+omT3ahpNy/nqT1Xf2AhHEgc2JZetw==
X-Google-Smtp-Source: ACHHUZ4EpK0beeyEKKSqeEK5dUk6rdIl9cp/YnF8Y+QPICHcuW1M4nZMXaaPITctbhAOfsn7vuAk2CWoax7noIg8REs=
X-Received: by 2002:a05:6902:70d:b0:ba7:50d4:d914 with SMTP id
 k13-20020a056902070d00b00ba750d4d914mr259939ybt.5.1683916224054; Fri, 12 May
 2023 11:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprtQF0x_LCOTrt5bvRnJ+xRz6QxLF6QAP-4Pff6V5TJ2g@mail.gmail.com>
 <20230511155331.2jmfe7xcs5tihdgb@ripper>
 <5ef83699-01de-d062-6239-9bb834c70458@linaro.org>
 <8ac0b5f5-27da-2b28-8f10-b2fca447511a@quicinc.com>
 <CAA8EJpokAoGni7vNwuijs7EvmjCweO3pgChij3Qx3OUkVTVpiQ@mail.gmail.com>
 <CAE-0n51SHQhUJiY=BJp8CQQ1aTAOxeMDr2+NX_vpmjN_cyJJrA@mail.gmail.com>
In-Reply-To: <CAE-0n51SHQhUJiY=BJp8CQQ1aTAOxeMDr2+NX_vpmjN_cyJJrA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 May 2023 21:30:13 +0300
Message-ID: <CAA8EJprynCeTdYk5PH2aKcjoZZa5kh_iJRpXUua2jqhtMD5B=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged interrupts
 to hpd_enable/disable
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 May 2023 at 21:03, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-05-11 17:54:19)
> > On Fri, 12 May 2023 at 03:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > > 1) DP with GPIO: No downstream drm_bridge are connected, is_edp = false
> > > and internal HPD-logic is in used (internal_hpd = true). Power needs to
> > > be on at all times etc.
> > >
> > > 2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
> > > internal HPD-logic should not be used/enabled (internal_hpd = false).
> > > Power doesn't need to be on unless hpd_notify is invoked to tell us that
> > > there's something connected...
> > >
> > > - dp_bridge_hpd_notify(). What is the point of this check? <== i have
> > > below two questions,
> > >
> > > 1) can you explain when/what this dp_bridge_hpd_notify() will be called?
> >
> > The call chain is drm_bridge_hpd_notify() ->
> > drm_bridge_connector_hpd_notify() -> .hpd_notify() for all drm_bridge
> > in chain
> >
> > One should add a call to drm_bridge_hpd_notify() when the hotplug
> > event has been detected.
> >
> > Also please note the patch https://patchwork.freedesktop.org/patch/484432/
> >
> > >
> > > 2) is dp_bridge_hpd_notify() only will be called at above case #2? and
> > > it will not be used by case #1?
> >
> > Once the driver calls drm_bridge_hpd_notify() in the hpd path, the
> > hpd_notify callbacks will be called in case#1 too.
> >
> > BTW: I don't see drm_bridge_hpd_notify() or
> > drm_kms_{,connector_}_hotplug_event() HPD notifications in the DP
> > driver at all. This should be fixed.
> >
>
> Is dp_bridge_hpd_notify() being called by
> drm_helper_probe_single_connector_modes() when the connectors are
> detected?
>
> I see drm_helper_probe_detect() calls connector->funcs->detect() which I
> think calls
> drm_bridge_connector_funcs::drm_bridge_connector_hpd_notify() but I
> haven't confirmed yet. The 'detect' bridge is the DP bridge in msm
> driver
>
>          if (!dp_display->is_edp) {
>                 bridge->ops =
>                         DRM_BRIDGE_OP_DETECT |
>
> so if the bridge_connector is being used then I think when fill_modes()
> is called we'll run the detect cycle and call the hpd_notify callbacks
> on the bridge chain.

Yes. This call chain is correct.
drm_helper_probe_single_connector_modes() ->
drm_bridge_connector_detect() -> drm_bridge_connector_hpd_notify().

However on HPD events the DP driver doesn't call into the drm core
(which I believe should be fixed).

-- 
With best wishes
Dmitry
