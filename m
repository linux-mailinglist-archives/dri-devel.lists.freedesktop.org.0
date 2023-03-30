Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1906D081F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6B210EE59;
	Thu, 30 Mar 2023 14:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443F810EE49
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:23:56 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id g17so16350939vst.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680186233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdDVtbZuDJf8upkh5HvXpNatNcQceszJUO7yYX9Degg=;
 b=IQuz2jtZFzq94cljTGq1nSzm2M5CmuJwsIZi6FTj1sdpF09mmo+12lZrH1W3iTdAGP
 BY6k6mf2miJ34FeVEiRtDO0tMHnowkRYwsWYBiyOdTBd7AIVbvai9YtXFpckuGO0yRkH
 Bq/x/a7YXHqlBqdNvmsdIy0NufQQaVI2yW5KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tdDVtbZuDJf8upkh5HvXpNatNcQceszJUO7yYX9Degg=;
 b=Y8u0n45e205YKge7w3nVrvVLMgDH1Ofsl5edwkmthZzH2oKiIoUVtIHcrzv74jlI1J
 32L7PBW+9ahzrIkkCu3AeXefINpM9Wcv3J4/MXVdfllIHQvNrDcZs/GcI5q+KbEg3ube
 aRq3aqIITJA/p6mJZqYmRTUfgIRXtMcQAmbhEc/qHP14rFWKzMj1lA4dZ1maV715B46g
 XumwdX2C1oKpPaaTZUXLxpO+E93IUbxBAs8DCMWxh+3xFPOSok7tb0AYZNcJLLDlj7BF
 BiQIy6oPfGX+yu8RwPG58VgWhbGRe7buNFDLkgf/DCnnK4tbyKYWImW7Qs2BQs/NYjvb
 todQ==
X-Gm-Message-State: AAQBX9fPeZvy3+pIHyREJK0CBcc0mhokKehPk43MABldIWuFhHNXvAjH
 Nb/Q7QyU/MryodmPx6pEmWYgfnxD667kpYh2Y/0=
X-Google-Smtp-Source: AKy350bB4kPUtnlxWIpUBPASa0e1nFoW+krYAVYXKLQmYdpy4QcuDam2c4i7J7/8KPf7RaZseXl3FQ==
X-Received: by 2002:a67:ce14:0:b0:41f:5d5a:b34a with SMTP id
 s20-20020a67ce14000000b0041f5d5ab34amr8316177vsl.10.1680186233268; 
 Thu, 30 Mar 2023 07:23:53 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54]) by smtp.gmail.com with ESMTPSA id
 n90-20020ab044e3000000b0075ef51c257dsm5013924uan.32.2023.03.30.07.23.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:23:51 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id e12so13950180uaa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:23:51 -0700 (PDT)
X-Received: by 2002:a1f:ac17:0:b0:43b:7928:7a25 with SMTP id
 v23-20020a1fac17000000b0043b79287a25mr10387566vke.1.1680186230654; Thu, 30
 Mar 2023 07:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
 <20230326162723.3lo6pnsfdwzsvbhj@ripper>
 <20230326163556.iesjkoh3nw3iwvf2@ripper>
 <CAE-0n520ypTRNT1X6kZ8o_Z+DN_68qwqZc1wZGMwsFqV5naktw@mail.gmail.com>
 <BN0PR02MB81736AFC01FB13F1640068CEE4899@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAD=FV=UjHiEk==KAhbx6QFW++69vDAM44sw-b2MGcJ7NsfbF-A@mail.gmail.com>
