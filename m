Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B281A7DCD2D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF6310E49B;
	Tue, 31 Oct 2023 12:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256DB10E49B;
 Tue, 31 Oct 2023 12:48:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so829517966b.3; 
 Tue, 31 Oct 2023 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698756482; x=1699361282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cNqw8Df0KTWoMURhaCAzAC8cx2hHKx+9toGPqfTnvo=;
 b=BmUH7cXlNhFb6JAuKHPchLGeAv5J4rdzxr5W1TOBa0cbUaQwZ03nHxfCYa2MtgblBk
 M5HzaBGjbxwHyriWOaptBOIual2I7Ucr+oNmuTQKevbZUmCxcJdAPdO1JlV9SzdU9A70
 xsQGHpDDjY78B4/e0sVw/BuUYfFm45PWqnlWbDpz9GdteEzUzeLlre+VIFDhex54Ubt9
 BewmJQdc1Hzhr/yI5NPgLCrGjaTpG+5v3iREAMoNvq+PrkfmUVDaG42z0DRi3P8Ggbjk
 9AQsXu2YkxIIJaQc3pRnTvGEgwmXzZgSu+iV7WT1D/GNs4WEU38dG9KRON2aTfYNynIh
 gErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698756482; x=1699361282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8cNqw8Df0KTWoMURhaCAzAC8cx2hHKx+9toGPqfTnvo=;
 b=RkkKoApeUMIH6GVUzCoS+rn+7MPowiXJ2ztW5rBnr4LoEFf4Z4C0iiXo3JQNKfK1Yv
 D9k1p5HSQPpmwX39Nt7ZNZkV98eYdwMV8czeRGcmvx2l1SPuWjsgFsNLJ1Qhi8Drr8Tn
 lc8oO7HMDp/EGzQEsFrqt4dtpZeq/i36vhq4UUdtq8WgDAF/lWj1e7OqVZXaXl0tyqBl
 lzo8fmKIKlkQ5cKq6rkXF8TI/giDGb6GcDFVdcxx8h/0hsMfSn9kjmqEuHXc4j5JhiUK
 jsliY873aL21q6WXEezpJfdvFEo0iw2txQfw1y463s8abHzlgKVdywsc1yvX7bno2RRT
 TXbg==
X-Gm-Message-State: AOJu0Yw0Haa1ZW+xGUnUk9t+GnnEe0uAAl6YFjcnOlwIW0D4GDhgAoiY
 ujQrOBKsLoQYRD40hfSGs0ZYkSI8MWPph4y0pjU=
X-Google-Smtp-Source: AGHT+IGVYTmlrcy3cyujyUR5gC38iHICEwPtr+8Fv7clqc1AJi3ujCuVZwvc9Nwklhufs/zB+XLxdEfC0RHj5wlrdBo=
X-Received: by 2002:a17:906:4784:b0:9ba:65e:7529 with SMTP id
 cw4-20020a170906478400b009ba065e7529mr11702882ejc.68.1698756482355; Tue, 31
 Oct 2023 05:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
 <ZUD0lhStirf8IN8-@hovoldconsulting.com>
In-Reply-To: <ZUD0lhStirf8IN8-@hovoldconsulting.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 31 Oct 2023 05:47:50 -0700
Message-ID: <CAF6AEGs9PLiCZdJ-g42-bE6f9yMR6cMyKRdWOY5m799vF9o4SQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
To: Johan Hovold <johan@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 5:35=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Oct 30, 2023 at 04:23:20PM -0700, Bjorn Andersson wrote:
> > During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> > typically take 1-2ms to complete. As expected this results in poor
> > performance, something that has been mitigated by proposing running the
> > iommu in non-strict mode (boot with iommu.strict=3D0).
> >
> > This turns out to be related to the SAFE logic, and programming the QOS
> > SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> > TLB sync time to below 10us, which means significant less time spent
> > with interrupts disabled and a significant boost in throughput.
>
> I ran some tests with a gigabit ethernet adapter to get an idea of how
> this performs in comparison to using lazy iommu mode ("non-strict"):
>
>                 6.6     6.6-lazy        6.6-dpu         6.6-dpu-lazy
> iperf3 recv     114     941             941             941             M=
Bit/s
> iperf3 send     124     891             703             940             M=
Bit/s
>
> scp recv        14.6    110             110             111             M=
B/s
> scp send        12.5    98.9            91.5            110             M=
B/s
>
> This patch in itself indeed improves things quite a bit, but there is
> still some performance that can be gained by using lazy iommu mode.
>
> Notably, lazy mode with this patch applied appears to saturate the link
> in both directions.

Maybe there is still room for SoC specific udev rules so dma masters
without firmware can be configured as "lazy", ie. like:

https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/refs=
/heads/main/baseboard-trogdor/chromeos-base/chromeos-bsp-baseboard-trogdor/=
files/98-qcom-nonstrict-iommu.rules

BR,
-R

> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>
> Johan
