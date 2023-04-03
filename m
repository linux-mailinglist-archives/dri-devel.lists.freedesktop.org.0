Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4716D4D45
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B163610E4F1;
	Mon,  3 Apr 2023 16:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067E10E4F1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:12:10 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id p204so35413904ybc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680538329;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ckRoaRfuFXSxICrM929LhPKiHMEGVxGno6xY+TLvhpw=;
 b=FVhe/9/B5nnJIV+P+o3lR0MP8LctNsUM8vqI6LLpp5pOt9jJiOh9UHqSCQPsQ9Idbx
 PveyIETXxV9OXgvwdBG8WHQZiqo1///a8v4eJZzdQOnew15zDxUkUg3g1+3GN1V8WWm5
 UBIW3hmoHELoAQHoaOrQRZJL3C91NcfwFDS2CXp3wVnxQBOEPfPcYFkZJUszKf4znOGi
 EoY3CoyLXyg21b0tp9g3XgeYo2tzFUjtWPCLP9jRuuwzs9VJLXxFHbjX7r2UUsb9Ovqq
 KCEszdUu1e8jBQ2HJel2Fc9oVXahuP33s6Mr9oxYSXXYoq9e3T2GHwJre1EWKGo6zRmU
 bbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680538329;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ckRoaRfuFXSxICrM929LhPKiHMEGVxGno6xY+TLvhpw=;
 b=uxtxAnmZnTJwp5IQTdXrNs9J061ujFuJ8VZ6eW7DO+9DZVod7PxBjb/MrUZ6qDe5Wh
 2UJTxGQIJN+E9/C4fr2uw90hDuZAwDBuGdp1pfLo/VLz7KQr+HplYP2pw9MeqYaX9nZD
 5Tnljqo/vmgSjiBbDdNmuRvPSjH8ky8As9DwdNRAqjKLxqv58xG2wbQdlmwwmCsTDeP4
 XZnIh2M61IHuVrPs52S7q7SKv6CbOkmVLpRv0iyPU5AZeO2KogJyPpwCW5U/RF4lnLfp
 ZrUcT4Wgp3ChRvOpxiA8zs6eLyFSIvDU3a3bBKfmERB3tjEX7X4gsPohvQJ7Jf8i27Xf
 JcUg==
X-Gm-Message-State: AAQBX9cLJP0b3KVv5Km6Fx7T6KHdc4UhwMV8Dc5+TKx3LuIEdR/fcLRS
 +x0rObOOJqaZS/r+aRH9Jq+tqDsKcDc15ab2z9yyPg==
X-Google-Smtp-Source: AKy350bgZqCXxxXnZWum0y79BB4tNnWGNnYcibSUYJZtBvIrylGXzXDniMPLIwWkuC258xvk77u2JPwshx6cwkUy1ns=
X-Received: by 2002:a05:6902:168d:b0:b6c:2d28:b3e7 with SMTP id
 bx13-20020a056902168d00b00b6c2d28b3e7mr23000047ybb.9.1680538329177; Mon, 03
 Apr 2023 09:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
 <BN0PR02MB8173E9FF869F7EEFCE1F5410E4929@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8173E9FF869F7EEFCE1F5410E4929@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Apr 2023 19:11:58 +0300
Message-ID: <CAA8EJprj5cmB_STfv45NDCJ_e=aWfwMgaNmGkQBqFa8fQq6gQw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
To: Vinod Polimera <vpolimer@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Apr 2023 at 15:01, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
>
> > On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com>
> > wrote:
> > >
> > > In certain CPU stress conditions, there can be a delay in scheduling commit
> > > work and it was observed that PSR commit from a different work queue
> > was
> > > scheduled. Avoid these commits as display is already in PSR mode.
> > >
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_atomic.c
> > b/drivers/gpu/drm/msm/msm_atomic.c
> > > index 645fe53..f8141bb 100644
> > > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > > @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev,
> > struct drm_atomic_state *state)
> > >                         new_crtc_state->mode_changed = true;
> > >                         state->allow_modeset = true;
> > >                 }
> > > +
> > > +               if (old_crtc_state->self_refresh_active && new_crtc_state-
> > >self_refresh_active)
> > > +                       return -EINVAL;
> >
> > EINVAL here means that atomic_check will fail if both old and new
> > states are in SR mode. For example, there might be a mode set for
> > another CRTC (while keeping this one in SR mode). I don't think this
> > is correct. We should skip/shortcut the commit, that's true. But I
> > doubt that returning an error here is a proper way to do this. Please
> > correct me if I'm wrong.
>
> If there is a modeset on same crtc with a different connector. The new_crtc_state will not have self_refresh_active set.
> Self_refresh_active is set from the helper library, which will duplicate the old_state and just adds self_refresh_active to true and active to false.
> so we can be confident that if we are checking for self_refresh_active status then it should be coming from the library call.
>
> Also the EINVAL is returned to the self_refresh library API and the function will be retired.

Maybe I misunderstand you here. However, in this way EINVAL is
returned to drm_atomic_check_only() and not to the SR code.

> And self_refresh_active is cleared on every commit : https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/drm_atomic_state_helper.c#n158

And this means that this check will not trigger at all, if I'm not
mistaken. You've added code to msm_atomic_check(), so
drm_self_refresh_helper_alter_state() was not called (yet) and thus
new_crtc_state->self_refresh_active is set to false, fresh after
crtc's duplicate_state.

--
With best wishes
Dmitry
