Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1350BB81
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 17:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CD210E2E8;
	Fri, 22 Apr 2022 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DC610E2E8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 15:17:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g23so3811979edy.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bCYg7vAuheGkarssmttLzV2pY8DshumVmOA1bng63AI=;
 b=MEHquvyCw0wwPt7kCehis+PVhTx3pdKhV9pM8R14d3I84H9iWWWE6KzzCxSsYQhhsl
 c83Cbt0ZGqEK5noq0q1nj6TCqfNagjRO4ZvehG7CajbMG52gB3gjedYjBEbc1tmEBrbI
 A/ZhHFcuM+kMPol4W5p8CvCk05gkvpyT0o8xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bCYg7vAuheGkarssmttLzV2pY8DshumVmOA1bng63AI=;
 b=hnIMM6OXP3Az7+zJOQ0XVyHMr+Yj8lLPYIq+Aenb20tmEBHJVAaTdVC6GF9iuf0rcA
 4cdjW+B17yzHeCc9ETTANEdqyQPMF+7Wt529a3G2zjsHx/rSVPE/0KVZoN7z1zlhPo9K
 qEtOMOJWSIEdbsE1hsVK7XspKup+aVmtbVNe1FzJmJ14vtlCarKRLV5DhdCc9L/4YIBh
 lmfYc/W1tNoo52/F6uSKEmK2xOMmL0rGj/OFIE1j8NlP1JmcNTj3ckLBzd1qWw5eIYdc
 kaRSVk2mavp3Tvgv4NfjRaPCjUyMQwXCqSxHc5Db76lCtGKxoQaxQBEMFqhD0RzP8tqr
 FFew==
X-Gm-Message-State: AOAM533qG0S41NOOqTwNqrf8H1hHo4eQxH08pSoAhux2BMkvg7UdewF2
 j8KA5X3fe6vP4tiW5oK1X3Is8JfR0LhOTe7Edvo=
X-Google-Smtp-Source: ABdhPJyRZuzfbNB/kMDZOCCV3PJosaGz2OuLpEvWIgHuAbKLGtx0aAHQF9oSn85BXBDwfz5lquDGLw==
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr5375929eda.203.1650640626731; 
 Fri, 22 Apr 2022 08:17:06 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 t12-20020a056402020c00b00422e7556951sm981402edv.87.2022.04.22.08.17.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:17:06 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id r19so5292518wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:17:05 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr4569863wmb.199.1650640625481; Fri, 22
 Apr 2022 08:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647919631-14447-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647919631-14447-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 08:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xe1bOuiG0T7Y3rRN0cmsjdUK-sDvE-E02eDfSdKih9MA@mail.gmail.com>
Message-ID: <CAD=FV=Xe1bOuiG0T7Y3rRN0cmsjdUK-sDvE-E02eDfSdKih9MA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To: Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 21, 2022 at 8:27 PM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Set mdp clock to max clock rate during probe/bind sequence from the
> opp table so that rails are not at undetermined state. Since we do not
> know what will be the rate set in boot loader, it would be ideal to
> vote at max frequency. There could be a firmware display programmed
> in bootloader and we want to transition it to kernel without underflowing.
> The clock will be scaled down later when framework sends an update.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Just wanted to confirm that this patch will be queued up somewhat
soon. I think it's good to go but I don't see it in any trees yet. ;-)

FWIW, I can also say that I've tested this patch and it fixes the
underrun issues on sc7280-herobrine-rev1.

Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
