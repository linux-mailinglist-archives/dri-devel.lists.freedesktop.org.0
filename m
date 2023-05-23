Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453F70E60A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AD210E4C0;
	Tue, 23 May 2023 19:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22810E4BF;
 Tue, 23 May 2023 19:53:01 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6af6db17a27so3112a34.2; 
 Tue, 23 May 2023 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684871579; x=1687463579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qp+ShQdW7PB+8DG4rAciHgSrob5gFvAziJEY22PEZdo=;
 b=H/qd4f3vNxm2DmFvUxFqVq8G30x7NRqd9AGckXg3qMNfAg9NSA6zVZ4hwOTjxj7Ex5
 CIRdifTNTphlreVZXLYHYXsbjxiLUoXurl3OjJRj/1a74MMh6GTQNEOs7Q8G4NBBV+JA
 DNaui/5hFWzVQhGHp5TguZXH9u0VzpqZAUHDwvRdciNuSQPyTdS8HxkUh1ZKHkPl1mlg
 FvvTLO2ZzT2muayA8X0VffUp8E77Ibee1CKZ1ewcdwbeA6vrijZA1qI4bDD/yHo7kl53
 6U3TadjvS81Cq1TBUorY7ZrhbsNn7+LxJopMEalzvHsMOxyVCY+GeM/oUtjgpxjnef+4
 ECgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684871579; x=1687463579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qp+ShQdW7PB+8DG4rAciHgSrob5gFvAziJEY22PEZdo=;
 b=E0s8HRuEk24ZtJCkqdSHbqXOiUiIyhXQQuUu6Ma3fWLdYc1ZEst1RbzC9abEGlH8mU
 Vx1HKIlf27MbnAY0XSXXjlbTUo1xByAaupb888oQLn0e5OXatqCQB3aiKnbShVGsqeSZ
 fTFo/fuOLWbZddjZANCMRKtnDfxhQ9UheTlE3jmafresb1TwokXupQIg6dXy4F9WmYpA
 YKRaqQ+kfUkjkqEpCjj5wbtvd2OJ9crjyFu8otEYuCu29BDOJyXuZ5X/2ZrioT6UBoD3
 hskp6Cs3saNGngh0wmwR/NJUVaKJNfmBG0FJ7Eadc29+EfqKCcK57xdyimo9/KTAXXMj
 mKcQ==
X-Gm-Message-State: AC+VfDw6bQZrxhjQuAtUq+7OiMyLAXWlO/NW3OEpfviK/rzLQ6VtTXCl
 NPiFeLXTuYcvORg7JsIsyPfbG+FE9CCNrEX7+Bo=
X-Google-Smtp-Source: ACHHUZ6ULiPhWw1lgwrqdu23Hrw7vXt2YVDLQ/71nwCurMNdKV2WTpd4fsR5i54abHRQv2b7sT9H399LZQgRqLDxYKM=
X-Received: by 2002:a9d:5617:0:b0:6aa:e821:88eb with SMTP id
 e23-20020a9d5617000000b006aae82188ebmr7119572oti.4.1684871579561; Tue, 23 May
 2023 12:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
In-Reply-To: <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 23 May 2023 12:52:48 -0700
Message-ID: <CAF6AEGuNO46Nz0sTD+yDPa_7PF2u7Phx+rGPFUSJBz7nwaya_A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, dianders@chromium.org,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 12:23=E2=80=AFPM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/23/2023 8:24 AM, Johan Hovold wrote:
> > On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
> >> On 28/04/2023 02:28, Abhinav Kumar wrote:
> >>> On sc7280 where eDP is the primary display, PSR is causing
> >>> IGT breakage even for basic test cases like kms_atomic and
> >>> kms_atomic_transition. Most often the issue starts with below
> >>> stack so providing that as reference
> >>>
> >>> Call trace:
> >>>    dpu_encoder_assign_crtc+0x64/0x6c
> >>>    dpu_crtc_enable+0x188/0x204
> >>>    drm_atomic_helper_commit_modeset_enables+0xc0/0x274
> >>>    msm_atomic_commit_tail+0x1a8/0x68c
> >>>    commit_tail+0xb0/0x160
> >>>    drm_atomic_helper_commit+0x11c/0x124
> >>>    drm_atomic_commit+0xb0/0xdc
> >>>    drm_atomic_connector_commit_dpms+0xf4/0x110
> >>>    drm_mode_obj_set_property_ioctl+0x16c/0x3b0
> >>>    drm_connector_property_set_ioctl+0x4c/0x74
> >>>    drm_ioctl_kernel+0xec/0x15c
> >>>    drm_ioctl+0x264/0x408
> >>>    __arm64_sys_ioctl+0x9c/0xd4
> >>>    invoke_syscall+0x4c/0x110
> >>>    el0_svc_common+0x94/0xfc
> >>>    do_el0_svc+0x3c/0xb0
> >>>    el0_svc+0x2c/0x7c
> >>>    el0t_64_sync_handler+0x48/0x114
> >>>    el0t_64_sync+0x190/0x194
> >>> ---[ end trace 0000000000000000 ]---
> >>> [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
> >>>
> >>> Other basic use-cases still seem to work fine hence add a
> >>> a module parameter to allow toggling psr enable/disable till
> >>> PSR related issues are hashed out with IGT.
> >>
> >> For the reference: Bjorn reported that he has issues with VT on a
> >> PSR-enabled laptops. This patch fixes the issue for him
> >
> > Module parameters are almost never warranted, and it is definitely not
> > the right way to handle a broken implementation.
> >
> > I've just sent a revert that unconditionally disables PSR support until
> > the implementation has been fixed:
> >
> >       https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@=
kernel.org/
> >
> > Johan
>
> I dont completely agree with this. Even the virtual terminal case was
> reported to be fixed by one user but not the other. So it was probably
> something missed out either in validation or reproduction steps of the
> user who reported it to be fixed OR the user who reported it not fixed.
> That needs to be investigated now.
>
> We should have ideally gone with the modparam with the feature patches
> itself knowing that it gets enabled for all sinks if PSR is supported.
>
> I had discussed with Rob that till we have some more confidence with the
> reported issues we would go with the modparam so as to not do the full
> revert.
>
> In this particular case, the one line revert is not really a deal
> breaker. In some other implementations, it might not really be so
> trivial to revert the feature with a one line change.
>
> So I would like to understand what is the concern with the mod param if
> the maintainers are onboard with it.

Tbf, I'd go further in the modparam direction, ie. add a default
disabled modparam, but then _also_ enable the modparam in CI and add
the failing tests to xfails.  I'd rather have xfails in CI than skips.

Acked-by: Rob Clark <robdclark@gmail.com>

BR,
-R
