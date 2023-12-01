Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A58004D4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 08:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ACD10E802;
	Fri,  1 Dec 2023 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906A10E801
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 07:39:55 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d2d0661a8dso20013307b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416394; x=1702021194; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
 b=AQ1YjS90He88D8KQfn+GhUZaYFwAO/7FEfKMp46MKFpodILL/kYP335OAAhcMetdcP
 zcHQewvS/0I7BV/UxqaO7Ly2R/wqK/HCXiixmtNzxJXt+yhX4ujHPR51bD1kdTJnuEI/
 nJw4sttf+cqcj/9e6CdKCi9ZHJa4+JyrFQ2TFW7zseDhUx5LGo96ijx3rAqsISDMapFg
 1LrCT0Pu4+y6CzyjpKeLe8YDEiyPJPCTiFYjJbJq18dRCvg6/VjCCAtRLSzHr0NYyMpS
 LLUGPkVZ0dSVk368xjWTMb0NJSqINRzmCvNypcnD2nYrQhTM+kiXzeaVjfyVoa1BkW7D
 1uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416394; x=1702021194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
 b=ZXBmgLhPEFczwwPQNIEDBa+YdEvYTn3/otGbcZO9zZAOjw2xAheZlZUrT5vMhaCiGs
 NV50xHFPokiF3zwmYCuCADmdglbrxq6Z/N3i9wGtTolgBfsdm1gHTMfHS4aRzkqjs0Qk
 4BpYhMMUW2//w0hUiyBOWTZlfsDBvMchgLBk8C2V6PBS+efVD/2ta7USQ/s+ooIo63T1
 PracPcjSrNEDxAePQA53ZQgXy8uwA7zfOvyeDMVQMarL57xd9ixBhtU8D+t5yi/C6SnY
 BIxyfjY2z96hFGW4aGEbFHbO10cFlTLuNUoWGUfRKJ6GVXhj0v27sXKAWLGkcv4QfOXO
 vNJQ==
X-Gm-Message-State: AOJu0YyJ2ouu5NgQVka1hBeS6jiy1CrYAKYN2RMdQ10hM66P9gSBmq7k
 QeaBnljbOIdQs+BIftjUXWDTiOe4gUsKwY3IBUIgBQ==
X-Google-Smtp-Source: AGHT+IG6YJFYpxxDEGA5/9WsFpWY9Xkeap+TYkek9J98RCloSx+NNN/prVWH9iqo7eEB0Fko9lDJ0o8Q44uv8RIxQR8=
X-Received: by 2002:a5b:ec7:0:b0:d9a:4cc2:1961 with SMTP id
 a7-20020a5b0ec7000000b00d9a4cc21961mr21395804ybs.26.1701416394767; Thu, 30
 Nov 2023 23:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:39:43 +0200
Message-ID: <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm/dpu: INTF CRC configuration cleanups and fix
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Jessica Zhang (2):
>       drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
>       drm/msm/dpu: Set input_sel bit for INTF

Please change the order of the commits: fix (input_sel) comes first,
then comes the improvement.
Otherwise if one needs to backport this fix, they either need to pick
up the irrelevant patch, or they have to rework the fix.

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
>  8 files changed, 26 insertions(+), 30 deletions(-)
> ---
> base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
> change-id: 20231122-encoder-fixup-61c190b16085
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>


-- 
With best wishes
Dmitry
