Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0097B691
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 03:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA8110E04F;
	Wed, 18 Sep 2024 01:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YxOjYXQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B710E04F;
 Wed, 18 Sep 2024 01:30:40 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3a09c93db34so16780715ab.1; 
 Tue, 17 Sep 2024 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726623039; x=1727227839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsmNn5dg++oFHFAezsus4TU+AssoseH+2pzEpTsEOgA=;
 b=YxOjYXQzPZCx+2BVJnzyuAxQiWyw8Iiy1Wg67ZFe8jTtta6akQr5BQ3YcopOPSbTHd
 rGw7QnQ7U/zRKdIBnld5XfFDOEy9ms9SicLI5jMvKAGMeJ76m6B8m0QpwXbfiBvl4wkj
 UIahyjoDdq7rG+zSLzPUXAx76dQ9zPcmgGB9DEU7h5eCugV66wQVfDRTWWwRNum20QHm
 TvbJyY0XKGIiWdauq55CcJI496vMnCsuEQBun0jkRlbhp9DeVi3ocsB5jrs6P3y7He8f
 7clQ3skUq6lrsryZ5Guqzo0JWfPolnzhBS6TnWvUp4RJ1hpdqm+4ESMgs9u38S0E07EI
 pisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726623039; x=1727227839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CsmNn5dg++oFHFAezsus4TU+AssoseH+2pzEpTsEOgA=;
 b=h4Ea6grwOTMiQSxwm4dCyXo7eLMafmrmddLgRAXujQpvraROPiXG28yUsVqCblBNsL
 VuwKdLbTw1iSaZK5oUDKt3gjCzMWOh++Xyp9a1gEXChZwx4Akh1Jd+ahRUcP+9rMgd7Y
 hcvF0GgwOrDZLBhBH9bG9wUm5t51Pa04d1QLD+nwYShZ2qR6arw/4tMCkm4N76bX8I5b
 0vs+KBjP6Gir9xqaNRAhKdGNB5GFOtwCAqoyNbqMjONVVI0XUEHqhezM8Hf97TWbiY1Z
 TseWv5SttUds4VvwUDMlPpq2Tq8+ToQcMclBe1nvG7VPokTsUsQlW1u8ac0C7IOX46F1
 Bnbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlcd8Fm1SdF5T3uS1YCroq/hNGpotXZEwE+A4HZ3tzfOioGYkH41QhkLlF81Q9SUhlgu0josXajMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLJ9JidCWmyOSEK4sY7WNnED2eLv1HVI7AfW/sul0ZA2DKVwDe
 oWHKGtmryN68fMIdOGMFNfckpgoDlhYpL76vkocgaw9JgtwH68uBmg1F3ihyzbQZGdFqA7GS2Qj
 HQ0xVdR9+/bIPDuIrtvAF4Sw3u80=
X-Google-Smtp-Source: AGHT+IH+arwrYMMUiRQ7iDz1p8MmtCk5NY5GioMSJMKylZrwRZMJBVsiVdg6t3RHmGzslQrpXww0oOTa8SFimw7P4Zw=
X-Received: by 2002:a05:6e02:b2c:b0:3a0:978b:e6b with SMTP id
 e9e14a558f8ab-3a0978b112bmr104763985ab.21.1726623039436; Tue, 17 Sep 2024
 18:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
 <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
 <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
In-Reply-To: <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Sep 2024 18:30:27 -0700
Message-ID: <CAF6AEGsVaq33wJzfnuvLWSPbmecx-j8a8FoCenKkBLMuqBTwdg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Sep 17, 2024 at 4:37=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 17.09.2024 5:30 PM, Rob Clark wrote:
> > On Tue, Sep 17, 2024 at 6:47=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> On 13.09.2024 9:51 PM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> >>> devices (x1-85, possibly others), it seems to pass that barrier while
> >>> there are still things in the event completion FIFO waiting to be
> >>> written back to memory.
> >>
> >> Can we try to force-fault around here on other GPUs and perhaps
> >> limit this workaround?
> >
> > not sure what you mean by "force-fault"...
>
> I suppose 'reproduce' is what I meant

I haven't _noticed_ it yet.. if you want to try on devices you have,
glmark2 seems to be good at reproducing..

I think the reason is combo of high fps (on x1-85 most scenes are
north of 8k fps) so you get a lot of context switches btwn compositor
and glmark2.  Most scenes are just a clear plus single draw, and I
guess the compositor is just doing a single draw/blit.  A6xx can be
two draws/blits deep in it's pipeline, a7xx can be four, which maybe
exacerbates this.

> > we could probably limit
> > this to certain GPUs, the only reason I didn't is (a) it should be
> > harmless when it is not needed,
>
> Do we have any realistic perf hits here?

I don't think so, we can't switch ttbr0 while the gpu is still busy so
what the sqe does for CP_SMMU_TABLE_UPDATE _should_ be equivalent.
Maybe it amounts to some extra CP cycles and memory read, but I think
that should be negligible given that the expensive thing is that we
are stalling the gpu until it is idle.

> > and (b) I have no real good way to get
> > an exhaustive list of where it is needed.  Maybe/hopefully it is only
> > x1-85, but idk.
> >
> > It does bring up an interesting question about preemption, though
>
> Yeah..

The KMD does setup an xAMBLE to clear the perfcntrs on context switch.
We could maybe piggy back on that, but I guess we'd have to patch in
the fence value to wait for?

> Do we know what windows does here?

not sure, maybe akhil has some way to check.  Whether a similar
scenario comes up with windows probably depends on how the winsys
works.  If it dropped frames when rendering >vblank rate, you'd get
fewer context switches.

BR,
-R

> Konrad
