Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642E5EF9F2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4310E5F5;
	Thu, 29 Sep 2022 16:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002F10E5F5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 16:13:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so3769568ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
 b=U5nWZ+zCnE6ObM1a1HTcsz5fUlLj7t9tsv+E5+LhXtnz9e4+xVV3xDQOTnsLxYF47t
 2ZD30c3FM7IESBJDjIyKdNG1CIQ3oPQsfMBa45Rch5e+Fgg7012WK4guAP0mWiXKAOHg
 TK5WpXxFwsqpDoq6d1yO9pR9vCsxPFGrv9CUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
 b=6r5FMMhWt32FyFhAzlc9tmciZH7HPgHx7Sq854n8H9T/XusBcsWjs7EHOsIbJvsFpv
 1gYerqrRe85hhRG2vLiOHwdVVuQvesb66ft/X2uPRteB2u1Swc5J4ss8b3acanDxoLoD
 5sXQKIzywJfOcOWpFah7eLoxj/WoY5wS/sbMYpGG2pJnbPxxk4v0YwJhdrfXDc8mr+PD
 4QDoWH3dcU7otwBzJw1S++aw7xNeTGk7nZhxBQmnROJJt2VNfqMbWPCaDHhkOq76zHNZ
 TTP5CLlmGHd24rNzCVF2xUzQ39nvjcNSZ2TqZBQvrgNHNOShVV4uI6Jm7o1cC7VbGsxV
 pDFw==
X-Gm-Message-State: ACrzQf33KyLiRbYnuSZXncMoAzPca8M9hoNw0LVm03k2Ldt/f2WUuEdR
 0I3hTaWdnt0h19xUz3ihLb8hjCzg824KeoE/
X-Google-Smtp-Source: AMsMyM48/njRouGBZvixmoJ6daiLixemu3vcbaDv1OuCR3yp7iXuOK597Pvap4hQyPhwihsiDa2jlg==
X-Received: by 2002:a17:907:3f9f:b0:782:a14a:fdf9 with SMTP id
 hr31-20020a1709073f9f00b00782a14afdf9mr3333921ejc.49.1664468019117; 
 Thu, 29 Sep 2022 09:13:39 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 g5-20020a170906868500b0073c74bee6eesm4149323ejx.201.2022.09.29.09.13.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id x15so2459900wrv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
X-Received: by 2002:a05:6000:168c:b0:226:f4c2:d6db with SMTP id
 y12-20020a056000168c00b00226f4c2d6dbmr2895434wrd.659.1664468017868; Thu, 29
 Sep 2022 09:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Sep 2022 09:13:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Subject: Re: [v5] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Seperate ops for the sub block flush (Dmitry)
>
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
>  5 files changed, 50 insertions(+), 6 deletions(-)

Breadcrumbs: though this is tagged in the subject as v5 I think the
newest version is actually "resend v4" [1] which just fixes the
Signed-off-by.

[1] https://lore.kernel.org/r/1663825463-6715-1-git-send-email-quic_kalyant@quicinc.com
