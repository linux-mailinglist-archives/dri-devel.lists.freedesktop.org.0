Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7538E9E8F88
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C810E6B2;
	Mon,  9 Dec 2024 10:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fgnx2FnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEF610E6B1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:00:16 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso3713392276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733738416; x=1734343216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaKxBgaq02X8de3kQjZpaBJzI71CtFoxfGULZINgpO0=;
 b=Fgnx2FnI3mGBN6IRBtROPKjr5H03MtIX++votyUo3JPUc+arYL8B5X9qaKkwymfUO3
 sBrC6thjVdu0C0ApR/H0Y8IfYRY2hCtuiMsbP837xTq0Sl3ZJaQQysz5lCuV9GXMbTm6
 eB50eEkoJ3yzpkYvU7TDCLguOZos9PdriZ3+Nl0Dsj1BijT8AhiAoGW+kOJbAZGPllvY
 QsQVXcm1n/6VtXSxvCODxm/QCjo//g84oi9XKLt905K9r0Oup9hZbqjeo8clTyHSRV+H
 OpQ9sgVhX7zKHdLgS5I2wY3QhqM0ZmlxcUcxHI5Wd7zdlvjkhFQaK8FO91es/fdG3XNx
 vMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733738416; x=1734343216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaKxBgaq02X8de3kQjZpaBJzI71CtFoxfGULZINgpO0=;
 b=GG3MtMUlH/T3Q+loP5e6OPOY1jUYCH77qFQXvYdnR4Tvk7jE+7pyvOJEAheC+vKRko
 F+9e9TvZA/f1pJUOylnKDPxfC5sM/7yJtM4VWcc/a16qxCPb8nE54L3mvzhlADN4eqIg
 jzVAdQ2+L3gjZM1gGNcGX+nh6SB/DOuqvafHQ6rWmmxOlcV9bX+WV8ghAQ2/eSZSeE3C
 9ZwBCIOhg6xvwxKWHbEQ3y59UWkVtRnrwIfjSX1fSAlqKbrkMVtKX2pc09zzLbaS7fBe
 IxkCsidHaRKV0H59IuZmkcyN3Fs2l8XJYuCLRnqJRo05rIkcLBkIiI94saMJR0GeFZYp
 CMuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWozu5L5TEYkNk5Ub7Aez9le7sWho3CrpvVAXGB0kewOEswWfsTHBqkPesR3giukxp+L4sn+Jf2O2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs6jK16LEG+31SZVeK1A5pt19idYoac1UktAWTELbkLav4QCFl
 6+GXL2WfIwNBHXBHSyfef1M7nMdZ7A2QAr/gRHTAd7uPpOtQHoYMxC1Rkex6aESEwcRB5BUldDn
 OVc0iBmzP9cGPAuZ3SQIX8bbevh+eylJxpDG7mQ==
X-Gm-Gg: ASbGncuSBiVxSsv76jcav5365KZQDJejAy4X8Cn9CsF0fBq4+7UoaW74piH1fwHgBBB
 BcUfgYIcVwwhRMVyGxxCloI/0lFtD3L0=
X-Google-Smtp-Source: AGHT+IH+mgmmr4qqUrNvXi89RebxgrqqEnj6NinYEcPLT9jjbWocaOUTk5gkEpMuQlwCgNRcU7QqZkyyvUYXic93/so=
X-Received: by 2002:a05:6902:250e:b0:e39:b0de:fed8 with SMTP id
 3f1490d57ef6-e3a0b0ca18amr10550531276.17.1733738415719; Mon, 09 Dec 2024
 02:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
 <Z1a3jOB8CutzRZud@hovoldconsulting.com>
In-Reply-To: <Z1a3jOB8CutzRZud@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:00:07 +0200
Message-ID: <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, 
 Johan Hovold <johan+linaro@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2024 at 11:25, Johan Hovold <johan@kernel.org> wrote:
>
> Dmitry,
>
> Looks like you just silently ignored my reviewed feedback, yet included
> my conditional reviewed-by tag. Repeating below.

Excuse me. I'll expand the commit message.

>
> On Sun, Dec 08, 2024 at 07:29:11PM +0200, Dmitry Baryshkov wrote:
> > During suspend/resume process all connectors are explicitly disabled an=
d
> > then reenabled. However resume fails because of the connector_status ch=
eck:
> >
> > [ 1185.831970] [dpu error]connector not connected 3
>
> Please also include the follow-on resume error. I'm seeing:
>
>         [dpu error]connector not connected 3
>         [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Fail=
ed to resume (-22)
>
> and say something about that this can prevent *displays* from being
> enabled on resume in *some* setups (preferably with an explanation why
> if you have one).
>
> > It doesn't make sense to check for the Writeback connected status (and
> > other drivers don't perform such check), so drop the check.
> >
> > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu=
_writeback.c")
>
> I noticed that the implementation had this status check also before
> 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> dpu_writeback.c").
>
> Why did this not cause any trouble back then? Or is this not the right
> Fixes tag?

If I remember correctly, the encoder's atomic_check() is called only
if the corresponding connector is a part of the new state, if there is
a connected CRTC, etc, while the connector's atomic_check() is called
both for old and new connectors.

>
> > Cc: stable@vger.kernel.org
> > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
>
> Please include mine an Gy=C3=B6rgy's reports here too.
>
> Since this has dragged on for many months now, more people have run into
> this issue and have reported this to you. Giving them credit for this is
> the least you can do especially since you failed to include the
> corresponding details about how this manifests itself to users in the
> commit message:
>
> Reported-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@ku=
ruczgy.com/
>
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
>
> > Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> > Tested-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Leonard Lausen reported an issue with suspend/resume of the sc7180
> > devices. Fix the WB atomic check, which caused the issue.
> > ---
> > Changes in v3:
> > - Rebased on top of msm-fixes
> > - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9e=
b8e895@linaro.org
>
> Johan



--=20
With best wishes
Dmitry
