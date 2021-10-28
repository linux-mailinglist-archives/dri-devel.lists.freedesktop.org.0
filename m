Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2743DB09
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2F089BFD;
	Thu, 28 Oct 2021 06:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8905B89BFD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:20:33 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 w23-20020a4a9d17000000b002bb72fd39f3so213445ooj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
 b=XFMvMVNKWo0K9tklL2H+PQ5pnRbAvZXkJu6OVqgEKFrzqKb/qBrXK4jeGJCuIl/2Rs
 ycXF/pYyFD7R3khkDEkpZo6R+ipPDYlxcQEIcRaMUSb/DuplmshZSHY9vfO4n/HZ8/Ir
 lxD4yIUK5obFrRuQqv5qF5INpaolMTU/WPINM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
 b=eyx9SIFNUuwFxx84nADg5FxgMbFy0Vc3+rAD0dSnxz0EeqJ2AHWTS1IvhcrKg/JcJq
 UuCg1AtCdZzbDu3HCwrVi+xcMdo1lCIqXwUEOk5pYF3gudflA1861AulBM2+T7gzulJB
 pPbqK5Tpq3qkY/lpfq33TQJkNrBQBdCvo7FSrhrV7CTRDRtQR8t6i9aOq0yx2DCCqaYH
 A3QbiVGEk1oomyr4PbdAPqWccn//mGxMBg/wCfQ1AVoQKewI6qvmLln/6VTn7lucgVPY
 25sd3R/PwBvYOP93dinI8/XLJyxjEFS4pOsnCt6KsYi3KUMvLNFiKRGBVBGZRBe/k3FL
 fT8g==
X-Gm-Message-State: AOAM530haQ6nslleVtC1Fijq1GLi48BWCyLUugGqj1e21y59JHFAsOIu
 jdQwGGlqamgI9fHvXwGt2p17nfmS4Mo0Ccq9Yj51Aw==
X-Google-Smtp-Source: ABdhPJyea8Fwx4YyKse423qLTPTFc+z3zOfjtneOqoZsNUJoAqTszW1lfetTqMDV080TNLNVBZYOcvECNsZXED/wHU4=
X-Received: by 2002:a4a:e94e:: with SMTP id v14mr1125894ood.1.1635402032695;
 Wed, 27 Oct 2021 23:20:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:20:32 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:20:32 -0700
Message-ID: <CAE-0n51J60efae0yMvC_ZfxX53YZLOgY_K1cpA8PLPedr6hMBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: msm/dp: Add DP compatible strings for
 sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, 
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org, dianders@chromium.org, 
 khsieh@codeaurora.org, mkrishn@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-10-27 18:54:43)
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports one eDP controller
> and a DP controller. This change will add the compatible
> string for both eDP and DP to msm dp-controller binding.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> changes in v3:
>     - Modify the subject (Doug Anderson)
>     - Add sc7280-dp also to the list (Stephen Boyd)
>
> changes in v2:
>     - Sort alphabetically (Stephen Boyd)
>     - Cleanup residual stale changes in the patch (Matthias Kaehlcke)
>     - Modify the subject (Doug Anderson)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