In-Reply-To: <CAD=FV=UjHiEk==KAhbx6QFW++69vDAM44sw-b2MGcJ7NsfbF-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Mar 2023 07:23:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7UoA5jP-ANFMNzm3oLbYmT73uDnqs0oKHKb16-NcULg@mail.gmail.com>
Message-ID: <CAD=FV=V7UoA5jP-ANFMNzm3oLbYmT73uDnqs0oKHKb16-NcULg@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
To: Vinod Polimera <vpolimer@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 29, 2023 at 8:47=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Mar 29, 2023 at 8:16=E2=80=AFAM Vinod Polimera
> <vpolimer@qti.qualcomm.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Stephen Boyd <swboyd@chromium.org>
> > > Sent: Monday, March 27, 2023 9:58 PM
> > > To: Bjorn Andersson <andersson@kernel.org>; Vinod Polimera (QUIC)
> > > <quic_vpolimer@quicinc.com>
> > > Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> > > freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
> > > Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
> > > dmitry.baryshkov@linaro.org; Kuogee Hsieh (QUIC)
> > > <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
> > > <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
> > > <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
> > > <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
> > > <quic_sbillaka@quicinc.com>
> > > Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware bas=
ed
> > > on PSR support
> > >
> > > Quoting Bjorn Andersson (2023-03-26 09:35:56)
> > > > On Sun, Mar 26, 2023 at 09:27:23AM -0700, Bjorn Andersson wrote:
> > > > > On Thu, Mar 02, 2023 at 10:03:17PM +0530, Vinod Polimera wrote:
> > > > > > For the PSR to kick in, self_refresh_aware has to be set.
> > > > > > Initialize it based on the PSR support for the eDP interface.
> > > > > >
> > > > >
> > > > > When I boot my sc8280xp devices (CRD and X13s) to console with th=
is
> > > > > patch included I get a login prompt, and then there are no more s=
creen
> > > > > updates.
> > > > >
> > > > > Switching virtual terminal (ctrl+alt+fN) causes the screen to red=
raw.
> > > > >
> > > > > Blindly login in and launching Wayland works and from then on scr=
een
> > > > > updates works as expected.
> > > > >
> > > > > Switching from Wayland to another virtual terminal causes the pro=
blem
> > > to
> > > > > re-appear, no updates after the initial refresh, switching back g=
o the
> > > > > Wayland-terminal crashed the machine.
> > > > >
> > > >
> > > > Also, trying to bring the eDP-screen back from DPMS gives me:
> > > >
> > > > <3>[ 2355.218099] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > > *ERROR* set state_bit for link_train=3D1 failed
> > > > <3>[ 2355.218926] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > training #1 failed. ret=3D-110
> > > > <3>[ 2355.262859] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > > *ERROR* set state_bit for link_train=3D1 failed
> > > > <3>[ 2355.263600] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > training #1 failed. ret=3D-110
> > > > <3>[ 2355.305211] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > > *ERROR* set state_bit for link_train=3D1 failed
> > > > <3>[ 2355.305955] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > training #1 failed. ret=3D-110
> > > > <3>[ 2355.345250] [drm:dp_catalog_ctrl_set_pattern_state_bit [msm]]
> > > *ERROR* set state_bit for link_train=3D1 failed
> > > > <3>[ 2355.346026] [drm:dp_ctrl_setup_main_link [msm]] *ERROR* link
> > > training #1 failed. ret=3D-110
> > > > <3>[ 2355.405650] [drm:dp_display_process_hpd_high [msm]] *ERROR*
> > > failed to complete DP link training
> > > > <3>[ 2355.668988]
> > > [drm:dpu_encoder_phys_vid_wait_for_commit_done:488] [dpu
> > > error]vblank timeout
> > > > <3>[ 2355.669030] [drm:dpu_kms_wait_for_commit_done:510] [dpu
> > > error]wait for commit done returned -110
> > > > <3>[ 2355.699989] [drm:dpu_encoder_frame_done_timeout:2398] [dpu
> > > error]enc35 frame done timeout
> > > >
> > > > And then the machine just resets.
> > > >
> > >
> > > I saw similar behavior on ChromeOS after we picked the PSR patches in=
to
> > > our kernel. I suspect it's the same problem. I switched back and fort=
h
> > > between VT2 and the OOBE screen with ctrl+alt+forward and that showed
> > > what I typed on the virtual terminal after switching back and forth.
> > > It's like the redraw only happens once on the switch and never again.=
 I
> > > switched back and forth enough times that it eventually crashed the
> > > kernel and rebooted. This was on CRD (sc7280-herobrine-crd.dts).
> > >
> > > There's an animation on the OOBE screen that is working though, so
> > > perhaps PSR is working with the chrome compositor but not the virtual
> > > terminal? I haven't investigated.
> >
> > I was able to reproduce the issue where in virtual terminal, I don't se=
e any screen refresh despite typing in.
> > In the VT mode, I see that PSR is entered, but despite typing in there =
are no atomic commits triggered, hence the last buffer was always refreshed=
.
> >
> > Queries from my side to Rob & Doug:
> > 1) In VT mode, does the framework operates in single buffer mode withou=
t any commit for new updates ?
> > 2) if above is true then, how does driver know if the framework operate=
s in single buffer mode, to make any appropriate action
> > 3) what is the expected behavior with the driver here ? should it retur=
n atomic_check failure, for single buffer mode operation or, it should exit=
 PSR ?
> > 4) is there any HINT passed down to the driver so that we can bank on i=
t and act accordingly?
>
> I haven't looked at this detail about PSR before, and I left my
> PSR-enabled device at home so I can't easily test this right now. That
> being said, from a bit of searching I would guess that
> msm_framebuffer_dirtyfb() is somehow involved here. Are things better
> if you get rid of the test against 'msm_fb->dirtyfb'?
>
> I at least used ftrace to confirm that on a different device
> msm_framebuffer_dirtyfb() is not called during normal ChromeOS usage
> but it _is_ called in VT2 usage.

Indeed, I can confirm that if I comment out the test in
msm_framebuffer_dirtyfb() and just call straight through to
drm_atomic_helper_dirtyfb() that typing on VT2 works fine.

...so presumably you need to figure out how to get "dirtyfb" set
properly when you have a PSR-enabled panel or maybe whenever the panel
enters PSR mode?

-Doug
