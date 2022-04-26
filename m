Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806251035F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8210E86D;
	Tue, 26 Apr 2022 16:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB46B10E875;
 Tue, 26 Apr 2022 16:33:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g23so16024388edy.13;
 Tue, 26 Apr 2022 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/xT8OEkfJiGdCpQNvW6rWuFI33EcUc9l2oRZJTJYjo=;
 b=ZXI0iF4XwaUFS2CouqYpBm2HJAhUUGwHxnsr7S2MSxFudHfTpPeqryiZimuBmutRWo
 TsT6M4xRhARlro2JR1B8K/eQ6hylzrhd86UEkByLWqmwxNlHG/s37h2blq4q1OD33gZF
 29E8BhrAcQUhpmm7vN/VPGIdlIGL3boPkA88msmg+zVtWou8S+8a47CVvMXvqFLfL+lq
 0Oo4dFTGdQZwhgZ+/9elASV3BTTyQF1b6XpQA0Nz0zmvyp+CJW6By+W5oYx2XRlqO8yF
 zNDP5FvK4w/5toz477GonMovhzlQzeqk+knnHsplHf+6BiqBmfBhJLQ2y2rL5XxlRys9
 2Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/xT8OEkfJiGdCpQNvW6rWuFI33EcUc9l2oRZJTJYjo=;
 b=V+Yt3sHPFJ3U6SLkt17JVildx6A6gopfsgNmoW9zS+l9FwxwF2Bl4tsZzHqzNlaGr5
 1WFig6pQWiD7jThSpubXHxoH1PC3oc+l9XSYPBbofkgLFpP+H2HxolIwGJOpia6uLZRE
 MlRgDOwFd7MxWGiANW3Y9fP8ioidNSAmjl9C0YOzkacPAW3nzREg7qUKe5haKRy/8u69
 /l5qLgpUvsYd7KI5Bt8C+8MzhKWi9pTsCA7JuvUQUgxFJCorP9D2RnS5AK7RXeoD0yTY
 St5kp7SvhYaytB7/JHcJBE1BxY8y+snp/XfZGJiS2DKOYOfbTCiWyspuvZXivse0ykl4
 rwdA==
X-Gm-Message-State: AOAM5315Tz75Hoodflio738pIUt5Kafe3TOwhmfC6Y34J/LzrYWKOqIC
 ndSEshlpGFSvfYJeO6J4f9vyxwaDBgcq99PVlJlYKv7Pv/Q=
X-Google-Smtp-Source: ABdhPJx6lZ71etdNvL3om3gG1H+ABaor8IdKN7EbPOe9Uld7J830690y1KAzBkXOU3RQgxtTSIBsZNV0uxb2ZnuOEn0=
X-Received: by 2002:aa7:d407:0:b0:425:f57e:7ae5 with SMTP id
 z7-20020aa7d407000000b00425f57e7ae5mr7803138edq.393.1650990780317; Tue, 26
 Apr 2022 09:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
In-Reply-To: <20220412212558.827289-1-olvaffe@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 26 Apr 2022 09:32:49 -0700
Message-ID: <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To: freedreno@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> In practice, trace_dma_fence_init called from dma_fence_init is good
> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
> and virtio both have cases where trace_dma_fence_init and
> trace_dma_fence_emit can be apart.  It is easier for visualization tools
> to always use the more correct trace_dma_fence_emit when visualizing
> fence timelines.
>
> v2: improve commit message (Dmitry)
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
This has been reviewed.  Should we land it?

(Or, how do I check if it has landed?)
