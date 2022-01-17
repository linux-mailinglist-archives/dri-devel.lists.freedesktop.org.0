Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9603491078
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 19:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E0610F895;
	Mon, 17 Jan 2022 18:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006E10F895;
 Mon, 17 Jan 2022 18:52:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso1610334wmd.5; 
 Mon, 17 Jan 2022 10:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Llyi63UWOQi3BXtk58lidq6ltne401ehGOiS/+yI99c=;
 b=E0SkFJ1eNBMo/BXshOmkTPChBIgiyyVlVk0gPGk8QVDDy8UyhCmsqtCHoZoCQaVEQx
 Yb58PaMtXHJVBJCjqhGQOYYVRLNm1yJkccLfJeS4ZcrGOGajs/K0w1TYlVLI/AmKZhRB
 fe6dC6vlN7i6TZBjk4XACc/fnUn5h4x7xC/oHEpyn0/nMwqXNHZzCKXzH+y93UyMAnX5
 eQviF1wxkhT72AKqxmeYxLzTL/pcImh7vlU/GhZfJSxitgRa/HCQtG2It+18vtBtWppx
 /H8OM87IZVViaQZgl4IwD4XbF02ov9rDIT9Vpwr+N7lASCCowUWCpV9Cp0ToXyuz+fqH
 R3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Llyi63UWOQi3BXtk58lidq6ltne401ehGOiS/+yI99c=;
 b=LOOzc5jJGNeUQxlDqqTaVqa1ohCVv1ATcbPuvy02Mj0i8yHmd+sege1Bt6eHZEC/tW
 e6ApGY7hW6w95pon5R4adaTuqf0XFH2E3/d8XuICpSjsIUEzwGPO2xuB3mW/v7bSRASk
 +iXO1igOIGmvVi3fB6Zl02SD/9vPinANK0gCuATnf42js2wfN/c4mgUNsG8AgkqDF7HF
 AIQ6XWWwEpoTgCVssK0znaEJA6xt3xP9ysx6u3g7G8RZLjSHO6EO3BRWjcGiMoM7oHiD
 OiaMRDAvj5WVFlK7HQdECpggTSQV6hgWw8Rfy11Zyg7XRqjFLzqp6gBntbg+zryCbzAg
 Jujw==
X-Gm-Message-State: AOAM5337PvbEYkFisOEVl2peDwWNBN0hTMLi6b3B7d8ITYIWeU3bJBC+
 ah/Wf74BqVjDt7gJsKPldzHizFKiOcemB4uxNME=
X-Google-Smtp-Source: ABdhPJxQ0pUqRD8MmoQwaA9vNqyssG6WNxyHraaqHL2nlDWnmgYgF9OQPX1Wec8GNSQSV0jOQD8w+lH1oChYwZaIrBY=
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr22116860wmc.127.1642445530931; 
 Mon, 17 Jan 2022 10:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
 <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
 <CAA8EJpokgiUbqj9BOF52a9QjJK53PinNHfxy_6nbNq53JnO2Og@mail.gmail.com>
 <bd284863-3643-4a8e-beb6-f47cc60ea1b5@quicinc.com>
In-Reply-To: <bd284863-3643-4a8e-beb6-f47cc60ea1b5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Jan 2022 10:52:07 -0800
Message-ID: <CAF6AEGsBNafYjfC-05XBG2QT+vxU-jB=wTmu9gOVe-wLTXFgzQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/adreno: Expose speedbin to userspace
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 6:38 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 1/13/2022 12:43 PM, Dmitry Baryshkov wrote:
> > On Thu, 13 Jan 2022 at 00:19, Rob Clark <robdclark@gmail.com> wrote:
> >> On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>> Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
> >>> identify the sku.
> >>>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>>
> >>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
> >>>   1 file changed, 5 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>> index f33cfa4..e970e6a 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>> @@ -242,10 +242,11 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
> >>>                  *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
> >>>                  return 0;
> >>>          case MSM_PARAM_CHIP_ID:
> >>> -               *value = adreno_gpu->rev.patchid |
> >>> -                               (adreno_gpu->rev.minor << 8) |
> >>> -                               (adreno_gpu->rev.major << 16) |
> >>> -                               (adreno_gpu->rev.core << 24);
> >>> +               *value = (uint64_t) adreno_gpu->rev.patchid |
> >>> +                               (uint64_t) (adreno_gpu->rev.minor << 8) |
> >>> +                               (uint64_t) (adreno_gpu->rev.major << 16) |
> >>> +                               (uint64_t) (adreno_gpu->rev.core << 24) |
> >>> +                               (((uint64_t) adreno_gpu->rev.sku) << 32);
> >> How about this instead, so we are only changing the behavior for
> >> new/unreleased devices:
>
> I thought this property was only used for new devices whereas the
> existing devices rely on REVN.
>
> -Akhil.
>
> >>
> >> *value = adreno_gpu->rev.patchid |
> >> (adreno_gpu->rev.minor << 8) |
> >> (adreno_gpu->rev.major << 16) |
> >> (adreno_gpu->rev.core << 24);
> >> if (!adreno_gpu->info->revn)
> >> *value |= (((uint64_t) adreno_gpu->rev.sku) << 32);
> >>
> >> (sorry about the butchered indentation.. somehow gmail has become
> >> antagonistic about pasting code)
> > I assume that you would like to keep userspace compat for older chips.
> > thus the if.
> > Maybe we should introduce MSM_PARAM_CHIP_ID_SKU instead (and gradually
> > make userspace switch to it)?
> >

Existing userspace tools do query CHIP_ID, but match based on GPU_ID
(falling back to CHIP_ID only if GPU_ID==0).. still, out of an
abundance of caution, we should probably not change the behavior for
existing GPUs.  But so far the only thing with GPU_ID==0 does not
exist in the wild yet, so I think we can get away without having to
introduce a new param if we only set the upper bits of CHIP_ID when
GPU_ID==0.

BR,
-R
