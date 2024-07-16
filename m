Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234F933478
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 01:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3684710E8FF;
	Tue, 16 Jul 2024 23:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zQq2hb86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8A10E90C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 23:10:56 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e035f4e3473so5615223276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721171455; x=1721776255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mnz8Yur+ctB0OjoR8RPZjZ/sh0WQ6+9cTPLE+h5UQ+U=;
 b=zQq2hb864xXeUyTSVaQ5BxUbFhFlabjiGOng6pRpjDseoL3UOEV/pAiNz3ZMANySdu
 bmcuWi/DbTxjcxYFYUFas4W5DiwAixBPUlgKuUOs5Ii2+5zmoC1Kan5SKJ8t0KdwDy5x
 F9w/JZW8hLYZKpSDPBRLFV5K12tIjUn/RLfXfh8tSzhGR713ePYCQDkZ/YQJBaNltgnG
 9pr6kYgf/6W/POKzgvZPH4n0dHUFB9uq6lf6Eqyi4GD+O1BOmODzZ7+dExUvFoRUcSSJ
 mYJkmXS3CLY1DRFli+XsMl6f4KB/j5RVLssvJbc0x5283D+/RK9r/6SaYjcWUYN6Y6PA
 96tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721171455; x=1721776255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mnz8Yur+ctB0OjoR8RPZjZ/sh0WQ6+9cTPLE+h5UQ+U=;
 b=p677dGlUYGHOHZHubTRbXNoa8eLYFJpBhYm3QnWd3KZR4IFAH9ho4fsr/rZqtkSCJh
 t+pVdheyitnN8SOCC41j3u9qNfIOsUs2wmw4EFKBiVQwvnah8AegdMiieJFbNrEqKGh8
 zlo0yynryvR6hDxW0HVu6b23AsRYKHBewUIRufT/Zc20mwuupbh20ejEJhyjp3LwhxhM
 qiv0mpLTqpDLp63Y9Ll7TQdZmFQHjUV4rYz0GrEhvjXk+gjbHiTV+cLL+vOcWy2UGxuF
 4MU1qrRCalGa9k3j5Z5o7uf/HVm9n8AIbDWzg91bazcFLlAbD31XAmy1ue2yXsfrHiHz
 AKqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTFtVL85Z38hY3aMR8n0ArIYNnjGP+O1drzGqbH/zFB3ot8hcvs5SKdfwFREuOqtOLac4Ynw3gaLkOAsFTIUQ4h9L07rjgQeu1CRvPY3o0
X-Gm-Message-State: AOJu0YzHVKillO3P7Gqovwg/mkhIQ31nc4J869tlhkkLlEKgheclgJw/
 ZRJqSo2QnBgPyqBt3L40HKY1EUkF6YzjBTi3Ld0tE4EsgmfGOfafMLFiku/6pRosLbGn2ewsOQL
 as+EY2cuxPm2Cwr+mj7uROZd0QCIfloeQeo021A==
X-Google-Smtp-Source: AGHT+IG5CaNY3HH9LijnECfl6ut/hKInZ3kGI63WniAf8g8W96xXBmAkqYxaOI2F2ymneo+7FsVdA3Bfh3cIMNyAUh8=
X-Received: by 2002:a0d:cd45:0:b0:65f:ca0b:5ad9 with SMTP id
 00721157ae682-664fe73ffdemr723057b3.25.1721171455645; Tue, 16 Jul 2024
 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
 <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
 <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com>
In-Reply-To: <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 02:10:44 +0300
Message-ID: <CAA8EJprmi9zxEipq=0LyBi4nJ59BrLgN1sL+3u7-n9kJ3yQcRg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 17 Jul 2024 at 01:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 7/16/2024 2:50 PM, Rob Clark wrote:
> > On Tue, Jul 16, 2024 at 2:45=E2=80=AFPM Abhinav Kumar <quic_abhinavk@qu=
icinc.com> wrote:
> >>
> >>
> >>
> >> On 7/15/2024 12:51 PM, Rob Clark wrote:
> >>> On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> >>>>> There is no recovery mechanism in place yet to recover from mmu
> >>>>> faults for DPU. We can only prevent the faults by making sure there
> >>>>> is no misconfiguration.
> >>>>>
> >>>>> Rate-limit the snapshot capture for mmu faults to once per
> >>>>> msm_kms_init_aspace() as that should be sufficient to capture
> >>>>> the snapshot for debugging otherwise there will be a lot of
> >>>>> dpu snapshots getting captured for the same fault which is
> >>>>> redundant and also might affect capturing even one snapshot
> >>>>> accurately.
> >>>>
> >>>> Please squash this into the first patch. There is no need to add cod=
e
> >>>> with a known defficiency.
> >>>>
> >>>> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> >>>
> >>> So, in some ways devcoredump is ratelimited by userspace needing to
> >>> clear an existing devcore..
> >>>
> >>
> >> Yes, a new devcoredump device will not be created until the previous o=
ne
> >> is consumed or times out but here I am trying to limit even the DPU
> >> snapshot capture because DPU register space is really huge and the rat=
e
> >> at which smmu faults occur is quite fast that its causing instability
> >> while snapshots are being captured.
> >>
> >>> What I'd suggest would be more useful is to limit the devcores to onc=
e
> >>> per atomic update, ie. if display state hasn't changed, maybe an
> >>> additional devcore isn't useful
> >>>
> >>> BR,
> >>> -R
> >>>
> >>
> >> By display state change, do you mean like the checks we have in
> >> drm_atomic_crtc_needs_modeset()?
> >>
> >> OR do you mean we need to cache the previous (currently picked up by h=
w)
> >> state and trigger a new devcores if the new state is different by
> >> comparing more things?
> >>
> >> This will help to reduce the snapshots to unique frame updates but I d=
o
> >> not think it will reduce the rate enough for the case where DPU did no=
t
> >> recover from the previous fault.
> >
> > I was thinking the easy thing, of just resetting the counter in
> > msm_atomic_commit_tail().. I suppose we could be clever filter out
> > updates that only change scanout address.  Or hash the atomic state
> > and only generate devcoredumps for unique states.  But I'm not sure
> > how over-complicated we should make this.
> >
> > BR,
> > -R
>
> Its a good idea actually and I would also like to keep it simple :)
>
> One question, is it okay to assume that all compositors will only issue
> unique commits? Because we are assuming thats the case with resetting
> the counter in msm_atomic_commit_tail().

The compositors use drm_mode_atomic_ioctl() which allocates a new
state each time. It is impossible to re-submit the same
drm_atomic_state from userspace.


--=20
With best wishes
Dmitry
