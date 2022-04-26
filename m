Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2375104DD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83910E8EB;
	Tue, 26 Apr 2022 17:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA0710E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:06:08 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3122927pjf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2bOAXdV05ngOnaAdgM1PB5gzMCRGIbydXOaP7Kl6nBQ=;
 b=SVMfpAb+mMdqVE00gH2Mh39sQeKFsd/ATsbbNWPBL/C3MYtGoz3lb0UpmG/PBzGVVk
 xPLQ8XDvIvLY6C8jz6GUEWdOlFkKUuxWnxggPRoVnkRQR4Du5y20v9/aifNNhJmxvSKZ
 ohdRhWLKpKf3H51ftID3WRS8UIhQaXAkERoEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2bOAXdV05ngOnaAdgM1PB5gzMCRGIbydXOaP7Kl6nBQ=;
 b=Ui4Typ1vgoWNK9RaA3BqXE4aapCamWT+9FeYXRrKxw4FUprvYnIshpuZMDulHWchs9
 OtwNUzLB2j7aMlg42cObJFC0aDTWIx8lN9FQhMXNZtLnQH7wOUwL/QrpT9Yv+Q+4cyir
 s+UREC3tPGJOSmy+4Oypr71nERfzltuRGz21hxEmJOR5kdxKohvRUla8Crv1luB1ki67
 7pK9UINt/LCsP6ekdWGeMGOURLbjys1DSkrRNB9M4QpnEDuLBM8ycGWvxMsripaj//R0
 zuYzSeHIBPTkJNjDlzPchD2eOirgy+Uwbo34kZ9yjnT1/uuIcHQ4VLcoqiaADwi4hPLd
 RofA==
X-Gm-Message-State: AOAM531e6YBWE1ZvxNcDaHE1sgbDJgYT7vc4q45clgSzgIKiOug4J74S
 T83m7ArA7FBn3jk3vJcwGZ/gu4YGU08nu40ntTnVGQ==
X-Google-Smtp-Source: ABdhPJziBWuuXlLcANNapMCrTENULU79cINFh95+CzlTGasENmvcqLOM8a7K9yUv3HU8fo8ckeShRPRjdvUf9ljBzRk=
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr24374144plh.15.1650992768013; Tue, 26
 Apr 2022 10:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
In-Reply-To: <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 26 Apr 2022 10:05:57 -0700
Message-ID: <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> > On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >> In practice, trace_dma_fence_init called from dma_fence_init is good
> >> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
> >> and virtio both have cases where trace_dma_fence_init and
> >> trace_dma_fence_emit can be apart.  It is easier for visualization too=
ls
> >> to always use the more correct trace_dma_fence_emit when visualizing
> >> fence timelines.
> >>
> >> v2: improve commit message (Dmitry)
> >>
> >> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > This has been reviewed.  Should we land it?
>
> No, there are still open discussions about it.

I think if it is needed for trace visualization, that is justification
enough for me

I don't really see otherwise how a generic trace visualization tool
like perfetto would handle the case that some fence timelines have
separate events but others do not.

BR,
-R

> Regards,
> Christian.
>
> >
> > (Or, how do I check if it has landed?)
>
