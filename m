Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821095C9BE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 11:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5F10E401;
	Fri, 23 Aug 2024 09:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBCF1QR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E9110E3EE;
 Fri, 23 Aug 2024 09:54:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2d3ba497224so259342a91.0; 
 Fri, 23 Aug 2024 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724406887; x=1725011687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4bN9IfcVP0Js1Ho+sT05Ee5/YCq3s77Z8TA53IzYiQ=;
 b=DBCF1QR4N+yhnbTuygKegUB5dmZYh3RYEVKnZWju576EerdUMUtRp3zZghRKVSt2e4
 p9Cm/3lxzyW5fcdDhojSFMVP71BjdbDGmtj0ofcA+swRpESMU54MyA9e+R3+0JjaWYCf
 WosxWmFWy27ywLzoRO9ZX0a18EV2u9FI/o5zptjyOPGLqRfwFSJxYNUo0MHWCar+UerG
 HzBdspHkm+hjmvkDC1DIakOjQylQSp1MX1cbxc2HTjliXZ/fepN3ycUvI68A29boUGut
 JUuNLj0mx8z38t1Agh65CBa8TuoNE4jLsC8thBBL1wm72ku3F4dz3u6sHIsQUuX0CdQi
 UlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724406887; x=1725011687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4bN9IfcVP0Js1Ho+sT05Ee5/YCq3s77Z8TA53IzYiQ=;
 b=wG3CgeWBA9MOcfsSS1UaJXjafFjaM1W8hYt2nwX+81Wq4DN7CT5vj1L2czqc1WvMMn
 w/aBl8v1PKfKUaLUpzz9lNXaUrPT4HGOJdiLn2xojHDTn89xaP7sfXcl31vzTZsGFA2F
 /VyONm83wdEqqGQwmUqqTIzu3p8DBBBSTK4nyAx9XvaF+1HcmU8TLmi8fabyPcId5wIm
 h8qYI5mvl8iUEXpOEvzS1lgvffSIGuZydtyEixCaFgOl8CcMGgZTYvTNj650l0GPwlm5
 zaLvz3P+ThQhmeiX42SaNkHLNhkCUKLJv4gPHLStFjgUPaVpRmLehwFOq0TLEA52lDTd
 rT9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiC4LsGVa5LRucWg9w+Rdaw979GwDkgBKgKs6uWHYsT1D3Zxxq41T9OZD3ETPsU5sgVaVBHemClFtm@lists.freedesktop.org,
 AJvYcCX6ucOhKFu1RR2i/NrljOokiHpNcdeSsOg0Vb1c0D/RqmMv0JJg9L83vG/2F9VtUefZALpGd8l++wA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv/HdEfMMGCkCwbGzPSEY8AKThOCTZFlQVJ3r1dHiUZ9ty/GW0
 FPYgt4lBItXSP+fYO4fCAFWM8XT1LEquYVposcP+fP3p77f4r/hGuH+W8beeSKIyiPSacEwc4kt
 5kDF9RY+GU0UeUkwxwyw37Tgf5MTMAVUtwNXukA==
X-Google-Smtp-Source: AGHT+IHkKd6W3yLC8UO7e6tYlcg+yxaTXlITfiFbSzWQxEydP7NfUV7YDnPSBqBENI+EV62HFZxca1DdRI9a5B+97vI=
X-Received: by 2002:a17:90a:1f07:b0:2c9:6920:d2b2 with SMTP id
 98e67ed59e1d1-2d646b9d9bfmr949904a91.1.1724406886880; Fri, 23 Aug 2024
 02:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
In-Reply-To: <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 23 Aug 2024 10:54:34 +0100
Message-ID: <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: neil.armstrong@linaro.org
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
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

On Fri, Aug 23, 2024 at 9:30=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 15/08/2024 20:26, Antonino Maniscalco wrote:
> > This series implements preemption for A7XX targets, which allows the GP=
U to
> > switch to an higher priority ring when work is pushed to it, reducing l=
atency
> > for high priority submissions.
> >
> > This series enables L1 preemption with skip_save_restore which requires
> > the following userspace patches to function:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> >
> > A flag is added to `msm_gem_submit` to only allow submissions from comp=
atible
> > userspace to be preempted, therefore maintaining compatibility.
> >
> > Some commits from this series are based on a previous series to enable
> > preemption on A6XX targets:
> >
> > https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@code=
aurora.org
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> > Antonino Maniscalco (7):
> >        drm/msm: Fix bv_fence being used as bv_rptr
> >        drm/msm: Add submitqueue setup and close
> >        drm/msm: Add a `preempt_record_size` field
> >        drm/msm/A6xx: Implement preemption for A7XX targets
> >        drm/msm/A6xx: Add traces for preemption
> >        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_crea=
te
> >        drm/msm/A6xx: Enable preemption for A7xx targets
> >
> >   drivers/gpu/drm/msm/Makefile              |   1 +
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 +++++++++++++++++++++=
+-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 +++++++++++++++++++++=
+++++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
> >   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
> >   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
> >   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
> >   include/uapi/drm/msm_drm.h                |   5 +-
> >   11 files changed, 995 insertions(+), 16 deletions(-)
> > ---
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > change-id: 20240815-preemption-a750-t-fcee9a844b39
> >
> > Best regards,
>
> For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 M=
R & vkcube
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>
> If you think of more tests to run, please tell me.
>
> Neil

Hi Neil,

I think it would help to test this on SM8550 and SM8450 too. I don't
have SM8450 to test with. Maybe also worth mentioning that there are
now vulkan CTS tests that try to test L1 preemption:
https://github.com/KhronosGroup/VK-GL-CTS/commit/7e0e4a000f34e748bb527b39f7=
30f78b595140b9
although it's not in a released version yet.

Connor
