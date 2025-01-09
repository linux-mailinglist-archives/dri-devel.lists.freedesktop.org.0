Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E6A06DA1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 06:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03310ECE4;
	Thu,  9 Jan 2025 05:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WriyG6E/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E458010ECE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 05:35:57 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so10492915ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 21:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736400897; x=1737005697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
 b=WriyG6E/KrFOcyxuVDdKMa9AaJem1z5FsW8CtHDBLHlnyuHDyIZIA1CGxYQhGrLGyr
 9f3Yrc/uWWD00hMhhBV+ISijmQtwo58YAo9h3j2FhSaabd73TZClx+iV8iX1waUrLPdW
 YbXB2SI2xujyEFrE+y4/hZb4iNZq6IL0tvPa8HvRmIwadNLN6J2r1vUsxQvbuIH1A//3
 fBQhZSNbAk77n6t5Nl5LdXWrDCm0D6oFDDKDGVV4PHtNpyOzNngSCImxDNxsfnlMCRjX
 bJi+TuTBXLhIvqoMQKpsqEqPTAq7T4l+/Gt1RHjlyHa2uvVsUml4RLWJdv+dh6jYypxk
 hwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736400897; x=1737005697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvs/mHJQMOdYczLfBV45iYS0W7vmpZ9giDxDReXGotg=;
 b=ZoF+xpnjfAPcD5Zwpb2A7GP22KY0EBUBRgFwT+9yRiSmp5wIe5N6+gSgLjh3YvGFbh
 CwebUYEEAgeXdl+y6yxkOYjcJfdsaGtnUrFvQSwsj5cUfIpuM9U342KH7ooc15IdoE5U
 Bc4jd7+5YcGomBl1WGYIjEWn5Z+285DBgy31l4M7ItWzMYTiRiHbWkeEQ7EiXxi+c3SB
 TjDB0ydwoJUmxTauwfVzRVF99TrZCtCSrQSe7v0oApsxnN6DOqHUXS4p9tFHxQdKLqeM
 2Eq+3yzYhKprZVebECaQQAeiZyeUixyH9r39A3dz/nvBbcq7sPozLBb6QyVxK91SGAk8
 pQCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtZr8hVFUZtV8tLh4Jrypcx6SNbpLPCX+GZVl8BrEWMx0wxDYMh4xU18x3LGig/5hqx4e9pY4AaF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkAOb+lYVey3IN69UB2EVkSwieoC4Rrilp1J8L+o+fYQLrSisr
 PY8vH5ovBI4Nf5PpK5QHmT/L+p74qMrpMScxS9K218SveDuIlLvqgU0DGuujV65Rvzpz7ZXm3DG
 MBOFoidM60FDuYHa/fVz/zVeUb0cRbp32wGbOg/9ZAw4Rt4QcUPipDQ==
X-Gm-Gg: ASbGncslIlR88SfuisHbcwQand/P48UhC5opYIqQ5IGwv9Gf8UTMVlyUIwBuOOjWC5B
 M0Oz89HJKI11CcD6kmsDMvJrxNi1OqPW8PJ7kmKg=
X-Google-Smtp-Source: AGHT+IF9s2GUSi5T7LK6WS13hidqzx5TqfDPAlAGk/Zzi1kAOlWEP/BP72Us2yTqrtLnalb/C5PfgG3qgZc/bEjeS/A=
X-Received: by 2002:a05:690c:f84:b0:6f2:8e62:d8f0 with SMTP id
 00721157ae682-6f5312ae9e9mr43943667b3.30.1736397634058; Wed, 08 Jan 2025
 20:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
 <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
In-Reply-To: <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 9 Jan 2025 12:40:23 +0800
X-Gm-Features: AbW1kvbKKm8DJYo0dAIIJoPHVvNkrDYDyz7Pf_4o6XMiCwe4OMdmxohhw0h99BA
Message-ID: <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=
=E6=97=A5=E5=91=A8=E5=9B=9B 09:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 12/18/2024 11:49 PM, Jun Nie wrote:
> > Add the case to reserve multiple pairs mixers for high resolution.
> > Current code only supports one pair of mixer usage case. To support
> > quad-pipe usage case, two pairs of mixers are needed.
> >
> > Current code resets number of mixer on failure of pair's peer test and
> > retry on another pair. If two pairs are needed, the failure on the test
> > of 2nd pair results clearing to the 1st pair. This patch only clear the
> > bit for the 2nd pair allocation before retry on another pair.
>
> Hi Jun,
>
> I think the commit message wording is a bit unclear. Maybe something
> like "Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases where
> multiple LM pairs are needed"

Thanks for the suggestion! Will adopt it.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index cde3c5616f9bc..a8b01b78c02c7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               if (!rm->mixer_blks[i])
> >                       continue;
> >
> > -             lm_count =3D 0;
> > +             /*
> > +              * Clear the last bit to drop the previous primary mixer =
if
> > +              * fail to find its peer.
>
> Same here can we reword it to something like "Reset lm_count to an even
> index. This will drop the previous primary mixer if ..."

Will do.

>
> > +              */
> > +             lm_count &=3D 0xfe;
>
> Nit: Can we directly clear the first bit instead of doing an 8-bit bitmas=
k?

Could you elaborate on it? Or you are suggesting to mask 0xFFFFFFFE?

- Jun

>
> Thanks,
>
> Jessica Zhang
>
> >               lm_idx[lm_count] =3D i;
> >
> >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_s=
tate,
> >
> > --
> > 2.34.1
> >
>
