Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A705388A8
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 23:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767310E102;
	Mon, 30 May 2022 21:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A410E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 21:49:33 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id r84so11922439qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oXaOVjxu9BRXioIvJGUPeph15IZ7f+RIDq16BIHjmoA=;
 b=MXfdGkwALQnjWH6rK/1fSXDcuWOUo9C8ZG2sO9wNr+MKKvRiwjciQ+mEp7fq6ZKKqa
 JiGwltb6kFwr13ASse+qgNwZCbfGcmKHJxoZLefcqsu1qhJfmzrT1+t8yJM+/YPxJx1M
 kXIQUt3oIqyISHEgwiqR1EqnwC3doPe+j9SbWXoAY3vW7WOYYGQhvNJ3FSrlS9jkb/5+
 XGOKTUgJnkooU8bIUvkgV0Zibj2hN4HTtvYI4YTKbQKaRDEEPGsM8LqZWUzpVTR8WBOz
 sMEvIlx182Rg3pXShcGXIvjgCMGFOqWUkCtm2qDhMz6tOKceqZEPvRXb6fxxhjEI4q0E
 N0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oXaOVjxu9BRXioIvJGUPeph15IZ7f+RIDq16BIHjmoA=;
 b=s6q3KdlT4TCduD995A96s7Fq3iSGx1XodBIRln3DipzUUtN7J8XyFm+i29C2Zb47Tx
 XFPMCKKRA98gJZl9ZnLc/mn0eu+BDLhDyM7LYxhXj6/wkS0g6OSvyOv+vbPAZHAB+CWF
 XURgvMgbFMXr/+nCfujVJS+affZvf9GFc32X7XIGUNlkn4SU7WR5DP/d4MTzHz8aVFES
 RxTawSM4luY7FYHm3Ym9jxKatIH2uOojGIUIapyWoLS0FQh68kms/z8AOgX03DH9d/vA
 tNcjXB0tJAOS/MWvyQlXOV+hWv68QGYv/4mD3l6DpcbXF+cHUKNeQgIa1KBm0v3JzI1K
 qiDw==
X-Gm-Message-State: AOAM531axJN6eSxzxZoFPAN9TueQXsBQ5LkGcxXcz4TE99fqD2mQzGTt
 apGg/a/+VBWpci7Rddu2pH+H8upescvBmgw7iL9HKw==
X-Google-Smtp-Source: ABdhPJzh9WsdzR5//egtXV1XikapFrTINZPmX4fFRgsjAj4mQhfoLHQ1FXuKd2ZeCPj/PcYntJhO1dwhQVQuvS6qnJQ=
X-Received: by 2002:a05:620a:414e:b0:6a5:8dec:57bb with SMTP id
 k14-20020a05620a414e00b006a58dec57bbmr21169409qko.30.1653947372228; Mon, 30
 May 2022 14:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 May 2022 00:49:21 +0300
Message-ID: <CAA8EJpoA2VOO28tzT24fzYseFg__thXHcuXHiXGX-pwxGNz8HQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A nit: patchwork thinks that two patches from the same author with the
same subject are two versions of the same patch. In future, could you
please send such patches with distinct names? No need to send v2 now
unless review shows other issues with the patches.

On Mon, 30 May 2022 at 10:33, Haowen Bai <baihaowen@meizu.com> wrote:
>
> The ctx->hw is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
